DenaliFW = exports['denalifw-core']:GetCoreObject()
SpectateData = {}

-- [ Code ] --

-- [ Callbacks ] --

DenaliFW.Functions.CreateCallback('mc-adminmenu/server/get-permission', function(source, Cb)
    local Group = DenaliFW.Functions.GetPermission(source)
    Cb(Group)
end)

DenaliFW.Functions.CreateCallback('mc-admin/server/get-active-players-in-radius', function(Source, Cb, Coords, Radius)
	local Coords, Radius = Coords ~= nil and vector3(Coords.x, Coords.y, Coords.z) or GetEntityCoords(GetPlayerPed(Source)), Radius ~= nil and Radius or 5.0
    local ActivePlayers = {}
	for k, v in pairs(DenaliFW.Functions.GetPlayers()) do
        local TargetCoords = GetEntityCoords(GetPlayerPed(v))
        local TargetDistance = #(TargetCoords - Coords)
        if TargetDistance <= Radius then
            ActivePlayers[#ActivePlayers + 1] = {
                ['ServerId'] = v,
                ['Name'] = GetPlayerName(v)
            }
        end
	end
	Cb(ActivePlayers)
end)

DenaliFW.Functions.CreateCallback('mc-admin/server/get-bans', function(source, Cb)
    local BanList = {}
    local BansData = MySQL.Sync.fetchAll('SELECT * FROM bans', {})
    if BansData and BansData[1] ~= nil then
        for k, v in pairs(BansData) do
            local TPlayer = GetPlayerFromLicense(v.license)
            if TPlayer ~= nil then
                BanList[#BanList + 1] = {
                    Text = v.name.." ("..v.banid..")",
                    BanId = v.banid,
                    Source = TPlayer.Source,
                    Name = v.name,
                    Reason = v.reason,
                    Expires = os.date('*t', tonumber(v.expire)),
                    BannedOn = os.date('*t', tonumber(v.bannedon)),
                    BannedOnN = v.bannedon,
                    BannedBy = v.bannedby,
                    License = v.license,
                    Discord = v.discord,
                }
            end
        end
    end
    Cb(BanList)
end)

DenaliFW.Functions.CreateCallback('mc-admin/server/get-logs', function(source, Cb)
    local LogsList = {}
    local LogsData = MySQL.query.await('SELECT * FROM logs', {})
    if LogsData and LogsData[1] ~= nil then
        for k, v in pairs(LogsData) do
            LogsList[#LogsList + 1] = {
                Type = v.Type ~= nil and v.Type or Lang:t('logs.no_type'),
                Steam = v.Steam ~= nil and v.Steam  or Lang:t('logs.no_desc'),
                Desc = v.Log ~= nil and v.Log or Lang:t('logs.no_Desc'),
                Date = v.Date ~= nil and v.Date or Lang:t('logs.no_date'),
                Cid = v.Cid ~= nil and v.Cid or Lang:t('logs.no_cid'),
                Data = v.Data ~= nil and v.Data or Lang:t('logs.no_data'),
            }
        end
    end
    Cb(LogsList)
end)
 
DenaliFW.Functions.CreateCallback('mc-admin/server/get-players', function(source, Cb)
    local PlayerList = {}
    for k, v in pairs(DenaliFW.Functions.GetPlayers()) do
        PlayerList[#PlayerList + 1] = {
            ServerId = v,
            Name = GetPlayerName(v),
            Steam = DenaliFW.Functions.GetIdentifier(v, "steam"),
            License = DenaliFW.Functions.GetIdentifier(v, "license")
        }
    end
    Cb(PlayerList)
end)

DenaliFW.Functions.CreateCallback('mc-admin/server/get-player-data', function(source, Cb, LicenseData)
    local PlayerInfo = {}
    for license, _ in pairs(LicenseData) do
        local TPlayer = GetPlayerFromLicense(license)
        if TPlayer ~= nil then
            PlayerInfo = {
                Name = TPlayer.PlayerData.name,
                Steam = DenaliFW.Functions.GetIdentifier(TPlayer.PlayerData.source, "steam"),
                CharName = TPlayer.PlayerData.charinfo.firstname..' '..TPlayer.PlayerData.charinfo.lastname,
                Source = TPlayer.PlayerData.source,
                CitizenId = TPlayer.PlayerData.citizenid
            }
        end
        Cb(PlayerInfo)
    end
end)

DenaliFW.Functions.CreateCallback('mc-admin/server/get-date-difference', function(source, Cb, Bans, Type)
    local FilteredBans, BanAmount = GetDateDifference(Type, Bans) 
    Cb(FilteredBans, BanAmount)
end)

DenaliFW.Functions.CreateCallback("mc-admin/server/create-log", function(source, Cb, Type, Log, Data)
    if Type == nil or Log == nil then return end

    local Player = DenaliFW.Functions.GetPlayer(source)
    local Steam = DenaliFW.Functions.GetIdentifier(source, "steam")
    if Player ~= nil then
        MySQL.insert('INSERT INTO logs (Type, Steam, Log, Cid, Data) VALUES (?, ?, ?, ?, ?)', {
            Type,
            Steam,
            Log,
            Player.PlayerData.citizenid ~= nil and Player.PlayerData.citizenid or "Not found",
            Data,
        })
    end
end)

-- [ Events ] --

RegisterNetEvent("mc-admin/server/try-open-menu", function(KeyPress)
    local src = source
    if not AdminCheck(src) then return end
    
    TriggerClientEvent('mc-admin/client/try-open-menu', src, KeyPress)
end)

-- User Actions

RegisterNetEvent("mc-admin/server/unban-player", function(BanId)
    local src = source
    if not AdminCheck(src) then return end

    local BanData = MySQL.query.await('SELECT * FROM bans WHERE banid = ?', {BanId})
    if BanData and BanData[1] ~= nil then
        MySQL.query('DELETE FROM bans WHERE banid = ?', {BanId})
        TriggerClientEvent('DenaliFW:Notify', src, Lang:t('bans.unbanned'), 'success')
    else
        TriggerClientEvent('DenaliFW:Notify', src, Lang:t('bans.not_banned'), 'error')
    end
end)

RegisterNetEvent("mc-admin/server/ban-player", function(ServerId, Expires, Reason)
    local src = source
    if not AdminCheck(src) then return end

    local License = DenaliFW.Functions.GetIdentifier(ServerId, 'license')
    local BanData = MySQL.query.await('SELECT * FROM bans WHERE license = ?', {License})
    if BanData and BanData[1] ~= nil then
        for k, v in pairs(BanData) do
            TriggerClientEvent('DenaliFW:Notify', src, Lang:t('bans.already_banned', {player = GetPlayerName(ServerId), reason = v.reason}), 'error')
        end
    else
        local Expiring, ExpireDate = GetBanTime(Expires)
        local Time = os.time()
        local BanId = "BAN-"..math.random(11111, 99999)
        MySQL.insert('INSERT INTO bans (banid, name, license, discord, ip, reason, bannedby, expire, bannedon) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            BanId,
            GetPlayerName(ServerId),
            License,
            DenaliFW.Functions.GetIdentifier(ServerId, 'discord'),
            DenaliFW.Functions.GetIdentifier(ServerId, 'ip'),
            Reason,
            GetPlayerName(src),
            ExpireDate,
            Time,
        })
        TriggerClientEvent('DenaliFW:Notify', src, Lang:t('bans.success_banned', {player = GetPlayerName(ServerId), reason = Reason}), 'success')
        local ExpireHours = tonumber(Expiring['hour']) < 10 and "0"..Expiring['hour'] or Expiring['hour']
        local ExpireMinutes = tonumber(Expiring['min']) < 10 and "0"..Expiring['min'] or Expiring['min']
        local ExpiringDate = Expiring['day'] .. '/' .. Expiring['month'] .. '/' .. Expiring['year'] .. ' | '..ExpireHours..':'..ExpireMinutes
        if Expires == "Permanent" then
            DropPlayer(ServerId,  Lang:t('bans.perm_banned', {reason = Reason}))
        else
            DropPlayer(ServerId, Lang:t('bans.banned', {reason = Reason, expires = ExpiringDate}))
        end
    end
end)

RegisterNetEvent("mc-admin/server/kick-player", function(ServerId, Reason)
    local src = source
    if not AdminCheck(src) then return end

    DropPlayer(ServerId, Reason)
    TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.banned'), 'success')
end)

RegisterNetEvent("mc-admin/server/give-item", function(ServerId, ItemName, ItemAmount)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = DenaliFW.Functions.GetPlayer(ServerId)
    TPlayer.Functions.AddItem(ItemName, ItemAmount, 'Admin-Menu-Give')
    TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.gaveitem', {amount = ItemAmount, name = ItemName}), 'success')
end)

RegisterNetEvent("mc-admin/server/request-job", function(ServerId, JobName)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = DenaliFW.Functions.GetPlayer(ServerId)
    TPlayer.Functions.SetJob(JobName, 1, 'Admin-Menu-Give-Job')
    TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.setjob', {jobname = JobName}), 'success')
end)

RegisterNetEvent('mc-admin/server/start-spectate', function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    -- Check if Person exists
    local Target = GetPlayerPed(ServerId)
    if not Target then
        return TriggerClientEvent('DenaliFW:Notify', src, Lang:t('spectate.not_found'), 'error')
    end

    -- Make Check for Spectating
    local SteamIdentifier = DenaliFW.Functions.GetIdentifier(src, "steam")
    if SpectateData[SteamIdentifier] ~= nil then
        SpectateData[SteamIdentifier]['Spectating'] = true
    else
        SpectateData[SteamIdentifier] = {}
        SpectateData[SteamIdentifier]['Spectating'] = true
    end

    local tgtCoords = GetEntityCoords(Target)
    TriggerClientEvent('Mercy/client/specPlayer', src, ServerId, tgtCoords)
end)

RegisterNetEvent('mc-admin/server/stop-spectate', function()
    local src = source
    if not AdminCheck(src) then return end

    local SteamIdentifier = DenaliFW.Functions.GetIdentifier(src, "steam")
    if SpectateData[SteamIdentifier] ~= nil and SpectateData[SteamIdentifier]['Spectating'] then
        SpectateData[SteamIdentifier]['Spectating'] = false
    end
end)

RegisterNetEvent("mc-admin/server/drunk", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('mc-admin/client/drunk', ServerId)
end)

RegisterNetEvent("mc-admin/server/animal-attack", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('mc-admin/client/animal-attack', ServerId)
end)

RegisterNetEvent("mc-admin/server/set-fire", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('mc-admin/client/set-fire', ServerId)
end)

RegisterNetEvent("mc-admin/server/fling-player", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('mc-admin/client/fling-player', ServerId)
end)

RegisterNetEvent("mc-admin/server/play-sound", function(ServerId, SoundId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('mc-admin/client/play-sound', ServerId, SoundId)
end)

-- Utility Actions

RegisterNetEvent("mc-admin/server/toggle-blips", function()
    local src = source
    if not AdminCheck(src) then return end

    local BlipData = {}
    for k, v in pairs(DenaliFW.Functions.GetPlayers()) do
        BlipData[#BlipData + 1] = {
            ServerId = v,
            Name = GetPlayerName(v),
            Coords = GetEntityCoords(GetPlayerPed(v)),
        }
    end
    TriggerClientEvent('mc-admin/client/UpdatePlayerBlips', src, BlipData)
end)


RegisterNetEvent("mc-admin/server/teleport-player", function(ServerId, Type)
    local src = source
    if not AdminCheck(src) then return end

    local Msg = ""
    if Type == 'Goto' then
        Msg = Lang:t('info.teleportedto') 
        local TCoords = GetEntityCoords(GetPlayerPed(ServerId))
        TriggerClientEvent('mc-admin/client/teleport-player', src, TCoords)
    elseif Type == 'Bring' then
        Msg = Lang:t('info.teleportedbrought')
        local Coords = GetEntityCoords(GetPlayerPed(src))
        TriggerClientEvent('mc-admin/client/teleport-player', ServerId, Coords)
    end
    TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.teleported', {tpmsg = Msg}), 'success')
end)

RegisterNetEvent("mc-admin/server/chat-say", function(Message)
    TriggerClientEvent('chat:addMessage', -1, {
        template = "<div class=chat-message server'><strong>"..Lang:t('info.announcement').." | </strong> {0}</div>",
        args = {Message}
    })
end)

-- Player Actions

RegisterNetEvent("mc-admin/server/toggle-godmode", function(ServerId)
    TriggerClientEvent('mc-admin/client/toggle-godmode', ServerId)
end)

RegisterNetEvent("mc-admin/server/set-food-drink", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = DenaliFW.Functions.GetPlayer(ServerId)
    if TPlayer ~= nil then
        TPlayer.Functions.SetMetaData('thirst', 100)
        TPlayer.Functions.SetMetaData('hunger', 100)
        TriggerClientEvent('hud:client:UpdateNeeds', ServerId, 100, 100)
        TPlayer.Functions.Save()
        TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.gave_needs'), 'success')
    end
end)

RegisterNetEvent("mc-admin/server/remove-stress", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = DenaliFW.Functions.GetPlayer(ServerId)
    if TPlayer ~= nil then
        TPlayer.Functions.SetMetaData('stress', 0)
        TriggerClientEvent('hud:client:UpdateStress', ServerId, 0)
        TPlayer.Functions.Save()
        TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.removed_stress'), 'success')
    end
end)

RegisterNetEvent("mc-admin/server/set-armor", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = DenaliFW.Functions.GetPlayer(ServerId)
    if TPlayer ~= nil then
        SetPedArmour(GetPlayerPed(ServerId), 100)
        TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.gave_armor'), 'success')
    end
end)

RegisterNetEvent("mc-admin/server/reset-skin", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    local TPlayer = DenaliFW.Functions.GetPlayer(ServerId)
    local ClothingData = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { TPlayer.PlayerData.citizenid, 1 })
    if ClothingData[1] ~= nil then
        TriggerClientEvent("denalifw-clothes:loadSkin", ServerId, false, ClothingData[1].model, ClothingData[1].skin)
    else
        TriggerClientEvent("denalifw-clothes:loadSkin", ServerId, true)
    end
end)

RegisterNetEvent("mc-admin/server/set-model", function(ServerId, Model)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('mc-admin/client/set-model', ServerId, Model)
end)

RegisterNetEvent("mc-admin/server/revive-in-distance", function()
    local src = source
    if not AdminCheck(src) then return end

    local Coords, Radius = GetEntityCoords(GetPlayerPed(src)), 5.0
	for k, v in pairs(DenaliFW.Functions.GetPlayers()) do
		local Player = DenaliFW.Functions.GetPlayer(v)
		if Player ~= nil then
			local TargetCoords = GetEntityCoords(GetPlayerPed(v))
			local TargetDistance = #(TargetCoords - Coords)
			if TargetDistance <= Radius then
                TriggerClientEvent('hospital:client:Revive', v, true)
			end
		end
	end
end)

RegisterNetEvent("mc-admin/server/revive-target", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('hospital:client:Revive', ServerId, true)
    TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.revived'), 'success')
end)

RegisterNetEvent("mc-admin/server/open-clothing", function(ServerId)
    local src = source
    if not AdminCheck(src) then return end

    TriggerClientEvent('denalifw-clothing:client:openMenu', ServerId)
    TriggerClientEvent('DenaliFW:Notify', src, Lang:t('info.gave_clothing'), 'success')
end)

