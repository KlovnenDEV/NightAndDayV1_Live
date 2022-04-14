import { SharedConfig } from '../../../../shared/shared-config';
import { TSL } from '../../../../shared/shared-translations';
import { BuyDataInterface, FarmDatabaseInterface } from '../../../../shared/shared-types';
import { Vector3Mp } from '../../../../shared/vector3';

import * as sdk from "../server";

export class AnimalFarm
{
    constructor(
        public data: FarmDatabaseInterface
    )
    {

        sdk.players.TriggerAllClient('farm-load', this.data);

        new sdk.tools.Shovel(
            this.farmId,
            new Vector3Mp(2007.228, 4828.45, 2.443),
            new Vector3Mp(5.0, 0.0, 90.0)
        )

        new sdk.tools.BucketOnGround(
            this.farmId,
            new Vector3Mp(2010.526, 4828.832, 2.45),
            new Vector3Mp(0, 0, 90)
        );

        new sdk.tools.WaterTip(
            this.farmId,
            new Vector3Mp(2013.11865, 4830.056, 2.487777),
            new Vector3Mp(0, 0, 180),
            new Vector3Mp(2012.92664, 4830.04639, 2.5),
            new Vector3Mp(0, 0, 0)
        );

        new sdk.tools.Foodbag(
            this.farmId,
            new Vector3Mp(2006.85034, 4831.934, 2.26813226),
            new Vector3Mp(-10, 0, 5)
        );

        new sdk.tools.MilkBarrel(
            this.farmId,
            new Vector3Mp(1998.537, 4819.657, 2.48),
            new Vector3Mp(0, 0, 20)
        );

        new sdk.tools.Laptop(
            this.farmId,
            new Vector3Mp(2009.441, 4831.694, 3.296),
            new Vector3Mp(0, 0, 0)
        )
    }
    isOwner(Player: sdk.players.AquiverPlayer)
    {
        return Player.identifier == this.ownerIdentifier;
    }
    isOwned()
    {
        return this.ownerIdentifier ? true : false;
    }
    get farmId()
    {
        return this.data.farmId;
    }
    get ownerIdentifier()
    {
        return this.data.ownerIdentifier;
    }
    set ownerIdentifier(identifier: string)
    {
        this.data.ownerIdentifier = identifier;

        sdk.ServerDatabase.FarmRepository.update({
            where: {
                farmId: this.farmId
            },
            set: {
                ownerIdentifier: this.ownerIdentifier
            }
        });

        sdk.players.TriggerAllClient('farm-update-data', this.farmId, 'ownerIdentifier', identifier);
    }
    get ownerName()
    {
        return this.data.ownerName;
    }
    set ownerName(str: string)
    {
        this.data.ownerName = str;

        sdk.ServerDatabase.FarmRepository.update({
            where: {
                farmId: this.farmId
            },
            set: {
                ownerName: this.ownerName
            }
        });

        sdk.players.TriggerAllClient('farm-update-data', this.farmId, 'ownerName', str);
    }
    get img()
    {
        return this.data.img;
    }
    set img(url: string)
    {
        this.data.img = url;

        sdk.ServerDatabase.FarmRepository.update({
            where: {
                farmId: this.farmId
            },
            set: {
                img: this.img
            }
        });

        sdk.players.TriggerAllClient('farm-update-data', this.farmId, 'img', url);
    }
    get name()
    {
        return this.data.name;
    }
    set name(str: string)
    {
        this.data.name = str;

        sdk.ServerDatabase.FarmRepository.update({
            where: {
                farmId: this.farmId
            },
            set: {
                name: this.name
            }
        });

        sdk.players.TriggerAllClient('farm-update-data', this.farmId, 'name', str);
    }
    get price()
    {
        return this.data.price;
    }
    set price(amount: number)
    {
        amount = Math.floor(amount);
        if(amount < 1) amount = 1;

        this.data.price = amount;

        sdk.ServerDatabase.FarmRepository.update({
            where: {
                farmId: this.farmId
            },
            set: {
                price: this.price
            }
        });

        sdk.players.TriggerAllClient('farm-update-data', this.farmId, 'price', amount);
    }
    get locked()
    {
        return this.data.locked;
    }
    set locked(state: boolean)
    {
        this.data.locked = state;

        sdk.ServerDatabase.FarmRepository.update({
            where: {
                farmId: this.farmId
            },
            set: {
                locked: this.locked
            }
        });

        sdk.players.TriggerAllClient('farm-update-data', this.farmId, 'locked', state);
    }
    get position()
    {
        return new Vector3Mp(this.data.x, this.data.y, this.data.z);
    }
    set position(v3: Vector3Mp)
    {
        this.data.x = v3.x;
        this.data.y = v3.y;
        this.data.z = v3.z;

        sdk.ServerDatabase.FarmRepository.update({
            where: {
                farmId: this.farmId
            },
            set: {
                x: this.position.x,
                y: this.position.y,
                z: this.position.z
            }
        });

        sdk.players.TriggerAllClient('farm-update-data', this.farmId, 'position', v3);
    }
    Enter(Player: sdk.players.AquiverPlayer)
    {
        if (this.locked) return Player.Notification(TSL.list.farm_closed);

        Player.keysDisabled = "all";
        Player.fadeOutScreen(1000).finally(() =>
        {
            if (Player)
            {
                Player.keysDisabled = null;
                Player.position = SharedConfig.AnimalFarm.InteriorPosition;
                Player.dimension = this.farmId;
                Player.TriggerClient('EnteredAnimalFarm');

                setTimeout(() =>
                {
                    if (Player) Player.fadeInScreen(1000);
                }, 500);
            }
        });
    }
    Exit(Player: sdk.players.AquiverPlayer)
    {
        if (this.locked) return Player.Notification(TSL.list.farm_closed);

        Player.keysDisabled = "all";
        Player.fadeOutScreen(1000).finally(() =>
        {
            if (Player)
            {
                Player.keysDisabled = null;
                Player.position = this.position;
                Player.dimension = SharedConfig.DimensionManager.DefaultDimension;
                Player.TriggerClient('ExitAnimalFarm');

                setTimeout(() =>
                {
                    if (Player) Player.fadeInScreen(1000);
                }, 500);
            }
        });
    }
    LockFarm(Player: sdk.players.AquiverPlayer)
    {
        if (Player.identifier !== this.ownerIdentifier) return Player.Notification(TSL.list.no_key);

        this.locked = !this.locked;
        Player.Notification(this.locked ? TSL.list.farm_locked : TSL.list.farm_unlocked);
    }
    OpenBuyMenu(Player: sdk.players.AquiverPlayer)
    {
        let buydata: BuyDataInterface = {
            image: this.img,
            buttons: [],
            texts: [],
        };

        buydata.texts.push({
            header: TSL.list.farm_main_name,
            entries: [
                {
                    question: TSL.list.name,
                    answer: `${this.name} (#${this.farmId})`,
                },
                {
                    question: TSL.list.owner,
                    answer: this.isOwned() ? this.ownerName : TSL.list.no_one,
                },
            ],
        });

        /** Show price if the farm is not sold. */
        if (this.isOwned() == false)
        {
            buydata.texts[buydata.texts.length - 1].entries.push({
                question: TSL.list.price,
                answer: '$' + this.price,
            });
        }

        buydata.texts[buydata.texts.length - 1].entries.push({
            question: TSL.list.locked,
            answer: this.locked ? TSL.list.yes : TSL.list.no,
        });

        if (this.isOwned() == false)
        {
            buydata.buttons.push({
                header: TSL.list.actions,
                entries: [],
            });

            buydata.buttons[buydata.buttons.length - 1].entries.push({
                name: TSL.list.buy,
                event: 'farm-buy-prompt',
                args: this.farmId,
            });
        }

        if (this.isOwner(Player))
        {
            buydata.buttons.push({
                header: TSL.list.actions,
                entries: [],
            });

            buydata.buttons[buydata.buttons.length - 1].entries.push({
                name: TSL.list.rename,
                event: 'farm-rename-prompt',
                args: this.farmId,
            });
            buydata.buttons[buydata.buttons.length - 1].entries.push({
                name: TSL.list.sell,
                event: 'farm-sell-prompt',
                args: this.farmId,
            });
        }

        Player.TriggerChromium({
            event: 'farm-buypanel-data',
            data: {
                buydata
            }
        });
        Player.TriggerChromium({
            event: 'farm-buypanel-state',
            data: {
                state: true,
            }
        });
    }
    Buy(source: string | number)
    {
        const Player = sdk.players.at(source);
        if (!Player) return;

        const FarmsAmount = new Map([...sdk.farms.ServerFarms].filter(([k, v]) => v.ownerIdentifier == Player.identifier));
        if (FarmsAmount.size >= SharedConfig.AnimalFarm.MaximumOwnable) return Player.Notification(TSL.list.farm_limit_buy);
        if (this.isOwned()) return Player.Notification(TSL.list.farm_not_for_sale);
        if (Player.bank < this.price) return Player.Notification(TSL.list.not_enough_bank);

        this.ownerName = Player.name;
        this.ownerIdentifier = Player.identifier;
        Player.bank -= this.price;
        Player.Notification(TSL.format(TSL.list.farm_system_bought, [this.name, this.price]));
    }
}
