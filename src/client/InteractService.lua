local InteractService = {}

	function InteractService.requestCultivating(Hoe,target)
		local plot = workspace.Plot:WaitForChild("Plot")
		if target == nil or Hoe == nil or  target.Parent.Name ~= "UnPlot" then return end
		
		local plot_clone = plot:Clone()
		plot_clone.Name = "Plot"
		plot_clone.CFrame = target.CFrame
		plot_clone.Parent = workspace
		target:Destroy()
		
		print("cloned")
	end
	
	function InteractService.requestPlanting()
		print("seed huhu")
		
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
			InteractService.requestPlanting()
			return
		

		elseif tool.Name == "WaterCan" then
			InteractService.requestWatering()
			return
		end
	end
return InteractService
