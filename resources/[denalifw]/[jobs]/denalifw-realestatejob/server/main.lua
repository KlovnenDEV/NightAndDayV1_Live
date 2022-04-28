local DenaliFW = exports['denalifw-core']:GetCoreObject()

DenaliFW.Commands.Add("setestate", "Give Someone The Real Estate Job", {{
    name = "id",
    help = "ID Of The Player"
}}, false, function(source, args)
    local Player = DenaliFW.Functions.GetPlayer(source)

    if IsAuthorized(Player.PlayerData.citizenid) then
        local TargetId = tonumber(args[1])
        if TargetId ~= nil then
            local TargetData = DenaliFW.Functions.GetPlayer(TargetId)
            if TargetData ~= nil then
                TargetData.Functions.SetJob("realestate")
                TriggerClientEvent('DenaliFW:Notify', TargetData.PlayerData.source,
                    "You Were Hired As Real Estate Agent!")
                TriggerClientEvent('DenaliFW:Notify', source, "You have (" .. TargetData.PlayerData.charinfo.firstname ..
                    ") Hired As An Real Estate Agent!")
            end
        else
            TriggerClientEvent('DenaliFW:Notify', source, "You Must Provide A Player ID!")
        end
    else
        TriggerClientEvent('DenaliFW:Notify', source, "You Cannot Do This!", "error")
    end
end)

DenaliFW.Commands.Add("firerealestate", "Fire A Real Estate", {{
    name = "id",
    help = "ID Of The Player"
}}, false, function(source, args)
    local Player = DenaliFW.Functions.GetPlayer(source)

    if IsAuthorized(Player.PlayerData.citizenid) then
        local TargetId = tonumber(args[1])
        if TargetId ~= nil then
            local TargetData = DenaliFW.Functions.GetPlayer(TargetId)
            if TargetData ~= nil then
                if TargetData.PlayerData.job.name == "realestate" then
                    TargetData.Functions.SetJob("unemployed")
                    TriggerClientEvent('DenaliFW:Notify', TargetData.PlayerData.source,
                        "You Were Fired As An Real Estate Agent!")
                    TriggerClientEvent('DenaliFW:Notify', source,
                        "You have (" .. TargetData.PlayerData.charinfo.firstname .. ") Fired As Real Estate Agent!")
                else
                    TriggerClientEvent('DenaliFW:Notify', source, "Youre Not An Real Estate Agent!", "error")
                end
            end
        else
            TriggerClientEvent('DenaliFW:Notify', source, "You Must Provide A Player ID!", "error")
        end
    else
        TriggerClientEvent('DenaliFW:Notify', source, "You Cannot Do This!", "error")
    end
end)