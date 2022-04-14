import { PedDataInterface } from '../../../../shared/shared-types';
import { Vector3Mp } from '../../../../shared/vector3';

import * as sdk from "../server";

export class AquiverPed
{
    /** Ped binded function when key pressed. */
    public interactionPress?: (Player?: sdk.players.AquiverPlayer) => void;

    constructor(private _data: PedDataInterface)
    {
        /** Spawn the ped on every client. */
        sdk.players.TriggerAllClientDimension(this.dimension, 'ped-append', this.data);

        /** Create proxy for variable change and update on clients. */
        this._data.variables = new Proxy(this._data.variables, {
            set: (self, key, value) =>
            {
                if (self[key] === value) return true;

                sdk.players.TriggerAllClientDimension(this.dimension, 'ped-set-var', this.id, key, value);
                self[key] = value;
                return true;
            }
        });
    }
    get dead()
    {
        return this._data.dead;
    }
    set dead(state: boolean)
    {
        this._data.dead = state;

        sdk.players.TriggerAllClientDimension(this.dimension, 'ped-update-data', this.id, 'dead', this.dead);
    }
    get heading()
    {
        return this._data.heading;
    }
    set heading(h: number)
    {
        this._data.heading = h;

        sdk.players.TriggerAllClientDimension(this.dimension, 'ped-update-data', this.id, 'heading', this.heading);
    }
    get position()
    {
        return this._data.position;
    }
    set position(pos: Vector3Mp)
    {
        this._data.position = pos;

        sdk.players.TriggerAllClientDimension(this.dimension, 'ped-update-data', this.id, 'position', this.position);
    }
    get dimension()
    {
        return this._data.dimension;
    }
    set dimension(dim: number)
    {
        this._data.dimension = dim;

        sdk.players.TriggerAllClientDimension(this.dimension, 'ped-update-data', this.id, 'dimension', this.dimension);
    }
    get id()
    {
        return this._data.id;
    }
    get variables()
    {
        return this._data.variables;
    }
    get data()
    {
        return this._data;
    }
    destroy()
    {
        sdk.players.TriggerAllClientDimension(this.dimension, 'ped-remove', this.id);

        if (sdk.peds.ServerPeds.has(this.id))
        {
            sdk.peds.ServerPeds.delete(this.id);
        }
    }
}

class PedManager
{
    static ServerPeds = new Map<number, AquiverPed>();

    static create(a: PedDataInterface)
    {
        const id = this.generateId();
        a.id = id;

        const Ped = new AquiverPed(a);
        this.ServerPeds.set(id, Ped);
        return Ped;
    }
    static generateId()
    {
        let id = 0;
        while (this.ServerPeds.has(id))
        {
            id++;
        }
        return id;
    }
    static initOnDimensionChange(Player: sdk.players.AquiverPlayer)
    {
        const allDataInArray = [...this.ServerPeds.values()].filter(a => a.dimension == Player.dimension).map(a => a.data);
        Player.TriggerClient('ped-set-all-data', allDataInArray);
    }
    static exist(x: number | AquiverPed)
    {
        if (typeof x === 'number')
        {
            return this.ServerPeds.has(x);
        }
        else if (x instanceof AquiverPed)
        {
            for (let v of this.ServerPeds.values())
            {
                if (v == x) return true;
            }
        }
    }
    static at(x: number | AquiverPed)
    {
        if (typeof x === 'number')
        {
            return this.ServerPeds.get(x);
        }
        else if (x instanceof AquiverPed)
        {
            for (let v of this.ServerPeds.values())
            {
                if (v == x) return v;
            }
        }
    }
}

export const { ServerPeds, at, create, exist, generateId, initOnDimensionChange } = PedManager;