local DenaliFW = exports['denalifw-core']:GetCoreObject()

DenaliFW.Functions.CreateCallback('skillsystem:fetchStatus', function(source, cb)
	local Player = DenaliFW.Functions.GetPlayer(source)
 
	if Player then
		local status = MySQL.scalar.await('SELECT skills FROM players WHERE citizenid = ?', {Player.PlayerData.citizenid})
		if status ~= nil then
			cb(json.decode(status))
		else
			cb(nil)
		end
	else
		cb()
	end
 end)
 
RegisterServerEvent('skillsystem:update')
AddEventHandler('skillsystem:update', function (data)
     local Player = DenaliFW.Functions.GetPlayer(source)
     --print(data)

	 MySQL.query('UPDATE players SET skills = @skills WHERE citizenid = @citizenid', {
		['@skills'] = data,
		['@citizenid'] = Player.PlayerData.citizenid
	})
end)
