import { AttachmentNames } from "../../../../shared/shared-attachments";
import { SharedConfig } from "../../../../shared/shared-config";
import { ClickMenuInterface, DisableKeyTypes, EventTriggerInterface, ModalDataInterface, PlayerSharedVariables } from "../../../../shared/shared-types";
import { Vector3Mp } from "../../../../shared/vector3";
import * as sdk from "../server";

interface ServerPlayerVariables
{
    sellOfferedByIdentifier: string;
    sellOfferPrice: number;
    sellOfferFarmId: number;
    sellTimeouter: any;

    bucketMilkLiters: number;
}

onNet('object-interaction-press', (objectId: number) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;
    const Object = sdk.objects.at(objectId);
    if (!Object || typeof Object.interactionPress !== 'function') return;

    Object.interactionPress(Player);
});
onNet('ped-interaction-press', (pedId: number) =>
{
    const Player = sdk.players.at(global.source);
    if (!Player) return;
    const Ped = sdk.peds.at(pedId);
    if (!Ped || typeof Ped.interactionPress !== 'function') return;

    Ped.interactionPress(Player);
});

export class AquiverPlayer
{
    private _dimension: number = SharedConfig.DimensionManager.DefaultDimension;
    private attachments = new Set<keyof typeof AttachmentNames>();

    public sharedVariables: Partial<PlayerSharedVariables> = {};
    public serverVariables: Partial<ServerPlayerVariables> = {};

    constructor(
        public source: number | string
    )
    {
        /** Just to resync dimension functions. IMPORTANT */
        this.dimension = 0;
        /** ========================== */

        this.sharedVariables = new Proxy(this.sharedVariables, {
            set: (self, key, value) =>
            {
                if (self[key] === value) return true;

                this.TriggerClient('player-set-variable', key, value);
                self[key] = value;
                return true;
            },
        });
    }
    exist()
    {
        return sdk.methods.cfxPlayerExist(this.source);
    }
    get isAdmin() {
        return global.exports[GetCurrentResourceName()].isAdmin(this.source);
    }
    get name()
    {
        return global.exports[GetCurrentResourceName()].getRoleplayName(this.source);
    }
    set keysDisabled(type: DisableKeyTypes)
    {
        this.TriggerClient('player-keys-disabled', type);
    }
    get bank(): number
    {
        return global.exports[GetCurrentResourceName()].getBank(this.source);
    }
    set bank(amount: number)
    {
        global.exports[GetCurrentResourceName()].setBank(this.source, amount);
    }
    get identifier()
    {
        return global.exports[GetCurrentResourceName()].getIdentifier(this.source);
    }
    get heading()
    {
        return GetEntityHeading(GetPlayerPed(this.source as string));
    }
    set heading(a: number)
    {
        SetEntityHeading(GetPlayerPed(this.source as string), a);
    }
    get position()
    {
        const c = GetEntityCoords(GetPlayerPed(this.source as string));
        if (c) return new Vector3Mp(c[0], c[1], c[2]);
    }
    set position(v3: Vector3Mp)
    {
        SetEntityCoords(GetPlayerPed(this.source as string), v3.x, v3.y, v3.z, false, false, false, false);
    }
    get dimension()
    {
        return this._dimension;
    }
    set dimension(dim: number)
    {
        this._dimension = dim;
        this.TriggerClient('player-set-dimension', this.dimension);
        SetPlayerRoutingBucket(this.source as string, this.dimension);

        /** Load the objects and every other thing in the dimension. */
        sdk.particles.initOnDimensionChange(this);
        sdk.peds.initOnDimensionChange(this);
        sdk.objects.initOnDimensionChange(this);

        /** Delete all attachment on dimension change */
        this.deleteAllAttachments();
    }
    Notification(message: string)
    {
        this.TriggerClient('draw-default-notification', message);
    }
    addAttachment(name: keyof typeof AttachmentNames)
    {
        if (this.attachments.has(name)) return;

        this.attachments.add(name);
        this.TriggerClient('add-attachment', name);

        switch (name)
        {
            case "bucketEmpty": {
                this.keysDisabled = 'some';
                break;
            }
            case "bucketWithMilk": {
                this.keysDisabled = 'some';
                break;
            }
            case "bucketWithWater": {
                this.keysDisabled = 'some';
                break;
            }
            case "shovel": {
                this.PlayAnimation('timetable@gardener@clean_pool@', 'base_gardener', 49);
                this.keysDisabled = 'some';
                break;
            }
            case "shovelWithShit": {
                this.PlayAnimation('timetable@gardener@clean_pool@', 'base_gardener', 49);
                this.keysDisabled = 'some';
                break;
            }
            case "foodBag": {
                this.keysDisabled = 'some';
                break;
            }
        }
    }
    removeAttachment(name: keyof typeof AttachmentNames)
    {
        if (this.attachments.has(name))
        {
            this.attachments.delete(name);
            this.TriggerClient('remove-attachment', name);

            switch (name)
            {
                case "bucketEmpty": {
                    this.keysDisabled = null;
                    break;
                }
                case "bucketWithMilk": {
                    this.keysDisabled = null;
                    break;
                }
                case "bucketWithWater": {
                    this.keysDisabled = null;
                    break;
                }
                case "shovel": {
                    this.StopAnimation();
                    this.keysDisabled = null;
                    break;
                }
                case "shovelWithShit": {
                    this.StopAnimation();
                    this.keysDisabled = null;
                    break;
                }
                case "foodBag": {
                    this.keysDisabled = null;
                    break;
                }
            }
        }
    }
    hasAttachment(name: keyof typeof AttachmentNames)
    {
        return this.attachments.has(name);
    }
    hasAnyAttachment()
    {
        return this.attachments.size > 0;
    }
    deleteAllAttachments()
    {
        if (this.attachments.size > 0)
        {
            this.attachments.forEach(name =>
            {
                this.removeAttachment(name);
            });

            this.attachments.clear();
        }
    }
    sendChat(msg: string) {
        this.TriggerClient('chat:addMessage', msg);
    }
    TriggerClient(event: string, ...args: any[])
    {
        TriggerClientEvent(event, this.source, ...args);
    }
    TriggerChromium(trigger: EventTriggerInterface)
    {
        TriggerClientEvent('aqv-trigger-chromium', this.source, trigger);
    }
    OpenModalMenu(data: ModalDataInterface)
    {
        this.TriggerChromium({
            event: 'open-modal-menu',
            data: data
        })
    }
    OpenClickMenu(data: ClickMenuInterface)
    {
        this.TriggerChromium({
            event: 'open-clickmenu',
            data: data
        });
    }
    /**
     * Play simple animation on Player.
     * @param dict Animation dictionary
     * @param anim Animation name
     * @param flag Animation flag
     */
    PlayAnimation(dict: string, anim: string, flag: number)
    {
        TriggerClientEvent('play-animation', this.source, dict, anim, flag);
    }
    /** Stop Player Animation */
    StopAnimation()
    {
        this.TriggerClient('stop-animation', this.source);
    }
    /**
     * Play Player Animation with Promise & await, it will resolve after the timeMS expired.
     * @param dict Animation dictionary
     * @param anim Animation name
     * @param flag Animation flag
     * @param timeMS Time in miliseconds.
     */
    async PlayAnimationPromise(dict: string, anim: string, flag: number, timeMS: number)
    {
        this.PlayAnimation(dict, anim, flag);
        await new Promise(resolve =>
        {
            setTimeout(() =>
            {
                resolve(true);
            }, timeMS);
        });
        this.TriggerClient('stop-animation', this.source);
        return true;
    }
    /** Whether the current farm is that you own or not. */
    isPlayerInOwnedFarm()
    {
        const Farm = sdk.farms.at(this.dimension);
        return Farm && Farm.isOwner(this);
    }
    fadeOutScreen(timeMS: number): Promise<boolean>
    {
        this.TriggerClient('fade-out-screen', timeMS)
        return new Promise(resolve =>
        {
            setTimeout(() =>
            {
                resolve(true);
            }, timeMS);
        });
    }
    fadeInScreen(timeMS: number): Promise<boolean>
    {
        this.TriggerClient('fade-in-screen', timeMS);
        return new Promise(resolve =>
        {
            setTimeout(() =>
            {
                resolve(true);
            }, timeMS);
        });
    }
}

class PlayerManager
{
    static Players = new Map<number, AquiverPlayer>();

    static at(source: number | string)
    {
        if (typeof source !== 'number')
            source = parseInt(source);

        const Player = this.Players.get(source);
        if (!Player || !Player.exist()) return;
        return Player;
    }
    static exist(source: number | string)
    {
        const Player = this.at(source);
        return Player && Player.exist();
    }
    static getPlayerWithIdentifier(identifier: string)
    {
        for (let v of this.Players.values())
        {
            if (v.identifier == identifier)
                return v;
        }
    }
    static playerJoining(source: string | number)
    {
        if (typeof source !== 'number')
            source = parseInt(source);

        this.Players.set(source, new AquiverPlayer(source));
    }
    static playerDropped(source: string | number)
    {
        if (typeof source !== 'number')
            source = parseInt(source);

        if (this.Players.has(source)) this.Players.delete(source);
    }
    /** Trigger client event for players in dimension. */
    static TriggerAllClientDimension(dimension: number, event: string, ...args: any[])
    {
        for (let v of this.Players.values())
        {
            if (v.dimension == dimension)
                TriggerClientEvent(event, v.source, ...args);
        }
    }
    /** Trigger client event on all of the players. */
    static TriggerAllClient(event: string, ...args: any[])
    {
        for (let v of this.Players.values())
        {
            TriggerClientEvent(event, v.source, ...args);
        }
    }
}

export const {
    Players,
    TriggerAllClient,
    TriggerAllClientDimension,
    at,
    exist,
    getPlayerWithIdentifier,
    playerDropped,
    playerJoining
} = PlayerManager;