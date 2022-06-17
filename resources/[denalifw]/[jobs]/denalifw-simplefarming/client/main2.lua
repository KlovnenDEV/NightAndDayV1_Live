local DenaliFW = exports['denalifw-core']:GetCoreObject()
local inZone = false




------------ Pumpkins --------------

CreateThread(function()
  for k, v in pairs(PumpkinField) do
    local PumpkinFarmingBlip = AddBlipForCoord(PumpkinField[k].BlipCoord)
        SetBlipSprite(PumpkinFarmingBlip, PumpkinField[k].Blip)
        SetBlipAsShortRange(PumpkinFarmingBlip, true)
        SetBlipScale(PumpkinFarmingBlip, 0.8)
        SetBlipColour(PumpkinFarmingBlip, PumpkinField[k].BlipColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(PumpkinField[k].label)
        EndTextCommandSetBlipName(PumpkinFarmingBlip)

      local PumpkinFarmingLocation = PolyZone:Create(PumpkinField[k].zones, {
          name = PumpkinField[k].label,
          minZ = PumpkinField[k].minz,
          maxZ = PumpkinField[k].maxz,
          debugPoly = false
      })

      PumpkinFarmingLocation:onPlayerInOut(function(isPointInside)
          if isPointInside then
            inZone = true
            TriggerEvent('denalifw-simplefarming:pumpkin')
          else
            for k, v in pairs(PumpkinFarming1) do 
              exports['denalifw-target']:RemoveZone(v.Name)
              inZone = false
            end
          end
      end)
  end
end)


RegisterNetEvent('denalifw-simplefarming:pumpkinfarming', function()
  local playerPed = PlayerPedId()
  local coords = GetEntityCoords(playerPed)
  TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
  DenaliFW.Functions.Progressbar("picking_pumpkins", Config.Alerts['picking_pumpkins'], 3000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
      disableInventory = true,
  }, {}, {}, {}, function()
      ClearPedTasks(PlayerPedId())
      RequestAnimDict("anim@heists@box_carry@")
      Citizen.Wait(100)
      pumpkinprop = CreateObject(GetHashKey("prop_veg_crop_03_pump"), 0, 0, 0, true, true, true)        
      AttachEntityToEntity(pumpkinprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.12, 0, 0.30, -145.0, 100.0, 0.0, true, true, false, true, 1, true)
      TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 2.0, 2.0, 2500, 51, 0, false, false, false)
      Citizen.Wait(3500)
      DetachEntity(pumpkinprop, 1, true)
      DeleteEntity(pumpkinprop)
      DeleteObject(pumpkinprop)
      TriggerServerEvent('denalifw-simplefarming:pumpkinpicking')
  end, function() 
      ClearPedTasks(PlayerPedId())
      DenaliFW.Functions.Notify(Config.Alerts['cancel'], "error")
  end)
end)

RegisterNetEvent('denalifw-simplefarming:pumpkinpie', function()
    DenaliFW.Functions.TriggerCallback('denalifw-simplefarming:pumpkincheck', function(pumpkin)
      if pumpkin then
        TriggerEvent('animations:client:EmoteCommandStart', {"Clipboard"})
        DenaliFW.Functions.Progressbar('diary_processing', Config.Alerts['pumpkin_processingbar'], Config.ProcessingTime['pumpkin_smashingtime'] , false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {}, {}, {}, function()    
          TriggerEvent('animations:client:EmoteCommandStart', {"c"})
          TriggerServerEvent("denalifw-simplefarming:pumpkinprocessing")
      end, function() 
        DenaliFW.Functions.Notify(Config.Alerts['cancel'], "error")
      end)
    elseif not pumpkin then
            DenaliFW.Functions.Notify(Config.Alerts['error_pumpkinsmashing'], "error", 3000)
      end
  end)
end)

RegisterNetEvent('denalifw-simplefarming:pumpkin', function()
  for k, v in pairs(PumpkinFarming1) do 
    exports['denalifw-target']:AddBoxZone(v.Name, vector3(v.Coords.x, v.Coords.y, v.Coords.z), v.length, v.width, {
      name=v.Name,
      heading= v.heading,
      debugPoly=false,
      minZ = v.minZ,
      maxZ = v.maxZ,
    },{
      options = {
              {
                type = "client",
                event = "denalifw-simplefarming:pumpkinfarming",
                icon = "fa fa-sign-language",  
                label = "Pick Pumpkin",
              },
           },
      distance = v.distance,
    }) 
  end
end)

-- Corn --



RegisterNetEvent('denalifw-simplefarming:menuprocessor', function(data)
  local Processor = {
    {
      header = "Farming Processor",
      isMenuHeader = true,
    },
    {
        header = '< Go Back',
    },
    
    {
        header = 'Make Pumpkin Pies',
        params = {
            event = 'denalifw-simplefarming:pumpkinpie',
        }
    },
    
}
exports['denalifw-menu']:openMenu(Processor)
end)
