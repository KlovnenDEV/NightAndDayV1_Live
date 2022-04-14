
local DenaliFW = exports['denalifw-core']:GetCoreObject()

local Blipy = {}
local JuzBlip = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not JuzBlip then
            Blipy['car'] = AddBlipForCoord(-1623.19, -3115.72, 12.94)
            SetBlipSprite(Blipy['car'], 488)
            SetBlipDisplay(Blipy['car'], 4)
            SetBlipScale(Blipy['car'], 0.8)
            SetBlipAsShortRange(Blipy['car'], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('rental')
            EndTextCommandSetBlipName(Blipy['car'])
						JuzBlip = true
        end
    end
end)

Citizen.CreateThread(function()
    SpawnNPC()
end)
----------------------------------

SpawnNPC = function()
    Citizen.CreateThread(function()
        RequestModel(GetHashKey('a_m_m_mexlabor_01'))
        while not HasModelLoaded(GetHashKey('a_m_m_mexlabor_01')) do
            Wait(1)
        end
        CreateNPC()
    end)
end

CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('a_m_m_mexlabor_01') ,-1623.19, -3115.72, 12.94, 85.16, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end


RegisterNetEvent('MenuRental')
AddEventHandler('MenuRental', function(car)
    exports['denalifw-menu']:openMenu({
        {
            header = "🚘 Day Rentals Non Refundable",
            isMenuHeader = true
        },
        {
            header = "< rent",
            txt = "Seaplane $500",
            params = {
                event = "SpawnCar",
                args = {
                    vehicle = "dodo",
                }
            }
        },
        {
            header = "< rent",
            txt = "Private Heli $500",
            params = {
                event = "SpawnCar",
                args = {
                    vehicle = "supervolito",
                }
            }
        },
        {
            header = "< rent",
            txt = "MicroLight $500",
            params = {
                event = "SpawnCar",
                args = {
                    vehicle = "microlight",
                }
            }
        },
        {
            header = "< rent",
            txt = "Sea Sparrow $500",
            params = {
                event = "SpawnCar",
                args = {
                    vehicle = "seasparrow",
                }
            }
        },      
        {
            header = "< rent",
            txt = "Private Jet $500",
            params = {
                event = "SpawnCar",
                args = {
                    vehicle = "luxor",
                }
            }
        },    {
            header = "< Return",
            txt = "Return Vehicle",
            params = {
                event = "DeleteCar",
            }
        },
    })
end)

RegisterNetEvent('DeleteCar')
AddEventHandler('DeleteCar', function()
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    DeleteVehicle(car)
    DeleteEntity(car)
    TriggerEvent('animations:client:EmoteCommandStart', {"keyfob"})
    TriggerServerEvent('faaflight3', exports['cd_dispatch']:GetPlayerInfo())
end)

RegisterNetEvent('SpawnCar')
AddEventHandler('SpawnCar', function(car, data)
    TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
    DenaliFW.Functions.Progressbar('SpawnCar', 'geting ready...', 6000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        TriggerServerEvent('rental:TakeDeposit')
    }, {}, {}, function() -- Play When Done
        local vehicle = car.vehicle
        local coords = { ['x'] = -1644.18, ['y'] = -3103.74, ['z'] = 13.94, ['h'] = 328.02 }
        DenaliFW.Functions.SpawnVehicle(car.vehicle, function(veh)
            SetVehicleNumberPlateText(veh, "rental"..tostring(math.random(1000, 9999)))
            SetEntityHeading(veh, coords.h)
            exports['LegacyFuel']:SetFuel(veh, 80.0)
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
            plaquevehicule = GetVehicleNumberPlateText(veh)
            TriggerEvent('denalifw-radialmenu:client:enter:radio11')
            TriggerServerEvent('faaflight', exports['cd_dispatch']:GetPlayerInfo())
        end, coords, true)
       TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        IsDrilling = false
    end, function() -- Play When Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("rental:ReturnDeposit")
    end)
end)

CreateThread(function()
    exports['denalifw-target']:AddBoxZone("24", vector3(-1623.19, -3115.72, 13.94), 0.55, 0.35,  {
      name = "23",
      heading = 0,
      debugPoly = false,
      minZ=13.94,
      maxZ=14.94,
    }, {
      options = {
        {
          type = "client",
          event = "MenuRental",
          icon = 'fas fa-clipboard',
          label = 'rental board',
        }
      },
      distance = 2.5,
    })
  end)

