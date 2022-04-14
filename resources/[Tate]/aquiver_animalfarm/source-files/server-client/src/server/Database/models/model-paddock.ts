import { BaseDatabase } from "../aquiver-mysql";
import mysql from "mysql";

interface PaddockDatabaseInterface {
    farmId?: number;
    paddockStrid: string;
    upgradeStrid: string;
    foodAmount: number;
    waterAmount: number;
}

export class PaddockBase implements PaddockDatabaseInterface {

    farmId?: number;
    foodAmount: number;
    paddockStrid: string;
    upgradeStrid: string;
    waterAmount: number;

    constructor(data: PaddockDatabaseInterface) {
        this.farmId = data.farmId;
        this.paddockStrid = data.paddockStrid;
        this.upgradeStrid = data.upgradeStrid;

        this.waterAmount = data.waterAmount;
        this.foodAmount = data.foodAmount;
    }
}

export class PaddockBaseRepository extends BaseDatabase<PaddockBase, PaddockDatabaseInterface> {
    constructor(connection: mysql.Connection) {
        super(connection, 'af_paddock_upgrades');
    }
    constructModel(row: PaddockDatabaseInterface): PaddockBase {
        return new PaddockBase(row);
    }
}