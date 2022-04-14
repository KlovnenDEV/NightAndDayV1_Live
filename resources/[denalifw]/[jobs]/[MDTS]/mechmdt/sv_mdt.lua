DenaliFW = exports["denalifw-core"]:GetCoreObject()

RegisterCommand('lsc', function(source, args, rawcmd)
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "mechanic" then
		exports['ghmattimysql']:execute('SELECT * FROM (SELECT * FROM `mdt_reportsLSC` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC', {}, function(reports)
    		for r = 1, #reports do
    			reports[r].charges = json.decode(reports[r].charges)
    		end
    		exports['ghmattimysql']:execute("SELECT * FROM (SELECT * FROM `mdt_warrantsLSC` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(warrants)
    			for w = 1, #warrants do
    				warrants[w].charges = json.decode(warrants[w].charges)
    			end


    			local officer = GetCharacterName(src)
    			TriggerClientEvent('mdtLSC:toggleVisibilty', src, reports, warrants, officer)
    		end)
		end)
	end
end)

RegisterServerEvent("lsc:hotKeyOpen")
AddEventHandler("lcs:hotKeyOpen", function()
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(source)
	 if Player.PlayerData.job.name == "mechanic" then
    	exports['ghmattimysql']:execute("SELECT * FROM (SELECT * FROM `mdt_reportsLSC` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(reports)
    		for r = 1, #reports do
    			reports[r].charges = json.decode(reports[r].charges)
    		end
    		exports['ghmattimysql']:execute("SELECT * FROM (SELECT * FROM `mdt_warrantsLSC` ORDER BY `id` DESC LIMIT 3) sub ORDER BY `id` DESC", {}, function(warrants)
    			for w = 1, #warrants do
    				warrants[w].charges = json.decode(warrants[w].charges)
    			end


    			local officer = GetCharacterName(src)
    			TriggerClientEvent('mdtLSC:toggleVisibilty', src, reports, warrants, officer)
    		end)
    	end)
    end
end)

RegisterServerEvent("mdtLSC:getOffensesAndOfficer")
AddEventHandler("mdtLSC:getOffensesAndOfficer", function()
	src = source
	local charges = {}
	exports['ghmattimysql']:execute('SELECT * FROM lscfine_types', {
	}, function(fines)
		for j = 1, #fines do
			table.insert(charges, fines[j])
		end

		local officer = GetCharacterName(src)

		TriggerClientEvent("mdtLSC:returnOffensesAndOfficer", src, charges, officer)
	end)
end)
function tprint (tbl, indent)
	if not indent then indent = 0 end
	local toprint = string.rep(" ", indent) .. "{\r\n"
	indent = indent + 2 
	for k, v in pairs(tbl) do
	  toprint = toprint .. string.rep(" ", indent)
	  if (type(k) == "number") then
		toprint = toprint .. "[" .. k .. "] = "
	  elseif (type(k) == "string") then
		toprint = toprint  .. k ..  "= "   
	  end
	  if (type(v) == "number") then
		toprint = toprint .. v .. ",\r\n"
	  elseif (type(v) == "string") then
		toprint = toprint .. "\"" .. v .. "\",\r\n"
	  elseif (type(v) == "table") then
		toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
	  else
		toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
	  end
	end
	toprint = toprint .. string.rep(" ", indent-2) .. "}"
	return toprint
  end
  
  function CleanNils(t)
	local ans = {}
	for _,v in pairs(t) do
	  ans[ #ans+1 ] = v
	end
	return ans
  end

RegisterServerEvent("mdtLSC:performOffenderSearch")
AddEventHandler("mdtLSC:performOffenderSearch", function(query)
	local src = source
	local matches = {}
	exports['ghmattimysql']:execute("SELECT * FROM `players`", {
		['@query'] = string.lower(' % '..query..' % ') -- % wildcard, needed to search for all alike results
	}, function(result)

		for index, data in ipairs(result) do
			local charinfo = json.decode(tostring(data.charinfo))
			local shouldputintable = false
			local query2 = string.lower(query)
			local first = string.lower(charinfo.firstname)
			local last = string.lower(charinfo.lastname)
			local name = nil
			if first ~= '' and last ~= '' then
				name = first .. ' ' .. last
			end
			data.firstname = charinfo.firstname
			data.lastname = charinfo.lastname
			data.id = data.citizenid
			data.char_id = data.citizenid
			if name ~= nil then
				if string.find(query2, name) then
					table.insert(matches, data)
				elseif string.find(query2, first) then
					table.insert(matches, data)
				elseif string.find(query2, last) then
					table.insert(matches, data)
				end
			end
		end


		TriggerClientEvent("mdtLSC:returnOffenderSearchResults", src, matches)
	end)
end)



RegisterServerEvent("mdtLSC:performForensicsSearch")
AddEventHandler("mdtLSC:performForensicsSearch", function(query)
	local src = source
	local matches = {}
	exports['ghmattimysql']:execute("SELECT players.cid, players.citizenid, players.charinfo, user_mdt.fingerprint, user_mdt.notes FROM players INNER JOIN user_mdt ON players.citizenid = user_mdt.char_id", {
		['@query'] = string.lower('%'..query..'%') -- % wildcard, needed to search for all alike results
	}, function(result)

		for index, data in ipairs(result) do
			local charinfo = json.decode(tostring(data.charinfo))
			local shouldputintable = false
			local query2 = string.lower(query)
			local first = string.lower(charinfo.firstname)
			local last = string.lower(charinfo.lastname)
			local fingerprint = string.lower(data.fingerprint)
			--local WeaponInformation = 
			local name = nil
			if first ~= '' and last ~= '' then
				name = first .. ' ' .. last
			end
			data.firstname = charinfo.firstname
			data.lastname = charinfo.lastname
			data.id = data.citizenid
			data.char_id = data.citizenid
			data.fingerprint = data.fingerprint
			if name ~= nil then
				if string.find(query2, name) then
					table.insert(matches, data)
				elseif string.find(query2, first) then
					table.insert(matches, data)
				elseif string.find(query2, last) then
					table.insert(matches, data)
				elseif string.find(query2, fingerprint) then
					table.insert(matches, data)
				end
			end
		end
		TriggerClientEvent("mdtLSC:returnOffenderSearchResults", src, matches)
	end)
end)


function shouldputintab(decoded, query)

end

RegisterServerEvent("mdtLSC:getOffenderDetails")
AddEventHandler("mdtLSC:getOffenderDetails", function(offender)
	local src = source
	GetLicenses(src, function(licenses) offender.licenses = licenses end)
	while offender.licenses == nil do Citizen.Wait(0) end
	exports['ghmattimysql']:execute('SELECT * FROM `user_mdt` WHERE `char_id` = @id', {
		['@id'] = offender.id
	}, function(result)
		offender.notes = ""
		offender.mugshot_url = ""
		offender.fingerprint = ""
		if result[1] then
			offender.notes = result[1].notes
			offender.mugshot_url = result[1].mugshot_url
			offender.fingerprint = result[1].fingerprint
		end
		exports['ghmattimysql']:execute('SELECT * FROM `user_convictionsLSC` WHERE `char_id` = @id', {
			['@id'] = offender.id
		}, function(convictions)
			if convictions[1] then
				offender.convictions = {}
				for i = 1, #convictions do
					local conviction = convictions[i]
					offender.convictions[conviction.offense] = conviction.count
				end
			end

			exports['ghmattimysql']:execute('SELECT * FROM `mdt_warrantsLSCLSC` WHERE `char_id` = @id', {
				['@id'] = offender.id
			}, function(warrants)
				if warrants[1] then
					offender.haswarrant = true
				end

				TriggerClientEvent("mdtLSC:returnOffenderDetails", src, offender)
			end)
		end)
	end)


end)

RegisterServerEvent("mdtLSC:getOffenderDetailsById")
AddEventHandler("mdtLSC:getOffenderDetailsById", function(char_id)
	local src = source
	exports['ghmattimysql']:execute('SELECT * FROM `players` WHERE `citizenid` = @id', {
		['@id'] = char_id
	}, function(result)
		local offender = result[1]
		GetLicenses(src, function(licenses) offender.licenses = licenses end)
		while offender.licenses == nil do Citizen.Wait(0) end
		exports['ghmattimysql']:execute('SELECT * FROM `user_mdt` WHERE `char_id` = @id', {
			['@id'] = offender.id
		}, function(result)
			offender.notes = ""
			offender.mugshot_url = ""
			offender.fingerprint = ""
			if result[1] then
				offender.notes = result[1].notes
				offender.mugshot_url = result[1].mugshot_url
				offender.fingerprint = result[1].fingerprint
			end
			exports['ghmattimysql']:execute('SELECT * FROM `user_convictionsLSC` WHERE `char_id` = @id', {
				['@id'] = offender.id
			}, function(convictions)
				if convictions[1] then
					offender.convictions = {}
					for i = 1, #convictions do
						local conviction = convictions[i]
						offender.convictions[conviction.offense] = conviction.count
					end
				end

				TriggerClientEvent("mdtLSC:returnOffenderDetails", src, offender)
			end)
		end)

	end)
end)


RegisterServerEvent("mdtLSC:saveOffenderChanges")
AddEventHandler("mdtLSC:saveOffenderChanges", function(id, notes, mugshot, convictions, convictions_removed, identifier, fingerprint)
	exports['ghmattimysql']:execute('SELECT * FROM `user_mdt` WHERE `char_id` = @id', {
		['@id']  = id
	}, function(result)
		if result[1] then
			exports['ghmattimysql']:execute('UPDATE `user_mdt` SET `notes` = @notes, `mugshot_url` = @mugshot_url, `fingerprint` = @fingerprint  WHERE `char_id` = @id', {
				['@id'] = id,
				['@notes'] = notes,
				['@mugshot_url'] = mugshot,
				['@fingerprint'] = fingerprint
			})
		else
			exports['ghmattimysql']:execute('INSERT INTO `user_mdt` (`char_id`, `notes`, `mugshot_url`, `fingerprint`) VALUES (@id, @notes, @mugshot_url, @fingerprint)', {
				['@id'] = id,
				['@notes'] = notes,
				['@mugshot_url'] = mugshot,
				['@fingerprint'] = fingerprint
			})
		end
		if conviction ~= nil then
			for conviction, amount in pairs(convictions) do	
				exports['ghmattimysql']:execute('UPDATE `user_convictionsLSC` SET `count` = @count WHERE `char_id` = @id AND `offense` = @offense', {
					['@id'] = id,
					['@count'] = amount,
					['@offense'] = conviction
				})
			end
		end
		for i = 1, #convictions_removed do
			exports['ghmattimysql']:execute('DELETE FROM `user_convictionsLSC` WHERE `char_id` = @id AND `offense` = @offense', {
				['@id'] = id,
				['@offense'] = convictions_removed[i]
			})
		end
	end)
end)

RegisterServerEvent("mdtLSC:saveReportChanges")
AddEventHandler("mdtLSC:saveReportChanges", function(data)
	exports['ghmattimysql']:execute('UPDATE `mdt_reportsLSC` SET `title` = @title, `incident` = @incident WHERE `id` = @id', {
		['@id'] = data.id,
		['@title'] = data.title,
		['@incident'] = data.incident
	})
end)

RegisterServerEvent("mdtLSC:deleteReport")
AddEventHandler("mdtLSC:deleteReport", function(id)
	exports['ghmattimysql']:execute('DELETE FROM `mdt_reportsLSC` WHERE `id` = @id', {
		['@id']  = id
	})
end)

RegisterServerEvent("mdtLSC:submitNewReport")
AddEventHandler("mdtLSC:submitNewReport", function(data)
	local usource = source
	
	local author = GetCharacterName(source)
	if tonumber(data.sentence) and tonumber(data.sentence) > 0 then
		data.sentence = tonumber(data.sentence)
	else 
		data.sentence = nil 
	end
	charges = json.encode(data.charges)
	data.date = os.date('%m-%d-%Y %H:%M:%S', os.time())
	exports['ghmattimysql']:execute('INSERT INTO `mdt_reportsLSC` (`char_id`, `title`, `incident`, `charges`, `author`, `name`, `date`, `jailtime`) VALUES (@id, @title, @incident, @charges, @author, @name, @date, @sentence)', {
		['@id']  = data.char_id,
		['@title'] = data.title,
		['@incident'] = data.incident,
		['@charges'] = charges,
		['@author'] = author,
		['@name'] = data.name,
		['@date'] = data.date,
		['@sentence'] = data.sentence
	}, 
	function(id)
		whichId = id['insertId']
		TriggerEvent("mdtLSC:getReportDetailsById", whichId, usource)
	end)

	for offense, count in pairs(data.charges) do
		exports['ghmattimysql']:execute('SELECT * FROM `user_convictionsLSC` WHERE `offense` = @offense AND `char_id` = @id', {
			['@offense'] = offense,
			['@id'] = data.char_id
		}, function(result)
			if result[1] then
				exports['ghmattimysql']:execute('UPDATE `user_convictionsLSC` SET `count` = @count WHERE `offense` = @offense AND `char_id` = @id', {
					['@id']  = data.char_id,
					['@offense'] = offense,
					['@count'] = count + 1
				})
			else
				exports['ghmattimysql']:execute('INSERT INTO `user_convictionsLSC` (`char_id`, `offense`, `count`) VALUES (@id, @offense, @count)', {
					['@id']  = data.char_id,
					['@offense'] = offense,
					['@count'] = count
				})
			end
		end)
	end
end)


RegisterServerEvent('mdtLSC:server:BillPlayer')
AddEventHandler('mdtLSC:server:BillPlayer', function(playerId, price)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	local OtherPlayer = DenaliFW.Functions.GetPlayer(playerId)
	print (Player.PlayerData.job.name)
     if Player.PlayerData.job.name == "mechanic" then
        if OtherPlayer ~= nil then
            OtherPlayer.Functions.RemoveMoney("bank", price, "paid-bills")
            TriggerClientEvent('DenaliFW:Notify', OtherPlayer.PlayerData.source, "You received a fine of $"..price)
        end
    end
end)

RegisterServerEvent("mdtLSC:server:getPlayer")
AddEventHandler("mdtLSC:server:getPlayer", function(playerid)

	local _source = source
	local _citizenID = nil
	
	if playerid ~= nil then 
		_citizenID = DenaliFW.Functions.GetPlayer(playerid)
	end

	TriggerClientEvent('mdtLSC:client:getCitizenID', source, _citizenID)
end)

RegisterServerEvent("mdtLSC:sentencePlayer")
AddEventHandler("mdtLSC:sentencePlayer", function( jailtime, charges, char_id, fine, players)
	
	local src = source
	local offender = char_id

	if offender ~= nil then
		TriggerClientEvent("mdtLSC:client:JailPlayer", src, jailtime, offender, fine)
	end

	-- debugging purposes below 
	for _, src in pairs(players) do
		if src ~= 0 and GetPlayerName(src) then
			exports['ghmattimysql']:execute('SELECT * FROM `players` WHERE `citizenid` = @identifier', {
				['@identifier'] = char_id
			}, function(result)
	
				if result[1].id == char_id then
					if jailtime and jailtime > 0 then
						jailtime = math.ceil(jailtime)
						
						-- TriggerEvent("esx-qalle-jail:jailPlayer", src, jailtime, jailmsg)
					end
					if fine > 0 then
						-- TriggerClientEvent("mdtLSC:billPlayer", usource, src, 'society_police', 'Fine: '..jailmsg, fine)
					end
					return
				end

				TriggerClientEvent("mdtLSC:client:JailCommand", src, 'NHB84639', 5)
			end)
		end
	end

end)



RegisterServerEvent("mdtLSC:performReportSearch")
AddEventHandler("mdtLSC:performReportSearch", function(query)
	local src = source
	local matches = {}
	exports['ghmattimysql']:execute("SELECT * FROM `mdt_reportsLSC` WHERE `id` LIKE @query OR LOWER(`title`) LIKE @query OR LOWER(`name`) LIKE @query OR LOWER(`author`) LIKE @query or LOWER(`charges`) LIKE @query", {
		['@query'] = string.lower('%'..query..'%') -- % wildcard, needed to search for all alike results
	}, function(result)

		for index, data in ipairs(result) do
			data.charges = json.decode(data.charges)
			table.insert(matches, data)
		end

		TriggerClientEvent("mdtLSC:returnReportSearchResults", src, matches)
	end)
end)

RegisterServerEvent("mdtLSC:performVehicleSearch")
AddEventHandler("mdtLSC:performVehicleSearch", function(query)
	local src = source
	local matches = {}
	exports['ghmattimysql']:execute("SELECT * FROM `player_vehicles` WHERE LOWER(`plate`) LIKE @query", {
		['@query'] = string.lower('%'..query..'%') -- % wildcard, needed to search for all alike results
	}, function(result)

		for index, data in ipairs(result) do
			local data_decoded = json.decode(data.mods)
			data.model = data.vehicle
			if data_decoded.color1 then
				data.color = colors[tostring(data_decoded.color1)]
				if colors[tostring(data_decoded.color2)] then
					data.color = colors[tostring(data_decoded.color2)] .. " on " .. colors[tostring(data_decoded.color1)]
				end
			end
			table.insert(matches, data)
		end

		TriggerClientEvent("mdtLSC:returnVehicleSearchResults", src, matches)
	end)
end)

RegisterServerEvent("mdtLSC:performVehicleSearchInFront")
AddEventHandler("mdtLSC:performVehicleSearchInFront", function(query)
	local src = source
	local Player = DenaliFW.Functions.GetPlayer(source)
     if Player.PlayerData.job.name == "mechanic" then
		exports['ghmattimysql']:execute("SELECT * FROM `player_vehicles` WHERE `plate` = @query", {
			['@query'] = query
		}, function(result)
			TriggerClientEvent("mdtLSC:toggleVisibilty", src)
			TriggerClientEvent("mdtLSC:returnVehicleSearchInFront", src, result, query)
		end)
	end
end)

RegisterServerEvent("mdtLSC:getVehicle")
AddEventHandler("mdtLSC:getVehicle", function(vehicle)
	local src = source
	exports['ghmattimysql']:execute("SELECT * FROM `players` WHERE `citizenid` = @query", {
		['@query'] = vehicle.citizenid
	}, function(result)
		if result[1] then
			local charinfo = json.decode(tostring(result[1].charinfo))
			local first = charinfo.firstname
			local last = charinfo.lastname

			vehicle.owner = first .. ' ' .. last
			vehicle.owner_id = result[1].citizenid
		end

		vehicle.type = types[vehicle.type]
		TriggerClientEvent("mdtLSC:returnVehicleDetails", src, vehicle)
	end)
end)

RegisterServerEvent("mdtLSC:getWarrants")
AddEventHandler("mdtLSC:getWarrants", function()
	local src = source
	exports['ghmattimysql']:execute("SELECT * FROM `mdt_warrantsLSC`", {}, function(warrants)
		for i = 1, #warrants do
			warrants[i].expire_time = ""
			warrants[i].charges = json.decode(warrants[i].charges)
		end
		TriggerClientEvent("mdtLSC:returnWarrants", src, warrants)
	end)
end)
RegisterServerEvent("mdtLSC:submitNewWarrant")
AddEventHandler("mdtLSC:submitNewWarrant", function(data)
	local src = source
	data.charges = json.encode(data.charges)
	data.author = GetCharacterName(source)
	data.date = os.date('%m-%d-%Y %H:%M:%S', os.time())
	exports['ghmattimysql']:execute('INSERT INTO `mdt_warrantsLSC` (`name`, `char_id`, `report_id`, `report_title`, `charges`, `date`, `expire`, `notes`, `author`) VALUES (@name, @char_id, @report_id, @report_title, @charges, @date, @expire, @notes, @author)', {
		['@name']  = data.name,
		['@char_id'] = data.char_id,
		['@report_id'] = data.report_id,
		['@report_title'] = data.report_title,
		['@charges'] = data.charges,
		['@date'] = data.date,
		['@expire'] = data.expire,
		['@notes'] = data.notes,
		['@author'] = data.author
	}, function()
		TriggerClientEvent("mdtLSC:completedWarrantAction", src)
	end)
end)

RegisterServerEvent("mdtLSC:deleteWarrant")
AddEventHandler("mdtLSC:deleteWarrant", function(id)
	local src = source
	exports['ghmattimysql']:execute('DELETE FROM `mdt_warrantsLSC` WHERE `id` = @id', {
		['@id']  = id
	}, function()
		TriggerClientEvent("mdtLSC:completedWarrantAction", src)
	end)
end)

RegisterServerEvent("mdtLSC:getReportDetailsById")
AddEventHandler("mdtLSC:getReportDetailsById", function(query, _source)
	if _source then source = _source end
	local usource = source
	exports['ghmattimysql']:execute("SELECT * FROM `mdt_reportsLSC` WHERE `id` = @query", {
		['@query'] = query
	}, function(result)
		if result and result[1] then
			result[1].charges = json.decode(result[1].charges)
			TriggerClientEvent("mdtLSC:returnReportDetails", usource, result[1])
		end
	end)
end)

function GetLicenses(identifier, cb)
	local Player = DenaliFW.Functions.GetPlayer(identifier)
	local licenses = Player.PlayerData.metadata["licences"]
	return cb(licenses)
end

function GetCharacterName(source)

	local Player = DenaliFW.Functions.GetPlayer(source)

	if Player ~= nil then
		local firstname = Player.PlayerData.charinfo.firstname
		local lastname = Player.PlayerData.charinfo.lastname
		local name = firstname .. ' ' .. lastname
		return name
	end
end
