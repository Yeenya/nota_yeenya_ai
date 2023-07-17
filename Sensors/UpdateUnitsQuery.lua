local sensorInfo = {
	name = "UpdateUnitsQuery",
	desc = "Updates unit query with new info about a unit.",
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

-- @description update unit query
return function(query, unit)
	if unit == nil then
		return
	end

	query[unit] = 0

	toRemove = {}
	for unit, _ in pairs(query) do
		if not Spring.ValidUnitID(unit) then
			toRemove[#toRemove + 1] = unit
		end
	end

	for i = 1, #toRemove do
		query[toRemove[i]] = nil
	end
end