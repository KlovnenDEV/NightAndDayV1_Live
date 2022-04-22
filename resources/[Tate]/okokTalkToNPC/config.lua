Config = {}

Config.Key = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.AutoCamPosition = true -- If true it'll set the camera position automatically

Config.AutoCamRotation = true -- If true it'll set the camera rotation automatically

Config.HideMinimap = true -- If true it'll hide the minimap when interacting with an NPC

Config.UseOkokTextUI = true -- If true it'll use okokTextUI 

Config.CameraAnimationTime = 1000 -- Camera animation time: 1000 = 1 second

Config.TalkToNPC = {
	--key1
	{
		npc = 'u_m_y_abner', 										-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'Employee of the', 								-- Text over the name
		name = 'Casino', 										-- Text under the header
		uiText = "Casino  Employee",							-- Name shown on the notification when near the NPC
		dialog = 'Hey, how can I help you?',						-- Text showm on the message bubble 
		coordinates = vector3(342.61, -203.04, 53.23), 				-- coordinates of NPC
		heading = 356.46,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Were can i find a Keycars?', 'okokTalk:key1', 'c'},		-- 'c' for client
			
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 's_m_y_construct_01', 										-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'Construction Worker', 								-- Text over the name
		name = 'Construction Worker', 										-- Text under the header
		uiText = "Construction Worker",							-- Name shown on the notification when near the NPC
		dialog = 'Hey, What you want?',						-- Text showm on the message bubble 
		coordinates = vector3(1380.33, -775.97, 66.43), 				-- coordinates of NPC
		heading = 55.08,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'Were can i find a Keycars fot the casno', 'okokTalk:key1p2', 'c'},		-- 'c' for client
			
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'g_m_y_ballaorig_01', 					-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'Baller', 								-- Text over the name
		name = 'Baller', 										-- Text under the header
		uiText = "Baller",							-- Name shown on the notification when near the NPC
		dialog = 'Hey, Homme?',						-- Text showm on the message bubble 
		coordinates = vector3(455.02, -1874.97, 25.92), 				-- coordinates of NPC
		heading = 231.71,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
		{'Do you have the card for the casino?', 'okokTalk:key1p3', 'c'},
		{'Do tou know were i can find card 2?', 'okokTalk:key1p3p1', 'c'},		-- 'c' for client
			
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},
	--key2
	{
		npc = 'csb_cletus', 					-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'cletus', 								-- Text over the name
		name = 'cletus', 										-- Text under the header
		uiText = "cletus",							-- Name shown on the notification when near the NPC
		dialog = 'Hey,Dude?',						-- Text showm on the message bubble 
		coordinates = vector3(1977.08, 3819.59, 32.45), 				-- coordinates of NPC
		heading = 114.4,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'I have been told you know were i can find the keycard for the casino?', 'okokTalk:key2', 'c'},		-- 'c' for client
			
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'a_f_y_hippie_01', 					-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'luna', 								-- Text over the name
		name = 'luna', 										-- Text under the header
		uiText = "luna",							-- Name shown on the notification when near the NPC
		dialog = 'Hey,Babe?',						-- Text showm on the message bubble 
		coordinates = vector3(-1058.88, 4915.43, 210.82), 				-- coordinates of NPC
		heading = 196.63,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
			{'I have been told you have a key keycard for the casino?', 'okokTalk:key2p2', 'c'},		-- 'c' for client
			
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'ig_lestercrest', 					-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'lester', 								-- Text over the name
		name = 'lester', 										-- Text under the header
		uiText = "lester",							-- Name shown on the notification when near the NPC
		dialog = 'Well hello there?',						-- Text showm on the message bubble 
		coordinates = vector3(707.2, -967.0, 29.41), 				-- coordinates of NPC
		heading = 2.85,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
		{'I have been told you have a key keycard for the casino?', 'okokTalk:key2p3', 'c'},		-- 'c' for client
		{'Do you know anything about a train and gold ?', 'okokTalk:TrainStart', 'c'},		-- 'c' for client
			
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'ig_pilot', 					-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'Pilot', 								-- Text over the name
		name = 'Pilot', 										-- Text under the header
		uiText = "Pilot",							-- Name shown on the notification when near the NPC
		dialog = 'Well hello there?',						-- Text showm on the message bubble 
		coordinates = vector3(4446.19, -4479.16, 3.31), 				-- coordinates of NPC
		heading = 199.19,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
		{'I have been told by Leaster you may know about a train of gold?', 'okokTalk:Train1', 'c'},		-- 'c' for client
		{'Who and were can i find this person', 'okokTalk:Train1p2', 'c'},		-- 'c' for client
			
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},

	{
		npc = 'mp_m_securoguard_01', 					-- Website too see peds name: https://wiki.rage.mp/index.php?title=Peds
		header = 'Rob', 								-- Text over the name
		name = 'Rob', 										-- Text under the header
		uiText = "Rob",							-- Name shown on the notification when near the NPC
		dialog = 'Well hello there?',						-- Text showm on the message bubble 
		coordinates = vector3(443.89, -3114.35, 5.07), 				-- coordinates of NPC
		heading = 12.23,											-- Heading of NPC (needs decimals, 0.0 for example)
		camOffset = vector3(0.0, 0.0, 0.0), 						-- Camera position relative to NPC 	| (only works if Config.AutoCamPosition = false)
		camRotation = vector3(0.0, 0.0, 0.0),						-- Camera rotation 					| (only works if Config.AutoCamRotation = false)
		interactionRange = 2.5, 									-- From how far the player can interact with the NPC
		options = {													-- Options shown when interacting (Maximum 6 options per NPC)
		{'Hello i have been told you know info on a train ans gold?', 'okokTalk:Train2', 'c'},		-- 'c' for client
		{'Sweet were is this meeting?', 'okokTalk:Train2p2', 'c'},		-- 'c' for client
			
		},
		jobs = {													-- Jobs that can interact with the NPC
			
		},
	},
	--[[
	-- This is the template to create new NPCs
	{
		npc = "",
		header = "",
		name = "",
		uiText = "",
		dialog = "",
		coordinates = vector3(0.0, 0.0, 0.0),
		heading = 0.0,
		camOffset = vector3(0.0, 0.0, 0.0),
		camRotation = vector3(0.0, 0.0, 0.0),
		interactionRange = 0,
		options = {
			{"", 'client:event', 'c'},
			{"", 'client:event', 'c'},
			{"", 'client:event', 'c'}, 
			{"", 'server:event', 's'}, 
			{"", 'server:event', 's'}, 
			{"", 'server:event', 's'}, 
		},
		jobs = {	-- Example jobs
			'police',
			'ambulance',
		},
	},
	]]--
}