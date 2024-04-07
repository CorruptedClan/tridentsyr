local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FroZen Hub V1",
    SubTitle = "Blade Ball",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 420),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Parry", Icon = "shield" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "component" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "copyright" })
}

local Options = Fluent.Options

--functions
function Manual()
local toggleState = false
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "Button"

local button = Instance.new("TextButton")
button.Text = "Manual Parry"
button.BackgroundTransparency = 0
button.BackgroundColor3 = Color3.new(1, 1, 1)
button.Size = UDim2.new(0, 150, 0, 70)
button.Parent = ScreenGui
button.Position = UDim2.new(0, 100, 0, 100)

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 15)
topBar.BackgroundColor3 = Color3.new(0, 0, 0)
topBar.Parent = button

local originalColor = button.BackgroundColor3
local grayColor = Color3.new(0.7, 0.7, 0.7)

local dragging = false
local offset = Vector2.new()
local player = game.Players.LocalPlayer

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        offset = button.Position - UDim2.new(0, input.Position.X, 0, input.Position.Y)
        button.BackgroundColor3 = grayColor
    end
end)

topBar.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local inputPosition = input.Position
        local newPosition = UDim2.new(0, inputPosition.X, 0, inputPosition.Y) + offset
        button.Position = newPosition
    end
end)

topBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        button.BackgroundColor3 = originalColor
    end
end)

button.MouseButton1Click:Connect(function()
    toggleState = not toggleState
    button.Text = tostring(toggleState)
    getgenv().Spam = toggleState
    while getgenv().Spam do
--game.ReplicatedStorage.Remotes.ParryButtonPress:Fire()
game:GetService("VirtualInputManager"):SendKeyEvent(true, "F" , false , game)
--Enum.KeyCode.F
        wait(0.01)
    end
end)

ScreenGui.Parent = player:FindFirstChild("PlayerGui")
end

function autoParry()
local Debug = false -- Set this to true if you want my debug output.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9) -- A second argument in waitforchild what could it mean?
local Balls = workspace:WaitForChild("Balls", 9e9)
local function print(...) -- Debug print.
    if Debug then
        warn(...)
    end
end
local function VerifyBall(Ball) -- Returns nil if the ball isn't a valid projectile; true if it's the right ball.
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end
local function IsTarget() -- Returns true if we are the current target.
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end
local function Parry() -- Parries.
    --Remotes:WaitForChild("ParryButtonPress"):Fire()
game:GetService("VirtualInputManager"):SendKeyEvent(true, "F" , false , game)
end
Balls.ChildAdded:Connect(function(Ball)
    if not VerifyBall(Ball) then
        return
    end
    print(`Ball Spawned: {Ball}`)
    local OldPosition = Ball.Position
    local OldTick = tick()
    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then -- No need to do the math if we're not being attacked.
            local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
            local Velocity = (OldPosition - Ball.Position).Magnitude -- Fix for .Velocity not working. Yes I got the lowest possible grade in accuplacer math.
            print(`Distance: {Distance}\nVelocity: {Velocity}\nTime: {Distance / Velocity}`)
            if (Distance / Velocity) <= 10 then -- Sorry for the magic number. This just works. No, you don't get a slider for this because it's 2am.
                Parry()
            end
        end
        if (tick() - OldTick >= 1/60) then -- Don't want it to update too quickly because my velocity implementation is aids. Yes, I tried Ball.Velocity. No, it didn't work.
            OldTick = tick()
            OldPosition = Ball.Position
        end
    end)
end)
end

function SwordCrateManual()
game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate)
end

function ExplosionCrateManual()
game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate)
end

function SwordCrateAuto()
while _G.AutoSword do
game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalSwordCrate)
wait(1)
end
end

function ExplosionCrateAuto()
while _G.AutoBoom do
game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("PromptPurchaseCrate", workspace.Spawn.Crates.NormalExplosionCrate)
wait(1)
end
end

--start
do
    Fluent:Notify({
        Title = "FroZen Hub has injected",
        Content = "report any bugs at https://dsc.gg/frozen-x",
        SubContent = "or copy the link trough the 'Misc' page", -- Optional
        Duration = 3.5 -- Set to nil to make the notification not disappear
    })
end

--start, the real one
local Mainy = Tabs.Main:AddSection("Parry")

local Toggle = Mainy:AddToggle("Parry", {Title = "Toggle Auto Parry", Default = false })
Toggle:OnChanged(function(Value)
        getgenv().Parry = Value
        while getgenv().Parry do
        autoParry()
        wait(0.3)
        end
end)

Mainy:AddParagraph({
        Title = "PLEASE READ",
        Content = "as of the last update blade ball added an anticheat wich managed to stop most auto parry scripts. we are forced to go to keypress to do anything wich is a bad and unuseful way of parrying but also the only way.\nUntil a new bypass is released this will be the only parry method.\nThe main concern is that mobile players will be unable to move while the deflection happens.\nMore info soon.\n • Frostbite Dev Team"
    })

Mainy:AddButton({
        Title = "Launch Spam Parry GUI",
        Description = "with a toggle that will be easier to turn on/off during combat \n instead of having to reopen the FroZen GUI",
        Callback = function()
            Manual()
        end
    })
    
--[[local Toggle = Mainy:AddToggle("Hold F/M2", {Title = "Hold Parry button for spam", Default = false })
Toggle:OnChanged(function(Value)
  getgenv().exeSpam = Value
     if getgenv().exeSpam then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Spam",true))()
        end
end)]]

local Toggle = Mainy:AddToggle("Freeze Spammy", {Title = "Freeze Ability Spammer", Default = false })
Toggle:OnChanged(function(Value)
  local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local sus = Value

local function Freezer()
    if sus then
        print("Freeze Spammer is enabled | FroZen Hub X")
        while sus do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Freeze"):FireServer()
            wait()
        end
    else
        print("Freeze Spammer is disabled | FroZen Hub X")
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.B then
        Freezer()
    end
end)
end)

local Money = Tabs.Main:AddSection("Money Features")

Money:AddButton({
        Title = "Open Sword Crate",
        Description = "will open one common sword crate",
        Callback = function()
            SwordCrateManual()
        end
    })
    
Money:AddButton({
        Title = "Open Explosion Crate",
        Description = "will open one common explosion crate",
        Callback = function()
            ExplosionCrateManual()
        end
    })
    
local Toggle = Money:AddToggle("SwordAuto", {Title = "Auto Open Sword Crate", Default = false })
Toggle:OnChanged(function(Value)
_G.AutoSword = Value
        SwordCrateAuto()
end)

local Toggle = Money:AddToggle("ExplosionAuto", {Title = "Auto Open Explosion Crate", Default = false })
Toggle:OnChanged(function(Value)
_G.AutoBoom = Value
        ExplosionCrateAuto()
end)

--misc
local Misc = Tabs.Misc:AddSection("Misc")

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

--credits
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