local DenaliFW = exports['denalifw-core']:GetCoreObject()

RegisterNetEvent('denalifw-simpefarming:sellItems', function()
    local src = source
    local price = 0
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Config.Sell[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Sell[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price)
        TriggerClientEvent('DenaliFW:Notify', src, "You have sold your items")
    else 
		TriggerClientEvent('DenaliFW:Notify', src, "You do not have the items to sell here!")
	end
end)
------------------------------- Apple Stuff ----------------------------



------------------------------- Pumpkin Farming ----------------------------

RegisterServerEvent('denalifw-simplefarming:pumpkinpicking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local pumpkinfarming = 1
    Player.Functions.AddItem('rawpumpkin', pumpkinfarming)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['rawpumpkin'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Picked up " ..pumpkinfarming.. " Pumpkin")
end)

RegisterServerEvent('denalifw-simplefarming:pumpkinprocessing', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local pumpkin = Player.Functions.GetItemByName('rawpumpkin')
    if not pumpkin then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_milkprocessor'])
        return false 
    end

    local amount = pumpkin.amount
    if amount >= 1 then
        amount = Config.PumpkinProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('rawpumpkin', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['rawpumpkin'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['pumpkin_processing'])
    local amount = Config.PumpkinBoxes
    Wait(750)
    Player.Functions.AddItem('pumpkinpiebox', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['pumpkinpiebox'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['pumpkin_trader'])
end)

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:pumpkincheck', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("rawpumpkin") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)







