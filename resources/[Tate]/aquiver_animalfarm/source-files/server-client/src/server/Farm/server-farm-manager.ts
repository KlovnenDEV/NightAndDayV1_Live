import { FarmDatabaseInterface, ModalDataButtonTriggerInterface } from '../../../../shared/shared-types';
import { AnimalFarm } from './server-farm-class';

import * as sdk from "../server";
import { TSL } from '../../../../shared/shared-translations';

onNet('farm-enter', (id:number) => {
    const Player = sdk.players.at(global.source);
    if (!Player) return;
    const Farm = sdk.farms.at(id);
    Farm && Farm.Enter(Player);
});
onNet('farm-exit', (id: number) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;
    const Farm = sdk.farms.at(id);
    Farm && Farm.Exit(Player);
});
onNet('farm-lock', (id: number) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;
    const Farm = sdk.farms.at(id);
    Farm && Farm.LockFarm(Player);
});
onNet('farm-open-buymenu', (id: number) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;
    const Farm = sdk.farms.at(id);
    Farm && Farm.OpenBuyMenu(Player);
});

onNet('farm-buy-prompt', (id: number) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;

    Player.OpenModalMenu({
        icon: 'fa-solid fa-exclamation-circle',
        question: TSL.list.buy_farm_question,
        buttons: [
            {
                name: TSL.list.button_yes,
                event: 'farm-buy-accept',
                args: id,
            },
            {
                name: TSL.list.button_cancel,
                event: '',
                args: '',
            },
        ],
        inputs: [],
    });
});

onNet('farm-buy-accept', (data: ModalDataButtonTriggerInterface) =>
{
    const id = data.args;
    const Farm = sdk.farms.at(id);
    Farm && Farm.Buy(global.source);
});
onNet('farm-rename-prompt', (id: number) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;

    Player.OpenModalMenu({
        icon: 'fa-solid fa-question-circle',
        question: TSL.list.rename_farm_question,
        buttons: [
            {
                name: TSL.list.button_rename,
                event: 'farm-rename-accept',
                args: id,
            },
            {
                name: TSL.list.button_cancel,
                event: '',
                args: '',
            },
        ],
        inputs: [
            {
                id: 'name_input',
                placeholder: TSL.list.placeholder_rename,
            },
        ],
    });
});
onNet('farm-rename-accept', (data: ModalDataButtonTriggerInterface) =>
{
    const Player = sdk.players.at(global.source);
    if(!Player) return;

    const id = data.args;
    const filteredInput = data.inputs.find((a) => a.id == 'name_input');

    const Farm = sdk.farms.at(id);
    if (Farm && Farm.isOwner(Player))
    {
        Farm.name = filteredInput.value;
    }
});

onNet('farm-sell-prompt', (id: number) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;

    Player.OpenModalMenu({
        icon: 'fa-solid fa-exclamation-circle',
        question: TSL.list.sell_farm_question,
        buttons: [
            {
                name: TSL.list.button_sell,
                event: 'farm-sell-accept',
                args: id,
            },
            {
                name: TSL.list.button_cancel,
                event: '',
                args: '',
            },
        ],
        inputs: [
            {
                id: 'source_input',
                placeholder: TSL.list.placeholder_targetId,
            },
            {
                id: 'price_input',
                placeholder: TSL.list.placeholder_price,
            },
        ],
    });
});

onNet('farm-sell-accept', (data: ModalDataButtonTriggerInterface) =>
{
    const Player = sdk.players.at(global.source);
    if(!Player) return;

    const id = data.args;
    const targetSource = data.inputs.find((a) => a.id == 'source_input').value;
    const price = data.inputs.find((a) => a.id == 'price_input').value;

    const Farm = sdk.farms.at(id);
    if (Farm && Farm.isOwner(Player))
    {
        const Target = sdk.players.at(targetSource);
        if (!Target) return Player.Notification(TSL.list.target_not_exist);
        if (Player.identifier == Target.identifier) return;
        if (sdk.methods.dist(Player.position, Target.position) > 5) return Player.Notification(TSL.list.target_is_far);
        if (Target.bank < parseInt(price)) return Player.Notification(TSL.list.target_not_enough_bank);

        Target.serverVariables.sellOfferedByIdentifier = Player.identifier;
        Target.serverVariables.sellOfferPrice = parseInt(price);
        Target.serverVariables.sellOfferFarmId = parseInt(id);

        Target.OpenModalMenu({
            icon: 'fa-solid fa-question-circle',
            question: TSL.format(TSL.list.sell_farm_prompt_question, [Player.name, price]),
            inputs: [],
            buttons: [
                {
                    name: TSL.list.button_yes,
                    event: 'farm-sell-offer-accept',
                    args: '',
                },
                {
                    name: TSL.list.button_cancel,
                    event: '',
                    args: '',
                },
            ],
        });

        if (Target.serverVariables.sellTimeouter)
        {
            clearTimeout(Target.serverVariables.sellTimeouter);
            Target.serverVariables.sellTimeouter = null;
        }

        Target.serverVariables.sellTimeouter = setTimeout(() =>
        {
            clearTimeout(Target.serverVariables.sellTimeouter);
            Target.serverVariables.sellTimeouter = null;

            /** Reset to null */
            Target.serverVariables.sellOfferedByIdentifier = null;
            Target.serverVariables.sellOfferPrice = null;
            Target.serverVariables.sellOfferFarmId = null;
        }, 15000);
    }
});
onNet('farm-sell-offer-accept', () =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;

    const Farm = sdk.farms.at(Player.serverVariables.sellOfferFarmId);
    if (!Farm) return;

    const OfferedByPlayer = sdk.players.getPlayerWithIdentifier(Player.serverVariables.sellOfferedByIdentifier);
    if (!OfferedByPlayer || Farm.ownerIdentifier !== OfferedByPlayer.identifier) return;

    if (Player.bank < Player.serverVariables.sellOfferPrice) return Player.Notification(TSL.list.not_enough_bank);

    Farm.ownerIdentifier = Player.identifier;
    Farm.ownerName = Player.name;
    Player.bank -= Player.serverVariables.sellOfferPrice;

    OfferedByPlayer.Notification(TSL.format(TSL.list.farm_sold, [Player.serverVariables.sellOfferPrice]));
    Player.Notification(TSL.format(TSL.list.farm_bought, [Player.serverVariables.sellOfferPrice]));
});

class FarmsManager
{
    static ServerFarms = new Map<number, AnimalFarm>();

    // static async delete(farmId: number) {
        // return new Promise(resolve => {
        //     let Farm = this.ServerFarms.get(farmId);
        //     if(!Farm) return;

        //     if(this.exist(farmId)) {
        //         this.ServerFarms.delete(farmId);
        //     }

        //     sdk.ServerDatabase.FarmRepository.delete({
        //         where: {
        //             farmId: farmId
        //         },
        //         limit: 1
        //     });
        // });
    // }
    static async insert(d: FarmDatabaseInterface) {
        return new Promise(resolve => {
            sdk.ServerDatabase.FarmRepository.insert(d).then(res => {
                if (!res) return;
                const insertId = res.insertId;
                if(typeof insertId !== 'number') return;
            
                sdk.ServerDatabase.FarmRepository.find({
                    where: {
                        farmId: insertId
                    }
                }).then(a => {
                    if(a && a[0]) {
                        const data = a[0];
    
                        this.ServerFarms.set(data.farmId, new AnimalFarm(data));
    
                        sdk.composters.loadFarmComposters(data.farmId);
                        sdk.paddocks.loadFarmPaddocks(data.farmId);
                        sdk.loots.loadFarmLoots(data.farmId);
                        resolve(true);
                    }
                });
            });
        });
    }
    static async loadAll()
    {
        const rows = await sdk.ServerDatabase.FarmRepository.all();
        rows.forEach(a =>
        {
            this.ServerFarms.set(a.farmId, new AnimalFarm(a));

            /** Loading composters... */
            sdk.composters.loadFarmComposters(a.farmId);

            /** Loading the paddocks... */
            sdk.paddocks.loadFarmPaddocks(a.farmId);

            /** Loading the loots... */
            sdk.loots.loadFarmLoots(a.farmId);
        });

        /** Start the interval tickers. */
        sdk.tickers.start();
    }
    static at(x: number | AnimalFarm)
    {
        if (typeof x === 'number')
        {
            return this.ServerFarms.get(x);
        }
        else if (x instanceof AnimalFarm)
        {
            for (let v of this.ServerFarms.values())
            {
                if (v == x) return v;
            }
        }
    }
    static exist(x: number | AnimalFarm)
    {
        if (typeof x === 'number')
        {
            return this.ServerFarms.has(x);
        }
        else if (x instanceof AnimalFarm)
        {
            for (let v of this.ServerFarms.values())
            {
                if (v == x) return true;
            }
        }
    }
    static playerJoining(source: string | number)
    {
        this.ServerFarms.forEach(a =>
        {
            TriggerClientEvent(global.exports[GetCurrentResourceName()].obfuscate_event_load(), source, a.data);
        });
    }
}

export const { ServerFarms, at, exist, loadAll, playerJoining, insert } = FarmsManager;