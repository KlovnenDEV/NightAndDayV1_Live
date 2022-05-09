Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.EnableProne = false
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- carwash
Config.DirtLevel = 0.1 --carwash dirt level

ConsumeablesEat = {
    ["burger-bleeder"] = math.random(35, 54),
    ["burger-moneyshot"] = math.random(35, 54),
    ["burger-torpedo"] = math.random(35, 54),
    ["burger-heartstopper"] = math.random(35, 54),
    ["burger-meatfree"] = math.random(35, 54),
    ["burger-fries"] = math.random(35, 54), 
    ["apple"] = math.random(10, 20),
    ["beef"] = math.random(35, 50),
    ["slicedpie"] = math.random(10, 20),
    ["corncob"] = math.random(25, 40),
    ["canofcorn"] = math.random(35, 50),
    ["grapes"] = math.random(10, 20),
    ["greenpepper"] = math.random(10, 20),
    ["chillypepper"] = math.random(10, 20),
    ["tomato"] = math.random(10, 20),
    ["tomatopaste"] = math.random(25, 40),
    ["cooked_bacon"] = math.random(35, 50),
    ["cooked_sausage"] = math.random(35, 50),
    ["cooked_pork"] = math.random(35, 50),
    ["cooked_ham"] = math.random(35, 50),  
    --Drinks
    ["sandwich"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["dinner"] = math.random(90, 200),
    ["snikkel_candy"] = math.random(40, 50),
    ["sandwich"] = math.random(35, 54),
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
 
    ["sandwichx"] = math.random(35, 54),	
    ["burrito"] = math.random(35, 54),
    ["chicken-bucket"] = math.random(42, 54),
    ["cluckin-balls"] = math.random(35, 54),
    ["cluckin-fries"] = math.random(35, 54),
    ["cluckin-rings"] = math.random(35, 54),
    ["crab-cakes"] = math.random(35, 54),
    ["cookie"] = math.random(35, 54),
    ["donut"] = math.random(35, 54),
    ["eggs-and-bacon"] = math.random(35, 54),
    ["enchiladas"] = math.random(35, 54),
    ["filet-mignon"] = math.random(35, 54),
    ["fishtaco"] = math.random(35, 54),
    ["fowl-burger"] = math.random(35, 54),
    ["frappuccino"] = math.random(35, 54),
    ["cluckin-drink"] = math.random(35, 54),
    ["french-toast"] = math.random(35, 54),
    ["fries"] = math.random(35, 54),
    ["fruit-tartlet"] = math.random(35, 54),
    ["fukang-meteorite"] = math.random(35, 54),
    ["glass-of-beer"] = math.random(35, 54),
    ["glass-of-whiskey"] = math.random(35, 54),
    ["wine"] = math.random(35, 54),
    ["green-cow"] = math.random(35, 54),
    ["hamburger"] = math.random(35, 54),
    ["holy-hummus"] = math.random(35, 54),
    ["horchata"] = math.random(35, 54),
    ["hotdog"] = math.random(35, 54),
    ["latte"] = math.random(35, 54),
    ["little-clucker"] = math.random(42, 54),
    ["logger-beer"] = math.random(35, 54),
    ["macn-cheese"] = math.random(35, 54),
    ["martini"] = math.random(35, 54),
    ["meat-free"] = math.random(35, 54),
    ["milkshake"] = math.random(35, 54),
    ["money-shot"] = math.random(35, 54),
    ["muffin"] = math.random(35, 54),
    ["mug-of-beer"] = math.random(35, 54),
    ["onigiri"] = math.random(35, 54),
    ["pancakes"] = math.random(35, 54),
    ["panini-sandwich"] = math.random(40, 54),
    ["pina-colada"] = math.random(35, 54),
    ["pizza-slice"] = math.random(35, 54),
    ["popcorn"] = math.random(10, 54),
    ["pupusas"] = math.random(35, 54),
    ["ramen"] = math.random(35, 54),
    ["sandwich"] = math.random(35, 54),
    ["spaghetti"] = math.random(35, 54),
    ["sushi-plate"] = math.random(38, 54),
    ["sushi-rolls"] = math.random(38, 54),
    ["taco"] = math.random(35, 54),
    ["tacos-de-asada"] = math.random(35, 54),
    ["tequila"] = math.random(35, 54),
    ["tequila-shot"] = math.random(35, 54),
    ["the-bleeder"] = math.random(35, 54),
    ["the-heart-stopper"] = math.random(50, 54),
    ["torpedo"] = math.random(40, 54),
    ["torta"] = math.random(39, 54),
    ["veggy-salad"] = math.random(35, 54),
    ["white-wine-bottle"] = math.random(35, 54),
    ["wings"] = math.random(45, 54),
    ["loka"] = math.random(35, 54),
    ["toast"] = math.random(40, 50),
    ["twix_candy"] = math.random(35, 54),
    ["snickers_candy"] = math.random(40, 50),
    ["dinner"] = math.random(90, 200),
    ["dinner2"] = math.random(90, 200),
    ["dinner3"] = math.random(90, 200),
    ["dinner4"] = math.random(90, 200),
}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    ["cocacola"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    ["burger-softdrink"] = math.random(40, 50),
    ["burger-mshake"] = math.random(40, 50),
    ["water_bottle"] = math.random(35, 54),
    ["slushy"] = math.random(35, 54),
    ["apple_juice"] = math.random(25, 45),
    ["grapejuice"] = math.random(25, 45),
    ["hotsauce"] = math.random(10, 15),
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["champagne"] = math.random(20, 40),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["wine"] = math.random(35, 54),
    ["red-wine-bottle"] = math.random(35, 54),
    ["coffeex"] = math.random(40, 50),
    ["absinthe"] = math.random(20, 40),
    ["applecocktail"] = math.random(20, 40),
	["baileys"] = math.random(20, 40),
	["beer"] = math.random(20, 40),
    ["bombaysaphire"] = math.random(20, 40),
    ["ciroc"] = math.random(20, 40),
    ["cirocapple"] = math.random(20, 40),
    ["cirocred"] = math.random(20, 40),
    ["eristoffblack"] = math.random(20, 40),
    ["goldstrike"] = math.random(20, 40),
    ["jackdaniels"] = math.random(20, 40),
    ["jb"] = math.random(20, 40),
    ["martinibianco"] = math.random(20, 40),
    ["martiniextradry"] = math.random(20, 40),
    ["martinirosato"] = math.random(20, 40),
    ["martinirosso"] = math.random(20, 40),
    ["strawberriesdrink"] = math.random(20, 40),
    ["tequilagold"] = math.random(20, 40),
    ["vodka"] = math.random(20, 40),
    ["vodkacocktail"] = math.random(20, 40),
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR2`] = true,
  --  [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
   -- [`FIRETRUK`] = true,
    [`MULE`] = true,
  --  [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    [2] = {
        [1] = {
            coords = vector4(-115.91, -600.58, 36.28, 249.56),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Business Building'
        },
        [2] = {
            coords = vector4(-142.03, -617.71, 168.82, 281.47),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    --Coke Processing Enter/Exit
    [3] = {
        [1] = {
            coords = vector4(909.49, -1589.22, 30.51, 92.24),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Coke Processing'
        },
        [2] = {
            coords = vector4(1088.81, -3187.57, -38.99, 181.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },
    [4] = {
        [1] = {
            coords = vector4(-1362.02, -472.04, 31.18, 97.29),
            ["AllowVehicle"] = true,
            drawText = '[E] Enter Garage'
        },
        [2] = {
            coords = vector4(-1388.34, -483.3, 78.2, 188.74),
            ["AllowVehicle"] = true,
            drawText = '[E] Leave'
        },
    },
    [5] = {
        [1] = {
            coords = vector4(-1391.72, -482.88, 78.2, 99.32),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter office'
        },
        [2] = {
            coords = vector4(224.98, -419.79, -118.2, 67.33),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Garage'
        },
    },
    [6] = {
        [1] = {
            coords = vector4(-1382.56, -499.53, 33.16, 11.93),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Office'
        },
        [2] = {
            coords = vector4(236.1, -412.95, -118.2, 342.22),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },
    [7] = {
        [1] = {
            coords = vector4(132.83, -1293.92, 29.27, 303.36),
            ["AllowVehicle"] = false,
            drawText = 'VU Motel'
        },
        [2] = {
            coords = vector4(170.45, -1341.63, -37.57, 38.62),
            ["AllowVehicle"] = false,
            drawText = 'VU Main'
        },
    },
    [8] = {
        [1] = {
            coords = vector4(1130.19, -989.18, 45.97, 103.96),
            ["AllowVehicle"] = false,
            drawText = 'Enter'
        },
        [2] = {
            coords = vector4(1138.19, -3199.1, -39.67, 17.64),
            ["AllowVehicle"] = false,
            drawText = 'Exit'
        },
    }
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [6] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}

Consumeables = {

    --Food 
    
    ["burger-bleeder"] = math.random(35, 54),
    ["burger-moneyshot"] = math.random(35, 54),
    ["burger-torpedo"] = math.random(35, 54),
    ["burger-heartstopper"] = math.random(35, 54),
    ["burger-meatfree"] = math.random(35, 54),
    ["burger-fries"] = math.random(35, 54),
    
    
    --Drinks
    ["burger-softdrink"] = math.random(40, 50),
    ["burger-mshake"] = math.random(40, 50),
    
    } 
