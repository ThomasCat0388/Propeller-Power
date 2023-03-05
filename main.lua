local ply = game:GetService("Players").LocalPlayer
local jpower = 10
local run = false
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Propeller Power",
	LoadingTitle = "Propeller Power",
	LoadingSubtitle = "by SippingSizzurp"})

local Tab = Window:CreateTab("MAIN", 4483362458)


local Dropdown = Tab:CreateDropdown({
	Name = "Teleport",
	Options = {"Starter1","Starter2", "Starter3", "Starter4", "Snow", "Moon", "Desert", "Ice", "Farm", "Candy", "Safari", "Underwater", "Fire", "VIP"},
	CurrentOption = "Teleport to",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
        local filepath = game:GetService("Workspace").CollectWinsLocations
        local folder = filepath:FindFirstChild(Option)
        local tp = folder.Plaque.CFrame
        ply.Character.HumanoidRootPart.CFrame = tp
	  	  
	end,
})

local Slider = Tab:CreateSlider({
	Name = "JUMP POWER",
	Range = {0, 9000000},
	Increment = 50,
	Suffix = "JUMP POWER",
	CurrentValue = 10,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		jpower = Value
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "TOGGLE JUMP POWER",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
	    
		if Value then
		    run = true
		else
		    run = false
		end
		
	    while task.wait() and run do
	        ply.Character.Humanoid.JumpPower = jpower
	    end
	    
	end,
})
