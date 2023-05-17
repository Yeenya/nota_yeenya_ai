local sensorInfo = {
	name = "windDirection",
	desc = "Return the direction of wind.",
	author = "Yeenya",
	date = "2023-17-05",
	license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = -1

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- speedups
local SpringGetWind = Spring.GetWind

-- @description return current wind statistics
return function()
	local dirX, dirY, dirZ, strength, normDirX, normDirY, normDirZ = SpringGetWind()
	return {
		x = dirX,
		z = dirZ,
	}
end