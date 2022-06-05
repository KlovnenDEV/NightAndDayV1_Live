-- 8x Development | 8xdev.com | Prenses Baran | https://discord.gg/fandgwjNUm

fx_version 'adamant'

game 'gta5'

client_scripts {
	'NativeUI.lua',
	'Config.lua',
	'Client/*.lua'
}

server_scripts {
	'Config.lua',
	'@mysql-async/lib/MySQL.lua',
	'Server/*.lua'
}
