resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "html/index.html"

files {
    'html/*',
}

client_scripts {
    'client/main.lua',
    'config.lua',
}

shared_scripts { 
	'@denalifw-core',
    '@denalifw-houserobbery/config.lua'
}

server_scripts {
    'server/main.lua',
    'config.lua'
}