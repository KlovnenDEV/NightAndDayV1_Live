local DenaliFW = exports['denalifw-core']:GetCoreObject() -- We've ALWAYS got to grab our core object

local currentjob = {}

RegisterNetEvent("DenaliFW:Client:OnPlayerLoaded")
AddEventHandler("DenaliFW:Client:OnPlayerLoaded", function()
	local Player=DenaliFW.Functions.GetPlayerData()
    local job = Player.job
    print(json.encode(Player.job))
    currentjob = job
    if job == "police" or job == "ambulance" or job == "mechanic" then -- job's name here
        TriggerServerEvent("denalifw-shiftlog:userjoined", job)
    end
end)

RegisterNetEvent('DenaliFW:Client:OnJobUpdate')
AddEventHandler('DenaliFW:Client:OnJobUpdate', function(job)
    Wait(100)
    
    if job.name == "police" or job.name == "ambulance" or job.name == "mechanic" then -- job's name here
        if job.onduty == false then
            TriggerEvent("denalifw-shiftlog:jobchanged", job, job, 1, src)
        end
           
    end
    currentjob = job
end)


