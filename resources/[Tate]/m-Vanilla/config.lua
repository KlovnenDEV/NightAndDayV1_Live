Config = {};
--------------------------
-- Utility
--------------------------
Config.Framework = "NEW" -- "NEW" - New QBCore | "OLD" - Old QBCore
Config.CoreName = "denalifw-core" -- Core name
Config.Notify = "okok" -- "QBCore" or "okok"
Config.Job = "vanilla" -- Name for the job that can access the target etc
Config.Target = "denalifw-target" -- Name of your target
Config.Input = "denalifw-input"
Config.PolyZone = false -- Want to view all the qb-target poly zones?
Config.OpenInventory = "inventory:server:OpenInventory"
Config.ItemBox = "inventory:client:ItemBox"
Config.DrinkAlcohol = "consumables:client:DrinkAlcohol"
Config.EnableCommand = true -- Enable command to billing?
Config.CommandBilling = "fatvanilla"
Config.EnableCallEmployment = true -- Enable call emloyes? If true, people can call with target on tables, and the emplyes get a notify.
Config.PayWhenDance = true -- Pay the player when dance?
Config.Pay = { -- Monet earn when dance
    MinPay = 50,
    MaxPay = 100,
}

--------------------------
-- Blips
--------------------------
Config.Blips = {
    Enable = true,
    Zone = vector3(132.03, -1303.96, 29.22),
    Name = "Vanilla",
    Colour = 61,
    Icon = 121,
}

--------------------------
-- Targets
--------------------------
Config["Locations"] = {
    ["OnDuty"] = { 
        vector3(106.58, -1299.39, 28.77),
    },
    ["Fridge"] = {
        vector3(132.78, -1286.9, 29.27),
    },
    ["Storage"] = {
        vector3(130.21, -1285.34, 29.27),
    },
    ["Fruit"] = {
        vector3(130.52, -1281.72, 30.35),
    },
    ["Ice"] = {
        vector3(127.77, -1281.96, 29.27),
    },
    ["Drinks"] = {
        vector3(129.02, -1280.33, 29.27),
    },
    ["Dance"] = {
        vector3(108.84, -1289.26, 30.25),
        vector3(104.77, -1294.43, 30.25),
        vector3(102.23, -1290.14, 30.25)
    },
    ["Mesa1"] = {
        vector3(115.96, -1286.76, 28.88),
    },
    ["Mesa2"] = {
        vector3(112.81, -1283.11, 28.88),
    },
    ["Mesa3"] = {
        vector3(117.47, -1282.91, 29.16),
    },
    ["Mesa4"] = {
        vector3(120.99, -1285.15, 28.68),
    },
    ["Mesa5"] = {
        vector3(123.32, -1294.96, 29.69),
    },
    ["Mesa6"] = {
        vector3(120.01, -1296.7, 29.99),
    },
    ["Billing"] = {
        vector3(129.2, -1284.94, 30.39),
    },
}

--------------------------
-- Stash
--------------------------
Config.Stash = {
    Name = "Vanilla Storage",
    MaxWeight = 1500,
    Slots = 40,
}

--------------------------
-- Language
--------------------------
Config["Language"] = {
    ["Notifications"] = {
        ["Canceled"] = "Cancelded.",
        ["WithoutIngredients"] = "You don't have the ingredients with you.",
        ["OffDuty"] = "You have to go on duty.",
        ["EndDance"] = "You have to finish dancing.",
        ["Table1"] = "Employee called to table 1",
        ["Table2"] = "Employee called to table 2",
        ["Table3"] = "Employee called to table 3",
        ["Table4"] = "Employee called to table 4",
        ["Table5"] = "Employee called to table 5",
        ["Table6"] = "Employee called to table 6",
        ["FaturaEnviadaSucesso"] = "Invoice sent successfully.",
        ["ValorSuperior0"] = "Must be a valid value above 0.",
        ["FaturarProprio"] = "You can't bill yourself.",
        ["PlayerOffline"] = "Player unavailable.",
        ["NoPermission"] = "You don't have permissions.",
        ["FaturaRecebida"] = "New invoice received.",
    },
    ["QBTarget"] = {
        ["OnDutyLabel"] = "On/Off Duty",
        ["OnDutyIcon"] = "far fa-clipboard",
        ["FridgeLabel"] = "Shop",
        ["FridgeIcon"] = "fas fa-glass-cheers",
        ["StorageLabel"] = "Warehouse",
        ["StorageIcon"] = "fas fa-box",
        ["FruitLabel"] = "Fruits",
        ["FuirIcon"] = "fas fa-lemon",
        ["IceLabel"] = "Ice",
        ["IceIcon"] = "fas fa-cube",
        ["DrinksLabel"] = "Drinks",
        ["DrinkIcon"] = "fas fa-wine-glass",
        ["DanceLabel"] = "Dance",
        ["DanceIcon"] = "fas fa-person",
        ["CallEmplyementLabel"] = "Call Employee",
        ["CallEmplyementIcon"] = "fas fa-ring",
        ["BillingLabel"] = "Billing",
        ["BillingIcon"] = "fa-solid fa-money-bill-1",
    },
    ["QBMenu"] = {
        ["AvailableFruits"] = "🍉 | Available Fruits | 🍉",
        ["FruitBanana"] = "🍌 • Banana",
        ["FruitApple"] = "🍏 • Apple",
        ["FruitOrange"] = "🍊 • Orange",
        ["FruitLime"] = "🍈 • Lime",
        ["FruitStrawberries"] = "🍓 • Strawberries",
        ["FruitRedFruit"] = "🍒 • Red Fruit",
        ["AvailableDrinks"] = "🍷 | Available Drinks | 🍷",
        ["Cocktails"] = "🍸 • Cocktails",
        ["CocktailsDesc"] = "Apple, Strawberry, Vodka...",
        ["Juices"] = "🍹 • Drinks",
        ["JuicesDesc"] = "Apple, Strawberry, Banana...",
        ["AvailableJuices"] = "🍷 | Make Juices | 🍷",
        ["JuiceBanana"] = "🍺 • Banana Juice",
        ["JuiceBananaRequired"] = "Banana, Ice...",
        ["JuiceApple"] = "🍸 • Apple Juice",
        ["JuiceAppleRequired"] = "Apple, Ice...",
        ["JuiceOrange"] = "🍹 • Orange Juice",
        ["JuiceOrangeRequired"] = "Orange, Ice...",
        ["AvailableCoktails"] = "🍸 | Make Cocktails | 🍸",
        ["CocktailApple"] = "• Apple Cocktail",
        ["CocktailAppleRequired"] = "Ice, Apple, Ciroc",
        ["CocktailStrawberries"] = "• Strawberries Cocktail",
        ["CocktailStrawberriesRequired"] = "Ice, Strawberries, Martini Rosato",
        ["CocktailVodka"] = "• Vodka Cocktail",
        ["CocktailVodkaRequired"] = "Ice, Lime, Eristoff Black",
        ["CloseQBMenu"] = "Close",
    },
    ["Progressbars"] = {
        ["TakeApple"] = "Picking up the apple...",
        ["TakeBanana"] = "Picking up the banana...",
        ["TakeOrange"] = "Picking up the orange...",
        ["TakeLime"] = "Picking up the lime...",
        ["TakeStrawberries"] = "Picking up a strawberry...",
        ["TakeRedFruit"] = "Picking up red fruits...",
        ["TakeIce"] = "Picking up the ice...",
        ["MakeAppleJuice"] = "Making an apple drink..",
        ["MakeBananaJuice"] = "Making a banana drink..",
        ["MakeOrangeJuice"] = "Making an orange drink..",
        ["MakeAppleCocktail"] = "Making an apple cocktail..",
        ["MakeStrawberriesCocktail"] = "Making a strawberry cocktail..",
        ["MakeVodkaCocktail"] = "Making a vodka cocktail..",
    },
    ["QBInput"] = {
        ["BillingHeader"] = "Billing Vanilla",
        ["BillingSubmit"] = "Submite",
        ["BillingPaypal"] = "Paypal ID",
        ["BillingAmount"] = "Amount",
    }
}

--------------------------
-- Shop
--------------------------
Config.Items = {
    [1] = {
        name = "beer",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "whiskey",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "vodka",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 3,
    },
    [4] = {
        name = "wine",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 4,
    },
    [5] = {
        name = "grapejuice",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 5,
    },
    [6] = {
        name = "cocacola",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 6,
    },
    [7] = {
        name = "absinthe",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 7,
    },
    [8] = {
        name = "baileys",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 8,
    },
    [9] = {
        name = "bombaysaphire",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 9,
    },
    [10] = {
        name = "brandy",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 10,
    },
    [11] = {
        name = "champagne",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 11,
    },
    [12] = {
        name = "ciroc",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 12,
    },
    [13] = {
        name = "cirocapple",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 13,
    },
    [14] = {
        name = "cirocred",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 14,
    },
    [15] = {
        name = "eristoffblack",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 15,
    },
    [16] = {
        name = "goldstrike",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 16,
    },
    [17] = {
        name = "jackdaniels",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 17,
    },
    [18] = {
        name = "jb",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 18,
    },
    [19] = {
        name = "martinibianco",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 19,
    },
    [20] = {
        name = "martiniextradry",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 20,
    },
    [21] = {
        name = "martinirosato",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 21,
    },
    [22] = {
        name = "martinirosso",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 22,
    },
    [23] = {
        name = "tequilagold",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 23,
    },
    [24] = {
        name = "vanillamenu",
        price = 0,
        amount = 10,
        info = {},
        type = "item",
        slot = 24,
    },
}