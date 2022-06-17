local DenaliFW = exports['denalifw-core']:GetCoreObject()

isSlushyCoolDownActive = false
isSluckyBuckyDonutCoolDownActive = false
isIceCreamCoolDownActive = false
isGumballStandCoolDownActive = false

RegisterNetEvent('cr-storeextras:server:GiveYellowSlushy', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("yellowslushy", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["yellowslushy"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveOrangeSlushy', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("orangeslushy", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["orangeslushy"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveBlueSlushy', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("blueslushy", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["blueslushy"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveRainbowSlushy', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("rainbowslushy", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["rainbowslushy"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveRedSlushy', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("redslushy", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["redslushy"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveGreenSlushy', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("greenslushy", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["greenslushy"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveSluckyDonut', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("superdonut", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["superdonut"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveVanillaIceCream', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("vanillaicecream", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["vanillaicecream"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveChocolateIceCream', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("chocolateicecream", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["chocolateicecream"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveMintIceCream', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("minticecream", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["minticecream"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveCookiesAndCreamIceCream', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("cookiesandcreamicecream", 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["cookiesandcreamicecream"], "add")
end)

RegisterNetEvent('cr-storeextras:server:GiveBubbleGum', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    local BubbleGum = math.random(1,52)
    if BubbleGum >= 1 then
        Player.Functions.AddItem("bubblegum_gumball", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["bubblegum_gumball"], "add")
    elseif BubbleGum >= 11 then
        Player.Functions.AddItem("blueberry_gumball", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["blueberry_gumball"], "add")
    elseif BubbleGum >= 21 then
        Player.Functions.AddItem("banana_gumball", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["banana_gumball"], "add")
    elseif BubbleGum >= 31 then
        Player.Functions.AddItem("mint_gumball", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["mint_gumball"], "add")
    elseif BubbleGum >= 41 then
        Player.Functions.AddItem("cherry_gumball", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, DenaliFW.Shared.Items["cherry_gumball"], "add")
    elseif BubbleGum >= 51 then
        TriggerClientEvent('cr-storeextras:client:BubbleGumStandFail')
    end
end)

RegisterNetEvent('cr-storeextras:server:SetSlushyCooldown')
AddEventHandler('cr-storeextras:server:SetSlushyCooldown', function()
    isSlushyCoolDownActive = true
    Wait((Config.SlushyCooldownTime * 1000) * 60)
    isSlushyCoolDownActive = false
end)

DenaliFW.Functions.CreateCallback("cr-storeextras:server:SlushyCooldown",function(_, cb)
    if isSlushyCoolDownActive then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('cr-storeextras:server:SetSluckyBuckyDonutCooldown')
AddEventHandler('cr-storeextras:server:SetSluckyBuckyDonutCooldown', function()
    isSluckyBuckyDonutCoolDownActive = true
    Wait((Config.SluckyBuckyDonutCooldownTime * 1000) * 60)
    isSluckyBuckyDonutCoolDownActive = false
end)

DenaliFW.Functions.CreateCallback("cr-storeextras:server:SluckyBuckyDonutCooldown",function(_, cb)
    if isSluckyBuckyDonutCoolDownActive then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('cr-storeextras:server:SetIceCreamCooldown')
AddEventHandler('cr-storeextras:server:SetIceCreamCooldown', function()
    isIceCreamCoolDownActive = true
    Wait((Config.SluckyBuckyDonutCooldownTime * 1000) * 60)
    isIceCreamCoolDownActive = false
end)

DenaliFW.Functions.CreateCallback("cr-storeextras:server:IceCreamCooldown",function(_, cb)
    if isIceCreamCoolDownActive then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('cr-storeextras:server:SetGumballStandCooldown')
AddEventHandler('cr-storeextras:server:SetGumballStandCooldown', function()
    isGumballStandCoolDownActive = true
    Wait((Config.GumballStandCooldownTime * 1000) * 60)
    isGumballStandCoolDownActive = false
end)

DenaliFW.Functions.CreateCallback("cr-storeextras:server:GumBallStandCooldown",function(_, cb)
    if isGumballStandCoolDownActive then
        cb(true)
    else
        cb(false)
    end
end)