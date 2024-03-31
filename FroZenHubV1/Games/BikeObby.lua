
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FroZen Hub V1",
    SubTitle = "Obby but You're on a bike",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 420),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "bike" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "component" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "copyright" })
}

local Options = Fluent.Options

--functions
function bike()
if Game.PlaceId == place1 then
local targetPart = game.Workspace.WorldMap.Checkpoints["99"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place2 then
local targetPart = game.Workspace.WorldMap.Checkpoints["51"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place3 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place4 then
local targetPart = game.Workspace.WorldMap.Checkpoints["52"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place5 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place6 then
local targetPart = game.Workspace.WorldMap.Checkpoints["50"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place7 then
local targetPart = game.Workspace.WorldMap.Checkpoints["60"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place8 then
local targetPart = game.Workspace.WorldMap.Checkpoints["41"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place0 then
local targetPart = game.Workspace.WorldMap.Checkpoints["40"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == placeEz then
local targetPart = game.Workspace.WorldMap.Checkpoints["41"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place9 then
local targetPart = game.Workspace.WorldMap.Checkpoints["100"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place10 then
local targetPart = game.Workspace.WorldMap.Checkpoints["39"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place11 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place12 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place13 then
local targetPart = game.Workspace.WorldMap.Checkpoints["71"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place14 then
local targetPart = game.Workspace.WorldMap.Checkpoints["60"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place15 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place16 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place17 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place18 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place19 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == placeSpring then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == placeCyber then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == placeWinter then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == placeLava then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place20 then
local targetPart = game.Workspace.WorldMap.Checkpoints["70"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
elseif Game.PlaceId == place21 then
local targetPart = game.Workspace.WorldMap.Checkpoints["96"]:FindFirstChild("Pole")

if targetPart then
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = CFrame.new(targetPart.Position)
else
    warn("Target part not found")
end
end
end

--worlds
place1 = 14184086618
place2 = 14483937954
place3 = 14666799841
place4 = 14840620690
place5 = 14928421933
place6 = 14997446013
place7 = 15063879640
place8 = 15208940765
place0 = 15131057422
placeEz = 15278398765
place9 = 15321953290
place10 = 15388975600
place11 = 15459974550
place12 = 15524081759
place13 = 15585510204
place14 = 15652691914
place15 = 15816270940
place16 = 16227489994
place17 = 16403332463
place18 = 16487157604
place19 = 16592062151
place20 = 16680372730
place21 = 16836441123
placeSpring = 16592072587
placeCyber = 15998821941
placeWinter = 15652688446
placeLava = 15895797618

--start
local Main = Tabs.Main:AddSection("Bike")

local Dropdown = Main:AddDropdown("Bike Select", {
        Title = "Select Bike",
        Values = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,90,91,92,93,94,95},
        Multi = false,
        Default = 1,
})
Dropdown:OnChanged(function(Value)
        biketype = Value
    end)
    
Main:AddButton({
        Title = "Get Selected bike",
        Description = "allows you to use the bike selected by the dropdown",
        Callback = function()
game:GetService("ReplicatedStorage").RemoteEvents.PublishBike:FireServer("BikeType",biketype)
game:GetService("ReplicatedStorage").RemoteEvents.ReportDeath:FireServer()
        end
    })

Main:AddButton({
        Title = "Finish Obby",
        Description = "conpletes the obby instantly",
        Callback = function()
bike()
        end
    })

local Next = Tabs.Main:AddSection("Trophy Related")

local Toggle = Tabs.Main:AddToggle("SafeFarm", {Title = "Autofarm Trophies (Safe)", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().farmsafe = Value
while getgenv().farmsafe do
game:GetService("ReplicatedStorage").RemoteEvents.ReportReset:FireServer()
wait(60)
bike()
end
end)

local Toggle = Tabs.Main:AddToggle("NormalFarm", {Title = "Autofarm Trophies (Normal)", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().farm = Value
while getgenv().farm do
game:GetService("ReplicatedStorage").RemoteEvents.ReportReset:FireServer()
wait(45)
bike()
end
end)

local Toggle = Tabs.Main:AddToggle("FastFarm", {Title = "Autofarm Trophies (Fast)", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().fastfarm = Value
while getgenv().fastfarm do
game:GetService("ReplicatedStorage").RemoteEvents.ReportReset:FireServer()
wait(25)
bike()
end
end)

local Misc = Tabs.Misc:AddSection("Misc")

local Toggle = Misc:AddToggle("SpinWheel", {Title = "Auto Spin Wheel", Default = false })
Toggle:OnChanged(function(Value)
        while getgenv().spin do
game:GetService("ReplicatedStorage").RemoteEvents.SpinWheel:FireServer()
wait(1)
        end
end)

Misc:AddButton({
        Title = "Mobile Keyboard",
        Description = "launches a GUI that mimics a Keyboard.",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
        end
    })
    
Misc:AddButton({
        Title = "Infinite Yield",
        Description = "I dont think i have to explain what this is.",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
        end
    })
    
local Credits = Tabs.Credits:AddSection("Credits")

Credits:AddParagraph({
        Title = "Credits",
        Content = "Script was made by Frostbite Development Team©.\nAll Rights Reserved"
    })

Credits:AddButton({
        Title = "Copy Discord Link",
        Description = "https://dsc.gg/frozen-x",
        Callback = function()
            setclipboard("https://dsc.gg/frozen-x")
        end
    })
    
local Showcase = Tabs.Credits:AddSection("Awesome Showcasers")

Showcase:AddParagraph({
        Title = "None :(",
        Content = "no awesome showcasers yet *womp womp*"
    })
    
    print("FroZen Hub V1 | Propriety of Frostbite Development Team©")