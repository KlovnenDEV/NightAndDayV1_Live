DenaliFW = exports['denalifw-core']:GetCoreObject()

-- All the locals don't touch these else it will not work
local PlayerJob = {}
local VehicleHack = false
local location = 0
local VinBusy = false
local ongoing = false
local gps = false
local CanVinScratch = false
local FirstHack = false
local listen = false
local tier = ""
local job = ''
local BoostingRep = 0
local UseComputer = false
local copsCalled = false
local carspawn = false
local VehicleGPSCD = Config.StartCD
local Menus = { vinscratch = { text = "[E] Scratch Vehicle" } }

CurrentCops = 0

-- Down from this line comes all the CODE do NOT edit if you do NOT know what you are doing

-- Job Update and checks
RegisterNetEvent('DenaliFW:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent('DenaliFW:Client:OnPlayerLoaded', function()
    PlayerJob = DenaliFW.Functions.GetPlayerData().job
    onDuty = true
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

CreateThread(function()
    Wait(500)
    if DenaliFW.Functions.GetPlayerData() ~= nil then
        PlayerJob = DenaliFW.Functions.GetPlayerData().job
        onDuty = true
    end
end)

CreateThread(function()
    Wait( 10 * (60*1000))
    if carspawn == true then
        carspawn = false
    end
end)
-- Ped Menus

-- Nathaniel's menu to start the job
RegisterNetEvent('denalifw-vinscratch:StartMenu', function()
    local PlayerData = DenaliFW.Functions.GetPlayerData()
    BoostingRep = PlayerData.metadata["boostingrep"]
    
    if Config.Menu == "qb" then 
        if BoostingRep >= Config.VinRep then 
            exports['denalifw-menu']:openMenu({
                {
                    header = "Nathaniel",
                    txt = BoostingRep.." Reputation"
                },
                {
                    header = "Job",
                    txt = "Car boosting Job",
                    params = {
                        event = "denalifw-vinscratch:StartBoostingJob",
                        args = {
                            number = 1,
                            id = 2
                        }
                    }
                },
                {
                    header = "Job",
                    txt = "Vinscratch Job",
                    params = {
                        event = "denalifw-vinscratch:startvinjob",
                    }
                },
            })
        else 
            exports['denalifw-menu']:openMenu({
                {
                    header = "Nathaniel",
                    txt = BoostingRep.." Reputation"
                },
                {
                    header = "Job",
                    txt = "Car boosting Job",
                    params = {
                        event = "denalifw-vinscratch:StartBoostingJob",
                    }
                },
            })
        end
    elseif Config.Menu == "nh" then 
        if BoostingRep >= Config.VinRep then 
            TriggerEvent('nh-context:sendMenu', {
                {
                    id = 1,
                    header = "Nathaniel",
                    txt = BoostingRep.." Reputation"
                },
                {
                    id = 2,
                    header = "Job",
                    txt = "Car boosting Job",
                    params = {
                        event = "denalifw-vinscratch:StartBoostingJob",
                        args = {
                            number = 1,
                            id = 2
                        }
                    }
                },
                {
                    id = 3,
                    header = "Job",
                    txt = "Vinscratch Job",
                    params = {
                        event = "denalifw-vinscratch:startvinjob",
                        args = {
                            number = 1,
                            id = 2
                        }
                    }
                },
            })
        else 
            TriggerEvent('nh-context:sendMenu', {
                {
                    id = 1,
                    header = "Nathaniel",
                    txt = BoostingRep.." Reputation"
                },
                {
                    id = 2,
                    header = "Job",
                    txt = "Car boosting Job",
                    params = {
                        event = "denalifw-vinscratch:StartBoostingJob",
                        args = {
                            number = 1,
                            id = 2
                        }
                    }
                },
            })
        end
    end
end)

-- Event to start vin scratch job
RegisterNetEvent('denalifw-vinscratch:startvinjob', function()
    DenaliFW.Functions.TriggerCallback('denalifw-vinscratching:server:IsVinScratchBusy', function(isBusy)
        local PlayerData = DenaliFW.Functions.GetPlayerData()
        if CurrentCops >= Config.MinCopsVin then
            if PlayerData.money.cash >= Config.StartPrice then
                local ped = PlayerPedId()
                TriggerEvent('animations:client:EmoteCommandStart', {"crossarms2"})
                if not isBusy then
                    DenaliFW.Functions.Progressbar("denalifw-vinscratching:StartMeBar", "Talking to Nathaniel", 10000, false, false, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        job = 'vinscratch'
                        TriggerServerEvent('denalifw-vinscratch:server:MoneyCheck', job)
                        ClearPedTasks(ped)
                    end)
                else
                    DenaliFW.Functions.Notify("I Have no jobs for you right now...", "error", 4500) 
                end
            else 
                DenaliFW.Functions.Notify("I don't wanna speak with you", "error", 4500) 
            end
        else 
            DenaliFW.Functions.Notify("Not enough cops on...", "error", 4500) 
        end
    end)
end)

-- Boosting Job Start, also checks whether or not Boosting is busy
RegisterNetEvent('denalifw-vinscratch:StartBoostingJob', function()
    DenaliFW.Functions.TriggerCallback('denalifw-vinscratching:server:IsBoostingBusy', function(isBusy)
        local PlayerData = DenaliFW.Functions.GetPlayerData()
        if CurrentCops >= Config.MinCops then
            if PlayerData.money.cash >= Config.StartPrice then
                local ped = PlayerPedId()
                TriggerEvent('animations:client:EmoteCommandStart', {"crossarms2"})
                if not isBusy then
                    DenaliFW.Functions.Progressbar("denalifw-vinscratching:StartMeBar", "Talking to Nathaniel", 10000, false, false, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        job = 'boosting'
                        TriggerServerEvent('denalifw-vinscratch:server:MoneyCheck', job)
                        ClearPedTasks(ped)
                    end)
                else
                    DenaliFW.Functions.Notify("I Have no jobs for you right now...", "error", 4500) 
                end
            else 
                DenaliFW.Functions.Notify("I don't wanna speak with you", "error", 4500) 
            end
        else 
            DenaliFW.Functions.Notify("Not enough cops on...", "error", 4500) 
        end
    end)
end)


-- Server callback that starts the actual job
RegisterNetEvent('denalifw-vinscratch:RecievingJob', function()
    if location == 0 then
        if job == 'vinscratch' then
            local PlayerData = DenaliFW.Functions.GetPlayerData()
            BoostingRep = PlayerData.metadata["boostingrep"]
                local chance 
                if BoostingRep < Config.VinSkipC then 
                    chance = math.random(1, 100)
                elseif BoostingRep >=Config.VinSkipC and BoostingRep <= Config.VinSkipB then 
                    chance = math.random(Config.CCarChance, 100)
                elseif BoostingRep >= Config.VinSkipB then 
                    chance = math.random(Config.BCarChance, 100)
                end
                Wait(500)
            if chance <= Config.CCarChance then
                    location = math.random(1,Config.MaxCLocations) -- location = math.random(1,20) - C Tier
                    tier = "C"
            elseif chance >= Config.CCarChance+1 and chance < Config.BCarChance then -- 10%
                    location = math.random(1,Config.MaxBLocations)  -- location = math.random(11,20) -- B Tier
                    tier = "B"
            elseif chance >= Config.BCarChance+1 and chance < Config.ACarChance then -- 5%
                    location = math.random(1,Config.MaxALocations)  -- location = math.random(21,30) -- A Tier
                    tier = "A"
            elseif chance >= Config.ACarChance+1 and Config.SCarChance < 1980 then -- 4%
                    location = math.random(1,Config.MaxSLocations)  -- location = math.random(31,40) -- S Tier
                    tier = "S"
            elseif chance >= Config.SCarChance+1 and chance <= Config.SPCarChance then -- 1%
                    location = math.random(1,Config.MaxSPLocations)  -- location = math.random(41,50) -- S+ Tier
                    tier = "S+"
            end
            TriggerEvent("denalifw-vinscratch:startmail", location, tier)
            VinBusy = true
        elseif job == 'boosting' then 
            local chance = math.random(1,100)
                if chance <= Config.CCarChance then
                    location = math.random(1,Config.MaxCLocations) -- location = math.random(1,20) - C Tier
                    tier = "C"
                elseif chance >= Config.CCarChance+1 and chance < Config.BCarChance then -- 10%
                    location = math.random(1,Config.MaxBLocations)  -- location = math.random(11,20) -- B Tier
                    tier = "B"
                elseif chance >= Config.BCarChance+1 and chance < Config.ACarChance then -- 5%
                    location = math.random(1,Config.MaxALocations)  -- location = math.random(21,30) -- A Tier
                    tier = "A"
                elseif chance >= Config.ACarChance+1 and Config.SCarChance < 1980 then -- 4%
                    location = math.random(1,Config.MaxSLocations)  -- location = math.random(31,40) -- S Tier
                    tier = "S"
                elseif chance >= Config.SCarChance+1 and chance <= Config.SPCarChance then -- 1%
                    location = math.random(1,Config.MaxSPLocations)  -- location = math.random(41,50) -- S+ Tier
                    tier = "S+"
                end
            TriggerEvent("denalifw-vinscratch:startmail", location, tier)
            VinBusy = true
        end
    else 
        DenaliFW.Functions.Notify("You already got a job", "error", 4500)
    end
end)

-- After Recieving a location this loop will start going which will determine whether or not you are close enough
-- To start the job. 
CreateThread(function()
    while true do
        Wait(1000)
        if VinBusy then
            Wait(1000)
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dist
            if tier == "C" then
                dist = #(pos - vector3(Config.CLocations[location].vehiclepos.x, Config.CLocations[location].vehiclepos.y, Config.CLocations[location].vehiclepos.z))
            elseif tier == "B" then 
                dist = #(pos - vector3(Config.BLocations[location].vehiclepos.x, Config.BLocations[location].vehiclepos.y, Config.BLocations[location].vehiclepos.z))
            elseif tier == "A" then  
                dist = #(pos - vector3(Config.ALocations[location].vehiclepos.x, Config.ALocations[location].vehiclepos.y, Config.ALocations[location].vehiclepos.z))
            elseif tier == "S" then 
                dist = #(pos - vector3(Config.SLocations[location].vehiclepos.x, Config.SLocations[location].vehiclepos.y, Config.SLocations[location].vehiclepos.z))
            elseif tier == "S+" then 
                dist = #(pos - vector3(Config.SPLocations[location].vehiclepos.x, Config.SPLocations[location].vehiclepos.y, Config.SPLocations[location].vehiclepos.z))
            end
            Wait(1)
            if dist <= 100 then 
                if carspawn == false then 
                    if tier == "C" then
                        SpawnVehicle(Config.CLocations[location].vehicle, Config.CLocations[location].vehiclepos.x, Config.CLocations[location].vehiclepos.y, Config.CLocations[location].vehiclepos.z, Config.CLocations[location].vehiclepos.h)
                    elseif tier == "B" then 
                        SpawnVehicle(Config.BLocations[location].vehicle, Config.BLocations[location].vehiclepos.x, Config.BLocations[location].vehiclepos.y, Config.BLocations[location].vehiclepos.z, Config.BLocations[location].vehiclepos.h)
                    elseif tier == "A" then  
                        SpawnVehicle(Config.ALocations[location].vehicle, Config.ALocations[location].vehiclepos.x, Config.ALocations[location].vehiclepos.y, Config.ALocations[location].vehiclepos.z, Config.ALocations[location].vehiclepos.h)
                    elseif tier == "S" then 
                        SpawnVehicle(Config.SLocations[location].vehicle, Config.SLocations[location].vehiclepos.x, Config.SLocations[location].vehiclepos.y, Config.SLocations[location].vehiclepos.z, Config.SLocations[location].vehiclepos.h)
                    elseif tier == "S+" then 
                        SpawnVehicle(Config.SPLocations[location].vehicle, Config.SPLocations[location].vehiclepos.x, Config.SPLocations[location].vehiclepos.y, Config.SPLocations[location].vehiclepos.z, Config.SPLocations[location].vehiclepos.h)
                    end
                    carspawn = true 
                end
            end

            if dist <= 15 then
                if not copsCalled then 
                    local veh = DenaliFW.Functions.GetClosestVehicle()
                    local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
                    local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
                    local street1 = GetStreetNameFromHashKey(s1)
                    local street2 = GetStreetNameFromHashKey(s2)
                    local streetLabel = street1
                    if street2 ~= nil then 
                        streetLabel = streetLabel .. " " .. street2
                    end
                    TriggerServerEvent("denalifw-vinscratch:server:callCops", streetLabel, pos, job, LicensePlate, vehname)
                    copsCalled = true
                end
                if dist <= 5 then
                    Wait(1000)
                    spawnPed(tier)
                    VinBusy = false
                    local veh = GetVehiclePedIsIn(ped, false)
                    if GetVehicleNumberPlateText(veh) ~= LicensePlate then
                        if job == 'boosting' then
                            local TrackerChance = math.random(1,100)
                            if TrackerChance <= 10 then 
                                copsCalled = false
                                RemoveBlip(blip)
                                ongoing = true
                                gps = true
                                TriggerEvent('denalifw-vinscratch:marker')
                                DenaliFW.Functions.Notify("There is a Tracker in the vehicle", "error", 4500)
                                Wait(15000)
                                DenaliFW.Functions.Notify("There is a Tracker in the vehicle", "error", 4500)
                            else 
                                copsCalled = false
                                RemoveBlip(blip)
                                Wait(1000)
                                DenaliFW.Functions.Notify("Go turn in the vehicle to finish the job!", "error", 4500)
                                Wait(1000)
                                CreateHandoffBlip()
                                SetNewWaypoint(Config.TurnInLocation.x, Config.TurnInLocation.y)
                            end
                        elseif job == 'vinscratch' then
                            copsCalled = false
                            RemoveBlip(blip)
                            ongoing = true
                            gps = true
                            TriggerEvent('denalifw-vinscratch:marker')
                            DenaliFW.Functions.Notify("There is a Tracker in the vehicle", "error", 4500)
                        end
                    end
                end
            end
        end
    end
end)

-- Once in distance the Peds will start spawning with weapons etc.
function spawnPed(tier)
    if tier == "C" then
        local pedtype = Config.CLocations[location].ped
        local weapon = Config.CLocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Wait(100)
        end

        for k, v in pairs(Config.CLocations[location].coords) do
            local spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.CLocations[location].vehiclepos.x, Config.CLocations[location].vehiclepos.y, Config.CLocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    elseif tier == "B" then
        local pedtype = Config.BLocations[location].ped
        local weapon = Config.BLocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Wait(100)
        end

        for k, v in pairs(Config.BLocations[location].coords) do
            local spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.BLocations[location].vehiclepos.x, Config.BLocations[location].vehiclepos.y, Config.BLocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    elseif tier == "A" then
        local pedtype = Config.ALocations[location].ped
        local weapon = Config.ALocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Wait(100)
        end

        for k, v in pairs(Config.ALocations[location].coords) do
            local spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.ALocations[location].vehiclepos.x, Config.ALocations[location].vehiclepos.y, Config.ALocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    elseif tier == "S" then
        local pedtype = Config.SLocations[location].ped
        local weapon = Config.SLocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Wait(100)
        end

        for k, v in pairs(Config.SLocations[location].coords) do
            local spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.SLocations[location].vehiclepos.x, Config.SLocations[location].vehiclepos.y, Config.SLocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    elseif tier == "S+" then
        local pedtype = Config.SPLocations[location].ped
        local weapon = Config.SPLocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Wait(100)
        end

        for k, v in pairs(Config.SPLocations[location].coords) do
            local spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.SPLocations[location].vehiclepos.x, Config.SPLocations[location].vehiclepos.y, Config.SPLocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    end
end 

-- Function to spawn the vehicle, and send the email and Blip
function SpawnVehicle(vehicle, x, y, z, h)
    local coords = vector4(x, y, z, h)
    DenaliFW.Functions.SpawnVehicle(vehicle, function(veh)
        SetEntityHeading(veh, coords.w)
        SetVehicleEngineOn(veh, false, false)
        SetVehicleOnGroundProperly(veh)
        SetVehicleNeedsToBeHotwired(veh, false)
        SetVehicleDoorsLocked(veh, 2)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        for i = 0, 5 do
            SetVehicleDoorShut(veh, i, true)
        end
        LicensePlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

RegisterNetEvent('denalifw-vinscratch:startmail', function(location, tier)
    local vehicle
    local coordsproblipx, coordsproblipy
    if tier == "C" then 
        vehicle = Config.CLocations[location].vehicle
        coordsproblipx = Config.CLocations[location].vehiclepos.x
        coordsproblipy = Config.CLocations[location].vehiclepos.y
    elseif tier == "B" then
        vehicle = Config.BLocations[location].vehicle
        coordsproblipx = Config.BLocations[location].vehiclepos.x
        coordsproblipy = Config.BLocations[location].vehiclepos.y
    elseif tier == "A" then 
        vehicle = Config.ALocations[location].vehicle
        coordsproblipx = Config.ALocations[location].vehiclepos.x
        coordsproblipy = Config.ALocations[location].vehiclepos.y
    elseif tier == "S" then 
        vehicle = Config.SLocations[location].vehicle
        coordsproblipx = Config.SLocations[location].vehiclepos.x
        coordsproblipy = Config.SLocations[location].vehiclepos.y
    elseif tier == "S+" then 
        vehicle = Config.SPLocations[location].vehicle
        coordsproblipx = Config.SPLocations[location].vehiclepos.x
        coordsproblipy = Config.SPLocations[location].vehiclepos.y
    end
    DenaliFW.Functions.Notify('I will send some information to your email.', 'success')
    Wait(math.random(15000,30000))
    TriggerServerEvent('denalifw-phone:server:sendNewMail', {
        sender = "Nathaniel",
        subject = "Vehicle Located",
        message = "Yo<br><br> One of my scouters found a<br><b>" .. vehicle .. "<br><br>I sent you the cars approximate location to your GPS go find it.<br><br><b>Nathaniel</b>",
    })
    CreateBlip(coordsproblipx, coordsproblipy)
end)

-- Creates the blip for the car
function CreateBlip(coordsproblipx, coordsproblipy)
    coordsproblipx = coordsproblipx + math.random(-75.0, 75.0)
    coordsproblipy = coordsproblipy + math.random(-75.0, 75.0)
    
    blip = AddBlipForRadius(coordsproblipx, coordsproblipy, 0.0, 100.0)
    SetBlipSprite(blip, 9)
    SetBlipColour(blip, 38)
    SetBlipAlpha(blip, 80)
end

function CreateScratchBlip()
    ScratchBlip = AddBlipForCoord(Config.ScratchBlip.x, Config.ScratchBlip.y, Config.ScratchBlip.z)
    SetBlipSprite(ScratchBlip, 289)
    SetBlipDisplay(ScratchBlip, 4)
    SetBlipScale(ScratchBlip, 0.6)
    SetBlipColour(ScratchBlip, 60)
    SetBlipAsShortRange(ScratchBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Scratch Location")
    EndTextCommandSetBlipName(ScratchBlip)
end

function CreateHandoffBlip()
    HandOffBlip = AddBlipForCoord(Config.TurnInLocation.x, Config.TurnInLocation.y, Config.TurnInLocation.z)
    SetBlipSprite(HandOffBlip, 289)
    SetBlipDisplay(HandOffBlip, 4)
    SetBlipScale(HandOffBlip, 0.6)
    SetBlipColour(HandOffBlip, 60)
    SetBlipAsShortRange(HandOffBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Handoff Location")
    EndTextCommandSetBlipName(HandOffBlip)
end

-- Vehicle Blips Cooldown Trigger
RegisterNetEvent('denalifw-vinscratch:vehiclechipCD', function()
    local timer = math.random(1000,4000)
    local seconds = math.ceil(timer/1000)
    VehicleGPSCD = VehicleGPSCD + timer
    DenaliFW.Functions.Notify("You have delayed the tracker by another "..seconds.." seconds", "success", 4500)
end)

-- The actual marker that marks stuff once entering the Vehicle
RegisterNetEvent('denalifw-vinscratch:marker', function()
	while ongoing do
        Wait(100)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        local platetex4k = GetVehicleNumberPlateText(vehicle)
        if IsPedSittingInVehicle(ped, vehicle) then
            if platetex4k == LicensePlate then
                if not VehicleHack then 
                    VehicleHack = true
                end
                local cveh = GetVehiclePedIsIn(ped, false)
                local coord = GetEntityCoords(cveh)
                if gps then
                    if VehicleGPSCD <= Config.MaxCD then 
                        TriggerServerEvent('denalifw-vinscratch:gps',coord)
                        Wait(VehicleGPSCD)
                    end
                end
            else
                ongoing = false
                DenaliFW.Functions.Notify("You exited the vehicle job canceled", "error", 4500)
                TriggerServerEvent('denalifw-vinscratch:server:JobPunishment')
                TriggerEvent('denalifw-vinscratch:client:resetjob')
            end
        end
	end
end)

-- Vehicle blip that got returned from server side to link between all client
RegisterNetEvent('denalifw-vinscratch:vehblip', function(targetCoords)
	if PlayerJob.name == "police" and onDuty or PlayerJob.name == "BCSO" and onDuty or PlayerJob.name == "sast" and onDuty then 

        local vehBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 35.0)
        SetBlipHighDetail(vehBlip, true)
        SetBlipColour(vehBlip, 1)
        SetBlipAsShortRange(vehBlip, true)
        Wait(VehicleGPSCD+50)
        RemoveBlip(vehBlip)
	end
end)

-- The hack that can remove the chip from PD radars
RegisterNetEvent('denalifw-vinscratch:client:trackremover', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local platetex4k = GetVehicleNumberPlateText(vehicle)
        if platetex4k == LicensePlate and VehicleHack and ongoing then
            if VehicleGPSCD <= Config.MaxCD then
                if not FirstHack then
                    local ped = PlayerPedId()
                    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
                    DenaliFW.Functions.Progressbar("QBVinAttatchDevice", "Attatching Hacking Device", 12000, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        ClearPedTasks(ped)
                        FirstHack = true
                        TriggerEvent("mhacking:show")
                        TriggerEvent("mhacking:start", math.random(Config.HackLengthMin, Config.HackLengthMax), math.random(Config.HackSecondsMin, Config.HackSecondsMax), OnHackDone)
                    end)
                else
                    TriggerEvent("mhacking:show")
                    TriggerEvent("mhacking:start", math.random(Config.HackLengthMin, Config.HackLengthMax), math.random(Config.HackSecondsMin, Config.HackSecondsMax), OnHackDone)
                end
            else
                local ped = PlayerPedId()
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
                DenaliFW.Functions.Progressbar("VinScratchHackDone", "Removing hacking device...", 9000, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    ClearPedTasks(ped)
                    DenaliFW.Functions.Notify("The tracker has overheated! Police no longer sees you!", "success", 4500)
                    Wait(10000)
                    CreateScratchBlip()
                    DenaliFW.Functions.Notify("Scratch location is marked in your GPS", "success", 4500)
                    UseComputer = true
                    VehicleHack = false
                    FirstHack = false
                    ongoing = false
                    gps = false
                    SetNewWaypoint(Config.ScratchBlip.x, Config.ScratchBlip.y)
                    Wait(15000)
                    DenaliFW.Functions.Notify("You can also go hand it off for money!", "success", 4500)
                    CreateHandoffBlip()
                end)
            end
        end
end)

-- Police alert function used to alert all active police on Duty
RegisterNetEvent('denalifw-vinscratch:client:robberyCall', function(streetLabel, coords, LicensePlate, vehname)
    if PlayerJob.name == "police" and onDuty or PlayerJob.name == "bcso" and onDuty or PlayerJob.name == "sast" and onDuty then
        local msg = vehname.." is getting Robbed"
        local LplateMSG = "License Plate "..LicensePlate
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('chatMessage', "ALARM", "warning", "Vinscratch robbery")
         TriggerEvent('denalifw-policealerts:client:AddPoliceAlert', {
            timeOut = 15000,
            alertTitle = "Advanced Vehicle Robbery",
            coords = {
                 x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = {
                [1] = {
                     icon = '<i class="fas fa-car"></i>',
                    detail = msg,
                },
                [2] = {
                    icon = '<i class="fas fa-car"></i>',
                    detail = LplateMSG,
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = DenaliFW.Functions.GetPlayerData().metadata["callsign"],
        })

        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 227)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.9)
        SetBlipFlashes(blip, true)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911: vinscratch")
        EndTextCommandSetBlipName(blip)
            
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                 SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

-- Use to reset job if the vinscratch fails reset all triggers so client does NOT need to restart before doing it again
RegisterNetEvent('denalifw-vinscratch:client:resetjob', function()
    VehicleHack = false
    location = 0
    VinBusy = false
    gps = false 
    ongoing = false
    CanVinScratch = false
    FirstHack = false 
    UseComputer = false
    copsCalled = false
    copsCalled = false
    RemoveBlip(blip)
    RemoveBlip(ScratchBlip)
    RemoveBlip(HandOffBlip)
    job = ''
    tier = ""
end)

-- First Event being called from BT target when using computer to setup for the vinscratch
RegisterNetEvent('denalifw-vinscratch:client:DataStuff', function()
    if UseComputer then
        local ped = PlayerPedId()
        SetEntityCoords(ped, -230.29, -2661.85, 5.0)
        SetEntityHeading(ped, 85.78)
        TriggerEvent('animations:client:EmoteCommandStart', {"type"})
        DenaliFW.Functions.Progressbar("ClearDataVin", "Wiping Online Paperwork...", 9000, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('denalifw-vinscratch:client:ReplaceData')
        end)
    else 
        DenaliFW.Functions.Notify("You can't use this Computer!", "error", 4500)
    end
end)

-- Second event that replaces data in the vehicle
RegisterNetEvent('denalifw-vinscratch:client:ReplaceData', function()
    if UseComputer then
        local ped = PlayerPedId()
        SetEntityCoords(ped, -230.29, -2661.85, 5.0)
        SetEntityHeading(ped, 85.78)
        TriggerEvent('animations:client:EmoteCommandStart', {"type2"})
        DenaliFW.Functions.Progressbar("ReplacingDataVinS", "Making a false document...", 6500, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            ClearPedTasks(ped)
            DenaliFW.Functions.Notify("All data has been replaced go scratch the vehicle!", "success", 4500)
            RemoveBlip(ScratchBlip)
            CanVinScratch = true
            UseComputer = false
        end)
    end
end)

-- Event that starts listening for control using PolyzoneHelper
local function startListening4Control()
    listen = true
    CreateThread(function()
        while listen do
            if IsControlJustReleased(0, 38) then -- E
                if Config.RequiredItem then
                    DenaliFW.Functions.TriggerCallback('denalifw-vinscratch:server:GetItem', function(hasItem)
                        if hasItem then
                            TriggerEvent('denalifw-vinscratch:ScratchTheVin')
                        else 
                            DenaliFW.Functions.Notify("You have nothing to scratch the vin with!", "error", 4500)
                        end
                    end, Config.RareItem)
                else 
                    TriggerEvent('denalifw-vinscratch:ScratchTheVin')
                end
            end
            Wait(0)
        end
    end)
end

-- The scratch event itself DO NOT touch this if you do NOT know what you are doing
RegisterNetEvent('denalifw-vinscratch:ScratchTheVin', function()
    local ped = PlayerPedId()

    local vehicleHash = DenaliFW.Functions.GetClosestVehicle()
    local vehicle = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleHash)):lower()
    local TextMe = GetVehicleNumberPlateText(vehicleHash)
    if TextMe == LicensePlate then
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel3"})
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        DenaliFW.Functions.Progressbar("denalifw-vinscratch:removingVin", "Scratching Vin", 14000, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            ClearPedTasks(ped)
            CanVinScratch = false
            TriggerServerEvent('denalifw-vinscratch:server:GetVehicleWhenDone', vehicle, LicensePlate, job)
            location = 0
            DenaliFW.Functions.Notify("The car is yours! GO park it so the Police don't catch you!", "success", 5500)
            TriggerEvent('denalifw-vinscratch:client:resetjob')
            Wait(math.random(10000,15000))
            TriggerServerEvent('denalifw-phone:server:sendNewMail', {
                sender = "Nathaniel",
                subject = "Congrats!",
                message = "Yo<br><br> I heard you got the <br><b>Vehicle</b> <br><br>But be carefull I heard PD is still looking for it so be Carefull!<br><b><br><br><b>Nathaniel</b>",
            })
        end)
    else
        DenaliFW.Functions.Notify("This is NOT the right vehicle", "error", 4500) 
    end
end)


-- Function to get money and potential rare item during a job
RegisterNetEvent('denalifw-vinscratch:GetMonitaryFromBoost', function()
    if job == 'vinscratch' or job == 'boosting' then 
        local veh = DenaliFW.Functions.GetClosestVehicle()
        local Closestplate = GetVehicleNumberPlateText(veh)
        local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
        if Closestplate == LicensePlate then
            local ped = PlayerPedId()
            TriggerEvent('animations:client:EmoteCommandStart', {"wait2"})
            DenaliFW.Functions.Progressbar("denalifw-vinscratch:removingVin", "Turning in Car", 8000, false, false, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                ClearPedTasks(ped)
                local damaged = GetVehicleEngineHealth(veh)

                TriggerServerEvent('denalifw-vinscratch:server:GetMonitaryReward', vehname, damaged, job, tier)

                SetEntityAsMissionEntity(veh, true, true)
                DeleteVehicle(veh)
                location = 0

                local chance = math.random(1,100)
                local hackchance = math.random(1,100)

                if chance <= Config.RareItemChance then
                    Wait(5000)
                    TriggerServerEvent('denalifw-vinscratch:server:GetRareItem', vehname, job)
                end

                if hackchance <= Config.RareItemChance then 
                    Wait(5000)
                    TriggerServerEvent('denalifw-vinscratch:server:GetHackingItem', vehname, job)
                end

                TriggerEvent('denalifw-vinscratch:client:resetjob')

            end)
        else
            DenaliFW.Functions.Notify("This is NOT the right vehicle", "error", 4500) 
        end
    else 
        DenaliFW.Functions.Notify("I don't want to speak to you!", "error", 4500) 
    end
end)

-- The rest down here is just PolyZone helper stuff
CreateThread(function()
    for k, v in pairs(Config.ScratchLocation) do
        exports["polyzonehelper"]:AddBoxZone("vinscratch", vector3(Config.ScratchLocation[k].polyzone.x, Config.ScratchLocation[k].polyzone.y, Config.ScratchLocation[k].polyzone.z), Config.ScratchLocation[k].polyzone1, Config.ScratchLocation[k].polyzone2, {
            name="vinscratch",
            heading=Config.ScratchLocation[k].heading,
            debugPoly=Config.DebugPolyzones,
            minZ = Config.ScratchLocation[k].minZ,
            maxZ = Config.ScratchLocation[k].maxZ
        }) 
    end
end)

AddEventHandler("polyzonehelper:enter", function(zone, data)
    local currentZone = Menus[zone]
    if currentZone and CanVinScratch and job == 'vinscratch' then
        exports["fjam-ui"]:showInteraction("[E] Scratch Plate", 'grey')
        startListening4Control()
        RemoveBlip(ScratchBlip)
    end
end)

AddEventHandler("polyzonehelper:exit", function(zone)
    local currentZone = Menus[zone]
    if currentZone then
        listen = false
        exports["fjam-ui"]:hideInteraction()
    end
end)

function OnHackDone(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        TriggerEvent('denalifw-vinscratch:vehiclechipCD')
    else
        TriggerEvent('mhacking:hide')
		DenaliFW.Functions.Notify("You Failed the Hack!", "error", 4500)
	end
end