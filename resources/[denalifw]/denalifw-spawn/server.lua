local DenaliFW = exports['denalifw-core']:GetCoreObject()

DenaliFW.Functions.CreateCallback('denalifw-spawn:server:getOwnedHouses', function(source, cb, cid)
    if cid ~= nil then
        local houses = MySQL.Sync.fetchAll('SELECT * FROM player_houses WHERE citizenid = ?', {cid})
        if houses[1] ~= nil then
            cb(houses)
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

-- DenaliFW.Commands.Add("testloc", "Een race stoppen als creator.", {}, false, function(source, args)
-- 	local src = source
-- 	local Player = DenaliFW.Functions.GetPlayer(src)
-- 	TriggerClientEvent('denalifw-spawn:client:setupSpawns', src, Player, false, {})
-- 	TriggerClientEvent('denalifw-spawn:client:openUI', src, true)
-- end)