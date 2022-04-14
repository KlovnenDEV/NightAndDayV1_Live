local myScope = {}
local tostring = tostring
RegisterNetEvent("playerEnteredScope")
AddEventHandler("playerEnteredScope",function(player)
    myScope[player] = true 
end)

RegisterNetEvent("playerLeftScope")
AddEventHandler("playerLeftScope",function(player)
    myScope[player] = nil
end)

