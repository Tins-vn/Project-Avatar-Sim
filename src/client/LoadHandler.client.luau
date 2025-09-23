local ReplicatedStorage = game:GetService("ReplicatedStorage")
local response = ReplicatedStorage.RemoteEvent:WaitForChild("response")
local PlotsFolder = workspace:WaitForChild("Plots")

local sample_model = ReplicatedStorage.Farm:FindFirstChild("PlotModel").CultivatedPlot

local LocalRender = require(script.Parent.LocalRender)

local function loadClientsPlot(PlotData)
	local plotModel =  PlotsFolder:FindFirstChild(PlotData.Index) --get Model
	if plotModel == nil then return end
	if PlotData.Cultivated == true then
		local plot_mesh = plotModel:WaitForChild("PlotMesh")
		LocalRender.Duplicate(plot_mesh, sample_model,"CultivatedPlot")
	end
	
	if PlotData.WaterCD then
		local plot_mesh = plotModel:FindFirstChild("PlotMesh") or plotModel:FindFirstChild("CultivatedPlot")
		print(plot_mesh)
		LocalRender.Water(plot_mesh)
	end
	
	if PlotData.Plant then
		print(PlotData.Plant)
	end
end

response.Interact.PlotHandler.OnClientEvent:Connect(loadClientsPlot)