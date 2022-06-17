local DenaliFW = exports['denalifw-core']:GetCoreObject()

RegisterNetEvent('al-metaldetector:detect')
AddEventHandler('al-metaldetector:detect', function()
    if #(GetEntityCoords(PlayerPedId()) - Config.DetectionArea) < Config.Range then
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel3"})
        DenaliFW.Functions.Progressbar('InZone', 'Searching the area...', math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()  
	    TriggerServerEvent('al-metaldetector:additems')
        end)
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel3"})
        DenaliFW.Functions.Progressbar('OutZone', 'Searching the area...', math.random(5000, 10000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()  
        DenaliFW.Functions.Notify("You found nothing, maybe try somewhere else.", "error")
        end)
    end
end)