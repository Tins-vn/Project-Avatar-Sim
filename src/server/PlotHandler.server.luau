local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local response = ReplicatedStorage.RemoteEvent:WaitForChild("response")

local PlotData = require(script.Parent.PlotData)
local TimeService = require(game.ServerScriptService:FindFirstChild("TimeService"))

local allPlayersPlot ={}

Players.PlayerAdded:Connect(function(player)
	allPlayersPlot[player.UserId] = {} 
	for i = 1, 6,1 do
		local PlotData = PlotData.new(player,i,true,"Tomato",12, 12 )
		PlotData:Load() --load in case
		print(i)
		allPlayersPlot[player.UserId][PlotData.Index] = PlotData
		response.Interact.PlotHandler:FireClient(player,PlotData)
	end
	local serverTime = TimeService.GetServerTime()
	
	print(allPlayersPlot)
end)

local function CultivateFunction(player, index)
	if index == nil then return end
	local Plot = PlotData.new(player, index, "potato")
	return true
end
