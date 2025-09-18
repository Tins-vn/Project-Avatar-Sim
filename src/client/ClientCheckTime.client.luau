local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GetServerTime = ReplicatedStorage:WaitForChild("GetServerTime")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Request server time
GetServerTime:FireServer()

-- Listen for server response
GetServerTime.OnClientEvent:Connect(function(serverTime)
	print("Server Time from server:", serverTime)
	ParseTime(serverTime)
end)

function ParseTime(serverTime)
	-- Parse string to number
	local year, month, day, hour, minute, second = serverTime:match("(%d+)-(%d+)-(%d+):(%d+):(%d+):(%d+)")
	-- Convert the components to numbers
	year = tonumber(year)
	month = tonumber(month)
	day = tonumber(day)
	hour = tonumber(hour)
	minute = tonumber(minute)
	second = tonumber(second)
end