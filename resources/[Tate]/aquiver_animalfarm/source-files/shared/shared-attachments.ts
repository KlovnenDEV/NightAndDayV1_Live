import { Vector3Mp } from './vector3';

export enum AttachmentNames {
    'shovel' = 'shovel',
    'shovelWithShit' = 'shovelWithShit',
    'foodBag' = 'foodBag',
    'bucketEmpty' = 'bucketEmpty',
    'bucketWithWater' = 'bucketWithWater',
    'bucketWithMilk' = 'bucketWithMilk'
}

interface AttachmentInterface {
    model: string;
    bone: number;
    pos: Vector3Mp;
    rot: Vector3Mp;
}

export const SharedAttachments: Record<AttachmentNames, AttachmentInterface> = {
    bucketEmpty: {
        model: 'avp_farm_bucket_01',
        bone: 57005,
        pos: new Vector3Mp(0.65, -0.1, 0.0),
        rot: new Vector3Mp(208.0, -85.0, -7.0),
    },
    bucketWithWater: {
        model: 'avp_farm_bucket_02',
        bone: 57005,
        pos: new Vector3Mp(0.65, -0.1, 0.0),
        rot: new Vector3Mp(208.0, -85.0, -7.0)
    },
    bucketWithMilk: {
        model: 'avp_farm_bucket_03',
        bone: 57005,
        pos: new Vector3Mp(0.65, -0.1, 0.0),
        rot: new Vector3Mp(208.0, -85.0, -7.0)
    },
    shovelWithShit: {
        model: 'avp_farm_shovel_shit',
        bone: 18905,
        pos: new Vector3Mp(0.1, 0, 0),
        rot: new Vector3Mp(0, 81, -95),
    },
    shovel: {
        model: 'avp_farm_shovel',
        bone: 18905,
        pos: new Vector3Mp(0.1, 0, 0),
        rot: new Vector3Mp(0, 81, -95),
    },
    foodBag: {
        model: 'avp_farm_animal_feed_02',
        bone: 57005,
        pos: new Vector3Mp(0.62, 0, -0.035),
        rot: new Vector3Mp(0, -90, 0)
    }
};