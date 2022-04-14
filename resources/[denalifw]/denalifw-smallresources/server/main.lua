DenaliFW = nil
local DenaliFW = exports['denalifw-core']:GetCoreObject()

local VehicleNitrous = {}

RegisterNetEvent('tackle:server:TacklePlayer', function(playerId)
    TriggerClientEvent("tackle:client:GetTackled", playerId)
end)

DenaliFW.Functions.CreateCallback('nos:GetNosLoadedVehs', function(source, cb)
    cb(VehicleNitrous)
end)

DenaliFW.Commands.Add("id", "Check Your ID #", {}, false, function(source, args)
    local src = source
    TriggerClientEvent('DenaliFW:Notify', src,  "ID: "..src)
end)

DenaliFW.Functions.CreateUseableItem("harness", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent('seatbelt:client:UseHarness', src, item)
end)

RegisterNetEvent('equip:harness', function(item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.PlayerData.items[item.slot].info.uses - 1 == 0 then
        TriggerClientEvent("inventory:client:ItemBox", src, DenaliFW.Shared.Items['harness'], "remove")
        Player.Functions.RemoveItem('harness', 1)
    else
        Player.PlayerData.items[item.slot].info.uses = Player.PlayerData.items[item.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    if hp == 0 then
        Player.Functions.RemoveItem('harness', 1, data.slot)
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('qb-carwash:server:washCar', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    if Player.Functions.RemoveMoney('cash', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    elseif Player.Functions.RemoveMoney('bank', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    else
        TriggerClientEvent('DenaliFW:Notify', src, 'You dont have enough money..', 'error')
    end
end)

DenaliFW.Functions.CreateCallback('smallresources:server:GetCurrentPlayers', function(source, cb)
    local TotalPlayers = 0
    for k, v in pairs(DenaliFW.Functions.GetPlayers()) do
        TotalPlayers = TotalPlayers + 1
    end
    cb(TotalPlayers)
end)
RegisterServerEvent('denalifw-taxes')
AddEventHandler('denalifw-taxes', function(amount)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local bankamount = Player.PlayerData.money.bank
    local poor = 100000
    local medium = 500000
    local rich = 1000000
    local megarich = 5000000
    local tax1 = 35 -- change for percentage/tax bracket
    local tax2 = 215 -- change for percentage/tax bracket
    local tax3 = 10000 -- change for percentage/tax bracket
    local tax4 = 25000 -- change for percentage/tax bracket
    
    if bankamount <= poor then
      TriggerClientEvent('DenaliFW:Notify', source, "You do not need to pay taxes because you are poor.", "success")
    elseif bankamount > poor and bankamount <= medium then
        Player.Functions.RemoveMoney('bank', tax1, "Taxes paid")
        TriggerClientEvent('DenaliFW:Notify', source, "You have paid your taxes for having a medium income.", "success")
        --TriggerEvent("denalifw-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax1.."in taxes.")
    
    elseif bankamount > medium and bankamount <= rich then
        Player.Functions.RemoveMoney('bank', tax2, "Taxes paid")
        TriggerClientEvent('DenaliFW:Notify', source, "You have paid your taxes for having a high income.", "success")
        --TriggerEvent("denalifw-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax2.."in taxes.")
    
    elseif bankamount > medium and bankamount <= megarich then
        Player.Functions.RemoveMoney('bank', tax3, "Taxes paid")
        TriggerClientEvent('DenaliFW:Notify', source, "You have paid your taxes for being wealthy.", "success")
        --TriggerEvent("denalifw-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax3.."in taxes.")

    elseif bankamount > megarich then
        Player.Functions.RemoveMoney('bank', tax4, "Taxes paid")
        TriggerClientEvent('DenaliFW:Notify', source, "You have paid your capitol gain taxes.", "success")
        --TriggerEvent("denalifw-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax4.."in taxes.")
    end
end)
