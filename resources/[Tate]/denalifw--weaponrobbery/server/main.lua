DenaliFW = exports['denalifw-core']:GetCoreObject()

-- Code

local timeOut = false

local alarmTriggered = false


RegisterServerEvent('denalifw-weashop:server:setVitrineState')
AddEventHandler('denalifw-weashop:server:setVitrineState', function(stateType, state, k)
    --DenaliFW.Functions.BanInjection(source, 'denalifw-weashop (setVitrineState)')
end)

RegisterServerEvent('denalifw-weashop:server:vitrineReward')
AddEventHandler('denalifw-weashop:server:vitrineReward', function()
    --DenaliFW.Functions.BanInjection(source, 'denalifw-weashop (vitrineReward)')
end)


DenaliFW.Functions.CreateCallback('denalifw-weashop:vitrineReward', function(source, cb)
	local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local otherchance = math.random(1, 2)
    local odd = math.random(1, 2)

    if otherchance == odd then
        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('DenaliFW:Notify', src, 'You have too much in your pocket..', 'error')
        end
    else
        local amount = math.random(1, 2)
        local data = {
            worth = math.random(200,2000)
        }
    
        Player.Functions.AddItem('markedbills', 1, false, data)
        TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["markedbills"], 'add')
        TriggerClientEvent('DenaliFW:Notify', src, 'Receive black money: $' ..data.worth, "success")

        
       -- if Player.Functions.AddItem("10kgoldchain", amount) then
        --    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["10kgoldchain"], 'add')
       -- else
         --   TriggerClientEvent('DenaliFW:Notify', src, 'Je hebt teveel op zak..', 'error')
       -- end
    end
end)	

DenaliFW.Functions.CreateCallback('denalifw-weashop:server:setVitrineState', function(source, cb, stateType, state, k)
	Config.Locations[k][stateType] = state
    TriggerClientEvent('denalifw-weashop:client:setVitrineState', -1, stateType, state, k)
end)

DenaliFW.Functions.CreateCallback('denalifw-weashop:server:setTimeout', function(source, cb)
	if not timeOut then
        timeOut = true
        TriggerEvent('denalifw-scoreboard:server:SetActivityBusy', "weaponshop", true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, v in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('denalifw-weashop:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('denalifw-weashop:client:setAlertState', -1, false)
                TriggerEvent('denalifw-scoreboard:server:SetActivityBusy', "weaponshop", false)
            end
            timeOut = false
            alarmTriggered = false
        end)
    end
end)

DenaliFW.Functions.CreateCallback('denalifw-weashop:server:PoliceAlertMessage', function(source, cb, title, coords, blip)
	local src = source
    local alertData = {
        title = title,
        coords = {x = coords.x, y = coords.y, z = coords.z},

        description = "Possible robbery going on at the Ammonation <br>Available camera: 39",
    }

    for k, v in pairs(DenaliFW.Functions.GetPlayers()) do
        local Player = DenaliFW.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                if blip then
                    if not alarmTriggered then
                        TriggerClientEvent("denalifw-phone:client:addPoliceAlert", v, alertData)
                        TriggerClientEvent("denalifw-weashop:client:PoliceAlertMessage", v, title, coords, blip)
                        alarmTriggered = true
                    end
                else
                    TriggerClientEvent("denalifw-phone:client:addPoliceAlert", v, alertData)
                    TriggerClientEvent("denalifw-weashop:client:PoliceAlertMessage", v, title, coords, blip)
                end
            end
        end
    end
end)


RegisterServerEvent('denalifw-weashop:server:setTimeout')
AddEventHandler('denalifw-weashop:server:setTimeout', function()
    DenaliFW.Functions.BanInjection(source, 'denalifw-weashop (setTimeout)')
end)

RegisterServerEvent('denalifw-weashop:server:PoliceAlertMessage')
AddEventHandler('denalifw-weashop:server:PoliceAlertMessage', function(title, coords, blip)
    DenaliFW.Functions.BanInjection(source, 'denalifw-weashop (PoliceAlertMessage)')
end)

DenaliFW.Functions.CreateCallback('denalifw-weashop:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(DenaliFW.Functions.GetPlayers()) do
        local Player = DenaliFW.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
	end
	cb(amount)
end)