fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

author 'Dietrich | TWH-Scripts' -- https://discord.gg/8KwVa7NYKW
description 'Job duty system'

client_scripts {
  'config.lua',
  'client.lua'
}

server_scripts {
  'config.lua',
  'server.lua'
}

escrow_ignore {
  'client.lua',
  'config.lua',
  'server.lua'
}
