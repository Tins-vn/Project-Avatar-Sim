local LocalRender = {}
	function LocalRender.Duplicate(object,sample_model, name)
		local plot_clone = sample_model:Clone()
		if  plot_clone == nil then return end
		plot_clone.Name = name
		plot_clone.CFrame = object.CFrame
		if object.Parent == nil then return end
		plot_clone.Parent = object.Parent
		object:Destroy()
	end
	
	function LocalRender.Water(object:Instance)
		if object == nil then return end
		object.Color = Color3.new(0.211765, 0.133333, 0)
	end 
	
	
return LocalRender
