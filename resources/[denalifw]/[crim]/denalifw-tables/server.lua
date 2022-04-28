local DenaliFW = exports['denalifw-core']:GetCoreObject()

DenaliFW.Functions.CreateUseableItem("coketable", function(source, item)
	local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("denalifw-tables:client:installCoke", source, item)
end)

RegisterServerEvent("denalifw-tables:server:RemoveCoke", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("coketable", 1)
end)

RegisterServerEvent('denalifw-tables:server:processCrackTable', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local cokebaggy = Player.Functions.GetItemByName('cokebaggy')

    if Player.PlayerData.items ~= nil then 
        if cokebaggy ~= nil then 
            if cokebaggy.amount >= 3 then 
                Player.Functions.RemoveItem("cokebaggy", 3, false)
                TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['cokebaggy'], "remove")
                TriggerClientEvent("denalifw-tables:client:CompleteCrackTable", src)
            else
                TriggerClientEvent('DenaliFW:Notify', src, "You do not have the correct items", 'error')   
            end
        else
            TriggerClientEvent('DenaliFW:Notify', src, "You do not have the correct items", 'error')   
        end
    else
        TriggerClientEvent('DenaliFW:Notify', src, "You Have Nothing...", "error")
    end
end)

RegisterServerEvent('denalifw-tables:server:getcrack', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("crack_baggy", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['crack_baggy'], "add")
end)

------------------------------------------

DenaliFW.Functions.CreateUseableItem("weedtable", function(source, item)
	local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("denalifw-tables:client:installweed", source, item)
end)

RegisterServerEvent("denalifw-tables:server:Removeweed", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("weedtable", 1)
end)

RegisterServerEvent('denalifw-tables:server:processweedTable', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local weedbrick = Player.Functions.GetItemByName('weed_brick')

    if Player.PlayerData.items ~= nil then 
        if weedbrick ~= nil then 
            if weedbrick.amount >= 3 then 
                Player.Functions.RemoveItem("weed_brick", 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['weed_brick'], "remove")
                TriggerClientEvent("denalifw-tables:client:CompleteweedTable", src)
            else
                TriggerClientEvent('DenaliFW:Notify', src, "You do not have the correct items", 'error')   
            end
        else
            TriggerClientEvent('DenaliFW:Notify', src, "You do not have the correct items", 'error')   
        end
    else
        TriggerClientEvent('DenaliFW:Notify', src, "You Have Nothing...", "error")
    end
end)

RegisterServerEvent('denalifw-tables:server:getweed', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("weed_white-widow", math.random(9, 18))
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['weed_white-widow'], "add")
end)

-----------------------------------

DenaliFW.Functions.CreateUseableItem("methtable", function(source, item)
	local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("denalifw-tables:client:installmeth", source, item)
end)

RegisterServerEvent("denalifw-tables:server:Removemeth", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("methtable", 1)
end)

RegisterServerEvent('denalifw-tables:server:processmethTable', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local methtray = Player.Functions.GetItemByName('methtray')

    if Player.PlayerData.items ~= nil then 
        if methtray ~= nil then 
            if methtray.amount >= 3 then 
                Player.Functions.RemoveItem("methtray", 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['methtray'], "remove")
                TriggerClientEvent("denalifw-tables:client:CompletemethTable", src)
            else
                TriggerClientEvent('DenaliFW:Notify', src, "You do not have the correct items", 'error')   
            end
        else
            TriggerClientEvent('DenaliFW:Notify', src, "You do not have the correct items", 'error')   
        end
    else
        TriggerClientEvent('DenaliFW:Notify', src, "You Have Nothing...", "error")
    end
end)

RegisterServerEvent('denalifw-tables:server:getmeth', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("meth", math.random(9, 18))
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['meth'], "add")
end)
