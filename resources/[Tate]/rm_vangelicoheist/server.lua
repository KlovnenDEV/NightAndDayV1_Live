local lastrob = 0
local start = false
discord = {
    ['webhook'] = 'DISCORDWEBHOOKLINK',
    ['name'] = 'rm_vangelicoheist',
    ['image'] = 'https://cdn.discordapp.com/avatars/869260464775921675/dea34d25f883049a798a241c8d94020c.png?size=1024'
}

DenaliFW.Functions.CreateUseableItem(Config['VangelicoHeist']['gasMask']['itemName'], function(source, item)
    local src = source
    TriggerClientEvent('vangelicoheist:client:wearMask', src)
end)

DenaliFW.Functions.CreateCallback('vangelicoheist:server:checkPoliceCount', function(source, cb)
    local src = source
    local players = DenaliFW.Functions.GetPlayers()
    local policeCount = 0

    for i = 1, #players do
        local player = DenaliFW.Functions.GetPlayer(players[i])
        if player.PlayerData.job.name == 'police' then
            policeCount = policeCount + 1
        end
    end

    if policeCount >= Config['VangelicoHeist']['requiredPoliceCount'] then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('vangelicoheist:client:showNotification', src, Strings['need_police'])
    end
end)

DenaliFW.Functions.CreateCallback('vangelicoheist:server:checkTime', function(source, cb)
    local src = source
    local player = DenaliFW.Functions.GetPlayer(src)
    
    if (os.time() - lastrob) < Config['VangelicoHeist']['nextRob'] and lastrob ~= 0 then
        local seconds = Config['VangelicoHeist']['nextRob'] - (os.time() - lastrob)
        TriggerClientEvent('vangelicoheist:client:showNotification', src, Strings['wait_nextrob'] .. ' ' .. math.floor(seconds / 60) .. ' ' .. Strings['minute'])
        cb(false)
    else
        lastrob = os.time()
        start = true
        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' started the Vangelico Heist!')
        cb(true)
    end
end)

DenaliFW.Functions.CreateCallback('vangelicoheist:server:hasItem', function(source, cb, item)
    local src = source
    local player = DenaliFW.Functions.GetPlayer(src)
    local playerItem = player.Functions.GetItemByName(item)

    if player then 
        if playerItem ~= nil then
            if playerItem.amount >= 1 then
                cb(true, playerItem.label)
            end
        else
            cb(false, DenaliFW.Shared.Items[item].label)
        end
    end
end)

RegisterServerEvent('vangelicoheist:server:policeAlert')
AddEventHandler('vangelicoheist:server:policeAlert', function(coords)
    local players = DenaliFW.Functions.GetPlayers()
    
    for i = 1, #players do
        local player = DenaliFW.Functions.GetPlayer(players[i])
        if player.PlayerData.job.name == 'police' then
            TriggerClientEvent('vangelicoheist:client:policeAlert', players[i], coords)
        end
    end
end)

RegisterServerEvent('vangelicoheist:server:rewardItem')
AddEventHandler('vangelicoheist:server:rewardItem', function(item)
    local src = source
    local player = DenaliFW.Functions.GetPlayer(src)
    local whitelistItems = {}

    if player then
        for k, v in pairs(Config['VangelicoHeist']['smashRewards']) do
            whitelistItems[v['item']] = true
        end

        for k, v in pairs(Config['VangelicoInside']['glassCutting']['rewards']) do
            whitelistItems[v['item']] = true
        end

        for k, v in pairs(Config['VangelicoInside']['painting']) do
            whitelistItems[v['rewardItem']] = true
        end

        if whitelistItems[item] then
            player.Functions.AddItem(item, 1)
        else
            print('[rm_vangelicoheist] add item exploit playerID: '.. src .. ' name: ' .. GetPlayerName(src))
        end
    end
end)

RegisterServerEvent('vangelicoheist:server:sellRewardItems')
AddEventHandler('vangelicoheist:server:sellRewardItems', function()
    local src = source
    local player = DenaliFW.Functions.GetPlayer(src)
    local totalMoney = 0

    if player then
        for k, v in pairs(Config['VangelicoHeist']['smashRewards']) do
            local playerItem = player.Functions.GetItemByName(v['item'])
            if playerItem ~= nil and playerItem.amount > 0 then
                player.Functions.RemoveItem(v['item'], playerItem.amount)
                player.Functions.AddMoney('cash', playerItem.amount * v['price'])
                totalMoney = totalMoney + (playerItem.amount * v['price'])
            end
        end

        for k, v in pairs(Config['VangelicoInside']['glassCutting']['rewards']) do
            local playerItem = player.Functions.GetItemByName(v['item'])
            if playerItem ~= nil and playerItem.amount > 0 then
                player.Functions.RemoveItem(v['item'], playerItem.amount)
                player.Functions.AddMoney('cash', playerItem.amount * v['price'])
                totalMoney = totalMoney + (playerItem.amount * v['price'])
            end
        end

        for k, v in pairs(Config['VangelicoInside']['painting']) do
            local playerItem = player.Functions.GetItemByName(v['rewardItem'])
            if playerItem ~= nil and playerItem.amount > 0 then
                player.Functions.RemoveItem(v['rewardItem'], playerItem.amount)
                player.Functions.AddMoney('cash', playerItem.amount * v['paintingPrice'])
                totalMoney = totalMoney + (playerItem.amount * v['paintingPrice'])
            end
        end

        discordLog(player.PlayerData.name ..  ' - ' .. player.PlayerData.license, ' Gain $' .. totalMoney .. ' on the Vangelico Heist Buyer!')
        TriggerClientEvent('vangelicoheist:client:showNotification', src, Strings['total_money'] .. ' $' .. math.floor(totalMoney))
    end
end)

RegisterCommand('pdvangelico', function(source, args)
    local src = source
    local player = DenaliFW.Functions.GetPlayer(src)
    
    if player then
        if player.PlayerData.job.name == 'police' then
            if start then
                TriggerClientEvent('vangelicoheist:client:resetHeist', -1)
                start = false
            end
        else
            TriggerClientEvent('vangelicoheist:client:showNotification', src, 'You are not cop!')
        end
    end
end)

RegisterServerEvent('vangelicoheist:server:startGas')
AddEventHandler('vangelicoheist:server:startGas', function()
    TriggerClientEvent('vangelicoheist:client:startGas', -1)
end)

RegisterServerEvent('vangelicoheist:server:insideLoop')
AddEventHandler('vangelicoheist:server:insideLoop', function()
    TriggerClientEvent('vangelicoheist:client:insideLoop', -1)
end)

RegisterServerEvent('vangelicoheist:server:lootSync')
AddEventHandler('vangelicoheist:server:lootSync', function(type, index)
    TriggerClientEvent('vangelicoheist:client:lootSync', -1, type, index)
end)

RegisterServerEvent('vangelicoheist:server:globalObject')
AddEventHandler('vangelicoheist:server:globalObject', function(obj, random)
    TriggerClientEvent('vangelicoheist:client:globalObject', -1, obj, random)
end)

RegisterServerEvent('vangelicoheist:server:smashSync')
AddEventHandler('vangelicoheist:server:smashSync', function(sceneConfig)
    TriggerClientEvent('vangelicoheist:client:smashSync', -1, sceneConfig)
end)

function discordLog(name, message)
    local data = {
        {
            ["color"] = '3553600',
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = data, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end