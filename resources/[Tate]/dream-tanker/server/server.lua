local DenaliFW = exports['denalifw-core']:GetCoreObject()
DenaliFW.Functions.CreateCallback('dream-tanker:payout', function(source, cb)
	local xPlayer = DenaliFW.Functions.GetPlayer(source)
    local money = math.random(Config.PayOutMin, Config.PayOutMax)
	xPlayer.Functions.AddMoney('cash', money)
    cb(money)
end)

DenaliFW.Functions.CreateCallback('dream-tanker:buytruck', function(source, cb)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)

    if xPlayer.PlayerData.money.cash >= Config.TruckPrice then
        xPlayer.Functions.RemoveMoney('cash', Config.TruckPrice)

            local result = exports.oxmysql:executeSync('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
                ['@identifier'] = xPlayer.PlayerData.citizenid,
                ['@job'] = 'tanker',
            })
            if result[1] ~= nil then
                exports.oxmysql:execute('UPDATE dream_jobs SET first_time = @first_time WHERE identifier=@identifier AND job=@job', {
                    ['@identifier'] = xPlayer.PlayerData.citizenid,
                    ['@first_time'] = 'true',
                    ['@job'] = 'tanker',
                })
            end

		cb(true)
    elseif xPlayer.PlayerData.money.bank >= Config.TruckPrice then
        xPlayer.Functions.RemoveMoney('bank', Config.TruckPrice)

            local result = exports.oxmysql:executeSync('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
                ['@identifier'] = xPlayer.PlayerData.citizenid,
                ['@job'] = 'tanker',
            })
            if result[1] ~= nil then
                exports.oxmysql:execute('UPDATE dream_jobs SET first_time = @first_time WHERE identifier=@identifier AND job=@job', {
                    ['@identifier'] = xPlayer.PlayerData.citizenid,
                    ['@first_time']   = 'true',
                    ['@job'] = 'tanker',
                })
            end

        cb(true)
	else
		cb(false)
	end
end)

DenaliFW.Functions.CreateCallback('dream-tanker:gettruck', function(source, cb, mode)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)

    if mode == 'gettruck' then
        if xPlayer.PlayerData.money.cash >= Config.TruckOutPrice then
            xPlayer.Functions.RemoveMoney('cash', Config.TruckOutPrice)         
            cb(true)
        elseif xPlayer.PlayerData.money.bank >= Config.TruckOutPrice then
            xPlayer.Functions.RemoveMoney('bank', Config.TruckOutPrice)         
            cb(true)
        else
            cb(false)
        end
    elseif mode == 'backtruck' then
        xPlayer.Functions.AddMoney('cash', Config.TruckOutPrice)
        cb(true)
    end
end)

DenaliFW.Functions.CreateCallback('dream-tanker:getdatabase', function(source, cb, xPlayer)
    local xPlayer = DenaliFW.Functions.GetPlayer(source)

    local result = exports.oxmysql:executeSync('SELECT * FROM dream_jobs WHERE identifier=@identifier AND job=@job', {
        ['@identifier'] = xPlayer.PlayerData.citizenid,
        ['@job'] = 'tanker',
    })

    if result[1] ~= nil then
        cb(result[1].first_time) 
    else
        exports.oxmysql:execute('INSERT INTO dream_jobs (identifier,experience,pickaxe,job,first_time) VALUES (@identifier,@experience,@pickaxe,@job,@first_time)', {
            ['@identifier'] = xPlayer.PlayerData.citizenid,
            ['@experience'] = 0,
            ['@pickaxe'] = 0,
            ['@job'] = 'tanker',
            ['@first_time'] = 'false',
        })
        cb('false') 
    end

end)


