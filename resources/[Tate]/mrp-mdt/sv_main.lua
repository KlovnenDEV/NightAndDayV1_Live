local usersRadios = {}

RegisterCommand("mdt", function(source)
	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	--local jobs = exports["rs-workmanager"]:getjobdata()
    local userjob = user:getVar("job")
	local rankfinel = "Police Officer"
	-- if userjob == "police" or userjob == "ems" then
	-- 	rank = user:getVar("jobRank") and user:getVar("jobRank") or 0
	-- 	rankfinel = jobs.ValidJobs[userjob]["ranks"][rank]
        TriggerClientEvent('mrp-mdt:open', src, rankfinel, char.last_name, char.first_name)
	--end
end)

local CallSigns = {}
function GetCallsign(cid)
	 local query = "SELECT `callsign` FROM `jobs_whitelist` WHERE id = ?"
    local result = Await(SQL.execute(query, cid))
    if result[1] ~= nil and result[1].callsign ~= nil then
         return result[1].callsign
    elseif CallSigns[cid] then
	    return CallSigns[cid]
    else
        return 0
    end
end

RegisterServerEvent('mrp-mdt:setRadio')
AddEventHandler("mrp-mdt:setRadio", function(radio)
	local src = source
    local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
	if not user then return end
	usersRadios[tonumber(char.id)] = radio
end)

RegisterServerEvent('police:setCallSign')
AddEventHandler("police:setCallSign", function(callsign)
    local src = source
    local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
	if not user then return end
    CallSigns[tonumber(char.id)] = callsign
end)	




RegisterServerEvent("mrp-mdt:opendashboard")
AddEventHandler("mrp-mdt:opendashboard", function()
    local src = source
	UpdateWarrants(src)
	Updatebulletin(src)
	UpdateDispatch(src)
	UpdateUnits(src)	
	getVehicles(src)
	getProfiles(src)
	UpdateReports(src)
end) 

function UpdateWarrants(src)	
	local firsttime = true
	local result = Await(SQL.execute("SELECT * FROM ___mdw_incidents"))
	local warrnts = {}
	
	for k, v in pairs(result) do
		for k2, v2 in ipairs(json.decode(v.associated)) do
			if v2.warrant == true then
				TriggerClientEvent("mrp-mdt:dashboardWarrants", src, {firsttime = firsttime, time = v.time, linkedincident = v.id, reporttitle = v.title, name = v2.name, cid = v2.cid})  
				firsttime = false
			end
		end
	end
end

function UpdateReports(src)	
	local query = "SELECT * FROM ____mdw_reports"
    local result = Await(SQL.execute(query))
	TriggerClientEvent("mrp-mdt:dashboardReports", src, result)
end	

function Updatebulletin(src)	
    local result = Await(SQL.execute("SELECT * FROM ___mdw_bulletin"))
	TriggerClientEvent("mrp-mdt:dashboardbulletin", src, result)
end

function UpdateUnits(src)	
	--local jobs = exports["rs-workmanager"]:getjobdata()
	local lspd, bcso, sahp, sasp, doc, sapr, pa, ems = {},{},{},{},{},{},{},{}
	
	for k, v in pairs(GetPlayers()) do
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(tonumber(v))
        if user then
		    local userjob = user:getVar("job")
		    if userjob == "police" or userjob == "ems" then
		         local char = user:getCurrentCharacter()
			    local rank = user:getVar("jobRank") and user:getVar("jobRank") or 0
			    --local rankfinel = jobs.ValidJobs[userjob]["ranks"][rank]f
                local name = char.first_name .. " " .. char.last_name
			    local callSign = GetCallsign(char.id)
				if userjob == "police" then
					lspds = #lspd + 1
					lspd[lspds] = {}
					lspd[lspds].duty = 1
					lspd[lspds].cid = char.id
					lspd[lspds].radio = usersRadios[char.id] or nil
					lspd[lspds].callsign = callSign
					lspd[lspds].name = name
				elseif userjob == "ems" then
					emss = #ems + 1
					ems[emss] = {}
					ems[emss].duty = 1
					ems[emss].cid = char.id
					ems[emss].radio = usersRadios[char.id] or nil
					ems[emss].callsign = callSign
					ems[emss].name = name
				end
	        end
	    end
    end	
    TriggerClientEvent("mrp-mdt:getActiveUnits", src, lspd, bcso, sahp, sasp, doc, sapr, pa, ems)
end	


function getVehicles(src)	
	local query = [[
        SELECT *
        FROM characters_cars aa
        LEFT JOIN vehicle_mdt a ON a.plate = aa.license_plate     
	    LEFT JOIN ____mdw_bolos at ON at.plate = aa.license_plate
	    ORDER BY id ASC
    ]]
    local result =  Await(SQL.execute(query))
	for k, v in pairs(result) do
		if v.image and v.image ~= nil and v.image ~= "" then 
		    result[k].image = v.image  
		else
		    result[k].image = "https://cdn.discordapp.com/attachments/832371566859124821/881624386317201498/Screenshot_1607.png"
		end
		if v.stolen and v.stolen ~= nil then 
		    result[k].stolen = v.stolen 
		else
			result[k].stolen = false
		end
		if v.code and v.code ~= nil then 
		    result[k].code = v.code
        else
            result[k].code = false		
		end
		if v.author and v.author ~= nil and v.title ~= nil then 
			result[k].bolo = true	
		else
			result[k].bolo = false	
		end
	end
	TriggerClientEvent("mrp-mdt:searchVehicles", src, result, true)
end


RegisterServerEvent("mrp-mdt:getProfileData")
AddEventHandler("mrp-mdt:getProfileData", function(id)
	local src = source
	if type(id) == "string" then id = tonumber(id) end		
    local data = getProfile(id)
	TriggerClientEvent("mrp-mdt:getProfileData", src, data, false)
end) 

RegisterServerEvent("mrp-mdt:getVehicleData")
AddEventHandler("mrp-mdt:getVehicleData", function(plate)
	local src = source
	local query = [[
        SELECT *
        FROM characters_cars aa
        LEFT JOIN vehicle_mdt a ON a.plate = aa.license_plate     
	    LEFT JOIN ____mdw_bolos at ON at.plate = aa.license_plate
	    WHERE license_plate = ? LIMIT 1
    ]]
    local result =  Await(SQL.execute(query, plate))
	
	for k, v in pairs(result) do
		if v.image and v.image ~= nil and v.image ~= "" then 
		    result[k].image = v.image  
		else
		    result[k].image = "https://cdn.discordapp.com/attachments/832371566859124821/881624386317201498/Screenshot_1607.png"
		end
		if v.stolen and v.stolen ~= nil then 
		    result[k].stolen = v.stolen 
		else
			result[k].stolen = false
		end
		if v.code and v.code ~= nil then 
		    result[k].code = v.code
        else
            result[k].code = false		
		end
		if v.notes and v.notes ~= nil then 
		    result[k].information = v.notes
        else
            result[k].information = ""		
		end		
		
		if v.author and v.author ~= nil and v.title ~= nil then 
			result[k].bolo = true	
		else
			result[k].bolo = false	
		end
    end
    TriggerClientEvent("mrp-mdt:updateVehicleDbId", src, result[1].id)
	TriggerClientEvent("mrp-mdt:getVehicleData", src, result)
end) 



RegisterServerEvent("mrp-mdt:knownInformation")
AddEventHandler("mrp-mdt:knownInformation", function(dbid, type, status, plate)
	local saveData = {type = type, status = status}
	exports.ghmattimysql:execute('SELECT * FROM `vehicle_mdt` WHERE `plate` = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			if type == "stolen" then
				exports.ghmattimysql:execute('UPDATE `vehicle_mdt` SET `stolen` = @stolen WHERE `plate` = @plate AND `dbid` = @dbid', {
				    ['@stolen'] = status,
					['@dbid'] = dbid,
					['@plate'] = plate,
				})
			elseif type == "code5" then
			    exports.ghmattimysql:execute('UPDATE `vehicle_mdt` SET `code` = @code WHERE `plate` = @plate AND `dbid` = @dbid', {
				    ['@code'] = status,
					['@dbid'] = dbid,
					['@plate'] = plate,
				})
			end
		else
			if type == "stolen" then
			    exports.ghmattimysql:execute('INSERT INTO `vehicle_mdt` (`plate`, `stolen`, `dbid`) VALUES (@plate, @stolen, @dbid)', {
			        ['@dbid'] = dbid,
			    	['@plate'] = plate,
			        ['@stolen'] = status
			    })
			elseif type == "code5" then
			    exports.ghmattimysql:execute('INSERT INTO `vehicle_mdt` (`plate`, `code`, `dbid`) VALUES (@plate, @code, @dbid)', {
			        ['@dbid'] = dbid,
				    ['@plate'] = plate,
			        ['@code'] = status
			    })
			end
		end
	end)
end)




RegisterServerEvent("mrp-mdt:searchVehicles")
AddEventHandler("mrp-mdt:searchVehicles", function(plate)
    local src = source
	local query = [[
        SELECT *
        FROM characters_cars aa
        LEFT JOIN vehicle_mdt a ON a.plate = aa.license_plate     
	    LEFT JOIN ____mdw_bolos at ON at.plate = aa.license_plate
	    WHERE LOWER(`license_plate`) LIKE ? ORDER BY id ASC
    ]]
    local result =  Await(SQL.execute(query, string.lower('%'..plate..'%')))
	for k, v in pairs(result) do
		if v.image and v.image ~= nil and v.image ~= "" then 
		    result[k].image = v.image  
		else
		    result[k].image = "https://cdn.discordapp.com/attachments/832371566859124821/881624386317201498/Screenshot_1607.png"
		end
		if v.stolen and v.stolen ~= nil then 
		    result[k].stolen = v.stolen 
		else
			result[k].stolen = false
		end
		if v.code and v.code ~= nil then 
		    result[k].code = v.code
        else
            result[k].code = false		
		end
		if v.author and v.author ~= nil and v.title ~= nil then 
			result[k].bolo = true	
		else
			result[k].bolo = false	
		end
	end
	TriggerClientEvent("mrp-mdt:searchVehicles", src, result)
end)



RegisterServerEvent("mrp-mdt:saveVehicleInfo")
AddEventHandler("mrp-mdt:saveVehicleInfo", function(dbid, plate,imageurl, notes)
	if imageurl == "" or not imageurl then imageurl = "" end
	if notes == "" or not notes then notes = "" end
	if dbid == 0 then return end
	if plate == "" then return end
	
	local usource = source
	exports.ghmattimysql:execute('SELECT * FROM `vehicle_mdt` WHERE `plate` = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			exports.ghmattimysql:execute('UPDATE `vehicle_mdt` SET `image` = @image, `notes` = @notes WHERE `plate` = @plate AND `dbid` = @dbid', {
			    ['@image'] = imageurl,
				['@dbid'] = dbid,
				['@plate'] = plate,
				['@notes'] = notes
			})
		else
			exports.ghmattimysql:execute('INSERT INTO `vehicle_mdt` (`plate`, `stolen`, `notes`, `image`, `dbid`) VALUES (@plate, @stolen, @notes, @image, @dbid)', {
			    ['@dbid'] = dbid,
				['@plate'] = plate,
				['@stolen'] = 0,
				['@image'] = imageurl,				
				['@notes'] = notes
			})
		end
	end)
end)

RegisterServerEvent("mrp-mdt:saveProfile")
AddEventHandler("mrp-mdt:saveProfile", function(profilepic, information, cid, fName, sName)
	if imageurl == "" or not imageurl then imageurl = "" end
	if notes == "" or not notes then notes = "" end
	if dbid == 0 then return end
	if plate == "" then return end
	
	local usource = source
	exports.ghmattimysql:execute('SELECT * FROM `___mdw_profiles` WHERE `cid` = @cid', {
		['@cid'] = cid
	}, function(result)
		if result[1] then
			exports.ghmattimysql:execute('UPDATE `___mdw_profiles` SET `image` = @image, `description` = @description, `name` = @name WHERE `cid` = @cid', {
			    ['@image'] = profilepic,
				['@description'] = information,
				['@name'] = fName .. " " .. sName,
				['@cid'] = cid
			})
		else
			exports.ghmattimysql:execute('INSERT INTO `___mdw_profiles` (`cid`, `image`, `description`, `name`) VALUES (@cid, @image, @description, @name)', {
			    ['@cid'] = cid,
				['@image'] = profilepic,
				['@description'] = information,
				['@name'] = fName .. " " .. sName
			})
		end
	end)
end)

RegisterServerEvent("mrp-mdt:addGalleryImg")
AddEventHandler("mrp-mdt:addGalleryImg", function(cid, url)
    local query = "SELECT * FROM `___mdw_profiles` WHERE cid = ?"
    local result = Await(SQL.execute(query, tonumber(cid)))
	if result and result[1] then
		result[1].gallery = json.decode(result[1].gallery)
		table.insert(result[1].gallery, url)
		exports.ghmattimysql:execute('UPDATE `___mdw_profiles` SET `gallery` = @gallery WHERE `cid` = @cid', {
			['@cid'] = cid,
			['@gallery'] = json.encode(result[1].gallery),
		})	
	end
end)		

RegisterServerEvent("mrp-mdt:removeGalleryImg")
AddEventHandler("mrp-mdt:removeGalleryImg", function(cid, url)
    local query = "SELECT * FROM `___mdw_profiles` WHERE cid = ?"
    local result = Await(SQL.execute(query, tonumber(cid)))

	if result and result[1] then
		result[1].gallery = json.decode(result[1].gallery)
		for k,v in ipairs(result[1].gallery) do
			if v == url then
				table.remove(result[1].gallery, k)
			end
		end
		exports.ghmattimysql:execute('UPDATE `___mdw_profiles` SET `gallery` = @gallery WHERE `cid` = @cid', {
			['@cid'] = cid,
			['@gallery'] = json.encode(result[1].gallery),
		})	
	end
end)
	
RegisterServerEvent("mrp-mdt:searchProfile")
AddEventHandler("mrp-mdt:searchProfile", function(query)
    local src = source
    local queryData = string.lower('%'..query..'%')
    local query = "SELECT * FROM `characters` WHERE LOWER(`first_name`) LIKE ? OR LOWER(`id`) LIKE ? OR LOWER(`last_name`) LIKE ? OR CONCAT(LOWER(`first_name`), ' ', LOWER(`last_name`), ' ', LOWER(`id`)) LIKE ?"
    local result = Await(SQL.execute(query, queryData, queryData, queryData, queryData)) 
	local licenses = Await(SQL.execute("SELECT * FROM user_licenses")) 	
	local mdw_profiles = Await(SQL.execute("SELECT * FROM ___mdw_profiles")) 	

	for k, v in pairs(result) do	
        result[k].firstname = v.first_name
        result[k].lastname  = v.last_name
	    for i=1, #licenses do
			if  licenses[i].cid == v.id then
	        v.type = licenses[i].type
		    if v.type == "theory" then result[k].theory = true end
		    if v.type == "drivers" then result[k].car = true end
		    if v.type == "bike" then result[k].bike = true end
		    if v.type == "truck" then result[k].truck = true end
		    if v.type == "weapon" then result[k].weapon = true end
		    if v.type == "hunting" then result[k].hunting = true end
		    if v.type == "pilot" then result[k].pilot = true end
			end
		end
		result[k].policemdtinfo = ""
		result[k].pp = "https://media.discordapp.net/attachments/832371566859124821/872590513646239804/Screenshot_1522.png"
		for i=1, #mdw_profiles do
			if mdw_profiles[i].cid == v.id then
				if mdw_profiles[i].image and mdw_profiles[i].image ~= nil then
					result[k].pp = mdw_profiles[i].image		
				end
				if mdw_profiles[i].description and mdw_profiles[i].description ~= nil then
					result[k].policemdtinfo = mdw_profiles[i].description
				end
				result[k].policemdtinfo = mdw_profiles[i].description
			end
		end	
        result[k].warrant = false
        result[k].convictions = 0
        result[k].cid = v.id
	end
	
	TriggerClientEvent("mrp-mdt:searchProfile", src, result, true)
end)	

function getProfile(id)
	print(id)
	    local query = "SELECT * FROM characters WHERE id = ? LIMIT 1"
        local result = Await(SQL.execute(query, id)) 
        local resultI = Await(SQL.execute("SELECT * FROM ___mdw_incidents")) 
	    for k, v in pairs(resultI) do
		    for k2, v2 in ipairs(json.decode(v.associated)) do
		    	if v2.cid == result[1].id then
                    result[1].convictions = v2.charges
			    end
	    	end	
	    end	
        local vehresult = Await(SQL.execute("SELECT * FROM characters_cars WHERE cid = ?", id)) 
	    result[1].vehicles = vehresult
        result[1].firstname = result[1].first_name
        result[1].lastname  = result[1].last_name
		
		local query2 = "SELECT * FROM user_licenses WHERE cid = ?"
        local result2 = Await(SQL.execute(query2, id)) 		
	    for i=1, #result2 do
		    if result2[i].type == "theory" then result[1].theory = true end
		    if result2[i].type == "drivers" then result[1].car = true end
		    if result2[i].type == "bike" then result[1].bike = true end
		    if result2[i].type == "truck" then result[1].truck = true end
		    if result2[i].type == "weapon" then result[1].weapon = true end
		    if result2[i].type == "hunting" then result[1].hunting = true end
		    if result2[i].type == "pilot" then result[1].pilot = true end
		end
		
        result[1].warrant = false
        result[1].cid = result[1].id
		result[1].job = result[1].lastjob

        local proresult = Await(SQL.execute("SELECT * FROM ___mdw_profiles WHERE cid = ? LIMIT 1", id)) 		
        if proresult and proresult[1] ~= nil then
            result[1].profilepic = proresult[1].image		
		    result[1].tags = json.decode(proresult[1].tags)		
		    result[1].gallery = json.decode(proresult[1].gallery)		
		    result[1].policemdtinfo = proresult[1].description
	    else
		    result[1].tags = {}			
		    result[1].gallery = {}			
		    result[1].pp = "https://media.discordapp.net/attachments/832371566859124821/872590513646239804/Screenshot_1522.png"
		end
	return result[1]
end


function getProfiles(src)
	local query = [[
        SELECT *
        FROM characters aa
	    LEFT JOIN ___mdw_profiles at ON at.cid = aa.id 
		ORDER BY id ASC  		
    ]]

	local licenses = Await(SQL.execute("SELECT * FROM user_licenses")) 		

    local result =  Await(SQL.execute(query))
	for k, v in pairs(result) do
        result[k].firstname = v.first_name
        result[k].lastname  = v.last_name
	        for i=1, #licenses do
			    if  licenses[i].cid == v.id then
	            v.type = licenses[i].type
		        if v.type == "theory" then result[k].theory = true end
		        if v.type == "driver" then result[k].car = true end
		        if v.type == "bike" then result[k].bike = true end
		        if v.type == "truck" then result[k].truck = true end
		        if v.type == "weapon" then result[k].weapon = true end
		        if v.type == "hunting" then result[k].hunting = true end
		        if v.type == "pilot" then result[k].pilot = true end
				end
			end

        result[k].warrant = false
        result[k].convictions = 0
        result[k].cid = v.id
		
		if v.image and v.image ~= nil and v.image ~= "" then 
		    result[k].pp = v.image  
		else
		    result[k].pp = "https://media.discordapp.net/attachments/832371566859124821/872590513646239804/Screenshot_1522.png"
		end
	   	exports.ghmattimysql:execute('SELECT * FROM `___mdw_profiles` WHERE `cid` = @cid', {
		    ['@cid'] = v.id
		}, function(proresult)
            if proresult and proresult[1] ~= nil then
	
        	result[k].pp = proresult[1].image		
       	    result[k].policemdtinfo = proresult[1].description
			end
		end)
    end
	TriggerClientEvent("mrp-mdt:searchProfile", src, result, true)
end



RegisterServerEvent("mrp-mdt:updateLicense")
AddEventHandler("mrp-mdt:updateLicense", function(cid, type, status)
	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
	local name = char.first_name .. " " .. char.last_name
	local time = exports["mrp-lib"]:getDate()
	if status == "revoke" then action = "Revoked" else action = "Given" end
	
	TriggerEvent("mrp-mdt:newLog", name .. " " .. action .." licenses type: " .. firstToUpper(type) .. " Edited Citizen Id: " .. cid, time)

	if status == "revoke" then
	    local query = "DELETE FROM licenses WHERE cid = ? AND type = ?"
		SQL.execute(query, cid, type)	
	else
		local query = "INSERT INTO licenses (cid, type) VALUES(?, ?)"
		SQL.execute(query, cid, type)	
	end
end)


RegisterServerEvent("mrp-mdt:newBulletin")
AddEventHandler("mrp-mdt:newBulletin", function(title, info, time, id)
    local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
    local Bulletin = {
	    title = title,
		id = id,
		info = info,
		time = time,
		src = src,
		author = name
	}
	local query = "INSERT INTO ___mdw_bulletin (title, info, time, src, author, id) VALUES(?, ?, ?, ?, ?, ?)"
	SQL.execute(query, title, info, time, tostring(src), name, id)
    TriggerEvent("mrp-mdt:newLog", name .. " Opened a new Bulletin: Title " .. title .. ", Info " .. info, time)
    TriggerClientEvent("mrp-mdt:newBulletin", -1, src, Bulletin, "police")
end)

RegisterServerEvent("mrp-mdt:deleteBulletin")
AddEventHandler("mrp-mdt:deleteBulletin", function(id)
    local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
	local query = "DELETE FROM ___mdw_bulletin WHERE id = ?"
	Await(SQL.execute(query,id)) 	

    TriggerClientEvent("mrp-mdt:deleteBulletin", -1, src, id, "police")
end)

RegisterServerEvent("mrp-mdt:newLog")
AddEventHandler("mrp-mdt:newLog", function(text, time)

    local query = "INSERT INTO ___mdw_logs (text, time) VALUES(?, ?)"
	Await(SQL.execute(query, text, time)) 	
end)

RegisterServerEvent("mrp-mdt:getAllLogs")
AddEventHandler("mrp-mdt:getAllLogs", function()
	local src = source
	local query = "SELECT * FROM ___mdw_logs LIMIT 120"
    local result = Await(SQL.execute(query))
    
	TriggerClientEvent("mrp-mdt:getAllLogs", src, result)
end) 

RegisterServerEvent("mrp-mdt:getAllIncidents")
AddEventHandler("mrp-mdt:getAllIncidents", function()
	local src = source
	local query = "SELECT * FROM ___mdw_incidents"
    local result = Await(SQL.execute(query))		
		
	TriggerClientEvent("mrp-mdt:getAllIncidents", src, result)
end) 

RegisterServerEvent("mrp-mdt:getIncidentData")
AddEventHandler("mrp-mdt:getIncidentData", function(id)
	local src = source
	local query = "SELECT * FROM ___mdw_incidents WHERE id = ?"
    local result = Await(SQL.execute(query, id))	
	
	
    	
	result[1].tags = json.decode(result[1].tags)
	result[1].officersinvolved = json.decode(result[1].officers)
	result[1].civsinvolved = json.decode(result[1].civilians)
	result[1].evidence = json.decode(result[1].evidence)
	result[1].convictions = json.decode(result[1].associated)
	result[1].charges = json.decode(result[1].associated.charges)
	TriggerClientEvent("mrp-mdt:updateIncidentDbId", src, result[1].id)
	TriggerClientEvent("mrp-mdt:getIncidentData", src, result[1], json.decode(result[1].associated))
end) 

RegisterServerEvent("mrp-mdt:incidentSearchPerson")
AddEventHandler("mrp-mdt:incidentSearchPerson", function(query1)
	local src = source
	local queryData = string.lower('%'..query1..'%')
	local query = "SELECT first_name, last_name, id FROM `characters`  WHERE LOWER(`first_name`) LIKE ? OR LOWER(`id`) LIKE ? OR LOWER(`last_name`) LIKE ? OR CONCAT(LOWER(`first_name`), ' ', LOWER(`last_name`), ' ', LOWER(`id`)) LIKE ?"	
	local result = Await(SQL.execute(query, queryData, queryData, queryData, queryData)) 
	local mdw_profiles = Await(SQL.execute("SELECT * FROM ___mdw_profiles")) 	
	for k, v in pairs(result) do	
        result[k].firstname = v.first_name
        result[k].lastname  = v.last_name
		result[k].profilepic = "https://media.discordapp.net/attachments/832371566859124821/872590513646239804/Screenshot_1522.png"
		for i=1, #mdw_profiles do
			if mdw_profiles[i].cid == v.id then
				if mdw_profiles[i].image and mdw_profiles[i].image ~= nil then
					result[k].profilepic = mdw_profiles[i].image		
				end
			end
		end			
	end		
	TriggerClientEvent('mrp-mdt:incidentSearchPerson', src, result)
end)	

RegisterServerEvent("mrp-mdt:removeIncidentCriminal")
AddEventHandler("mrp-mdt:removeIncidentCriminal", function(cid, icId)

	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
	local name = char.first_name .. " " .. char.last_name
	local time = exports["mrp-lib"]:getDate()
    local action = "Removed a criminal from an incident, incident ID: " .. icId	
    local Cname = ""
	local result = Await(SQL.execute("SELECT * FROM ___mdw_incidents WHERE id = ?", icId))
	for k, v in pairs(result) do
		for k2, v2 in ipairs(json.decode(v.associated)) do
			if tonumber(v2.cid) == tonumber(cid) then
				table.remove(v2, k)
				Cname = v2.name
			end	
        end
    end
	TriggerEvent("mrp-mdt:newLog", name .. ", " .. action ..", Criminal Citizen Id: " .. cid .. ", Name: " .. Cname .. "", time)
	local query = "UPDATE ___mdw_incidents SET tags = ? WHERE id = ?"
	SQL.execute(query, json.encode(result[1].associated), icId)
end)


RegisterServerEvent("mrp-mdt:searchIncidents")
AddEventHandler("mrp-mdt:searchIncidents", function(query)
    local src = source
	exports.ghmattimysql:execute("SELECT * FROM `___mdw_incidents` WHERE id = @query", {
		['@query'] = tonumber(query)
	}, function(result)

		TriggerClientEvent('mrp-mdt:getIncidents', src, result)
	end)
end)	
		



RegisterServerEvent("mrp-mdt:saveIncident")
AddEventHandler("mrp-mdt:saveIncident", function(data)
    local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
	

	
	for i=1, #data.associated do
		local query2 = "SELECT * FROM characters WHERE id = ?"
        local result2 = Await(SQL.execute(query2, data.associated[i].cid))	
	    data.associated[i].name = result2[1].first_name .. " " ..result2[1].last_name
	end
    if data.ID ~= 0 then
		exports.ghmattimysql:execute('UPDATE `___mdw_incidents` SET `title` = @title, `author` = @author, `time` = @time, `details` = @details, `tags` = @tags, `officers` = @officers, `civilians` = @civilians, `evidence` = @evidence, `associated` = @associated WHERE `id` = @id', {
			['@id'] = data.ID,
			['@title'] = data.title,
			['@author'] = name,
			['@time'] = data.time,
			['@details'] = data.information,
			['@tags'] = json.encode(data.tags),
			['@officers'] = json.encode(data.officers),
			['@civilians'] = json.encode(data.civilians),
			['@evidence'] = json.encode(data.evidence),
			['@associated'] = json.encode(data.associated)		
		})
	else
		exports.ghmattimysql:execute('INSERT INTO `___mdw_incidents` (`title`, `author`, `time`, `details`, `tags`, `officers`, `civilians`, `evidence`, `associated`) VALUES (@title, @author, @time, @details, @tags, @officers, @civilians, @evidence, @associated)', {
			['@title'] = data.title,
			['@author'] = name,
			['@time'] = data.time,
			['@details'] = data.information,
			['@tags'] = json.encode(data.tags),
			['@officers'] = json.encode(data.officers),
			['@civilians'] = json.encode(data.civilians),
			['@evidence'] = json.encode(data.evidence),
			['@associated'] = json.encode(data.associated)		
		})
	end
end)



RegisterServerEvent("mrp-mdt:newTag")
AddEventHandler("mrp-mdt:newTag", function(cid, tag)
    local query = "SELECT * FROM ___mdw_profiles WHERE cid = ?"
    local result = Await(SQL.execute(query, cid))	
    local newTags = {}
    if result and result[1] then
	
		result[1].tags = json.decode(result[1].tags)
		table.insert(result[1].tags, tag)
		exports.ghmattimysql:execute('UPDATE `___mdw_profiles` SET `tags` = @tags WHERE `cid` = @cid', {
			['@cid'] = cid,
			['@tags'] = json.encode(result[1].tags),	
		})
	else
		newTags[1] = tag
		exports.ghmattimysql:execute('INSERT INTO `___mdw_profiles` (`cid`, `image`, `description`, `name`) VALUES (@cid, @image, @description, @name)', {
			['@cid'] = cid,
			['@image'] = "",
			['@description'] = "",
			['@tags'] = json.encode(newTags),
			['@name'] = ""
		})
	end
end)

RegisterServerEvent("mrp-mdt:removeProfileTag")
AddEventHandler("mrp-mdt:removeProfileTag", function(cid, tag)
    local query = "SELECT * FROM ___mdw_profiles WHERE cid = ?"
    local result = Await(SQL.execute(query, tonumber(cid))) 
	if result and result[1] then
		result[1].tags = json.decode(result[1].tags)
		for k,v in ipairs(result[1].tags) do
			if v == tag then
			    table.remove(result[1].tags, k)
		    end
		end
		local query = "UPDATE ___mdw_profiles SET tags = ? WHERE cid = ?"
		SQL.execute(query, json.encode(result[1].tags), tonumber(cid))
	end	
end)


RegisterServerEvent("mrp-mdt:getPenalCode")
AddEventHandler("mrp-mdt:getPenalCode", function()
    local src = source
    local titles = {}
	local penalcode = {}
    local query = "SELECT * FROM fine_types ORDER BY category ASC"
    local result = Await(SQL.execute(query)) 
	for i=1, #result do
	    local id = result[i].id
		local res = result[i]
	    titles[id] = result[i].label
	    penalcode[id] = {}
		local color = "green"
		class = "Infraction"
		if res.category == 1 then
		color = "orange"
		class = "Misdemeanor"
		elseif res.category == 2 or res.category == 3 then 
		color =  "red"
		class = "Felony"
		end
		penalcode[id].color = color
		
		penalcode[id].title = res.label		
		penalcode[id].id = res.id
		penalcode[id].class = class
		penalcode[id].months = res.jailtime		
		penalcode[id].fine = res.jailtime		
	end
	TriggerClientEvent('mrp-mdt:getPenalCode',src, titles, penalcode)
end)	


RegisterServerEvent("mrp-mdt:getAllBolos")
AddEventHandler("mrp-mdt:getAllBolos", function()
    local src = source
	local query = "SELECT * FROM ____mdw_bolos"
    local result = Await(SQL.execute(query))
	
	TriggerClientEvent("mrp-mdt:getBolos", src, result)
end)


RegisterServerEvent("mrp-mdt:getBoloData")
AddEventHandler("mrp-mdt:getBoloData", function(id)
    local src = source
	local query = "SELECT * FROM ____mdw_bolos WHERE dbid = ?"
    local result = Await(SQL.execute(query, id))
	result[1].tags = json.decode(result[1].tags)
	result[1].gallery = json.decode(result[1].gallery)
	result[1].officersinvolved = json.decode(result[1].officers)	
	result[1].officers = json.decode(result[1].officers)
	
	
    TriggerClientEvent("mrp-mdt:getBoloData", src, result[1])
end)


RegisterServerEvent("mrp-mdt:searchBolos")
AddEventHandler("mrp-mdt:searchBolos", function(query)
    local src = source
	exports.ghmattimysql:execute("SELECT * FROM `____mdw_bolos` WHERE LOWER(`plate`) LIKE @query OR LOWER(`title`) LIKE @query OR CONCAT(LOWER(`plate`), ' ', LOWER(`title`)) LIKE @query", {
		['@query'] = string.lower('%'..query..'%') -- % wildcard, needed to search for all alike results
	}, function(result)

       	TriggerClientEvent("mrp-mdt:getBolos", src, result)
	end)
end)	

RegisterServerEvent("mrp-mdt:newBolo")
AddEventHandler("mrp-mdt:newBolo", function(data)
    if data.title == "" then return end
	if data.plate == "" then return end
	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
	exports.ghmattimysql:execute('SELECT * FROM `____mdw_bolos` WHERE `dbid` = @id', {
		['@id'] = data.id
	}, function(result)
		if data.id ~= nil and data.id ~= 0 then
			exports.ghmattimysql:execute('UPDATE `____mdw_bolos` SET `title` = @title, `plate` = @plate, `owner` = @owner, `individual` = @individual, `detail` = @detail, `tags` = @tags, `gallery` = @gallery, `officers` = @officers, `time` = @time, `author` = @author WHERE `dbid` = @id', {
			    ['@title'] = data.title,
				['@plate'] = data.plate,
				['@owner'] = data.owner,
				['@individual'] = data.individual,				
				['@detail'] = data.detail,
				['@tags'] = json.encode(data.tags),
				['@gallery'] = json.encode(data.gallery),
				['@officers'] = json.encode(data.officers),
				['@time'] = data.time,
				['@author'] = name,
				['@id'] = data.id
			})
		else
			exports.ghmattimysql:execute('INSERT INTO `____mdw_bolos` (`title`, `plate`, `owner`, `individual`, `detail`, `tags`, `gallery`, `officers`, `time`, `author`) VALUES (@title, @plate, @owner, @individual, @detail, @tags, @gallery, @officers, @time, @author)', {
			    ['@title'] = data.title,
				['@plate'] = data.plate,
				['@owner'] = data.owner,
				['@individual'] = data.individual,
				['@detail'] = data.detail,
				['@tags'] = json.encode(data.tags),
				['@gallery'] = json.encode(data.gallery),
				['@officers'] = json.encode(data.officers),
				['@time'] = data.time,
				['@author'] = name
				
			})
		    local query = "SELECT * FROM ____mdw_bolos ORDER BY dbid DESC LIMIT 1"
  			local result2 = Await(SQL.execute(query, id))
		    TriggerClientEvent("mrp-mdt:boloComplete", src, result2[1].dbid)
		end
	end)
end)



RegisterServerEvent("mrp-mdt:deleteBolo")
AddEventHandler("mrp-mdt:deleteBolo", function(id)
    local src = source
	local query = "DELETE FROM ____mdw_bolos WHERE dbid = ?"
	Await(SQL.execute(query, id)) 
end)	

local attachedUnits = {}
RegisterServerEvent("mrp-mdt:attachedUnits")
AddEventHandler("mrp-mdt:attachedUnits", function(callid)
    local src = source
	if not attachedUnits[callid] then
		local id = #attachedUnits + 1
		attachedUnits[callid] = {}		
	end
    TriggerClientEvent("mrp-mdt:attachedUnits", src, attachedUnits[callid], callid)
end)

RegisterServerEvent("mrp-mdt:callDragAttach")
AddEventHandler("mrp-mdt:callDragAttach", function(callid, cid)
    local src = source

	local user = getUserFromCid(cid)
	if user == false then return end
	local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
    local userjob = user:getVar("job")

	local id = callid

	attachedUnits[id] = {}
	attachedUnits[id][cid] = {}

	local units = 0
	for k, v in ipairs(attachedUnits[id]) do
		units = units + 1
	end

	attachedUnits[id][cid].job = userjob
	attachedUnits[id][cid].callsign = GetCallsign(char.id)
	attachedUnits[id][cid].fullname = name
	attachedUnits[id][cid].cid = char.id
	attachedUnits[id][cid].callid = callid
	attachedUnits[id][cid].radio = units
    TriggerClientEvent("mrp-mdt:callAttach", -1, callid, units)
end)


RegisterServerEvent("mrp-mdt:callAttach")
AddEventHandler("mrp-mdt:callAttach", function(callid)
    local src = source

	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
    local userjob = user:getVar("job")
	local id = callid
	local cid = char.id
	attachedUnits[id] = {}
	attachedUnits[id][cid] = {}

	local units = 0
	for k, v in pairs(attachedUnits[id]) do
		units = units + 1
	end
	attachedUnits[id][cid].job = userjob
	attachedUnits[id][cid].callsign = GetCallsign(char.id)
	attachedUnits[id][cid].fullname = name
	attachedUnits[id][cid].cid = char.id
	attachedUnits[id][cid].callid = callid
	attachedUnits[id][cid].radio = units

	--print(json.encode(attachedUnits, { indent = true }))

    TriggerClientEvent("mrp-mdt:callAttach", -1, callid, units)
end)

RegisterServerEvent("mrp-mdt:callDetach")
AddEventHandler("mrp-mdt:callDetach", function(callid)
	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
	local id = callid
	print(id, type(id), char.id, type(char.id))
    attachedUnits[id][char.id] = nil

	local units = 0
	for k, v in ipairs(attachedUnits[id]) do
		units = units + 1
	end
    TriggerClientEvent("mrp-mdt:callDetach", -1, callid, units)
end)

RegisterServerEvent("mrp-mdt:callDispatchDetach")
AddEventHandler("mrp-mdt:callDispatchDetach", function(callid, cid)
	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
	local id = tonumber(callid)
	print(id, type(id), cid, type(cid))

    attachedUnits[id][cid] = nil

	local units = 0
	for k, v in ipairs(attachedUnits[id]) do
		units = units + 1
	end
    TriggerClientEvent("mrp-mdt:callDetach", -1, callid, units)
end)


RegisterServerEvent("mrp-mdt:setWaypoint:unit")
AddEventHandler("mrp-mdt:setWaypoint:unit", function(cid)
    local src = source
	print(src)

	local user = getUserFromCid(cid)
    if user == false then return end
	local uSrc = user:getVar("source")
	local coords = GetEntityCoords(GetPlayerPed(uSrc))
    TriggerClientEvent("mrp-mdt:setWaypoint:unit", src, coords)
end)

RegisterServerEvent("mrp-mdt:setDispatchWaypoint")
AddEventHandler("mrp-mdt:setDispatchWaypoint", function(callid, cid)
    local src = source
	local user = getUserFromCid(cid)
    if user == false then return end
	local uSrc = user:getVar("source")
	local coords = GetEntityCoords(GetPlayerPed(uSrc))
    TriggerClientEvent("mrp-mdt:setWaypoint:unit", src, coords)
end)

local CallResponses = {}

RegisterServerEvent("mrp-mdt:getCallResponses")
AddEventHandler("mrp-mdt:getCallResponses", function(callid)
    local src = source
	if not CallResponses[callid] then
		CallResponses[callid] = {}
	end	
    TriggerClientEvent("mrp-mdt:getCallResponses", src, CallResponses[callid], callid)
end)

RegisterServerEvent("mrp-mdt:sendCallResponse")
AddEventHandler("mrp-mdt:sendCallResponse", function(message, time, callid, name)
	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()	
	local name = char.first_name .. " " .. char.last_name
	if not CallResponses[callid] then
		CallResponses[callid] = {}
	end	
    local id = #CallResponses[callid] + 1
	CallResponses[callid][id] = {}

	CallResponses[callid][id].name = name
	CallResponses[callid][id].message = message
	CallResponses[callid][id].time = time
    
    TriggerClientEvent("mrp-mdt:sendCallResponse", src, message, time, callid, name)
end)               





RegisterServerEvent("mrp-mdt:getAllReports")
AddEventHandler("mrp-mdt:getAllReports", function()
    local src = source
	local query = "SELECT * FROM ____mdw_reports"
    local result = Await(SQL.execute(query))
	
	TriggerClientEvent("mrp-mdt:getAllReports", src, result)
end)

RegisterServerEvent("mrp-mdt:getReportData")
AddEventHandler("mrp-mdt:getReportData", function(id)
    local src = source
	local query = "SELECT * FROM ____mdw_reports WHERE dbid = ?"
    local result = Await(SQL.execute(query, id))
	result[1].tags = json.decode(result[1].tags)
	result[1].gallery = json.decode(result[1].gallery)
	result[1].officersinvolved = json.decode(result[1].officers)	
	result[1].officers = json.decode(result[1].officers)
	result[1].civsinvolved = json.decode(result[1].civsinvolved)	
    TriggerClientEvent("mrp-mdt:getReportData", src, result[1])
end)

RegisterServerEvent("mrp-mdt:searchReports")
AddEventHandler("mrp-mdt:searchReports", function(querydata)
    local src = source
		local query = [[
			SELECT *
			FROM ____mdw_reports aa
			WHERE LOWER(`type`) LIKE ? OR LOWER(`title`) LIKE ? OR LOWER(`dbid`) LIKE ? OR CONCAT(LOWER(`type`), ' ', LOWER(`title`), ' ', LOWER(`dbid`)) LIKE ?
		]]
		local string = string.lower('%'..querydata..'%')
		local result = Await(SQL.execute(query, string, string, string, string))

       	TriggerClientEvent("mrp-mdt:getAllReports", src, result)
end)	


RegisterServerEvent("mrp-mdt:newReport")
AddEventHandler("mrp-mdt:newReport", function(data)
    if data.title == "" then return end
	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name
	local time = exports["mrp-lib"]:getDate()

	exports.ghmattimysql:execute('SELECT * FROM `____mdw_reports` WHERE `dbid` = @id', {
		['@id'] = data.id
	}, function(result)
		if data.id ~= nil and data.id ~= 0 then

			local action = "Edit A Report, Rrofile ID: " .. data.id	
			TriggerEvent("mrp-mdt:newLog", name .. ", " .. action ..", Changes: " .. json.encode(data), time)

			exports.ghmattimysql:execute('UPDATE `____mdw_reports` SET `title` = @title, `type` = @type, `detail` = @detail, `tags` = @tags, `gallery` = @gallery, `officers` = @officers, `civsinvolved` = @civsinvolved, `time` = @time, `author` = @author WHERE `dbid` = @id', {
			    ['@title'] = data.title,
			    ['@type'] = data.type,
				['@detail'] = data.detail,
				['@tags'] = json.encode(data.tags),
				['@gallery'] = json.encode(data.gallery),
				['@officers'] = json.encode(data.officers),
				['@civsinvolved'] = json.encode(data.civilians),
				['@time'] = data.time,
				['@author'] = name,
				['@id'] = data.id
			})
		else
			exports.ghmattimysql:execute('INSERT INTO `____mdw_reports` (`title`, `type`, `detail`, `tags`, `gallery`, `officers`, `civsinvolved`, `time`, `author`) VALUES (@title, @type, @detail, @tags, @gallery, @officers, @civsinvolved, @time, @author)', {
			    ['@title'] = data.title,
			    ['@type'] = data.type,
				['@detail'] = data.detail,
				['@tags'] = json.encode(data.tags),
				['@gallery'] = json.encode(data.gallery),
				['@officers'] = json.encode(data.officers),
				['@civsinvolved'] = json.encode(data.civilians),
				['@time'] = data.time,
				['@author'] = name			
			})
			Wait(500)
		    local query = "SELECT * FROM ____mdw_reports ORDER BY dbid DESC LIMIT 1"
  			local result2 = Await(SQL.execute(query, id))
		    TriggerClientEvent("mrp-mdt:reportComplete", src, result2[1].dbid)
		end
	end)
end)

function UpdateDispatch(src)
	local query = "SELECT * FROM ___mdw_messages LIMIT 200"
    local result = Await(SQL.execute(query))
    TriggerClientEvent("mrp-mdt:dashboardMessages", src, result)
end

RegisterServerEvent("mrp-mdt:sendMessage")
AddEventHandler("mrp-mdt:sendMessage", function(message, time)
	local src = source
	local user = exports["denalifw-core"]:getModule("Player"):GetUser(src)	
	local char = user:getCurrentCharacter()
    local name = char.first_name .. " " .. char.last_name


	local query = "SELECT * FROM ___mdw_profiles WHERE cid = ?"
    local pic = "https://media.discordapp.net/attachments/832371566859124821/872590513646239804/Screenshot_1522.png"
	
    local result = Await(SQL.execute(query, char.id))
    if result and result[1] ~= nil then
		if result[1].image and result[1].image ~= nil and result[1].image ~= "" then 
		    pic = result[1].image  
		end
	end	
	local query = "INSERT INTO ___mdw_messages (name, message, time, profilepic, job) VALUES(?, ?, ?, ?, ?)"
	Await(SQL.execute(query, name, message, time, pic, "police")) 	
	local lastMsg = {
        name = name,
		message = message,
		time = time,
		profilepic = pic,
		job = "police"
	}
	TriggerClientEvent("mrp-mdt:dashboardMessage", -1, lastMsg)
end)

RegisterServerEvent("mrp-mdt:refreshDispatchMsgs")
AddEventHandler("mrp-mdt:refreshDispatchMsgs", function()
    local src = source
	local query = "SELECT * FROM ___mdw_messages LIMIT 200"
    local result = Await(SQL.execute(query))
    TriggerClientEvent("mrp-mdt:dashboardMessages", src, result)
end)




--[[
RegisterNetEvent('mrp-mdt:dashboardMessage')
AddEventHandler('mrp-mdt:dashboardMessage', function(sentData)
    local job = exports["mrp_manager"]:isChar("myjob")
    if job == "police" or job.name == 'ambulance' then
        SendNUIMessage({ type = "dispatchmessage", data = sentData })
    end
end)

name
message
time
profilepic
job
]]
--[[

RegisterNUICallback("setCallsign", function(data, cb)
    TriggerServerEvent('mrp-mdt:setCallsign', data.cid, data.newcallsign)
    cb(true)
end)

RegisterNetEvent('mrp-mdt:updateCallsign')
AddEventHandler('mrp-mdt:updateCallsign', function(callsign)
    callSign = tostring(callsign)
end)]]
function tprint (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end

function getUserFromCid(cid)
	local users = exports["denalifw-core"]:getModule("Player"):GetUsers()
	for k,v in pairs(users) do
		local user = exports["denalifw-core"]:getModule("Player"):GetUser(v)
		if user then
		    local char = user:getCurrentCharacter()
            if char.id == cid then
				return user
			end
		end
	end
    return false
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end