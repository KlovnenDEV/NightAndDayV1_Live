local inCasino              = false
local videoWallRenderTarget = nil
local showBigWin            = false
local spinningObject = nil
local spinningCar = nil
local carOnShow = `demon`
--
-- Threads
--



function startCasinoThreads()
    RequestStreamedTextureDict('Prop_Screen_Vinewood')
    while not HasStreamedTextureDictLoaded('Prop_Screen_Vinewood') do
        Citizen.Wait(100)
    end
    RegisterNamedRendertarget('casinoscreen_01')
    LinkNamedRendertarget(`vw_vwint01_video_overlay`)
    videoWallRenderTarget = GetNamedRendertargetRenderId('casinoscreen_01')
    Citizen.CreateThread(function()
        local lastUpdatedTvChannel = 0
        while true do
            Citizen.Wait(0)

            if not inCasino then
                ReleaseNamedRendertarget('casinoscreen_01')

                videoWallRenderTarget = nil
                showBigWin            = false

                break
            end
            if videoWallRenderTarget then
                local currentTime = GetGameTimer()
                if showBigWin then
                    setVideoWallTvChannelWin()
                    lastUpdatedTvChannel = GetGameTimer() - 33666
                    showBigWin           = false
                else
                    if (currentTime - lastUpdatedTvChannel) >= 42666 then
                        setVideoWallTvChannel()
                        lastUpdatedTvChannel = currentTime
                    end
                end
                SetTextRenderId(videoWallRenderTarget)
                SetScriptGfxDrawOrder(4)
                SetScriptGfxDrawBehindPausemenu(true)
                DrawInteractiveSprite('Prop_Screen_Vinewood', 'BG_Wall_Colour_4x4', 0.25, 0.5, 0.5, 1.0, 0.0, 255, 255, 255, 255)
                DrawTvChannel(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
                SetTextRenderId(GetDefaultScriptRendertargetRenderId())
            end
        end
    end)
end
-- WALLS
-- CASINO_DIA_PL    - Falling Diamonds
-- CASINO_HLW_PL    - Falling Skulls
-- CASINO_SNWFLK_PL - Falling Snowflakes
-- CASINO_WIN_PL    - Falling Confetti

function setVideoWallTvChannel()
    SetTvChannelPlaylist(0, 'CASINO_DIA_PL', true)
    SetTvAudioFrontend(true)
    SetTvVolume(-100.0)
    SetTvChannel(0)
end

function setVideoWallTvChannelWin()
    SetTvChannelPlaylist(0, 'CASINO_WIN_PL', true)
    SetTvAudioFrontend(true)
    SetTvVolume(-100.0)
    SetTvChannel(-1)
    SetTvChannel(0)
end

--
-- Events
--

AddEventHandler("chCasinoWall:enteredCasino", function()
    inCasino = true
    startCasinoThreads()
    playSomeBackgroundAudioBaby()
    spinMeRightRoundBaby()
end)

AddEventHandler("chCasinoWall:exitedCasino", function()
    inCasino = false
end)

RegisterNetEvent('chCasinoWall:bigWin')
AddEventHandler('chCasinoWall:bigWin', function()
    if not inCasino then
        return
    end

    showBigWin = true
end)


function enterCasino()
  InCasino = true
  TriggerEvent("chCasinoWall:enteredCasino") 
  print("Entered Casino area")
  
  TriggerServerEvent('gksphone:NewMail', {
		sender = "The Diamond Casino",
		subject = "Welcome!",
		message = "Welcome to The Diamond Casino, We are Open 24/7 & only accept Electronic Transactions",
		button = {}
	})
end

function exitCasino()
  TriggerEvent("chCasinoWall:exitedCasino")
  print("Exited Casino area")
  InCasino = false
  StopAudioScene("DLC_VW_Casino_General")
  Wait(5000)
  startCasinoThreads()
end

CreateThread(function()
  local casinoCoords = vector3(945.85, 41.58, -170.50)
  while true do
    local pCoords = GetEntityCoords(PlayerPedId())
        if #(pCoords - casinoCoords) < 250.0 then
            if not inCasino then
                enterCasino()
            end
        else
      if inCasino then
        exitCasino()
      end
    end
    Wait(1000)
  end
end)

function spinMeRightRoundBaby()
	Citizen.CreateThread(function()
	    while inCasino do
		if not spinningObject or spinningObject == 0 or not DoesEntityExist(spinningObject) then
		  spinningObject = GetClosestObjectOfType(935.432, 42.5611, 72.14, 10.0, -1561087446, 0, 0, 0)
		  drawCarForWins()
		end
		if spinningObject ~= nil and spinningObject ~= 0 then
		  local curHeading = GetEntityHeading(spinningObject)
		  local curHeadingCar = GetEntityHeading(spinningCar)
		  if curHeading >= 360 then
			curHeading = 0.0
			curHeadingCar = 0.0
		  elseif curHeading ~= curHeadingCar then
			curHeadingCar = curHeading
		  end
		  SetEntityHeading(spinningObject, curHeading + 0.075)
		  SetEntityHeading(spinningCar, curHeadingCar + 0.075)
		end
		Wait(0)
	  end
	  spinningObject = nil
	end)
end

function drawCarForWins()
	if DoesEntityExist(spinningCar) then
	  DeleteEntity(spinningCar)
	end
	RequestModel(carOnShow)
	while not HasModelLoaded(carOnShow) do
		Citizen.Wait(0)
	end
	SetModelAsNoLongerNeeded(carOnShow)
	spinningCar = CreateVehicle(carOnShow, 935.432, 42.5611, 72.14, 0.0, 0, 0)
	Wait(0)
	SetVehicleDirtLevel(spinningCar, 0.0)
	SetVehicleOnGroundProperly(spinningCar) 
	Wait(0)
	FreezeEntityPosition(spinningCar, 1)
end

function playSomeBackgroundAudioBaby()
	Citizen.CreateThread(function()
	  local function audioBanks()
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_GENERAL", false, -1) do
		  Citizen.Wait(0)
		end
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_01", false, -1) do
		  Citizen.Wait(0)
		end
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_02", false, -1) do
		  Citizen.Wait(0)
		end
		while not RequestScriptAudioBank("DLC_VINEWOOD/CASINO_SLOT_MACHINES_03", false, -1) do
		  Citizen.Wait(0)
		end
	  end
	  audioBanks()
	  while inCasino do
		if not IsStreamPlaying() and LoadStream("casino_walla", "DLC_VW_Casino_Interior_Sounds") then
		  PlayStreamFromPosition(945.85, 41.58, 75.82)
		end
		if IsStreamPlaying() and not IsAudioSceneActive("DLC_VW_Casino_General") then
		  StartAudioScene("DLC_VW_Casino_General")
		end
		Citizen.Wait(1000)
	  end
	  if IsStreamPlaying() then
		StopStream()
	  end
	  if IsAudioSceneActive("DLC_VW_Casino_General") then
		StopAudioScene("DLC_VW_Casino_General")
	  end
	end)
end

