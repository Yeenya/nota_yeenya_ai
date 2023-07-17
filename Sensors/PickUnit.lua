local sensorInfo = {
	name = "PickUnit",
	desc = "Picks a unit from a query that needs to be rescued",
	author = "Yeenya",
	date = "2023-07-17",
	license = "none",
}

-- get madatory module operators
VFS.Include("modules.lua") -- modules table
VFS.Include(modules.attach.data.path .. modules.attach.data.head) -- attach lib module

-- get other madatory dependencies
attach.Module(modules, "message") -- communication backend load

local EVAL_PERIOD_DEFAULT = -1 -- acutal, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- @description return unit that needs to be rescued
return function(query)
	unitToRescue = nil
	for unit, value in pairs(query) do
		if value == 0 then
			unitToRescue = unit
			break
		end
	end

	if unitToRescue ~= nil then
		query[unitToRescue] = 1
	end

	return unitToRescue
end