local spzvozidla = nil
local blip = 0
local blip2 = 0
local blip3 = 0
local blip4 = 0
local dropoffzone = nil

local coordsproblipx = nil
local coordsproblipy = nil

local dropoffx = nil
local dropoffy = nil
local dropoffz = nil
local dropoffm = nil

local spawnu = nil
local spawni = nil
local spawno = nil
local spawnp = nil

local dealer = nil
local driver = nil
local vehicle = nil
local cena = nil
local cooldown = false
local homecooldown = false

local randomcislovozidla = nil
local randomcislocoordinaci = nil
local randomdelivery = nil
local vehiclename = nil

local vymazatvozidloprizruseni = nil
local coordyprohousex,oordyprohousey,oordyprohousez = nil
local DenaliFW = exports['denalifw-core']:GetCoreObject()

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
    if DoesBlipExist(blip2) then
		RemoveBlip(blip2)
	end
    if DoesBlipExist(blip3) then
		RemoveBlip(blip3)
	end
    if DoesBlipExist(blip4) then
		RemoveBlip(blip4)
	end
end

function CreateBlip()
	DeleteBlip()
    coordsproblipx = coordsproblipx + math.random(-170.0, 170.0)
    coordsproblipy = coordsproblipy + math.random(-170.0, 170.0)
    
    blip = AddBlipForRadius(coordsproblipx, coordsproblipy, 0.0, 250.0)
    SetBlipSprite(blip, 9)
    SetBlipColour(blip, 38)
    SetBlipAlpha(blip, 80)

    blip2 = AddBlipForCoord(dropoffx, dropoffy, dropoffz)
    SetBlipSprite(blip2, 225)
    SetBlipColour(blip2, 33)
    SetBlipAlpha(blip2, 200)
    SetBlipDisplay(blip2, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Drop Off")
    EndTextCommandSetBlipName(blip2)
end

function Dealer()
    npcHash = GetHashKey(MainConfig.Dealer)
    RequestModel(npcHash)
    while not HasModelLoaded(npcHash) do
         Wait(1)
    end
    dealer = CreatePed(1, npcHash, dropoffx, dropoffy, dropoffz - 1.0, dropoffm, false, true)
    SetBlockingOfNonTemporaryEvents(dealer, true)
    SetPedTalk(dealer)
    SetPedCanPlayAmbientAnims(dealer, true)
    SetPedCanRagdollFromPlayerImpact(dealer, false)
    SetEntityInvincible(dealer, true)
    FreezeEntityPosition(dealer, false)
    TaskStartScenarioInPlace(dealer, "WORLD_HUMAN_SMOKING", 0, true)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200)
        while dropoffx or dropoffy or dropoffz ~= nil do
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            local odstraneni = #(pos - vector3(dropoffx, dropoffy, dropoffz))
                if odstraneni <= 8 then
                    if odstraneni <= 8 then
                        DrawText3Ds(dropoffx, dropoffy, dropoffz, '[E] - Drop off')
                        if IsControlJustPressed(0, 38) then
                            local ped = PlayerPedId()
                            local pos = GetEntityCoords(ped)
                            local dist = #(pos - vector3(dropoffx, dropoffy, dropoffz))
                            if dist < 6 then
                                VymazatVozidlo()
                            end
                        end
                    end
                end
            Citizen.Wait(3)
        end
    end
end)

function acceptedpraci(data)
    if cooldown == false then
        if spzvozidla ~= nil then
            DenaliFW.Functions.Notify('You have not yet completed the active order!', 'error')
        else
            randomcislovozidla = math.random(1, 47)
            randomcislocoordinaci = math.random(1, 60)
            randomdelivery = math.random(1,6)


            cena = (MainConfig.VehicleList[randomcislovozidla].price * 1.65)
            SpawnVozidla(MainConfig.VehicleList[randomcislovozidla].vehicle, MainConfig.VehicleCoords[randomcislocoordinaci].x, MainConfig.VehicleCoords[randomcislocoordinaci].y, MainConfig.VehicleCoords[randomcislocoordinaci].z, MainConfig.VehicleCoords[randomcislocoordinaci].h)
        end
    else
        DenaliFW.Functions.Notify('There is currently no new offer, please wait a moment!', 'error')
    end
end

function PoliceCall()
    local pos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('denalifw-contracts:server:PoliceCall', exports['cd_dispatch']:GetPlayerInfo(), vector3(pos.x, pos.y, pos.z))
end

function SpawnVozidla(vehicle, x, y, z, h)
    local coords = vector4(x, y, z, h)
    
    DenaliFW.Functions.SpawnVehicle(vehicle, function(veh)
        SetEntityHeading(veh, coords.w)
        SetVehicleEngineOn(veh, false, false)
        SetVehicleOnGroundProperly(veh)
        SetVehicleDoorsLocked(veh, 2)
        SetVehicleDoorsLockedForAllPlayers(veh, true)

        vymazatvozidloprizruseni = veh
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        for i = 0, 5 do
            SetVehicleDoorShut(veh, i, false)
        end
        spzvozidla = GetVehicleNumberPlateText(veh)

        coordsproblipx, coordsproblipy = MainConfig.VehicleCoords[randomcislocoordinaci].x, MainConfig.VehicleCoords[randomcislocoordinaci].y
        dropoffx, dropoffy, dropoffz, dropoffm = MainConfig.DeliveryCoords[randomdelivery].j, MainConfig.DeliveryCoords[randomdelivery].k, MainConfig.DeliveryCoords[randomdelivery].l, MainConfig.DeliveryCoords[randomdelivery].m
        DenaliFW.Functions.Notify('The order was successfully accepted!', 'success')

        Citizen.Wait(math.random(10000,25000))
        TriggerServerEvent('denalifw-phone:server:sendNewMail', {
            sender = "Illegal contracts",
            subject = "New job offer",
            message = "Hello,<br> the customer requires a vehicle with a registration plate: <b>" .. spzvozidla .. " / " .. vehicle .."</b>.<br>The approximate position of the vehicle is marked on the map.<br><br><b>Middle-man</b>",
            button = {
                enabled = false,
                buttonEvent = "denalifw-contracts:client:setLocation",
                buttonData = nil
            }
        })
        Dealer()
        CreateBlip()
        cooldown = true
    end, coords, true)
end

function VymazatVozidlo()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh == 0 then
        DenaliFW.Functions.Notify("You are not in a vehicle")
    elseif GetVehicleNumberPlateText(veh) ~= spzvozidla then
        DenaliFW.Functions.Notify("This vehicle isn't the one, he requires!")
    else
        DenaliFW.Functions.Notify("Leave the vehicle!")
        TaskLeaveVehicle((GetPlayerPed(-1)), veh, 1)
        GetVehicleDoorsLockedForPlayer(veh)

        Citizen.Wait(7500)
        if dealer ~= nil then
            TaskEnterVehicle(dealer, veh, 2.0, -1, 1, 1, 0)
            SetEntityAsNoLongerNeeded(dealer)
        end
        spzvozidla, coordsproblipx, coordsproblipy, dropoffx, dropoffy, dropoffz, dropoffm, randomcislovozidla, randomcislocoordinaci = nil
        DeleteBlip()
        PoliceCall()
        DenaliFW.Functions.Notify("Vozidlo úspěšně doručeno!")
        Citizen.Wait(math.random(5000,10000))
        TriggerServerEvent('denalifw-phone:server:sendNewMail', {
            sender = "Illegal contracts",
            subject = "Successful delivery of the vehicle",
            message = "Hey,<br> The customer thanks many times for their cooperation and sends a financial reward<br><b>$" .. cena .. "</b> which will be credited to your bank account.<br><br><b>Middle-man</b>",
            button = {
                enabled = false,
                buttonEvent = "denalifw-contracts:client:setLocation",
                buttonData = coordsproblipx, coordsproblipy
            }
        })
        TriggerServerEvent('denalifw-contracts:server:ReceivePayment', cena)
        cena = nil
        Citizen.Wait(150000)
        DeleteEntity(dealer)
        DeleteEntity(veh)
        Citizen.Wait(750000)
        cooldown = false
    end
end

RegisterNUICallback('save', function(data)
    DenaliFW.Functions.TriggerCallback('denalifw-contracts:server:HasTablet', function(tablet)
        if tablet then
            acceptedpraci(data)
        end
    end)
end)

RegisterNUICallback('checkItem', function(data, cb)
    local retval = false
    DenaliFW.Functions.TriggerCallback('DenaliFW:HasItem', function(result)
        if result then
            retval = true
        end
        cb(retval)
    end, data.item)
end)

RegisterNetEvent('denalifw-contracts:client:OpenTablet')
AddEventHandler('denalifw-contracts:client:OpenTablet', function()
    OpenDeebTablet(true)
end)

RegisterNUICallback('exit', function()
    OpenDeebTablet(false)
    SetNuiFocus(false, false)
    inTuner = false
end)

function OpenDeebTablet(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool
    })
    inTuner = bool
end

RegisterNUICallback('home', function(data)
    DenaliFW.Functions.TriggerCallback('denalifw-contracts:server:HasTablet', function(tablet)
        if tablet then
            acceptedhomepraci(data)
        end
    end)
end)

RegisterNUICallback('return', function(data)
    DenaliFW.Functions.TriggerCallback('denalifw-contracts:server:HasTablet', function(tablet)
        if tablet then
            DeleteBlip()
            DeleteEntity(dealer)
            DeleteEntity(vymazatvozidloprizruseni)
            TriggerServerEvent('denalifw-contracts:server:PayFee', MainConfig.Fee)
        end
    end)
end)

-- HOUSEROBBERY
function acceptedhomepraci(data)
    local hours = GetClockHours()
    if hours >= Config.MinimumTime or hours <= Config.MaximumTime then
        if homecooldown == false then
            if CurrentCops >= Config.MinimumHouseRobberyPolice then
                homecooldown = true
                local housenumber = {}
                local somethingtocount = 0
                for k, v in pairs(Config.Houses) do
                    somethingtocount = somethingtocount + 1
                    housenumber[somethingtocount] = k
                end
                local randomhousenumber = math.random(1, somethingtocount)

                TriggerServerEvent('denalifw-contracts:server:PayFeeForService', MainConfig.FeeService)

                DenaliFW.Functions.Notify('Offer was accepted!', 'success')
                Citizen.Wait(math.random(10000,35000))

                coordyprohousex = Config.Houses[housenumber[somethingtocount]]["coords"]["x"]
                coordyprohousey = Config.Houses[housenumber[somethingtocount]]["coords"]["y"]

                CreateBlipHouse()

                TriggerServerEvent('denalifw-phone:server:sendNewMail', {
                    sender = "Illegal contracts",
                    subject = "House Robbery",
                    message = "Hi,<br> the agent found an apartment you might like.<br>don't forget to bring a set of screwdrivers and a lockpick!<br><br><b>Good luck<br>Middleman</b>",
                    button = {
                        enabled = false,
                        buttonEvent = "denalifw-contracts:client:setLocation",
                        buttonData = coordyprohousex, coordyprohousey
                }
                })
                Citizen.Wait(6000)
                DenaliFW.Functions.Notify('The location of the required apartment was marked on the map!', 'error')

                Citizen.Wait(300000)
                DeleteBlip()
                Citizen.Wait(600000)
                homecooldown = false
            else
                DenaliFW.Functions.Notify('There is not enought police officers in the town!', 'error')
            end
        else
            DenaliFW.Functions.Notify('There is currently not a single offer, try it later!', 'error')
        end
    else
        DenaliFW.Functions.Notify('The agent only looks for apartments at night!', 'error')
    end
end

function CreateBlipHouse()
    DeleteBlip()
    coordyprohousex = coordyprohousex + math.random(-75.0, 75.0)
    coordyprohousey = coordyprohousey + math.random(-75.0, 75.0)

    blip = AddBlipForRadius(coordyprohousex, coordyprohousey, 0.0, 75.0)
    SetBlipSprite(blip, 9)
    SetBlipColour(blip, 66)
    SetBlipAlpha(blip, 80)
end