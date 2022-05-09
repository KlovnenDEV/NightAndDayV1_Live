fx_version 'cerulean'
author 'marcinhu#0001'
Description 'VanillaJob'
game 'gta5'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/menu.css',
    'html/js/js.js',
}

shared_scripts { 
    "config.lua",
}

server_script { 
    "server/**.lua",
}

client_script {
    "client/**.lua",
}

escrow_ignore {
    "html/**",
    "images/**",
    "config.lua",
    "fxmanifest.lua",
    "README.lua",
}

lua54 'yes'
dependency '/assetpacks'