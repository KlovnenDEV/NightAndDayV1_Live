local DenaliFW = exports['denalifw-core']:GetCoreObject()

DenaliFW.Functions.CreateCallback("kaves_drugs:checkItem", function(source, cb, itemname, count)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    local item = xPlayer.Functions.GetItemByName(itemname)
    if item and item.amount >= count then
        cb(true)
    else
        cb(false)
    end
end)

DenaliFW.Functions.CreateCallback("kaves_drugs:checkItem2", function(source, cb, itemname, count)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    local item = xPlayer.Functions.GetItemByName(itemname)
    if item and item.amount >= count then
        cb(true)
    else
        cb(false)
    end
end)

DenaliFW.Functions.CreateCallback("kaves_drugs:checkItemAll", function(source, cb, itemname)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    if xPlayer.Functions.GetItemByName(itemname) ~= nil then
        if xPlayer.Functions.GetItemByName(itemname).amount > 0 then
            cb(true, xPlayer.Functions.GetItemByName(itemname).amount)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

RegisterServerEvent("kaves_drugs:removeItem")
AddEventHandler("kaves_drugs:removeItem", function(itemname, count)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(itemname, count)
end)

RegisterServerEvent("kaves_drugs:removeItemAll")
AddEventHandler("kaves_drugs:removeItemAll", function(itemname)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    local count = xPlayer.Functions.GetItemByName(itemname).amount
    xPlayer.Functions.RemoveItem(itemname, count)
end)

RegisterServerEvent("kaves_drugs:giveMoney")
AddEventHandler("kaves_drugs:giveMoney", function(count)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    if xPlayer then
        if Config.BlackMoney then
            xPlayer.Functions.AddMoney('crypto', count)
        else
            xPlayer.Functions.AddMoney("cash", count)
        end
    end
end)

RegisterServerEvent("kaves_drugs:giveBlackMoney2")
AddEventHandler("kaves_drugs:giveBlackMoney2", function(count)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    xPlayer.Functions.AddMoney('crypto', count)
end)


RegisterServerEvent("kaves_drugs:giveBlackMoney")
AddEventHandler("kaves_drugs:giveBlackMoney", function()
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    local count = math.random(100, 200)
    xPlayer.Functions.AddMoney('crypto', count)
end)

RegisterServerEvent("kaves_drugs:giveItem")
AddEventHandler("kaves_drugs:giveItem", function(itemname, count)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
	if itemname == "sorted_money" then
		xPlayer.Functions.AddItem(itemname, count)
		return
	end
    if DenaliFW.Player.GetTotalWeight(xPlayer.PlayerData.items) < 85000 then
        xPlayer.Functions.AddItem(itemname, count)
    else
        TriggerClientEvent("DenaliFW:Notify", source, "You are too heavy", "error")
    end
end)

DenaliFW.Functions.CreateCallback("kaves_drugs:checkCanCarryItem", function(source, cb, itemname, count)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    if DenaliFW.Player.GetTotalWeight(xPlayer.PlayerData.items) < 85000 then
        cb(true)
    else
        cb(false)
    end
end)

DenaliFW.Functions.CreateCallback("kaves_drugs:checkBlackMoney", function(source, cb)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    local blackcount = xPlayer.Functions.GetMoney('crypto')
    if blackcount > 0 then
        cb(blackcount)
    else
        cb(false)
    end
end)

RegisterServerEvent("kaves_drugs:removeBlackMoney")
AddEventHandler("kaves_drugs:removeBlackMoney", function()
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    local count = xPlayer.Functions.GetMoney('crypto')
    if xPlayer then
        xPlayer.Functions.RemoveMoney('crypto', count)
    end
end)

RegisterServerEvent("kaves_drugs:AddMoney")
AddEventHandler("kaves_drugs:AddMoney", function(count)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)
    xPlayer.Functions.AddMoney("cash", count)
end)