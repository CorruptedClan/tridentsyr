local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FroZen Hub V1",
    SubTitle = "Murder Mystery 2",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 420),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "sword" }),
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

local Roles = Tabs.Main:AddSection("Roles")
Roles:AddButton({
        Title = "Expose roles (chat)",
        Description = "exposes the murder and sherrif in chat to everyone",
        Callback = function()
            local allPlayers = game.Players:GetPlayers()

for _, player in pairs(allPlayers) do
    local backpack = player:FindFirstChild("Backpack")
    
    if backpack then
        if backpack:FindFirstChild("Knife") then
            local args = {
                [1] = player.Name .. ": Has The Knife",
                [2] = "normalchat"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(args))
        end
        
        if backpack:FindFirstChild("Gun") then
            local args = {
                [1] = player.Name .. ": Has The Gun",
                [2] = "normalchat"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(args))
        end
    end
end
        end
    })
    --[[
local MurdStatus = Roles:AddDropdown("Murd Status", {
        Title = "Murder: ",
        Values = {murderer},
        Multi = false,
        Default = 1,
})
MurdStatus:OnChanged(function(Value)
        print("Murd Status:", Value)
    end)
 local SheriffStatus = Roles:AddDropdown("Sheriff Status", {
        Title = "Sheriff: ",
        Values = {sheriff},
        Multi = false,
        Default = 1,
})
SheriffStatus:OnChanged(function(Value)
        print("Sheriff Status:", Value)
    end)
    ]]
    
local function updateRolesInfo()
    while true do
        local players = game:GetService("Players"):GetPlayers()
        local murderer, sheriff = "Unknown", "Unknown"

        for _, player in ipairs(players) do
            if player.Character then
                local backpack = player.Backpack
                if backpack then
                    for _, tool in ipairs(backpack:GetChildren()) do
                        if tool:IsA("Tool") then
                            if tool.Name == "Knife" then
                                murderer = player.Name
                            elseif tool.Name == "Gun" then
                                sheriff = player.Name
                            end
                        end
                    end
                end
            end
        end

        wait(1)
    end
end
    --gun
    local Gun = Tabs.Main:AddSection("Gun")
    local Toggle = Gun:AddToggle("NotifyGun", {Title = "Notify Gun", Default = true })
Toggle:OnChanged(function(Value)
        _G.America = Value
end)
    
    if _G.America == true then
    coroutine.wrap(function()
    local gunDropped = false
    while wait(1) do
        local gunExists = Workspace:FindFirstChild("GunDrop")
        
        if gunExists then
            
Fluent:Notify({
        Title = "Gun Status",
        Content = "Gun dropped",
        SubContent = "", -- Optional
        Duration = 3 -- Set to nil to make the notification not disappear
    }) -- Update to use "Label" instead of "GunLabel"
            
            -- Only send notification if the gun has been dropped since last check
            if not gunDropped then
                gunDropped = true
                Fluent:Notify({
        Title = "Gun Status",
        Content = "Gun dropped",
        SubContent = "", -- Optional
        Duration = 3 -- Set to nil to make the notification not disappear
    })
            end
        else
            print("gun not dropped") -- Update to use "Label" instead of "GunLabel"
            gunDropped = false
        end
    end
end)()
end
    
--esps
local ESP = Tabs.Main:AddSection("ESP")

coroutine.wrap(updateRolesInfo)()

local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "ESP Holder"
ESPFolder.Parent = game.CoreGui

local function AddBillboard(player)
    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = player.Name .. "Billboard"
    Billboard.AlwaysOnTop = true
    Billboard.Size = UDim2.new(0, 200, 0, 50)
    Billboard.ExtentsOffset = Vector3.new(0, 3, 0)
    Billboard.Enabled = false
    Billboard.Parent = ESPFolder

    local TextLabel = Instance.new("TextLabel")
    TextLabel.TextSize = 20
    TextLabel.Text = player.Name
    TextLabel.Font = Enum.Font.FredokaOne
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.TextStrokeTransparency = 0
    TextLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    TextLabel.Parent = Billboard

    repeat
        wait()
        pcall(function()
            Billboard.Adornee = player.Character.Head
            if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
                TextLabel.TextColor3 = Color3.new(1, 0, 0)
                if getgenv().MurderEsp then
                    Billboard.Enabled = true
                end
            elseif player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun") then
                TextLabel.TextColor3 = Color3.new(0, 0, 1)
                if getgenv().SheriffEsp then
                    Billboard.Enabled = true
                end
            else
                TextLabel.TextColor3 = Color3.new(0, 1, 0)
                if getgenv().AllEsp then
                    Billboard.Enabled = true
                end
            end
        end)
    until not player.Parent
end

for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        coroutine.wrap(AddBillboard)(player)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    if player ~= game.Players.LocalPlayer then
        coroutine.wrap(AddBillboard)(player)
    end
end)

game.Players.PlayerRemoving:Connect(function(player)
    local billboard = ESPFolder:FindFirstChild(player.Name .. "Billboard")
    if billboard then
        billboard:Destroy()
    end
end)

local Toggle = ESP:AddToggle("EspMurd", {Title = "Murder ESP", Default = false })
Toggle:OnChanged(function(state)
        getgenv().MurderEsp = state
        for _, billboard in ipairs(ESPFolder:GetChildren()) do
            if billboard:IsA("BillboardGui") then
                local playerName = billboard.Name:sub(1, -10)
                local player = game.Players:FindFirstChild(playerName)
                if player and (player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")) then
                    billboard.Enabled = state
                end
            end
        end
end)

local Toggle = ESP:AddToggle("EspSheriff", {Title = "Sheriff ESP", Default = false })
Toggle:OnChanged(function(state)
        getgenv().SheriffEsp = state
        for _, billboard in ipairs(ESPFolder:GetChildren()) do
            if billboard:IsA("BillboardGui") then
                local playerName = billboard.Name:sub(1, -10)
                local player = game.Players:FindFirstChild(playerName)
                if player and (player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun")) then
                    billboard.Enabled = state
                end
            end
        end
end)

local Toggle = ESP:AddToggle("EspAll", {Title = "Everyone ESP", Default = false })
Toggle:OnChanged(function(state)
        getgenv().AllEsp = state
        for _, billboard in ipairs(ESPFolder:GetChildren()) do
            if billboard:IsA("BillboardGui") then
                local playerName = billboard.Name:sub(1, -10)
                local player = game.Players:FindFirstChild(playerName)
                if player and player.Character then
                    local hasKnife = player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife")
                    local hasGun = player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun")
                    if not (hasKnife or hasGun) then
                        billboard.Enabled = state
                    end
                end
            end
        end
end)
    
--misc
local Misc = Tabs.Misc:AddSection("Misc")

Misc:AddParagraph({
        Title = "NOTE*",
        Content = "this MM2 script is in BETA. expect out-dated functions and buggy settings. Updates are regulary wich will make the script run smoother and update functions"
    })

Misc:AddButton({
        Title = "Get Very Emote",
        Description = "",
        Callback = function()
            local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        local Emotes = PlayerGui:WaitForChild("MainGUI"):WaitForChild("Game"):FindFirstChild("Emotes")

        if Emotes then
            require(game:GetService("ReplicatedStorage").Modules.EmoteModule).GeneratePage({"headless", "zombie", "zen", "ninja", "floss", "dab", "sit"}, Emotes, "Free Emotes")
            end
        end
    })

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