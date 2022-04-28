local DenaliFW = exports['denalifw-core']:GetCoreObject()

--Events

RegisterNetEvent('denalifw-realestate:server:changetier', function(tier, name, isOwned)
    local src = source
    if isOwned then
        TriggerClientEvent('DenaliFW:Notify', src, "This house is owned by somebody. Tier cannot be changed")
    else 
        exports.oxmysql:execute('UPDATE houselocations SET tier = ? WHERE name = ?', {tier, name})
        TriggerClientEvent('DenaliFW:Notify', src, "Tier updated to: " ..tier)
        Wait(200)
        TriggerEvent('denalifw-houses:server:updateTier', tier)
          
    end 
end)

RegisterNetEvent('denalifw-realestate:server:changeprice', function(price, name, isOwned)
    local src = source
    if isOwned then
        TriggerClientEvent('DenaliFW:Notify', src, "This house is already bought. Why would you change price?")
    else 
        exports.oxmysql:execute('UPDATE houselocations SET price = ? WHERE name = ?', {price, name})
        TriggerClientEvent('DenaliFW:Notify', src, "Price updated to: " ..price)
        TriggerEvent('denalifw-houses:server:updatePrice', price)
        
    end 
end)

-- Callbacks

DenaliFW.Functions.CreateCallback("denalifw-realestate:server:GetHouses", function(source, cb)
    exports.oxmysql:execute('SELECT * FROM houselocations' , {}, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)