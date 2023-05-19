local sensorInfo = {
	name = "GetUnitsMoving",
	desc = "Returns a list of all units and give orders to bear",
	author = "Yeenya",
	date = "2023-18-05",
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
return function(furthestHill)
	units = Spring.GetSelectedUnitsSorted()
	local x, y, z = Spring.GetUnitPosition(units[162][1])
	Spring.GiveOrderToUnit(units[149][1], CMD.LOAD_UNITS, {x, y, z, 60}, {"shift"})
	Spring.GiveOrderToUnit(units[149][1], CMD.UNLOAD_UNITS, {furthestHill["x"] + 50, furthestHill["y"], furthestHill["z"], 10}, {"shift"})

	return units
end