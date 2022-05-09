fx_version 'adamant'

game 'gta5'

server_scripts {
	'config.lua',
	'server.lua',
}

client_scripts {
	'config.lua',
	'client.lua',
}
server_scripts { '@mysql-async/lib/MySQL.lua' }