local isVisible = false
local tabletObject = nil
local citizenID = nil

DenaliFW = exports['denalifw-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if not isVisible and IsPedInAnyPoliceVehicle(playerPed) and IsControlJustPressed(0, 84) and GetEntitySpeed(playerVeh) < 10.0 then
            if GetVehicleNumberPlateText(getVehicleInFront()) then
                TriggerServerEvent("emdt:performVehicleSearchInFront", GetVehicleNumberPlateText(getVehicleInFront()))
            end
        elseif IsControlJustPressed(0, 84) then
            Citizen.Wait(100)
            TriggerServerEvent("emdt:hotKeyOpen")
           
        end
        if DoesEntityExist(playerPed) and IsPedUsingActionMode(playerPed) then -- disable action mode/combat stance when engaged in combat (thing which makes you run around like an idiot when shooting)
            SetPedUsingActionMode(playerPed, -1, -1, 1)
        end
    end
end)


RegisterNetEvent('emdt:client:getCitizenID')
AddEventHandler('emdt:client:getCitizenID', function(_citizenID)
	citizenID = _citizenID
end)

RegisterNetEvent('emdt:client:JailPlayer')
AddEventHandler('emdt:client:JailPlayer', function(jailAmount, offender, fineAmount)
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)

        -- trigger event to get citizenid for closet person 
        TriggerServerEvent('emdt:server:getPlayer', playerId)
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

RegisterNetEvent("emdt:sendNUIMessage")
AddEventHandler("emdt:sendNUIMessage", function(messageTable)
    SendNUIMessage(messageTable)
end)

RegisterNetEvent("emdt:toggleVisibilty")
AddEventHandler("emdt:toggleVisibilty", function(reports, warrants, officer)
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
    TriggerServerEvent("emdt:getOffensesAndOfficer")
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
    TriggerServerEvent("emdt:performOffenderSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("performForensicsSearch", function(data, cb)
    TriggerServerEvent("emdt:performForensicsSearch", data.query)
    cb('ok')
end)


RegisterNUICallback("viewOffender", function(data, cb)
    TriggerServerEvent("emdt:getOffenderDetails", data.offender)
    cb('ok')
end)

RegisterNUICallback("saveOffenderChanges", function(data, cb)
    
    fingerprint = data.changes.fingerprint

    if not data.changes.convictions  then
        data.changes.convictions = 'No Priors'
    end

    TriggerServerEvent("emdt:saveOffenderChanges", data.id, data.changes.notes, data.changes.mugshot_url, data.changes.convictions, data.changes.convictions_removed, data.identifier, fingerprint)
    cb('ok')
end)

RegisterNUICallback("submitNewReport", function(data, cb)
    TriggerServerEvent("emdt:submitNewReport", data)
    cb('ok')
end)

RegisterNUICallback("performReportSearch", function(data, cb)
    TriggerServerEvent("emdt:performReportSearch", data.query)
    cb('ok')
end)

RegisterNUICallback("getOffender", function(data, cb)
    TriggerServerEvent("emdt:getOffenderDetailsById", data.char_id)
    cb('ok')
end)

RegisterNUICallback("deleteReport", function(data, cb)
    TriggerServerEvent("emdt:deleteReport", data.id)
    cb('ok')
end)

RegisterNUICallback("saveReportChanges", function(data, cb)
    TriggerServerEvent("emdt:saveReportChanges", data)
    cb('ok')
end)

RegisterNUICallback("vehicleSearch", function(data, cb)
    TriggerServerEvent("emdt:performVehicleSearch", data.plate)
    cb('ok')
end)

RegisterNUICallback("getVehicle", function(data, cb)
    TriggerServerEvent("emdt:getVehicle", data.vehicle)
    cb('ok')
end)

RegisterNUICallback("getWarrants", function(data, cb)
    TriggerServerEvent("emdt:getWarrants")
    cb('ok')
end)

RegisterNUICallback("submitNewWarrant", function(data, cb)
    TriggerServerEvent("emdt:submitNewWarrant", data)
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("emdt:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("deleteWarrant", function(data, cb)
    TriggerServerEvent("emdt:deleteWarrant", data.id)
    cb('ok')
end)

RegisterNUICallback("getReport", function(data, cb)
    TriggerServerEvent("emdt:getReportDetailsById", data.id)
    cb('ok')
end)

--RegisterNUICallback("sentencePlayer", function(data, cb)
 --   local players = {}
  --  for i = 0, 256 do
    --    if GetPlayerServerId(i) ~= 0 then
      --      table.insert(players, GetPlayerServerId(i))
        --end
   -- end
   -- TriggerServerEvent("emdt:sentencePlayer", data.jailtime, data.charges, data.char_id, data.fine, players)
   -- cb('ok')
--end)

RegisterNetEvent('emdt:client:JailCommand')
AddEventHandler('emdt:client:JailCommand', function(playerId, time)
    TriggerServerEvent("police:server:JailPlayer", playerId, tonumber(time))
end)

RegisterNetEvent("emdt:returnOffenderSearchResults")
AddEventHandler("emdt:returnOffenderSearchResults", function(results)
    SendNUIMessage({
        type = "returnedPersonMatches",
        matches = results
    })
end)

RegisterNetEvent("emdt:returnOffenderDetails")
AddEventHandler("emdt:returnOffenderDetails", function(data)
    SendNUIMessage({
        type = "returnedOffenderDetails",
        details = data
    })
end)

RegisterNetEvent("emdt:returnOffensesAndOfficer")
AddEventHandler("emdt:returnOffensesAndOfficer", function(data, name)
    SendNUIMessage({
        type = "offensesAndOfficerLoaded",
        offenses = data,
        name = name
    })
end)

RegisterNetEvent("emdt:returnReportSearchResults")
AddEventHandler("emdt:returnReportSearchResults", function(results)
    SendNUIMessage({
        type = "returnedReportMatches",
        matches = results
    })
end)

RegisterNetEvent("emdt:returnVehicleSearchInFront")
AddEventHandler("emdt:returnVehicleSearchInFront", function(results, plate)
    SendNUIMessage({
        type = "returnedVehicleMatchesInFront",
        matches = results,
        plate = plate
    })
end)

RegisterNetEvent("emdt:returnVehicleSearchResults")
AddEventHandler("emdt:returnVehicleSearchResults", function(results)
    SendNUIMessage({
        type = "returnedVehicleMatches",
        matches = results
    })
end)

RegisterNetEvent("emdt:returnVehicleDetails")
AddEventHandler("emdt:returnVehicleDetails", function(data)
    data.model = GetLabelText(GetDisplayNameFromVehicleModel(data.model))
    SendNUIMessage({
        type = "returnedVehicleDetails",
        details = data
    })
end)

RegisterNetEvent("emdt:returnWarrants")
AddEventHandler("emdt:returnWarrants", function(data)
    SendNUIMessage({
        type = "returnedWarrants",
        warrants = data
    })
end)

RegisterNetEvent("emdt:completedWarrantAction")
AddEventHandler("emdt:completedWarrantAction", function(data)
    SendNUIMessage({
        type = "completedWarrantAction"
    })
end)

RegisterNetEvent("emdt:returnReportDetails")
AddEventHandler("emdt:returnReportDetails", function(data)
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
