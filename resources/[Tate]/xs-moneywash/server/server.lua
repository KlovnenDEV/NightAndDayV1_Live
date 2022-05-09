local DenaliFW = exports['denalifw-core']:GetCoreObject()

function removePlayerItem(playerId, itemName, itemAmount)
    playerId = tonumber(playerId)
    itemAmount = tonumber(itemAmount)
    local esxPlayer = DenaliFW.Functions.GetPlayer(playerId)
    if (not playerId or playerId < 1 or not GetPlayerName(playerId)) then return end
    if (not itemName) then return end
    if (not itemAmount or itemAmount < 1) then return end

    if (not DenaliFW) then return end

    local esxPlayer = DenaliFW.Functions.GetPlayer(playerId)
    if (esxPlayer) then
        esxPlayer.Functions.RemoveItem(itemName, itemAmount)
    end
end

function math.percent(percent,maxvalue)
    if tonumber(percent) and tonumber(maxvalue) then
        return (maxvalue*percent)/100
    end
    return false
end

RegisterNetEvent('XSMoneyWash:StartWash', function(amount)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    if Player.Functions.GetItemByName(Config.MarkedBillsName) ~= nil  then
    local markedbills = Player.Functions.GetItemByName(Config.MarkedBillsName)
local posokostizitomarked =  markedbills.info.worth
    --print(amount)

    local price1 = posokostizitomarked  *  amount
    --print(price1)
    
        Player.Functions.RemoveItem(Config.MarkedBillsName, amount)
        removePlayerItem(source,Config.MarkedBillsName,amount)
        Player.Functions.AddMoney("cash", price1, "Money Wash")
        TriggerClientEvent('DenaliFW:Notify', src, Config.AllGoodNotify, 'error')
    else
        TriggerClientEvent('DenaliFW:Notify', src, Config.YouDontHaveNotify, 'error')
    end
end)
