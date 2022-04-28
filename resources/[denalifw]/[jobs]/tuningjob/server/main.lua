local DenaliFW = exports['denalifw-core']:GetCoreObject()

function IsAuthorized(CitizenId)
    local retval = false
    for _, cid in pairs(Config.AuthorizedIds) do
        if cid == CitizenId then
            retval = true
            break
        end
    end
    return retval
end

DenaliFW.Commands.Add("settuning", "Hire Someone as RedLine Employee", {{
    name = "id",
    help = "ID Of The Player"
}}, false, function(source, args)
    local Player = DenaliFW.Functions.GetPlayer(source)

    if IsAuthorized(Player.PlayerData.citizenid) then
        local TargetId = tonumber(args[1])
        if TargetId ~= nil then
            local TargetData = DenaliFW.Functions.GetPlayer(TargetId)
            if TargetData ~= nil then
                TargetData.Functions.SetJob("tuning")
                TriggerClientEvent('DenaliFW:Notify', TargetData.PlayerData.source,
                    "You Were Hired As An RedLine Employee!")
                TriggerClientEvent('DenaliFW:Notify', source, "You have (" .. TargetData.PlayerData.charinfo.firstname ..
                    ") Hired As An RedLine Employee!")
            end
        else
            TriggerClientEvent('DenaliFW:Notify', source, "You Must Provide A Player ID!")
        end
    else
        TriggerClientEvent('DenaliFW:Notify', source, "You Cannot Do This!", "error")
    end
end)

DenaliFW.Commands.Add("firetuning", "Fire A Tuning Employee", {{
    name = "id",
    help = "ID Of The Player"
}}, false, function(source, args)
    local Player = DenaliFW.Functions.GetPlayer(source)

    if IsAuthorized(Player.PlayerData.citizenid) then
        local TargetId = tonumber(args[1])
        if TargetId ~= nil then
            local TargetData = DenaliFW.Functions.GetPlayer(TargetId)
            if TargetData ~= nil then
                if TargetData.PlayerData.job.name == "tuning" then
                    TargetData.Functions.SetJob("unemployed")
                    TriggerClientEvent('DenaliFW:Notify', TargetData.PlayerData.source,
                        "You Were Fired As An RedLine Employee!")
                    TriggerClientEvent('DenaliFW:Notify', source,
                        "You have (" .. TargetData.PlayerData.charinfo.firstname .. ") Fired As RedLine Employee!")
                else
                    TriggerClientEvent('DenaliFW:Notify', source, "Youre Not An Employee of RedLine!", "error")
                end
            end
        else
            TriggerClientEvent('DenaliFW:Notify', source, "You Must Provide A Player ID!", "error")
        end
    else
        TriggerClientEvent('DenaliFW:Notify', source, "You Cannot Do This!", "error")
    end
end)

RegisterServerEvent("6scripts-tuning:server:buyItem")
AddEventHandler("6scripts-tuning:server:buyItem", function(item, amount, money)
    local Player = DenaliFW.Functions.GetPlayer(source)
    local CashBalance = Player.PlayerData.money["cash"]
	
	if CashBalance >= money then
        Player.Functions.RemoveMoney("cash", money, "dealer-item-bought")
        TriggerClientEvent("DenaliFW:Notify", source, "You Paid $"..money, "success")
        Player.Functions.AddItem(item, amount, toSlot)
        TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items[item], "add", amount)
	else
        TriggerClientEvent("DenaliFW:Notify", source, "You don\'t have that much money, you need $" ..money, "error")
	end
end)