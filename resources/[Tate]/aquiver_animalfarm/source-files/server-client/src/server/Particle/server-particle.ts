import { ParticleConstructorInterface } from "../../../../shared/shared-types";
import { Vector3Mp } from "../../../../shared/vector3";

import * as sdk from "../server";

export class AquiverLoopedParticle
{
    constructor(private _data: ParticleConstructorInterface)
    {
        /** Spawn the particle on every client. */
        sdk.players.TriggerAllClientDimension(this.dimension, 'particle-append', this.data);
    }
    set position(p: Vector3Mp)
    {
        this._data.position = p;

        sdk.players.TriggerAllClientDimension(this.dimension, 'particle-update-data', this.id, 'position', this.position);
    }
    get dimension()
    {
        return this._data.dimension;
    }
    get position()
    {
        return this._data.position;
    }
    set scale(s: number)
    {
        this._data.scale = s;

        sdk.players.TriggerAllClientDimension(this.dimension, 'particle-update-data', this.id, 'scale', this.scale);
    }
    get scale()
    {
        return this._data.scale;
    }
    set rotation(r: Vector3Mp)
    {
        this._data.rotation = r;

        sdk.players.TriggerAllClientDimension(this.dimension, 'particle-update-data', this.id, 'rotation', this.rotation);
    }
    get rotation()
    {
        return this._data.rotation;
    }
    get id()
    {
        return this._data.id;
    }
    get data()
    {
        return this._data;
    }
    destroy()
    {
        sdk.players.TriggerAllClientDimension(this.dimension, 'particle-remove', this.id);

        if (sdk.particles.ServerParticles.has(this.id))
        {
            sdk.particles.ServerParticles.delete(this.id);
        }
    }
}

class ParticleManager
{
    static ServerParticles = new Map<number, AquiverLoopedParticle>();

    static create(a: ParticleConstructorInterface, timeMS: number)
    {
        const id = this.generateId();
        a.id = id;

        const Particle = new AquiverLoopedParticle(a);
        this.ServerParticles.set(
            id,
            Particle
        );

        setTimeout(() =>
        {
            if (Particle) Particle.destroy();
        }, timeMS);

        return Particle;
    }
    static at(x: number | AquiverLoopedParticle)
    {
        if (typeof x === 'number')
        {
            return this.ServerParticles.get(x);
        }
        else if (x instanceof AquiverLoopedParticle)
        {
            for (let v of this.ServerParticles.values())
            {
                if (v == x) return v;
            }
        }
    }
    static exist(x: number | AquiverLoopedParticle)
    {
        if (typeof x === 'number')
        {
            return this.ServerParticles.has(x);
        }
        else if (x instanceof AquiverLoopedParticle)
        {
            for (let v of this.ServerParticles.values())
            {
                if (v == x) return true;
            }
        }
    }
    static initOnDimensionChange(Player: sdk.players.AquiverPlayer)
    {
        const allDataInArray = [...this.ServerParticles.values()].filter(a => a.dimension == Player.dimension).map(a => a.data);
        Player.TriggerClient('particle-set-all-data', allDataInArray);
    }
    static generateId()
    {
        let id = 0;
        while (this.ServerParticles.has(id))
        {
            id++;
        }
        return id;
    }
}

export const { ServerParticles, at, create, exist, generateId, initOnDimensionChange } = ParticleManager;