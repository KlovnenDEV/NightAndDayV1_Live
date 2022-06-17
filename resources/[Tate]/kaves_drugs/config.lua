Config = {}

Config.BlackMoney = true -- for hold corner system


Config.Corners = {

    [1] = {
        coord = vector3(191.2, -1764.08, 29.16),
        items = {"packagedweed", "packagedmeth", "packagedcoca"},
        radius = 30.0,
        minMoney = 100,
        maxMoney = 150,
        spawnpoints = {
            vector3(244.52, -1745.2, 28.8),
            vector3(238.4, -1797.16, 27.84),
        }
    },
    [2] = {
        coord = vector3(451.64, -1829.6, 27.84),
        items = {"packagedweed", "packagedmeth", "packagedcoca"},
        radius = 30.0,
        minMoney = 100,
        maxMoney = 150,
        spawnpoints = {
            vector3(418.68, -1807.44, 28.68),
            vector3(407.56, -1861.72, 26.84),
        },
    }

}

Config.ItemsName = {

    ["packagedweed"] = "Packaged Weed",
    ["packagedmeth"] = "Packaged Meth",
    ["packagedcoca"] = "Packaged Cocain",

}


Config.methLab = {

    entry = { -- DON'T TOUCH!
        coord = vector3(809.89, -490.92, 30.63), 
        intcoord = vector3(997.48, -3200.8, -36.4), 
        entryheading = 194.3,
        intheading = 250.19,
        text = "[E] Use Lab Card", 
        requiredItem = true,
        item = "labcard", 
    },
    exit = { -- DON'T TOUCH!
        intcoord = vector3(997.16, -3200.64, -36.4), 
        coord = vector3(809.89, -490.92, 30.63), 
        text = "[E] Exit",
        heading = 90.0, 
    },
    cookZone = { -- DON'T TOUCH!
        coord = vector3(1005.80,-3200.40,-38.52),
        text = "[E] Cook",
        startingCoord = vector3(1007.76, -3200.64, -39.0),
        startingText = "[E] Lit the oven",
        methMinCount = 10,
        methMaksCount = 20,
        takeMethText = "[E] Pick up "
    },
    packageZone = { -- DON'T TOUCH!
        coord = vector3(1011.80,-3194.90,-38.99),
        text = "[E] Package meth",
        takeMethText = "[E] Pick up",
    }

}

Config.Coca = {

    entry = { -- DON'T TOUCH!
        coord = vector3(1004.6, -1572.88, 30.8), 
        intcoord = vector3(1088.56, -3188.12, -39.0), 
        intheading = 183.55,
        text = "[E] Enter", 
    },
    exit = { -- DON'T TOUCH!
        intcoord = vector3(1088.72, -3187.8, -39.0), 
        coord = vector3(1004.6, -1572.88, 30.8), 
        text = "[E] Exit",
        heading = 90.0, 
    }, 
    gatheringZone = {
        coords = {
            [1] = {coord = vector3(1093.0, -3194.84, -39.0), heading = 183.39, rotx = -1.91, roty = -0.32, rotz = -0.60},
            [2] = {coord = vector3(1095.4, -3194.92, -39.0), heading = 183.39, rotx = -1.91, roty = -0.32, rotz = -0.60},
            [3] = {coord = vector3(1090.32, -3194.88, -39.0), heading = 183.39, rotx = -2.0, roty = -0.32, rotz = -0.60},
        },
        text = "[E] Gathering Coca",
        takeCoca = "[E] Pick up",
        count = 1, 
    },
    packageZone = {
        coord = vector3(1101.245,-3198.82,-39.0),
        text = "[E] Package Coca",
        takePackCoc = "[E] Pick up",
        heading = 180.34,
        count = 1, 
    }
}

Config.Weed = {
    entry = {
        coord = vector3(1047.04, -3203.65, -41.79),
        intcoord = vector3(1047.04, -3203.65, -41.79),
        intheading = 88.2,
        text = "[E] Enter",
    },
    exit = {
        intcoord = vector3(1047.04, -3203.65, -41.79),
        coord = vector3(1047.04, -3203.65, -41.79),
        heading = 254.92,
        text = "[E] Exit",
    },
    gatheringZone = {
        coords = {
            [1] = {coord = vector3(1057.42, -3197.87, -39.14), heading = 180.81},
            [2] = {coord = vector3(1060.82, -3193.31, -39.08), heading = 280.81},
            [3] = {coord = vector3(1053.47, -3194.41, -39.15), heading = 85.81},
        },
        text = "[E] Gathering Weed",
        count = 1,
    },
    packageZone = {
        coords = {
            [1] = {coord =  vector3(1047.04, -3203.65, -41.79), heading = 83.31, rotx = -0.60, roty = 0.0, rotz = -1.4},
            [2] = {coord = vector3(1047.04, -3203.65, -41.79), heading = 83.31, rotx = -0.60, roty = 0.0, rotz = -1.4},
        },
        text = "[E] Package Weed",
        count = 1, 
        takeText = "[E] Pick up",
    }
}


Config.Laundry = {
    entry = {
        coord = vector3(84.04, -1551.96, 29.6),
        intcoord = vector3(1138.0, -3198.96, -39.68),
        intheading = 11.64,
        text = "[E] Enter",
    },
    exit = {
        intcoord = vector3(1138.0, -3198.96, -39.68),
        coord = vector3(83.64, -1551.64, 29.6),
        heading = 46.85,
        text = "[E] Exit",
    },
    cuttingZone = {
        coords = vector3(1122.24, -3197.88, -40.4), 
        heading = 179.46,
        text = "[E] Cut the Money",
        countmin = 100,
        countmax = 200,
    },
    packageZone = {
        coord = vector3(1120.12, -3197.88, -39.92), 
        heading = 180.93,
        text = "[E] Turn into Banknote", 
    },
    washingZone = {
    coord = vector3(1122.32, -3194.6, -40.4), 
    heading = 346.76,
    text = "[E] Wash Money", 
}

}