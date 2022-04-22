DenaliFW = exports['denalifw-core']:GetCoreObject()

-- Subscribed events
RegisterServerEvent("fd-pets:server:recallPet", function()
    TriggerClientEvent("fddenalifw-pets:client:endThread", source)
end)

RegisterServerEvent("fd-pets:server:entityDead", function()
    TriggerClientEvent("fddenalifw-pets:client:endThread", source)
end)

------- Useables
-- Rottweiler
DenaliFW.Functions.CreateUseableItem("rottweiler1", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("rottweiler2", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

DenaliFW.Functions.CreateUseableItem("rottweiler3", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Cats
DenaliFW.Functions.CreateUseableItem("cat1", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("cat2", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("cat3", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Chicken
DenaliFW.Functions.CreateUseableItem("chicken", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Husky
DenaliFW.Functions.CreateUseableItem("husky1", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("husky2", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("husky3", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Mountain Lion
DenaliFW.Functions.CreateUseableItem("mtlion1", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Panther
DenaliFW.Functions.CreateUseableItem("panther", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Poodle
DenaliFW.Functions.CreateUseableItem("poodle", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Shepherd
DenaliFW.Functions.CreateUseableItem("shepherd1", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Pug
DenaliFW.Functions.CreateUseableItem("pug1", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("pug2", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("pug3", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("pug4", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Retriever
DenaliFW.Functions.CreateUseableItem("retriever1", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("retriever2", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("retriever3", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("retriever4", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)

-- Westy
DenaliFW.Functions.CreateUseableItem("westy1", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("westy2", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
DenaliFW.Functions.CreateUseableItem("westy3", function(source, item)
    TriggerClientEvent("fd-pets:actions:spawnpet", source, item.name)
end)
