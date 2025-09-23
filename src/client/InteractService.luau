local ReplicatedStorage = game:GetService("ReplicatedStorage")
local request = ReplicatedStorage:WaitForChild("RemoteEvent").request
local Farm = ReplicatedStorage:WaitForChild("Farm")

local plot_model = Farm:WaitForChild("PlotModel").CultivatedPlot


local InteractService = {} -- Client's script

	function InteractService.requestCultivating(tool,target)
		if target == nil or tool == nil or  target.Name ~= "PlotMesh" then return end
		if target.Name ~= "PlotMesh" then return end
		
		local index = target.Parent.Name
		-- local CultivateSuccess = CultivateRemote:InvokeServer(index)
		
		-- print(CultivateSuccess)
		-- if not CultivateSuccess then return end
		local plot_clone = plot_model:Clone()
		plot_clone.Name = "CultivatedPlot"
		plot_clone.CFrame = target.CFrame
		plot_clone.Parent = target.Parent
		target:Destroy()
	end
	
	function InteractService.requestPlanting(tool, target)
		if tool == nil or target == nil then return end
		if target.Name ~= "CultivatedPlot" then return end
		print(target)
		local seed_model = nil
		
		if seed_model == nil then return end
		
		local seed_clone = seed_model:Clone()
		seed_clone.Name = "Seed"
		seed_clone.CFrame = target.CFrame
		seed_clone.Parent = target.Parent
		seed_clone.Anchored = true
		print(seed_clone)
	end
	
	function InteractService.requestWatering()
		print("water huhu")
	end
	
	function InteractService.HandInteract()
		print("hand huhu")
	end
	
	function InteractService.mainProcess(tool, target)
		if not tool then
			InteractService.HandInteract()
			return
			

		elseif tool.Name == "Hoe" then
			InteractService.requestCultivating(tool,target)
			return
		

		elseif tool.Name == "Seed" then
			InteractService.requestPlanting(tool,target)
			return
		

		elseif tool.Name == "WaterCan" then
			InteractService.requestWatering()
			return
		end
	end
	function LimitedDistance(player:Player,target)
		local character = player.Character
		
	end
return InteractService
