
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FroZen Hub V1",
    SubTitle = "Slap Battles",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 420),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "hand" }),
    Perk = Window:AddTab({ Title = "Quality of life", Icon = "aperture" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "component" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "copyright" })
}

local Options = Fluent.Options

if game.PlaceId == 6403373529 or game
.PlaceId 
== 11520107397 or game.PlaceId == 9015014224 then
    local bypass;
        bypass = hookmetamethod(game, "__namecall", function(method, ...) 
            if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
                return
            end
            return bypass(method, ...)
        end)

    if setfpscap then 
        setfpscap(12569)
    end

    local Gloves = loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/Files/Gloves.lua"))()
    local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/R2O/main/Files/Functions.lua"))()
  --  local Coasting = loadstring(game:HttpGet(("https://raw.githubusercontent.com/cheesynob39/Coasting/main/Source.lua")))()

    local function getGlove()
        return game.Players.LocalPlayer.leaderstats.Glove.Value
    end
    
    getgenv().selectedIngredient = "Autumn Sprout"
    getgenv().selectedPotion = "Haste Potion"

    local deb = false
    local Ingredients = {"Autumn Sprout", "Blood Rose", "Blue Crystal", "Dark Root", "Dire Flower","Elder Wood", "Fire Flower", "Glowing Mushroom", "Hazel Lily", "Jade Stone","Lamp Grass", "Mushroom", "Plane Flower", "Red Crystal", "Wild Vine", "Winter Rose"}
    local Recipes = {
        ["Haste Potion"] = {Ingredients[1], Ingredients[10]}, 
        ["Grug Potion"] = {Ingredients[12]},
        ["Nightmare Potion"] = {Ingredients[4], Ingredients[4], Ingredients[4]}
    }
    
    --start
local Main = Tabs.Main:AddSection("Main")
    
local Toggle = Main:AddToggle("UniSlap", {Title = "Universal Slap Farm", Default = false })
Toggle:OnChanged(function(Value)
        allFarming = Value
            if Value == true then
                setfpscap(50)
                workspace.DEATHBARRIER.CanTouch = false
                workspace.DEATHBARRIER2.CanTouch = false
                workspace.dedBarrier.CanTouch = false
            
                while allFarming and task.wait() do
                    pcall(function()
                        for Index, Human in next, game.Players:GetPlayers() do
                            if Human ~= game.Players.LocalPlayer and Human.Character and not Human.Character:FindFirstChild("isParticipating") and Human.Character:FindFirstChild("Torso") and Human.Character:FindFirstChild("Head") and Human.Character:FindFirstChild("entered") and Human.Character.Head:FindFirstChild("UnoReverseCard") == nil and Human.Character:FindFirstChild("rock") == nil and Human.Character.Ragdolled.Value == false then
                                if game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then                             
                                    task.wait(.1)
                                    game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = Human.Character:FindFirstChild("Right Leg").CFrame * CFrame.new(6,-5,6)   
                                    task.wait()   
                                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").PlatformStand = true
                                    wait(.25)
                                    shared.gloveHits[getGlove()]:FireServer(Human.Character:FindFirstChild("Torso"))
                                    wait(.25)
                                end
                            end
                        end
                    end) 
                end
            else
                setfpscap(1269)
                workspace.DEATHBARRIER.CanTouch = true
                workspace.DEATHBARRIER2.CanTouch = true
                workspace.dedBarrier.CanTouch = true
                -------------------------------------------------------------------------
                if game.Players.LocalPlayer.Character.Humanoid.PlatformStand == true then
                    task.wait(3)
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                end
            end
end)

local Toggle = Main:AddToggle("SlapAura", {Title = "Slap Aura", Default = false })
Toggle:OnChanged(function(Value)
        slapAura = Value
            if Value == true then
                while slapAura do
                    task.wait(.005)  
                    pcall(function()    
                        for Index, Player in next, game.Players:GetPlayers() do
                            if Player ~= game.Players.LocalPlayer and Player.Character and Player.Character:FindFirstChild("entered") then
                                if Player.Character:FindFirstChild("Head") then
                                    if Player.Character.Head:FindFirstChild("UnoReverseCard") == nil and Player.Character:FindFirstChild("rock") == nil then
                                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                            local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                                            task.wait()
                                            if 25 >= Magnitude then
                                                shared.gloveHits[getGlove()]:FireServer(Player.Character:WaitForChild("Head"))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end 
            end
            end)
      

local Voider = Main:AddToggle("NoVoid", {Title = "Anti Void", Default = true })
Voider:OnChanged(function(noVoid)
        if noVoid == true then
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "dedBarrier"  or v.Name == "ArenaBarrier" or v.Name == "DEATHBARRIER" or v.Name == "DEATHBARRIER2" then               
                    v.CanCollide = true
                    v.Material = "ForceField"
                    v.Color = Color3.new(255,255,255)
                    v.Transparency = .9
                end  
            end 
        else
            for i,v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "dedBarrier"  or v.Name == "ArenaBarrier" or v.Name == "DEATHBARRIER" or v.Name == "DEATHBARRIER2" then               
                    v.CanCollide = false
                    v.Transparency = 1
                end  
            end
        end
end)

local Toggle = Main:AddToggle("NoRagdoll", {Title = "Anti Ragdoll", Default = false })
Toggle:OnChanged(function(bool)
        antiRagdoll = bool
            if bool == true then
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                task.wait()
                game.Players.LocalPlayer.CharacterAdded:Connect(function(Character)
                    task.wait()
                    Character:WaitForChild("Ragdolled").Changed:Connect(function()
                        if Character:WaitForChild("Ragdolled").Value == true and antiRagdoll == true then
                            repeat task.wait()
                                Character.Torso.Anchored = true
                            until Character:FindFirstChild("Torso") == nil or Character:WaitForChild("Ragdolled").Value == false
                            ----------------------------------------------------------------------------------------------------
                            Character.Torso.Anchored = false
                        end
                    end)
                end)
            end
end)

local Toggle = Main:AddToggle("NoName", {Title = "Remove Name", Default = false })
Toggle:OnChanged(function(bool)
        Auto_Remove = bool
            if bool == true then
                game.Players.LocalPlayer.Character:FindFirstChild("Head").Nametag.TextLabel:Destroy()
                task.wait()
                game.Players.LocalPlayer.CharacterAdded:Connect(function()
                    if Auto_Remove == true then
                        repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChild("Head")
                        game.Players.LocalPlayer.Character:FindFirstChild("Head").Nametag.TextLabel:Destroy()
                    end
                end)
            end
end)

local Toggle = Main:AddToggle("NoCOD", {Title = "Anti Cube of Death", Default = false })
Toggle:OnChanged(function(Value)
        if Value == true then
            if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) then
                workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
            end
        else 
            if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) then  
                workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
            end
        end
end)

local Toggle = Main:AddToggle("AutoArena", {Title = "Auto Enter Arena", Default = false })
Toggle:OnChanged(function(bool)
        autoJoin = bool
            if bool == true then
                while autoJoin do
                    wait()
                    repeat task.wait() until game.Players.LocalPlayer.Character
                    if not game.Players.LocalPlayer.Character:FindFirstChild("entered") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        repeat task.wait(.005)
                            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
                        until game.Players.LocalPlayer.Character:FindFirstChild("entered")
                    end
                end
            end
end)

local Toggle = Main:AddToggle("Null", {Title = "Null Spam", Default = false })
Toggle:OnChanged(function(bool)
        nullSpam = bool
        while nullSpam do
            game:GetService("ReplicatedStorage").NullAbility:FireServer()
        task.wait()
         end
end)

local Toggle = Main:AddToggle("ExpAura", {Title = "Explosion Aura", Default = false })
Toggle:OnChanged(function(bool)
        spamExplode = bool
            while spamExplode do
                    game:GetService("ReplicatedStorage"):WaitForChild("rhythmevent"):FireServer("AoeExplosion", 86)
            wait(.1)
            end
end)
           
--quality of life
local Main2 = Tabs.Perk:AddSection("Main")

local Toggle = Main2:AddToggle("NoAdmin", {Title = "Anti Admins", Default = false })
Toggle:OnChanged(function(bool)
        antiAdmins = bool
            if bool == true then
                game.Players.PlayerAdded:Connect(function(Plr)
                    if Plr:GetRankInGroup(9950771) and 7 <= Plr:GetRankInGroup(9950771) and antiAdmins then
                        game.Players.LocalPlayer:Kick("They Ain't getting us yet")
                    end
                end)
            end
end)

local Toggle = Main2:AddToggle("NoJackyChan", {Title = "Anti Hollow Jack", Default = false })
Toggle:OnChanged(function(bool)
        antiHallow = bool
            if bool == true then
                game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = true
            else
                game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Enabled = true
            end
end)

local Toggle = Main2:AddToggle("NoJoJoReferences", {Title = "Anti Za Hando", Default = false })
Toggle:OnChanged(function(bool)
        antiZH = bool
            if bool == true then
                while antiZH do
                    wait(.001)
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Part") and v.Name == "Part" then
                            v:Destroy()
                        end 
                    end 
                end
            end
end)

local Toggle = Main2:AddToggle("NoReaper", {Title = "Anti Reaper", Default = false })
Toggle:OnChanged(function(bool)
        antiReaper = bool
            if bool == true then
                while antiReaper do
                    wait(.001)
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v.Name == "DeathMark" then
                            game:GetService("ReplicatedStorage").ReaperGone:FireServer(game:GetService("Players").LocalPlayer.Character.DeathMark)
                            game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy()
                        end 
                    end
                end
            end
end)

local Toggle = Main2:AddToggle("NoPusher", {Title = "Anti Pusher", Default = false })
Toggle:OnChanged(function(bool)
        antiPusher = bool
            if bool == true then
                while antiPusher do
                    wait(.001)
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v.Name == "wall" then
                            v.CanCollide = false
                        end
                    end
                end
            end
end)

local Toggle = Main2:AddToggle("NoBooster", {Title = "Anti Booster", Default = false })
Toggle:OnChanged(function(bool)
        antiBooster = bool
            if bool == true then
                if game.Workspace[game.Players.LocalPlayer.Name]:FindFirstChild("BoosterObject", 1) then
                    game.Workspace[game.Players.LocalPlayer.Name]:FindFirstChild("BoosterObject", 1):Destroy()
                end
                task.wait()
                game.Workspace[game.Players.LocalPlayer.Name].DescendantAdded:Connect(function(v)
                    if antiBooster == true then
                        if v.Name == "BoosterObject" then
                            task.wait(.1)
                            v:Destroy()

                        end
                    end
                end)
            end
end)

local Toggle = Main2:AddToggle("NoStun", {Title = "Anti Stun", Default = false })
Toggle:OnChanged(function(bool)
        antiStun = bool
            if bool == true then
                while antiStun do
                    task.wait()
                    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.PlatformStand == true and not Farming and not allFarming and not game.Players.LocalPlayer.Character.Ragdolled.Value == true and game.Workspace:FindFirstChild("Shockwave") then
                        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                    end
            end
        end
end)

--misc
local Misc = Tabs.Misc:AddSection("Misc")

local Slider = Misc:AddSlider("Speed", {
        Title = "Walk Speed",
        Description = "makes you go vrooom",
        Default = 50,
        Min = 16,
        Max = 300,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WS
        WS1 = WS
        end
    })
Slider:OnChanged(function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WS
        WS1 = WS
end)

local Slider = Misc:AddSlider("Jump", {
        Title = "Jump Power",
        Description = "makes you go to the moon",
        Default = 50,
        Min = 16,
        Max = 300,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = JP
        WS2 = JP
        end
    })
Slider:OnChanged(function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JP
        WS2 = JP
end)

local Toggle = Misc:AddToggle("EnableSpeed", {Title = "Auto Set Walk Speed", Default = false })
Toggle:OnChanged(function(Value)
        autoSet1 = bool
            if bool == true then
                while autoSet1 do
                    task.wait()
                    local Character = workspace:WaitForChild(game.Players.LocalPlayer.Name)
                    if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.WalkSpeed ~= WS1 then
                        Character:FindFirstChild("Humanoid").WalkSpeed = WS1
                    end
                end
            end
end)

local Toggle = Misc:AddToggle("EnableJump", {Title = "Auto Set Jump Power", Default = false })
Toggle:OnChanged(function(Value)
        autoSet2 = bool
            if bool == true then
                while autoSet2 do
                    task.wait()
                    local Character = workspace:WaitForChild(game.Players.LocalPlayer.Name)
                    if Character:FindFirstChild("Humanoid") ~= nil and Character.Humanoid.JumpPower ~= WS2 then
                        Character:FindFirstChild("Humanoid").JumpPower = WS2
                    end
                end
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
--must needed end idk why           
end