Config = {}

-----------------
-- Utility
-----------------
Config.Target = "denalifw-target"
Config.QBMenu = "denalifw-menu"
Config.SkillBar = "denalifw-skillbar" 							-- You can use: np-skillbar / qb-skillbar / reload-skillbar
Config.Phone = "denalifw-phone" 									-- qb-phone or gksphone
Config.PhoneSendEmailQBPhone = "denalifw-phone:server:sendNewMail"
Config.PhoneSendEmailGKSPhone = "gksphone:NewMail"
Config.TriggerInventoryItemBox = "inventory:client:ItemBox"
Config.EstadoVeiculo = math.random(1,10) 					-- Don't touch
Config.TempoEsperaParaFazerNovamente = 900000 				-- 15 minutes
Config.TempoParaConstruir = 900000							-- 15 minutes
Config.TempoEsperaSpawnVeiculo = 10000 						-- 15 minutes
Config.ChanceSairMaterial = 90 								-- The higher, the less chance they have of 100 in this case being 90, they only have 10% to leave.
Config.CommandState = "estado" 								-- Command to rebuild
Config.ProcurarNoLixo = false 								-- If true, then you can search on scrap metal. If false, you can't search on scarp metal.


Config.Carros = {
    [1] = {carro = "t20"},       		-- Name of car
    [2] = {carro = "adder"},      		-- Name of car
    [3] = {carro = "futo"},       		-- Name of car
    --[4] = {carro = "speeder2"},     	-- Name of car
}

Config.SpawnCarro = {
    [1] = {x = 1204.30, y = -3116.05, z = 5.54, h = 358.90},    	-- Location to spawn car
}

-----------------
-- Notifications
-----------------
Config["Notificacoes"] = {
	["CooldownSuccess"] 		= "You can now build the car again.",
	["TimeToConstruct"] 		= "You have 15 minutes to build the car.",
	["TimeEnded"] 				= "Build time is over.",
	["NaoPodes"] 				= "You still can't do that.",
	["FormaErrada"] 			= "You are not doing it correctly.",
	["MotorJaInstalado"] 		= "You already installed the engine.",
	["PortaJaInstalada"] 		= "You already installed the doors.",
	["PneuJaInstalado"]			= "You already installed the tires.",
	["TravagemJaInstalada"] 	= "You already installed the brakes.",
	["SuspensaoJaInstalada"] 	= "You already installed the suspension.",
	["VidrosJaInstalados"] 		= "You already installed the glasses.",
	["NaoTensMotorContigo"] 	= "You don't have any engines with you.",
	["NaoTensPortaContigo"] 	= "You don't have any doors with you.",
	["NaoTensPneuContigo"] 		= "You don't have any tires with you.",
	["NaoTensTravagemContigo"] 	= "You don't have any brakes with you.",
	["NaoTensSuspensaoContigo"] = "You don't have any suspension with you.",
	["NaoTensVidrosContigo"] 	= "You don't have any glasses with you.",
	["VeiculoTeu"]				= "The vehicle is now yours. Go to depot to pick up!",
	["JaProcurado"] 			= "Already searched.",
	["NadaEncontrado"] 			= "You didn't find anything.",
	["VoltaDaqui"]				= "Come back in 15 minutes.",
	["Falhaste"] 				= "You failed."
}

-----------------
-- Email
-----------------
Config.Sender = "John"
Config.Title = "Item List"
Config.Message = "You will need the following items: <br> 1x Engine <br> 1x Door <br> 1x Brakes <br> 1x Suspension <br> 1x Glasses <br> 1x Tires"

-----------------
-- Targets
-----------------
-- Start Mission
Config.TargetComecarMissaoLoc = vector3(1515.59, -2137.4, 76.73)
Config.TargetComecarMissao = "Order Car"
Config.TargetIconComecarMissao = "fas fa-car"
-- Search on sucata
Config.TargetSucata = "Search"
Config.TargetIconSucata = "fas fa-dumpster"

-----------------
-- Menus
-----------------
-- After construction vehicle
Config.QBMenuAfterHeader = "Built Vehicle"
Config.QBMenuAfterEstado = "State"
Config.QBMenuAfterEstado2 = "100%"
Config.QBMenuAfterObter = "Get Vehicle"
Config.QBMenuAfterFechar = "Close"
-- Before construction vehicle
Config.QBMenuBeforeHeader = "Vehicle Status"
Config.QBMenuBeforeEstado = "State"
Config.QBMenuBeforeEstado2 = "State: "
Config.QBMenuBeforeNecessary = "Required Parts"
Config.QBMenuBeforeItens = "1x Engine | 1x Door | 1x Brakes <br> 1x Suspension | 1x Glasses | 1x Tires"
Config.QBMenuBeforeConstruction = "Build the car"
Config.QBMenuBeforeFechar = "Close"
-- Construction Vehicle
Config.QBMenuConstructionHeader = "Build Vehicle"
Config.QBMenuColocarMotor = "Put Engine"
Config.QBMenuColocarPorta = "Put Doors"
Config.QBMenuColocarPneu = "Put Tires"
Config.QBMenuColocarTravagem = "Put Brakes"
Config.QBMenuColocarSuspensao = "Put Suspension"
Config.QBMenuColocarVidros = "Put Glasses"
Config.QBMenuConstructionClose = "Close"

-----------------
-- Progressbars
-----------------
Config["ProgressBars"] = {
	["ColocarMotor"] = "Putting the engine...",
	["ColocarPorta"] = "Putting the doors...",
	["ColocarPneus"] = "Putting the tires...",
	["ColocarTravagem"] = "Putting the brakes...",
	["ColocarSuspensao"] = "Putting the suspension...",
	["ColocarVidros"] = "Putting the glasses...",
}

-----------------
-- Times of Progressbars
-----------------
Config.TimePutMotor = 5000
Config.TimePutPorta = 5000
Config.TimePutPneu = 5000
Config.TimePutTravagem = 5000
Config.TimePutSuspensao = 5000
Config.TimePutVidros = 5000

-----------------
-- Animations of Progressbars
-----------------
Config.AnimationPutMotor1 = "mini@repair"
Config.AnimationPutMotor2 = "fixing_a_player"
--
Config.AnimationPutPorta1 = "mini@repair"
Config.AnimationPutPorta2 = "fixing_a_player"
--
Config.AnimationPutPneu1 = "mini@repair"
Config.AnimationPutPneu2 = "fixing_a_player"
--
Config.AnimationPutTravagem1 = "mini@repair"
Config.AnimationPutTravagem2 = "fixing_a_player"
--
Config.AnimationPutSuspensao1 = "mini@repair"
Config.AnimationPutSuspensao2 = "fixing_a_player"
--
Config.AnimationPutVidros1 = "mini@repair"
Config.AnimationPutVidros2 = "fixing_a_player"

-----------------
-- Lixo
-----------------
Config.CenasDoLixo = { 							-- Less valuable items to drop when scavenging scrap
    "bottle", "can", "steal",
}

Config.PecasCarro = { 							-- Most Valuable Items to Drop When Scavenging in Scrap
    "motordecarro", "portadecarro", "pneudecarro", "suspensaodecarro", "travagemdecarro", "vidrodecarro",
}

