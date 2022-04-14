import { SharedConfig } from './shared-config';
import { Vector3Mp } from './vector3';

export interface FarmDatabaseInterface {
    farmId?: number;
    ownerIdentifier: string;
    ownerName: string;
    price: number;
    x: number;
    y: number;
    z: number;
    img: string;
    name: string;
    locked: boolean;
    milk: number;
    egg: number;
    meal: number;
}

export interface PlayerSharedVariables {}

export interface ObjectSharedVariables {
    waterAmount: number;
    foodAmount: number;
    waterTip: boolean;
    waterTipActive: boolean;
    shitAmount: number;
    raycastName: string;
    constantName: string;
}

export interface ObjectDataInterface {
    id?: number;
    model: string;
    position: Vector3Mp;
    dimension: number;
    collision?: boolean;
    alpha?: number;
    freezed?: boolean;
    rotation?: Vector3Mp;
    variables?: Partial<ObjectSharedVariables>;
}

export interface EventTriggerInterface {
    data: any;
    event: string;
}

export interface BuyDataInterface {
    image?: string;
    texts: Array<{
        header: string;
        entries: Array<{ question: string; answer: string }>;
    }>;
    buttons: Array<{
        header: string;
        entries: Array<{ name: string; event: string; args: any }>;
    }>;
}

export interface ModalDataInterface {
    question: string;
    icon?: string;
    buttons: Array<{ name: string; event: string; args: any }>;
    inputs: Array<{ id: string; placeholder: string; value?: string }>;
}

export interface ModalDataButtonTriggerInterface {
    args: any;
    inputs: Array<{ id: string; placeholder: string; value: string }>;
}

export interface UpgradeInterface {
    id: string;
    name: string;
    cameraPosition: Vector3Mp;
    cameraRotation: Vector3Mp;
    cameraFov: number;
    upgrades: UpgradeEntryInterface[];
    animals: AnimalEntryInterface[];
    maximumAnimals: number;
}

export interface AnimalEntryInterface {
    animalType: AnimalTypes;
    name: string;
    price: number;
    img: string;
    description: string;
    buyEvent: string;
    buyEventArgs: any;
}

export type AnimalTypes = keyof typeof SharedConfig.Animals;

export interface UpgradeEntryInterface {
    upgradeStrid: string;
    img: string;
    name: string;
    price: number;
    description: string;
    has?: boolean;
    buyEvent: string;
    buyEventArgs: any;
    position: Vector3Mp;
    rotation: Vector3Mp;
    model: string;
}

export interface UpgradeData {
    model: string;
    farmId: number;
    paddockStrid: string;
    upgradeStrid: string;
    price: number;
    position: Vector3Mp;
    rotation: Vector3Mp;
}

export interface PedDataInterface {
    id?: number;
    position: Vector3Mp;
    dimension: number;
    model: string;
    heading: number;
    dead: boolean;
    variables: Partial<PedSharedVariables>;
}

export interface PedSharedVariables {}

export interface RGBA {
    r: number;
    g: number;
    b: number;
    a: number;
}

export interface ParticleConstructorInterface {
    id?: number;
    dict: string;
    dimension: number;
    particleName: string;
    position: Vector3Mp;
    rotation: Vector3Mp;
    scale: number;
}

export interface AnimalMenuInfos {
    animalName: string;
    animalImg: string;
    bars: Array<{ name: string; percentage: number; color: string; img: string; }>;
    buttons: Array<{ name: string; img: string; event: string; eventArgs: any; closeAfterClick?: boolean; }>
}

export interface ClickMenuInterface {
    header: string;
    buttons: Array<{
        name: string;
        icon: string;
        event: string;
        eventArgs?: any;
        closeAfterClick?: boolean;
    }>;
}

export type DisableKeyTypes = 'all' | 'some';