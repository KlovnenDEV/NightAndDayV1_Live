# m-Vanilla script for QB-Core

| If you are intested in recieving updates join the community on **[Discord](https://discord.gg/svmzYehU8R)**! |

# About
- Optimized
- Many Features
- Full and easy customization
- 0.00ms

# Features
- Vanilla job script with several options available.
- 21 Alcoholic Drinks
- 4 non-alcoholic drinks
- Billing players with targer / command


# Required
**qb-core/shared/items.lua**
```
	['apple'] 				 		= {['name'] = 'apple', 			  	['label'] = 'Apple', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'apple.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Apple'},
	['appledrink'] 				 	= {['name'] = 'appledrink', 		['label'] = 'Apple Juice', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'appledrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Apple Juice'},
	['applecocktail'] 				= {['name'] = 'applecocktail', 		['label'] = 'Apple Cocktail', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'applecocktail.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Apple Juice'},
	['banana'] 				 		= {['name'] = 'banana', 			['label'] = 'Banana', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'banana.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Banana'},
	['bananadrink'] 				= {['name'] = 'bananadrink', 		['label'] = 'Banana Cocktail', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bananadrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Banana Cocktail'},
	['beer'] 				 		= {['name'] = 'beer', 			  	['label'] = 'Beer', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'beer.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Beer'},
	['brandy'] 				 		= {['name'] = 'brandy', 			['label'] = 'Brandy', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'brandy.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Brandy'},
	['hulkcocktail'] 				= {['name'] = 'hulkcocktail', 		['label'] = 'Hulk Cocktail', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'hulkcocktail.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Hulk Cocktail'},
	['ice'] 				 		= {['name'] = 'ice', 			  	['label'] = 'Ice', 						['weight'] = 500, 		['type'] = 'item', 		['image'] = 'ice.png', 						['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ice'},
	['strawberries'] 				= {['name'] = 'strawberries', 		['label'] = 'Strawberries', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'strawberries.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Strawberries'},
	['strawberriesdrink'] 			= {['name'] = 'strawberriesdrink', 	['label'] = 'Strawberries Drink', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'strawberriesdrink.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Strawberries Drink'},
	['orange'] 				 		= {['name'] = 'orange', 			['label'] = 'Orange', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'orange.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Orange'},
	['orangedrink'] 				= {['name'] = 'orangedrink', 		['label'] = 'Orange Drink', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'orangedrink.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Orange Drink'},
	['vodka'] 				 		= {['name'] = 'vodka', 			  	['label'] = 'Vodka', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'vodka.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Vodka'},
	['vodkacocktail'] 				= {['name'] = 'vodkacocktail', 		['label'] = 'Vodka Cocktail', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'vodkacocktail.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Vodka Cocktail'},
	['vanillamenu'] 				= {['name'] = 'vanillamenu', 		['label'] = 'Vanilla Menu', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'vanillamenu.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Vanilla Menu'},
	['goldstrike'] 				 	= {['name'] = 'goldstrike', 		['label'] = 'Gold Strike', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'goldstrike.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Gold Strike'},
	['absinthe'] 				 	= {['name'] = 'absinthe', 			['label'] = 'Absinthe', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'absinthe.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Absinthe'},
	['jackdaniels'] 				= {['name'] = 'jackdaniels', 		['label'] = 'Jack Daniels', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'jackdaniels.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Jack Daniels'},
	['champagne'] 				 	= {['name'] = 'champagne', 			['label'] = 'Champagne', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'champagne.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Champagne'},
	['tequilagold'] 				= {['name'] = 'tequilagold', 		['label'] = 'Tequila Gold', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'tequilagold.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Tequila Gold'},
	['martinibianco'] 				= {['name'] = 'martinibianco', 		['label'] = 'Martini Bianco', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'martinibianco.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Martini Bianco'},
	['martiniextradry'] 			= {['name'] = 'martiniextradry', 	['label'] = 'Martini Extradry', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'martiniextradry.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Martini Extradry'},
	['martinirosato'] 				= {['name'] = 'martinirosato', 		['label'] = 'Martini Rosato', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'martinirosato.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Martini Rosato'},
	['martinirosso'] 				= {['name'] = 'martinirosso', 		['label'] = 'Martini Rosso', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'martinirosso.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Martini Rosso'},
	['bombaysaphire'] 				= {['name'] = 'bombaysaphire', 		['label'] = 'Bombay Saphire', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bombaysaphire.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Bombay Saphire'},
	['ciroc'] 				 		= {['name'] = 'ciroc', 			  	['label'] = 'Ciroc', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'ciroc.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ciroc'},
	['cirocapple'] 				    = {['name'] = 'cirocapple', 		['label'] = 'Ciroc Apple', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'cirocapple.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ciroc Apple'},
	['cirocred'] 				 	= {['name'] = 'cirocred', 			['label'] = 'Ciroc Red', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'cirocred.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Ciroc Red'},
	['eristoffblack'] 				= {['name'] = 'eristoffblack', 		['label'] = 'Eristoff Black', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'eristoffblack.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Eristoff Black'},
	['frutosvermelhos'] 			= {['name'] = 'frutosvermelhos', 	['label'] = 'Red fruits', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'frutosvermelhos.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Red fruits'},
	['lima'] 				 		= {['name'] = 'lima', 			  	['label'] = 'Lime', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'lima.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Lime'},
	['cocacola'] 				 	= {['name'] = 'cocacola', 			['label'] = 'Coca Cola', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'cocacola.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Lime'},
	['baileys'] 				 	= {['name'] = 'baileys', 			['label'] = 'Baileys', 					['weight'] = 500, 		['type'] = 'item', 		['image'] = 'baileys.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Lime'},
	['jb'] 				 			= {['name'] = 'jb', 				['label'] = 'J&B', 						['weight'] = 500, 		['type'] = 'item', 		['image'] = 'jb.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Lime'},
	['vanillamenu'] 				 			= {['name'] = 'vanillamenu', 				['label'] = 'Vanilla Menu', 						['weight'] = 500, 		['type'] = 'item', 		['image'] = 'vanillamenu.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = ''},
```
# **qb-bossmenu/config.lua**
	["vanilla"] = vector3(94.83, -1292.79, 29.26),

# **qb-core/shared/jobs.lua**
	['vanilla'] = {
	        label = 'Vanilla',
	        defaultDuty = true,
	        grades = {
	            ['0'] = { name = 'Recruit', payment = 50 },
	            ['1'] = { name = 'Novice', payment = 75 },
	            ['2'] = { name = 'Experienced', payment = 100 },
	            ['3'] = { name = 'Advanced', payment = 125 },
	            ['4'] = { name = 'Manager', isboss = true, payment = 150 },
	        },
	    },

# **qb-smallresources/config.lua**
	ConsumeablesAlcohol = {
	    ["absinthe"] = math.random(20, 40),
	    ["applecocktail"] = math.random(20, 40),
	    ["baileys"] = math.random(20, 40),
	    ["beer"] = math.random(20, 40),
	    ["bombaysaphire"] = math.random(20, 40),
	    ["ciroc"] = math.random(20, 40),
	    ["cirocapple"] = math.random(20, 40),
	    ["cirocred"] = math.random(20, 40),
	    ["eristoffblack"] = math.random(20, 40),
	    ["goldstrike"] = math.random(20, 40),
	    ["jackdaniels"] = math.random(20, 40),
	    ["jb"] = math.random(20, 40),
	    ["martinibianco"] = math.random(20, 40),
	    ["martiniextradry"] = math.random(20, 40),
	    ["martinirosato"] = math.random(20, 40),
	    ["martinirosso"] = math.random(20, 40),
	    ["strawberriesdrink"] = math.random(20, 40),
	    ["tequilagold"] = math.random(20, 40),
	    ["vodka"] = math.random(20, 40),
	    ["vodkacocktail"] = math.random(20, 40),
}