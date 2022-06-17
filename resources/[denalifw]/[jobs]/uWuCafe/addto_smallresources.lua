-- Add to denalifw-smallresources/server/consumables.lua

--uWu Cafe--
DenaliFW.Functions.CreateUseableItem("uwububbleteablueberry", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:uwububbleteablueberry", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwububbletearose", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:uwububbleteablueberry", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwububbleteamint", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:uwububbleteablueberry", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwupancake", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatPancakes", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwucupcake", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatDonut", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwuvanillasandy", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:uwuvanillasandy", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwuchocsandy", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:uwuchocsandy", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwubudhabowl", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:uwubudhabowl", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwusushi", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatPancakes", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("uwumisosoup", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:uwumisosoup", source, item.name)
    end
end)


--- Add to denalifw-smallresources/client/consumables.lua

--uWu Cafe
RegisterNetEvent("consumables:client:uwububbleteablueberry", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"bubbletea"})
    action = true
    DenaliFW.Functions.Progressbar("drink_something", "Popping some Bubble Tea..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("DenaliFW:Server:SetMetaData", "thirst", DenaliFW.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        action = false
    end)
end)
RegisterNetEvent("consumables:client:uwumisosoup", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"misosoup"})
    action = true
    DenaliFW.Functions.Progressbar("drink_something", "Supping some Soup..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("DenaliFW:Server:SetMetaData", "thirst", DenaliFW.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        action = false
    end)
end)
RegisterNetEvent("consumables:client:uwubudhabowl", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"budhabowl"})
    action = true
    DenaliFW.Functions.Progressbar("eat_something", "Banging a bowl of goodness..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("DenaliFW:Server:SetMetaData", "hunger", DenaliFW.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        action = false
    end)
end)
RegisterNetEvent("consumables:client:uwuvanillasandy", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"uwusandy"})
    action = true
    DenaliFW.Functions.Progressbar("eat_something", "uWu Icecream Mmm..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("DenaliFW:Server:SetMetaData", "hunger", DenaliFW.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        action = false
    end)
end)
RegisterNetEvent("consumables:client:uwuchocsandy", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"uwusandy"})
    action = true
    DenaliFW.Functions.Progressbar("eat_something", "uWu Icecream Mmm..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        DeleteObject(prop)
        TriggerServerEvent("DenaliFW:Server:SetMetaData", "hunger", DenaliFW.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        action = false
    end)
end)


-- Add to denalifw-smallresources/config.lua under ConsumablesEat

-- UwU
    ["uwupancake"] = math.random(25, 34),
    ["uwubudhabowl"] = math.random(50, 60),
    ["uwusushi"] = math.random(45, 50),
    ["uwucupcake"] = math.random(40, 45),
    ["uwuvanillasandy"] = math.random(50, 65),
    ["uwuchocsandy"] = math.random(50, 65),

-- Add to denalifw-smallresources/config.lua under ConsumeablesDrink

-- UwU
    ["uwububbleteablueberry"] = math.random(55, 60),
    ["uwububbletearose"] = math.random(55, 60),
    ["uwububbleteamint"] = math.random(55, 60),
    ["uwumisosoup"] = math.random(80, 90),
