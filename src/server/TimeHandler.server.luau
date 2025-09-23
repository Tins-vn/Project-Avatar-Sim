local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GetServerTime = ReplicatedStorage:WaitForChild("RemoteEvent").GetServerTime
local TimeService = require(game.ServerScriptService:FindFirstChild("TimeService"))

GetServerTime.OnServerEvent:Connect(function(player)
	local serverTime = TimeService.GetServerTime()
	GetServerTime:FireClient(player, serverTime)
end)