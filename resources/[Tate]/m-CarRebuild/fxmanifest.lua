fx_version 'cerulean'
game 'gta5'

author '! marcinhu.#6158'
Description 'm-LicensePlate'

shared_script 'config.lua'

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

escrow_ignore {
  "config.lua",
  "fxmanifest.lua",
  "README.lua",
}


lua54 'yes'

dependency '/assetpacks'