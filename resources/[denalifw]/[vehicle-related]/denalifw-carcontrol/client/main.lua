local DenaliFW = exports['denalifw-core']:GetCoreObject()

----- Pulls Job Data -----

local PlayerData = {}

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
	PlayerData = DenaliFW.Functions.GetPlayerData()
end)

AddEventHandler('DenaliFW:Client:OnPlayerLoaded', function()
    PlayerData = DenaliFW.Functions.GetPlayerData()
end)

RegisterNetEvent('DenaliFW:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('DenaliFW:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

----- Opens Menu ----

RegisterNetEvent('ccvehmenu:client:openMenu')
AddEventHandler('ccvehmenu:client:openMenu', function()
    if IsPedInAnyVehicle(PlayerPedId(), true) then
        createCarControlMenu()
        exports['denalifw-menu']:openMenu(ccMenu)
    else
        DenaliFW.Functions.Notify("You Are Not In A Vehicle", "error", 3500)
    end
end)

------ Window Control ---- 

RegisterNetEvent('denalifw-vehiclemenu:windowscontrol', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local args = tonumber(args)
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            if args == 1 then 
                IsVehicleWindowIntact(veh, 0)
                RollDownWindow(veh, 0)
                DenaliFW.Functions.Notify("Rolled Down Driver Window", "success", 3500)
                elseif args == 2 then 
                IsVehicleWindowIntact(veh, 1)
                RollDownWindow(veh, 1)
                DenaliFW.Functions.Notify("Rolled Down Driver Window", "success", 3500)
                elseif args == 3 then 
                IsVehicleWindowIntact(veh, 2)
                RollDownWindow(veh, 2)
                DenaliFW.Functions.Notify("Rolled Down Driver Window", "success", 3500)
                elseif args == 4 then 
                IsVehicleWindowIntact(veh, 3)
                RollDownWindow(veh, 3)
                DenaliFW.Functions.Notify("Rolled Down Driver Window", "success", 3500)
                elseif args == 5 then
                IsVehicleWindowIntact(veh, 0)
                RollUpWindow(veh, 0)
                DenaliFW.Functions.Notify("Rolled Up Driver Window", "success", 3500)
                elseif args == 6 then 
                IsVehicleWindowIntact(veh, 1)
                RollUpWindow(veh, 1)
                DenaliFW.Functions.Notify("Rolled Up Driver Window", "success", 3500)
                elseif args == 7 then 
                IsVehicleWindowIntact(veh, 2)
                RollUpWindow(veh, 2)
                DenaliFW.Functions.Notify("Rolled Up Driver Window", "success", 3500)
                elseif args == 8 then 
                IsVehicleWindowIntact(veh, 3)
                RollUpWindow(veh, 3)
                DenaliFW.Functions.Notify("Rolled Up Driver Window", "success", 3500)
                end
                TriggerEvent('ccvehmenu:client:windowsMenu')
        end
end)

------ Seat Control ------

RegisterNetEvent('denalifw-vehiclemenu:seatcontrol', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local IsSeatFree = IsVehicleSeatFree(veh, -2)
        if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
            if IsSeatFree then
                local args = tonumber(args)
                if args == 1 then 
                    IsVehicleSeatFree(veh, -1)
                    SetPedIntoVehicle(PlayerPedId(), veh, -1)
                    DenaliFW.Functions.Notify("Driver Seat", "success", 3500)
                    elseif args == 2 then 
                    IsVehicleSeatFree(veh, 0)
                    SetPedIntoVehicle(PlayerPedId(), veh, 0)
                    DenaliFW.Functions.Notify("Passenger Seat", "success", 3500)
                    elseif args == 3 then 
                    IsVehicleSeatFree(veh, 1)
                    SetPedIntoVehicle(PlayerPedId(), veh, 1)
                    DenaliFW.Functions.Notify("Rear Left Seat", "success", 3500)
                    elseif args == 4 then 
                    IsVehicleSeatFree(veh, 2)
                    SetPedIntoVehicle(PlayerPedId(), veh, 2)
                    DenaliFW.Functions.Notify("Rear Right Seat", "success", 3500)
                    elseif args == 5 then 
                    IsVehicleSeatFree(veh, 3)
                    SetPedIntoVehicle(PlayerPedId(), veh, 3)
                    DenaliFW.Functions.Notify("Back Rear Left Seat", "success", 3500)
                    elseif args == 6 then 
                    IsVehicleSeatFree(veh, 4)
                    SetPedIntoVehicle(PlayerPedId(), veh, 4)
                    DenaliFW.Functions.Notify("Back Rear Right Seat", "success", 3500)
                    elseif args == 0 or nil then
                    DenaliFW.Functions.Notify("Select a Proper Seat", "error", 3500)
                    end
                    TriggerEvent('ccvehmenu:client:seatsMenu')
                end
            elseif IsSeatFree == false then
                DenaliFW.Functions.Notify('This seat is occupied..')
                TriggerEvent('ccvehmenu:client:seatsMenu')
            end
        if veh == false then
            DenaliFW.Functions.Notify('Not In A Vehicle..')
        end
end)

RegisterNetEvent('denalifw-vehiclemenu:2seatcontrol', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local IsSeatFree = IsVehicleSeatFree(veh, -1)
        if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
            if IsSeatFree then
                local args = tonumber(args)
                if args == 1 then 
                    IsVehicleSeatFree(veh, -1)
                    SetPedIntoVehicle(PlayerPedId(), veh, -1)
                    DenaliFW.Functions.Notify("Driver Seat", "success", 3500)
                    elseif args == 2 then 
                    IsVehicleSeatFree(veh, 0)
                    SetPedIntoVehicle(PlayerPedId(), veh, 0)
                    DenaliFW.Functions.Notify("Passenger Seat", "success", 3500)
                    elseif args == 0 or nil then
                    DenaliFW.Functions.Notify("Select a Proper Seat", "error", 3500)
                    end
                    TriggerEvent('ccvehmenu:client:seatsMenu')
                end
            elseif IsSeatFree == false then
                DenaliFW.Functions.Notify('This seat is occupied..')
                TriggerEvent('ccvehmenu:client:seatsMenu')
            end
        if veh == false then
            DenaliFW.Functions.Notify('Not In A Vehicle..')
        end
end)

------ Engine Control ------

RegisterNetEvent('denalifw-vehiclemenu:enginecontrol:on', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local args = tonumber(args)
    local IsSeatFree = IsVehicleSeatFree(veh, -1)
    if IsSeatFree == false then
        if GetPedInVehicleSeat(veh, -1) then
            if args == 1 then 
                SetVehicleEngineOn(veh, true, false, true)
                DenaliFW.Functions.Notify("Engine On", "success", 3500)
                elseif args == 2 then 
                SetVehicleEngineOn(veh, false, false, true)
                DenaliFW.Functions.Notify("Engine Off", "success", 3500)
                end
                TriggerEvent('ccvehmenu:client:engineMenu')
            end
    else
        DenaliFW.Functions.Notify("Can\'t Engage Engine From This Seat", "error", 3500)
        TriggerEvent('ccvehmenu:client:engineMenu')
    end
end)

------ Door Control ------

RegisterNetEvent('denalifw-vehiclemenu:doorcontrol', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local IsSeatFree = IsVehicleSeatFree(veh, -2)
        if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
            if IsSeatFree then
                local args = tonumber(args)
                if args == 1 then 
                    SetVehicleDoorOpen(veh, 0, false, false)
                    elseif args == 2 then 
                    SetVehicleDoorOpen(veh, 1, false, false)
                    elseif args == 3 then 
                    SetVehicleDoorOpen(veh, 2, false, false)
                    elseif args == 4 then 
                    SetVehicleDoorOpen(veh, 3, false, false)
                    elseif args == 5 then 
                    SetVehicleDoorOpen(veh, 4, false, false)
                    elseif args == 6 then 
                    SetVehicleDoorOpen(veh, 5, false, false)
                    elseif args == 7 then 
                    SetVehicleDoorsShut(veh, true)
                    elseif args == 8 then 
                    SetVehicleDoorOpen(veh, 0, false, false)
                    SetVehicleDoorOpen(veh, 1, false, false)
                    SetVehicleDoorOpen(veh, 2, false, false)
                    SetVehicleDoorOpen(veh, 3, false, false)
                    SetVehicleDoorOpen(veh, 4, false, false)
                    SetVehicleDoorOpen(veh, 5, false, false)
                    end
                    TriggerEvent('ccvehmenu:client:doorMenu')
                end
            else
                DenaliFW.Functions.Notify('Doors are Closed')
                TriggerEvent('ccvehmenu:client:doorMenu')
            end
        if veh == false then
            DenaliFW.Functions.Notify('Not In A Vehicle..')
        end
end)

------ Neon Control ------

local VehiclesWithNeons = {}

local function HasNeon(vehicle)
    if VehiclesWithNeons[vehicle] ~= nil then
        return true
    end

    if IsVehicleNeonLightEnabled(vehicle) then
        VehiclesWithNeons[vehicle] = true
        return true
    end

end

RegisterNetEvent('denalifw-vehiclemenu:neoncontrol', function()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if not vehicle or not IsPedInAnyVehicle(playerPed, false) or GetPedInVehicleSeat(vehicle, -1) ~= playerPed then return end -- ignore if not in car or driver seat

    local hasNeons = HasNeon(vehicle)

    if not hasNeons then 
        DenaliFW.Functions.Notify('Vehicles Neons Lights Not Installed', 'error')
        TriggerEvent('ccvehmenu:client:ccMenu')
        return
    end

        local neonsOn = (VehiclesWithNeons[vehicle] ~= nil and VehiclesWithNeons[vehicle] or false)

    SetVehicleNeonLightEnabled(vehicle, 0, not neonsOn)
    SetVehicleNeonLightEnabled(vehicle, 1, not neonsOn)
    SetVehicleNeonLightEnabled(vehicle, 2, not neonsOn)
    SetVehicleNeonLightEnabled(vehicle, 3, not neonsOn)
        VehiclesWithNeons[vehicle] = not neonsOn
        TriggerEvent('ccvehmenu:client:ccMenu')

end)
------ Livery Events ------

RegisterNetEvent('denalifw-vehiclemenu:liverycontrol', function(args)
local playerPed = GetPlayerPed(-1)
local veh = GetVehiclePedIsIn(playerPed, false)
local livery = IsVehicleSeatFree(veh, -2)
        if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
            if livery then
                local args = tonumber(args)
                if args == 1 then 
                    SetVehicleLivery(veh, 1)
                    elseif args == 2 then 
                    SetVehicleLivery(veh, 2)
                    elseif args == 3 then 
                    SetVehicleLivery(veh, 3)
                    elseif args == 4 then 
                    SetVehicleLivery(veh, 4)
                    elseif args == 5 then 
                    SetVehicleLivery(veh, 5)
                    end
                    TriggerEvent('ccvehmenu:client:liveryMenu')
                end
            else
                DenaliFW.Functions.Notify('No Liveries Available')
                TriggerEvent('ccvehmenu:client:ccMenu')
            end
        if veh == false then
            DenaliFW.Functions.Notify('Not In A Vehicle..')
        end
end)

------ Turbo Checks -------

-----Turbo Check
RegisterNetEvent('ccvehmenu:client:turbo', function()
    if PlayerData.job.name == "police" then
        local playerPed = PlayerPedId()
        local veh = GetVehiclePedIsIn(playerPed, false)
            if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
                local isEnabled = IsToggleModOn(veh, 18)
                if isEnabled then
                    DenaliFW.Functions.Notify("This car has a Turbo installed.")
                else 
                    DenaliFW.Functions.Notify("No Turbo installed.")
                end
                TriggerEvent('ccvehmenu:client:ccMenu')
            elseif veh == false then
                DenaliFW.Functions.Notify('Not In A Vehicle..')
            end
    else
        DenaliFW.Functions.Notify('Wrong Job Credentials..', 'error')
    end   
end)


------ Vehicle Extras ------

RegisterNetEvent('denalifw-vehiclemenu:vehicleExtras', function(args)
    local playerPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(playerPed)
    local plate = GetVehicleNumberPlateText(veh)
    if veh ~= nil then
        if veh == true then
            DenaliFW.Functions.Notify('Not In A Vehicle..')
        else
            SetVehicleAutoRepairDisabled(veh, true)
            if DoesExtraExist(veh, 1) then
                local args = tonumber(args)
                if args == 1 then 
                    SetVehicleExtra(veh, 1, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 1 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 2 then 
                    SetVehicleExtra(veh, 1, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 1 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 2) then
                local args = tonumber(args)
                if args == 3 then 
                    SetVehicleExtra(veh, 2, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 2 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 4 then 
                    SetVehicleExtra(veh, 2, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 2 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 3) then
                local args = tonumber(args)
                if args == 5 then 
                    SetVehicleExtra(veh, 3, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 3 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 6 then 
                    SetVehicleExtra(veh, 3, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 3 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 4) then
                local args = tonumber(args)
                if args == 7 then 
                    SetVehicleExtra(veh, 4, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 4 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 8 then 
                    SetVehicleExtra(veh, 4, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 4 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 5) then
                local args = tonumber(args)
                if args == 9 then 
                    SetVehicleExtra(veh, 5, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 5 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 10 then 
                    SetVehicleExtra(veh, 5, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 5 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end

                end
            if DoesExtraExist(veh, 6) then
                local args = tonumber(args)
                if args == 11 then 
                    SetVehicleExtra(veh, 6, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 6 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 12 then 
                    SetVehicleExtra(veh, 6, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 6 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 7) then
                local args = tonumber(args)
                if args == 13 then 
                    SetVehicleExtra(veh, 7, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 7 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 14 then 
                    SetVehicleExtra(veh, 7, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 7 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 8) then
                local args = tonumber(args)
                if args == 15 then 
                    SetVehicleExtra(veh, 8, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 8 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 16 then 
                    SetVehicleExtra(veh, 8, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 8 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 9) then
                local args = tonumber(args)
                if args == 17 then 
                    SetVehicleExtra(veh, 9, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 9 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 18 then 
                    SetVehicleExtra(veh, 9, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 9 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 10) then
                local args = tonumber(args)
                if args == 19 then 
                    SetVehicleExtra(veh, 10, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 10 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 20 then 
                    SetVehicleExtra(veh, 10, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 10 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 11) then
                local args = tonumber(args)
                if args == 21 then 
                    SetVehicleExtra(veh, 11, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 11 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 22 then 
                    SetVehicleExtra(veh, 11, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 11 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 12) then
                local args = tonumber(args)
                if args == 23 then 
                    SetVehicleExtra(veh, 12, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 12 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 24 then 
                    SetVehicleExtra(veh, 12, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 12 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, 13) then
                local args = tonumber(args)
                if args == 25 then 
                    SetVehicleExtra(veh, 13, 1)
                    DenaliFW.Functions.Notify('Extra ' .. 13 .. ' Deactivated', 'error', 2500)
                    TriggerEvent('ccvehmenu:client:extrasDeactMenu')
                    elseif args == 26 then 
                    SetVehicleExtra(veh, 13, 0)
                    SetVehicleAutoRepairDisabled(true)
                    DenaliFW.Functions.Notify('Extra ' .. 13 .. ' Activated', 'success', 2500)
                    TriggerEvent('ccvehmenu:client:extrasActMenu')
                    end
                end
            if DoesExtraExist(veh, nil) then
                DenaliFW.Functions.Notify('This extra is not present on this vehicle ', 'error', 2500)
            end
        end
    end
end)

------ Open Menu Events ------

RegisterNetEvent('ccvehmenu:client:ccMenu', function()
    local ped = PlayerPedId()
    local veh = IsPedSittingInVehicle(ped)
    local isnotVeh = IsPedInVehicle(ped, veh, false)
        if isnotVeh == true then
            DenaliFW.Functions.Notify('Cant Open This Outside of A Vehicle..', 'error')
        else
            createCarControlMenu()
            exports['denalifw-menu']:openMenu(ccMenu)
        end
end)

RegisterNetEvent('ccvehmenu:client:seatsMenu', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh ~= nil or veh ~= 0 then
        local seatCount = GetVehicleModelNumberOfSeats(GetEntityModel(veh))
        if seatCount == 2 then
            create2SeatMenu()
            exports['denalifw-menu']:openMenu(seat2Menu)
        elseif seatCount == 4 then
            createSeatMenu()
            exports['denalifw-menu']:openMenu(seatMenu)
        elseif seatCount == 6 then
            create6SeatMenu()
            exports['denalifw-menu']:openMenu(seat6Menu)
        end
    end
end)

RegisterNetEvent('ccvehmenu:client:windowsMenu', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh ~= nil or veh ~= 0 then
        local seatCount = GetVehicleModelNumberOfSeats(GetEntityModel(veh))
        if seatCount == 2 then
            create2WindowsMenu()
            exports['denalifw-menu']:openMenu(windows2Menu)
        elseif seatCount == 4 then
            createWindowsMenu()
            exports['denalifw-menu']:openMenu(windowsMenu)
        elseif seatCount == 6 then
            createWindowsMenu()
            exports['denalifw-menu']:openMenu(windowsMenu)
        end
    end
end)

RegisterNetEvent('ccvehmenu:client:engineMenu', function()
    createEngineMenu()
    exports['denalifw-menu']:openMenu(engineMenu)
end)

RegisterNetEvent('ccvehmenu:client:doorMenu', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh ~= nil or veh ~= 0 then
        local seatCount = GetVehicleModelNumberOfSeats(GetEntityModel(veh))
        if seatCount == 2 then
            create2DoorMenu()
            exports['denalifw-menu']:openMenu(door2Menu)
        elseif seatCount == 4 then
            createDoorMenu()
            exports['denalifw-menu']:openMenu(doorMenu)
        elseif seatCount == 6 then
            createDoorMenu()
            exports['denalifw-menu']:openMenu(doorMenu)
        end
    end
end)

RegisterNetEvent('ccvehmenu:client:neonMenu', function()
    createNeonMenu()
    exports['denalifw-menu']:openMenu(neonMenu)
end)

RegisterNetEvent('ccvehmenu:client:liveryMenu', function()
    if PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" or PlayerData.job.name == "mechanic" then
        createLiveryMenu()
        exports['denalifw-menu']:openMenu(liveryMenu)
    else
        DenaliFW.Functions.Notify('Wrong Job Credentials..', 'error')
    end
end)

RegisterNetEvent('ccvehmenu:client:extrasMenu', function()
    createExtrasMenu()
    exports['denalifw-menu']:openMenu(extrasMenu)
end)

RegisterNetEvent('ccvehmenu:client:extrasActMenu', function()
    createExtrasActMenu()
    exports['denalifw-menu']:openMenu(extrasActMenu)
end)

RegisterNetEvent('ccvehmenu:client:extrasDeactMenu', function()
    createExtrasDeactMenu()
    exports['denalifw-menu']:openMenu(extrasDeactMenu)
end)



------ Menu Structures ------

function createCarControlMenu()
    ccMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Car Control'
        },
        {
            header = "Swap Seat",
			txt = "Choose a Seat",
			params = {
                isServer = false,
                event = "ccvehmenu:client:seatsMenu",
            }
        },
        {
            header = "Windows",
			txt = "Roll Down Windows",
			params = {
                isServer = false,
                event = "ccvehmenu:client:windowsMenu",
            }
        },
        {
            header = "Engine",
			txt = "Turn Car On/Off",
			params = {
                isServer = false,
                event = "ccvehmenu:client:engineMenu",
            }
        },
        {
            header = "Door Menu",
			txt = "Open Doors",
			params = {
                isServer = false,
                event = "ccvehmenu:client:doorMenu",
            }
        },
        {
            header = "Neon Menu",
			txt = "Switch Neon On/Off",
			params = {
                isServer = false,
                event = "ccvehmenu:client:neonMenu",
            }
        },
        {
            header = "Livery",
			txt = "Swap Liveries (PD, EMS, Mech Only)",
			params = {
                isServer = false,
                event = "ccvehmenu:client:liveryMenu",
            }
        },
        {
            header = "Turbo-Check",
            txt = "Check Turbo (PD)",
            params = {
                isServer = false,
                event = "ccvehmenu:client:turbo",
            }
        },
        {
            header = "Vehicle Extras",
            txt = "Turn Extras On/Off",
            params = {
                isServer = false,
                event = "ccvehmenu:client:extrasMenu",
            }
        },
        {
            header = "Close Menu",
			txt = "Close Menu",
			params = {
                isServer = false,
                event = exports['denalifw-menu']:closeMenu(),
            }
        },
    }
    exports['denalifw-menu']:openMenu(ccMenu)
end


function createWindowsMenu()
    windowsMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Window Controls'
        },
        {
            header = "Roll Down Window L/F",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 1,
            }
        },
        {
            header = "Roll Down Window R/F",
			txt = " Choose Passenger Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 2,
            }
        },
        {
            header = "Roll Down Window L/R",
			txt = "Choose Rear Driver Side Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 3,
            }
        },
        {
            header = "Roll Down Window R/R",
			txt = "Choose Rear Passenger Side Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 4,
            }
        },
        {
            header = "Roll Up Window L/F",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 5,
            }
        },
        {
            header = "Roll Up Window R/F",
			txt = "Choose Passenger Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 6,
            }
        },
        {
            header = "Roll Up Window L/R",
			txt = "Choose Rear Driver Side Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 7,
            }
        },
        {
            header = "Roll Up Window R/R",
			txt = "Choose Rear Passenger Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 8,
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(windowsMenu)
end

function create2WindowsMenu()
    windows2Menu = {
        {
            isHeader = true,
            header = ' 🚓 | Window Controls'
        },
        {
            header = "Roll Down Driver Window",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 1,
            }
        },
        {
            header = "Roll Down Passenger Window",
			txt = " Choose Passenger Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 2,
            }
        },
        {
            header = "Roll Up Driver Window",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 5,
            }
        },
        {
            header = "Roll Up Passenger",
			txt = "Choose Passenger Window",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:windowscontrol",
                args = 6,
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(windows2Menu)
end


function createSeatMenu()
    seatMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Seat Controls'
        },
        {
            header = "Swap To Driver",
			txt = "Choose Driver Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 1,
            }
        },
        {
            header = "Swap To Passenger",
			txt = "Choose Passenger Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 2,
            }
        },
        {
            header = "Swap To Driver Rear",
			txt = "Choose Driver Rear Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 3,
            }
        },
        {
            header = "Swap To Passenger Rear",
			txt = "Choose Passenger Rear Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 4,
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(seatMenu)
end

function create2SeatMenu()
    seat2Menu = {
        {
            isHeader = true,
            header = ' 🚓 | Seat Controls'
        },
        {
            header = "Swap To Driver",
			txt = "Choose Driver Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:2seatcontrol",
                args = 1,
            }
        },
        {
            header = "Swap To Passenger",
			txt = "Choose Passenger Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 2,
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(seat2Menu)
end

function create6SeatMenu()
    seat6Menu = {
        {
            isHeader = true,
            header = ' 🚓 | Seat Controls'
        },
        {
            header = "Swap To Driver",
			txt = "Choose Driver Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 1,
            }
        },
        {
            header = "Swap To Passenger",
			txt = "Choose Passenger Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 2,
            }
        },
        {
            header = "Swap To Driver Rear",
			txt = "Choose Driver Rear Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 3,
            }
        },
        {
            header = "Swap To Passenger Rear",
			txt = "Choose Passenger Rear Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args = 4,
            }
        },
        {
            header = "Swap To Back Rear",
			txt = "Choose Back Left Rear Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args =5,
            }
        },
        {
            header = "Swap To Back Rear",
			txt = "Choose Back Right Rear Seat",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:seatcontrol",
                args =6,
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(seat6Menu)
end

function createEngineMenu()
    engineMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Engine Controls'
        },
        {
            header = "Engine On",
			txt = "Turn Engine On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:enginecontrol:on",
                args = 1
            }
        },
        {
            header = "Engine Off",
			txt = "Turn Engine On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:enginecontrol:on",
                args = 2
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(seatMenu)
end

function createDoorMenu()
    doorMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Door Controls'
        },
        {
            header = "Open Doors",
			txt = "Open All Doors",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 8
            }
        },
        {
            header = "Driver",
			txt = "Open Driver Door",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 1
            }
        },
        {
            header = "Passenger",
			txt = "Open Passenger Door",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 2
            }
        },
        {
            header = "Left Rear",
			txt = "Open Left Rear Door",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 3
            }
        },
        {
            header = "Right Rear",
			txt = "Open Right Rear Door",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 4
            }
        },
        {
            header = "Hood",
			txt = "Open Hood",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 5
            }
        },
        {
            header = "Trunk",
			txt = "Open Trunk",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 6
            }
        },
        {
            header = "Shut Doors",
			txt = "Shut All Doors",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 7
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(doorMenu)
end

function create2DoorMenu()
    door2Menu = {
        {
            isHeader = true,
            header = ' 🚓 | Door Controls'
        },
        {
            header = "Open Doors",
			txt = "Open All Doors",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 8
            }
        },
        {
            header = "Driver",
			txt = "Open Driver Door",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 1
            }
        },
        {
            header = "Passenger",
			txt = "Open Passenger Door",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 2
            }
        },
        {
            header = "Hood",
			txt = "Open Hood",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 5
            }
        },
        {
            header = "Trunk",
			txt = "Open Trunk",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 6
            }
        },
        {
            header = "Shut Doors",
			txt = "Shut All Doors",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 7
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(door2Menu)
end

function create6DoorMenu()
    door6Menu = {
        {
            isHeader = true,
            header = ' 🚓 | Door Controls'
        },
        {
            header = "Open Doors",
			txt = "Open All Doors",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 8
            }
        },
        {
            header = "Driver",
			txt = "Open Driver Door",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 1
            }
        },
        {
            header = "Passenger",
			txt = "Open Passenger Door",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 2
            }
        },
        {
            header = "Hood",
			txt = "Open Hood",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 5
            }
        },
        {
            header = "Trunk",
			txt = "Open Trunk",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 6
            }
        },
        {
            header = "Shut Doors",
			txt = "Shut All Doors",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:doorcontrol",
                args = 7
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(door6Menu)
end

function createNeonMenu()
    neonMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Neon Controls'
        },
        {
            header = "Turn Neons On",
			txt = "Switch Neon Lights On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:neoncontrol",
                args = 1
            }
        },
        {
            header = "Turn Neon Off",
			txt = "Switch Neon Lights Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:neoncontrol",
                args = 2
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(neonMenu)
end

function createLiveryMenu()
    liveryMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Livery Controls'
        },
        {
            header = "Change Livery 1",
			txt = "Put Livery 1 on Vehicle",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:liverycontrol",
                args = 1
            }
        },
        {
            header = "Change Livery 2",
			txt = "Put Livery 2 on Vehicle",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:liverycontrol",
                args = 2
            }
        },
        {
            header = "Change Livery 3",
			txt = "Put Livery 3 on Vehicle",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:liverycontrol",
                args = 3
            }
        },
        {
            header = "Change Livery 4",
			txt = "Put Livery 4 on Vehicle",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:liverycontrol",
                args = 4
            }
        },
        {
            header = "Change Livery 5",
			txt = "Put Livery 5 on Vehicle",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:liverycontrol",
                args = 5
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(liveryMenu)
end

function createExtrasMenu()
    extrasMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Veh Extras Controls'
        },
        {
            header = "Activate Extras",
			txt = "Turn Extra's On",
			params = {
                isServer = false,
                event = "ccvehmenu:client:extrasActMenu",
            }
        },
        {
            header = "Deactivate Extras",
			txt = "Turn Extra's Off",
			params = {
                isServer = false,
                event = "ccvehmenu:client:extrasDeactMenu",
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(extrasMenu)
end

function createExtrasDeactMenu()
    extrasDeactMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Veh Extras Controls'
        },
        {
            header = "Extra 1",
			txt = "Turn Extra 1 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 1
            }
        },
        {
            header = "Extra 2",
			txt = "Turn Extra 2 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 3
            }
        },
        {
            header = "Extra 3",
			txt = "Turn Extra 3 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 5
            }
        },
        {
            header = "Extra 4",
			txt = "Turn Extra 4 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 7
            }
        },
        {
            header = "Extra 5",
			txt = "Turn Extra 6 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 9
            }
        },
        {
            header = "Extra 7",
			txt = "Turn Extra 7 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 11
            }
        },
        {
            header = "Extra 8",
			txt = "Turn Extra 8 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 13
            }
        },
        {
            header = "Extra 9",
			txt = "Turn Extra 9 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 15
            }
        },
        {
            header = "Extra 10",
			txt = "Turn Extra 10 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 17
            }
        },
        {
            header = "Extra 11",
			txt = "Turn Extra 11 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 19
            }
        },
        {
            header = "Extra 12",
			txt = "Turn Extra 12 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 21
            }
        },
        {
            header = "Extra 13",
			txt = "Turn Extra 13 Off",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 23
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(extrasDeactMenu)
end

function createExtrasActMenu()
    extrasActMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Veh Extras Controls'
        },
        {
            header = "Extra 1",
			txt = "Turn Extra 1 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 2
            }
        },
        {
            header = "Extra 2",
			txt = "Turn Extra 2 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 4
            }
        },
        {
            header = "Extra 3",
			txt = "Turn Extra 3 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 6
            }
        },
        {
            header = "Extra 4",
			txt = "Turn Extra 4 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 8
            }
        },
        {
            header = "Extra 5",
			txt = "Turn Extra 6 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 10
            }
        },
        {
            header = "Extra 7",
			txt = "Turn Extra 7 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 12
            }
        },
        {
            header = "Extra 8",
			txt = "Turn Extra 8 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 14
            }
        },
        {
            header = "Extra 9",
			txt = "Turn Extra 9 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 16
            }
        },
        {
            header = "Extra 10",
			txt = "Turn Extra 10 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 18
            }
        },
        {
            header = "Extra 11",
			txt = "Turn Extra 11 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 20
            }
        },
        {
            header = "Extra 12",
			txt = "Turn Extra 12 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 22
            }
        },
        {
            header = "Extra 13",
			txt = "Turn Extra 13 On",
			params = {
                isServer = false,
                event = "denalifw-vehiclemenu:vehicleExtras",
                args = 24
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['denalifw-menu']:openMenu(extrasActMenu)
end