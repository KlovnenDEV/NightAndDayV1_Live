local DenaliFW = exports["denalifw-core"]:GetCoreObject()
local Player = DenaliFW.Functions.GetPlayer
local onDuty = false

RegisterNetEvent('DenaliFW:Client:OnPlayerLoaded', function()
	DenaliFW.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.onduty then
			if PlayerData.job.name == "uwu" then
				TriggerServerEvent("DenaliFW:ToggleDuty")
			end
		end
	end)
end)

RegisterNetEvent('DenaliFW:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('DenaliFW:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent("denalifw-uwu:DutyUwu", function()
    TriggerServerEvent("DenaliFW:ToggleDuty")
end)

Citizen.CreateThread(function()
    uwu = AddBlipForCoord(-582.49, -1062.94, 22.35)
    SetBlipSprite (uwu, 463)
    SetBlipDisplay(uwu, 4)
    SetBlipScale  (uwu, 0.9)
    SetBlipAsShortRange(uwu, true)
    SetBlipColour(uwu, 34)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("UwU Cafe")
    EndTextCommandSetBlipName(uwu)
end)

RegisterNetEvent("denalifw-uwu:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwutray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwutray1", {
        maxweight = 10000,
        slots = 8,
    })
end)

RegisterNetEvent("denalifw-uwu:Tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwutray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwutray2", {
        maxweight = 10000,
        slots = 8,
    })
end)

RegisterNetEvent("denalifw-uwu:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwutray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwutray3", {
        maxweight = 10000,
        slots = 8,
    })
end)

RegisterNetEvent("denalifw-uwu:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwustorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwustorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("denalifw-uwu:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwustorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwustorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Food Preparation

--Bento Box
RegisterNetEvent("denalifw-uwu:bentobox", function()
	local randomToy = math.random(1, 100)
	TriggerServerEvent('DenaliFW:Server:RemoveItem', "uwubentobox", 1)
	--add items from box to inventory
	TriggerServerEvent('DenaliFW:Server:AddItem', "uwusushi", 1)
	TriggerServerEvent('DenaliFW:Server:AddItem', "uwububbletearose", 1)
	TriggerServerEvent('DenaliFW:Server:AddItem', "uwubudhabowl", 1)
	if randomToy < 45 then
		DenaliFW.Functions.Notify("Karen stole your toy :(", "uwu")
	elseif randomToy == 69 then
		TriggerServerEvent('DenaliFW:Server:AddItem', "uwu_toy1", 1)
		TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwu_toy1"], "add")
	elseif randomToy > 45 and randomToy < 53 then
		TriggerServerEvent('DenaliFW:Server:AddItem', "uwu_toy2", 1)
		TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwu_toy2"], "add")
		DenaliFW.Functions.Notify("^=◕ᴥ◕=^ lucky you! :)", "uwu")
	elseif randomToy == 54 then
		TriggerServerEvent('DenaliFW:Server:AddItem', "uwu_toy3", 1)
		TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwu_toy3"], "add")
		DenaliFW.Functions.Notify("^=◕ᴥ◕=^ lucky you! :)", "uwu")
	elseif randomToy > 55 and randomToy < 69 then
		TriggerServerEvent('DenaliFW:Server:AddItem', "uwu_toy4", 1)
		TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwu_toy3"], "add")
		DenaliFW.Functions.Notify("^=◕ᴥ◕=^ lucky you! :)", "uwu")
	elseif randomToy > 70 and randomToy < 85 then
		TriggerServerEvent('DenaliFW:Server:AddItem', "uwu_toy4", 1)
		TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwu_toy4"], "add")
		DenaliFW.Functions.Notify("^=◕ᴥ◕=^ lucky you! :)", "uwu")
	else
		DenaliFW.Functions.Notify("Karen stole your toy :(", "uwu")
	end
end)

RegisterNetEvent("denalifw-uwu:CreateBentobox", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientBentobox', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Preparing a Bento Box..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "uwusushi", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "uwububbletearose", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "uwubudhabowl", 1)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwubentobox", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwubentobox"], "add")
					DenaliFW.Functions.Notify("You prepared a purrrrfect Bentobox!", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "uwu")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)


-- Miso Soup (water + misopaste + tofu)

RegisterNetEvent("denalifw-uwu:misoSoup", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientMiso', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Making Miso Soup..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "water_bottle", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "misopaste", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tofu", 1)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwumisosoup", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwumisosoup"], "add")
					DenaliFW.Functions.Notify("You made a healing Miso Soup!", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "uwu")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

-- Pancake (flour + egg + milk cheese)

RegisterNetEvent("denalifw-uwu:pancake", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientPancake', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Making Pancakies..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "milk", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "egg", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "cheese", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "flour", 1)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwupancake", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwupancake"], "add")
					DenaliFW.Functions.Notify("You made a Pancake", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "uwu")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

-- Blueberry Bubbletea (water + tea + uwubbessence + tapiokaballs)

RegisterNetEvent("denalifw-uwu:bbtea", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientBbtea', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Making Bubble Tea..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "water_bottle", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tea", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "uwubbessence", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tapiokaballs", 1)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwububbleteablueberry", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwububbleteablueberry"], "add")
					DenaliFW.Functions.Notify("You made Blueberry Bubble Tea", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "uwu")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

-- Rose Bubbletea (water + tea + uwuroseessence + tapiokaballs)

RegisterNetEvent("denalifw-uwu:rosetea", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientRosetea', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Making Bubble Tea..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "water_bottle", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tea", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "uwuroseessence", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tapiokaballs", 1)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwububbletearose", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwububbletearose"], "add")
					DenaliFW.Functions.Notify("You made Rose Bubble Tea", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "error")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

-- Mint Bubbletea (tea + milk + uwumintessence + tapiokaballs)

RegisterNetEvent("denalifw-uwu:minttea", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientMinttea', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Making Bubble Tea..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "water_bottle", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tea", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "uwumintessence", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tapiokaballs", 1)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwububbleteamint", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwububbleteamint"], "add")
					DenaliFW.Functions.Notify("You made Mint Bubble Tea", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "uwu")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

-- Cupcakes (rawsugar + milk + egg + flour)

RegisterNetEvent("denalifw-uwu:cupcake", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientCupcake', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Mixing Cupcakes..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "milk", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "egg", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "rawsugar", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "flour", 1)
					DenaliFW.Functions.Notify("You made some Cupcake", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "error")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

--uWu Sushi (blue fin tuna, avoacado, rice, and nori sheets)

RegisterNetEvent("denalifw-uwu:sushi", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientSushi', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Creating Sushi..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tuna", 1)		---obtained from fishing (complete)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "rice", 1)		---obtained by farming rice on riverbanks
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "avocado", 1)	---obtained by collecting from farming avocado trees
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "nori", 1)		---seaweed obtained from fishing and prepared into nori sheets (seaweed in fishing)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwusushi", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwusushi"], "add")
					DenaliFW.Functions.Notify("You made some Sushi!", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "error")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

--uWu Budha Bowl (Mixedlettuce, Tofu, Umami Beans, Avocado and Mango)

RegisterNetEvent("denalifw-uwu:CreateBudhabowl", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientBudhabowl', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Creating Budha Bowl..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "mixedlettuce", 1)	---obtained from farming (incomplete)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "tofu", 1)		---obtained from Grocery Store (incomplete)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "avocado", 1)	---obtained by collecting from farming avocado trees (complete)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "mango", 1)		---seaweed obtained from farming mango trees (complete)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "umami", 1)			---obtained from Grocery Store (incomplete)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwubudhabowl", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwubudhabowl"], "add")
					DenaliFW.Functions.Notify("You made a Budha Bowl!", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "uwu")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

-- Vanilla Sandwich (Milk flour rawsugar egg vanillabean [these will change])

RegisterNetEvent("denalifw-uwu:vSandwich", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientvSandwich', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Creating a Vanilla Sandy..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "milk", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "flour", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "rawsugar", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "egg", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "vanillabean", 2)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwuvanillasandy", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwuvanillasandy"], "add")
					DenaliFW.Functions.Notify("You made a Vanilla Sandy!", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "uwu")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

-- Chocolate Sandwich (Milk flour rawsugar egg chocolate [these will change])

RegisterNetEvent("denalifw-uwu:cSandwich", function()
	if onDuty then
		DenaliFW.Functions.TriggerCallback('denalifw-uwu:server:get:ingredientcSandwich', function(HasItems)
			if HasItems then
				DenaliFW.Functions.Progressbar("pickup_sla", "Creating a Chocolate Sandy..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "milk", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "flour", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "rawsugar", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "egg", 1)
					TriggerServerEvent('DenaliFW:Server:RemoveItem', "chocolate", 1)
					TriggerServerEvent('DenaliFW:Server:AddItem', "uwuchocsandy", 1)
					TriggerEvent("inventory:client:ItemBox", DenaliFW.Shared.Items["uwuchocsandy"], "add")
					DenaliFW.Functions.Notify("You made some Sushi!", "uwu")
				end, function()
					DenaliFW.Functions.Notify("Cancelled..", "uwu")
				end)
			else
				DenaliFW.Functions.Notify("You need ingredients MeOw", "uwu")
			end
		end)
	else
		DenaliFW.Functions.Notify("Tick Tock hit that clockIN", "uwu")
	end
end)

RegisterNetEvent("denalifw-uwu:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "uwu", Config.Items)
end)


--Uncomment if you would like some pussies for fun and a ped for sales

--[[local uwucats = {
	{-578.67, -1051.14, 22.55, nil, 184.38, nil, 0x573201B8}, --fireplace
	{-582.97, -1069.55, 22.78, nil, 191.27, nil, 0x573201B8}, --windowseat
	}
	Citizen.CreateThread(function()
	for _,v in pairs(uwucats) do
		RequestModel(v[7])
		while not HasModelLoaded(v[7]) do
			Wait(1000)
		end
		RequestAnimDict("amb@lo_res_idles@")
		while not HasAnimDictLoaded("amb@lo_res_idles@") do
			Wait(1000)
		end
		ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
		SetEntityHeading(ped, v[5])
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskPlayAnim(ped,"amb@lo_res_idles@","creatures_world_cat_ledge_sleep_lo_res_base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end
end)

local uwucat = {
	{-584.28, -1062.94, 23.40, nil, 38.97, nil, 0x573201B8}, --counter
}
Citizen.CreateThread(function()
	for _,v in pairs(uwucat) do
		RequestModel(v[7])
		while not HasModelLoaded(v[7]) do
			Wait(1000)
		end
		RequestAnimDict("amb@lo_res_idles@")
		while not HasAnimDictLoaded("amb@lo_res_idles@") do
			Wait(1000)
		end
		ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
		SetEntityHeading(ped, v[5])
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskPlayAnim(ped,"amb@lo_res_idles@","creatures_world_cat_ground_sleep_lo_res_base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end
end)

local uwusales = {
	{-584.77, -1059.01, 22.34, nil, 262.74, nil, 0x969B6DFE},
}
Citizen.CreateThread(function()
	for _,v in pairs(uwusales) do
		RequestModel(v[7])
		while not HasModelLoaded(v[7]) do
			Wait(1000)
		end
		RequestAnimDict("anim@amb@board_room@whiteboard@")
		while not HasAnimDictLoaded("anim@amb@board_room@whiteboard@") do
			Wait(1000)
		end
		ped = CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
		SetEntityHeading(ped, v[5])
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
		TaskPlayAnim(ped,"anim@amb@board_room@whiteboard@", "think_01_amy_skater_01", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end
end)]]--