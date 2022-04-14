local scopes = {}

AddEventHandler("playerEnteredScope", function(data)
    local playerEntering, player = data.player,data["for"]

    if not scopes[player] then
        scopes[player] = {}
    end

    scopes[player][playerEntering] = true
    TriggerClientEvent("playerEnteredScope",data["for"],data.player)
end)

AddEventHandler("playerLeftScope", function(data)
    local playerLeaving, player = data.player,data["for"]

    if not scopes[player] then return end
    scopes[player][playerLeaving] = nil
    TriggerClientEvent("playerLeftScope",data["for"],data.player)
end)

AddEventHandler("playerDropped", function()
    local src = source
    if not src then return end
    
    scopes[src] = nil    
    for i=1,#scopes do
        if scopes[i][src] then
            scopes[i][src] = nil
            TriggerClientEvent("playerLeftScope",i,src)
        end
    end
end)

exports("getPlayerScope",function(src)
    return scopes[src]
end)

exports("isPlayerInScope",function(src,target)
    return scopes[src] and scopes[src][target]
end)

CreateThread(function ()
    local players = {}
    local coords
    while true do
        players = {}
        for a,b in next,GetPlayers() do
            coords = GetEntityCoords(GetPlayerPed(b))
            players[b] = coords
        end
        TriggerClientEvent("dfw-onesync:playerCoords",-1,players)
        Wait(1000)
    end
end)