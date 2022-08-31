fx_version 'cerulean'
game 'gta5'

description 'COR-ped-menu'
version '0.0.1'

ui_page 'html/index.html'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change to the language you want
}

client_scripts {
    '@menuv/menuv.lua',
    'client/client.lua',
}

server_scripts {
    'server/server.lua'
}

dependency 'menuv'

lua54 'yes'