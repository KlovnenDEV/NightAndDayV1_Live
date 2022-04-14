import { BaseDatabase } from "../aquiver-mysql";
import mysql from "mysql";
import { AnimalTypes } from "../../../../../shared/shared-types";

export interface AnimalDatabaseInterface
{
    aid?: number;
    farmId?: number;
    paddockStrid: string;
    hunger: number;
    age: number;
    thirst: number;
    animalType: AnimalTypes;
    milk: number;
    weight: number;
    health: number;
    extra: number;
}

export class AnimalBase implements AnimalDatabaseInterface
{

    aid?: number;
    farmId?: number;
    age: number;
    hunger: number;
    animalType: AnimalTypes;
    paddockStrid: string;
    thirst: number;
    milk: number;
    weight: number;
    health: number;
    extra: number;

    constructor(data: AnimalDatabaseInterface)
    {
        this.aid = data.aid;
        this.farmId = data.farmId;
        this.age = data.age;
        this.hunger = data.hunger;
        this.animalType = data.animalType;
        this.paddockStrid = data.paddockStrid;
        this.thirst = data.thirst;
        this.milk = data.milk;
        this.weight = data.weight;
        this.health = data.health;
        this.extra = data.extra;
    }
}

export class AnimalBaseRepository extends BaseDatabase<AnimalBase, AnimalDatabaseInterface> {
    constructor(connection: mysql.Connection)
    {
        super(connection, 'af_paddock_animals');
    }
    constructModel(row: AnimalDatabaseInterface): AnimalBase
    {
        return new AnimalBase(row);
    }
}