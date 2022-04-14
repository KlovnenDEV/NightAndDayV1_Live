RegisterNetEvent('denalifw-radialmenu:server:RemoveStretcher', function(PlayerPos, StretcherObject)
    TriggerClientEvent('denalifw-radialmenu:client:RemoveStretcherFromArea', -1, PlayerPos, StretcherObject)
end)

RegisterNetEvent('denalifw-radialmenu:Stretcher:BusyCheck', function(id, type)
    local MyId = source
    TriggerClientEvent('denalifw-radialmenu:Stretcher:client:BusyCheck', id, MyId, type)
end)

RegisterNetEvent('denalifw-radialmenu:server:BusyResult', function(IsBusy, OtherId, type)
    TriggerClientEvent('denalifw-radialmenu:client:Result', OtherId, IsBusy, type)
end)
