local DenaliFW = exports['denalifw-core']:GetCoreObject()
local scavengerHuntStarted = false

--[[ DenaliFW.Commands.Add("scavenger_taskcomplete", "Description", {{name="team #", help="Team Number"}, {name="task #", help="Completed Task"}}, true, function(source, args)
    local src = source 
    local Player = DenaliFW.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    local teamNumber = tonumber(args[1])
    local task = tonumber(args[2])

    Config.Teams[teamNumber]["hunts"][task]["completed"] = true

    for k, v in pairs(Config.Teams[teamNumber]["members"]) do
        local Target = DenaliFW.Functions.GetPlayerByCitizenId(v)
        TriggerClientEvent('denalifw-scavengerhunt:client:getHunts', Target.PlayerData.source, Config.Teams[teamNumber]["hunts"])
    end
end, "god") ]]

DenaliFW.Functions.CreateUseableItem("scavenger_hunt_list", function(source, item)
    local src = source

    TriggerClientEvent('denalifw-scavengerhunt:client:openList', src)
end)

DenaliFW.Functions.CreateCallback('denalifw-scavengerhunt:server:getHunts', function(source, cb)
    cb(Config.Hunts)
end)

RegisterServerEvent('denalifw-scavengerhunt:server:getTeamMembers')
AddEventHandler('denalifw-scavengerhunt:server:getTeamMembers', function(teamNumber)
    if not scavengerHuntStarted then
        local src = source
        local membersList = {}
        teamNumber = tonumber(teamNumber)

        if Config.Teams[teamNumber] ~= nil then
            for k, v in pairs(Config.Teams[teamNumber]["members"]) do
                table.insert(membersList, v)
            end
        end
        
        TriggerClientEvent('denalifw-scavengerhunt:client:getTeamReceived', src, membersList)
    end
end)

RegisterServerEvent('denalifw-scavengerhunt:server:joinTeam')
AddEventHandler('denalifw-scavengerhunt:server:joinTeam', function(teamNumber)
    if not scavengerHuntStarted then
        local src = source 
        local Player = DenaliFW.Functions.GetPlayer(src)
        local citizenid = Player.PlayerData.citizenid
        teamNumber = tonumber(teamNumber)

        for k, v in pairs(Config.Teams) do
            for a, s in pairs(Config.Teams[k]["members"]) do
                if citizenid == s then
                    table.remove(Config.Teams[k]["members"], a)
                    TriggerClientEvent('DenaliFW:Notify', src, 'You were removed from Team '..k, 'error', 3000)
                    break
                end
            end
        end

        if Config.Teams[teamNumber] == nil then
            Config.Teams[teamNumber] = {
                members = {},
                hunts = Config.Hunts,
            }
        end

        table.insert(Config.Teams[teamNumber]["members"], citizenid)
        TriggerClientEvent('denalifw-scavengerhunt:client:registerTeam', src, teamNumber)
    end
end)

RegisterServerEvent('denalifw-scavengerhunt:server:leaveTeam')
AddEventHandler('denalifw-scavengerhunt:server:leaveTeam', function(teamNumber)
    if not scavengerHuntStarted then
        local src = source 
        local Player = DenaliFW.Functions.GetPlayer(src)
        local citizenid = Player.PlayerData.citizenid
        teamNumber = tonumber(teamNumber)

        if Config.Teams[teamNumber] ~= nil then
            for k, v in pairs(Config.Teams[teamNumber]["members"]) do
                if v == citizenid then
                    table.remove(Config.Teams[teamNumber]["members"], k)
                end
            end
        end
    end
end)

RegisterServerEvent('denalifw-scavengerhunt:server:findGoal')
AddEventHandler('denalifw-scavengerhunt:server:findGoal', function(goal)
    if scavengerHuntStarted then
        local src = source
        local Player = DenaliFW.Functions.GetPlayer(src)
        local citizenid = Player.PlayerData.citizenid
        local teamNumber = nil
        local teamSources = {}

        for k, v in pairs(Config.Teams) do
            for a, s in pairs(Config.Teams[k]["members"]) do
                if citizenid == s then
                    teamNumber = k
                end
                if Config.Teams[k]["members"][a] ~= nil then
                    table.insert(teamSources, Config.Teams[k]["members"][a])
                end
            end
        end

        for k, v in pairs(teamSources) do
            local Target = DenaliFW.Functions.GetPlayerByCitizenId(v)

            if Config.Hunts[goal]["type"] == "ped_giveitem" and Config.Teams[teamNumber]["hunts"][goal]["completed"] == false then
                local item = Config.Hunts[goal]["reward_item"]
                Target.Functions.AddItem(item, 1)
                TriggerClientEvent('inventory:client:ItemBox', Target.PlayerData.source, DenaliFW.Shared.Items[item], "add")
            end

            Config.Teams[teamNumber]["hunts"][goal]["completed"] = true  
            
            TriggerClientEvent('denalifw-scavengerhunt:client:getFinishGoal', Target.PlayerData.source, goal)
        end
    end
end)

RegisterServerEvent('denalifw-scavengerhunt:server:getTeamResults')
AddEventHandler('denalifw-scavengerhunt:server:getTeamResults', function(teamNumber)
    local src = source 
    local Player = DenaliFW.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local results = {}
    local team = tonumber(teamNumber)

    if citizenid == Config.ScavengerBoss then
        if Config.Teams[team] ~= nil then
            for k, v in pairs(Config.Teams[team]["hunts"]) do
                table.insert(results, v.completed)
            end
        end
        TriggerClientEvent('denalifw-scavengerhunt:client:RecieveTeamResults', src, results)
    end
end)

RegisterServerEvent('denalifw-scavengerhunt:server:toggleHuntLock')
AddEventHandler('denalifw-scavengerhunt:server:toggleHuntLock', function(scavengerHuntStartedIncoming)
	local src = source 
    local Player = DenaliFW.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    if citizenid == Config.ScavengerBoss then
        scavengerHuntStarted = scavengerHuntStartedIncoming
        
        TriggerClientEvent('denalifw-scavengerhunt:client:StartHunt', -1, scavengerHuntStarted)
        for k, v in pairs(Config.Teams) do
            for a, s in pairs(Config.Teams[k]["members"]) do
                local Player = DenaliFW.Functions.GetPlayerByCitizenId(s)
                if scavengerHuntStarted then
                    TriggerClientEvent('DenaliFW:Notify', Player.PlayerData.source, 'Scavenger Hunt has begun..', 'success', 3000)
                elseif not scavengerHuntStarted then
                    TriggerClientEvent('DenaliFW:Notify', Player.PlayerData.source, 'Scavenger Hunt has been halted..', 'error', 3000)
                end
            end
        end
    end
end)

DenaliFW.Commands.Add("sh_jointeam", "Join/Leave Scavenger Hunt team", {}, false, function(source, args)
    if not scavengerHuntStarted then
	    TriggerClientEvent("denalifw-scavengerhunt:client:joinTeamCommand", source)
    end
end)

DenaliFW.Commands.Add("sh_boss", "Rob another player", {}, false, function(source, args)
    local src = source 
    local Player = DenaliFW.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    if citizenid == Config.ScavengerBoss then
	    TriggerClientEvent("denalifw-scavengerhunt:client:bossCommand", source)
    end
end)