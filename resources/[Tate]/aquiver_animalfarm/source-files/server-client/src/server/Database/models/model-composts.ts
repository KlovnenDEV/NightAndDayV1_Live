import { BaseDatabase } from "../aquiver-mysql";
import mysql from "mysql";

interface CompostDatabaseInterface {
    farmId?: number;
    compostStrid: string;
    shitAmount: number;
}

export class CompostBase implements CompostDatabaseInterface {

    farmId?: number;
    compostStrid: string;
    shitAmount: number;

    constructor(data: CompostDatabaseInterface) {
        this.farmId = data.farmId;
        this.compostStrid = data.compostStrid;
        this.shitAmount = data.shitAmount;
    }
}

export class CompostsBaseRepository extends BaseDatabase<CompostBase, CompostDatabaseInterface> {
    constructor(connection: mysql.Connection) {
        super(connection, 'af_composts');
    }
    constructModel(row: CompostDatabaseInterface): CompostBase {
        return new CompostBase(row);
    }
}