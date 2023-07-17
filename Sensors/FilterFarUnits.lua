local sensorInfo = {
	name = "FilterFarUnits",
	desc = "Filters out units that are in a dangerous zone in ttdr",
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

-- @description return a list of units that are not in a dangerous zone in ttdr
return function(units)
	filteredUnits = {}

	for i = 1, #units do
		local x, _, z = Spring.GetUnitPosition(units[i])
		if z < 6400 then
			filteredUnits[#filteredUnits + 1] = units[i]
		end
	end

	return filteredUnits
end