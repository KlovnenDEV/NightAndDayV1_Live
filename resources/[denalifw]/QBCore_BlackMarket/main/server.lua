
local DenaliFW = exports['denalifw-core']:GetCoreObject()


local fivemac = { 
    [1] = "cutter", -- Eşyanın Kodu [Kategori 1]
    [2] = 5000, -- Eşyanın Satış Fiyatı 


    [3] = "bag", -- Eşyanın Kodu [Kategori 2]
    [4] = 5000, -- Eşyanın Satış Fiyatı 

    [5] = "gasmask", -- Eşyanın Kodu [Kategori 3]
    [6] = 5000, -- Eşyanın Satış Fiyatı 

    [7] = "c4", -- Eşyanın Kodu [Kategori 4]
    [8] = 5000, -- Eşyanın Satış Fiyatı 

    [9] = "thermite", -- Eşyanın Kodu [Kategori 5] 
    [10] = 5000, -- Eşyanın Satış Fiyatı 

    [11] = "pixellaptop", -- Eşyanın Kodu [Kategori 6] 
    [12] = 5000, -- Eşyanın Satış Fiyatı 

    [13] = "vinremover", -- Eşyanın Kodu [Kategori 7] 
    [14] = 5000 -- Eşyanın Satış Fiyatı 
}


RegisterServerEvent("fraider:esya1")
AddEventHandler("fraider:esya1", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    --if (Player.getMoney() >= fivemac[2]) then
    if Player.Functions.RemoveMoney('cash',fivemac[2]) then
    Player.Functions.AddItem(fivemac[1], 1)
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'The Product You Bought: '..fivemac[1]..'\nPrice Received: 5000$', 6000, 'success')
    else
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'You dont have enough money to buy this product! No discount! amount needed 5000$', 6000, 'error')
    end
end)


RegisterServerEvent("fraider:esya2")
AddEventHandler("fraider:esya2", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    --if (Player.getMoney() >= fivemac[6]) then
    if Player.Functions.RemoveMoney('cash',fivemac[6]) then
    Player.Functions.AddItem(fivemac[5], 1)
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'The Product You Bought: '..fivemac[5]..'\nPrice Received: 5000$', 6000, 'success')
    else
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'You dont have enough money to buy this product! No discount! amount needed 5000$', 6000, 'error')
    end
end)



RegisterServerEvent("fraider:esya3")
AddEventHandler("fraider:esya3", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
   -- if (Player.getMoney() >= fivemac[10]) then
    if Player.Functions.RemoveMoney('cash',fivemac[10]) then
    Player.Functions.AddItem(fivemac[9], 1)
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'The Product You Bought: '..fivemac[5]..'\nPrice Received: 5000$', 6000, 'success')
else
TriggerClientEvent('okokNotify:Alert', src, "Successful", 'You dont have enough money to buy this product! No discount! amount needed 5000$', 6000, 'error')
end
end)


RegisterServerEvent("fraider:esya4")
AddEventHandler("fraider:esya4", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    --if (Player.getMoney() >= fivemac[8]) then
    if Player.Functions.RemoveMoney('cash',fivemac[8]) then
    Player.Functions.AddItem(fivemac[7], 1)
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'The Product You Bought: '..fivemac[5]..'\nPrice Received: 5000$', 6000, 'success')
else
TriggerClientEvent('okokNotify:Alert', src, "Successful", 'You dont have enough money to buy this product! No discount! amount needed 5000$', 6000, 'error')
end
end)


RegisterServerEvent("fraider:esya5")
AddEventHandler("fraider:esya5", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
   -- if (Player.getMoney() >= fivemac[4]) then
    if Player.Functions.RemoveMoney('cash',fivemac[4]) then
    Player.Functions.AddItem(fivemac[3], 1)
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'The Product You Bought: '..fivemac[5]..'\nPrice Received: 5000$', 6000, 'success')
else
TriggerClientEvent('okokNotify:Alert', src, "Successful", 'You dont have enough money to buy this product! No discount! amount needed 5000$', 6000, 'error')
end
end)

RegisterServerEvent("fraider:esya6")
AddEventHandler("fraider:esya6", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    --if (Player.getMoney() >= fivemac[12]) then
    if Player.Functions.RemoveMoney('cash',fivemac[12]) then
    Player.Functions.AddItem(fivemac[11], 1)
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'The Product You Bought: '..fivemac[5]..'\nPrice Received: 5000$', 6000, 'success')
else
TriggerClientEvent('okokNotify:Alert', src, "Successful", 'You dont have enough money to buy this product! No discount! amount needed 5000$', 6000, 'error')
end
end)

RegisterServerEvent("fraider:esya7")
AddEventHandler("fraider:esya7", function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
   -- if (Player.getMoney() >= fivemac[14]) then
    if Player.Functions.RemoveMoney('cash',fivemac[14]) then
    Player.Functions.AddItem(fivemac[13], 1)
    TriggerClientEvent('okokNotify:Alert', src, "Successful", 'The Product You Bought: '..fivemac[5]..'\nPrice Received: 50000$', 6000, 'success')
else
TriggerClientEvent('okokNotify:Alert', src, "Successful", 'You dont have enough money to buy this product! No discount! amount needed 5000$', 6000, 'error')
end
end)

DenaliFW.Functions.CreateCallback('server:BlackMarket:server:PoliceSayi', function(source, cb)
    cb(getPolice("police"))
end)


function getPolice(jobName)
    local sayi = 0
    local xPlayers = DenaliFW.Functions.GetPlayers()
	for i=1, #xPlayers, 1 do
        local xPlayer = DenaliFW.Functions.GetPlayer(xPlayers[i])
        if jobName == "police" then
            if xPlayer.PlayerData.job.name == "police" then
                sayi = sayi + 1
            end
        end
    end
    return sayi
end