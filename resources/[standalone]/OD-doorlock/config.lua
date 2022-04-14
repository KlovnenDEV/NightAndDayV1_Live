Config = {}
Config.ShowUnlockedText = true
Config.CheckVersion = true
Config.CheckVersionDelay = 60 -- Minutes


Config.DoorList = {
------------------------------------------
--	        JCEE TUNER SHOP 		    --
------------------------------------------
--[[
-------- NORMAL DOOR
	{	
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,	
		doors = {
			{objHash = -2023754432, objHeading = 270.00003051758, objCoords = vector3(154.9345, -3017.323, 7.190679)},
		
		},
		lockpick = false,
		audioRemote = false,
		garage = false,
		slides = false,
		fixText = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
	},
------------- Garage door right (from outside)	
	{	
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 10.0,	
		doors = {
			{objHash = -456733639, objHeading = 89.999961853027, objCoords = vector3(154.8095, -3023.889, 8.503336)},
		
		},
		lockpick = false,
		--audioRemote = false,
		--garage = false,
		--slides = false,
		--fixText = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
	},
-- Garage door left (from outside)	
	{	
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,	
		doors = {
			{objHash = -456733639, objHeading = 89.999961853027, objCoords = vector3(154.8095, -3034.051, 8.503336)},
		
		},
		lockpick = false,
		--audioRemote = false,
		--garage = false,
		--slides = false,
		--fixText = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
	},
-- EMPLOYEES ROOM
	{	
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,	
		doors = {
			{objHash = -1229046235, objHeading = 89.999977111816, objCoords = vector3(151.4668, -3011.705, 7.258367)},
		
		},
		lockpick = false,
		--audioRemote = false,
		--garage = false,
		--slides = false,
		--fixText = true,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
	}, --]]













------------------------------------------
--	MISSION ROW POLICE DEPARTMENT		--
------------------------------------------
	-- gabz_mrpd	FRONT DOORS
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = false,
		maxDistance = 2.0,
		doors = {
			{objHash = -1547307588, objHeading = 90.0, objCoords = vector3(434.7444, -983.0781, 30.8153)},
			{objHash = -1547307588, objHeading = 270.0, objCoords = vector3(434.7444, -980.7556, 30.8153)}
		},
		lockpick = true
	},
	
	-- gabz_mrpd	NORTH DOORS
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -1547307588, objHeading = 180.0, objCoords = vector3(458.2087, -972.2543, 30.8153)},
			{objHash = -1547307588, objHeading = 0.0, objCoords = vector3(455.8862, -972.2543, 30.8153)}
		},
		
	},

	-- gabz_mrpd	SOUTH DOORS
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -1547307588, objHeading = 0.0, objCoords = vector3(440.7392, -998.7462, 30.8153)},
			{objHash = -1547307588, objHeading = 180.0, objCoords = vector3(443.0618, -998.7462, 30.8153)}
		},
		
	},

	-- gabz_mrpd	LOBBY LEFT


	{
		authorizedJobs = {['police']=0},
		objHash = -1406685646,
		objHeading = 0.0,
		objCoords = vector3(441.13, -977.93, 30.82319),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},

	-- gabz_mrpd	LOBBY RIGHT
	{
		objHash = -96679321,
		objHeading = 180.0,
		objCoords = vector3(440.5201, -986.2335, 30.82319),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
	},

	-- gabz_mrpd	GARAGE ENTRANCE 1
	{
		objHash = 1830360419,
		objHeading = 269.78,
		objCoords = vector3(464.1591, -974.6656, 26.3707),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	GARAGE ENTRANCE 2
	{
		objHash = 1830360419,
		objHeading = 89.87,
		objCoords = vector3(464.1566, -997.5093, 26.3707),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},
	
	-- gabz_mrpd	GARAGE ROLLER DOOR 1
	{
		objHash = 2130672747,
		objHeading = 0.0,
		objCoords = vector3(431.4119, -1000.772, 26.69661),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 6,
		garage = true,
		slides = true,
		audioRemote = true
	},
	
	-- gabz_mrpd	GARAGE ROLLER DOOR 2
	{
		objHash = 2130672747,
		objHeading = 0.0,
		objCoords = vector3(452.3005, -1000.772, 26.69661),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 6,
		garage = true,
		slides = true,
		audioRemote = true
	},
	
	-- gabz_mrpd	BACK GATE
	{
		objHash = -1603817716,
		objHeading = 90.0,
		objCoords = vector3(488.8948, -1017.212, 27.14935),
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 6,
		slides = true,
		audioRemote = true
	},

	-- gabz_mrpd	BACK DOORS
	{
		authorizedJobs = { ['police']=0, ['offpolice']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -692649124, objHeading = 0.0, objCoords = vector3(467.3686, -1014.406, 26.48382)},
			{objHash = -692649124, objHeading = 180.0, objCoords = vector3(469.7743, -1014.406, 26.48382)}
		},
		
	},

	-- gabz_mrpd	MUGSHOT
	{
		objHash = -1406685646,
		objHeading = 180.0,
		objCoords = vector3(475.9539, -1010.819, 26.40639),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
	},

	-- gabz_mrpd	CELL ENTRANCE 1
	{
		objHash = -53345114,
		objHeading = 270.0,
		objCoords = vector3(476.6157, -1008.875, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL ENTRANCE 2
	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(481.0084, -1004.118, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 1
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(477.9126, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 2
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(480.9128, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 3
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(483.9127, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 4
	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(486.9131, -1012.189, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	CELL 5
	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(484.1764, -1007.734, 26.48005),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.35},
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}
	},

	-- gabz_mrpd	LINEUP
	{
		objHash = -288803980,
		objHeading = 90.0,
		objCoords = vector3(479.06, -1003.173, 26.4065),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	OBSERVATION I
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6694, -983.9868, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	INTERROGATION I
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6701, -987.5792, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	OBSERVATION II
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6699, -992.2991, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	INTERROGATION II
	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6703, -995.7285, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	EVIDENCE
	{
		objHash = -692649124,
		objHeading = 134.7,
		objCoords = vector3(475.8323, -990.4839, 26.40548),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	ARMOURY 1
	{
		objHash = -692649124,
		objHeading = 90.0,
		objCoords = vector3(479.7507, -999.629, 30.78927),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	ARMOURY 2
	{
		objHash = -692649124,
		objHeading = 181.28,
		objCoords = vector3(487.4378, -1000.189, 30.78697),
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		fixText = true
	},

	-- gabz_mrpd	SHOOTING RANGE
	{
		authorizedJobs = { ['police']=0 },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -692649124, objHeading = 0.0, objCoords = vector3(485.6133, -1002.902, 30.78697)},
			{objHash = -692649124, objHeading = 180.0, objCoords = vector3(488.0184, -1002.902, 30.78697)}
		},
		
	},

	-- gabz_mrpd	ROOFTOP
	{
		objCoords = vector3(464.3086, -984.5284, 43.77124),
		authorizedJobs = { ['police']=0 },
		objHeading = 90.000465393066,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = -692649124,
		locked = true,
		fixText = true,
	},
	{
		objCoords = vector3(1757.15, 2475.36, 45.74),
		authorizedJobs = { ['police']=0 },
		objHeading = 215,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = 913760512,
		locked = true,
		fixText = true,
	},
	{
		objCoords = vector3(1760.42, 2477.25, 45.74),
		authorizedJobs = { ['police']=0 },
		objHeading = 212.92,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = 913760512,
		locked = true,
		fixText = true,
	},
	{
		objCoords = vector3(1763.56, 2479.07, 45.74),
		authorizedJobs = { ['police']=0 },
		objHeading = 212.14,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = 913760512,
		locked = true,
		fixText = true,
	},
	{
		objCoords = vector3(1791.25, 2552.1, 45.67),
		authorizedJobs = { ['police']=0 },
		objHeading = 272.1,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = 1373390714,
		locked = false,
		fixText = true,
	},
	{
		objCoords = vector3(1797.21, 2591.3, 45.75),
		authorizedJobs = { ['police']=0 },
		objHeading = 0.75,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = -1373390714,
		locked = false,
		fixText = true,
	},
	{
		objCoords = vector3(1796.71, 2596.7, 45.69),
		authorizedJobs = { ['police']=0 },
		objHeading = 342.31,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = -1156020871,
		locked = true,
		fixText = true,
	},
	{
		objCoords = vector3(1844.89, 2608.01, 45.59),
		authorizedJobs = { ['police']=0 },
		objHeading = 91.46,
		slides = true,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = 741314661,
		locked = true,
		fixText = true,
	},
	{
		objCoords = vector3(1818.21, 2607.71, 45.59),
		authorizedJobs = { ['police']=0 },
		objHeading = 269.23,
		slides = true,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = 741314661,
		locked = true,
		fixText = true,
	},
	{
		objCoords = vector3(1795.89, 2617.12, 45.57),
		authorizedJobs = { ['police']=0 },
		objHeading = 11.28,
		slides = true,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = 741314661,
		locked = true,
		fixText = true,
	},
	{
		objCoords = vector3(1818.68, 2594.36, 45.72),
		authorizedJobs = { ['police']=0 },
		objHeading = 268.71,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = 1373390714,
		locked = false,
		fixText = true,
	},
	{
		objCoords = vector3(1830.89, 2594.26, 46.01),
		authorizedJobs = { ['police']=0 },
		objHeading = 267.85,
		slides = false,
		lockpick = false,
		audioRemote = false,
		maxDistance = 2.0,
		garage = false,
		objHash = -684929024,
		locked = true,
		fixText = true,
	},
	{
		authorizedJobs = { ['police']=0, },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -487908756, objHeading = 75.54, objCoords = vector3(299.88, -584.77, 43.28)},
			{objHash = 661758796, objHeading = 75.54, objCoords = vector3(299.88, -584.77, 43.28)}
		},
		-----omega 

		{
			objCoords = vector3(164.61, -981.85, 30.18),
			authorizedJobs = { ['police']=0 },
			objHeading = 116.21,
			slides = false,
			lockpick = false,
			audioRemote = false,
			maxDistance = 2.0,
			garage = false,
			objHash = 1888438146,
			locked = true,
			fixText = true,
		},
		{
			objCoords = vector3(165.03, -982.24, 30.18),
			authorizedJobs = { ['police']=0 },
			objHeading = 164.97,
			slides = false,
			lockpick = false,
			audioRemote = false,
			maxDistance = 2.0,
			garage = false,
			objHash = 1888438146,
			locked = true,
			fixText = true,
		},
		------- FIGHTING
		{
			objHash = 1531355165,
			objHeading = 181.28,
			objCoords = vector3(1062.5, -2406.95, 30.0),
			authorizedJobs = { ['jcee']=0 },
			locked = true,
			maxDistance = 2.0,
			fixText = true
		},
	
		
		
	},



}


-- Bahamamamas
table.insert(Config.DoorList, {
	lockpick = false,
	doors = {
		{objHash = -131296141, objHeading = 32.995494842529, objCoords = vector3(-1387.026, -586.6138, 30.49563)},
		{objHash = -131296141, objHeading = 213.28588867188, objCoords = vector3(-1389.212, -588.0406, 30.49132)}
 },
	slides = false,
	audioRemote = false,
	authorizedJobs = { ['jcee']=0 },
	locked = true,
	maxDistance = 2.5,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- manor
table.insert(Config.DoorList, {
	slides = false,
	maxDistance = 2.0,
	locked = true,
	authorizedJobs = { ['jcee']=0 },
	lockpick = false,
	fixText = false,
	objHeading = 0.0,
	audioRemote = false,
	garage = false,
	items = { 'sandwich' },
	objCoords = vector3(-1805.531, 436.0291, 128.699),
	objHash = 2074032093,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- manor2
table.insert(Config.DoorList, {
	slides = false,
	maxDistance = 2.0,
	locked = true,
	authorizedJobs = { ['jcee']=0 },
	lockpick = false,
	fixText = false,
	objHeading = 0.0,
	audioRemote = false,
	garage = false,
	items = { 'sandwich' },
	objCoords = vector3(-1805.361, 429.1229, 128.4958),
	objHash = 1826999110,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- manor3
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHash = -1320503032,
	fixText = false,
	objHeading = 180.00001525879,
	audioRemote = false,
	garage = false,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['jcee']=0 },
	locked = true,
	objCoords = vector3(-1819.664, 439.9743, 132.4672),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- playboy1
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHash = -1563640173,
	fixText = false,
	objHeading = 316.63739013672,
	audioRemote = false,
	garage = false,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['jcee']=0 },
	locked = true,
	objCoords = vector3(-1523.062, 143.6533, 55.80905),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- playboy3
table.insert(Config.DoorList, {
	maxDistance = 2.0,
	objHash = -1859471240,
	fixText = false,
	objHeading = 9.4999742507935,
	audioRemote = false,
	garage = false,
	lockpick = false,
	slides = false,
	authorizedJobs = { ['jcee']=0 },
	locked = true,
	objCoords = vector3(-1462.425, 65.71588, 53.38676),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHash = -1033001619,
	authorizedJobs = { ['police']=0 },
	locked = true,
	maxDistance = 2.0,
	objCoords = vector3(1826.466, 2585.271, 46.09929),
	garage = false,
	objHeading = 89.890563964844,
	slides = false,
	audioRemote = false,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHash = -1033001619,
	authorizedJobs = { ['police']=0 },
	locked = true,
	maxDistance = 2.0,
	objCoords = vector3(1827.365, 2587.547, 46.09929),
	garage = false,
	objHeading = 359.62673950195,
	slides = false,
	audioRemote = false,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHash = -1033001619,
	authorizedJobs = { ['police']=0 },
	locked = true,
	maxDistance = 2.0,
	objCoords = vector3(1819.129, 2593.64, 46.09929),
	garage = false,
	objHeading = 89.890563964844,
	slides = false,
	audioRemote = false,
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 299.6628112793,
	slides = false,
	objCoords = vector3(1844.264, 3694.152, 34.41656),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -519068795,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 209.07217407227,
	slides = false,
	objCoords = vector3(1849.4, 3691.206, 34.41842),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 28.971311569214,
	slides = false,
	objCoords = vector3(1847.133, 3689.946, 34.41842),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 300.0,
	slides = false,
	objCoords = vector3(1860.898, 3691.643, 30.40922),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = 631614199,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 300.0,
	slides = false,
	objCoords = vector3(1858.998, 3694.937, 30.40922),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = 631614199,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 300.0,
	slides = false,
	objCoords = vector3(1862.763, 3688.414, 30.40922),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = 631614199,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 299.99990844727,
	slides = false,
	objCoords = vector3(1859.697, 3686.644, 30.40922),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = 631614199,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 29.874876022339,
	slides = false,
	objCoords = vector3(1852.921, 3686.407, 30.41389),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = 749848321,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 30.068523406982,
	slides = false,
	objCoords = vector3(1846.414, 3682.625, 34.41827),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 210.19721984863,
	slides = false,
	objCoords = vector3(1848.657, 3683.925, 34.42036),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 209.07217407227,
	slides = false,
	objCoords = vector3(1857.254, 3690.296, 34.41842),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 314.99993896484,
	slides = false,
	objCoords = vector3(-447.2363, 6002.317, 31.84003),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 135.00007629395,
	slides = false,
	objCoords = vector3(-450.9664, 6006.086, 31.99004),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 315.01037597656,
	slides = false,
	objCoords = vector3(-449.5656, 6008.538, 31.86523),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 135.00007629395,
	slides = false,
	objCoords = vector3(-447.7283, 6006.702, 31.86523),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 225.06103515625,
	slides = false,
	objCoords = vector3(-441.0185, 6012.795, 31.86523),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 44.84232711792,
	slides = false,
	objCoords = vector3(-442.8578, 6010.958, 31.86523),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	fixText = false,
	objHeading = 315.22174072266,
	slides = false,
	objCoords = vector3(-450.7136, 6016.371, 31.86523),
	maxDistance = 2.0,
	garage = false,
	locked = true,
	lockpick = false,
	audioRemote = false,
	objHash = -2023754432,
	authorizedJobs = { ['police']=0 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objHash = -550347177,
	locked = true,
	maxDistance = 6.0,
	garage = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = { ['mechanic']=0 },
	fixText = false,
	slides = 6.0,
	objCoords = vector3(-356.0905, -134.7714, 40.01295),
	objHeading = 249.99995422363,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	lockpick = false,
	items = { 'key_fbi' },
	locked = true,
	audioRemote = false,
	maxDistance = 6.0,
	slides = true,
	doors = {
		{objHash = -1225363909, objHeading = 339.99993896484, objCoords = vector3(134.9403, -762.9027, 44.75291)},
		{objHash = 1219957182, objHeading = 339.99993896484, objCoords = vector3(136.3498, -763.4158, 44.75182)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	lockpick = false,
	items = { 'key_fib' },
	locked = true,
	audioRemote = false,
	maxDistance = 2.5,
	slides = false,
	doors = {
		{objHash = -1517873911, objHeading = 78.216918945313, objCoords = vector3(106.3793, -742.6982, 46.18171)},
		{objHash = -90456267, objHeading = 84.050018310547, objCoords = vector3(105.7607, -746.646, 46.18266)}
 },		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	authorizedJobs = { ['mechanic']=0 },
	objCoords = vector3(-949.505, -1474.209, 8.156317),
	objHeading = 110.34433746338,
	objHash = -292728657,
	maxDistance = 2.0,
	audioRemote = false,
	fixText = false,
	items = { 'housekey_1' },
	garage = false,
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	authorizedJobs = { ['mechanic']=0 },
	objCoords = vector3(-948.1393, -1477.893, 8.156317),
	objHeading = 110.34433746338,
	objHash = -1653461382,
	maxDistance = 2.0,
	audioRemote = false,
	fixText = false,
	items = { 'housekey_1' },
	garage = false,
	locked = true,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	items = { 'housekey_1' },
	authorizedJobs = { ['mechanic']=0 },
	doors = {
		{objHash = 1888438146, objHeading = 20.104608535767, objCoords = vector3(-900.4246, -1449.613, 7.798107)},
		{objHash = 272205552, objHeading = 20.104608535767, objCoords = vector3(-898.5968, -1448.942, 7.798107)}
 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	items = { 'housekey_1' },
	authorizedJobs = { ['mechanic']=0 },
	doors = {
		{objHash = 827574885, objHeading = 109.95893859863, objCoords = vector3(-874.1503, -1459.374, 7.719718)},
		{objHash = -725970636, objHeading = 110.79489898682, objCoords = vector3(-873.3333, -1461.531, 7.713996)}
 },
	slides = false,
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0, ['doctor']=0 },
	locked = true,
	doors = {
		{objHash = -434783486, objHeading = 340.00003051758, objCoords = vector3(312.0051, -571.3412, 43.43391)},
		{objHash = -1700911976, objHeading = 340.00003051758, objCoords = vector3(314.4241, -572.2216, 43.43391)}
 },
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0, ['doctor']=0 },
	locked = true,
	doors = {
		{objHash = -1700911976, objHeading = 340.00003051758, objCoords = vector3(320.2615, -574.3463, 43.43391)},
		{objHash = -434783486, objHeading = 340.00003051758, objCoords = vector3(317.8426, -573.4659, 43.43391)}
 },
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0, ['doctor']=0 },
	locked = true,
	doors = {
		{objHash = -1700911976, objHeading = 340.00003051758, objCoords = vector3(325.6565, -576.3099, 43.43391)},
		{objHash = -434783486, objHeading = 340.00003051758, objCoords = vector3(323.2375, -575.4294, 43.43391)}
 },
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0, ['doctor']=0 },
	locked = true,
	doors = {
		{objHash = -1700911976, objHeading = 340.00003051758, objCoords = vector3(326.655, -590.1066, 43.43391)},
		{objHash = -434783486, objHeading = 340.00003051758, objCoords = vector3(324.236, -589.2262, 43.43391)}
 },
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	slides = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0, ['doctor']=0 },
	locked = true,
	doors = {
		{objHash = -1700911976, objHeading = 249.98275756836, objCoords = vector3(325.6695, -580.4596, 43.43391)},
		{objHash = -434783486, objHeading = 249.98275756836, objCoords = vector3(326.5499, -578.0406, 43.43391)}
 },
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	garage = false,
	authorizedJobs = { ['police']=0, ['ambulance']=0, ['doctor']=0 },
	audioRemote = false,
	slides = false,
	objCoords = vector3(309.1337, -597.7515, 43.43391),
	locked = true,
	objHeading = 160.00003051758,
	objHash = 854291622,
	lockpick = false,
	maxDistance = 2.0,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	objCoords = vector3(0, 0, 0),
	authorizedJobs = { ['police']=0 },
	slides = false,
	fixText = false,
	audioRemote = false,
	lockpick = false,
	objHash = -1519439119,
	garage = false,
	objHeading = 0.0,
	locked = true,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 0.0,
	authorizedJobs = { ['police']=0 },
	lockpick = false,
	fixText = false,
	objCoords = vector3(0, 0, 0),
	objHash = 536071214,
	maxDistance = 2.0,
	garage = false,
	audioRemote = false,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 119.99998474121,
	authorizedJobs = { ['police']=0, ['doj']=0 },
	lockpick = false,
	fixText = false,
	objCoords = vector3(-510.8223, -203.0728, 34.4023),
	objHash = -519068795,
	maxDistance = 2.0,
	garage = false,
	audioRemote = false,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	doors = {
		{objHash = 605731446, objHeading = 299.99996948242, objCoords = vector3(-507.1621, -198.9598, 34.40414)},
		{objHash = 605731446, objHeading = 119.99998474121, objCoords = vector3(-506.0826, -200.8349, 34.40414)}
 },
	lockpick = false,
	maxDistance = 2.5,
	audioRemote = false,
	authorizedJobs = { ['police']=0, ['doj']=0 },
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 119.99998474121,
	authorizedJobs = { ['doj']=0 },
	lockpick = false,
	fixText = false,
	objCoords = vector3(-516.5076, -193.0843, 38.34237),
	objHash = 110411286,
	maxDistance = 2.0,
	garage = false,
	audioRemote = false,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objHeading = 29.999996185303,
	authorizedJobs = { ['doj']=0 },
	lockpick = false,
	fixText = false,
	objCoords = vector3(-566.0358, -200.2471, 38.34028),
	objHash = 110411286,
	maxDistance = 2.0,
	garage = false,
	audioRemote = false,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	lockpick = false,
	audioRemote = false,
	slides = false,
	locked = true,
	garage = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	maxDistance = 2.0,
	objHeading = 29.072120666504,
	objHash = 1339364336,
	objCoords = vector3(-525.7941, -171.9154, 42.30112),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	objCoords = vector3(-171.9163, 319.8886, 93.95206),
	slides = false,
	garage = false,
	authorizedJobs = { ['rooster']=0 },
	objHash = 1971752884,
	lockpick = false,
	audioRemote = false,
	fixText = false,
	objHeading = 91.14599609375,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	objHash = 1971752884,
	slides = false,
	objHeading = 179.99998474121,
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['rooster']=0 },
	objCoords = vector3(-172.4333, 305.4966, 93.94406),
	audioRemote = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	objHash = 1971752884,
	slides = false,
	objHeading = 179.99998474121,
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['rooster']=0 },
	objCoords = vector3(-161.6333, 328.1256, 93.95406),
	audioRemote = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	objHash = 1971752884,
	slides = false,
	objHeading = 179.99998474121,
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['rooster']=0 },
	objCoords = vector3(-161.6333, 334.0026, 93.95406),
	audioRemote = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	objHash = 1971752884,
	slides = false,
	objHeading = 179.99998474121,
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['rooster']=0 },
	objCoords = vector3(-167.2193, 328.1256, 93.95406),
	audioRemote = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	objHash = 1971752884,
	slides = false,
	objHeading = 179.99998474121,
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['rooster']=0 },
	objCoords = vector3(-167.2193, 334.0026, 93.95406),
	audioRemote = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	objHash = 1971752884,
	slides = false,
	objHeading = 179.99998474121,
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['rooster']=0 },
	objCoords = vector3(-172.7913, 328.1256, 93.95406),
	audioRemote = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	objHash = 1971752884,
	slides = false,
	objHeading = 179.99998474121,
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['rooster']=0 },
	objCoords = vector3(-172.7913, 334.0026, 93.95406),
	audioRemote = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})

-- 
table.insert(Config.DoorList, {
	locked = true,
	garage = false,
	objHash = 1971752884,
	slides = false,
	objHeading = 179.99998474121,
	lockpick = false,
	maxDistance = 2.0,
	authorizedJobs = { ['rooster']=0 },
	objCoords = vector3(-178.3783, 306.7906, 97.62706),
	audioRemote = false,
	fixText = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
})