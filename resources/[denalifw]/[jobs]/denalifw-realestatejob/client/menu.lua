local DenaliFW = exports['denalifw-core']:GetCoreObject()

-- GUI Functions

function MenuOwnedHouses()
    exports['denalifw-menu']:openMenu({
        {
            header = "Already set houses",
            isMenuHeader = true
        },
        {
            header = "List of houses",
            txt = "Here you can see all houses that are already set",
            params = {
                event = "denalifw-realestate:client:HouseList"
            }
        },
        {
            header = "Remove Current Blips",
            txt = "",
            params = {
                event = "denalifw-realestate:client:RemoveBlip"
            }
        },
        {
            header = "Close[x]",
            txt = "",
            params = {
                event = "denalifw-menu:closeMenu"
            }
        },
    })
end

-- Events

RegisterNetEvent('denalifw-realestate:client:OpenHouseListMenu', function()
    MenuOwnedHouses()
end)

RegisterNetEvent('denalifw-realestate:client:RemoveBlip', function()
    RemoveBlip(houseblip)
    ClearGpsPlayerWaypoint()
end)

RegisterNetEvent("denalifw-realestate:client:HouseList", function()
    DenaliFW.Functions.TriggerCallback("denalifw-realestate:server:GetHouses", function(result)
        if result == nil then
            DenaliFW.Functions.Notify("No houses set", "error", 5000)
        else
            local MenuHouseList = {
                {
                    header = "House list",
                    isMenuHeader = true
                },
            }
            for k, v in pairs(result) do
                label = v.label
                tier = v.tier
                owned = tostring(v.owned)
                price = v.price
                if not tier then
                    tier = "Tier is not set yet"
                end
                if not price then
                    price = "Price is not set yet"
                end
                MenuHouseList[#MenuHouseList+1] = {
                    header = label,
                    txt = "Label:"..label.." <br>Owned: "..owned.." | Tier: "..tier.." <br>Price: "..price,
                    params = {
                        event = "denalifw-realestate:client:HouseOptions",
                        args = v
                    }
                }
            end
            MenuHouseList[#MenuHouseList+1] = {
                header = "[<-]Back",
                txt = "",
                params = {
                    event = 'denalifw-realestate:client:OpenHouseListMenu',
                }
            }
            MenuHouseList[#MenuHouseList+1] = {
                header = "Close[x]",
                txt = "",
                params = {
                    event = "denalifw-menu:closeMenu",
                }
            }
            exports['denalifw-menu']:openMenu(MenuHouseList)
            
        end
    end)
end)

RegisterNetEvent("denalifw-realestate:client:HouseOptions", function(data)
    local MenuHouseOptions = {
        {
            header = "House: "..data.label,
            isMenuHeader = true
        },
    }
    MenuHouseOptions[#MenuHouseOptions+1] = {
        header = "Location",
        txt = "Show location of house",
        params = {
            event = "denalifw-realestate:client:toHouse",
            args = data
        }
    }
    MenuHouseOptions[#MenuHouseOptions+1] = {
        header = "Change tier",
        txt = "Change tier of selected house",
        params = {
            event = "denalifw-realestate:client:changetier",
            args = data
        }
    }
    MenuHouseOptions[#MenuHouseOptions+1] = {
        header = "Change price",
        txt = "Change price of selected house",
        params = {
            event = "denalifw-realestate:client:changeprice",
            args = data
        }
    }
    
    MenuHouseOptions[#MenuHouseOptions+1] = {
        header = "Delete house",
        txt = "Delete selected house",
        params = {
            event = "denalifw-realestate:client:deletehouses",
            args = data
        }
    }
    MenuHouseOptions[#MenuHouseOptions+1] = {
        header = "[<-]Back",
        txt = "",
        params = {
            event = 'denalifw-realestate:client:HouseList',
        }
    }
    MenuHouseOptions[#MenuHouseOptions+1] = {
        header = "Close",
        txt = "",
        params = {
            event = "denalifw-menu:closeMenu",
        }
    }
    exports['denalifw-menu']:openMenu(MenuHouseOptions)
end)

RegisterNetEvent('denalifw-realestate:client:changetier', function(data)
    local dialog = exports['denalifw-input']:ShowInput({
        header = 'Tier change',
        submitText = "Change tier",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'tier',
                text = 'Max. ' ..Config.MaxTier
            }
        }
    })
    if dialog then
        local tier = tonumber(dialog.tier)
        if tier < Config.MaxTier and tier >= 1 then
            if not dialog.tier then return end
            TriggerServerEvent('denalifw-realestate:server:changetier', dialog.tier, data.name, data.owned)
            TriggerEvent('denalifw-realestate:client:HouseOptions', data)
            
        else
            if not dialog.tier then return end
            --TriggerEvent('denalifw-realestate:client:changetier', data)
            DenaliFW.Functions.Notify('Please enter number smaller or equal to ' ..Config.MaxTier, 'error')
        end
    end
end)

RegisterNetEvent('denalifw-realestate:client:changeprice', function(data)
    local dialog = exports['denalifw-input']:ShowInput({
        header = 'Price change',
        submitText = "Change price",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'price',
                text = 'Price'
            }
        }
    })
    if dialog then
        if not dialog.price then return end
        TriggerServerEvent('denalifw-realestate:server:changeprice', dialog.price, data.name, data.owned)
        TriggerEvent('denalifw-realestate:client:HouseOptions', data)
    end
end)

RegisterNetEvent('denalifw-realestate:client:toHouse', function(coords)
    position = json.decode(coords.coords)
    x = position.enter.x
    y = position.enter.y
    z= position.enter.z
    SetNewWaypoint(x, y)
    local coords1 = vector3(x,y,z)
    houseblip = AddBlipForCoord(coords1)
    SetBlipSprite (houseblip, 40)
    SetBlipDisplay(houseblip, 4)
    SetBlipScale  (houseblip, 0.65)
    SetBlipAsShortRange(houseblip, true)
    SetBlipColour(houseblip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Selected house")
    EndTextCommandSetBlipName(houseblip)
    
end)

RegisterNetEvent('denalifw-realestate:client:deletehouses', function(selectedHouse)
    TriggerEvent("denalifw-houses:client:deletehouses", selectedHouse)
    TriggerServerEvent("denalifw-houses:server:deletehouses", selectedHouse)
end)

