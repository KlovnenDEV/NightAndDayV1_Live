local DenaliFW = exports['denalifw-core']:GetCoreObject()

RegisterNetEvent("openpresent")
AddEventHandler("openpresent", function(source, item)
	local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem('lockpick', 2)
    Player.Functions.AddItem('phone', 1) 
    Player.Functions.AddItem('water_bottle', 2)
    Player.Functions.AddItem('sandwich', 2)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['lockpick'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['phone'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['water_bottle'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items['sandwich'] , "add")
    TriggerClientEvent('DenaliFW:Notify', src, "Present Opened, Check your inventory!", "primary", 3500)
end)

DenaliFW.Functions.CreateUseableItem('present', function(source, item)
	local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerEvent("openpresent", src, item.name)
    end
end)


