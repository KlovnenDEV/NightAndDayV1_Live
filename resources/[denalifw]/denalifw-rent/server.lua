local DenaliFW = exports['denalifw-core']:GetCoreObject()

--- take money for bank or cash form player 
RegisterServerEvent('rental:TakeDeposit')
AddEventHandler('rental:TakeDeposit', function()
	local _source = source
	local Player = DenaliFW.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney("bank", 500,_source, "rent-deposit")
    TriggerClientEvent("DenaliFW:Notify", _source, "You were charged $500 for day rental")
end)
--- give money to player to cash or bank
RegisterServerEvent('rental:ReturnDeposit')
AddEventHandler('rental:ReturnDeposit', function(info)
	local _source = source
    local Player = DenaliFW.Functions.GetPlayer(_source)
        Player.Functions.AddMoney("bank", 500, "return-vehicle")
        TriggerClientEvent("DenaliFW:Notify", _source, "Thank you", "success")
end)