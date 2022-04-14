DenaliFW = nil

local DenaliFW = exports['denalifw-core']:GetCoreObject()

-- Oxy Run
RegisterServerEvent('rolexdelivery:server')
AddEventHandler('rolexdelivery:server', function()
	local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

	if Player.PlayerData.money.cash >= Config.StartRolexPayment then
		Player.Functions.RemoveMoney('cash', Config.StartRolexPayment)
		
		TriggerClientEvent("rolexdelivery:startDealing", source)
	else
		TriggerClientEvent('DenaliFW:Notify', src, "You dont have enough money to start an rolex run")
	end
end)

RegisterServerEvent('rolexdelivery:receivemoney-rolex')
AddEventHandler('rolexdelivery:receivemoney-rolex', function()
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(src)

	TriggerClientEvent('DenaliFW:Notify', src, "You were handed $ "..Config.RolexPayment)
	--TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'success', text = 'You were handed $'..Config.Payment, length = 10000})
	Player.Functions.RemoveItem('rolex', 1)
	Player.Functions.AddMoney('cash',Config.RolexPayment)
end)

RegisterServerEvent('rolexdelivery:receivemoney-norolex')
AddEventHandler('rolexdelivery:receivemoney-norolex', function()
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(src)

	TriggerClientEvent('DenaliFW:Notify', src, "You were handed $ "..Config.NoRolexPayment)
	--TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'success', text = 'You were handed $'..Config.Payment, length = 10000})
	Player.Functions.AddMoney('cash', Config.NoRolexPayment)
end)

DenaliFW.Functions.CreateCallback('denalifw-rolexrun:server:HasItem', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("rolex")

    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)