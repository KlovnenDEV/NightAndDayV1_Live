import { SharedConfig } from "../../../../shared/shared-config";
import { TSL } from "../../../../shared/shared-translations";
import { AnimalMenuInfos } from "../../../../shared/shared-types";
import { Vector3Mp } from "../../../../shared/vector3";
import { AnimalDatabaseInterface } from "../Database/models/model-animal";

import * as sdk from "../server";

export class Animal
{
    /** Public */
    public Ped: sdk.peds.AquiverPed;

    constructor(
        private _data: AnimalDatabaseInterface,
        position: Vector3Mp,
        heading: number,
        public actionPos: Vector3Mp,
        public actionHeading: number
    )
    {
        const animalDataConfig = SharedConfig.Animals[this.animalType];
        if (animalDataConfig)
        {
            this.Ped = sdk.peds.create({
                dead: this.animalDead,
                dimension: this.farmId,
                heading: heading,
                model: animalDataConfig.MODEL,
                position: position,
                variables: {
                    age: this.age,
                    hunger: this.hunger,
                    thirst: this.thirst,
                    health: this.health
                }
            });

            /** Assign the open function, when key is pressed. */
            this.Ped.interactionPress = (Player) =>
            {
                this.OpenAnimalMenu(Player);
            }
        }
        else
        {
            console.error('Create Animal class failed. animalDataConfig is undefined.');
        }
    }
    /** Mysql paddock strid */
    private get paddockStrid()
    {
        return this._data.paddockStrid;
    }
    /** Mysql farm id */
    private get farmId()
    {
        return this._data.farmId;
    }
    /** Mysql animal ID */
    get aid()
    {
        return this._data.aid;
    }
    get animalType()
    {
        return this._data.animalType;
    }
    get animalDead()
    {
        return this.age < 0.01;
    }
    get hunger()
    {
        return this._data.hunger;
    }
    set hunger(amount: number)
    {
        amount = Math.floor(amount);
        if (amount < 1) amount = 0;
        else if (amount > 100) amount = 100;

        this._data.hunger = amount;

        sdk.ServerDatabase.AnimalRepository.update({
            where: {
                aid: this.aid,
                farmId: this.farmId,
                paddockStrid: this.paddockStrid
            },
            set: {
                hunger: this.hunger
            }
        });
    }
    get extra()
    {
        return this._data.extra;
    }
    set extra(amount: number)
    {
        this._data.extra = amount;

        sdk.ServerDatabase.AnimalRepository.update({
            where: {
                aid: this.aid,
                farmId: this.farmId,
                paddockStrid: this.paddockStrid
            },
            set: {
                extra: this.extra
            }
        });
    }
    get thirst()
    {
        return this._data.thirst;
    }
    set thirst(amount: number)
    {
        amount = Math.floor(amount);
        if (amount < 1) amount = 0;
        else if (amount > 100) amount = 100;

        this._data.thirst = amount;

        sdk.ServerDatabase.AnimalRepository.update({
            where: {
                aid: this.aid,
                farmId: this.farmId,
                paddockStrid: this.paddockStrid
            },
            set: {
                thirst: this.thirst
            }
        });
    }
    get age()
    {
        return this._data.age;
    }
    set age(amount: number)
    {
        this._data.age = amount;

        /** Format age to 2 decimal(s). */
        this._data.age = parseFloat((this._data.age).toFixed(2));

        /** Set ped to dead. */
        if (this.animalDead && !this.Ped.dead)
        {
            this.Ped.dead = true;
        }

        sdk.ServerDatabase.AnimalRepository.update({
            where: {
                aid: this.aid,
                farmId: this.farmId,
                paddockStrid: this.paddockStrid
            },
            set: {
                age: this.age
            }
        });
    }
    /** Get milk. Should only exist on COW. */
    get milk()
    {
        return this._data.milk;
    }
    /** Set milk. Should only exist on COW. */
    set milk(amount: number)
    {
        amount = Math.floor(amount);
        if (amount < 1) amount = 0;
        else if (amount > 100) amount = 100;

        this._data.milk = amount;

        sdk.ServerDatabase.AnimalRepository.update({
            where: {
                aid: this.aid,
                farmId: this.farmId,
                paddockStrid: this.paddockStrid
            },
            set: {
                milk: this.milk
            }
        })
    }
    /** Get weight. Should only exist on PIG. */
    get weight()
    {
        return this._data.weight;
    }
    /** Set weight. Should only exist on PIG. */
    set weight(amount: number)
    {
        amount = Math.floor(amount);
        if (amount < 1) amount = 0;
        else if (amount > 100) amount = 100;

        this._data.weight = amount;

        sdk.ServerDatabase.AnimalRepository.update({
            where: {
                aid: this.aid,
                farmId: this.farmId,
                paddockStrid: this.paddockStrid
            },
            set: {
                weight: this.weight
            }
        })
    }
    get health()
    {
        return this._data.health;
    }
    set health(amount: number)
    {
        this._data.health = Math.floor(amount);

        sdk.ServerDatabase.AnimalRepository.update({
            where: {
                aid: this.aid,
                farmId: this.farmId,
                paddockStrid: this.paddockStrid
            },
            set: {
                health: this.health
            }
        })
    }
    OpenAnimalMenu(Player: sdk.players.AquiverPlayer)
    {
        let d: Partial<AnimalMenuInfos> = {
            bars: [
                { img: 'water.svg', name: TSL.list.thirst, percentage: this.thirst, color: 'lightblue' },
                { img: 'hunger.svg', name: TSL.list.hunger, percentage: this.hunger, color: 'lightgreen' },
                { img: 'health.svg', name: TSL.list.health, percentage: this.health, color: 'red' },
                { img: 'age.svg', name: TSL.list.age, percentage: this.age, color: 'pink' }
            ],
            buttons: []
        }

        const animalDataConfig = SharedConfig.Animals[this.animalType];
        if (!animalDataConfig)
            return Player.Notification('Something went wrong.. OpenAnimalMenu - animalDataConfig is undefined.');

        d.animalImg = animalDataConfig.IMG;
        d.animalName = animalDataConfig.NAME;

        d.buttons.push({
            event: 'sell-animal',
            eventArgs: {
                paddockStrid: this.paddockStrid,
                aid: this.aid
            },
            img: 'sell.svg',
            name: TSL.list.sell,
            closeAfterClick: true
        });

        switch (this.animalType)
        {
            case "COW": {
                d.bars.push({
                    img: 'milk.svg',
                    name: TSL.list.milk,
                    percentage: this.milk,
                    color: 'white'
                });
                d.buttons.push({
                    event: 'gather-cow',
                    eventArgs: {
                        paddockStrid: this.paddockStrid,
                        aid: this.aid
                    },
                    img: 'gather.svg',
                    name: TSL.list.gather,
                    closeAfterClick: true
                });
                break;
            }
            case "PIG": {
                d.bars.push({
                    img: 'weight.svg',
                    name: TSL.list.weight,
                    percentage: this.weight,
                    color: '#571818'
                });
                d.buttons.push({
                    event: 'gather-pig',
                    eventArgs: {
                        paddockStrid: this.paddockStrid,
                        aid: this.aid
                    },
                    img: 'gather.svg',
                    name: TSL.list.gather,
                    closeAfterClick: true
                });
                break;
            }
        }

        Player.TriggerChromium({
            event: 'set-animal-menu-data',
            data: d
        });

        Player.TriggerChromium({
            event: 'animal-menu-opened-state',
            data: true
        });
    }
    destroy()
    {
        const Paddock = sdk.paddocks.getPaddock(this.farmId, this.paddockStrid);
        if (!Paddock) return;

        const idx = Paddock.Animals.findIndex(a => a.aid == this.aid);
        if (idx >= 0)
        {
            Paddock.Animals.splice(idx, 1);

            if (sdk.peds.exist(this.Ped))
            {
                this.Ped.destroy();
            }

            sdk.ServerDatabase.AnimalRepository.delete({
                where: {
                    aid: this.aid,
                    farmId: this.farmId,
                    paddockStrid: this.paddockStrid
                },
                limit: 1
            })
        }
    }
}

onNet('sell-animal-accept', (data: { args: { paddockStrid: string, aid: number } }) =>
{
    if (!data || !data.args) return;
    const { aid, paddockStrid } = data.args;

    const Player = sdk.players.at(global.source);
    if (!Player) return;

    if (!Player.isPlayerInOwnedFarm())
        return Player.Notification(TSL.list.farm_player_not_owner);

    const Paddock = sdk.paddocks.getPaddock(Player.dimension, paddockStrid);
    if (!Paddock) return;

    const Animal = Paddock.Animals.find(a => a.aid == aid);
    if (Animal)
    {
        const animalDataConfig = SharedConfig.Animals[Animal.animalType];
        if (!animalDataConfig || animalDataConfig.SELL_PRICE < 1) return;

        Player.Notification(TSL.format(TSL.list.animal_sold, [animalDataConfig.SELL_PRICE]));
        Player.bank += animalDataConfig.SELL_PRICE;
        Animal.destroy();
    }
});

onNet('sell-animal', (d: { paddockStrid: string, aid: number }) =>
{
    const { aid, paddockStrid } = d;

    const Player = sdk.players.at(global.source);
    if (!Player) return;

    if (!Player.isPlayerInOwnedFarm())
        return Player.Notification(TSL.list.farm_player_not_owner);

    const Paddock = sdk.paddocks.getPaddock(Player.dimension, paddockStrid);
    if (!Paddock) return;

    const Animal = Paddock.Animals.find(a => a.aid == aid);
    if (Animal)
    {
        const animalDataConfig = SharedConfig.Animals[Animal.animalType];
        if (!animalDataConfig) return;

        Player.OpenModalMenu({
            question: TSL.format(TSL.list.sell_animal_question, [animalDataConfig.SELL_PRICE]),
            icon: 'fa-solid fa-dollar-sign',
            inputs: [],
            buttons: [
                {
                    name: TSL.list.button_yes,
                    args: d,
                    event: 'sell-animal-accept'
                },
                {
                    name: TSL.list.button_cancel,
                    args: null,
                    event: null
                }
            ]
        })
    }
});

onNet('gather-pig', async (d: { paddockStrid: string, aid: number }) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;

    const Paddock = sdk.paddocks.getPaddock(Player.dimension, d.paddockStrid);
    if (!Paddock) return;

    const Animal = Paddock.Animals.find(a => a.aid == d.aid);
    if (Animal && Animal.animalType == "PIG")
    {
        if (Animal.animalDead)
            return Player.Notification(TSL.list.animal_dead_notification);

        try {
            await Player.PlayAnimationPromise('oddjobs@hunter', 'idle_a', 1, 2000);

            if (Animal.animalDead) 
                return Player.Notification(TSL.list.animal_dead_notification);

            const FarmLoots = sdk.loots.getFarmLoots(Player.dimension);
            if (!FarmLoots) return;

            if (Animal.weight + FarmLoots.mealLoot > FarmLoots.getMaxMealLoot)
                return Player.Notification(TSL.list.no_more_storage);

            FarmLoots.mealLoot += Animal.weight;
            Animal.destroy();
        }
        catch(error) {
            console.error('gather-pig event crash prevent.');
            console.error(error);   
        }
    }
});

onNet('gather-cow', async (d: { paddockStrid: string, aid: number }) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;

    if (!Player.hasAttachment('bucketEmpty'))
        return Player.Notification(TSL.list.need_empty_bucket);

    const Paddock = sdk.paddocks.getPaddock(Player.dimension, d.paddockStrid);
    if (!Paddock) return;

    const Animal = Paddock.Animals.find(a => a.aid == d.aid);
    if (Animal && Animal.animalType == 'COW' && sdk.peds.exist(Animal.Ped))
    {
        if (Animal.animalDead)
            return Player.Notification(TSL.list.animal_dead_notification);

        if (Animal.milk < SharedConfig.Animals.COW.minimumMilkToGather)
            return Player.Notification(TSL.list.can_not_gather_milk_yet);

        const cachedMilk = Animal.milk;

        const { x, y, z } = Animal.Ped.position;

        Player.position = Animal.actionPos;
        Player.heading = Animal.actionHeading;

        /** Reset the milk to 0; */
        Animal.milk = 0;

        try {
            await Player.PlayAnimationPromise('anim@move_m@trash', 'pickup', 1, 2000);

            Player.removeAttachment('bucketEmpty');
            Player.PlayAnimation('missheistdockssetup1ig_3@talk', 'oh_hey_vin_dockworker', 1);

            const Object = sdk.objects.create({
                dimension: Player.dimension,
                model: 'avp_farm_bucket_01',
                position: Animal.Ped.position,
                freezed: true,
                collision: true
            });

            const Particle = sdk.particles.create({
                dict: 'scr_carwash',
                particleName: 'ent_amb_car_wash_jet',
                position: new Vector3Mp(x, y, z + 0.6),
                dimension: Player.dimension,
                rotation: new Vector3Mp(180, 0, 0),
                scale: 0.1,
            }, 15000);

            await sdk.methods.Wait(12000);

            Player.StopAnimation();

            /** Change bucket model to full milk bucket. */
            if (sdk.objects.exist(Object))
            {
                Object.model = 'avp_farm_bucket_03';
                Object.variables.raycastName = TSL.list.raycast_bucket_with_milk;
                Object.interactionPress = async (Player) =>
                {
                    if (Player.hasAnyAttachment())
                        return Player.Notification(TSL.list.something_in_your_hand);

                    try {
                        await Player.PlayAnimationPromise('anim@move_m@trash', 'pickup', 1, 2000);
                    
                        if (Player.hasAnyAttachment())
                            return Player.Notification(TSL.list.something_in_your_hand);

                        Player.addAttachment('bucketWithMilk');
                        Player.serverVariables.bucketMilkLiters = cachedMilk;
                        Object.destroy();
                    }
                    catch(error) {
                        console.error(error);
                    }
                }
            }
        }
        catch(error) {
            console.error('gather-cow crash prevent.');
            console.error(error);
        }
    }
});