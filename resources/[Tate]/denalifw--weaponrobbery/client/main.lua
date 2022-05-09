DenaliFW = exports['denalifw-core']:GetCoreObject()


-- Code

local robberyAlert = false

local isLoggedIn = true

local firstAlarm = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('DenaliFW:Client:OnPlayerLoaded')
AddEventHandler('DenaliFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('DenaliFW:Client:OnPlayerUnload')
AddEventHandler('DenaliFW:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        inRange = false

        if DenaliFW ~= nil then
            if isLoggedIn then
                PlayerData = DenaliFW.Functions.GetPlayerData()
                for case,_ in pairs(Config.Locations) do
                    local dist = GetDistanceBetweenCoords(pos, Config.Locations[case]["coords"]["x"], Config.Locations[case]["coords"]["y"], Config.Locations[case]["coords"]["z"])
                    local storeDist = GetDistanceBetweenCoords(pos, Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])
                    if dist < 4 then
                        inRange = true

                        if dist < 0.6 then
                            if not Config.Locations[case]["isBusy"] and not Config.Locations[case]["isOpened"] then
                                DrawText3Ds(Config.Locations[case]["coords"]["x"], Config.Locations[case]["coords"]["y"], Config.Locations[case]["coords"]["z"], '[E] smash display case')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    DenaliFW.Functions.TriggerCallback('denalifw-weashop:server:getCops', function(cops)
                                        if cops >= Config.RequiredCops then
                                            --if validWeapon() then
                                                smashVitrine(case)
                                            --else
                                             --   DenaliFW.Functions.Notify('Je wapen lijkt niet sterk genoeg..', 'error')
                                            --end
                                        else
                                            DenaliFW.Functions.Notify('There are not enough police...', 'error')
                                        end                
                                    end)
                                end
                            end
                        end

                        if storeDist < 2 then
                            if not firstAlarm then
                                --if validWeapon() then
                                    --DenaliFW.Functions.TriggerCallback('denalifw-weashop:server:PoliceAlertMessage', function(result)
                                    --end, "Verdachte situatie", pos, true)
                                        TriggerEvent('dispatch:weaponrobbery')
                                        local cameraID = math.random(31,34)
                                    -- TriggerServerEvent('denalifw-weashop:server:PoliceAlertMessage', "Verdachte situatie", pos, true)
                                    firstAlarm = true
                               -- end
                            end
                        end
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(2000)
        end

        Citizen.Wait(7)
    end
end)

function loadParticle()
	if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
    RequestNamedPtfxAsset("scr_jewelheist")
    end
    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
    Citizen.Wait(0)
    end
    SetPtfxAssetNextCall("scr_jewelheist")
end

function loadAnimDict(dict)  
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(3)
    end
end

function validWeapon()
    local ped = GetPlayerPed(-1)
    local pedWeapon = GetSelectedPedWeapon(ped)

    for k, v in pairs(Config.WhitelistedWeapons) do
        if pedWeapon == k then
            return true
        end
    end
    return false
end

local smashing = false

function smashVitrine(k)
    local animDict = "missheist_jewel"
    local animName = "smash_case"
    local ped = GetPlayerPed(-1)
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)
    local pedWeapon = GetSelectedPedWeapon(ped)

    if math.random(1, 100) <= 80 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
    elseif math.random(1, 100) <= 5 and IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
        DenaliFW.Functions.Notify("You tore yourself on the glass..", "error")
    end

    smashing = true

    DenaliFW.Functions.Progressbar("smash_showcase", "Smash showcase..", "5000", false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        DenaliFW.Functions.TriggerCallback('denalifw-weashop:server:setVitrineState', function(result)
        end, "isOpened", true, k)
        DenaliFW.Functions.TriggerCallback('denalifw-weashop:server:setVitrineState', function(result)
        end, "isBusy", false, k)
        TriggerServerEvent('denalifw-weashop:server:setVitrineState', "isOpened", true, k)
        TriggerServerEvent('denalifw-weashop:server:setVitrineState', "isBusy", false, k)
        DenaliFW.Functions.TriggerCallback('denalifw-weashop:vitrineReward', function()
        end)
        DenaliFW.Functions.TriggerCallback('denalifw-weashop:server:setTimeout', function(result)
        end)
        DenaliFW.Functions.TriggerCallback('denalifw-weashop:server:PoliceAlertMessage', function(result)
        end, "Wapenshop overval", plyCoords, false)
        TriggerServerEvent('denalifw-weashop:server:setTimeout')
        TriggerServerEvent('denalifw-weashop:server:PoliceAlertMessage', "Juwelier overval", plyCoords, false)
        smashing = false
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end, function() -- Cancel
        DenaliFW.Functions.TriggerCallback('denalifw-weashop:server:setVitrineState', function(result)
        end, "isBusy", false, k)
        TriggerServerEvent('denalifw-weashop:server:setVitrineState', "isBusy", false, k)
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        smashing = false
    end)
    DenaliFW.Functions.TriggerCallback('denalifw-weashop:server:setVitrineState', function(result)
    end, "isBusy", true, k)
    TriggerServerEvent('denalifw-weashop:server:setVitrineState', "isBusy", true, k)

    Citizen.CreateThread(function()
        while smashing do
            loadAnimDict(animDict)
            TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Citizen.Wait(500)
            --TriggerServerEvent("InteractSound_SV:PlayOnSource", "breaking_vitrine_glass", 0.25)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, "breaking_vitrine_glass", 0.25)
            loadParticle()
            StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", plyCoords.x, plyCoords.y, plyCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
            Citizen.Wait(2500)
        end
    end)
end

RegisterNetEvent('denalifw-weashop:client:setVitrineState')
AddEventHandler('denalifw-weashop:client:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
end)

RegisterNetEvent('denalifw-weashop:client:setAlertState')
AddEventHandler('denalifw-weashop:client:setAlertState', function(bool)
    robberyAlert = bool
end)

RegisterNetEvent('denalifw-weashop:client:executeEvents')
AddEventHandler('denalifw-weashop:client:executeEvents', function()
    TriggerServerEvent('denalifw-weashop:server:vitrineReward')
end)

RegisterNetEvent('denalifw-weashop:client:PoliceAlertMessage')
AddEventHandler('denalifw-weashop:client:PoliceAlertMessage', function(title, coords, blip)
    if blip then
        TriggerEvent('denalifw-policealerts:client:AddPoliceAlert', {
            timeOut = 5000,
            alertTitle = title,
            details = {
                [1] = {
                    icon = '<i class="fas fa-raygun"></i>',
                    detail = "Wapenshop Overval",
                },
                [2] = {
                    icon = '<i class="fas fa-video"></i>',
                    detail = "31 | 32 | 33 | 34",
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = "Rockford Dr",
                },
            },
            callSign = DenaliFW.Functions.GetPlayerData().metadata["callsign"],
        })
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 100
        local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 100.0)
        SetBlipSprite(blip, 9)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, transG)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("112 - Suspicious situation Weapon shop")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    else
        if not robberyAlert then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent('denalifw-policealerts:client:AddPoliceAlert', {
                timeOut = 5000,
                alertTitle = title,
                details = {
                    [1] = {
                        icon = '<i class="fas fa-raygun"></i>',
                        detail = "Wapenshop Overval",
                    },
                    [2] = {
                        icon = '<i class="fas fa-video"></i>',
                        detail = "31 | 32 | 33 | 34",
                    },
                    [3] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = "Rockford Dr",
                    },
                },
                callSign = DenaliFW.Functions.GetPlayerData().metadata["callsign"],
            })
            robberyAlert = true
        end
    end
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(GetPlayerPed(-1), 3)
    local model = GetEntityModel(GetPlayerPed(-1))
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

Citizen.CreateThread(function()
    Dealer = AddBlipForCoord(Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])

    SetBlipSprite (Dealer, 617)
    SetBlipDisplay(Dealer, 4)
    SetBlipScale  (Dealer, 0.7)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Wapen Overval")
    EndTextCommandSetBlipName(Dealer)
end)