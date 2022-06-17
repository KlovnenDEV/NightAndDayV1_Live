Hey there! Thanks for the Purchase.

Here is how to install the Vinscratch and make it work, if you can't make it work then make sure to make a ticket on our discord
    https://discord.gg/AS2Y8TWejt

First of, drag and drop all folders inside the [Dependencies] folder and ensure it. 
Also drop the mechshop into your folder if you wanna use that aswell

After that put qb-vinscratch inside a folder and ensure that aswell. 
Before starting the script MAKE sure to run the SQL so the Vinnumbers work. 

Once you've ensure everything and run the SQL then look through the Config.lua 

set it up to however you like it the most important is  
the Target and Wrapper options make sure to put it on whatever you have 
or it will not work! 

Put this into MS peds or whatever ped spawner you use

Look under Config and put the these coords into your ped spawner (Don't do this if using qb/berkie target)

Config.NathanielPosition = vector4(485.32, -3383.71, 6.07, 6.6)

Config.TurnInLocation = vector4(1512.7, -2132.53, 76.49, 0.34) 

Also change those if you wish to move location

The right order to start the dependencies in

ensure PolyZone
ensure polyzonehelper
ensure qb-target
ensure fjam-ui
ensure nh-context
ensure mhacking

Once again any issue or any question reach out on our discord!
https://discord.gg/AS2Y8TWejt



ADD this to your shared.lua
	['vinremover']                  = {['name'] = 'vinremover',                     ['label'] = 'Vin Remover',                 ['weight'] = 1500,         ['type'] = 'item',         ['image'] = 'screwdriverset.png',             ['unique'] = true,     ['useable'] = false,     ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = 'A gadget that can remove Vins...'},


Add this to your meta data under qb-core/server/player.lua 
add it around line 78 

    PlayerData.metadata['boostingrep'] = PlayerData.metadata['boostingrep'] or 0