import { SharedConfig } from "../../../../../shared/shared-config";
import { Vector3Mp } from "../../../../../shared/vector3";

import * as sdk from "../../server";

interface CompostInterface
{
    compostStrid: string;
    pos: Vector3Mp;
    rot: Vector3Mp;
}

const CompostConfig: CompostInterface[] = [
    {
        compostStrid: 'compost-1',
        pos: new Vector3Mp(2002.8, 4819.321, 2.45),
        rot: new Vector3Mp(0, 0, 90)
    },
    {
        compostStrid: 'compost-2',
        pos: new Vector3Mp(2005.07, 4826.972, 2.45),
        rot: new Vector3Mp(0, 0, 2)
    }
]

class CompostManager
{
    static FarmComposters = new Map<number, Map<string, Compost>>();

    static loadFarmComposters(farmId: number)
    {
        /** Create the empty Map */
        this.FarmComposters.set(farmId, new Map());

        /** Loading the composters inside the Map. */
        CompostConfig.forEach(a =>
        {
            this.FarmComposters.get(farmId).set(a.compostStrid, new Compost(farmId, a.compostStrid, a.pos, a.rot));
        });
    }
    static getFarmComposters(farmId: number)
    {
        return this.FarmComposters.get(farmId);
    }
    static getComposter(farmId: number, compostStrid: string)
    {
        try
        {
            return this.FarmComposters.get(farmId).get(compostStrid);
        }
        catch {
            return;
        }
    }
}

class Compost
{
    /** Private(s) */
    private _shitAmount: number = 0;
    private _serverStartup: boolean = true;

    /** Public */
    public object: sdk.objects.AquiverObject;

    constructor(
        public farmId: number,
        public compostStrid: string,
        public position: Vector3Mp,
        public rotation: Vector3Mp
    )
    {
        this.object = sdk.objects.create({
            dimension: this.farmId,
            model: 'avp_farm_composter',
            position: this.position,
            rotation: this.rotation,
            freezed: true,
            variables: {
                shitAmount: this.shitAmount
            }
        });

        this.object.interactionPress = (Player) =>
        {
            if (Player.hasAttachment('shovelWithShit'))
            {
                let newAmount = this.shitAmount + sdk.methods.ChanceSdk.integer(
                    {
                        min: SharedConfig.Composter.plusCompostAmount.min,
                        max: SharedConfig.Composter.plusCompostAmount.max
                    }
                );
                /** cap it to the maximum, do not overflow. */
                if (newAmount > SharedConfig.Composter.maximumWeight) newAmount = SharedConfig.Composter.maximumWeight;

                this.shitAmount = newAmount;

                Player.removeAttachment('shovelWithShit');
                Player.addAttachment('shovel');
            }
            else if (!Player.hasAnyAttachment())
            {
                Player.OpenClickMenu({
                    header: 'Composter',
                    buttons: [
                        {
                            event: 'sell-compost',
                            eventArgs: this.compostStrid,
                            icon: 'fa-solid fa-sack-dollar',
                            name: 'Sell',
                            closeAfterClick: true,
                        }
                    ],
                });
            }
        }

        sdk.ServerDatabase.CompostsRepository.exist({
            compostStrid: this.compostStrid,
            farmId: this.farmId
        }).then(exist =>
        {

            if (!exist)
            {
                sdk.ServerDatabase.CompostsRepository.insert({
                    compostStrid: this.compostStrid,
                    farmId: this.farmId,
                    shitAmount: 0
                });
            }
            else
            {
                sdk.ServerDatabase.CompostsRepository.find({
                    where: {
                        compostStrid: this.compostStrid,
                        farmId: this.farmId
                    },
                    find: ['shitAmount']
                }).then(rows =>
                {
                    if (rows && rows[0])
                    {
                        this.shitAmount = rows[0].shitAmount;
                    }
                });
            }

        });
    }
    get shitAmount()
    {
        return this._shitAmount;
    }
    set shitAmount(a: number)
    {
        this._shitAmount = a;

        /** Update object variable(s) */
        if (sdk.objects.exist(this.object))
        {
            this.object.variables.shitAmount = this.shitAmount;
        }

        /** Do not flood mysql when server start, just load the variable. */
        if (!this._serverStartup)
        {
            /** Update database instant */
            sdk.ServerDatabase.CompostsRepository.update({
                where: {
                    compostStrid: this.compostStrid,
                    farmId: this.farmId
                },
                set: {
                    shitAmount: this.shitAmount
                }
            });
        }
        else {
            this._serverStartup = false;
        }
    }
}

onNet('sell-compost', (compostStrid: string) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;

    const Composter = sdk.composters.getComposter(Player.dimension, compostStrid);

    if (Composter.shitAmount < 1) return Player.Notification('Composter is empty!');

    const priceCalculation = SharedConfig.Composter.pricePerWeight * Composter.shitAmount;
    if (typeof priceCalculation === 'number' && priceCalculation > 0)
    {
        Player.bank += priceCalculation;
        Player.Notification(`You sold the contain of the composter for $${priceCalculation}!`);

        Composter.shitAmount = 0;
    }
});

export const {
    FarmComposters,
    getComposter,
    getFarmComposters,
    loadFarmComposters
} = CompostManager;