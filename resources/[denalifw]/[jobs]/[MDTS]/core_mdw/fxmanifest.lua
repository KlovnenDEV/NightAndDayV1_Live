
fx_version 'adamant'

game 'gta5'

ui_page 'html/form.html'

lua54 'yes'

files {
	'html/form.html',
	'html/css.css',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
	'html/img/*.svg',
	'html/img/badges/*.png',
}

shared_scripts {
  --  '@denalifw-core/import.lua',
    'config.lua'
}

client_scripts{
    'client/main.lua',
}

server_scripts{
    'server/main.lua',
}