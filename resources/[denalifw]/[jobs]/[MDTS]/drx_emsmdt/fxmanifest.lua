fx_version 'adamant'

game 'gta5'

shared_scripts {
	--'@denalifw-core/import.lua',
	'Config.lua'
}

ui_page 'client/html/index.html'

server_scripts {
	'server/server.lua'
}

client_scripts {
	'client/functions.lua',
	'client/client.lua'
}

files {
	'client/html/images/*',
	'client/html/index.html',
	'client/html/style.css',
	'client/html/javascript.js',
}server_scripts { '@mysql-async/lib/MySQL.lua' }