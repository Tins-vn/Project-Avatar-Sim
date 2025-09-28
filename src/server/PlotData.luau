local DataStoreService = game:GetService("DataStoreService")

local PlotData = {}
PlotData.__index = PlotData

local PlotsDataTemplate = {}

function PlotData.new(player,plot_index, cultivated: boolean,plot_plant,mature_time, water_cd)
	local LocalPlotData = {
		Key = player.UserId,
		Index = plot_index or nil,
		Plant = plot_plant or nil,
		Cultivated = cultivated or false,
		MatureTime = mature_time or nil,
		WaterCD = water_cd or nil,
		DataStore = DataStoreService:GetDataStore("Data")
	}
	setmetatable(LocalPlotData, PlotData)
	return LocalPlotData    
end

function PlotData:Save()
	local savedData
	local tabletosave = {
		self.Index, 
		self.Plant,
		self.Cultivated,
		self.MatureTime,
		self.WaterCD
	}
	
	local success, err = pcall(function()
		savedData = self.DataStore:SetAsync(self.Key, tabletosave)
	end)

	if success then
		if savedData then
			print("Data saved.")
		end
	else
		warn("There was a problem with saving your data")
		warn(err)
	end
end

function PlotData:Load()
	local Result
	local success, err = pcall(function()
		Result = self.DataStore:GetAsync(self.Key)
	end)

	if success then
		if Result then return Result end
	else
		warn("There was an error with fetching your data")
		warn(err)
	end
end

return PlotData
