local DataModule = {}

-------Base
--For base data such as coin,money,level,etc
--

-------Inventory
--For Storing Items
--
local DATATEMPLATE = {

    Cash = 0,
    Inventory = {"Wheat Seed","Wheat Seed","Wheat Seed"},
	PlotsData = {},
    Furniture = {}
}
DataModule.Data = table.clone(DATATEMPLATE)

DataModule.WIPEDATA = function()
	DataModule.Data = table.clone(DATATEMPLATE)
	print(DataModule.Data)
end

DataModule.RefreshInventoryGui = function()
	local plr:Player = script:FindFirstAncestorWhichIsA("Player")
	local plrgui:PlayerGui = plr:WaitForChild("PlayerGui")
	local InventoryScroll = plrgui:WaitForChild("Inventory"):WaitForChild("Background"):WaitForChild("ScrollingFrame")
	local Template:TextButton = plrgui:WaitForChild("Inventory").Template.Item
	for i,v in pairs(InventoryScroll:GetChildren()) do
		if not v:IsA("UIListLayout") then
			v:Destroy()
		end
	end
	for i,v in pairs(DataModule.Data.Inventory) do
		local New = Template:Clone()
		New.Parent = InventoryScroll
		New.Name = v
		New.LayoutOrder = i
		New.Text = v
		New.Visible = true
	end
end

DataModule.Inventory_AddItem = function(ItemName:string)
	table.insert(DataModule.Data.Inventory,ItemName)
	DataModule.RefreshInventoryGui()
	print("inserted "..ItemName)
end
DataModule.Inventory_RemoveItem = function(ItemName:string,Amount:number)
	local count = Amount
	for i,v in pairs(DataModule.Data.Inventory) do
		if v == ItemName and count ~= 0 then
			table.remove(DataModule.Data.Inventory,i)
			count -= 1
			print("removed 1 "..ItemName)
		end
	end
	DataModule.RefreshInventoryGui()
end
DataModule.Inventory_CountItem = function(ItemName:string)
	local count = 0
	for i,v in pairs(DataModule.Data.Inventory) do
		if v == ItemName then
			count += 1
			print("Counted 1 "..ItemName)
		end
	end
	print("Counted a total of "..count.." "..ItemName)
	return count
end
----------------------------------------------------------------------------
DataModule.FashionStorage_Add = function(Name:string)
	table.insert(DataModule.Data.FashionStorage,Name)
	print("inserted "..Name)
end
DataModule.FashionStorage_Check = function(CheckFor:string)
	local Have = table.find(DataModule.Data.FashionStorage,CheckFor,1)
	return Have
end
----------------------------------------------------------------------------
DataModule.Add_PlantToData = function(Name:string,Plot:number)

	local a = {[Name] = {
		 ["Name"] = Name
		,["Plot"] = Plot
		,["PlantedTime"] = os.time()
		,["GrowTime"] = 0
		,["Stage"] = 1}
	}
	table.insert(DataModule.Data.PlantsData,a[Name])
	print(a[Name])
	return a[Name]
end

DataModule.Remove_PlantFromData = function(Name:string,Plot:number)
	for i,v in pairs(DataModule.Data.PlantsData) do
		if v.Name == Name and v.Plot == Plot then
			table.remove(DataModule.Data.PlantsData,i)
		end
	end
end
----------------------------------------------------------------------------
DataModule.Base_ChangeData = function(DataName:string,Changeto)
	if DataModule.Data.Base[DataName] then
		DataModule.Data.Base[DataName] = Changeto
	end
end
----------------------------------------------------------------------------
DataModule.AddPlot = function(name)
	table.insert(DataModule.Data.PlantedPlotData,name)
end
DataModule.RemovePlot = function(name)
	table.remove(DataModule.Data.PlantedPlotData,table.find(DataModule.Data.PlantedPlotData,name,1))
end
DataModule.FindPlot = function(name)
	return table.find(DataModule.Data.PlantedPlotData,name,1)
end
return DataModule
