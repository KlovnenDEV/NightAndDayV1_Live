Config = {

	BlipSprite = 237,
	BlipColor = 26,
	BlipText = 'Workbench',
	
	CraftingStopWithDistance = false, -- Crafting will stop when not near workbench
	
	ExperiancePerCraft = 5, -- The amount of experiance added per craft (100 Experiance is 1 level)
	
	HideWhenCantCraft = true, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job
	
	Categories = {
	
		['tools'] = {
			Label = 'ИНСТРУМЕНТИ',
			Image = 'tools',
			Jobs = {}
		},
		['weapons'] = {
			Label = 'ОРЪЖИЯ',
			Image = 'WEAPON_PISTOL_MK2',
			Jobs = {}
		},
		['medical'] = {
			Label = 'БОЛНИЧНИ',
			Image = 'bandage',
			Jobs = {'ambulance'}
		},
		['mechanic'] = {
			Label = 'СТОКОВИ ЧАСТИ',
			Image = 'carparts',
			Jobs = {'mechanic'}
		},
		['engines'] = {
			Label = 'ДВИГАТЕЛИ',
			Image = 'v8engine',
			Jobs = {'mechanic'}
		},
		['suspensions'] = {
			Label = 'ОКАЧВАНИЯ',
			Image = 'race_suspension',
			Jobs = {'mechanic'}
		},
		['tuning'] = {
			Label = 'ТУНИНГ',
			Image = 'nos',
			Jobs = {'mechanic'}
		},
	},
	
	PermanentItems = { -- Items that dont get removed when crafting
		['wrench'] = true
	},
	
	Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque
	
		['bandage'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'medical', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'ambulance'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 2, -- The amount that will be crafted
			SuccessRate = 100, -- 100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 10, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 200, -- item name and count, adding items that dont exist in database will crash the script
			}
		}, 
	
		['weapon_pistol_mk2'] = {
			Level = 2, -- From what level this item will be craftable
			Category = 'weapons', -- The category item will be put in
			isGun = true, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 100, --  100% you will recieve the item
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['copper'] = 500, -- item name and count, adding items that dont exist in database will crash the script
				['iron'] = 500
			}
		},
	-----------TOOLS
		['mechanic_tools'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tools', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 3 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
		['toolbox'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tools', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	------------------MECHANIC-------------
	------------------ENGINES--------------
		['2jzengine'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'engines', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	----------------SUSPENSIONS-------------
		['race_suspension'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'suspensions', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	--------------TUNING------------------
		['shell_oil'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['race_brakes'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['michelin_tires'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},

		['racing_tires'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['rubber'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['turbo_lvl_1'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['turbo_lvl_2'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['nos'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['race_transmission'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['race_transmission_4wd'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['race_transmission_fwd'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['ngk_sparkplugs'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'tuning', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	------------------MECHANIC-------------
		['stock_engine'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['stock_suspension'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['stock_brakes'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['stock_transmission'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['stock_tires'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['stock_sparkplugs'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	
		['stock_oil'] = {
			Level = 0, -- From what level this item will be craftable
			Category = 'mechanic', -- The category item will be put in
			isGun = false, -- Specify if this is a gun so it will be added to the loadout
			Jobs = {'mechanic'}, -- What jobs can craft this item, leaving {} allows any job
			JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
			Amount = 1, -- The amount that will be crafted
			SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
			requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
			Time = 20, -- Time in seconds it takes to craft this item
			Ingredients = { -- Ingredients needed to craft this item
				['iron'] = 300 -- item name and count, adding items that dont exist in database will crash the script
				
			}
		},
	},
	
	Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
		-- NoPixel Bennys
		{coords = vector3(-34.71474,-1037.145,28.595392), jobs = {'mechanic'}, blip = false, recipes = {'stock_oil', 'stock_sparkplugs', 'stock_tires', 'stock_transmission', 'stock_brakes', 'stock_engine', '2jzengine', 'race_suspension', 'shell_oil', 'race_brakes', 'michelin_tires', 'racing_tires', 'turbo_lvl_1', 'turbo_lvl_2', 'nos', 'race_transmission', 'race_transmission_4wd', 'race_transmission_fwd', 'ngk_sparkplugs', 'mechanic_tools', 'toolbox'}, radius = 2.0 }
	
	},
	}