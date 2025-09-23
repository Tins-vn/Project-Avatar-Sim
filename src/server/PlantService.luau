local PlantService = {}
PlantService.__index = PlantService

-- Plant class
local Plant = {}
Plant.__index = Plant

-- Plant constructor
function Plant.new(name: string , grow_time, harvest_time_left:IntValue)
    local self = {
        Name = name or "Unknown",
        Time = grow_time or "Error_grow_time",
        HarvestTimeLeft = harvest_time_left or 0,
        IsHarvested = false
    }
    setmetatable(self, Plant)
    return self
end

function Plant.handlePlanting()
	print("handlePlanting")
end

return PlantService

