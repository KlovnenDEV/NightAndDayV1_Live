QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 10
            },
        },
	},
	['vanilla'] = {
		label = 'Vanilla Unicorn',
		defaultDuty = true,
		grades = {
			['0'] = {
				name = 'Trainee',
				payment = 50
			},
			['1'] = {
				name = 'Employee',
				payment = 75
			},
			['2'] = {
				name = 'Management',
				isboss = true,
				payment = 100
			},
		},
	},
	["gotur"] = {
		label = "Götür",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Recruit",
                payment = 0
            },
			['1'] = {
                name = "Chief",
				isboss = true,
                payment = 0
            },
        },
	},
	['tequila'] = {
		label = 'Tequila',
		defaultDuty = true,
		grades = {
			['0'] = {
				name = 'Trainee',
				payment = 50
			},
			['1'] = {
				name = 'Employee',
				payment = 75
			},
			['2'] = {
				name = 'Management',
				isboss = true,
				payment = 100
			},
		},
	},
	['police'] = { 
		label = 'Law Enforcement',
		defaultDuty = true,
		grades = {
			['0'] = {
				name = 'PUB-Cadet',
				payment = 100
			},
			['1'] = {
				name = 'PPO',
				payment = 100
			},
			['2'] = {
				name = 'Deputy',
				payment = 200
			},
			['3'] = {
				name = 'Senior.Deputy',
				payment = 250
			},
			['4'] = {
				name = 'Corporal',
				payment = 300
			},
			['5'] = {
				name = 'Sergeant',
				isboss = true,
				payment = 350
			},
			['6'] = {
				name = 'Patrol.Lieutenant',
				isboss = true,
				payment = 400
			},
			['7'] = {
				name = 'Captain',
				isboss = true,
				payment = 400
			},
			['8'] = {
				name = 'Major.Chief',
				isboss = true,
				payment = 500
			},
			['9'] = {
				name = 'Chief.Deputy',
				isboss = true,
				payment = 500
			},
			['10'] = {
				name = 'Asst.Sheriff',
				isboss = true,
				payment = 500
			},
			['11'] = {
				name = 'Undersheriff',
				isboss = true,
				payment = 600
			},
			['12'] = {
				name = 'Sheriff',
				isboss = true,
				payment = 600
			},
            ['13'] = {
				name = 'LSPD-Cadet',
				payment = 100
			},
			['14'] = {
				name = 'LSPD-PPO',
				payment = 100
			},
			['15'] = {
				name = 'LSPD-Officer',
				payment = 200
			},
			['16'] = {
				name = 'LSPD-SR.Officer',
				payment = 250
			},
			['17'] = {
				name = 'LSPD-Corporal',
				payment = 300
			},
			['18'] = {
				name = 'LSPD-Sergeant',
				isboss = true,
				payment = 350
			},
			['19'] = {
				name = 'LSPD-Patrol.Lieutenant',
				isboss = true,
				payment = 400
			},
			['20'] = {
				name = 'LSPD-Captain',
				isboss = true,
				payment = 400
			},
			['21'] = {
				name = 'SASP',
				isboss = true,
				payment = 500
			},
        },  
	},
	['farm'] = {
		label = 'Farmer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Boss',
                payment = 0
            },
            ['1'] = {
                name = 'Employee',
                payment = 0
            },
        },
},
['taco'] = {
	label = 'Taco Worker',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = {
			name = 'Employee',
			payment = 0
		},
		['1'] = {
			name = 'Boss',
			payment = 0
		},
	},
},
['burger'] = {
	label = 'Burger Flipper',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = {
			name = 'Employee',
			payment = 0
		},
		['1'] = {
			name = 'Boss',
			payment = 0
		},
	},
},
["food"] = { 
	label = "Los Santos Foodshop",
	grades = {
		['0'] = {
			name = "Foodshop Vendor",
			payment = 100
		},
		['1'] = {
			name = "Head Chef",
			payment = 250
		},
		['2'] = {
			name = "LS Foodshop Owner",
			isboss = true,
			payment = 350
		},
	},
	["boss"] = {
		--[1] = {x = 41.5, y = -1009.68, z = 29.49, h = 243.53}, 
	},
	defaultDuty = true,
},
------------------------------------------------------------------------PIZZASHOP
["pizzashop"] = { 
	label = "Los Santos Pizzashop",
	grades = {
		['0'] = {
			name = "Pizzashop Vendor",
			payment = 100
		},
		['1'] = {
			name = "Head Chef",
			payment = 250
		},
		['2'] = {
			name = "LS Pizzashop Owner",
			isboss = true,
			payment = 350
		},
	},
	["boss"] = {
		--[1] = {x = 41.5, y = -1009.68, z = 29.49, h = 243.53}, 
	},
	defaultDuty = true,
},
	['burgershot'] = {
		label = 'Burgershot Employee',
		defaultDuty = true,
		grades = {
			['0'] = {
				name = 'Trainee',
				payment = 0
			},
			['1'] = {
				name = 'Employee',
				payment = 75
			},
			['2'] = {
				name = 'Burger Flipper',
				payment = 100
			},
			['3'] = {
				name = 'Manager',
				payment = 125
			},
			['4'] = {
				name = 'CEO',
				isboss = true,
				payment = 150
			},
		},
	},
	['ambulance'] = {
        label = 'EMS',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 75
            },
            ['1'] = {
                name = 'EMT',
                payment = 100
            },
            ['2'] = {
                name = 'Advanced',
                payment = 150
            },
            ['3'] = {
                name = 'Paramedic',
                payment = 200
            },
            ['4'] = {
                name = 'Lieutenant',
				isboss = true,
                payment = 250
            },
            ['5'] = {
                name = 'Captain',
				isboss = true,
                payment = 300
            },
            ['6'] = {
                name = 'Chief',
                isboss = true,
                payment = 350
            },
        },
    },
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['security'] = {
		label = 'Bank Truck',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 0
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['container'] = {
		label = 'That One Place',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 0
            },
			['1'] = {
                name = 'House Sales',
                payment = 0
            },
			['2'] = {
                name = 'Business Sales',
                payment = 0
            },
			['3'] = {
                name = 'Broker',
                payment = 0
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 0
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 0
            },
			['1'] = {
                name = 'Driver',
                payment = 75
            },
			['2'] = {
                name = 'Event Driver',
                payment = 100
            },
			['3'] = {
                name = 'Sales',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 0
            },
		},
	},
	['whitewidow'] = {
		label = 'whitewidow',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Drug Dealer',
				isboss = true,
                payment = 150
            },
		},
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['banker'] = {
		label = 'Banker',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 150
            },
			['1'] = {
                name = 'Novice',
                payment = 175
            },
			['2'] = {
                name = 'Experienced',
                payment = 200
            },
			['3'] = {
                name = 'Advanced',
                payment = 225
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 450
            },
        },
	},
	['dmv'] = {
		label = 'DMV',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 0
            },
			['1'] = {
                name = 'instructor I',
                payment = 75
            },
			['2'] = {
                name = 'instructor II',
                payment = 100
            },
			['3'] = {
                name = 'Instructor III',
                payment = 125
            },
			['4'] = {
                name = 'Boss',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic'] = {
		label = 'LSC',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic5'] = {
		label = 'Denali Imports',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic4'] = {
		label = 'Route 68',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic3'] = {
		label = 'AutoCare',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic1'] = {
		label = 'Beekers',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'Novice',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Owner',
				isboss = true,
                payment = 150
            },
        },
	},
	['mechanic2'] = {
		label = 'Bennys',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 5
            },
			['1'] = {
                name = 'Novice',
                payment = 10
            },
			['2'] = {
                name = 'Experienced',
                payment = 25
            },
			['3'] = {
                name = 'Advanced',
                payment = 100
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},

	['doj'] = {
		label = 'DOJ',
		grades = {
		['0'] = {
			name = 'Clerk',
			payment = 200
			},
			['1'] = {
			name = 'Public Defender',
			payment = 300
			},
			['2'] = {
			name = 'District Attorney',
			payment = 500
			},
			['3'] = {
			name = 'Justice',
			isboss = true,
			payment = 500
				},
			['4'] = {
			name = 'Chief Justice',
			isboss = true,
			payment = 500
				},
			},
		},
		['irs'] = {
			label = 'IRS',
			grades = {
			['0'] = {
				name = 'IRS Agent',
				payment = 200
				},
				['1'] = {
				name = 'DA',
				payment = 300
				},
				['2'] = {
				name = 'Judge',
				payment = 500
				},
				['3'] = {
				name = 'Chief Justice',
				isboss = true,
				payment = 500
					},
				},
			},
	['lawyer'] = { 
		label = 'Law Offices of LS',
		grades = {
			['0'] = {
			name = 'Advocate',
			payment = 300
			},
			['1'] = {
			name = 'Defense Attorney',
			payment = 300
			},
			['2'] = {
			name = 'SR. Partner',
			payment = 400
			},
			['3'] = {
			name = 'Named-Partner',
			isboss = true,
			payment = 500
				},
			},
		},
	['tonyinc'] = { 
		label = 'Tony Casta Inc',
		grades = {
			['0'] = {
			name = 'employee',
			payment = 0
			},
			['1'] = {
			name = 'Tony',
			isboss = true,
			payment = 0
				},
			},
		},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 0
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 0
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 0
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 0
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 0
            },
        },
	},
	['rooster'] = {
		label = 'Roost',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Guest',
                payment = 0
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 0
            },
        },
	},
}