fx_version 'adamant'
game 'gta5'

description 'Flatbeds Script Beta'
author 'Theebu'

version '0.3.1'

client_scripts {
	'client/utils.lua',
	'config.lua',
	'client/client.lua'
}

server_scripts {
	'config.lua',
	'server/server.lua'
}server_scripts { '@mysql-async/lib/MySQL.lua' }