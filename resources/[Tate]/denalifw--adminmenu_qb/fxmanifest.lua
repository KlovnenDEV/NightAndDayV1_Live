fx_version 'cerulean'
game 'gta5'

author 'Mercy Collective (https://dsc.gg/denalifw-coll)'
description 'Admin Menu'

ui_page "nui/index.html"

shared_scripts {
    'shared/sh_config.lua',
    'locale.lua',
    'locales/en.lua', -- Change this to your desired language.
}

client_scripts {
    '@denalifw-core/shared/items.lua',
    '@denalifw-core/shared/jobs.lua',
    '@denalifw-core/shared/vehicles.lua',
    'client/**/cl_*.lua',
    'shared/sh_actions.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/**/sv_*.lua',
}

files {
    "nui/index.html",
    "nui/js/**.js",
    "nui/css/**.css",
    "nui/webfonts/*.css",
    "nui/webfonts/*.otf",
    "nui/webfonts/*.ttf",
    "nui/webfonts/*.woff2",
}

exports {
    'CreateLog'
}

server_exports {
    'CreateLog'
} 

dependencies {
    'oxmysql',
    'denalifw-core'
}

lua54 'yes'