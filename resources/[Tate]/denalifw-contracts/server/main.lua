local vehicle = nil
local coords = nil
local coordsped = nil
local DenaliFW = exports['denalifw-core']:GetCoreObject()

DenaliFW.Functions.CreateUseableItem("tablet", function(source, item)
    local src = source
    TriggerClientEvent('denalifw-contracts:client:OpenTablet', src)
end)

DenaliFW.Functions.CreateCallback('denalifw-contracts:server:HasTablet', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local tablet = Ply.Functions.GetItemByName('tablet')

    if tablet ~= nil then
        cb(true)
    else
        DropPlayer(src, 'Error?')
        cb(true)
    end
end)

RegisterServerEvent('denalifw-contracts:server:ReceivePayment')
AddEventHandler('denalifw-contracts:server:ReceivePayment', function(cena)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    Player.Functions.AddMoney('bank', cena)
    TriggerClientEvent('DenaliFW:Notify', src, "You have received a payment of $" .. cena .. "!", "success")
end)

RegisterServerEvent('denalifw-contracts:server:PayFee')
AddEventHandler('denalifw-contracts:server:PayFee', function(cena)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    Player.Functions.RemoveMoney('bank', cena)
    TriggerClientEvent('DenaliFW:Notify', src, "Your contract was canceled, you paid a fee of $" .. cena .. "!", "success")
end)

RegisterServerEvent('denalifw-contracts:server:PayFeeForService')
AddEventHandler('denalifw-contracts:server:PayFeeForService', function(cena)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    Player.Functions.RemoveMoney('bank', cena)
    TriggerClientEvent('DenaliFW:Notify', src, "Your contract was canceled, you paid a fee of $" .. cena .. "!", "success")
end)

RegisterServerEvent('denalifw-contracts:server:ReceiveData')
AddEventHandler('denalifw-contracts:server:ReceiveData', function(veh, x, y, z, w, u, i, o, p)
    vehicle = veh
    coordsped = vector4(u, i, o, p)
end)

DenaliFW.Functions.CreateCallback('denalifw-contracts:server:SpawnVehicle', function(source, cb)
    local CreateAutomobile = GetHashKey("CREATE_AUTOMOBILE")
    local truck = Citizen.InvokeNative(CreateAutomobile, GetHashKey(vehicle), coordsped, coordsped.w, true, true)
    local retval = CreatePed(1, GetHashKey(Config.Driver), coordsped.x + 2.0, coordsped.y, coordsped.z + 1.0, coordsped.w, true, true)
    while not DoesEntityExist(truck) and not DoesEntityExist(retval) do
        Wait(25)
    end
    if DoesEntityExist(truck) and DoesEntityExist(retval) then
        local netId = NetworkGetNetworkIdFromEntity(truck)

        local netIdped = NetworkGetNetworkIdFromEntity(retval)

        cb(netId, netIdped)
    else
        cb(0)
    end
end)