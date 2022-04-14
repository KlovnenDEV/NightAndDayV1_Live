local DenaliFW = exports['denalifw-core']:GetCoreObject()

RegisterServerEvent('houseRobberies:removeLockpick')
AddEventHandler('houseRobberies:removeLockpick', function()
 local source = tonumber(source)
 local xPlayer = DenaliFW.Functions.GetPlayer(source)
 xPlayer.Functions.RemoveItem('advancedlockpick', 1)
 TriggerClientEvent('DenaliFW:Notify', source, 'The lockpick bent out of shape.', "error")
end)

RegisterServerEvent('houseRobberies:giveMoney')
AddEventHandler('houseRobberies:giveMoney', function()
 local source = tonumber(source)
 local xPlayer = DenaliFW.Functions.GetPlayer(source)
 local cash = math.random(100, 300)
 xPlayer.Functions.AddItem('bands', cash)
 xPlayer.Functions.AddItem('cryptostick', 1)
 PerformHttpRequest('', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ Got Money: **" .. cash .. "** **.** "}), { ['Content-Type'] = 'application/json' })
 TriggerClientEvent('DenaliFW:Notify', source, 'You got a Crypto Stick and You found $'..cash)
end)

RegisterServerEvent('houseRobberies:searchItem')
AddEventHandler('houseRobberies:searchItem', function()
 local source = tonumber(source)
 local item = {}
 local xPlayer = DenaliFW.Functions.GetPlayer(source)
 local gotID = {}

 for i=1, math.random(1, 2) do
  item = Config.RobbableItems[math.random(1, #Config.RobbableItems)]
  if math.random(1, 13) >= item.chance then
   if tonumber(item.id) == 0 and not gotID[item.id] then
    gotID[item.id] = true
    xPlayer.Functions.AddItem('bands', item.quantity)
    PerformHttpRequest('https://discord.com/api/webhooks/963468401756471356/7o4eJ2GVdH6RXarH_CATCm-h3qgMlqIHwWXMID8e7HfrXU_GodyRX_Vnt3qKbnNX3W5J', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ Found: **" .. item.isWeapon .. "** **.** "}), { ['Content-Type'] = 'application/json' })
    TriggerClientEvent('DenaliFW:Notify', source, 'You found $'..item.quantity)
   elseif not gotID[item.id] then
    gotID[item.id] = true
    xPlayer.Functions.AddItem(item.id, item.quantity)
    PerformHttpRequest('https://discord.com/api/webhooks/963468401756471356/7o4eJ2GVdH6RXarH_CATCm-h3qgMlqIHwWXMID8e7HfrXU_GodyRX_Vnt3qKbnNX3W5J', function(err, text, headers) end, 'POST', json.encode({username = "House Robberies Log", content = "__**" .. GetPlayerName(source) .. "**__ Found: **" .. item.id .. "** **.** "}), { ['Content-Type'] = 'application/json' })
    TriggerClientEvent('DenaliFW:Notify', source, 'Item Added!')
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items[item.id], item.quantity, 'add')
   end
  end
 end
end)

DenaliFW.Functions.CreateCallback('houserob:checkcops', function(source, cb)
  local currentplayers = DenaliFW.Functions.GetPlayers()
  local cops = 0

  for i = 1, #currentplayers, 1 do
    local xPlayer = DenaliFW.Functions.GetPlayer(currentplayers[i])
    if xPlayer.PlayerData.job ~= nil and xPlayer.PlayerData.job.name == "police" then
      cops = cops + 1
    end
  end

  cb(cops)
end)

DenaliFW.Functions.CreateUseableItem("police_stormram", function(source, item)
	local Player = DenaliFW.Functions.GetPlayer(source)

	if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
		TriggerClientEvent("denalifw-houses:client:HomeInvasion", source)
	else
		TriggerClientEvent('DenaliFW:Notify', source, "This is only possible for emergency services!", "error")
	end
end)

RegisterServerEvent('houserob')
AddEventHandler('houserob', function(data, customcoords)
    if customcoords ~= nil then data.coords = customcoords end
    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
        job = 'police', 
        coords = data.coords,
        title = 'Home Alarm Alert',
        message = 'Silent alarm at '..data.street_1..', '..data.street_2, 
        flash = 0, 
        blip = {
            sprite = 40, 
            scale = 1.2, 
            colour = 1,
            flashes = false, 
            text = 'House Robbery',
            time = (5*60*1000),
            sound = 1,
        }
    })
end)
