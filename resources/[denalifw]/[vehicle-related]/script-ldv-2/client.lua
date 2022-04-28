local config = {}
config.intensity = 1.0
config.timeUntilReload = 100.0

local holdingfthrow2 = false
local usingfthrow2 = false
local fthrow2Model = "ldv"
local animDict = "weapons@heavy@minigun"
local animName = "idle_2_aim_right_med"
local particleDict = "core"
local particleName = "exp_hydrant"
local actionTime = 100
local fthrow2_net = nil

---------------------------------------------------------------------------
-- Toggling fthrow2 --
---------------------------------------------------------------------------
RegisterNetEvent("fthrow2:Togglefthrow2")
AddEventHandler("fthrow2:Togglefthrow2", function()
    if not holdingfthrow2 then
        RequestModel(GetHashKey(fthrow2Model))
        while not HasModelLoaded(GetHashKey(fthrow2Model)) do
            Citizen.Wait(100)
        end

        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(100)
        end

        local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
        local fthrow2spawned = CreateObject(GetHashKey(fthrow2Model), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
        Citizen.Wait(1000)
        local netid = ObjToNet(fthrow2spawned)
        SetNetworkIdExistsOnAllMachines(netid, true)
        NetworkSetNetworkIdDynamic(netid, true)
        SetNetworkIdCanMigrate(netid, false)
        AttachEntityToEntity(fthrow2spawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.54, -0.03, 0.06, 0.0, 101.0, 82.0, 1, 1, 0, 1, 0, 1)
        TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0) -- 50 = 32 + 16 + 2
        TaskPlayAnim(GetPlayerPed(PlayerId()), animDict, animName, 8.0, -1, -1, 50, 0, 0, 0, 0)
        fthrow2_net = netid
        holdingfthrow2 = true
    else
        ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
        DetachEntity(NetToObj(fthrow2_net), 1, 1)
        DeleteEntity(NetToObj(fthrow2_net))
        fthrow2_net = nil
        holdingfthrow2 = false
        usingfthrow2 = false
    end
end)

---------------------------------------------------------------------------
-- Start Particles --
---------------------------------------------------------------------------
RegisterNetEvent("fthrow2:StartParticles")
AddEventHandler("fthrow2:StartParticles", function(fthrow2id)
    local entity = NetToObj(fthrow2id)

    RequestNamedPtfxAsset(particleDict)
    while not HasNamedPtfxAssetLoaded(particleDict) do
        Citizen.Wait(100)
    end

    UseParticleFxAssetNextCall(particleDict)
    local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, 0.0, 0.0, 0.0, 75.0, 0.0, 0.0, config.intensity, false, false, false)
    SetTimeout(10000, function()
        usingfthrow2 = false
    end)
    
    --local particleEffect = StartParticleFxLoopedOnEntity(particleName, entity, -0.75, 0.005, 0.0, 180.0, -75.0, 0.0, 2.5, 0.0, 0.0, 0.0)
end)

---------------------------------------------------------------------------
-- Stop Particles --
---------------------------------------------------------------------------
RegisterNetEvent("fthrow2:StopParticles")
AddEventHandler("fthrow2:StopParticles", function(fthrow2id)
    local entity = NetToObj(fthrow2id)
    RemoveParticleFxFromEntity(entity)
end)

---------------------------------------------------------------------------
-- Get Vehicle Closest Door --
---------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        if holdingfthrow2 then
            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                TriggerEvent("fthrow2:Togglefthrow2")
            end
            for i=140, 143 do
                DisableControlAction(0, i, true)
            end
            if IsControlJustPressed(0, 24) and usingfthrow2 == false then
                Timer()
            end
        else
            for i=140, 143 do
                EnableControlAction(0, i, true)
            end
        end
        Citizen.Wait(0)
    end
end)

function Timer()
    Citizen.CreateThread(function()
        usingfthrow2 = true
        local time = config.timeUntilReload
        local count = time
        TriggerServerEvent("fthrow2:SyncStartParticles", fthrow2_net)
        while IsControlPressed(0, 24) and count > 0 do

            if not holdingfthrow2 then
                usingfthrow2 = false
                TriggerServerEvent("fthrow2:SyncStopParticles", fthrow2_net)
                return
            end
            
            Citizen.Wait(500)
            count = count - 0.5
        end
        TriggerServerEvent("fthrow2:SyncStopParticles", fthrow2_net)
        usingfthrow2 = false
    end)
end

function Notification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0, 1)
end