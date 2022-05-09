local DenaliFW = exports['denalifw-core']:GetCoreObject()

if Config.ShowMapBlip then
Citizen.CreateThread(function ()
    blip = AddBlipForCoord(Config.NPCCoordX, Config.NPCCoordY, Config.NPCCoordZ)
    SetBlipSprite(blip, Config.MapBlipSprite)
    SetBlipDisplay(blip, Config.MapBlipBlipID)
    SetBlipColour(blip, Config.MapBlipColor)
    SetBlipScale(blip, Config.MapBlipScale)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.MapBlipText)
    EndTextCommandSetBlipName(blip)
end)
end

RegisterNetEvent('XSMoneyWash:OpenMenu')
AddEventHandler('XSMoneyWash:OpenMenu', function()
  OpenMenu()
end)

function  OpenMenu()

    
    exports["memorygame"]:thermiteminigame(Config.Hardness, 7, 7, 5,
    function() -- success
        print("success")
       TriggerEvent('XSMoneyWash:OpenMenu2')
        DenaliFW.Functions.Notify(Config.HackDoneTXT, "error", 5000)
        print(dialog.amount)
    end,
    function() -- failure
        print("failure")
        DenaliFW.Functions.Notify(Config.HackFailedTXT, "error", 5000)
    end)

end

RegisterNetEvent('XSMoneyWash:OpenMenu2')
AddEventHandler('XSMoneyWash:OpenMenu2', function()
    local dialog = exports['denalifw-input']:ShowInput({
        header = Config.InputText,
        submitText = "Accept",
        inputs = {
            {
                text = Config.InputText, -- text you want to be displayed as a place holder
                name = "amount", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
        },
            
    })
    TriggerServerEvent("XSMoneyWash:StartWash",dialog.amount)
    if dialog ~= nil then
        for k,v in pairs(dialog) do
            print(k .. " : " .. v)
        end
    end
    
end)




RegisterNetEvent('DenaliFW:Client:OnPlayerLoaded')
AddEventHandler('DenaliFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    Player = DenaliFW.Functions.GetPlayerData()
    SpawnPed()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    SpawnPed()
  end)


function SpawnPed()

    local hash = GetHashKey(Config.NPCNAME)
  
    if not HasModelLoaded(hash) then
  
        RequestModel(hash)
  
        Wait(10)
  
    end
  
    while not HasModelLoaded(hash) do 
  
        Wait(10)
  
    end
  
  
  
    npc = CreatePed(5, hash, Config.NPCCoordX, Config.NPCCoordY, Config.NPCCoordZ-0.975, Config.NPCCoordHeading, false, false)
  
    FreezeEntityPosition(npc, true)
  
    SetEntityInvincible(npc, true)
  
    SetBlockingOfNonTemporaryEvents(npc, true)
  
    while not TaskStartScenarioInPlace(npc,Config.NPCANIMATION, 0, false) do
  
        Wait(20000)
  
    end
  
  end
  
  exports['denalifw-target']:AddTargetModel(Config.NPCNAME, {
      options = {
          {
              event = "XSMoneyWash:OpenMenu",
              icon = Config.EyeIcon,
              label = Config.EyeText
          },
      },
      distance = 1.5,
  })
  
  
  