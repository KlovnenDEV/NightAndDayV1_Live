import { SharedConfig } from '../../../../../../shared/shared-config';
import { UpgradeData } from '../../../../../../shared/shared-types';
import { UpgradeBase } from './upgrade-base';

import * as sdk from "../../../server";
import { TSL } from '../../../../../../shared/shared-translations';

export class WaterUpgrade extends UpgradeBase
{
    /** Private(s) */
    private _waterAmount: number = 0;
    private _serverStartup: boolean = true;

    /** Public */

    constructor(data: UpgradeData)
    {
        super(data);

        sdk.ServerDatabase.PaddockRepository.find({
            where: {
                farmId: this.data.farmId,
                paddockStrid: this.data.paddockStrid,
                upgradeStrid: this.data.upgradeStrid
            },
            find: ['waterAmount']
        }).then(rows =>
        {
            if (rows && rows[0])
            {
                this.waterAmount = rows[0].waterAmount;
                this.upgraded = true;
            }
        }).finally(() =>
        {
            this._serverStartup = false;
        });
    }
    get upgraded()
    {
        return super.upgraded;
    }
    set upgraded(state: boolean)
    {
        super.upgraded = state;

        /** Create the object if not exist and state turned to true */
        if (state && !sdk.objects.exist(this.object))
        {
            this.object = sdk.objects.create({
                dimension: this.data.farmId,
                model: this.data.model,
                position: this.data.position,
                rotation: this.data.rotation,
                freezed: true,
                variables: {
                    waterAmount: this.waterAmount,
                    raycastName: TSL.list.raycast_water_name
                }
            });

            this.object.interactionPress = (Player) =>
            {
                if (Player.hasAttachment('bucketWithWater'))
                {
                    if (this.waterAmount >= SharedConfig.AnimalFarm.maximumWater)
                        return Player.Notification(TSL.list.water_trough_already_filled);

                    Player.removeAttachment('bucketWithWater');
                    Player.addAttachment('bucketEmpty');

                    let newWater = this.waterAmount + SharedConfig.AnimalFarm.fillWithBucket;
                    if (newWater > SharedConfig.AnimalFarm.maximumWater)
                        newWater = SharedConfig.AnimalFarm.maximumWater;

                    this.waterAmount = newWater;
                }
                else
                {
                    Player.Notification(TSL.list.need_bucket_with_water);
                }

            }
        }

        /** Delete the object if its exist and state is false */
        if (!state && sdk.objects.exist(this.object))
        {
            this.object.destroy();
        }
    }
    get waterAmount()
    {
        return this._waterAmount;
    }
    set waterAmount(amount: number)
    {
        amount = Math.floor(amount);
        if (amount < 1) amount = 0;
        else if (amount > 100) amount = 100;

        this._waterAmount = amount;

        if (sdk.objects.exist(this.object))
        {
            this.object.variables.waterAmount = this.waterAmount;
        }

        if (!this._serverStartup)
        {
            sdk.ServerDatabase.PaddockRepository.update({
                where: {
                    farmId: this.data.farmId,
                    paddockStrid: this.data.paddockStrid,
                    upgradeStrid: this.data.upgradeStrid
                },
                set: {
                    waterAmount: this.waterAmount
                }
            });
        }
    }
    get description(): string
    {
        return TSL.list.upgrade_water_description;
    }
    get img(): string
    {
        return 'water_trough.png';
    }
    get name(): string
    {
        return TSL.list.water_main_name;
    }
    Upgrade(Player: sdk.players.AquiverPlayer): void
    {
        sdk.ServerDatabase.PaddockRepository.exist({
            farmId: this.data.farmId,
            paddockStrid: this.data.paddockStrid,
            upgradeStrid: this.data.upgradeStrid
        }).then(exist =>
        {
            if (!exist)
            {
                sdk.ServerDatabase.PaddockRepository.insert({
                    farmId: this.data.farmId,
                    paddockStrid: this.data.paddockStrid,
                    upgradeStrid: this.data.upgradeStrid,
                    waterAmount: this.waterAmount
                });

                this.upgraded = true;
                sdk.paddocks.openPaddockUpgradesMenu(Player);
            }
        });
    }
}