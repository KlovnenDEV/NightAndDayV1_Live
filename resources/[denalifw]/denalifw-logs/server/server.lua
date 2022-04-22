DenaliFW = exports['denalifw-core']:GetCoreObject() -- Used Globally


RegisterServerEvent('denalifw-logs:server:SendLog')
AddEventHandler('denalifw-logs:server:SendLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone ~= nil and tagEveryone or false
    local  = Config.Webhooks[name] ~= nil and Config.Webhooks[name] or Config.Webhooks["default"]
    local embedData = {
        {
         ["title"] = title,
         ["color"] = Config.Colors[color] ~= nil and Config.Colors[color] or Config.Colors["default"],
         ["footer"] = {
         ["text"] = os.date("%c"),
         },
         ["description"] = message,
        }
    }
    Citizen.Wait(100)
    if tag then
      PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = "QB Logs", content = "@everyone"}), { ['Content-Type'] = 'application/json' })
    else
      PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = "QB Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
    end
end)

AddEventHandler('chatMessage', function(author, color, message)
    if source ~= nil then
      TriggerEvent("denalifw-logs:server:SendLog", "chat", "OOC Chat", "blue", "**".. GetPlayerName(author) .. "** said: **" ..message.."**")
    end
end)