local sensorInfo = {
	name = "getAllyUnits",
	desc = "Return list of ally units.",
	author = "Yeenya",
	date = "2023-20-06",
	license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = -1

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- @description return current wind statistics
return function()
	return Spring.GetTeamUnitsSorted(Spring.GetLocalTeamID())
end