config = {}
config.Mysql = 'ghmattisql' -- "ghmattisql", "msyql-async"
config.css = 'new' -- new or old -- new = 4 column, old 2 column
config.keybind = 'F11' -- change it whatever keybind do you like -- look more here https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
config.logo = 'https://cdn.discordapp.com/attachments/883427746305429555/951218861989064714/Night20And20Day-03.png' -- url of logo
config.UseIdentityname = true -- will not use steamname and it will use a firstname lastname from users table
config.Showid = true -- if false only admins can see the id
config.ShowAdmins = true -- if true admin badge will show near the avatar
config.ShowJobs = false -- show player jobs in scoreboard , if false only admins can see the jobs
config.adminfa = '<i class="fad fa-crown"></i>' -- font awsome icon to show
config.vipfa = '<i class="fad fa-star"></i>' -- fontawsome, change this whatever icon you want from fontawsome
config.ShowVips = true -- if true the player with users.vip will show a vip badge
config.whitelistedjobs = {
    --[[1] = {name = 'police', fa = '<i class="fad fa-siren-on"></i>', label = 'Police'},
    [2] = {name = 'ambulance', fa = '<i class="fas fa-user-md"></i>', label = 'EMS'},
    [3] = {name = 'mechanic', fa = '<i class="fad fa-car-mechanic"></i>', label = 'LSC Mech'},
    [4] = {name = 'mechanic2', fa = '<i class="fad fa-car-mechanic"></i>', label = 'Bennys Mech'},
    [5] = {name = 'mechanic4', fa = '<i class="fad fa-car-mechanic"></i>', label = '68 Mech'},
    [6] = {name = 'mechanic5', fa = '<i class="fad fa-car-mechanic"></i>', label = 'Denali Mech'},
    [7] = {name = 'cardealer', fa = '<i class="fad fa-car-mechanic"></i>', label = 'Reale Estate'},
    [8] = {name = 'lawyer', fa = '<i class="fad fa-car-mechanic"></i>', label = 'Lawyer'},
    [9] = {name = 'cardealer', fa = '<i class="fad fa-car-mechanic"></i>', label = 'PDM Sales'},]]
}
config.RandomAvatars = { -- if steam avatar is not available, we will use Initials avatar
    [1] = {background = 'ffffff', color = '308BFF'},
    [2] = {background = 'E2E519', color = '222'},
    [3] = {background = 'FF306E', color = 'ffffff'},
    [4] = {background = 'F000FF', color = 'ffffff'},
    [5] = {background = '2F2730', color = 'ffffff'},
}
config.useDiscordname = false -- use discord name
config.UseDiscordAvatar = true-- if true only discord avatar will be used and not steam
config.UseSelfUploadAvatar = false -- if true steam, discord avatar will be ignored: initials avatar is default if photo is missing/nil
config.CheckpingOnce = true -- save and check only ping once (more optimized for large city)