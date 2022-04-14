DenaliFW = exports['denalifw-core']:GetCoreObject()
local inRadialMenu = false

RegisterCommand('radialmenu', function()
	DenaliFW.Functions.GetPlayerData(function(PlayerData)
        if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() then
			openRadial(true)
			SetCursorLocation(0.5, 0.5)
		end
	end)
end)

RegisterKeyMapping('radialmenu', 'Open Radial Menu', 'keyboard', 'F1')

function setupSubItems()
    DenaliFW.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["isdead"] then
            if PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" then
                Config.MenuItems[4].items = {
                    [1] = {
                        id = 'emergencybutton2',
                        title = 'Emergencybutton',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:SendPoliceEmergencyAlert',
                        shouldClose = true,
                    },
                }
            end
        else
            if Config.JobInteractions[PlayerData.job.name] ~= nil and next(Config.JobInteractions[PlayerData.job.name]) ~= nil then
                Config.MenuItems[4].items = Config.JobInteractions[PlayerData.job.name]
            else
                Config.MenuItems[4].items = {}
            end
        end
    end)

    local Vehicle = GetVehiclePedIsIn(PlayerPedId())

    if Vehicle ~= nil or Vehicle ~= 0 then
        local AmountOfSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Vehicle))

        if AmountOfSeats == 2 then
            Config.MenuItems[3].items[3].items = {
                [1] = {
                    id    = -1,
                    title = 'Driver',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [2] = {
                    id    = 0,
                    title = 'Passenger',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        elseif AmountOfSeats == 3 then
            Config.MenuItems[3].items[3].items = {
                [4] = {
                    id    = -1,
                    title = 'Driver',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [1] = {
                    id    = 0,
                    title = 'Passenger',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [3] = {
                    id    = 1,
                    title = 'Other',
                    icon = 'caret-down',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        elseif AmountOfSeats == 4 then
            Config.MenuItems[3].items[3].items = {
                [4] = {
                    id    = -1,
                    title = 'Driver',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [1] = {
                    id    = 0,
                    title = 'Passenger',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [3] = {
                    id    = 1,
                    title = 'Rear Left',
                    icon = 'caret-down',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [2] = {
                    id    = 2,
                    title = 'Rear Right',
                    icon = 'caret-down',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        end
    end
end

function openRadial(bool)
    setupSubItems()

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = Config.MenuItems
    })
    inRadialMenu = bool
end

function closeRadial(bool)
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData

    if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData)
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    end
end)

RegisterNetEvent('denalifw-radialmenu:client:noPlayers', function(data)
    DenaliFW.Functions.Notify('There arent any people close', 'error', 2500)
end)

RegisterNetEvent('denalifw-radialmenu:client:giveidkaart', function(data)
    -- ??
end)

RegisterNetEvent('denalifw-radialmenu:client:openDoor', function(data)
    local string = data.id
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
    local ped = PlayerPedId()
    local closestVehicle = nil

    if IsPedInAnyVehicle(ped, false) then
        closestVehicle = GetVehiclePedIsIn(ped)
    else
        closestVehicle = getNearestVeh()
    end

    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local plate = DenaliFW.Functions.GetPlate(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('denalifw-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('denalifw-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        DenaliFW.Functions.Notify('There is no vehicle in sight...', 'error', 2500)
    end
end)

    RegisterNetEvent('denalifw-radialmenu:client:setExtra')
    AddEventHandler('denalifw-radialmenu:client:setExtra', function(data)
    local string = data.id
    local replace = string:gsub("extra", "")
    local extra = tonumber(replace)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    local enginehealth = 1000.0
    local bodydamage = 1000.0
    
    if veh ~= nil then
        local plate = GetVehicleNumberPlateText(closestVehicle)
    
        if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            if DoesExtraExist(veh, extra) then 
                if IsVehicleExtraTurnedOn(veh, extra) then
                    enginehealth = GetVehicleEngineHealth(veh)
                    bodydamage = GetVehicleBodyHealth(veh)
                    SetVehicleExtra(veh, extra, 1)
                    SetVehicleBodyHealth(veh, bodydamage)
                    DenaliFW.Functions.Notify('Extra ' .. extra .. ' Deactivated', 'error', 2500)
                else
                    enginehealth = GetVehicleEngineHealth(veh)
                    bodydamage = GetVehicleBodyHealth(veh)
                    SetVehicleExtra(veh, extra, 0)
                    SetVehicleBodyHealth(veh, bodydamage)
                    DenaliFW.Functions.Notify('Extra ' .. extra .. 'Activated', 'success', 2500)
                end
            else
                DenaliFW.Functions.Notify('Extra ' .. extra .. ' No Extra Available ', 'error', 2500)
            end
        else
            DenaliFW.Functions.Notify('You are not the driver', 'error', 2500)
        end
    end
    end)

RegisterNetEvent('denalifw-radialmenu:trunk:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh ~= 0 then
        local pl = DenaliFW.Functions.GetPlate(veh)

        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

local Seats = {
    ["-1"] = "Driver's Seat",
    ["0"] = "Passenger's Seat",
    ["1"] = "Rear Left Seat",
    ["2"] = "Rear Right Seat",
}

RegisterNetEvent('denalifw-radialmenu:client:ChangeSeat', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local IsSeatFree = IsVehicleSeatFree(Veh, data.id)
    local speed = GetEntitySpeed(Veh)
    local HasHarnass = exports['denalifw-smallresources']:HasHarness()
    if not HasHarnass then
        local kmh = (speed * 3.6);

        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(PlayerPedId(), Veh, data.id)
                DenaliFW.Functions.Notify('You are now on the  '..data.title..'!')
            else
                DenaliFW.Functions.Notify('This vehicle is going too fast..')
            end
        else
            DenaliFW.Functions.Notify('This seat is occupied..')
        end
    else
        DenaliFW.Functions.Notify('You have a race harness on you cant switch..', 'error')
    end
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
RegisterCommand('livery', function(source, args)
	
    local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
        local liveryID = tonumber(args[1])
        
        SetVehicleLivery(Veh, liveryID)
    end, false)

RegisterNetEvent("denalifw-radialmenu:client:enter:radio")
AddEventHandler("denalifw-radialmenu:client:enter:radio",function(RadioNumber)
    DenaliFW.Functions.TriggerCallback('DenaliFW:HasItem', function(HasItem)
        if HasItem then
            exports["pma-voice"]:setRadioChannel(1)
        else
            DenaliFW.Functions.Notify("No access..", "error", 4500)
        end
    end, "radio")
end)
RegisterNetEvent("denalifw-radialmenu:client:enter:radio2")
AddEventHandler("denalifw-radialmenu:client:enter:radio2",function(RadioNumber)
    DenaliFW.Functions.TriggerCallback('DenaliFW:HasItem', function(HasItem)
        if HasItem then
            exports["pma-voice"]:setRadioChannel(2)
        else
            DenaliFW.Functions.Notify("No access..", "error", 4500)
        end
    end, "radio")
end)
RegisterNetEvent("denalifw-radialmenu:client:enter:radio3")
AddEventHandler("denalifw-radialmenu:client:enter:radio3",function(RadioNumber)
    DenaliFW.Functions.TriggerCallback('DenaliFW:HasItem', function(HasItem)
        if HasItem then
            exports["pma-voice"]:setRadioChannel(3)
        else
            DenaliFW.Functions.Notify("No access..", "error", 4500)
        end
    end, "radio")
end)
RegisterNetEvent("denalifw-radialmenu:client:enter:radio4")
AddEventHandler("denalifw-radialmenu:client:enter:radio4",function(RadioNumber)
    DenaliFW.Functions.TriggerCallback('DenaliFW:HasItem', function(HasItem)
        if HasItem then
            exports["pma-voice"]:setRadioChannel(4)
        else
            DenaliFW.Functions.Notify("No access..", "error", 4500)
        end
    end, "radio")
end)
RegisterNetEvent("denalifw-radialmenu:client:enter:radio11")
AddEventHandler("denalifw-radialmenu:client:enter:radio11",function(RadioNumber)
    DenaliFW.Functions.TriggerCallback('DenaliFW:HasItem', function(HasItem)
        if HasItem then
            exports["pma-voice"]:setRadioChannel(11)
        else
            DenaliFW.Functions.Notify("No access..", "error", 4500)
        end
    end, "radio")
end)