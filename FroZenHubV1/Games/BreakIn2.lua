local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FroZen Hub V1",
    SubTitle = "Break In 2",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 420),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "coins" }),
    Tp = Window:AddTab({ Title = "Teleport", Icon = "home" }),
    Ending = Window:AddTab({ Title = "Secret Ending", Icon = "airplay" }),
    Battle = Window:AddTab({ Title = "Combat", Icon = "swords" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "component" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "copyright" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "FroZen Hub has injected",
        Content = "report any bugs at https://dsc.gg/frozen-x",
        SubContent = "or copy the link trough the 'Misc' page", -- Optional
        Duration = 3.5 -- Set to nil to make the notification not disappear
    })
end

--things
for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			if v.Name == "Part" and v:FindFirstChild("TouchInterest") then
				firetouchinterest(v, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 0)
			end
		end

    	-- Floating Part
	local Part = Instance.new("Part")
	Part.Size = Vector3.new(5, 1, 5)
	Part.Parent = game:GetService("Workspace")
	Part.Anchored = true
	Part.Transparency = 1

	-- Locals
	local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/RScriptz/RobloxScripts/main/OrionLibKeybind.lua')))()
	local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
	local SelectedItem = "Med Kit"
	local Damange = 5
	local namecall
	local ScriptLoaded = false
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Lighting = game:GetService("Lighting")
	local OriginalWalkspeed = LocalPlayer.Character.Humanoid.WalkSpeed
	local OriginalJumpPower = LocalPlayer.Character.Humanoid.JumpPower
	local ModifiedWalkspeed = 50
	local ModifiedJumpPower = 100
	local OriginalBrightness = Lighting.Brightness
	local OriginalFog = Lighting.FogEnd
	local OriginalShadow = Lighting.GlobalShadows
	local HailClone = game:GetService("Workspace").Hails:Clone()
	getgenv().RemoveSlipping = false
	getgenv().SemiGodmode = false

    -- Remove Slipping Handler
	local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(self, ...)
		local args = {
			...
		}
		if getnamecallmethod() == 'FireServer' and self.Name == 'IceSlip' and RemoveSlipping == true then
			return task.wait(387420489)
		end
		return old(self, unpack(args))
	end)

    -- Semi-Godmode Handler
	namecall = hookmetamethod(game, "__namecall", function(self, ...)
		local args = {
			...
		}
		if getnamecallmethod() == 'FireServer' and self.Name == 'Energy' then
			if SemiGodmode == true then
				if args[1] < 0 then
					args[1] = 0
				end
			else
				args[1] = args[1]
			end
			return namecall(self, unpack(args))
		end
		return namecall(self, ...)
	end)

-- Tables
	local SecretEndingTable = {
		"HatCollected",
		"MaskCollected",
		"CrowbarCollected"
	}

	local ItemsTable = {
		"Crowbar 1",
		"Crowbar 2",
		"Bat",
		"Pitchfork",
		"Hammer",
		"Wrench",
		"Broom",
		"Armor",
		"Med Kit",
		"Key",
		"Gold Key",
		"Louise",
		"Lollipop",
		"Chips",
		"Golden Apple",
		"Pizza",
		"Gold Pizza",
		"Rainbow Pizza",
		"Rainbow Pizza Box",
		"Book",
		"Phone",
		"Cookie",
		"Apple",
		"Bloxy Cola",
		"Expired Bloxy Cola",
		"Bottle",
		"Ladder",
		"Battery"
	}

	-- Functions
	local function Notify(name, content, image, time)
		OrionLib:MakeNotification({
			Name = name,
			Content = content,
			Image = image,
			Time = time
		})
	end

	local function Delete(Instance)
		pcall(function()
			Events:WaitForChild("OnDoorHit"):FireServer(Instance)
		end)
	end

	local function UnequipAllTools()
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Backpack
			end
		end
	end

	local function EquipAllTools()
		for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Character
			end
		end
	end

	local function GiveItem(Item)
		if Item == "Armor" then
			Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(LocalPlayer), 1)
		elseif Item == "Crowbar 1" or Item == "Crowbar 2" or Item == "Bat" or Item == "Pitchfork" or Item == "Hammer" or Item == "Wrench" or Item == "Broom" then
			Events.Vending:FireServer(3, tostring(Item:gsub(" ", "")), "Weapons", LocalPlayer.Name, 1)
			--Notify('Credits To', "Leo Dicap On V3rmillion For Making This Feature!", 'rbxassetid://4483345998', 3)
		else
			Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
		end
	end

	local function GetBestTool()
		for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
			if v.Name:match("Circle") and v.Visible == true then
				GiveItem(tostring(v.Name:gsub("Circle", "")))
			end
		end
	end

	local function Train(Ability)
		Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
	end

	local function TakeDamange(Amount)
		Events:WaitForChild("Energy"):FireServer(-Amount, false, false)
	end

	local function TeleportTo(CFrameArg)
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameArg
	end

	local function GiveAll()
		GetBestTool()
		task.wait(.1)
		GiveItem("Armor")
		task.wait(.1)
		for i = 1, 5 do
			Train("Speed")
			Train("Strength")
		end
		task.wait(.1)
		UnequipAllTools()
		for i = 1, 15 do
			GiveItem("Gold Pizza")
			task.wait(0.05)
		end
	end

	local function HealAllPlayers()
		UnequipAllTools()
		task.wait(.2)
		GiveItem("Golden Apple")
		task.wait(.5)
		LocalPlayer.Backpack:WaitForChild("GoldenApple").Parent = LocalPlayer.Character
		task.wait(.5)
		Events:WaitForChild("HealTheNoobs"):FireServer()
	end

	local function HealYourself()
		GiveItem("Pizza")
		Events.Energy:FireServer(25, "Pizza")
	end

	local function BreakBarricades()
		for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
			for i = 1, 20 do
				if v:FindFirstChild("TreeHitPart") then
					Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
				end
			end
		end
	end

	local function BreakEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
		end)
	end

	local function KillEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 64.8, 4)
			end
			if game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true) then
				Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true), 64.8, 4)
			end
			if game:GetService("Workspace"):FindFirstChild("BadGuyBrute") then
				Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace").BadGuyBrute, 64.8, 4)
			end
		end)
	end

	local function GetDog()
		for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
			if v.Name:match("Circle") and v.Visible == true then
				GiveItem(tostring(v.Name:gsub("Circle", "")))
				task.wait(.1)
				LocalPlayer.Backpack:WaitForChild(tostring(v.Name:gsub("Circle", ""))).Parent = LocalPlayer.Character
				TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
				task.wait(.5)
				Events:WaitForChild("CatFed"):FireServer(tostring(v.Name:gsub("Circle", "")))
			end
		end
		task.wait(2)
		for i = 1, 3 do
			TeleportTo(CFrame.new(-203.533081, 30.4500484, -790.901428, -0.0148558766, 8.85941187e-09, -0.999889672, 2.65695732e-08, 1, 8.46563175e-09, 0.999889672, -2.64408779e-08, -0.0148558766) + Vector3.new(0, 5, 0))
			task.wait(.1)
		end
	end

	local function GetAgent()
		GiveItem("Louise")
		task.wait(.1)
		LocalPlayer.Backpack:WaitForChild("Louise").Parent = LocalPlayer.Character
		Events:WaitForChild("LouiseGive"):FireServer(2)
	end

	local function GetUncle()
		GiveItem("Key")
		task.wait(.1)
		LocalPlayer.Backpack:WaitForChild("Key").Parent = LocalPlayer.Character
		wait(.5)
		Events.KeyEvent:FireServer()
	end

	local function ClickPete()
		fireclickdetector(game:GetService("Workspace").UnclePete.ClickDetector)
	end

	local function CollectCash()
		for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			if v.Name == "Part" and v:FindFirstChild("TouchInterest") and v:FindFirstChild("Weld") and v.Transparency == 1 then
				firetouchinterest(v, LocalPlayer.Character.HumanoidRootPart, 0)
			end
		end
	end

	local function GetAllOutsideItems()
		TeleportTo(CFrame.new(-199.240555, 30.0009422, -790.182739, 0.08340507, 2.48169538e-08, 0.996515751, -2.7112752e-09, 1, -2.46767993e-08, -0.996515751, -6.43658127e-10, 0.08340507))
		for i, v in pairs(game:GetService("Workspace").OutsideParts:GetChildren()) do
			fireclickdetector(v.ClickDetector)
		end
		LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(-10, 0, 0))
	end

	local function BringAllEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
		end)
	end

	local function Noclip(State)
		LocalPlayer.Character.HumanoidRootPart.CanCollide = State
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("MeshPart") then
				v.CanCollide = State
			end
		end
	end

	local function GetSecretEnding()
		for i, v in next, SecretEndingTable do
			Events.LarryEndingEvent:FireServer(v, true)
		end
	end

	local function GetGAppleBadge()
		if game:GetService("Workspace"):FindFirstChild("FallenTrees") then
			for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
				for i = 1, 20 do
					if v:FindFirstChild("TreeHitPart") then
						Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
					end
				end
			end
			task.wait(1)
			TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
			task.wait(.5)
			fireclickdetector(game:GetService("Workspace").GoldenApple.ClickDetector)
		else
			Notify("Error", "Golden Apple Has Not Spawned Yet, Please Wait Until the First Wave.", 'rbxassetid://4483345998', 3)
		end
	end

	local function AntiMud(Touchable)
		for i, v in pairs(game:GetService("Workspace").BogArea.Bog:GetDescendants()) do
			if v.Name == "Mud" and v:IsA("Part") then
				if Touchable == true then
					v.CanTouch = false
				else 
					v.CanTouch = false
				end
			end
		end
	end

	local function SSAntiWind()
		if game:GetService("Workspace"):FindFirstChild("WavePart") then
			Delete(game:GetService("Workspace").WavePart)
		end
	end

	local function AntiWind()
		if game:GetService("Workspace"):FindFirstChild("WavePart") then
			game:GetService("Workspace").WavePart.CanTouch = false
		end
	end

--start
local Sky = Tabs.Main:AddSection("Weather Exploits")

local Toggle = Sky:AddToggle("Weathersploit", {Title = "Remove Wind", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().NoWindSS = Value
			while NoWindSS == true do
				SSAntiWind() 
				task.wait(.1)
			end
end)

Sky:AddButton({
        Title = "Remove Ice",
        Description = "removes ice for everyone",
        Callback = function()
            Delete(game:GetService("Workspace").Terrain)
        end
    })
    
Sky:AddButton({
        Title = "Remove Hailing",
        Description = "removes hailing for everyone",
        Callback = function()
            Delete(game:GetService("Workspace").Hails)
        end
    })
    
local Toggle = Sky:AddToggle("Mudsploit", {Title = "Remove Mud", Default = false })
Toggle:OnChanged(function(Value)
        for i, v in pairs(game:GetService("Workspace").BogArea.Bog:GetDescendants()) do
				if v.Name == "Mud" and v:IsA("Part") then
					Delete(v)
				end
			end
end)

local Item = Tabs.Main:AddSection("Items")

local Dropdown = Item:AddDropdown("Item Selector", {
        Title = "Select Items",
        Values = ItemsTable,
        Multi = false,
        Default = 1,
})
Dropdown:OnChanged(function(Value)
        if Value == 'Book' or Value == 'Phone' then
				Fluent:Notify({
      Title = "FroZen Hub X",
      Content = 'Warning', Value .. " Wont Work Unless You Own The Corresponding Gamepass.",
      SubContent = "", -- Optional
      Duration = 5 -- Set to nil to make the notification not disappear
})
			end
			SelectedItem = Value
    end)
    
Item:AddButton({
        Title = "Get Item",
        Description = "",
        Callback = function()
            GiveItem(SelectedItem)
        end
    })
    
local Train = Tabs.Main:AddSection("Training")

Train:AddButton({
        Title = "Train Strenght",
        Description = "",
        Callback = function()
            Train("Strength")
        end
    })
    
Train:AddButton({
        Title = "Train Speed",
        Description = "",
        Callback = function()
            Train("Speed")
        end
    })
    
local Heal = Tabs.Main:AddSection("Heals")

Heal:AddButton({
        Title = "Heal You",
        Description = "",
        Callback = function()
            HealYourself()
        end
    })
    
Heal:AddButton({
        Title = "Heal All",
        Description = "",
        Callback = function()
            HealAllPlayers()
        end
    })
    
local Toggle = Heal:AddToggle("HealYouLoop", {Title = "Auto Heal You", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().HealLoop = Value
			while HealLoop do
				HealYourself()
				task.wait(.1)
			end
end)

local Toggle = Heal:AddToggle("HealAllLoop", {Title = "Auto Heal All", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().HealAllLoop = Value
			while HealAllLoop do
				HealAllPlayers()
				task.wait(3)
			end
end)

local Other = Tabs.Main:AddSection("Other")

local Toggle = Other:AddToggle("SemiGod", {Title = "Semi-God Mode", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().SemiGodmode = Value
			if SemiGodmode == true then
				Fluent:Notify({
      Title = "FroZen Hub X | Semi-God Mode",
      Content = "only works on special attacks, hailing and few others",
      SubContent = "", -- Optional
      Duration = 5 -- Set to nil to make the notification not disappear
})
			end
end)


local Toggle = Other:AddToggle("NoHail", {Title = "No Hailing", Default = false })
Toggle:OnChanged(function(Value)
        if Value == false then
				if ScriptLoaded == true then
					HailClone.Parent = game:GetService("Workspace")
				end
			else
				HailClone = game:GetService("Workspace").Hails:Clone()
				game:GetService("Workspace").Hails:Destroy()
			end
end)

local Toggle = Other:AddToggle("NoWind", {Title = "No Wind", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().NoWind = Value
			while NoWind == true do
				AntiWind()
				task.wait(.5)
			end
end)

local Toggle = Other:AddToggle("NoMud", {Title = "No Mud", Default = false })
Toggle:OnChanged(function(Value)
        AntiMud(Value)
end)

local Toggle = Other:AddToggle("Lag/Crash Server", {Title = "Lag (or Crash) Server", Default = false })
Toggle:OnChanged(function(Value)
        while Value == true do 
				for i = 1, 10 do
					for i = 1, 4 do
						Events:WaitForChild("OutsideFood"):FireServer(6, {
							["item2"] = "Pizza",
							["placement"] = i
						})
						Events:WaitForChild("OutsideFood"):FireServer(6, {
							["item2"] = "BloxyPack",
							["placement"] = i
						})
					end
				end
				task.wait(.1)
			end
end)

Other:AddButton({
        Title = "Get Best Weapon",
        Description = "",
        Callback = function()
            GetBestTool()
        end
    })
    
Other:AddButton({
        Title = "Get All Equipment",
        Description = "",
        Callback = function()
            GiveAll()
        end
})
    
--teleport part
local Tp = Tabs.Tp:AddSection("Main")

Tp:AddButton({
        Title = "Boss Fight",
        Description = "",
        Callback = function()
            TeleportTo(CFrame.new(-1565.78772, -368.711945, -1040.66626, 0.0929690823, -1.97564436e-08, 0.995669007, -1.53269308e-08, 1, 2.1273511e-08, -0.995669007, -1.72383299e-08, 0.0929690823))
        end
})

Tp:AddButton({
        Title = "Shop",
        Description = "",
        Callback = function()
            TeleportTo(CFrame.new(-246.653229, 30.4500484, -847.319275, 0.999987781, -9.18427645e-08, -0.00494772941, 9.19905787e-08, 1, 2.96483353e-08, 0.00494772941, -3.01031164e-08, 0.999987781))
        end
})

Tp:AddButton({
        Title = "Kitchen",
        Description = "",
        Callback = function()
            TeleportTo(CFrame.new(-249.753555, 30.4500484, -732.703125, -0.999205947, -1.97705017e-08, 0.0398429185, -2.00601384e-08, 1, -6.86967372e-09, -0.0398429185, -7.66347341e-09, -0.999205947))
        end
})

Tp:AddButton({
        Title = "Arena",
        Description = "",
        Callback = function()
            TeleportTo(CFrame.new(-255.521988, 62.7139359, -723.436035, -0.0542500541, 4.28905356e-09, -0.998527408, 1.07862625e-08, 1, 3.70936082e-09, 0.998527408, -1.05691456e-08, -0.0542500541))
        end
})

Tp:AddButton({
        Title = "Gym",
        Description = "",
        Callback = function()
            TeleportTo(CFrame.new(-256.477448, 63.4500465, -840.825562, 0.999789953, 2.17116263e-08, 0.020495005, -2.15169358e-08, 1, -9.7199333e-09, -0.020495005, 9.27690191e-09, 0.999789953))
        end
})

Tp:AddButton({
        Title = "G-Apple",
        Description = "",
        Callback = function()
            TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
        end
})

Tp:AddButton({
        Title = "Middle Room",
        Description = "",
        Callback = function()
            TeleportTo(CFrame.new(-209.951859, 30.4590473, -789.723877, -0.0485812724, 6.74905039e-08, 0.998819232, 1.19352916e-09, 1, -6.75122394
