-- https://modit.store
-- ModFreakz
local DenaliFW = exports['denalifw-core']:GetCoreObject()

SqlFetch = function(statement,payload,callback)
  exports['ghmattimysql']:execute(statement,payload,callback)
end

SqlExecute = function(statement,payload,callback)
  exports['ghmattimysql']:execute(statement,payload,callback)
end