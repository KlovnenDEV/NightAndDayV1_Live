    local DenaliFW = exports['denalifw-core']:GetCoreObject()
----------- / alcohol

DenaliFW.Functions.CreateUseableItem("vodka", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

DenaliFW.Functions.CreateUseableItem("beer", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

DenaliFW.Functions.CreateUseableItem("whiskey", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

DenaliFW.Functions.CreateUseableItem("skateboard", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

DenaliFW.Functions.CreateUseableItem("snowboard", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

DenaliFW.Functions.CreateUseableItem("sled", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

DenaliFW.Functions.CreateUseableItem("wheelchair", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:wheelchair", src, item.name)
end)

DenaliFW.Functions.CreateUseableItem("windsurf", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
end)

----------- / Eat

DenaliFW.Functions.CreateUseableItem("sandwich", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("twerks_candy", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("snikkel_candy", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("tosti", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("dinner", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eatdin", src, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("dinner2", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eatdin2", src, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("dinner3", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eatdin3", src, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("dinner4", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eatdin4", src, item.name)
    end
end)

----------- / Drink

DenaliFW.Functions.CreateUseableItem("water_bottle", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("coffee", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("kurkakola", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

----------- / Drug

DenaliFW.Functions.CreateUseableItem("joint", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint", src)
    end
end)

DenaliFW.Functions.CreateUseableItem("cokebaggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:Cokebaggy", src)
end)

DenaliFW.Functions.CreateUseableItem("crack_baggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:Crackbaggy", src)
end)

DenaliFW.Functions.CreateUseableItem("xtcbaggy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:EcstasyBaggy", src)
end)

DenaliFW.Functions.CreateUseableItem("oxy", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Oxy", source)
    end
end)

DenaliFW.Functions.CreateUseableItem("meth", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:meth", src)
end)

----------- / Tools

DenaliFW.Functions.CreateUseableItem("armor", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:UseArmor", src)
end)

DenaliFW.Functions.CreateUseableItem("heavyarmor", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:UseHeavyArmor", src)
end)

DenaliFW.Commands.Add("resetarmor", "Resets Vest (Police Only)", {}, false, function(source, args)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("consumables:client:ResetArmor", src)
    else
        TriggerClientEvent('DenaliFW:Notify', src,  "For Police Officer Only", "error")
    end
end)

DenaliFW.Functions.CreateUseableItem("binoculars", function(source, item)
    local src = source
    TriggerClientEvent("binoculars:Toggle", src)
end)

DenaliFW.Functions.CreateUseableItem("parachute", function(source, item)
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseParachute", src)
    end
end)

DenaliFW.Commands.Add("resetparachute", "Resets Parachute", {}, false, function(source, args)
    local src = source
	TriggerClientEvent("consumables:client:ResetParachute", src)
end)

RegisterNetEvent('qb-smallpenis:server:AddParachute', function()
    local src = source
    local Player = DenaliFW.Functions.GetPlayer(src)
    Player.Functions.AddItem("parachute", 1)
end)

----------- / Firework

DenaliFW.Functions.CreateUseableItem("firework1", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework")
end)

DenaliFW.Functions.CreateUseableItem("firework2", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework_v2")
end)

DenaliFW.Functions.CreateUseableItem("firework3", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_xmas_firework")
end)

DenaliFW.Functions.CreateUseableItem("firework4", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "scr_indep_fireworks")
end)

----------- / Lockpicking

DenaliFW.Functions.CreateUseableItem("lockpick", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

DenaliFW.Functions.CreateUseableItem("advancedlockpick", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)

----------- / Unused

-- DenaliFW.Functions.CreateUseableItem("smoketrailred", function(source, item)
--     local Player = DenaliFW.Functions.GetPlayer(source)
-- 	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
--         TriggerClientEvent("consumables:client:UseRedSmoke", source)
--     end
-- end)

--Drinks
DenaliFW.Functions.CreateUseableItem("burger-softdrink", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drinkc", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("burger-mshake", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

--Food
DenaliFW.Functions.CreateUseableItem("burger-bleeder", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("burger-moneyshot", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("burger-torpedo", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("burger-heartstopper", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("burger-meatfree", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("burger-fries", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("champagne", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("champagne-glass", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("glass-of-beer", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("glass-of-whiskey", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("glass-wine", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("logger-beer", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("martini", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("red-wine-bottle", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("tequila", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("tequila-shot", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("white-wine-bottle", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)  

DenaliFW.Functions.CreateUseableItem("loka", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cocacola", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("twix_candy", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("latte", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("burrito", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("coffeex", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("chicken-bucket", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("frappuccino", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("horchata", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("green-cow", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("milkshake", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("pina-colada", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("slushy", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cluckin-balls", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cluckin-fries", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cluckin-rings", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("cookie", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("crab-cakes", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("donut", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("eggs-and-bacon", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("enchiladas", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("filet-mignon", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("fishtaco", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("fowl-burger", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("french-toast", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("fries", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("fruit-tartlet", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("hamburger", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("hotdog", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("little-clucker", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("macn-cheese", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("meat-free", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("money-shot", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("muffin", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("onigiri", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("pancakes", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("panini-sandwich", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("pizza-slice", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
DenaliFW.Functions.CreateUseableItem("popcorn", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("pupusas", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("ramen", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("sandwichx", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("spaghetti", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("sushi-plate", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("sushi-rolls", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("taco", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("tacos-de-asada", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("the-bleeder", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("the-heart-stopper", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("torpedo", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("torta", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("veggy-salad", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("wings", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("snickers_candy", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)


DenaliFW.Functions.CreateUseableItem("snikkel_candy", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

DenaliFW.Functions.CreateUseableItem("tosti", function(source, item)
    local Player = DenaliFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
