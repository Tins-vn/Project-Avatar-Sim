local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local response = ReplicatedStorage.RemoteEvent:WaitForChild("response")

local PlotDataModule = require(script.Parent.PlotData)
local TimeService = require(game.ServerScriptService:FindFirstChild("TimeService"))

local allPlayersPlot ={}

Players.PlayerAdded:Connect(function(player)
	allPlayersPlot[player.UserId] = {}

	for i = 1, 6,1 do
		local LocalPlotData = PlotDataModule.new(player,i,false)
		LocalPlotData:Load() --load in case
		allPlayersPlot[player.UserId][LocalPlotData.Index] = LocalPlotData
		response.Interact.PlotHandler:FireClient(player,LocalPlotData)
	end
	local serverTime = TimeService.GetServerTime()

	print(allPlayersPlot)
end)

Players.PlayerRemoving:Connect(function(player)
	local pData = allPlayersPlot[player.UserId] --search for player's data using user id
	if pData then
		pData:Save() --save data
		allPlayersPlot[player.UserId] = nil --remove it
	end
end)

