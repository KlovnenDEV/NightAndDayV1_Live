Config = {}

Config.Minigame = true
 -- true = Minigame Enabled(denalifw-lock)
 -- false = Minigame Disabled(denalifw-lock)
Config.InteractSound = false
 -- true = Machine Sounds Enabled
 -- false = Machine Sounds Disabled

Config.SlushyProp = {
    "prop_slush_dispenser",
    "prop_juice_dispenser",
}

Config.DonutProp = {
    "v_ret_247_donuts",
}

Config.IceCreamProp = {
    "", -- Unkown LOL
}

Config.BubbleGumStandProp = {
    "prop_gumball_03",
}

Config.Cooldowns = true
 -- true = Cooldowns Active
 -- false = Cooldowns Disabled
Config.SlushyCooldownTime = 2 -- Time is in Minutes
Config.SluckyBuckyDonutCooldownTime = 2 -- Time is in Minutes
Config.GumballStandCooldownTime = 2 -- Time is in Minutes

Config.SlushyCost = {
    RedSlushy = 3,
    GreenSlushy = 3,
    OrangeSlushy = 3,
    YellowSlushy = 3,
    BlueSlushy = 3,
    RainbowSlushy = 3,
}

Config.SluckyBuckyDonutCost = 8

Config.IceCreamCost = {
    VanillaIceCream = 6,
    ChocolateIceCream = 6,
    MintIceCream = 6,
    CookiesAndCreamIceCream = 6,
}

Config.GumBallCost = 1

Config.BubbleGumStandFailChance = true
 -- True = Chance for GumBall Stand to not give GumBall
 -- False = Chance Disabled

--Notification Settings
Config.Notify = "okok" --"qb" = Default (DenaliFW) | "okok" = OkOkNotify | "mythic" = Mythic Notifications | "tnj" = tnj-notify | "chat" = Simple Chat Message
Config.Notifications = {
    -- Success's
    ["SlushyGive"] = "You\'ve poured a Slushy!",
    ["SluckyDonutGive"] = "You\'ve grabbed a Super Donut!",
    ["IceCreamGive"] = "You\'ve scooped some Ice Cream!",
    ["BubbleGumGive"] = "You\'ve received a BubbleGum!",

    -- Cancel's
    ["ProgressbarCancelled"] = "You stopped grabbing the Product, why?",

    -- Fail's
    ["SlushyMinigameFail"] = "You failed to discretely pour the Product...",
    ["SluckyBuckyDonutMinigameFail"] = "You failed to discretely grab the Product...",
    ["IceCreamMinigameFail"] = "You failed to discretely scoop the Product...",
    ["BubbleGumStandFail"] = "You failed to discretely wait on the Product...",
    ["BubbleGumStandFailGive"] = "For some reason the Stand didn\'t give you a GumBall?!",

    -- Cooldown's
    ["SlushyCooldownActive"] = "The Machine seems to have run out of Slush?",
    ["SluckyBuckyDonutCooldownActive"] = "The Machine seems to have run out of Donuts?",
    ["IceCreamCooldownActive"] = "The Machine seems to have run out of Ice Cream?",
    ["BubbleGumStandCooldownActive"] = "The Machine seems to have run out of GumBalls?",

    --OkOk Titles
    ["okok_Title"] = "Store Aid"
}