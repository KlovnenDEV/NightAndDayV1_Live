local DenaliFW = exports['denalifw-core']:GetCoreObject()
local trunkBusy = {}

RegisterNetEvent('denalifw-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('denalifw-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

RegisterNetEvent('denalifw-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

RegisterNetEvent('denalifw-trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('denalifw-trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

DenaliFW.Functions.CreateCallback('denalifw-trunk:server:getTrunkBusy', function(source, cb, plate)
    if trunkBusy[plate] then
        cb(true)
    end
    cb(false)
end)

DenaliFW.Commands.Add("getintrunk", "Get In Trunk", {}, false, function(source, args)
    TriggerClientEvent('denalifw-trunk:client:GetIn', source)
end)

DenaliFW.Commands.Add("putintrunk", "Put Player In Trunk", {}, false, function(source, args)
    TriggerClientEvent('denalifw-trunk:server:KidnapTrunk', source)
end)

RegisterServerEvent('qb-phone:server:GiveContactDetails')
AddEventHandler('qb-phone:server:GiveContactDetails', function(PlayerId)
    local src = source
    local Player = RepentzFW.Functions.GetPlayer(src)

    local SuggestionData = {
        name = {
            [1] = Player.PlayerData.charinfo.firstname,
            [2] = Player.PlayerData.charinfo.lastname
        },
        number = Player.PlayerData.charinfo.phone,
        bank = Player.PlayerData.charinfo.account
    }

    TriggerClientEvent('qb-phone:client:AddNewSuggestion', PlayerId, SuggestionData)
end)