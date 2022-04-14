import { BaseDatabase } from "../aquiver-mysql";
import mysql from "mysql";
import { FarmDatabaseInterface } from "../../../../../shared/shared-types";

export class FarmBase implements FarmDatabaseInterface
{

    farmId?: number;
    img: string;
    locked: boolean;
    name: string;
    ownerIdentifier: string;
    ownerName: string;
    price: number;
    x: number;
    y: number;
    z: number;
    egg: number;
    meal: number;
    milk: number;

    constructor(data: FarmDatabaseInterface)
    {
        this.farmId = data.farmId;
        this.img = data.img;
        this.locked = data.locked;
        this.name = data.name;
        this.ownerIdentifier = data.ownerIdentifier;
        this.ownerName = data.ownerName;
        this.price = data.price;
        this.x = data.x;
        this.y = data.y;
        this.z = data.z;
        this.egg = data.egg;
        this.meal = data.meal;
        this.milk = data.milk;
    }
}

export class FarmBaseRepository extends BaseDatabase<FarmBase, FarmDatabaseInterface> {
    constructor(connection: mysql.Connection)
    {
        super(connection, 'af_farms_base');
    }
    constructModel(row: FarmDatabaseInterface): FarmBase
    {
        return new FarmBase(row);
    }
}