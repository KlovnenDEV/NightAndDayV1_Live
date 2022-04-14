import { AttachmentNames, SharedAttachments } from '../../../../shared/shared-attachments';
import { SharedConfig } from '../../../../shared/shared-config';
import { DisableKeyTypes, PlayerSharedVariables } from '../../../../shared/shared-types';
import { Vector3Mp } from '../../../../shared/vector3';

import * as sdk from "../client";

export const localPlayer = new class
{
    private _x: number = 0;
    private _y: number = 0;
    private _z: number = 0;
    private _dimension: number = SharedConfig.DimensionManager.DefaultDimension;
    private keyDisableRender: number;
    private _attachments = new Map<string, number>();

    public sharedVariables: Partial<PlayerSharedVariables> = {};

    constructor()
    {
        onNet('player-set-dimension', (dim: number) =>
        {
            this.dimension = dim;
        });
        onNet('player-set-variable', (variable: string, value: any) =>
        {
            this.sharedVariables[variable] = value;
        });

        onNet('draw-default-notification', (msg: string) =>
        {
            SetNotificationTextEntry('STRING');
            AddTextComponentString(msg);
            DrawNotification(false, false);
        });

        onNet('player-keys-disabled', (type: DisableKeyTypes) =>
        {
            this.keysDisabled = type;
        });

        onNet('play-animation', async (dict: string, anim: string, flag: number) =>
        {
            RequestAnimDict(dict);
            await new Promise(resolve =>
            {
                let tries = 0;
                let c = setInterval(() =>
                {
                    if (HasAnimDictLoaded(dict) || tries > 50)
                    {
                        resolve(true);
                        if (c) clearInterval(c);
                    }
                    tries++;
                }, 30);
            });

            TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 8.0, -1, flag, 0, false, false, false);
        });

        onNet('stop-animation', () =>
        {
            ClearPedTasksImmediately(PlayerPedId());
        });

        onNet('add-attachment', (name: keyof typeof AttachmentNames) =>
        {
            this.addAttachment(name);
        });
        onNet('remove-attachment', (name: keyof typeof AttachmentNames) =>
        {
            this.removeAttachment(name);
        });

        onNet('fade-out-screen', (timeMS: number) =>
        {
            DoScreenFadeOut(timeMS);
        });
        onNet('fade-in-screen', (timeMS: number) =>
        {
            DoScreenFadeIn(timeMS);
        });

        setInterval(() =>
        {
            const c = GetEntityCoords(PlayerPedId(), false);
            if (c)
            {
                this._x = c[0];
                this._y = c[1];
                this._z = c[2];
            }
        }, 100);
    }
    private async loadModel(modelHash: number)
    {
        RequestModel(modelHash);
        while (!HasModelLoaded(modelHash))
        {
            await sdk.methods.Wait(100);
            RequestModel(modelHash);
        }
        return true;
    }
    async addAttachment(name: keyof typeof AttachmentNames)
    {
        const attachmentData = SharedAttachments[name];
        if (!attachmentData) return;

        const hash = GetHashKey(attachmentData.model);
        await this.loadModel(hash);

        const obj = CreateObject(hash, this.position.x, this.position.y, this.position.z, true, true, false);

        AttachEntityToEntity(
            obj,
            PlayerPedId(),
            GetPedBoneIndex(PlayerPedId(), attachmentData.bone),
            attachmentData.pos.x,
            attachmentData.pos.y,
            attachmentData.pos.z,
            attachmentData.rot.x,
            attachmentData.rot.y,
            attachmentData.rot.z,
            true,
            true,
            false,
            false,
            2,
            true
        );

        this._attachments.set(
            name,
            obj
        )
    }
    async removeAttachment(name: keyof typeof AttachmentNames)
    {
        if (this._attachments.has(name))
        {
            const handle = this._attachments.get(name);
            if (handle)
            {
                if (DoesEntityExist(handle))
                {
                    DeleteEntity(handle);
                }

                this._attachments.delete(name);
            }
        }
    }
    set keysDisabled(type: DisableKeyTypes)
    {
        if (type == "all")
        {
            if (this.keyDisableRender) return;

            this.keyDisableRender = setTick(() =>
            {
                DisableAllControlActions(0);
            });
        }
        else if (type == "some")
        {
            if (this.keyDisableRender) return;

            this.keyDisableRender = setTick(() =>
            {
                SharedConfig.Player.DisabledKeysWhileTool.forEach(a =>
                {
                    DisableControlAction(0, a, true);
                });
            });
        }
        else
        {
            if (this.keyDisableRender)
            {
                clearTick(this.keyDisableRender);
                this.keyDisableRender = null;
            }
        }
    }
    get dimension()
    {
        return this._dimension;
    }
    set dimension(dim: number)
    {
        this._dimension = dim;
    }
    get position()
    {
        return new Vector3Mp(this._x, this._y, this._z);
    }
    set position(v3: Vector3Mp)
    {
        this._x = v3.x;
        this._y = v3.y;
        this._z = v3.z;
        SetEntityCoords(PlayerPedId(), v3.x, v3.y, v3.z, false, false, false, false);
    }
    Notification(msg: string)
    {
        TriggerEvent('draw-default-notification', msg);
    }
}