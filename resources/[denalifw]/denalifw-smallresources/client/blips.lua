local blips = {
    -- chimical
    --{title="LSC", colour=38, id=488, x=-305.4, y=-120.66, z=39.01},
    --{title="Bennys", colour=38, id=488, x=-205.98, y=-1333.9, z=34.89},
    --{title="Route-68", colour=38, id=488, x=1187.85, y=2645.35, z=37.36},
    {title="House robbery", colour=38, id=488, x=1510.11, y=6326.3, z=24.61},
    {title="City Hall", colour=0, id=419, x=-534.33, y=-222.14, z=37.65},
    {title="Court House", colour=0, id=419, x=237.24, y=-406.66, z=47.92},
    {title="Split-Sides Comedy Club", colour=38, id=362, x=-447.07, y=267.64, z= 83.02},
    {title="Weed Mission", colour=25, id=496, x=114.11, y=-1961.07, z= 21.33},
    --{title="AutoCare", colour=5, id=431, x = 500.03, y = -522.89, z = 24.88},
    --Oxy Runs 563.76,2753.27
    --{title="Drift Track", colour=2, id=38, x=227.45, y=-3133.64, z=5.2},
    --{title="Gold Sales", colour=5, id=431, x=-1459.3, y = -413.6, z = 35.74},
    --{title="Criminal Doctor", colour=5, id=57,x =2440.28, y = 4967.9, z = 46.81, h =383.28}, 
    --{title="Crafting Station", colour = 0, id=618, x = 1442.99, y = 6332.131, z = 23.982 },

    --{title="Cannabis Field", id=496, x = 2215.359, y = 5575.139, z = 53.68, colour = 25},
    --{title="Cannabis Processing", id=501, x = 2328.92, y = 2571.35, z = 46.387, colour = 25},
    --{title="Cocaine Missions", id=423, x = 2122.200439, y = 4784.79199, z = 40.97, colour = 1},
    --{title="Cocaine Brick Processing", id=501, x = 2431.57, y = 4971.2, z = 42.35, colour = 1},
    --{title="Hydrochloric Acid Depot", id=361, x = 1373.8, y = 3624.767, z = 34.885, colour = 7},
    --{title="Court House", id=58, x = -544.9, y = -204.83, z = 38.12, colour = 5},
    --{title="Fire Department", id=635, x = -645.79, y = -110.84, z = 37.9, colour = 1},
    --{title="Fishing Spot", id=317, x = -2991.0, y = 2600.0, z = 0.0, colour = 3},
    --{title="Forklift Job", id=478, x = 147.83, y = -3100.76, z = 5.9, colour = 28},
   -- {title="Forklift Job", id=478, x = 151.64, y = -3211.649, z = 5.9, colour = 28},
    {title="Pet Shop", id=267, x = 563.63, y = 2752.71, z = 43.87, colour = 38},

   vector3(563.63, 2752.71, 43.87)
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)

    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.8)
    SetBlipColour(info.blip, info.colour)

    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)

    RadiusBlip = AddBlipForRadius(info.x, info.y, info.z, 100.0)
    SetBlipRotation(RadiusBlip, 0)
    SetBlipAlpha(RadiusBlip, 0)
    SetBlipColour(RadiusBlip, 1)
  end
end)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
	end
end)


