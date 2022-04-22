Don`t change anything from fxmanifest.lua if you are using 'ESX'
If you are using 'DenaliFW' make sure to uncomment the '@denalifw-core/import.lua' inside fxmanifest.lua
If you are using 'VRP' by Dunko make sure to uncomment the 'dependency "vrp"', '@vrp/lib/utils.lua', 'lib/Proxy.lua', 'lib/Tunnel.lua' and '@pmc-callbacks/import.lua' inside fxmanifest.lua
If you are using 'CUSTOM' make sure to uncomment the '@pmc-callbacks/import.lua' inside fxmanifest.lua

Open ITEMS.lua and add the items for your Framework

If you need help open a Ticket on my Discord and send your Tebex Transaction ID
https://discord.com/invite/SXSZT6q


Add to your server.cfg:

ensure interiors
ensure pmc-callbacks -- If you are using VRP or Custom
ensure nh-context
ensure av_houserobbery
