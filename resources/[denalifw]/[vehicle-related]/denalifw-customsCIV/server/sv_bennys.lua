local DenaliFW = exports['denalifw-core']:GetCoreObject()

local chicken = vehicleBaseRepairCost

RegisterNetEvent('denalifw-customsCIV:attemptPurchase', function(type, upgradeLevel)
    local source = source
    local Player = DenaliFW.Functions.GetPlayer(source)
    local balance = nil
    if Player.PlayerData.job.name == "mechanic" then
        balance = exports['denalifw-bossmenu']:GetAccount(Player.PlayerData.job.name)
    else
        balance = Player.Functions.GetMoney(moneyType)
    end
    if type == "repair" then
        if balance >= chicken then
            if Player.PlayerData.job.name == "mechanic" or Player.PlayerData.job.name == "mechanic3" or Player.PlayerData.job.name == "mechanic2" or Player.PlayerData.job.name == "mechanic5" or Player.PlayerData.job.name == "mechanic4" then
                TriggerEvent('denalifw-bossmenu:server:removeAccountMoney', Player.PlayerData.job.name, chicken)
            else
                Player.Functions.RemoveMoney(moneyType, chicken, "bennys")
            end
            TriggerClientEvent('denalifw-customsCIV:purchaseSuccessful', source)
        else
            TriggerClientEvent('denalifw-customsCIV:purchaseFailed', source)
        end
    elseif type == "performance" then
        if balance >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('denalifw-customsCIV:purchaseSuccessful', source)
            if Player.PlayerData.job.name == "mechanic" or Player.PlayerData.job.name == "mechanic3" or Player.PlayerData.job.name == "mechanic2" or Player.PlayerData.job.name == "mechanic5" or Player.PlayerData.job.name == "mechanic4" then
                TriggerEvent('denalifw-bossmenu:server:removeAccountMoney', Player.PlayerData.job.name,
                    vehicleCustomisationPrices[type].prices[upgradeLevel])
            else
                Player.Functions.RemoveMoney(moneyType, vehicleCustomisationPrices[type].prices[upgradeLevel], "bennys")
            end
        else
            TriggerClientEvent('denalifw-customsCIV:purchaseFailed', source)
        end
    else
        if balance >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('denalifw-customsCIV:purchaseSuccessful', source)
            if Player.PlayerData.job.name == "mechanic" or Player.PlayerData.job.name == "mechanic3" or Player.PlayerData.job.name == "mechanic2" or Player.PlayerData.job.name == "mechanic5" or Player.PlayerData.job.name == "mechanic4" then
                TriggerEvent('denalifw-bossmenu:server:removeAccountMoney', Player.PlayerData.job.name,
                    vehicleCustomisationPrices[type].price)
            else
                Player.Functions.RemoveMoney(moneyType, vehicleCustomisationPrices[type].price, "bennys")
            end
        else
            TriggerClientEvent('denalifw-customsCIV:purchaseFailed', source)
        end
    end
end)

RegisterNetEvent('denalifw-customsCIV:updateRepairCost', function(cost)
    chicken = cost
end)

RegisterNetEvent("updateVehicle", function(myCar)
    local src = source
    if IsVehicleOwned(myCar.plate) then
        exports.oxmysql:execute('UPDATE player_vehicles SET mods = ? WHERE plate = ?', {json.encode(myCar), myCar.plate})
    end
end)

function IsVehicleOwned(plate)
    local retval = false
    local result = exports.oxmysql:scalarSync('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        retval = true
    end
    return retval
end