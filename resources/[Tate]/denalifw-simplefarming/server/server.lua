local DenaliFW = exports['denalifw-core']:GetCoreObject()

RegisterNetEvent('denalifw-simpefarming:sellItems', function()
    local src = source
    local price = 0
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Config.Sell[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Sell[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price)
        TriggerClientEvent('DenaliFW:Notify', src, "You have sold your items")
    else 
		TriggerClientEvent('DenaliFW:Notify', src, "You do not have the items to sell here!")
	end
end)
------------------------------- Apple Stuff ----------------------------

RegisterServerEvent('denalifw-simplefarming:applepicking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local amount = math.random(1,3)
    Player.Functions.AddItem('apple', amount, false, info)
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['apple_pickingfront'] ..amount.. Config.Alerts['apple_pickingend'])
end)


RegisterServerEvent('denalifw-simplefarming:appleprocess', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local apple = Player.Functions.GetItemByName('apple')
    if not apple then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_appleprocessor'])
        return false 
    end

    local amount = apple.amount
    if amount >= 1 then
        amount = Config.AppleProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('apple', amount) then 
        print('couldnt remove item',amount)
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['apple'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['apple_processing'])
    print(Config.Alerts['apple_processing'])
    local amount = Config.AppleJuice
    Wait(750)
    Player.Functions.AddItem('apple_juice', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['apple_juice'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['apple_trader'])
end)

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:apples', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("apple") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


------------------------------- Cow Farming Stuff ----------------------------

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:weapon_knife', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("weapon_knife") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:cowmeat', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_beef") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:emptycowbucket', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("emptycowbucket") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


DenaliFW.Functions.CreateCallback('denalifw-simplefarming:milkbucketfull', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("milkbucket") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('denalifw-simplefarming:cowmilking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local cow_milkbucket = math.random(1,3)
    Player.Functions.AddItem('milkbucket', cow_milkbucket)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['milkbucket'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Gathered  " ..cow_milkbucket.. " buckets of milk.")
end)


RegisterServerEvent('denalifw-simplefarming:cowkilling', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local cowraw_meat1 = math.random(2,4)
    Player.Functions.AddItem('raw_beef', cowraw_meat1, false, info)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['raw_beef'], "add")
    Player.Functions.AddItem('cow_leather', 1, info)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['cow_leather'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Gathered  " ..cowraw_meat1.. " amount of raw meat. You Also skinned the cow for 1 leather")
end)

RegisterServerEvent('denalifw-simplefarming:beefprocess', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local rawbeef = Player.Functions.GetItemByName('raw_beef')
    if not rawbeef then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_rawmeat'])
        return false 
    end

    local amount = rawbeef.amount
    if amount >= 1 then
        amount = Config.BeefProcessing
    else
      return false
    end
 
    if not Player.Functions.RemoveItem('raw_beef', amount) then 
        print('couldnt remove item',amount)
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['raw_beef'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['cow_processing'])
    local amount = Config.CowMeat
    Wait(750)
    Player.Functions.AddItem('beef', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['beef'], "add")
end)

RegisterServerEvent('denalifw-simplefarming:getcowbucket', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    Player.Functions.AddItem('emptycowbucket', 1)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['emptycowbucket'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Grabbed A Bucket")
end)

RegisterServerEvent('denalifw-simplefarming:diarymilk', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local milkbucket = Player.Functions.GetItemByName('milkbucket')
    if not milkbucket then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_milkprocessor'])
        return false 
    end

    local amount = milkbucket.amount
    if amount >= 1 then
        amount = Config.MilkProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('milkbucket', amount) then 
        print('couldnt remove item',amount)
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['milkbucket'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['milk_processing'])
    local amount = Config.Milk
    Wait(750)
    Player.Functions.AddItem('milk', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['milk'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['milk_trader'])
end)

------------------------------- Pumpkin Farming ----------------------------

RegisterServerEvent('denalifw-simplefarming:pumpkinpicking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local pumpkinfarming = 1
    Player.Functions.AddItem('rawpumpkin', pumpkinfarming)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['rawpumpkin'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Picked up " ..pumpkinfarming.. " Pumpkin")
end)

RegisterServerEvent('denalifw-simplefarming:pumpkinprocessing', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local pumpkin = Player.Functions.GetItemByName('rawpumpkin')
    if not pumpkin then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_milkprocessor'])
        return false 
    end

    local amount = pumpkin.amount
    if amount >= 1 then
        amount = Config.PumpkinProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('rawpumpkin', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['rawpumpkin'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['pumpkin_processing'])
    local amount = Config.PumpkinBoxes
    Wait(750)
    Player.Functions.AddItem('pumpkinpiebox', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['pumpkinpiebox'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['pumpkin_trader'])
end)

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:pumpkincheck', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("rawpumpkin") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

------------------------------- Corn Farming ----------------------------

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:corncheck', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("corncob") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('denalifw-simplefarming:cornpicking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local cornfarming = math.random(1,3)
    Player.Functions.AddItem('corncob', cornfarming)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['corncob'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Grabbed " ..cornfarming.. " Corn Cobs")
end)

RegisterServerEvent('denalifw-simplefarming:cornprocessing', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local corn = Player.Functions.GetItemByName('corncob')
    if not corn then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_corncob'])
        return false 
    end

    local amount = corn.amount
    if amount >= 1 then
        amount = Config.CornProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('corncob', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['corncob'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['corn_processing'])
    local amount = Config.CornProcessed
    Wait(750)
    Player.Functions.AddItem('canofcorn', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['canofcorn'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['corn_processed'])
end)



------------------------------- Garden ----------------------------

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:grapecheck', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("grapes") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


DenaliFW.Functions.CreateCallback('denalifw-simplefarming:greenpeppercheck', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("greenpepper") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


DenaliFW.Functions.CreateCallback('denalifw-simplefarming:chillycheck', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("chillypepper") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)


DenaliFW.Functions.CreateCallback('denalifw-simplefarming:tomatoescheck', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("tomato") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('denalifw-simplefarming:grapepicking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local grapepicking = math.random(1,2)
    Player.Functions.AddItem('grapes', grapepicking)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['grapes'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Grabbed " ..grapepicking.. " Grapes")
end)

RegisterServerEvent('denalifw-simplefarming:grapeprocessing', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local grapes = Player.Functions.GetItemByName('grapes')
    if not grapes then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_grape'])
        return false 
    end

    local amount = grapes.amount
    if amount >= 1 then
        amount = Config.GrapeProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('grapes', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['grapes'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['grape_processing'])
    local amount = Config.GrapeProcessed
    Wait(750)
    Player.Functions.AddItem('grapejuice', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['grapejuice'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['grape_processed'])
end)

-- Green Peppers

RegisterServerEvent('denalifw-simplefarming:gpepperpicking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local gpepperpicking = math.random(1,3)
    Player.Functions.AddItem('greenpepper', gpepperpicking)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['greenpepper'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Grabbed " ..gpepperpicking.. " Green Peppers")
end)

-- Chilly Peppers

RegisterServerEvent('denalifw-simplefarming:chypepperpicking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local chypepperpicking = math.random(1,3)
    Player.Functions.AddItem('chillypepper', chypepperpicking)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['chillypepper'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Grabbed " ..chypepperpicking.. " Chilly Peppers")
end)

RegisterServerEvent('denalifw-simplefarming:makinghotsauce', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local pepper = Player.Functions.GetItemByName('chillypepper')
    if not pepper then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_chilly'])
        return false 
    end

    local amount = pepper.amount
    if amount >= 1 then
        amount = Config.ChillyProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('chillypepper', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['chillypepper'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['chilly_processing'])
    local amount = Config.ChillyProcessed
    Wait(750)
    Player.Functions.AddItem('hotsauce', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['hotsauce'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['chilly_processed'])
end)

-- Tomatoes

RegisterServerEvent('denalifw-simplefarming:tomatoespicking', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local tompicking = math.random(1,3)
    Player.Functions.AddItem('tomato', tompicking)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['tomato'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "Grabbed " ..tompicking.. " Red Tomatoes")
end)

RegisterServerEvent('denalifw-simplefarming:tomatoesprocessing', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local tom = Player.Functions.GetItemByName('tomato')
    if not tom then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_tomatoes'])
        return false
    end

    local amount = tom.amount
    if amount >= 1 then
        amount = Config.TomatoesProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('tomato', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['tomato'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['tomatoes_processing'])
    local amount = Config.TomatoesProcessed
    Wait(750)
    Player.Functions.AddItem('tomatoepaste', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['tomatoepaste'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['tomatoes_processed'])
end)

-- Pig

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:rawbacon', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_bacon") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:rawham', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_ham") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:rawpork', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_pork") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

DenaliFW.Functions.CreateCallback('denalifw-simplefarming:rawsausage', function(source, cb)
    local Player = DenaliFW.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName("raw_sausage") ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)

RegisterServerEvent('denalifw-simplefarming:baconprocessed', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local bacon = Player.Functions.GetItemByName('raw_bacon')
    if not bacon then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_bacon'])
        return false
    end

    local amount = bacon.amount
    if amount >= 1 then
        amount = Config.BaconProcesing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('raw_bacon', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['raw_bacon'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['bacon_processing'])
    local amount = Config.BaconProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_bacon', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['cooked_bacon'], "add")
end)

RegisterServerEvent('denalifw-simplefarming:hamprocessed', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local ham = Player.Functions.GetItemByName('raw_ham')
    if not ham then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_ham'])
        return false
    end

    local amount = ham.amount
    if amount >= 1 then
        amount = Config.HamProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('raw_ham', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['raw_ham'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['ham_processing'])
    local amount = Config.HamProcessing
    Wait(750)
    Player.Functions.AddItem('cooked_ham', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['cooked_ham'], "add")
end)

RegisterServerEvent('denalifw-simplefarming:porkprocessed', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local pork = Player.Functions.GetItemByName('raw_pork')
    if not pork then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_pork'])
        return false
    end

    local amount = pork.amount
    if amount >= 1 then
        amount = Config.PorkProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('raw_pork', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['raw_pork'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['pork_cooking'])
    local amount = Config.PorkProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_pork', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['cooked_pork'], "add")
end)

RegisterServerEvent('denalifw-simplefarming:sausageprocessed', function()
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(tonumber(source))
    local sausage = Player.Functions.GetItemByName('raw_sausage')
    if not sausage then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['error_sausage'])
        return false
    end

    local amount = sausage.amount
    if amount >= 1 then
        amount = Config.SausageProcessing
    else
      return false
    end
    
    if not Player.Functions.RemoveItem('raw_sausage', amount) then 
        TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['itemamount'])
        return false 
    end

    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['raw_sausage'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, Config.Alerts['sausage_processing'])
    local amount = Config.SausageProcessed
    Wait(750)
    Player.Functions.AddItem('cooked_sausage', amount)
    TriggerClientEvent('inventory:client:ItemBox', source, DenaliFW.Shared.Items['cooked_sausage'], "add")
end)

RegisterServerEvent('denalifw-simplefarming:pigfood', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local price = Config.FoodPrice
    local pigfoodamount = Config.PigFood
    Player.Functions.RemoveMoney("cash", price)
    TriggerClientEvent('DenaliFW:Notify', source, "Bought pig food for $" ..price.. " Enjoy!")
    Player.Functions.AddItem('soybeans', pigfoodamount)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['soybeans'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "The farmer gave you " ..pigfoodamount.. " of Soy Beans", "success")
end)

RegisterNetEvent('denalifw-simplefarming:feedingpiglit', function()
    local feedpigamount = math.random(3,6)
    local Player = DenaliFW.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('soybeans', feedpigamount)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['soybeans'], "remove")
    TriggerClientEvent('DenaliFW:Notify', source, "You feed the pig " ..feedpigamount.. " handfulls of soybeans", "success")
end)

RegisterNetEvent('denalifw-simplefarming:slayreward', function()
    local Player = DenaliFW.Functions.GetPlayer(source)
    local rawbacon = math.random(1, 6)
    local rawham = math.random(1, 4)
    local rawpork = math.random(2, 3)
    local rawsausage = math.random(1, 10)
    Player.Functions.AddItem('raw_bacon', rawbacon)
    Player.Functions.AddItem('raw_ham', rawham)
    Player.Functions.AddItem('raw_pork', rawpork)
    Player.Functions.AddItem('raw_sausage', rawsausage)
    Player.Functions.AddItem('pig_leather', 1)
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['raw_bacon'], "add")
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['raw_ham'], "add")
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['raw_pork'], "add")
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['raw_sausage'], "add")
    TriggerClientEvent("denalifw-inventory:client:ItemBox", source, DenaliFW.Shared.Items['pig_leather'], "add")
    TriggerClientEvent('DenaliFW:Notify', source, "You gathered " ..rawbacon.. " raw bacon " ..rawham.. " raw ham " ..rawpork.. " raw pork " ..rawsausage.. " raw sausage with some leather")
end)

--- Useable Items

DenaliFW.Functions.CreateUseableItem("apple", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("apple_juice", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("beef", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("milk", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("slicedpie", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("corncob", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("canofcorn", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("grapes", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("grapejuice", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("greenpepper", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("chillypepper", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("hotsauce", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("tomato", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("tomatoepaste", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cooked_bacon", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cooked_sausage", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cooked_pork", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cooked_ham", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	  if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
