import { SharedConfig } from "../../../../shared/shared-config";
import { TSL } from "../../../../shared/shared-translations";
import { Vector3Mp } from "../../../../shared/vector3";
import * as sdk from "../server";

export class WaterTip
{
    private spawnedBucketObject: sdk.objects.AquiverObject;
    private timeouter: NodeJS.Timeout;

    constructor(dimension: number, position: Vector3Mp, rotation: Vector3Mp, spawnBucketPosition: Vector3Mp, spawnBucketRotation: Vector3Mp)
    {
        const obj = sdk.objects.create({
            dimension: dimension,
            position: position,
            freezed: true,
            model: 'avp_farm_tip',
            rotation: rotation,
            variables: {
                waterTip: true,
                waterTipActive: false
            }
        });

        obj.interactionPress = async (Player) =>
        {
            const self = obj;

            if (sdk.methods.dist(Player.position, self.position) > 1.5)
                return Player.Notification(TSL.list.watertip_far);

            if (sdk.objects.exist(this.spawnedBucketObject))
                return Player.Notification(TSL.list.watertip_already_bucket);

            if (self.variables.waterTipActive)
                return Player.Notification(TSL.list.watertip_already_filling);

            if (!self.variables.waterTipActive)
            {
                if (!Player.hasAttachment('bucketEmpty'))
                    return Player.Notification(TSL.list.watertip_need_emptybucket);

                try
                {
                    await Player.PlayAnimationPromise('anim@move_m@trash', 'pickup', 1, 2000);

                    if(!Player.hasAttachment('bucketEmpty'))
                        return Player.Notification(TSL.list.watertip_need_emptybucket);

                    if (self.variables.waterTipActive) return;
                    if (sdk.objects.exist(this.spawnedBucketObject)) return;

                    sdk.particles.create({
                        dict: 'scr_carwash',
                        particleName: 'ent_amb_car_wash_jet',
                        position: new Vector3Mp(position.x - 0.17, position.y, position.z + 0.72),
                        dimension: dimension,
                        rotation: new Vector3Mp(180, 0, 0),
                        scale: 0.3,
                    }, SharedConfig.AnimalFarm.WaterTipFillTimeMS);

                    self.variables.waterTipActive = true;
                    Player.removeAttachment('bucketEmpty');
                    Player.Notification(TSL.list.watertip_filling_starting);

                    /** Create the filling bucket on the ground. */
                    this.spawnedBucketObject = sdk.objects.create({
                        dimension: dimension,
                        position: spawnBucketPosition,
                        rotation: spawnBucketRotation,
                        model: 'avp_farm_bucket_01',
                        freezed: true,
                        variables: {
                            raycastName: TSL.list.raycast_empty_bucket_name
                        }
                    });

                    this.spawnedBucketObject.interactionPress = (Player) =>
                    {
                        if (sdk.objects.exist(this.spawnedBucketObject))
                        {
                            if (this.spawnedBucketObject.model !== 'avp_farm_bucket_02')
                                return Player.Notification(TSL.list.bucket_not_filled_yet);

                            if (Player.hasAnyAttachment())
                                return Player.Notification(TSL.list.something_in_your_hand);

                            Player.addAttachment('bucketWithWater');

                            this.spawnedBucketObject.destroy();
                        }
                    }

                    /** Filling timeouter & reset. */
                    this.timeouter = setTimeout(() =>
                    {
                        /** Change bucket model to watered. */
                        if (sdk.objects.exist(this.spawnedBucketObject))
                        {
                            this.spawnedBucketObject.model = 'avp_farm_bucket_02';
                            this.spawnedBucketObject.variables.raycastName = TSL.list.raycast_filled_bucket_name;
                        }

                        self.variables.waterTipActive = false;

                        if (this.timeouter)
                        {
                            clearTimeout(this.timeouter);
                            this.timeouter = null;
                        }
                    }, SharedConfig.AnimalFarm.WaterTipFillTimeMS);
                }
                catch (error)
                {
                    console.error(error);
                }
            }
        }
    }
}

export class Shovel
{
    constructor(dimension: number, position: Vector3Mp, rotation: Vector3Mp = new Vector3Mp(0, 0, 0))
    {
        const obj = sdk.objects.create({
            dimension: dimension,
            position: position,
            freezed: true,
            model: 'avp_farm_shovel',
            rotation: rotation,
            variables: {
                raycastName: TSL.list.raycast_pickup_putdown_shovel
            }
        });

        obj.interactionPress = function (Player)
        {
            const self: sdk.objects.AquiverObject = this;

            if (!Player.hasAnyAttachment())
            {
                Player.addAttachment('shovel');
            }
            else
            {
                if (Player.hasAttachment('shovel'))
                {
                    Player.removeAttachment('shovel');
                }
            }
        }
    }
}

export class BucketOnGround
{
    constructor(dimension: number, position: Vector3Mp, rotation: Vector3Mp)
    {
        const obj = sdk.objects.create({
            dimension: dimension,
            position: position,
            freezed: true,
            model: 'avp_farm_bucket_pack',
            rotation: rotation,
            variables: {
                raycastName: TSL.list.raycast_pickup_putdown_bucket
            }
        });

        obj.interactionPress = async (Player) =>
        {
            try
            {
                if (!Player.hasAnyAttachment())
                {
                    await Player.PlayAnimationPromise('anim@move_m@trash', 'pickup', 1, 2000);

                    if (Player.hasAnyAttachment())
                        return Player.Notification(TSL.list.something_in_your_hand);

                    Player.addAttachment('bucketEmpty');
                }
                else
                {
                    if (Player.hasAttachment('bucketEmpty') || Player.hasAttachment('bucketWithWater'))
                    {
                        await Player.PlayAnimationPromise('anim@move_m@trash', 'pickup', 1, 2000);

                        if (Player.hasAttachment('bucketEmpty'))
                            Player.removeAttachment('bucketEmpty');

                        if (Player.hasAttachment('bucketWithWater'))
                            Player.removeAttachment('bucketWithWater');
                    }
                }
            }
            catch (error)
            {
                console.error(error);
            }
        }
    }
}

export class Foodbag
{
    constructor(dimension: number, position: Vector3Mp, rotation: Vector3Mp)
    {
        const obj = sdk.objects.create({
            dimension: dimension,
            position: position,
            rotation: rotation,
            freezed: true,
            model: 'avp_farm_animal_feed_01',
            variables: {
                raycastName: TSL.list.raycast_food_bag_name
            }
        });

        obj.interactionPress = async (Player) =>
        {
            try
            {
                if (!Player.hasAnyAttachment())
                {

                    await Player.PlayAnimationPromise('anim@move_m@trash', 'pickup', 1, 2000);

                    if (Player.hasAnyAttachment())
                        return Player.Notification(TSL.list.something_in_your_hand);

                    Player.addAttachment('foodBag');
                }
                else
                {
                    if (Player.hasAttachment('foodBag'))
                    {
                        await Player.PlayAnimationPromise('anim@move_m@trash', 'pickup', 1, 2000);

                        if (!Player.hasAttachment('foodBag')) return;

                        Player.removeAttachment('foodBag');
                    }
                }
            }
            catch (error)
            {
                console.error(error);
            }
        }
    }
}

export class MilkBarrel
{
    constructor(dimension: number, position: Vector3Mp, rotation: Vector3Mp)
    {
        const obj = sdk.objects.create({
            dimension: dimension,
            position: position,
            rotation: rotation,
            freezed: true,
            model: 'prop_barrel_02a',
            variables: {
                raycastName: TSL.list.raycast_milk_container_name
            }
        });

        obj.interactionPress = function (Player)
        {
            const self: sdk.objects.AquiverObject = this;

            if (Player.hasAttachment('bucketWithMilk'))
            {
                Player.removeAttachment('bucketWithMilk');

                /** Give empty bucket after. */
                Player.addAttachment('bucketEmpty');

                const FarmLoots = sdk.loots.getFarmLoots(Player.dimension);
                if (FarmLoots)
                {
                    if (typeof Player.serverVariables.bucketMilkLiters === 'number' && Player.serverVariables.bucketMilkLiters > 0)
                    {
                        FarmLoots.milkLoot += Player.serverVariables.bucketMilkLiters;
                        Player.serverVariables.bucketMilkLiters = null;
                    }
                }
            }
        }
    }
}

export class Laptop
{
    constructor(dimension: number, position: Vector3Mp, rotation: Vector3Mp)
    {
        const obj = sdk.objects.create({
            dimension: dimension,
            position: position,
            rotation: rotation,
            freezed: true,
            model: 'prop_laptop_lester',
            variables: {
                constantName: TSL.list.constant_name_upgrades
            }
        });

        obj.interactionPress = function (Player)
        {
            sdk.paddocks.openPaddockUpgradesMenu(Player);
        }
    }
}