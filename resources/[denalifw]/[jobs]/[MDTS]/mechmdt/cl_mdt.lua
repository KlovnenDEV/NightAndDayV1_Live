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
                TriggerServerEvent("mdtLSC:performVehicleSearchInFront", GetVehicleNumberPlateText(getVehicleInFront()))
            end
        elseif IsControlJustPressed(0, 540) then
            Citizen.Wait(100)
            TriggerServerEvent("mdtLSC:hotKeyOpen")
           
        end
        if DoesEntityExist(playerPed) and IsPedUsingActionMode(playerPed) then -- disable action mode/combat stance when engaged in combat (thing which makes you run around like an idiot when shooting)
            SetPedUsingActionMode(playerPed, -1, -1, 1)
        end
    end
end)


RegisterNetEvent('mdtLSC:client:getCitizenID')
AddEventHandler('mdtLSC:client:getCitizenID', function(_citizenID)
	citizenID = _citizenID
end)

RegisterNetEvent('mdtLSC:client:JailPlayer')
AddEventHandler('mdtLSC:client:JailPlayer', function(jailAmount, offender, fineAmount)
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)

        -- trigger event to get citizenid for closet person 
        TriggerServerEvent('mdtLSC:server:getPlayer', playerId)
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

RegisterNetEvent("mdtLSC:sendNUIMessage")
AddEventHandler("mdtLSC:sendNUIMessage", function(messageTable)
    SendNUIMessage(messageTable)
end)

RegisterNetEvent("mdtLSC:toggleVisibilty")
AddEventHandler("mdtLSC:toggleVisibilty", function(reports, warrants, officer)
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
    TriggerServerEvent("mdtLSC:getOffensesAndOfficer")
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
    TriggerServerEvent("mdtLSC:performOffenderSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("performForensicsSearch", function(data, cb)
    TriggerServerEvent("mdtLSC:performForensicsSearch", data.query)
    cb('ok')
end)


RegisterNUICallback("viewOffender", function(data, cb)
    TriggerServerEvent("mdtLSC:getOffenderDetails", data.offender)
    cb('ok')
end)

RegisterNUICallback("saveOffenderChanges", function(data, cb)
    
    fingerprint = data.changes.fingerprint

    if not data.changes.convictions  then
        data.changes.convictions = 'No Priors'
    end

    TriggerServerEvent("mdtLSC:saveOffenderChanges", data.id, data.changes.notes, data.changes.mugshot_url, data.changes.convictions, data.changes.convictions_removed, data.identifier, fingerprint)
    cb('ok')
end)

RegisterNUICallback("submitNewReport", function(data, cb)
    TriggerServerEvent("mdtLSC:submitNewReport", data)
    cb('ok')
end)

RegisterNUICallback("performReportSearch", function(data, cb)
    TriggerServerEvent("mdtLSC:performReportSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("getOffender", function(data, cb)
    TriggerServerEvent("mdtLSC:getOffenderDetailsById", data.char_id)
    cb('ok')
end)

RegisterNUICallback("deleteReport", function(data, cb)
    TriggerServerEvent("mdtLSC:deleteReport", data.id)
    cb('ok')
end)

RegisterNUICallback("saveReportChanges", function(data, cb)
    TriggerServerEvent("mdtLSC:saveReportChanges", data)
    cb('ok')
end)

RegisterNUICallback("vehicleSearch", function(data, cb)
    TriggerServerEvent("mdtLSC:performVehicleSearch", data.plate)
    cb('ok')
end)

RegisterNUICallback("getVehicle", function(data, cb)
    TriggerServerEvent("mdtLSC:getVehicle", data.vehicle)
    cb('ok')
end)

RegisterNUICallback("getWarrants", function(data, cb)
    TriggerServerEvent("mdtLSC:getWarrants")
    cb('ok')
end)

RegisterNUICallback("submitNewWarrant", function(data, cb)
    TriggerServerEvent("mdtLSC:submitNewWarrant", data)
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("mdtLSC:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("mdtLSC:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("getReport", function(data, cb)
    TriggerServerEvent("mdtLSC:getReportDetailsById", data.id)
    cb('ok')
end)

RegisterNUICallback("sentencePlayer", function(data, cb)
    local players = {}
    for i = 0, 128 do
        if GetPlayerServerId(i) ~= 0 then
            table.insert(players, GetPlayerServerId(i))
        end
    end
    TriggerServerEvent("mdtLSC:sentencePlayer", data.jailtime, data.charges, data.char_id, data.fine, players)
    cb('ok')
end)

RegisterNetEvent('mdtLSC:client:JailCommand')
AddEventHandler('mdtLSC:client:JailCommand', function(playerId, time)
    TriggerServerEvent("police:server:JailPlayer", playerId, tonumber(time))
end)

RegisterNetEvent("mdtLSC:returnOffenderSearchResults")
AddEventHandler("mdtLSC:returnOffenderSearchResults", function(results)
    SendNUIMessage({
        type = "returnedPersonMatches",
        matches = results
    })
end)

RegisterNetEvent("mdtLSC:returnOffenderDetails")
AddEventHandler("mdtLSC:returnOffenderDetails", function(data)
    SendNUIMessage({
        type = "returnedOffenderDetails",
        details = data
    })
end)

RegisterNetEvent("mdtLSC:returnOffensesAndOfficer")
AddEventHandler("mdtLSC:returnOffensesAndOfficer", function(data, name)
    SendNUIMessage({
        type = "offensesAndOfficerLoaded",
        offenses = data,
        name = name
    })
end)

RegisterNetEvent("mdtLSC:returnReportSearchResults")
AddEventHandler("mdtLSC:returnReportSearchResults", function(results)
    SendNUIMessage({
        type = "returnedReportMatches",
        matches = results
    })
end)

RegisterNetEvent("mdtLSC:returnVehicleSearchInFront")
AddEventHandler("mdtLSC:returnVehicleSearchInFront", function(results, plate)
    SendNUIMessage({
        type = "returnedVehicleMatchesInFront",
        matches = results,
        plate = plate
    })
end)

RegisterNetEvent("mdtLSC:returnVehicleSearchResults")
AddEventHandler("mdtLSC:returnVehicleSearchResults", function(results)
    SendNUIMessage({
        type = "returnedVehicleMatches",
        matches = results
    })
end)

RegisterNetEvent("mdtLSC:returnVehicleDetails")
AddEventHandler("mdtLSC:returnVehicleDetails", function(data)
    data.model = GetLabelText(GetDisplayNameFromVehicleModel(data.model))
    SendNUIMessage({
        type = "returnedVehicleDetails",
        details = data
    })
end)

RegisterNetEvent("mdtLSC:returnWarrants")
AddEventHandler("mdtLSC:returnWarrants", function(data)
    SendNUIMessage({
        type = "returnedWarrants",
        warrants = data
    })
end)

RegisterNetEvent("mdtLSC:completedWarrantAction")
AddEventHandler("mdtLSC:completedWarrantAction", function(data)
    SendNUIMessage({
        type = "completedWarrantAction"
    })
end)

RegisterNetEvent("mdtLSC:returnReportDetails")
AddEventHandler("mdtLSC:returnReportDetails", function(data)
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
