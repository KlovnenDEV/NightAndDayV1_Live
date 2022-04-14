## Add to qb-target/ config.lua

	["coketable"] = {
        models = {
            "bkr_prop_coke_table01a",
        },
        options = {
            {
		type = "client",
                event = "qb-tables:client:CrackTable",
                icon = "fas fa-pencil-ruler",
                label = "Process Crack",
            },
        },
        distance = 1.5
    },
	["weedtable"] = {
        models = {
            "bkr_prop_weed_table_01a",
        },
        options = {
            {
                type = "client",
                event = "qb-tables:client:weedTable",
                icon = "fas fa-cannabis",
                label = "Break up Bricks",
            },
        },
        distance = 1.5
    },
	["methtable"] = {
        models = {
            "bkr_prop_meth_table01a",
        },
        options = {
            {
		type = "client",
                event = "qb-tables:client:methTable",
                icon = "fas fa-pencil-ruler",
                label = "Break up Trays",
            },
        },
        distance = 1.5
    },

## Add to qb-core/ shared.lua

	['coketable'] 						 = {['name'] = 'coketable', 			 	  	  	['label'] = 'Powdered Table', 	['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'coketable.png', 				['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Just a Table'},

	['weedtable'] 					 = {['name'] = 'weedtable', 			 	  	  	['label'] = 'Flower Table', 	['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'weedtable.png', 				['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Just a Table'},

	['methtable'] 					 = {['name'] = 'methtable', 			 	   	['label'] = 'Crystal Table', 	['weight'] = 2000, 		['type'] = 'item', 		['image'] = 'methtable.png', 				['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Just a Table'},

## Add Images to inventory/ html/ images

## Requiremeants

qb-core   -  https://github.com/qbcore-framework/qb-core
qb-target -  https://github.com/BerkieBb/qb-target
rprogress -  https://github.com/Mobius1/rprogress