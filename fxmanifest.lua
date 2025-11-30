fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'
name 'ox_inventory'
author 'Overextended'
version '2.44.1'
repository 'https://github.com/overextended/ox_inventory'
description 'Slot-based inventory with item metadata support'

dependencies {
    '/server:6116',
    '/onesync',
    'oxmysql',
    'ox_lib',
}

shared_script '@ox_lib/init.lua'

ox_libs {
    'locale',
    'table',
    'math',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'init.lua'
}

client_script 'init.lua'

-- Custom NUI integration (optional - enable by adding to client_scripts)
-- client_script 'client/ox_nui_integration.lua'

ui_page 'web/build/index.html'

-- Alternative custom NUI (uncomment to use instead of default)
-- ui_page 'web/ui.html'

files {
    'client.lua',
    'config.lua',
    'server.lua',
    'locales/*.json',
    'web/build/index.html',
    'web/build/assets/*.js',
    'web/build/assets/*.css',
    'web/images/*.png',
    'modules/**/shared.lua',
    'modules/**/client.lua',
    'modules/bridge/**/client.lua',
    'data/*.lua',
    -- Custom NUI files
    'web/ui.html',
    'web/style.css',
    'web/script.js',
    'web/preview_inventory_red_blue_fixed.svg',
    'client/ox_nui_integration.lua',
}
