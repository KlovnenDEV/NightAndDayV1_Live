local PlayerTimeOut = {}
local DenaliFW = exports['denalifw-core']:GetCoreObject()
local EnableTimeout = function(time, citizenid, source)
    if PlayerTimeOut[citizenid] == nil then
        PlayerTimeOut[citizenid] = time
        TriggerClientEvent('denalifw-containerrobbery:client:setSync', source, time)

        while PlayerTimeOut[citizenid] > 0 and source ~= nil do
            Citizen.Wait(60000)
            PlayerTimeOut[citizenid] = PlayerTimeOut[citizenid] - 1
            TriggerClientEvent('denalifw-containerrobbery:client:setSync', source, time)
            if PlayerTimeOut[citizenid] == 0 then
                PlayerTimeOut[citizenid] = nil
                break
            end
        end
        PlayerTimeOut[citizenid] = nil
    end
end

RegisterServerEvent('denalifw-containerrobbery:server:onRobberyFinish')
AddEventHandler('denalifw-containerrobbery:server:onRobberyFinish', function(useLootTable, rewardAmount, rewardMessage, itemRewardMessage, lootTable, fullInventoryMessage, TimeOutTime, ForcedTimeout)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    if Player ~= nil then
        if ForcedTimeout then
            EnableTimeout(TimeOutTime, Player.PlayerData.citizenid, src)
        else
            if useLootTable then
                local chosentable = lootTable[math.random(1, #lootTable)]
                if math.random(1, 100) < chosentable['chance'] then
                    if Player.Functions.AddItem(chosentable['item'], chosentable['amount']) then
                        TriggerEvent('denalifw-containerrobbery:server:logToServer', 'Got x'..chosentable['amount']..' of '..chosentable['item']..'!', src)
                        TriggerClientEvent('inventory:client:itemBox', src, DenaliFW.Shared.Items[chosentable['item']], "add")
                        TriggerClientEvent('DenaliFW:Notify', src, itemRewardMessage:format(chosentable['amount'], chosentable['item']), 'success')
                    else
                        TriggerClientEvent('DenaliFW:Notify', src, fullInventoryMessage, 'error')
                    end
                end
            end
            TriggerEvent('denalifw-containerrobbery:server:logToServer', 'Got $'..rewardAmount..'.', src)
            Player.Functions.AddMoney('cash', rewardAmount)
            TriggerClientEvent('DenaliFW:Notify', src, rewardMessage:format(rewardAmount), 'success')
            EnableTimeout(TimeOutTime, Player.PlayerData.citizenid, src)
        end
    end
end)

DenaliFW.Functions.CreateCallback('denalifw-containerrobbery:server:checkCopCount', function(source, cb)
    local amount = 0
    local srcPlayer = DenaliFW.Functions.GetPlayer(source)
    for k, v in pairs(DenaliFW.Functions.GetPlayers()) do
        local Player = DenaliFW.Functions.GetPlayer(v)
        if Player ~= nil then
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
    end
    cb(amount, PlayerTimeOut[srcPlayer.PlayerData.citizenid])
end)

RegisterServerEvent('denalifw-containerrobbery:server:logToServer')
AddEventHandler('denalifw-containerrobbery:server:logToServer', function(message, source)
    TriggerEvent('xz-logs:server:sendLog', {User = source}, 'robbery', 'Container Robbery', message, {}, 'orange', "denalifw-containerrobbery")
end)