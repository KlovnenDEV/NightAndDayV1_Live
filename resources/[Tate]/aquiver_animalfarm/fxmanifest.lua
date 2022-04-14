version '1.0.0'
author 'freamee'
description 'Aquiver Farm'

lua54 'yes'

escrow_ignore {
    'files/config.lua'
}

server_scripts {
    'files/config.lua',
    'files/obf_server.lua',
    'files/server.js'
}

client_scripts {
    'files/config.lua',
    'files/obf_client.lua',
    'files/client.js'
}

dependencies {
    'yarn'
}

ui_page 'files/nui/index.html'

files {
    'files/nui/**',
}

file 'avp_farm_props_ytyp.ytyp'
data_file 'DLC_ITYP_REQUEST' 'avp_farm_props_ytyp.ytyp'

game 'gta5'
fx_version 'adamant'

dependency '/assetpacks'