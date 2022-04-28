RegisterCommand("ldv2", function(source, args, raw)
    local src = source
    TriggerClientEvent("fthrow2:Togglefthrow2", src)
end)

RegisterServerEvent("fthrow2:SyncStartParticles")
AddEventHandler("fthrow2:SyncStartParticles", function(fthrow2id)
    TriggerClientEvent("fthrow2:StartParticles", -1, fthrow2id)
end)

RegisterServerEvent("fthrow2:SyncStopParticles")
AddEventHandler("fthrow2:SyncStopParticles", function(fthrow2id)
    TriggerClientEvent("fthrow2:StopParticles", -1, fthrow2id)
end)