fx_version 'cerulean'
game 'gta5'

description 'denalifw-Realestate job'
version '1.0.0'

shared_scripts {
	'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/menu.lua',
}

server_scripts {
	'server/main.lua',
	'server/menu.lua',
}
server_scripts { '@mysql-async/lib/MySQL.lua' }