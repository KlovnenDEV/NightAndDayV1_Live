Citizen.CreateThread(function() 
  if Config.TargetOption == "bt" then
      exports['bt-target']:AddBoxZone("ClearOnlineData", vector3(Config.LaptopPosition.x, Config.LaptopPosition.y, Config.LaptopPosition.z), 0.5, 0.6, { 
          name = "ClearOnlineData", 
          heading = Config.LaptopPosition.h, 
          debugPoly = Config.DebugPolyzones, 
          minZ = Config.LaptopPosition.z-1, 
          maxZ = Config.LaptopPosition.z+1, 
          }, {
          options = { 
            { 
              type = "client", 
              event = "denalifw-vinscratch:client:DataStuff", 
              icon = 'fas fa-cookie', 
              label = 'Clear Online Data', 
              job = {"all"}
            }
          },
          distance = 1.5,
      })
      exports['bt-target']:AddBoxZone("StartVinJob", vector3(Config.NathanielPosition.x, Config.NathanielPosition.y, Config.NathanielPosition.z), 0.8, 0.8, { 
        name = "StartVinJob", 
        heading = Config.NathanielPosition.w, 
        debugPoly = Config.DebugPolyzones, 
        minZ = Config.NathanielPosition.z-1, 
        maxZ = Config.NathanielPosition.z+1, 
        }, {
        options = { 
          { 
            type = "client", 
            event = "denalifw-vinscratch:StartMenu", 
            icon = 'fas fa-cookie', 
            label = 'Talk to Nathaniel', 
            job = {"all"}
          }
        },
        distance = 1.5,
    })
    exports['bt-target']:AddBoxZone("HandInVehicle", vector3(Config.TurnInLocation.x, Config.TurnInLocation.y, Config.TurnInLocation.z), 0.8, 0.8, { 
        name = "HandInVehicle", 
        heading = Config.TurnInLocation.w, 
        debugPoly = Config.DebugPolyzones, 
        minZ = Config.TurnInLocation.z-1, 
        maxZ = Config.TurnInLocation.z+1, 
        }, {
        options = { 
          { 
            type = "client", 
            event = "denalifw-vinscratch:GetMonitaryFromBoost", 
            icon = 'fas fa-cookie', 
            label = '???', 
            job = {"all"}
          }
        },
        distance = 1.5,
    })
  elseif Config.TargetOption == "qb" then 
        exports['denalifw-target']:AddBoxZone("ClearOnlineData", vector3(Config.LaptopPosition.x, Config.LaptopPosition.y, Config.LaptopPosition.z), 0.5, 0.6, { 
          name = "ClearOnlineData", 
          heading = Config.LaptopPosition.h, 
          debugPoly = Config.DebugPolyzones, 
          minZ = Config.LaptopPosition.z-1, 
          maxZ = Config.LaptopPosition.z+1, 
          }, {
          options = { 
            { 
              type = "client", 
              event = "denalifw-vinscratch:client:DataStuff", 
              icon = 'fas fa-cookie', 
              label = 'Clear Online Data', 
            }
          },
          distance = 1.5,
      })
      exports['denalifw-target']:SpawnPed({
        [321] = {
            model = 'csb_prologuedriver',
            coords = Config.NathanielPosition,
            minusOne = true,
            freeze = true,
            invincible = true,
            blockevents = true,
            scenario = 'WORLD_HUMAN_CLIPBOARD',
            target = {
              options = {
                {
                  type = "client",
                  event = "denalifw-vinscratch:StartMenu",
                  icon = 'fas fa-car',
                  label = 'Talk to Nathaniel',
                }
              },
              distance = 1.5,
            }
        }
        })
        exports['denalifw-target']:SpawnPed({
          [322] = {
              model = 'a_m_m_malibu_01',
              coords = Config.TurnInLocation,
              minusOne = true,
              freeze = true,
              invincible = true,
              blockevents = true,
              scenario = 'WORLD_HUMAN_CLIPBOARD',
              target = {
                options = {
                  {
                    type = "client",
                    event = "denalifw-vinscratch:GetMonitaryFromBoost",
                    icon = 'fas fa-cookie',
                    label = '???',
                  }
                },
                distance = 1.5,
              }
          }
          })
  elseif Config.TargetOption == "berkie" then 
    exports['berkie-target']:AddBoxZone("ClearOnlineData", vector3(Config.LaptopPosition.x, Config.LaptopPosition.y, Config.LaptopPosition.z), 0.5, 0.6, { 
      name = "ClearOnlineData", 
      heading = Config.LaptopPosition.h, 
      debugPoly = Config.DebugPolyzones, 
      minZ = Config.LaptopPosition.z-1, 
      maxZ = Config.LaptopPosition.z+1, 
      }, {
      options = { 
        { 
          type = "client", 
          event = "denalifw-vinscratch:client:DataStuff", 
          icon = 'fas fa-cookie', 
          label = 'Clear Online Data', 
        }
      },
      distance = 1.5,
  })
  exports['berkie-target']:SpawnPed({
    [321] = {
        model = 'csb_prologuedriver',
        coords = Config.NathanielPosition,
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        target = {
          options = {
            {
              type = "client",
              event = "denalifw-vinscratch:StartMenu",
              icon = 'fas fa-car',
              label = 'Talk to Nathaniel',
            }
          },
          distance = 1.5,
        }
    }
    })
    exports['berkie-target']:SpawnPed({
      [322] = {
          model = 'a_m_m_malibu_01',
          coords = Config.TurnInLocation,
          minusOne = true,
          freeze = true,
          invincible = true,
          blockevents = true,
          scenario = 'WORLD_HUMAN_CLIPBOARD',
          target = {
            options = {
              {
                type = "client",
                event = "denalifw-vinscratch:GetMonitaryFromBoost",
                icon = 'fas fa-cookie',
                label = '???',
              }
            },
            distance = 1.5,
          }
      }
      })
  end
end)



-- Mechanic or PD triggers for searching wether or not plate is scratched
RegisterNetEvent('denalifw-vinscratch:searchvinnum')
AddEventHandler('denalifw-vinscratch:searchvinnum', function()
  local ped = PlayerPedId()
  TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
  DenaliFW.Functions.Progressbar("denalifw-vinscratch:searching", "Searching for Vinnumber", 5000, false, false, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = true,
  }, {}, {}, {}, function()
    local vehicle = DenaliFW.Functions.GetClosestVehicle()
    local VinPlate = GetVehicleNumberPlateText(vehicle)
    TriggerServerEvent('denalifw-vinscratch:server:testVINS', VinPlate)
  end)
end)