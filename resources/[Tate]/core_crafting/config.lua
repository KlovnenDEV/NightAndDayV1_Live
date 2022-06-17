Config = {

	BlipSprite = 237,
	BlipColor = 26,
	BlipText = 'Workbench',
	
	UseLimitSystem = false, -- Enable if your esx uses limit system
	
	CraftingStopWithDistance = true, -- Crafting will stop when not near workbench
	
	ExperiancePerCraft = 100, -- The amount of experiance added per craft (100 Experiance is 1 level)
	
	HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job
	
	Categories = {
	
	['misc'] = {
		Label = 'MISC',
		Image = 'fishingrod',
		Jobs = {}
	},
	['medical'] = {
		Label = 'MEDICAL',
		Image = 'bandage',
		Jobs = {doctor, ambulance}
	}
	},
	
	MechCategories = {
	['mechanic'] = {
		Label = 'MECHANICS',
		Image = 'advancedkit',
		Jobs = {}
	}
	},
	
	GunCategories = {
	['weapons'] = {
		Label = 'WEAPONS',
		Image = 'WEAPON_APPISTOL',
		Jobs = {}
	},
	['attachments'] = {
		Label = 'ATTACHMENTS',
		Image = 'smg_scope',
		Jobs = {}
	}
},
	
	WeedCategories = {
		['Weed'] = {
			Label = 'Weed',
			Image = 'weed_skunk',
			Jobs = {}
		},
		['weed_pot'] = {
			Label = 'Weed Pot',
			Image = 'weed_pot',
			Jobs = {}
		},
		['empty_weed_bag'] = {
			Label = 'Weed Bag',
			Image = 'empty_weed_bag',
			Jobs = {}
		},
		['weed_skunk_joint'] = {
			Label = 'Weed Skunk Joint',
			Image = 'weed_skunk_joint',
			Jobs = {}
		},
	},	
	
	
	PermanentItems = { -- Items that dont get removed when crafting
		['wrench'] = true
	},
	
	Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque
	
	['bandage'] = {
		ItemName = 'bandage',
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
			['clothe'] = 2, -- item name and count, adding items that dont exist in database will crash the script
			['wood'] = 1,
		}
	}, 
	
	['fishingrod'] = {
		ItemName = 'fishingrod',
		Level = 0, -- From what level this item will be craftable
		Category = 'misc', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 3, -- The amount that will be crafted
		SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			['wood'] = 3 -- item name and count, adding items that dont exist in database will crash the script
		}
	},
	
	-- // ATTACHMENTS Craft stuff
	
	['pistol_extendedclip'] = {
		ItemName = 'Pistol Extended Clip',
		Level = 0, -- From what level this item will be craftable
		Category = 'attachments', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 50,
			["steel"] = 45,
			["rubber"] = 5
		}
	},
	['pistol_suppressor'] = {
		ItemName = 'Pistol Suppressor',
		Level = 1, -- From what level this item will be craftable
		Category = 'attachments', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 95,
			["steel"] = 120,
			["rubber"] = 25
		}
	},
	['weapon_pistol'] = {
		ItemName = 'Colt 1911',
		Level = 3, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 35,
			["steel"] = 100,
			["iron"] = 85,
		
		}
	},
	['weapon_revolver_mk2'] = {
		ItemName = 'Revolver MK2',
		Level = 3, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 50,
			["steel"] = 125,
			["iron"] = 95,
		
		}
	},
	['weapon_microsmg'] = {
		ItemName = 'Micro SMG',
		Level = 3, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 50,
			["steel"] = 125,
			["iron"] = 95,
		
		}
	},
	['smg_extendedclip'] = {
		ItemName = 'SMG Extended Clip',
		Level = 2, -- From what level this item will be craftable
		Category = 'attachments', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
				["steel"] = 25,
			["aluminum"] = 70,
			["plastic"] = 80
		}
	},
	['rifle_extendedclip'] = {
		ItemName = 'Rifle Extended Clip',
		Level = 4, -- From what level this item will be craftable
		Category = 'attachments', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["steel"] = 25,
			["aluminum"] = 70,
			["plastic"] = 80
		}
	},
	['rifle_drummag'] = {
		ItemName = 'Rifle Drummag',
		Level = 5, -- From what level this item will be craftable
		Category = 'attachments', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["steel"] = 25,
			["aluminum"] = 70,
			["plastic"] = 80
		}
	},
	['smg_flashlight'] = {
		ItemName = 'SMG Flashlight',
		Level = 6, -- From what level this item will be craftable
		Category = 'attachments', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["steel"] = 25,
			["aluminum"] = 70,
			["plastic"] = 80
		}
	},
	['smg_suppressor'] = {
		ItemName = 'SMG Suppressor',
		Level = 7, -- From what level this item will be craftable
		Category = 'attachments', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 25,
		["aluminum"] = 70,
		["plastic"] = 80
		}
	},
	['smg_scope'] = {
		ItemName = 'SMG Scope',
		Level = 8, -- From what level this item will be craftable
		Category = 'attachments', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 25,
		["aluminum"] = 70,
		["plastic"] = 80
		}
	},
	['weapon_compactrifle'] = {
		ItemName = 'Compact Rifle',
		Level = 10, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
		["steel"] = 25,
		["aluminum"] = 70,
		["plastic"] = 80
		}
	},
	
	
	['weapon_pumpshotgun'] = {
		ItemName = 'Pump Shotgun',
		Level = 10, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 110,
			["steel"] = 125,
			["aluminum"] = 50
	
		}
	},
	['shotgun_ammo'] = {
		ItemName = 'Shotgun Ammo',
		Level = 11, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["steel"] = 25,
			["aluminum"] = 70,
			["plastic"] = 80
		}
	},
	['smg_ammo'] = {
		ItemName = 'SMG Ammo',
		Level = 11, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["steel"] = 55,
			["aluminum"] = 80,
			["copper"] = 60
		}
	},
	['rifle_ammo'] = {
		ItemName = 'Rifle Ammo',
		Level = 12, -- From what level this item will be craftable
		Category = 'weapons', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 100, --  100% you will recieve the item
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 20, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["steel"] = 50,
			["aluminum"] = 75,
			["copper"] = 50
		}
	},
	
	-- // mech stuff
	
	['lockpick'] = {
		ItemName = 'Lockpick',
		Level = 0, -- From what level this item will be craftable
		Category = 'mechanic', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 35
		}
	},
	['advancedlockpick'] = {
		ItemName = 'advanced lockpick',
		Level = 0, -- From what level this item will be craftable
		Category = 'mechanic', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 40,
			["steel"] = 19
		}
	},
	['advancedrepairkit'] = {
		ItemName = 'advanced repairkit',
		Level = 0, -- From what level this item will be craftable
		Category = 'mechanic', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = 'mechanic, mechanic2, mechanic3, mechanic4, mechanic5, mechanic6, mechanic7', -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["metalscrap"] = 40,
			["steel"] = 19,
			["aluminum"] = 40,
	
		}
	},
	
	--Weed
	['weed_skunk'] = {
		ItemName = 'weed_skunk',
		Level = 1, -- From what level this item will be craftable
		Category = 'Weed', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 5, -- The amount that will be crafted
		SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 5, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["cannabis"] = 1,
			["empty_weed_bag"] = 5,
	
		}
	},
	['Weed_pot'] = {
		ItemName = 'weed_pot',
		Level = 0, -- From what level this item will be craftable
		Category = 'Weed', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 1, -- The amount that will be crafted
		SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 10, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["plastic"] = 5,
	
		}
	},
	['empty_weed_bag'] = {
		ItemName = 'empty_weed_bag',
		Level = 0, -- From what level this item will be craftable
		Category = 'Weed', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10, -- The amount that will be crafted
		SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 3, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
			["plastic"] = 2,
	
		}
	},
	['weed_skunk_joint'] = {
		ItemName = 'weed_skunk_joint',
		Level = 2, -- From what level this item will be craftable
		Category = 'Weed', -- The category item will be put in
		isGun = false, -- Specify if this is a gun so it will be added to the loadout
		Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
		JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
		Amount = 10, -- The amount that will be crafted
		SuccessRate = 90, -- 90% That the craft will succeed! If it does not you will lose your ingredients
		requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
		Time = 5, -- Time in seconds it takes to craft this item
		Ingredients = { -- Ingredients needed to craft this item
		["weed_skunk"] = 1,
		["rolling_paper"] = 5,
	
		}
	}
	
	},
	Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
			
			{coords = vector3(-196.3735,-1318.485,32.08951), jobs = 'mechanic', Categories = 'MechCategories', blip = true, recipes = {}, radius = 3.0 },       					--bennys 1 
			{coords = vector3(101.26113891602,6615.810546875,33.58126831054), jobs = 'mechanic', Categories = 'MechCategories', blip = false, recipes = {}, radius = 3.0 },      	--North LS customs
			{coords = vector3(93.52, 3754.21, 41.57), jobs = {}, Categories = 'GunCategories', blip = false, recipes = {}, radius = 3.0 }, --Gun crafting 1 
			{coords = vector3(164.9575,-1323.114,26.81208), jobs = {}, Categories = 'GunCategories', blip = false, recipes = {}, radius = 3.0}, --Gun crafting 2 
			{coords = vector3(1036.41, -3203.72, -37.17), jobs = {}, Categories = 'WeedCategories', blip = false, recipes = {}, radius = 3.0} --Weed crafting 
	
	},
	 
	
	Text = {
	
		['not_enough_ingredients'] = 'You dont have enough ingredients',
		['you_cant_hold_item'] = 'You cant hold the item',
		['item_crafted'] = 'Item crafted!',
		['wrong_job'] = 'You cant open this workbench',
		['workbench_hologram'] = '[~b~E~w~] Workbench',
		['wrong_usage'] = 'Wrong usage of command',
		['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
		['crafting_failed'] = 'You failed to craft the item!'
	
	}
	
	}
	
	
	
	function SendTextMessage(msg)
	
			SetNotificationTextEntry('STRING')
			AddTextComponentString(msg)
			DrawNotification(0,1)
	
			--EXAMPLE USED IN VIDEO
			--exports['mythic_notify']:SendAlert('inform', msg)
			exports['okokNotify']:Alert("inform", msg)
	end
	