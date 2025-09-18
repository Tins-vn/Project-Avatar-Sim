local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local InteractService = require(player.PlayerScripts:WaitForChild("InteractService"))

local mouse = Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
	local starttime = os.clock()
	local tool = character:FindFirstChildOfClass("Tool")
	local target = mouse.Target
	print(target)
	InteractService.mainProcess(tool, target)
	print(os.clock() - starttime)
end)
