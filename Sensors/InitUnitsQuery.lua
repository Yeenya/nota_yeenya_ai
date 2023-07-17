local sensorInfo = {
	name = "InitUnitsQuery",
	desc = "Initializes availability query list for units",
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

-- @description return current wind statistics
return function(units)
	query = {}

	for i = 1, #units do
		query[units[i]] = 0
	end

	return query
end