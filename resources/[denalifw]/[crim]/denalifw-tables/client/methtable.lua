local DenaliFW = exports['denalifw-core']:GetCoreObject()

local NeededAttempts = 0
local SucceededAttempts = 0
local FailedAttemps = 0


RegisterNetEvent("denalifw-tables:client:installmeth", function()
	InstallMeth()
end)

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(7)
    end    
end

function InstallMeth()
    local ped = PlayerPedId()
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 2.0, -1.0)
    
    LoadAnimDict('anim@amb@business@weed@weed_inspecting_lo_med_hi@')
	TaskPlayAnim(ped, 'anim@amb@business@weed@weed_inspecting_lo_med_hi@' ,'weed_crouch_checkingleaves_idle_01_inspector' ,8.0, -8.0, -1, 48, 0, false, false, false)
    exports.rprogress:Start('Setting Up Table..', 10000)
    ClearPedTasks(ped)
    Methtable = CreateObject(GetHashKey('bkr_prop_meth_table01a'), coords, true, true, true)
    TriggerServerEvent('denalifw-tables:server:Removemeth')
end

function methProcess()
    local ped = PlayerPedId()
    LoadAnimDict('anim@amb@business@weed@weed_inspecting_lo_med_hi@')
	TaskPlayAnim(ped, 'anim@amb@business@weed@weed_inspecting_lo_med_hi@' ,'weed_crouch_checkingleaves_idle_01_inspector' ,8.0, -8.0, -1, 48, 0, false, false, false)

    exports.rprogress:Start('Processing Crack...', 20000) -- 10 seconds
    TriggerServerEvent("denalifw-tables:server:getmeth")
    ClearPedTasks(ped)
end

function ProcessmethMinigame(source)
    local Skillbar = exports['denalifw-skillbar']:GetSkillbarObject()
    if NeededAttempts == 0 then
        NeededAttempts = math.random(1, 3)
    end
    local maxwidth = 30
    local maxduration = 3500
    Skillbar.Start({
        duration = math.random(2000, 3000),
        pos = math.random(10, 30),
        width = math.random(20, 30),
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            methProcess()
            DenaliFW.Functions.Notify("You make some meth!", "success")
            FailedAttemps = 0
            SucceededAttempts = 0
            NeededAttempts = 0
        else    
            SucceededAttempts = SucceededAttempts + 1
            Skillbar.Repeat({
                duration = math.random(2000, 3000),
                pos = math.random(10, 30),
                width = math.random(20, 30),
            })
        end    
	end, function()
        DenaliFW.Functions.Notify("You messed up the process!", "error")
        FailedAttemps = 0
        SucceededAttempts = 0
        NeededAttempts = 0
    end)
end

RegisterNetEvent('denalifw-tables:client:methTable', function(source)
    TriggerServerEvent("denalifw-tables:server:processmethTable")
end)

RegisterNetEvent('denalifw-tables:client:CompletemethTable', function(source)
    ProcessmethMinigame(source)
end)