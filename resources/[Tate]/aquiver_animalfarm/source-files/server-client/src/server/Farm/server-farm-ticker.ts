import { SharedConfig } from "../../../../shared/shared-config";
import * as sdk from "../server";

/**
Hellu.
Do not judge this code please, i wanted to keep it clean, maybe i will edit if afterwards differently, thats why the animals are in switch. 
*/

class FarmTickers
{
    static troughUpgradesTicker: NodeJS.Timer = null;
    static animalTicker: NodeJS.Timer = null;
    static chickenEggTicker: NodeJS.Timer = null;

    static start()
    {
        if (!this.troughUpgradesTicker)
        {
            this.troughUpgradesTicker = setInterval(() =>
            {
                /** Loop through all farm */
                sdk.paddocks.FarmPaddocks.forEach((paddock, farmId) =>
                {
                    /** Loop through farm paddocks. */
                    paddock.forEach(a =>
                    {
                        /** Loop through paddock animals */
                        if (a.Animals.length > 0)
                        {
                            /** Decrease food amount. */
                            let troughWithFood = a.Troughs.filter(trough => trough.foodAmount > 0);
                            if (troughWithFood.length > 0)
                            {
                                for (let i = 0; i < a.Animals.length; i++)
                                {
                                    let animal = a.Animals[i];
                                    let idx = sdk.methods.randomIndexFromArray(troughWithFood); // Pick random food trough from the foodAmount > 0 troughs.
                                    let trough = troughWithFood[idx];
                                    if (trough)
                                    {
                                        let minusFood: number;
                                        switch (animal.animalType)
                                        {
                                            case "COW": {
                                                minusFood = sdk.methods.ChanceSdk.integer({ min: 1, max: 3 });
                                                break;
                                            }
                                            case "PIG": {
                                                minusFood = sdk.methods.ChanceSdk.integer({ min: 2, max: 3 });
                                                break;
                                            }
                                            case "CHICKEN": {
                                                minusFood = sdk.methods.ChanceSdk.integer({ min: 1, max: 2 });
                                                break;
                                            }
                                        }

                                        trough.foodAmount -= minusFood;
                                    }
                                }
                            }

                            /** Decrease water amount. */
                            let troughWithWater = a.Waters.filter(water => water.waterAmount > 0);
                            if (troughWithWater.length > 0)
                            {
                                for (let i = 0; i < a.Animals.length; i++)
                                {
                                    let animal = a.Animals[i];
                                    let idx = sdk.methods.randomIndexFromArray(troughWithWater); // Pick random
                                    let water = troughWithWater[idx];
                                    if (water)
                                    {
                                        let minusWater: number;
                                        switch (animal.animalType)
                                        {
                                            case "COW": {
                                                minusWater = sdk.methods.ChanceSdk.integer({ min: 3, max: 5 });
                                                break;
                                            }
                                            case "PIG": {
                                                minusWater = sdk.methods.ChanceSdk.integer({ min: 2, max: 3 });
                                                break;
                                            }
                                            case "CHICKEN": {
                                                minusWater = sdk.methods.ChanceSdk.integer({ min: 1, max: 2 });
                                                break;
                                            }
                                        }

                                        water.waterAmount -= minusWater;
                                    }
                                }
                            }
                        }

                    });
                });
            }, SharedConfig.Tickers.TroughsTickerMS);
        }

        if (!this.animalTicker)
        {

            this.animalTicker = setInterval(() =>
            {
                /** Loop through all of the farm paddocks. */
                sdk.paddocks.FarmPaddocks.forEach((paddock, farmId) =>
                {
                    paddock.forEach(a =>
                    {
                        for (let i = 0; i < a.Animals.length; i++)
                        {
                            let animal = a.Animals[i];
                            if (!animal || animal.animalDead) continue;

                            switch (animal.animalType)
                            {
                                case "COW": {

                                    /** HUNGER */
                                    const allFoodAmount = a.allFoodAmount;
                                    if (allFoodAmount < 1)
                                    {
                                        /** Decrease hunger */
                                        let generateMinus = sdk.methods.ChanceSdk.integer(
                                            {
                                                min: SharedConfig.Animals.COW.hungerDecreaseAmount.min,
                                                max: SharedConfig.Animals.COW.hungerDecreaseAmount.max
                                            }
                                        );
                                        if (typeof generateMinus === 'number' && generateMinus > 0)
                                        {
                                            animal.hunger -= generateMinus;
                                        }
                                    }
                                    else
                                    {
                                        /** Increase hunger */
                                        animal.hunger += SharedConfig.Animals.COW.hungerIncreaseAmount;
                                    }

                                    /** THIRST */
                                    const allWaterAmount = a.allWaterAmount;
                                    if (allWaterAmount < 1)
                                    {
                                        /** Decrease thirst */
                                        let generateMinus = sdk.methods.ChanceSdk.integer({
                                            min: SharedConfig.Animals.COW.thirstDecreaseAmount.min,
                                            max: SharedConfig.Animals.COW.thirstDecreaseAmount.max
                                        });
                                        if (typeof generateMinus === 'number' && generateMinus > 0)
                                        {
                                            animal.thirst -= generateMinus;
                                        }
                                    }
                                    else
                                    {
                                        /** Increase thirst */
                                        animal.thirst += SharedConfig.Animals.COW.thirstIncreaseAmount;
                                    }

                                    /** Milk generate */
                                    let plusMilk = 0;

                                    plusMilk += animal.hunger * SharedConfig.Animals.COW.milk_HungerMultiplier;
                                    plusMilk += animal.thirst * SharedConfig.Animals.COW.milk_ThirstMultiplier;
                                    plusMilk += animal.health * SharedConfig.Animals.COW.milk_HealthMultiplier;
                                    plusMilk += animal.age * SharedConfig.Animals.COW.milk_ageMultiplier;

                                    if (plusMilk > 0)
                                    {
                                        animal.milk += plusMilk;
                                    }

                                    /** Decrease age. */
                                    let decreaseAge = SharedConfig.Animals.COW.ageDecrease_default;

                                    decreaseAge -= (100 - animal.thirst) * SharedConfig.Animals.COW.ageDecrease_thirstMultiplier;
                                    decreaseAge -= (100 - animal.hunger) * SharedConfig.Animals.COW.ageDecrease_hungerMultiplier;
                                    decreaseAge -= (100 - animal.health) * SharedConfig.Animals.COW.ageDecrease_healthMultiplier;

                                    decreaseAge *= animal.extra;

                                    animal.age -= decreaseAge;

                                    break;
                                }
                                case "PIG": {
                                    /** Decrease / Increase hunger */
                                    const allFoodAmount = a.allFoodAmount;
                                    if (allFoodAmount < 1)
                                    {
                                        let generateMinus = sdk.methods.ChanceSdk.integer({
                                            min: SharedConfig.Animals.PIG.hungerDecreaseAmount.min,
                                            max: SharedConfig.Animals.PIG.hungerDecreaseAmount.max
                                        });
                                        if (typeof generateMinus === 'number' && generateMinus > 0)
                                        {
                                            animal.hunger -= generateMinus;
                                        }
                                    }
                                    else
                                    {
                                        /** Increase hunger */
                                        animal.hunger += SharedConfig.Animals.PIG.hungerIncreaseAmount;
                                    }

                                    /** THIRST */
                                    const allWaterAmount = a.allWaterAmount;
                                    if (allWaterAmount < 1)
                                    {
                                        /** Decrease */
                                        let generateMinus = sdk.methods.ChanceSdk.integer({
                                            min: SharedConfig.Animals.PIG.thirstDecreaseAmount.min,
                                            max: SharedConfig.Animals.PIG.thirstDecreaseAmount.max
                                        });
                                        if (typeof generateMinus === 'number' && generateMinus > 0)
                                        {
                                            animal.thirst -= generateMinus;
                                        }
                                    }
                                    else
                                    {
                                        /** Increase */
                                        animal.thirst += SharedConfig.Animals.PIG.thirstIncreaseAmount;
                                    }

                                    /** Weight generate. */
                                    let plusWeight = 0;

                                    plusWeight += animal.hunger * SharedConfig.Animals.PIG.weight_HungerMultiplier;
                                    plusWeight += animal.thirst * SharedConfig.Animals.PIG.weight_ThirstMultiplier;
                                    plusWeight += animal.health * SharedConfig.Animals.PIG.weight_HealthMultiplier;
                                    plusWeight += animal.age * SharedConfig.Animals.PIG.weight_ageMultiplier;

                                    if (plusWeight > 0)
                                    {
                                        animal.weight += plusWeight;
                                    }

                                    /** Decrease age. */
                                    let decreaseAge = SharedConfig.Animals.PIG.ageDecrease_default;

                                    decreaseAge -= (100 - animal.thirst) * SharedConfig.Animals.PIG.ageDecrease_thirstMultiplier;
                                    decreaseAge -= (100 - animal.hunger) * SharedConfig.Animals.PIG.ageDecrease_hungerMultiplier;
                                    decreaseAge -= (100 - animal.health) * SharedConfig.Animals.PIG.ageDecrease_healthMultiplier;

                                    decreaseAge *= animal.extra;

                                    animal.age -= decreaseAge;

                                    break;
                                }
                                case "CHICKEN": {
                                    /** HUNGER */
                                    const allFoodAmount = a.allFoodAmount;
                                    if (allFoodAmount < 1)
                                    {
                                        /** Decrease */
                                        let generateMinus = sdk.methods.ChanceSdk.integer({
                                            min: SharedConfig.Animals.CHICKEN.hungerDecreaseAmount.min,
                                            max: SharedConfig.Animals.CHICKEN.hungerDecreaseAmount.max
                                        });
                                        if (typeof generateMinus === 'number' && generateMinus > 0)
                                        {
                                            animal.hunger -= generateMinus;
                                        }
                                    }
                                    else
                                    {
                                        /** Increase */
                                        animal.hunger += SharedConfig.Animals.CHICKEN.hungerIncreaseAmount;
                                    }

                                    /** THIRST */
                                    const allWaterAmount = a.allWaterAmount;
                                    if (allWaterAmount < 1)
                                    {
                                        /** Decrease */
                                        let generateMinus = sdk.methods.ChanceSdk.integer({
                                            min: SharedConfig.Animals.CHICKEN.thirstDecreaseAmount.min,
                                            max: SharedConfig.Animals.CHICKEN.thirstDecreaseAmount.max
                                        });
                                        if (typeof generateMinus === 'number' && generateMinus > 0)
                                        {
                                            if (animal.thirst - generateMinus < 1) animal.thirst = 0;
                                            else animal.thirst -= generateMinus;
                                        }
                                    }
                                    else
                                    {
                                        /** Increase thirst */
                                        animal.thirst += SharedConfig.Animals.CHICKEN.thirstIncreaseAmount;
                                    }

                                    /** Decrease age. */
                                    let decreaseAge = SharedConfig.Animals.CHICKEN.ageDecrease_default;

                                    decreaseAge -= (100 - animal.thirst) * SharedConfig.Animals.CHICKEN.ageDecrease_thirstMultiplier;
                                    decreaseAge -= (100 - animal.hunger) * SharedConfig.Animals.CHICKEN.ageDecrease_hungerMultiplier;
                                    decreaseAge -= (100 - animal.health) * SharedConfig.Animals.CHICKEN.ageDecrease_healthMultiplier;

                                    decreaseAge *= animal.extra;

                                    animal.age -= decreaseAge;
                                    break;
                                }
                            }
                        }
                    });
                });
            }, SharedConfig.Tickers.HungerAndThirstMS);
        }

        if (!this.chickenEggTicker)
        {
            this.chickenEggTicker = setInterval(() =>
            {
                /** Loop through all farms. */
                sdk.paddocks.FarmPaddocks.forEach((paddock, farmId) =>
                {
                    const Loots = sdk.loots.getFarmLoots(farmId);
                    if (!Loots) return;

                    if (Loots.eggLoot >= Loots.getMaxEggLoot) return;

                    /** Loop through all paddocks. */
                    paddock.forEach(a =>
                    {
                        /** Filter chickens, and they need to be alive. */
                        const chickens = a.Animals.filter(a => a.animalType == 'CHICKEN' && !a.animalDead);
                        if (chickens.length < 1) return;

                        /** Loop through chickens. */
                        for (let i = 0; i < chickens.length; i++)
                        {
                            let chicken = chickens[i];

                            /** Chance to spawn an egg. (basically give) */
                            let eggChance = 15;

                            eggChance += chicken.hunger * SharedConfig.Animals.CHICKEN.egg_HungerMultiplier;
                            eggChance += chicken.thirst * SharedConfig.Animals.CHICKEN.egg_ThirstMultiplier;
                            eggChance += chicken.health * SharedConfig.Animals.CHICKEN.egg_HealthMultiplier;
                            eggChance += (100 - chicken.age) * SharedConfig.Animals.CHICKEN.egg_ageMultiplier;

                            const spawn = sdk.methods.ChanceSdk.bool({ likelihood: eggChance });
                            if (spawn)
                            {
                                Loots.eggLoot++;
                            }
                        }
                    });
                });
            }, SharedConfig.Tickers.EggTickerMS);
        }
    }
    static stop()
    {
        if (this.animalTicker)
        {
            clearInterval(this.animalTicker);
            this.animalTicker = null;
        }

        if (this.troughUpgradesTicker)
        {
            clearInterval(this.troughUpgradesTicker);
            this.troughUpgradesTicker = null;
        }

        if (this.chickenEggTicker)
        {
            clearInterval(this.chickenEggTicker);
            this.chickenEggTicker = null;
        }
    }
}

export const {
    start,
    stop,
    animalTicker: hungerThirstTicker,
    troughUpgradesTicker: waterAndFoodTicker
} = FarmTickers;