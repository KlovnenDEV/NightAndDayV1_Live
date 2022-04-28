------------------------CREDITS------------------------
--------        Script made by Deltarix        --------
--   Copyright 2021 Deltarix. All rights reserved    --
-------------------------------------------------------
DenaliFW = exports['denalifw-core']:GetCoreObject()


-- Open command
RegisterCommand(Config.Command, function(source)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    for k,v in pairs(Config.Permission) do
        if Player.PlayerData.job.name == v then
            TriggerClientEvent('drx_mechanic:open', src, Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname)
        end
    end
end)

-- User searches in database, and sends the info back to ui
RegisterServerEvent('drx_mechanic:SearchJobs')
AddEventHandler('drx_mechanic:SearchJobs', function(data)
    local src = source
    exports.oxmysql:fetch('SELECT * FROM drx_mechanic WHERE mechanic_id LIKE @SearchJobs OR customer_id LIKE @SearchJobs OR mechanic_name LIKE @SearchJobs OR customer_name LIKE @SearchJobs OR plate LIKE @SearchJobs', {
        ['@SearchJobs'] = string.lower('%'..data.SearchJobs..'%')
	}, function(result)
        local SearchJobResults = {}
        for k,v in ipairs(result) do
            v.upgrades = json.decode(v.upgrades)
            table.insert(SearchJobResults, v)
        end
        TriggerClientEvent('drx_mechanic:returnJobsSearch', src, SearchJobResults)
    end)
end)

-- User searches in database, and sends the info back to ui
RegisterServerEvent('drx_mechanic:searchDatabase')
AddEventHandler('drx_mechanic:searchDatabase', function(data)
    local src = source
    exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE plate LIKE @SearchInput', {
        ['@SearchInput'] = string.lower('%'..data.SearchInput..'%')
	}, function(result)
        local SearchResults = {}
        for k,v in ipairs(result) do
            table.insert(SearchResults, v)
        end
        TriggerClientEvent('drx_mechanic:returnDatabaseSearch', src, SearchResults)
    end)
end)

-- Select vehicle plate, and return all information (if changes has been made, then it keeps being updated, instead of being updated only when running "searchDatabase")
RegisterServerEvent('drx_mechanic:selectVehicle')
AddEventHandler('drx_mechanic:selectVehicle', function(data)
    local src = source
    exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE plate LIKE @plate', {
        ['@plate'] = string.lower('%'..data.plate..'%')
	}, function(veh)
        if veh[1] then
            exports.oxmysql:fetch('SELECT * FROM players WHERE citizenid=@citizenid', {
                ['@citizenid'] = veh[1].citizenid
            }, function(res)
                if res[1] then
                    local ci = json.decode(res[1].charinfo)
                    TriggerClientEvent('drx_mechanic:returnDatabaseSelection', src, res[1].citizenid, ci.firstname, ci.lastname, veh[1].plate, json.decode(veh[1].mods))
                end
            end)
        end
    end)
end)

-- Check if the plate the user is in exists in the database, and then bill the player for the modification
DenaliFW.Functions.CreateCallback('drx_mechanic:upgradeVehicle', function(source, cb, data)
    local src = source
    local bill = tonumber(data.bill)
    if data.plate ~= nil then
        exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE plate = @plate', {
            ['@plate'] = data.plate
        }, function(result)
            if result[1] ~= nil and DenaliFW.Functions.GetPlayerByCitizenId(result[1].citizenid) then
                local target = DenaliFW.Functions.GetPlayerByCitizenId(result[1].citizenid)
                local bankAccount = target.PlayerData.money['bank']
                if bankAccount >= bill then
                    local Player = DenaliFW.Functions.GetPlayer(src)
                    target.Functions.RemoveMoney('bank', bill)
                    local modifications = '{'..'"Brakes":' ..data.brakes.. ',"Transmission":' ..data.transmission.. ',"Suspension":' ..data.suspension.. ',"Engine":' ..data.engine.. ',"Tune":' ..data.tune..'}'
                    exports.oxmysql:execute('INSERT INTO drx_mechanic (mechanic_id, customer_id, mechanic_name, customer_name, plate, upgrades, bill, note) VALUES (@mid, @cid, @mname, @cname, @plate, @upgrades, @bill, @note)', {
                        ['@mid'] = Player.PlayerData.citizenid,
                        ['@cid'] = target.PlayerData.citizenid,
                        ['@mname'] = data.mname,
                        ['@cname'] = data.cname,
                        ['@plate'] = data.plate,
                        ['@upgrades'] = modifications,
                        ['@bill'] = bill,
                        ['@note'] = data.note,
                    })
                    TriggerClientEvent('DenaliFW:Notify', src, Config.Notifications.Payed.. '' ..bill.. ' ' ..Config.Notifications.Payed1)
                    cb(true)
                else
                    TriggerClientEvent('DenaliFW:Notify', target.PlayerData.source, Config.Notifications.NotEnough)
                    TriggerClientEvent('DenaliFW:Notify', src, Notify.CantAfford)
                end
            else
                cb(false)
            end
        end)
    end
end)

RegisterServerEvent('drx_mechanic:updateProps')
AddEventHandler('drx_mechanic:updateProps', function(data, props)
    if data.plate then
        exports.oxmysql:fetch('SELECT * FROM player_vehicles WHERE plate = @plate', {
            ['@plate'] = data.plate
        }, function(result)
            local veh = json.decode(result[1].mods)
            if tonumber(result[1].hash) == tonumber(props.model) then
                exports.oxmysql:execute('UPDATE player_vehicles SET mods = @mods WHERE plate = @plate', {
                    ['@plate'] = props.plate,
                    ['@mods'] = json.encode(props)
                })
            end
        end)
    end
end)