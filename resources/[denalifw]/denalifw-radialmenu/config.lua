Config = {}

Config.MenuItems = {
    [1] = {
        id = 'citizen',
        title = 'Citizen',
        icon = 'user',
        items = {
            {
                id = 'givenum',
                title = 'Give Contact Details',
                icon = 'address-book',
                type = 'client',
                event = 'denalifw-phone:client:GiveContactDetails',
                shouldClose = true
            }, {
                id = 'radio11',
                title = 'FAA #11',
                type = 'client',
                event = 'denalifw-radialmenu:client:enter:radio11',
                shouldClose = true
            },
            {
                id = 'togglehotdogsell',
                title = 'Hotdog Selling',
                icon = 'hotdog',
                type = 'client',
                event = 'denalifw-hotdogjob:client:ToggleSell',
                shouldClose = true
            }, {
                id = 'interactions',
                title = 'Interaction',
                icon = 'exclamation-triangle',
                items = {
                    {
                        id = 'handcuff',
                        title = 'Cuff',
                        icon = 'user-lock',
                        type = 'client',
                        event = 'police:client:CuffPlayerSoft',
                        shouldClose = true
                    }, {
                        id = 'playerinvehicle',
                        title = 'Put In Vehicle',
                        icon = 'car-side',
                        type = 'client',
                        event = 'police:client:PutPlayerInVehicle',
                        shouldClose = true
                    }, {
                        id = 'playeroutvehicle',
                        title = 'Take Out Of Vehicle',
                        icon = 'car-side',
                        type = 'client',
                        event = 'police:client:SetPlayerOutVehicle',
                        shouldClose = true
                    }, {
                        id = 'stealplayer',
                        title = 'Rob',
                        icon = 'mask',
                        type = 'client',
                        event = 'police:client:RobPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort',
                        title = 'Kidnap',
                        icon = 'user-friends',
                        type = 'client',
                        event = 'police:client:KidnapPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort2',
                        title = 'Escort',
                        icon = 'user-friends',
                        type = 'client',
                        event = 'police:client:EscortPlayer',
                        shouldClose = true
                    }, {
                        id = 'escort554',
                        title = 'Hostage',
                        icon = 'child',
                        type = 'client',
                        event = 'A5:Client:TakeHostage',
                        shouldClose = true
                    }
                }
            }
        }
    },
    [2] = {
        id = 'general',
        title = 'General',
        icon = 'list-alt',
        items = {
            {
                id = 'help1',
                title = 'Help',
                icon = 'reddit-alien',
                items = {
                    {
                        id = 'help',
                        title = 'Help',
                                icon = 'reddit-alien',
                                type = 'client',
                                event = 'rgz_help:start',
                                shouldClose = true,
                    }
                }
                },

            {
                id = 'house',
                title = 'House Interaction',
                icon = 'home',
                items = {
                    {
                        id = 'givehousekey',
                        title = 'Give House Keys',
                        icon = 'key',
                        type = 'client',
                        event = 'denalifw-houses:client:giveHouseKey',
                        shouldClose = true,
                        items = {}
                    }, {
                        id = 'removehousekey',
                        title = 'Remove House Keys',
                        icon = 'key',
                        type = 'client',
                        event = 'denalifw-houses:client:removeHouseKey',
                        shouldClose = true,
                        items = {}
                    }, {
                        id = 'togglelock',
                        title = 'Toggle Doorlock',
                        icon = 'door-closed',
                        type = 'client',
                        event = 'denalifw-houses:client:toggleDoorlock',
                        shouldClose = true
                    }, {
                        id = 'decoratehouse',
                        title = 'Decorate House',
                        icon = 'boxes',
                        type = 'client',
                        event = 'denalifw-houses:client:decorate',
                        shouldClose = true
                    }, {
                        id = 'houseLocations',
                        title = 'Interaction Locations',
                        icon = 'home',
                        items = {
                            {
                                id = 'setstash',
                                title = 'Set Stash',
                                icon = 'box-open',
                                type = 'client',
                                event = 'denalifw-houses:client:setLocation',
                                shouldClose = true
                            }, {
                                id = 'setoutift',
                                title = 'Set Wardrobe',
                                icon = 'tshirt',
                                type = 'client',
                                event = 'denalifw-houses:client:setLocation',
                                shouldClose = true
                            }, {
                                id = 'setlogout',
                                title = 'Set Logout',
                                icon = 'door-open',
                                type = 'client',
                                event = 'denalifw-houses:client:setLocation',
                                shouldClose = true
                            }
                        }
                    }
                }
            }, {
                id = 'walking-style2',
                title = 'Walking Styles',
                icon = 'walking',
                items = {
                    {
                        id = 'walk1',
                        title = 'Arrogant',
                        icon = 'meh-rolling-eyes',
                        type = 'client',
                        event = 'denalifw-walkstyles:arrogant',
                        shouldClose = true,
                        items = {}
                    },
                    {
                        id = 'walk2',
                        title = 'Casual',
                        icon = 'meh-blank',
                        type = 'client',
                        event = 'denalifw-walkstyles:casual',
                        shouldClose = true,
                        items = {}
                    },
                    {
                        id = 'walk3',
                        title = 'Casual 2',
                        icon = 'meh-blank',
                        type = 'client',
                        event = 'denalifw-walkstyles:casual2',
                        shouldClose = true,
                        items = {}
                    },
                    {
                        id = 'walk4',
                        title = 'Casual 3',
                        icon = 'meh-blank',
                        type = 'client',
                        event = 'denalifw-walkstyles:casual3',
                        shouldClose = true,
                        items = {}
                    },
                    {
                        id = 'walk5',
                        title = 'Casual 4',
                        icon = 'meh-blank',
                        type = 'client',
                        event = 'denalifw-walkstyles:casual4',
                        shouldClose = true,
                        items = {}
                    },
                    {
                        id = 'walk6',
                        title = 'Casual 5',
                        icon = 'meh-blank',
                        type = 'client',
                        event = 'denalifw-walkstyles:casual5',
                        shouldClose = true,
                        items = {}
                    },
                    {
                        id = 'walk7',
                        title = 'Casual 6',
                        icon = 'meh-blank',
                        type = 'client',
                        event = 'denalifw-walkstyles:casual6',
                        shouldClose = true,
                        items = {}
                    },
                    {
                        id = 'walk8',
                        title = 'Confident',
                        icon = 'grin-wink',
                        type = 'client',
                        event = 'denalifw-walkstyles:confident',
                        shouldClose = true,
                        items = {}
                    },
                    {
                        id = 'walking-style3',
                        title = 'More...',
                        icon = 'ellipsis-h',
                        items = {
                            {
                                id = 'walk9',
                                title = 'Business',
                                icon = 'briefcase',
                                type = 'client',
                                event = 'denalifw-walkstyles:business',
                                shouldClose = true,
                                items = {}
                            },
                            {
                                id = 'walk10',
                                title = 'Business 2',
                                icon = 'briefcase',
                                type = 'client',
                                event = 'denalifw-walkstyles:business2',
                                shouldClose = true,
                                items = {}
                            },
                            {
                                id = 'walk11',
                                title = 'Business 3',
                                icon = 'briefcase',
                                type = 'client',
                                event = 'denalifw-walkstyles:business3',
                                shouldClose = true,
                                items = {}
                            },
                            {
                                id = 'walk12',
                                title = 'Femme',
                                icon = 'female',
                                type = 'client',
                                event = 'denalifw-walkstyles:femme',
                                shouldClose = true,
                                items = {}
                            },
                            {
                                id = 'walk13',
                                title = 'Flee',
                                icon = 'ghost',
                                type = 'client',
                                event = 'denalifw-walkstyles:flee',
                                shouldClose = true,
                                items = {}
                            },
                            {
                                id = 'walk14',
                                title = 'Gangster',
                                icon = 'dollar-sign',
                                type = 'client',
                                event = 'denalifw-walkstyles:gangster',
                                shouldClose = true,
                                items = {}
                            },
                            {
                                id = 'walk15',
                                title = 'Gangster 2',
                                icon = 'dollar-sign',
                                type = 'client',
                                event = 'denalifw-walkstyles:gangster2',
                                shouldClose = true,
                                items = {}
                            },
                            {
                                id = 'walk16',
                                title = 'Gangster 3',
                                icon = 'dollar-sign',
                                type = 'client',
                                event = 'denalifw-walkstyles:gangster3',
                                shouldClose = true,
                                items = {}
                            },
                            {
                                id = 'walking-style4',
                                title = 'More...',
                                icon = 'ellipsis-h',
                                items = {
                                    {
                                        id = 'walk17',
                                        title = 'Gangster 4',
                                        icon = 'dollar-sign',
                                        type = 'client',
                                        event = 'denalifw-walkstyles:gangster4',
                                        shouldClose = true,
                                        items = {}
                                    },
                                    {
                                        id = 'walk18',
                                        title = 'Gangster 5',
                                        icon = 'dollar-sign',
                                        type = 'client',
                                        event = 'denalifw-walkstyles:gangster5',
                                        shouldClose = true,
                                        items = {}
                                    },
                                    {
                                        id = 'walk19',
                                        title = 'Heels',
                                        icon = 'female',
                                        type = 'client',
                                        event = 'denalifw-walkstyles:heels',
                                        shouldClose = true,
                                        items = {}
                                    },
                                    {
                                        id = 'walk20',
                                        title = 'Heels 2',
                                        icon = 'female',
                                        type = 'client',
                                        event = 'denalifw-walkstyles:heels2',
                                        shouldClose = true,
                                        items = {}
                                    },
                                    {
                                        id = 'walk21',
                                        title = 'Hiking',
                                        icon = 'hiking',
                                        type = 'client',
                                        event = 'denalifw-walkstyles:hiking',
                                        shouldClose = true,
                                        items = {}
                                    },
                                    {
                                        id = 'walk22',
                                        title = 'Quick',
                                        icon = 'running',
                                        type = 'client',
                                        event = 'denalifw-walkstyles:quick',
                                        shouldClose = true,
                                        items = {}
                                    },
                                    {
                                        id = 'walk23',
                                        title = 'Wide',
                                        icon = 'arrows-alt-h',
                                        type = 'client',
                                        event = 'denalifw-walkstyles:wide',
                                        shouldClose = true,
                                        items = {}
                                    },
                                    {
                                        id = 'walk24',
                                        title = 'Scared',
                                        icon = 'grimace',
                                        type = 'client',
                                        event = 'denalifw-walkstyles:scared',
                                        shouldClose = true,
                                        items = {}
                                    },
                                    {
                                        id = 'walking-style6',
                                        title = 'More...',
                                        icon = 'ellipsis-h',
                                        items = {
                                            {
                                                id = 'walk25',
                                                title = 'Brave',
                                                icon = 'wolf-pack-battalion',
                                                type = 'client',
                                                event = 'denalifw-walkstyles:brave',
                                                shouldClose = true,
                                                items = {}
                                            },
                                            {
                                                id = 'walk26',
                                                title = 'Tipsy',
                                                icon = 'beer',
                                                type = 'client',
                                                event = 'denalifw-walkstyles:tipsy',
                                                shouldClose = true,
                                                items = {}
                                            },
                                            {
                                                id = 'walk27',
                                                title = 'Injured',
                                                icon = 'crutch',
                                                type = 'client',
                                                event = 'denalifw-walkstyles:injured',
                                                shouldClose = true,
                                                items = {}
                                            },
                                            {
                                                id = 'walk28',
                                                title = 'Tough',
                                                icon = 'dumbbell',
                                                type = 'client',
                                                event = 'denalifw-walkstyles:tough',
                                                shouldClose = true,
                                                items = {}
                                            },
                                            {
                                                id = 'walk29',
                                                title = 'Sassy',
                                                icon = 'kiss',
                                                type = 'client',
                                                event = 'denalifw-walkstyles:sassy',
                                                shouldClose = true,
                                                items = {}
                                            },
                                            {
                                                id = 'walk30',
                                                title = 'Sad',
                                                icon = 'frown',
                                                type = 'client',
                                                event = 'denalifw-walkstyles:sad',
                                                shouldClose = true,
                                                items = {}
                                            },
                                            {
                                                id = 'walk31',
                                                title = 'Posh',
                                                icon = 'crown',
                                                type = 'client',
                                                event = 'denalifw-walkstyles:posh',
                                                shouldClose = true,
                                                items = {}
                                            },
                                            {
                                                id = 'walk32',
                                                title = 'Alien',
                                                icon = 'reddit-alien',
                                                type = 'client',
                                                event = 'denalifw-walkstyles:alien',
                                                shouldClose = true,
                                                items = {}
                                            },
                                            {
                                                id = 'walking-style8',
                                                title = 'More...',
                                                icon = 'ellipsis-h',
                                                items = {
                                                    {
                                                        id = 'walk33',
                                                        title = 'Non Chalant',
                                                        icon = 'meh',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:nonchalant',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                    {
                                                        id = 'walk34',
                                                        title = 'Hobo',
                                                        icon = 'dumpster',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:hobo',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                    {
                                                        id = 'walk35',
                                                        title = 'Money',
                                                        icon = 'money-bill-alt',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:money',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                    {
                                                        id = 'walk36',
                                                        title = 'Swagger',
                                                        icon = 'blind',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:swagger',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                    {
                                                        id = 'walk37',
                                                        title = 'Shady',
                                                        icon = 'user-ninja',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:shady',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                    {
                                                        id = 'walk38',
                                                        title = 'Man Eater',
                                                        icon = 'grin-tongue-wink',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:maneater',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                    {
                                                        id = 'walk39',
                                                        title = 'ChiChi',
                                                        icon = 'yin-yang',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:chichi',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                    {
                                                        id = 'walk40',
                                                        title = 'Default',
                                                        icon = 'meh',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:default',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                    {
                                                        id = 'walk41',
                                                        title = 'Walking Styles Menu',
                                                        icon = 'walking',
                                                        type = 'client',
                                                        event = 'denalifw-walkstyles:openmenu',
                                                        shouldClose = true,
                                                        items = {}
                                                    },
                                                }
                                            },
                                        }
                                    },
                                }
                            },
                        }
                    }
                }
            }, {
                id = 'clothesmenu',
                title = 'Clothing',
                icon = 'tshirt',
                items = {
                    {
                        id = 'Hair',
                        title = 'Hair',
                        icon = 'user',
                        type = 'client',
                        event = 'denalifw-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Ear',
                        title = 'Ear Piece',
                        icon = 'deaf',
                        type = 'client',
                        event = 'denalifw-radialmenu:ToggleProps',
                        shouldClose = true
                    }, {
                        id = 'Neck',
                        title = 'Neck',
                        icon = 'user-tie',
                        type = 'client',
                        event = 'denalifw-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Top',
                        title = 'Top',
                        icon = 'tshirt',
                        type = 'client',
                        event = 'denalifw-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shirt',
                        title = 'Shirt',
                        icon = 'tshirt',
                        type = 'client',
                        event = 'denalifw-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Pants',
                        title = 'Pants',
                        icon = 'user',
                        type = 'client',
                        event = 'denalifw-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'Shoes',
                        title = 'Shoes',
                        icon = 'shoe-prints',
                        type = 'client',
                        event = 'denalifw-radialmenu:ToggleClothing',
                        shouldClose = true
                    }, {
                        id = 'meer',
                        title = 'Extras',
                        icon = 'plus',
                        items = {
                            {
                                id = 'Hat',
                                title = 'Hat',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Glasses',
                                title = 'Glasses',
                                icon = 'glasses',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Visor',
                                title = 'Visor',
                                icon = 'hat-cowboy-side',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Mask',
                                title = 'Mask',
                                icon = 'theater-masks',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Vest',
                                title = 'Vest',
                                icon = 'vest',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bag',
                                title = 'Bag',
                                icon = 'shopping-bag',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleClothing',
                                shouldClose = true
                            }, {
                                id = 'Bracelet',
                                title = 'Bracelet',
                                icon = 'user',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Watch',
                                title = 'Watch',
                                icon = 'stopwatch',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleProps',
                                shouldClose = true
                            }, {
                                id = 'Gloves',
                                title = 'Gloves',
                                icon = 'mitten',
                                type = 'client',
                                event = 'denalifw-radialmenu:ToggleClothing',
                                shouldClose = true
                            }
                        }
                    }
                }
            }
        }
    },
    [3] = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = 'car',
        items = {
                        {
                            id = 'vehiclemenu',
                            title = 'Car Control',
                            icon = 'bars',
                            type = 'client',
                            event = 'ccvehmenu:client:openMenu',
                            shouldClose = true
                        
            },
            {
                id = 'door5',
                title = 'Trunk',
                icon = 'car',
                type = 'client',
                event = 'denalifw-radialmenu:client:openDoor',
                shouldClose = true
            },
            {
                id = 'window1',
                title = 'Windows',
                icon = 'bars',
                type = 'client',
                event = 'denalifw-vehiclemenu:windowscontrol',
                shouldClose = true
            },
            {
                id = 'getintrunk',
                title = 'Get In Trunk',
                icon = 'car',
                type = 'client',
                event = 'denalifw-trunk:client:GetIn',
                shouldClose = true
            }, {
                id = 'vehicleextras',
                title = 'Vehicle Extras',
                icon = 'plus',
                items = {
                    {
                        id = 'extra1',
                        title = 'Extra 1',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra2',
                        title = 'Extra 2',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra3',
                        title = 'Extra 3',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra4',
                        title = 'Extra 4',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra5',
                        title = 'Extra 5',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra6',
                        title = 'Extra 6',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra7',
                        title = 'Extra 7',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra8',
                        title = 'Extra 8',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra9',
                        title = 'Extra 9',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra10',
                        title = 'Extra 10',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra11',
                        title = 'Extra 11',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra12',
                        title = 'Extra 12',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }, {
                        id = 'extra13',
                        title = 'Extra 13',
                        icon = 'box-open',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:setExtra',
                        shouldClose = false
                    }
                }
            }, {
                id = 'vehicleseats',
                title = 'Vehicle Seats',
                icon = 'chair',
                items = {
                    {
                        id = 'door0',
                        title = 'Driver',
                        icon = 'chair',
                        type = 'client',
                        event = 'denalifw-radialmenu:client:ChangeSeat',
                        shouldClose = false
                    }
                }
            }
        }
    },
    [4] = {
        id = 'jobinteractions',
        title = 'Work',
        icon = 'briefcase',
        items = {}
    }
}
--[[5] = {
    id = 'seatbelt',
    title = 'Citizen',
    icon = 'user',
    type = 'client',
    event = 'seatbelt:ToggleSeatbelt',
    shouldClose = true
    }
}]]

Config.JobInteractions = {
    ["ambulance"] = {
        {
            id = 'statuscheck',
            title = 'Check Health Status',
            icon = 'heartbeat',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true
        },{
            id = 'revivep',
            title = 'Revive',
            icon = 'user-md',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true
        },{
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'band-aid',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true
        }, {
            id = 'emergencybutton2',
            title = 'Emergency button',
            icon = 'bell',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true
        }, {
            id = 'escort',
            title = 'Escort',
            icon = 'user-friends',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true
        }, {
            id = 'stretcheroptions',
            title = 'Stretcher',
            icon = 'procedures',
            items = {
                {
                    id = 'spawnstretcher',
                    title = 'Spawn Stretcher',
                    icon = 'plus',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:TakeStretcher',
                    shouldClose = false
                }, {
                    id = 'despawnstretcher',
                    title = 'Remove Stretcher',
                    icon = 'minus',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:RemoveStretcher',
                    shouldClose = false
                }
            }
        }
    },
    ["container"] = {
        {
            id = 'housemenu2',
            title = 'List of Containers',
            icon = 'laptop-house',
            type = 'client',
            event = 'denalifw-container:client:OpenHouseListMenu',
            shouldClose = true
        }
    },
    ["unemployed"] = {
        },
    ["taxi"] = {
        {
            id = 'togglemeter',
            title = 'Show/Hide Meter',
            icon = 'eye-slash',
            type = 'client',
            event = 'denalifw-taxi:client:toggleMeter',
            shouldClose = false
        }, {
            id = 'togglemouse',
            title = 'Start/Stop Meter',
            icon = 'hourglass-start',
            type = 'client',
            event = 'denalifw-taxi:client:enableMeter',
            shouldClose = true
        }, {
            id = 'npc_mission',
            title = 'NPC Mission',
            icon = 'taxi',
            type = 'client',
            event = 'denalifw-taxi:client:DoTaxiNpc',
            shouldClose = true
        }
    },
    ["tow"] = {
        {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }, {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'asser-tow:client:tow',
            shouldClose = true
        }
    },
    ["realestate"] = {
        {
            id = 'housemenu',
            title = 'List of houses',
            icon = 'laptop-house',
            type = 'client',
            event = 'qb-realestate:client:OpenHouseListMenu',
            shouldClose = true
        }
    },
    ["mechanic"] = {
        {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'denalifw-tow:client:TowVehicle',
            shouldClose = true
        }, 
        {
            id = 'towvehicle2',
            title = 'CIV Attach-Detach',
            icon = 'truck-pickup',
            type = 'client',
            event = 'asser-tow:client:tow',
            shouldClose = true
        },
               {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }
    },
    ["mechanic2"] = {
        {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'denalifw-tow:client:TowVehicle',
            shouldClose = true
        },
                {
            id = 'towvehicle2',
            title = 'CIV Attach-Detach',
            icon = 'truck-pickup',
            type = 'client',
            event = 'asser-tow:client:tow',
            shouldClose = true
        },
        {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }
    },
    ["rooster"] = {
        {
            id = 'givehousekey3',
            title = 'Give House Keys',
            icon = 'key',
            type = 'client',
            event = 'denalifw-containers2:client:giveHouseKey',
            shouldClose = true,
            items = {}
        }, {
            id = 'removehousekey3',
            title = 'Remove House Keys',
            icon = 'key',
            type = 'client',
            event = 'denalifw-containers2:client:removeHouseKey',
            shouldClose = true,
            items = {}
        }, {
            id = 'togglelock3',
            title = 'Toggle Doorlock',
            icon = 'door-closed',
            type = 'client',
            event = 'denalifw-containers2:client:toggleDoorlock',
            shouldClose = true
        }, {
            id = 'decoratehouse3',
            title = 'Decorate House',
            icon = 'boxes',
            type = 'client',
            event = 'denalifw-containers2:client:decorate',
            shouldClose = true
        }, {
            id = 'houseLocations3',
            title = 'Interaction Locations',
            icon = 'home',
            items = {
                {
                    id = 'setstash3',
                    title = 'Set Stash',
                    icon = 'box-open',
                    type = 'client',
                    event = 'denalifw-containers2:client:setLocation',
                    shouldClose = true
                }, {
                    id = 'setoutift3',
                    title = 'Set Wardrobe',
                    icon = 'tshirt',
                    type = 'client',
                    event = 'denalifw-containers2:client:setLocation',
                    shouldClose = true
                }, {
                    id = 'setlogout3',
                    title = 'Set Logout',
                    icon = 'door-open',
                    type = 'client',
                    event = 'denalifw-containers2:client:setLocation',
                    shouldClose = true
                    }
                }       
            }
        },
    ["mechanic3"] = {
        {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'denalifw-tow:client:TowVehicle',
            shouldClose = true
        },
        {
            id = 'towvehicle2',
            title = 'CIV Attach-Detach',
            icon = 'truck-pickup',
            type = 'client',
            event = 'asser-tow:client:tow',
            shouldClose = true
        },
        {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }
    },
    ["mechanic4"] = {
        {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'denalifw-tow:client:TowVehicle',
            shouldClose = true
        },
        {
            id = 'towvehicle2',
            title = 'CIV Attach-Detach',
            icon = 'truck-pickup',
            type = 'client',
            event = 'asser-tow:client:tow',
            shouldClose = true
        },
        {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }
    },
    ["mechanic5"] = {
        {
            id = 'towvehicle',
            title = 'Tow vehicle',
            icon = 'truck-pickup',
            type = 'client',
            event = 'denalifw-tow:client:TowVehicle',
            shouldClose = true
        },
        {
            id = 'towvehicle2',
            title = 'CIV Attach-Detach',
            icon = 'truck-pickup',
            type = 'client',
            event = 'asser-tow:client:tow',
            shouldClose = true
        },
        {
            id = 'togglenpc',
            title = 'Toggle NPC',
            icon = 'toggle-on',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true
        }
    },
    ["police"] = {
        {
            id = 'emergencybutton',
            title = 'Emergency button',
            icon = 'bell',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true
        }, {
            id = 'checkvehstatus',
            title = 'Check Tune Status',
            icon = 'info-circle',
            type = 'client',
            event = 'denalifw-tunerchip:client:TuneStatus',
            shouldClose = true
        },
        {
            id = 'takedriverlicense',
            title = 'Revoke Drivers License',
            icon = 'id-card',
            type = 'client',
            event = 'police:client:SeizeDriverLicense',
            shouldClose = true
        },{
            id = 'mdtopen',
            title = 'MDT/Raid',
            icon = 'id-card',
        items = {
            {
                id = 'mdt',
                title = 'CIV MDT',
                icon = 'heartbeat',
                type = 'server',
                event = 'mdt:hotKeyOpen',
                shouldClose = true
            }, {
                id = 'raidhotel',
                title = 'Raid Hotel',
                icon = 'question',
                type = 'client',
                event = 'hh_motels:police:raid',
                shouldClose = true
            }, {
                id = 'duty4',
                title = 'ON/OFF DUTY',
                icon = 'user-friends',
                type = 'server',
                event = 'DenaliFW:ToggleDuty',
                shouldClose = true
            }, {
                id = 'breachhouserob',
                title = 'Robbery Breach',
                icon = 'search',
                type = 'client',
                event = 'denali-houserobbery:breach',
                shouldClose = true
            },{
                id = 'houseraid',
                title = 'Property Raid',
                icon = 'user-lock',
                type = 'client',
                event = 'denalifw-houses:client:HomeInvasion',
                shouldClose = true
            } --[[{
                id = 'towvehicle',
                title = 'Tow vehicle',
                icon = 'truck-pickup',
                type = 'client',
                event = 'denalifw-tow:client:TowVehicle',
                shouldClose = true
            }]]
        }
    },
         {
            id = 'policeinteraction',
            title = 'Police Actions',
            icon = 'tasks',
            items = {
                {
                    id = 'statuscheck',
                    title = 'Check Health Status',
                    icon = 'heartbeat',
                    type = 'client',
                    event = 'hospital:client:CheckStatus',
                    shouldClose = true
                }, {
                    id = 'checkstatus',
                    title = 'Check status',
                    icon = 'question',
                    type = 'client',
                    event = 'police:client:CheckStatus',
                    shouldClose = true
                }, {
                    id = 'escort',
                    title = 'Escort',
                    icon = 'user-friends',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true
                }, {
                    id = 'searchplayer',
                    title = 'Search',
                    icon = 'search',
                    type = 'client',
                    event = 'police:client:SearchPlayer',
                    shouldClose = true
                }, {
                    id = 'jailplayer',
                    title = 'Jail',
                    icon = 'user-lock',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true
                },{
                    id = 'towvehicle',
                    title = 'Tow vehicle',
                    icon = 'truck-pickup',
                    type = 'client',
                    event = 'asser-tow:client:tow',
                    shouldClose = true
                }
            }
        }, {
            id = 'radio',
            title = 'Radio',
            items = {
                {
                    id = 'policeradioone',
                    title = 'Radio #1',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:enter:radio',
                    shouldClose = true
                }, {
                    id = 'policeradiotwo',
                    title = 'Radio #2',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:enter:radio2',
                    shouldClose = true
                }, {
                    id = 'policeradiothree',
                    title = 'Radio #3',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:enter:radio3',
                    shouldClose = true
                }, {
                    id = 'policeradio4',
                    title = 'Radio #4',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:enter:radio4',
                    shouldClose = true
                }, {
                    id = 'policeradio5',
                    title = 'FAA #11',
                    type = 'client',
                    event = 'denalifw-radialmenu:client:enter:radio11',
                    shouldClose = true
                }
            }
        },{
            id = 'policeobjects',
            title = 'Objects',
            icon = 'road',
            items = {
                {
                    id = 'spawnpion',
                    title = 'Cone',
                    icon = 'exclamation-triangle',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false
                }, {
                    id = 'spawnhek',
                    title = 'Gate',
                    icon = 'torii-gate',
                    type = 'client',
                    event = 'police:client:spawnBarier',
                    shouldClose = false
                }, {
                    id = 'spawnschotten',
                    title = 'Speed Limit Sign',
                    icon = 'sign',
                    type = 'client',
                    event = 'police:client:spawnSchotten',
                    shouldClose = false
                }, {
                    id = 'spawntent',
                    title = 'Tent',
                    icon = 'campground',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false
                }, {
                    id = 'spawnverlichting',
                    title = 'Lighting',
                    icon = 'lightbulb',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false
                }, {
                    id = 'spikestrip',
                    title = 'Spike Strips',
                    icon = 'caret-up',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false
                }, {
                    id = 'deleteobject',
                    title = 'Remove object',
                    icon = 'trash',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false
                }
            }
        }
    },
    ["hotdog"] = {
        {
            id = 'togglesell',
            title = 'Toggle sell',
            icon = 'hotdog',
            type = 'client',
            event = 'denalifw-hotdogjob:client:ToggleSell',
            shouldClose = true
        }
    }
    -- ["taxi"] = {

    -- },
}

Config.TrunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes  
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans  
    [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs  
    [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes  
    [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle  
    [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics  
    [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports  
    [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super  
    [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles  
    [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road  
    [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial  
    [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility  
    [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans  
    [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles  
    [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats  
    [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters  
    [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes  
    [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service  
    [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency  
    [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military  
    [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial  
    [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25} -- Trains  
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["top"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Take your shirt off/on",
        Button = 1,
        Name = "Torso"
    },
    ["gloves"] = {
        Func = function() ToggleClothing("Gloves") end,
        Sprite = "gloves",
        Desc = "Take your gloves off/on",
        Button = 2,
        Name = "Gloves"
    },
    ["visor"] = {
        Func = function() ToggleProps("Visor") end,
        Sprite = "visor",
        Desc = "Toggle hat variation",
        Button = 3,
        Name = "Visor"
    },
    ["bag"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Opens or closes your bag",
        Button = 8,
        Name = "Bag"
    },
    ["shoes"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Take your shoes off/on",
        Button = 5,
        Name = "Shoes"
    },
    ["vest"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Take your vest off/on",
        Button = 14,
        Name = "Vest"
    },
    ["hair"] = {
        Func = function() ToggleClothing("Hair") end,
        Sprite = "hair",
        Desc = "Put your hair up/down/in a bun/ponytail.",
        Button = 7,
        Name = "Hair"
    },
    ["hat"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Take your hat off/on",
        Button = 4,
        Name = "Hat"
    },
    ["glasses"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Take your glasses off/on",
        Button = 9,
        Name = "Glasses"
    },
    ["ear"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Take your ear accessory off/on",
        Button = 10,
        Name = "Ear"
    },
    ["neck"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Take your neck accessory off/on",
        Button = 11,
        Name = "Neck"
    },
    ["watch"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Take your watch off/on",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bracelet"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Take your bracelet off/on",
        Button = 13,
        Name = "Bracelet"
    },
    ["mask"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
}

local Bags = {[40] = true, [41] = true, [44] = true, [45] = true}

Config.ExtraCommands = {
    ["pants"] = {
        Func = function() ToggleClothing("Pants", true) end,
        Sprite = "pants",
        Desc = "Take your pants off/on",
        Name = "Pants",
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ["shirt"] = {
        Func = function() ToggleClothing("Shirt", true) end,
        Sprite = "shirt",
        Desc = "Take your shirt off/on",
        Name = "shirt",
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ["reset"] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Nothing To Reset', 'error')
            end
        end,
        Sprite = "reset",
        Desc = "Revert everything back to normal",
        Name = "reset",
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ["bagoff"] = {
        Func = function() ToggleClothing("Bagoff", true) end,
        Sprite = "bagoff",
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped["Bagoff"]
            if LastEquipped["Bagoff"] then
                if Bags[BagOff.Drawable] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            end
            if Bag ~= 0 then
                if Bags[Bag] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            else
                return false
            end
        end,
        Desc = "Take your bag off/on",
        Name = "bagoff",
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}
