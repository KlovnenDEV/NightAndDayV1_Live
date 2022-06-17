DenaliFW = exports["denalifw-core"]:GetCoreObject()

--Billing--
RegisterServerEvent("denalifw-uwu:bill:player", function(playerId, amount)
    local biller = DenaliFW.Functions.GetPlayer(source)
    local billed = DenaliFW.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'uwu' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)',
                    {
                        ['citizenid'] = billed.PlayerData.citizenid,
                        ['amount'] = amount,
                        ['society'] = biller.PlayerData.job.name,
                        ['sender'] = biller.PlayerData.charinfo.firstname
                    })
                end
                TriggerClientEvent('denalifw-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('DenaliFW:Notify', source, 'Invoice Successfully Sent', 'uwu')
                TriggerClientEvent('DenaliFW:Notify', billed.PlayerData.source, 'New Invoice Received', 'uwu')
            else
                TriggerClientEvent('DenaliFW:Notify', source, 'Must Be A Valid Amount Above 0', 'uwu')
            end
        else
            TriggerClientEvent('DenaliFW:Notify', source, 'You Cannot Bill Yourself', 'error')
        end
    else
        TriggerClientEvent('DenaliFW:Notify', source, 'Player Not Online', 'uwu')
    end
end)

--Bentobox--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientBentobox', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local sushi = Ply.Functions.GetItemByName("uwusushi")
    local budhabowl = Ply.Functions.GetItemByName("uwubudhabowl")
    local rosetea = Ply.Functions.GetItemByName("uwububbletearose")
    if sushi ~= nil and budhabowl ~= nil and rosetea ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

DenaliFW.Functions.CreateUseableItem("uwubentobox", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("denalifw-uwu:bentobox", source, item.name)
end)

--MisoSoup--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientMiso', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local water = Ply.Functions.GetItemByName("water_bottle")
    local tofu = Ply.Functions.GetItemByName("tofu")
    local misopaste = Ply.Functions.GetItemByName("misopaste")
    if water ~= nil and tofu ~= nil and misopaste ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Pancake--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientPancake', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local water = Ply.Functions.GetItemByName("milk")
    local flour = Ply.Functions.GetItemByName("flour")
    local egg = Ply.Functions.GetItemByName("egg")
    local cheese = Ply.Functions.GetItemByName("cheese")
    if milk ~= nil and flour ~= nil and egg ~= nil and cheese ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Blueberry Bubble Tea--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientBbtea', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local water = Ply.Functions.GetItemByName("water_bottle")
    local tea = Ply.Functions.GetItemByName("tea")
    local tapiokaballs = Ply.Functions.GetItemByName("tapiokaballs")
    local uwubbessence = Ply.Functions.GetItemByName("uwubbessence")
    if water ~= nil and tea ~= nil and tapiokaballs ~= nil and uwubbessence ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Rose Bubble Tea--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientRosetea', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local water = Ply.Functions.GetItemByName("water_bottle")
    local tea = Ply.Functions.GetItemByName("tea")
    local tapiokaballs = Ply.Functions.GetItemByName("tapiokaballs")
    local uwuroseessence = Ply.Functions.GetItemByName("uwuroseessence")
    if water ~= nil and tea ~= nil and tapiokaballs ~= nil and uwuroseessence ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Mint Bubble Tea--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientMinttea', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local water = Ply.Functions.GetItemByName("water_bottle")
    local tea = Ply.Functions.GetItemByName("tea")
    local tapiokaballs = Ply.Functions.GetItemByName("tapiokaballs")
    local uwumintessence = Ply.Functions.GetItemByName("uwumintessence")
    if water ~= nil and tea ~= nil and tapiokaballs ~= nil and uwumintessence ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Cupcakes--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientCupcake', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local rawsugar = Ply.Functions.GetItemByName("rawsugar")
    local egg = Ply.Functions.GetItemByName("egg")
    local flour = Ply.Functions.GetItemByName("flour")
    local milk = Ply.Functions.GetItemByName("milk")
    if rawsugar ~= nil and egg ~= nil and flour ~= nil and milk ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Sushi--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientSushi', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local tuna = Ply.Functions.GetItemByName("tuna")
    local rice = Ply.Functions.GetItemByName("rice")
    local avocado = Ply.Functions.GetItemByName("avocado")
    local nori = Ply.Functions.GetItemByName("nori")
    if tuna ~= nil and rice ~= nil and avocado ~= nil and nori ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Budhalbowl--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientBudhabowl', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local mixedlettuce = Ply.Functions.GetItemByName("mixedlettuce")
    local tofu = Ply.Functions.GetItemByName("tofu")
    local avocado = Ply.Functions.GetItemByName("avocado")
    local mango = Ply.Functions.GetItemByName("mango")
    local umami = Ply.Functions.GetItemByName("umami")
    if mixedlettuce ~= nil and tofu ~= nil and avocado ~= nil and mango ~= nil and umami ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Vanilla Sandy--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientvSandwich', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local rawsugar = Ply.Functions.GetItemByName("rawsugar")
    local egg = Ply.Functions.GetItemByName("egg")
    local flour = Ply.Functions.GetItemByName("flour")
    local milk = Ply.Functions.GetItemByName("milk")
    local vanillabean = Ply.Functions.GetItemByName("vanillabean")
    if rawsugar ~= nil and egg ~= nil and flour ~= nil and milk ~= nil and vanillabean ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

--Chocolate Sandy--
DenaliFW.Functions.CreateCallback('denalifw-uwu:server:get:ingredientcSandwich', function(source, cb)
    local src = source
    local Ply = DenaliFW.Functions.GetPlayer(src)
    local rawsugar = Ply.Functions.GetItemByName("rawsugar")
    local egg = Ply.Functions.GetItemByName("egg")
    local flour = Ply.Functions.GetItemByName("flour")
    local milk = Ply.Functions.GetItemByName("milk")
    local chocolate = Ply.Functions.GetItemByName("chocolate")
    if rawsugar ~= nil and egg ~= nil and flour ~= nil and milk ~= nil and chocolate ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
