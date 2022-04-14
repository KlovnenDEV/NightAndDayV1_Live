local DenaliFW = exports['denalifw-core']:GetCoreObject()
function Framework()
	if Config.framework == 'ESX' then
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(100)
		end
		while PlayerData.job == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			PlayerData = ESX.GetPlayerData()
			Citizen.Wait(100)
		end
		PlayerData = ESX.GetPlayerData()
	elseif Config.framework == 'QBCORE' then
		CreateThread(function()
			DenaliFW = exports['denalifw-core']:GetCoreObject()
		end)
		Wait(1000)
		if not DenaliFW then -- support old version in ugly way
			CreateThread(function()
				local DenaliFW = exports['denalifw-core']:GetCoreObject()
			end)
		end
		while not DenaliFW do Wait(100) end
		DenaliFW.Functions.GetPlayerData(function(p)
			PlayerData = p
			if PlayerData.job ~= nil then
				PlayerData.job.grade = PlayerData.job.grade.level
			end
			if PlayerData.identifier == nil then
				PlayerData.identifier = PlayerData.license
			end
        end)
	end
end

function Playerloaded()
	if Config.framework == 'ESX' then
		RegisterNetEvent('esx:playerLoaded')
		AddEventHandler('esx:playerLoaded', function(xPlayer)
			playerloaded = true
		end)
	elseif Config.framework == 'QBCORE' then
		RegisterNetEvent('DenaliFW:Client:OnPlayerLoaded')
		AddEventHandler('DenaliFW:Client:OnPlayerLoaded', function()
			playerloaded = true
			DenaliFW.Functions.GetPlayerData(function(p)
				PlayerData = p
				if PlayerData.job ~= nil then
					PlayerData.job.grade = PlayerData.job.grade.level
				end
				if PlayerData.identifier == nil then
					PlayerData.identifier = PlayerData.license
				end
			end)
		end)
	end
end

function SetJob()
	if Config.framework == 'ESX' then
		RegisterNetEvent('esx:setJob')
		AddEventHandler('esx:setJob', function(job)
			PlayerData.job = job
			playerjob = PlayerData.job.name
			inmark = false
			cancel = true
			markers = {}
		end)
	elseif Config.framework == 'QBCORE' then
		RegisterNetEvent('DenaliFW:Client:OnJobUpdate')
		AddEventHandler('DenaliFW:Client:OnJobUpdate', function(job)
			PlayerData.job = job
			PlayerData.job.grade = PlayerData.job.grade.level
			playerjob = PlayerData.job.name
			inmark = false
			cancel = true
			markers = {}
		end)
	end
end

CreateThread(function()
    Wait(500)
	if Config.framework == 'ESX' then
		while ESX == nil do Wait(1) end
		TriggerServerCallback_ = function(...)
			ESX.TriggerServerCallback(...)
		end
	elseif Config.framework == 'QBCORE' then
		while DenaliFW == nil do Wait(1) end
		TriggerServerCallback_ =  function(...)
			DenaliFW.Functions.TriggerCallback(...)
		end
	end
end)

MathRound = function(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end

ShowNotification = function(msg)
	if Config.framework == 'ESX' then
		ESX.ShowNotification(msg)
	elseif Config.framework == 'QBCORE' then
		TriggerEvent('DenaliFW:Notify', msg)
	end
end