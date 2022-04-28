Config, Types, Bones = {}, {}, {}
Types[1], Types[2], Types[3] = {}, {}, {}

-- This is the vehicle bones table, this is needed to verify if the vehicle bone exists when checking them, here is a list of vehicle bones you can use, all of them are included in this table: https://wiki.rage.mp/index.php?title=Vehicle_Bones
Config.VehicleBones = {'chassis', 'chassis_lowlod', 'chassis_dummy', 'seat_dside_f', 'seat_dside_r', 'seat_dside_r1', 'seat_dside_r2', 'seat_dside_r3', 'seat_dside_r4', 'seat_dside_r5', 'seat_dside_r6', 'seat_dside_r7', 'seat_pside_f', 'seat_pside_r', 'seat_pside_r1', 'seat_pside_r2', 'seat_pside_r3', 'seat_pside_r4', 'seat_pside_r5', 'seat_pside_r6', 'seat_pside_r7', 'window_lf1', 'window_lf2', 'window_lf3', 'window_rf1', 'window_rf2', 'window_rf3', 'window_lr1', 'window_lr2', 'window_lr3', 'window_rr1', 'window_rr2', 'window_rr3', 'door_dside_f', 'door_dside_r', 'door_pside_f', 'door_pside_r', 'handle_dside_f', 'handle_dside_r', 'handle_pside_f', 'handle_pside_r', 'wheel_lf', 'wheel_rf', 'wheel_lm1', 'wheel_rm1', 'wheel_lm2', 'wheel_rm2', 'wheel_lm3', 'wheel_rm3', 'wheel_lr', 'wheel_rr', 'suspension_lf', 'suspension_rf', 'suspension_lm', 'suspension_rm', 'suspension_lr', 'suspension_rr', 'spring_rf', 'spring_lf', 'spring_rr', 'spring_lr', 'transmission_f', 'transmission_m', 'transmission_r', 'hub_lf', 'hub_rf', 'hub_lm1', 'hub_rm1', 'hub_lm2', 'hub_rm2', 'hub_lm3', 'hub_rm3', 'hub_lr', 'hub_rr', 'windscreen', 'windscreen_r', 'window_lf', 'window_rf', 'window_lr', 'window_rr', 'window_lm', 'window_rm', 'bodyshell', 'bumper_f', 'bumper_r', 'wing_rf', 'wing_lf', 'bonnet', 'boot', 'exhaust', 'exhaust_2', 'exhaust_3', 'exhaust_4', 'exhaust_5', 'exhaust_6', 'exhaust_7', 'exhaust_8', 'exhaust_9', 'exhaust_10', 'exhaust_11', 'exhaust_12', 'exhaust_13', 'exhaust_14', 'exhaust_15', 'exhaust_16', 'engine', 'overheat', 'overheat_2', 'petrolcap', 'petrolcap', 'petroltank', 'petroltank_l', 'petroltank_r', 'steering', 'hbgrip_l', 'hbgrip_r', 'headlight_l', 'headlight_r', 'taillight_l', 'taillight_r', 'indicator_lf', 'indicator_rf', 'indicator_lr', 'indicator_rr', 'brakelight_l', 'brakelight_r', 'brakelight_m', 'reversinglight_l', 'reversinglight_r', 'extralight_1', 'extralight_2', 'extralight_3', 'extralight_4', 'numberplate', 'interiorlight', 'siren1', 'siren2', 'siren3', 'siren4', 'siren5', 'siren6', 'siren7', 'siren8', 'siren9', 'siren10', 'siren11', 'siren12', 'siren13', 'siren14', 'siren15', 'siren16', 'siren17', 'siren18', 'siren19', 'siren20', 'siren_glass1', 'siren_glass2', 'siren_glass3', 'siren_glass4', 'siren_glass5', 'siren_glass6', 'siren_glass7', 'siren_glass8', 'siren_glass9', 'siren_glass10', 'siren_glass11', 'siren_glass12', 'siren_glass13', 'siren_glass14', 'siren_glass15', 'siren_glass16', 'siren_glass17', 'siren_glass18', 'siren_glass19', 'siren_glass20', 'spoiler', 'struts', 'misc_a', 'misc_b', 'misc_c', 'misc_d', 'misc_e', 'misc_f', 'misc_g', 'misc_h', 'misc_i', 'misc_j', 'misc_k', 'misc_l', 'misc_m', 'misc_n', 'misc_o', 'misc_p', 'misc_q', 'misc_r', 'misc_s', 'misc_t', 'misc_u', 'misc_v', 'misc_w', 'misc_x', 'misc_y', 'misc_z', 'misc_1', 'misc_2', 'weapon_1a', 'weapon_1b', 'weapon_1c', 'weapon_1d', 'weapon_1a_rot', 'weapon_1b_rot', 'weapon_1c_rot', 'weapon_1d_rot', 'weapon_2a', 'weapon_2b', 'weapon_2c', 'weapon_2d', 'weapon_2a_rot', 'weapon_2b_rot', 'weapon_2c_rot', 'weapon_2d_rot', 'weapon_3a', 'weapon_3b', 'weapon_3c', 'weapon_3d', 'weapon_3a_rot', 'weapon_3b_rot', 'weapon_3c_rot', 'weapon_3d_rot', 'weapon_4a', 'weapon_4b', 'weapon_4c', 'weapon_4d', 'weapon_4a_rot', 'weapon_4b_rot', 'weapon_4c_rot', 'weapon_4d_rot', 'turret_1base', 'turret_1barrel', 'turret_2base', 'turret_2barrel', 'turret_3base', 'turret_3barrel', 'ammobelt', 'searchlight_base', 'searchlight_light', 'attach_female', 'roof', 'roof2', 'soft_1', 'soft_2', 'soft_3', 'soft_4', 'soft_5', 'soft_6', 'soft_7', 'soft_8', 'soft_9', 'soft_10', 'soft_11', 'soft_12', 'soft_13', 'forks', 'mast', 'carriage', 'fork_l', 'fork_r', 'forks_attach', 'frame_1', 'frame_2', 'frame_3', 'frame_pickup_1', 'frame_pickup_2', 'frame_pickup_3', 'frame_pickup_4', 'freight_cont', 'freight_bogey', 'freightgrain_slidedoor', 'door_hatch_r', 'door_hatch_l', 'tow_arm', 'tow_mount_a', 'tow_mount_b', 'tipper', 'combine_reel', 'combine_auger', 'slipstream_l', 'slipstream_r', 'arm_1', 'arm_2', 'arm_3', 'arm_4', 'scoop', 'boom', 'stick', 'bucket', 'shovel_2', 'shovel_3', 'Lookat_UpprPiston_head', 'Lookat_LowrPiston_boom', 'Boom_Driver', 'cutter_driver', 'vehicle_blocker', 'extra_1', 'extra_2', 'extra_3', 'extra_4', 'extra_5', 'extra_6', 'extra_7', 'extra_8', 'extra_9', 'extra_ten', 'extra_11', 'extra_12', 'break_extra_1', 'break_extra_2', 'break_extra_3', 'break_extra_4', 'break_extra_5', 'break_extra_6', 'break_extra_7', 'break_extra_8', 'break_extra_9', 'break_extra_10', 'mod_col_1', 'mod_col_2', 'mod_col_3', 'mod_col_4', 'mod_col_5', 'handlebars', 'forks_u', 'forks_l', 'wheel_f', 'swingarm', 'wheel_r', 'crank', 'pedal_r', 'pedal_l', 'static_prop', 'moving_prop', 'static_prop2', 'moving_prop2', 'rudder', 'rudder2', 'wheel_rf1_dummy', 'wheel_rf2_dummy', 'wheel_rf3_dummy', 'wheel_rb1_dummy', 'wheel_rb2_dummy', 'wheel_rb3_dummy', 'wheel_lf1_dummy', 'wheel_lf2_dummy', 'wheel_lf3_dummy', 'wheel_lb1_dummy', 'wheel_lb2_dummy', 'wheel_lb3_dummy', 'bogie_front', 'bogie_rear', 'rotor_main', 'rotor_rear', 'rotor_main_2', 'rotor_rear_2', 'elevators', 'tail', 'outriggers_l', 'outriggers_r', 'rope_attach_a', 'rope_attach_b', 'prop_1', 'prop_2', 'elevator_l', 'elevator_r', 'rudder_l', 'rudder_r', 'prop_3', 'prop_4', 'prop_5', 'prop_6', 'prop_7', 'prop_8', 'rudder_2', 'aileron_l', 'aileron_r', 'airbrake_l', 'airbrake_r', 'wing_l', 'wing_r', 'wing_lr', 'wing_rr', 'engine_l', 'engine_r', 'nozzles_f', 'nozzles_r', 'afterburner', 'wingtip_1', 'wingtip_2', 'gear_door_fl', 'gear_door_fr', 'gear_door_rl1', 'gear_door_rr1', 'gear_door_rl2', 'gear_door_rr2', 'gear_door_rml', 'gear_door_rmr', 'gear_f', 'gear_rl', 'gear_lm1', 'gear_rr', 'gear_rm1', 'gear_rm', 'prop_left', 'prop_right', 'legs', 'attach_male', 'draft_animal_attach_lr', 'draft_animal_attach_rr', 'draft_animal_attach_lm', 'draft_animal_attach_rm', 'draft_animal_attach_lf', 'draft_animal_attach_rf', 'wheelcover_l', 'wheelcover_r', 'barracks', 'pontoon_l', 'pontoon_r', 'no_ped_col_step_l', 'no_ped_col_strut_1_l', 'no_ped_col_strut_2_l', 'no_ped_col_step_r', 'no_ped_col_strut_1_r', 'no_ped_col_strut_2_r', 'light_cover', 'emissives', 'neon_l', 'neon_r', 'neon_f', 'neon_b', 'dashglow', 'doorlight_lf', 'doorlight_rf', 'doorlight_lr', 'doorlight_rr', 'unknown_id', 'dials', 'engineblock', 'bobble_head', 'bobble_base', 'bobble_hand', 'chassis_Control'}

----------------------------------------------------------------------------------------
-- Settings
----------------------------------------------------------------------------------------

-- The current used framework dependant on your server
Config.Framework = 'DenaliFW' -- Can be 'none', 'QBCore' or 'ESX'
Config.MainCoreEvent = 'DenaliFW:GetObject' --ESX = 'esx:getSharedObject' , QB = QBCore:GetObject
Config.CoreResourceName = 'denalifw-core' --es_extended 

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 3.0

-- Enable debug options and distance preview
Config.Debug = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = false

-- Key to open the target
Config.OpenKey = 'e' -- Left Alt
Config.OpenControlKey = 51 -- Control for keypress detection also Left Alt, controls are found here https://docs.fivem.net/docs/game-references/controls/

-- Key to open the menu
Config.MenuControlKey = 238 -- Control for keypress detection, this is the Right Mouse Button, controls are found here https://docs.fivem.net/docs/game-references/controls/

----------------------------------------------------------------------------------------
-- Target Configs
----------------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {
	["boxzone1"] = {
        name = "MissionRowDutyClipboard",
        coords = vector3(441.7989, -982.0529, 30.67834),
        length = 0.45,
        width = 0.35,
        heading = 11.0,
        debugPoly = false,
        minZ = 30.77834,
        maxZ = 30.87834,
        options = {
            {
                type = "client",
                event = "qb-policejob:ToggleDuty",
                icon = "fas fa-sign-in-alt",
                label = "Sign In",
                job = "police",
            },
        },
        distance = 2.5
    },
}



Config.PolyZones = {

}

Config.TargetBones = {
	}

Config.TargetEntities = {

}

Config.TargetModels = {
	["DUMPSTERS"] = {
        models = {
		"prop_dumpster_4b",
        "prop_dumpster_4a",
		"prop_dumpster_3a",
		"prop_dumpster_02b",
		"prop_dumpster_02a",
		"prop_dumpster_01a",
		"prop_snow_dumpster_01",
},
        options = {
            {
                type = "client",
                event = "qb-dumpsterstorage:open",
                parameters = {},
                icon = "fas fa-dumpster",
                label = "Open",
            },
			{
				 type = "client",
				event = "qb-dumpster:client:dumpsterdive",
				icon = "fas fa-dumpster",
				label = "Check Dumpster",
			},
			{
				type = "client",
			   event = "hit:client:hide",
			   icon = "fas fa-dumpster",
			   label = "Press R To Hide / Exit",
		   },
        },
        distance = 2.0
    },
	["DUMPSTERS2"] = {
        models = {
		"prop_ld_int_safe_01",
		"prop_mil_crate_01",
		"prop_mil_crate_02",
},
        options = {
            {
                type = "client",
                event = "qb-dumpsterstorage:open",
                parameters = {},
                icon = "fas fa-dumpster",
                label = "Open",
            },
        },
        distance = 2.0
    },
	["washers"] = {
        models = {
		"v_200_launma",
},
        options = {
            {
                type = "client",
                event = "qb-dumpsterstorage:open",
                parameters = {},
                icon = "fas fa-dumpster",
                label = "Open",
            },
        },
        distance = 2.0
    },
	["ATMS"] = {
        models = {-870868698, -1364697528, 	506770882, -1126237515, 1511880420, 682791951, 1457658556},
        options = {
            {
                type = "command",
                event = "atm",
                parameters = {},
                icon = "fa fa-money",
                label = "ATM",
            },
        },
        distance = 2.0
    },
	["dailies"] = {
        models = {
            "g_m_m_armgoon_01",
        },
        options = {
            {
                type = "client",
                event = "",
                icon = "fas fa-store",
                label = "Nope",
            },
        },
        distance = 2.5,
    },
	["dailies2"] = {
        models = {
            "g_m_y_lost_01",
        },
        options = {
            {
                type = "client",
                event = "",
                icon = "fas fa-store",
                label = "Nope",
            },
        },
        distance = 2.5,
    },
	["24/7 shops"] = {
        models = {
            "mp_m_shopkeep_01",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-store",
                label = "Buy Items",
            },
        },
        distance = 2.5,
    },
	["roost"] = {
        models = {
            "ig_lacey_jones_02",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-store",
                label = "Buy Items",
            },
        },
        distance = 2.5,
    },
    ["ammunation shops"] = {
        models = {
            "s_m_y_ammucity_01",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-shopping-cart",
                label = "Buy Weapons",
            },
        },
        distance = 2.5,
    },
	["ammunation shops"] = {
        models = {
            "s_m_y_ammucity_01",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-shopping-cart",
                label = "Buy Weapons",
            },
        },
        distance = 2.5,
    },
	["superfly shops"] = {
        models = {
            "a_m_y_hippy_01",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-shopping-cart",
                label = "Weed shop",
            },
        },
        distance = 2.5,
    },
    ["youtool shops"] = {
        models = {
            "s_m_m_lathandy_01",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-wrench",
                label = "Buy Tools",
            },
        },
        distance = 2.5,
    },
	["casino"] = {
        models = {
            "csb_tomcasino",
        },
	options = {
		{
			type = "client",
			event = "denalifw-shops:marketshop",
			icon = "fas fa-circle",
			label = "Buy Chips",
		},
		{
			type = "server",
			event = "denalifw-casino:server:sell",
			icon = "fas fa-circle",
			label = "Sell Chips",
		},
	},
	distance = 2.5,
},
["baller"] = {
	models = {
		"s_f_m_fembarber",
	},
options = {
	{
		type = "client",
		event = "denalifw-shops:marketshop",
		icon = "fas fa-circle",
		label = "Get key1",
	},
	
},
distance = 2.5,
},
["key2"] = {
	models = {
		"s_f_m_fembarber",
	},
options = {
	{
		type = "client",
		event = "denalifw-shops:marketshop",
		icon = "fas fa-circle",
		label = "Get key2",
	},
	
},
distance = 2.5,
},

	["roostmotel"] = {
        models = {
            "cs_dreyfuss",
        },
        options = {
            {
                type = "client",
                event = "hh_motel:client:rent",
                icon = "fas fa-wrench",
                label = "Rent Room",
            },
        },
        distance = 2.5,
    },
    ["sea world"] = {
        models = {
            "cs_dom",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-circle",
                label = "Buy Gear",
            },
        },
        distance = 2.5,
    },
	["washing"] = {
        models = {
            "s_m_o_busker_01",
        },
        options = {
            {
                type = "client",
                event = "laundry:openwasher",
                icon = "fas fa-circle",
                label = "Loadwasher",
				id = 1,
            },
			{
                type = "client",
                event = "laundry:startwasher",
                icon = "fas fa-circle",
                label = "Start washing",
				id = 1,
            },
        },
        distance = 2.5,
    },
	["lester"] = {
        models = {
            "ig_lestercrest_2",
        },
        options = {
            {
                type = "client",
                event = "cryptodealer:client:sellcypto",
                icon = "fas fa-circle",
                label = "Sell your crypto",
            },
			{
                type = "server",
                event = "AttackTransport:akceptujto",
                icon = "fas fa-circle",
                label = "Bank truck robbery $500",
            },
			{
                type = "client",
                event = "AttackTranswport:Pozwolwykonac",
                icon = "fas fa-circle",
                label = "Destroy BCSO Body Cam SIM",
            },
			{
                type = "client",
                event = "AttackTranswport:Pozwolwykonac",
                icon = "fas fa-circle",
                label = "Decrypt BCSO Body Cam SIM",
            },
        },
        distance = 2.5,
    },
	["lesisure"] = {
        models = {
            "csb_paige",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-circle",
                label = "Shop",
            },
        },
        distance = 2.5,
    },
	["resturant"] = {
        models = {
            "s_m_y_waiter_01",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-circle",
                label = "Order Food",
            },
        },
        distance = 2.5,
    },
	["bartendeer"] = {
		models = {
			"s_f_y_bartender_01",
		},
	options = {
		{
			type = "client",
			event = "denalifw-shops:marketshop",
			icon = "fas fa-circle",
			label = "Open Bar",
		},
	},
	distance = 2.5,
	},
	["sea world"] = {
        models = {
            "g_m_m_chicold_01",
        },
        options = {
            {
                type = "client",
                event = "denalifw-shops:marketshop",
                icon = "fas fa-circle",
                label = "Mule",
            },
        },
        distance = 2.5,
    },
	["coketable"] = {
        models = {
            "bkr_prop_coke_table01a",
        },
        options = {
            {
		type = "client",
                event = "denalifw-tables:client:CrackTable",
                icon = "fas fa-pencil-ruler",
                label = "Process Crack",
            },
        },
        distance = 1.5
    },
	["weedtable"] = {
        models = {
            "bkr_prop_weed_table_01a",
        },
        options = {
            {
                type = "client",
                event = "denalifw-tables:client:weedTable",
                icon = "fas fa-cannabis",
                label = "Break up Bricks",
            },
        },
        distance = 1.5
    },
	["methtable"] = {
        models = {
            "bkr_prop_meth_table01a",
        },
        options = {
            {
		type = "client",
                event = "denalifw-tables:client:methTable",
                icon = "fas fa-pencil-ruler",
                label = "Break up Trays",
            },
        },
        distance = 1.5
    },
	["legalHunts"] = {
        models = {
            "a_c_boar",
			"a_c_deer",
			"a_c_coyote",
			"a_c_mtlion",
			"a_c_chop",
			"a_c_husky",
			"a_c_retriever",
			"a_c_westy",
			"a_c_shepherd",
			"a_c_poodle",
			"u_m_y_gunvend_01",
        },
        options = {
            {
		type = "client",
                event = "Dox-hunting:skinAnimal",
                icon = "fas fa-hand-paper",
                label = "Skin",
            },
        },
        distance = 1.5
    },


	["BlackMarket"] = {
		models = {
			"s_f_m_fembarber",
		},
	options = {
		{
			type = "client",
			event = "denalifw-shops:marketshop",
			icon = "fas fa-circle",
			label = "Blackmarket",
		},
		
	},
	distance = 2.5,
	},
	
}

Config.GlobalPedOptions = {
	[1] = { 
		model = 'ig_hunter',
		coords = vector4(-678.95, 5839.77, 17.33, 217.38),
		minusOne = true,
		freeze = true,
		invincible = true,
		blockevents = true,
		-- animDict = 'amb@world_human_aa_smoke@male@idle_a',
		-- anim = 'idle_a',
		scenario = 'WORLD_HUMAN_AA_SMOKE',
		flag = 1,
		target = {
			options = {
			{
			 type = "client",
			 event = "hunting:shop",
			 icon = 'fas fa-shopping-basket ',
			 label = 'hunting shop',
			}
		},
		distance = 2.5,
	  }
	  },
	  [2] = { 
		model = 'csb_chef',
		coords = vector4(569.1, 2796.52, 42.02, 275.93),
		minusOne = true,
		freeze = true,
		invincible = true,
		blockevents = true,
		-- animDict = 'amb@world_human_aa_smoke@male@idle_a',
		-- anim = 'idle_a',
		scenario = 'WORLD_HUMAN_AA_SMOKE',
		flag = 1,
		target = {
			options = {
			{
			 type = "client",
			 event = "Dox-hunting:client:sell",
			 icon = 'fas fa-shopping-basket ',
			 label = 'sell',
			}
		},
		distance = 2.5,
		}
	   },
	  
}

Config.GlobalVehicleOptions = {
	options = {
		{
		type = "client",
		event = "asser-tow:client:tow",
		icon = 'fas fa-car',
		label = 'Tow',
		job = 'tow',
		},
		{
			type = "client",
			event = "denalifw-trunk:client:GetIn",
			label = 'Get in Trunk',
			},
			{
			type="client",
			event="LegacyFuel:client:siphonfuel",
			label = "Siphon Fuel",
			icon = 'fas fa-gas-pump',
			item = 'fuelsiphon',
			},
			distance = 3.0,
		},
		{ 
			type = "client",
			event = 'cc-fuel:client:petrolcanrefuel',
			label = 'Refuel Car', 
			icon = 'fas fa-gas-pump',
			item = 'weapon_petrolcan',
	},
	distance = 2.5,
}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {
	options = {
		{
		type = "client",
		event = "qb-phone:client:GiveContactDetails",
		icon = 'fas fa-phone',
		label = 'Give Contact Details',
		item = 'phone',
		},
		{
			type = "command",
			event = "nearby hug",
			label = 'Hug',
			},
			{
				type = "command",
				event = "nearby bro2",
				label = 'Bro',
				},
				{
					type = "command",
					event = "nearby handshake",
					label = 'Handshake',
					},
		{
		type = "client",
		event = "police:client:SearchPlayer",
		icon ='fas fa-id-card',
		label = 'Search Person',
		job = 'police',
		},
		distance = 4.0
		},

		
		}


Config.Peds = {

	{  ------liesure------
	model = `csb_paige`,
	coords = vector4(-1505.79, 1511.98, 114.29, 255.58),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{  ------Laundry------
	model = `s_m_o_busker_01`,
	coords = vector4(1121.16, -3194.05, -41.4, 205.66),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{  
	model = `a_m_y_hippy_01`,
	coords = vector4(-1171.3, -1571.0, 3.66, 127.36),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{  
model = `g_m_m_armboss_01`,
coords = vector4(-160.16, 340.33, 92.76, 173.58),
gender = 'male',
freeze = true,
invincible = true,
blockevents = true,
},
{  
model = `s_m_y_waiter_01`,
coords = vector4(417.43, -1496.9, 29.16, 339.66),
gender = 'male',
freeze = true,
invincible = true,
blockevents = true,
},
{  
model = `cs_dreyfuss`,
coords = vector4(-140.82, 302.39, 97.47, 85.86),
gender = 'male',
freeze = true,
invincible = true,
blockevents = true,
},
{  
model = `ig_lacey_jones_02`,
coords = vector4(-171.65, 302.8, 97.52, 267.54),
gender = 'male',
freeze = true,
invincible = true,
blockevents = true,
},
{  
model = `a_m_y_hippy_01`,
coords = vector4(376.19, -826.64, 28.3, 186.33),
gender = 'male',
freeze = true,
invincible = true,
blockevents = true,
},
{ 
model = `ig_lestercrest_2`,
coords = vector4(-149.06, 307.57, 92.76, 200.13),
gender = 'male',
freeze = true,
invincible = true,
blockevents = true,
},
	{ -------Youtool Shop------
	model = `s_m_m_lathandy_01`,
	coords = vector4(45.48, -1748.85, 28.55, 55.1),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{  -------Youtool Shop------
	model = `s_m_m_lathandy_01`,
	coords = vector4(2748.07, 3472.72, 54.70, 238.96),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{  -------Youtool Shop------
	model = `s_m_m_lathandy_01`,
	coords = vector4(-421.84, 6136.09, 30.88, 213.62),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-3242.23, 999.97, 11.85, 351.66),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(24.5, -1346.63, 28.60, 273.18),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-47.18, -1758.46, 28.45, 39.64),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-706.02, -913.9, 18.35, 86.17),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1486.75, -377.57, 39.20, 132.60),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	-- San Andreas Ave Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1221.30, -907.82, 11.40, 34.60),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Carrson Ave
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(372.6, 327.06, 102.55, 258.49),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- North Rockford
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1819.96, 794.04, 137.10, 126.36),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean South
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-3039.89, 584.21, 6.90, 16.15),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-2966.41, 391.62, 14.05, 84.40),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Mirror Park
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1164.72, -323.04, 68.25, 93.92),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Vespucci Boulevard Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1134.32, -983.25, 45.45, 278.23),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Route 68
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(549.24, 2670.37, 41.25, 94.15),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Sandy
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1959.72, 3740.68, 31.40, 297.43),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Sandy Shores Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1165.25, 2710.80, 38.16, 183.01),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Grape Seed
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1697.8, 4923.14, 41.10, 321.33),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean North
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1728.33, 6416.21, 34.05, 241.78),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- LS Freeway
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(2677.32, 3279.69, 54.30, 323.82),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{---by youtool
	model = 'mp_m_shopkeep_01',
	coords = vector4(2557.28, 380.78, 107.65, 359.83),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Ammunations
{   ----vesspuci
	model = 's_m_y_ammucity_01',
	coords = vector4(-661.98, -933.57, 20.80, 181.76),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Legion Square
{
	model = 's_m_y_ammucity_01',
	coords = vector4(22.59, -1105.55, 28.80, 159.83),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Popular Street
{
	model = 's_m_y_ammucity_01',
	coords = vector4(810.21, -2159.02, 28.60, 1.43),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Vespucci Boulevard
{
	model = 's_m_y_ammucity_01',
	coords = vector4(842.42, -1035.31, 27.20, 358.67),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Vinewood Hills
{
	model = 's_m_y_ammucity_01',
	coords = vector4(253.87, -50.58, 68.95, 67.39),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Palomino Freeway
{
	model = 's_m_y_ammucity_01',
	coords = vector4(2567.97, 292.64, 107.80, 358.18),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Route 68
{
	model = 's_m_y_ammucity_01',
	coords = vector4(-1118.98, 2699.77, 17.60, 223.39),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Sandy Shores
{
	model = 's_m_y_ammucity_01',
	coords = vector4(1692.21, 3760.91, 33.70, 229.39),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Paleto
{
	model = 's_m_y_ammucity_01',
	coords = vector4(-331.61, 6084.92, 30.55, 226.57),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{ --sea world
	model = 'cs_dom',
	coords = vector4(-1686.39, -1072.48, 12.15, 50.1),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{ --sea world
	model = 'g_m_m_armgoon_01',
	coords = vector4(413.24, -1487.06, 29.15, 80.77),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{ --sea world
	model = 'g_m_y_lost_01',
	coords = vector4(46.23, 3702.77, 38.76, 323.25),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{ --casino cashier
	model = 'csb_tomcasino',
	coords = vector4(949.61, 32.99, 70.84, 46.46),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{ --casino cashier
	model = 's_f_y_bartender_01',
	coords = vector4(937.95, 27.58, 70.83, 25.17),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
--key1
{ --casino cashier
model = 's_f_m_fembarber',
coords = vector4(442.43, -1886.51, 26.03, 283.44),
gender = 'female',
freeze = true,
invincible = true,
blockevents = true,
},
  
--key2
{ 
	model = 's_f_m_fembarber',
	coords = vector4(704.83, -961.0, 29.4, 270.44),
	gender = 'female',
	freeze = true,
	invincible = true,
	blockevents = true,
	},

	--BlackMarket
{ 
	model = 's_f_m_fembarber',
	coords = vector4(-3186.92, 1075.5, 19.84, 71.83),
	gender = 'female',
	freeze = true,
	invincible = true,
	blockevents = true,
	},
  

}

----------------------------------------------------------------------------------------
-- Functions
----------------------------------------------------------------------------------------

if Config.EnableDefaultOptions then
	function Config.ToggleDoor(vehicle, door)
		if GetVehicleDoorLockStatus(vehicle) ~= 2 then
			if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
				SetVehicleDoorShut(vehicle, door, false)
			else
				SetVehicleDoorOpen(vehicle, door, false)
			end
		end
	end
end

----------------------------------------------------------------------------------------
-- Default options
----------------------------------------------------------------------------------------

-- These options don't represent the actual way of making TargetBones or filling out Config.TargetBones, refer to the TEMPLATES.md for a template on that, this is only the way to add it without affecting the config table

if Config.EnableDefaultOptions then
	Bones['seat_dside_f'] = {
		["Toggle Front Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Front Door",
			canInteract = function(entity)
				if GetVehicleDoorLockStatus(entity) == 2 then
					return false
				end
				return GetEntityBoneIndexByName(entity, 'door_dside_f') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 0)
			end,
			distance = 1.2
		}
	}

	Bones['seat_pside_f'] = {
		["Toggle Front Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Front Door",
			canInteract = function(entity)
				if GetVehicleDoorLockStatus(entity) == 2 then
					return false
				end
				return GetEntityBoneIndexByName(entity, 'door_pside_f') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 1)
			end,
			distance = 1.2
		}
	}

	Bones['seat_dside_r'] = {
		["Toggle Rear Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Rear Door",
			canInteract = function(entity)
				if GetVehicleDoorLockStatus(entity) == 2 then
					return false
				end
				return GetEntityBoneIndexByName(entity, 'door_dside_r') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 2)
			end,
			distance = 1.2
		}
	}

	Bones['seat_pside_r'] = {
		["Toggle Rear Door"] = {
			icon = "fas fa-door-open",
			label = "Toggle Rear Door",
			canInteract = function(entity)
				if GetVehicleDoorLockStatus(entity) == 2 then
					return false
				end
				return GetEntityBoneIndexByName(entity, 'door_pside_r') ~= -1
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 3)
			end,
			distance = 1.2
		}
	}

	Bones['bonnet'] = {
		["Toggle Hood"] = {
			icon = "fa-duotone fa-engine",
			label = "Toggle Hood",
			canInteract = function(entity)
				if GetVehicleDoorLockStatus(entity) == 2 then
					return false
				end
				return true
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 4)
			end,
			distance = 0.9
		}
	}

	Bones['boot'] = {
		["Toggle Truck"] = {
			icon = "fas fa-door-open",
			label = "Toggle Truck",
			canInteract = function(entity)
				if GetVehicleDoorLockStatus(entity) == 2 then
					return false
				end
				return true
			end,
			action = function(entity)
				Config.ToggleDoor(entity, 5)
			end,
			distance = 0.9
		}
	}
end
