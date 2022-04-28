fx_version 'bodacious'
game 'gta5'
author 'nv-pets by NIGHT'
version '1.0.0'


dependencies {
    "PolyZone"
}

client_script {
    'client.lua',
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',

}

server_script {
    '@oxmysql/lib/MySQL.lua',
	'server.lua',
}

shared_script 'shared.lua'
