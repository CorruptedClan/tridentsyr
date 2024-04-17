_G.Settings = {
    farmraidtoken = false,
    skilldelay = 1,
    Raidselectmap = "None",
    distance = 10,
    toggleguikey = "z",
    Hardcore = false,
    afkandraid = false,
    autospingem = false,
    autoclaimrewardraid = false,
    FriendsOnly = true,
    eggspintime = "3",
    autoclaimrewardspeed = false,
    equipselectmain = false,
    equipselectmain1 = false,
    equipselectmain2 = false,
    selectmain = "None",
    selectmain1 = "None",
    selectmain2 = "None",
    autosellcommon = false,
    autoselluncommon = false,
    autosellrare = false,
    autosellepic = false,
    selectegg = "None",
    autoselllegendary = false,
    autoequipbest = false,
    autoupgrade = false,
    Height = 20,
    Height1 = -20,
    otherds = "@here",
    dsuser = "Not Set",
    AutoPunch = false,
    punchdelay = "4",
    custommapselect = "None",
    webhookspeed = "10",
    AutoFarm = false,
    AutoTP = false,
    AutoTP1 = false,
    AutoTP2 = true,
    CustomDifficulty = "None",
    Autocustom = false,
    AutoRetry = false,
    webhookurl = "",
    AutoSkill1 = true,
    AutoSkill2 = true,
    AutoSkill3 = true,
    AutoSkill4 = true,
    AutoSkill5 = true,
    AutoSkill6 = true,
    AutoSkill7 = true,
    kickwebhook = false,
    Speed = 80,
    Hidename = true,
    Autolvl = false,
    Autospeedraid = false,
    Autoboss = false,
    webhook = false,
    raidwebhook = false,
    Autoraid = false,
    kickrejoin = false
}




if not game:IsLoaded() then
    game.Loaded:Wait()
end
local a = "Test"
local b = "FroZenAnimeDim.lua"
function saveSettings()
    local c = game:GetService("HttpService")
    local d = c:JSONEncode(_G.Settings)
    if writefile then
        if isfolder(a) then
            writefile(a .. " | " .. b, d)
        else
            makefolder(a)
            writefile(a .. " | " .. b, d)
        end
    end
end
function loadSettings()
    local c = game:GetService("HttpService")
    if isfile(a .. " | " .. b) then
        _G.Settings = c:JSONDecode(readfile(a .. " | " .. b))
    end
end
loadSettings()
local e = game:GetService("ReplicatedStorage")
local f = game:GetService("VirtualInputManager")
local g = game:GetService("Players")
local h = game:GetService("VirtualUser")
local i = game:GetService("TweenService")
local j = g.LocalPlayer
local p = {
    "Sung Jin Woo",
    "MilimCharacter (Valentine)",
    "Ryuko",
    "Saber Alter Character",
    "Alice",
    "Broly",
    "Gilgamesh",
    "Kokushibo",
    "Ice Queen Esdeath",
    "Katakuri",
    "Levi",
    "Naruto Six Paths",
    "RimuruDemonLord",
    "KiritoCharacter",
    "Megumin (Halloween)",
    "RengokuCharacter",
    "KanekiCharacter",
    "Lancer",
    "Nezuko (New Year)",
    "TogaCharacter (Halloween)",
    "Megumin (Halloween)",
    "Emiya Archer",
    "Sukuna",
    "Infinity Gojo",
    "AsunaCharacter",
    "Zoro",
    "All Might",
    "Rukia",
    "Shinra",
    "Tanjiro",
    "Gray",
    "Sasuke",
    "Akaza",
    "Asta",
    "Killua",
    "Natsu",
    "Sakura",
    "Accelerator",
    "Deku",
    "Goku",
    "Ichigo",
    "Luffy",
    "Naruto",
    "Gojo",
    "Genos",
    "Attack Titan",
    "Eugeo",
    "Gear 5 Luffy",
    "Esper",
    "Astolfo Summer Character"
}
local q = {
    "Infinite Mode",
    "Titan Dimension",
    "Demon Dimension",
    "Curse Dimension",
    "Villain Dimension",
    "Sword Dimension",
    "Ghoul Dimension",
    "Fate Dimension",
    "Slime Dimension",
    "Devil Dimension",
    "Pirate Dimension",
    "Alien Dimension",
    "Level Dimension"
}
local r = {"Easy", "Hard", "Nightmare", "Infinite"}
local s = {"Capsule Series 1", "Raid Capsule", "Gear 5 Fluffy Capsule", "Esper Capsule"}
local t = { "Tengoku Raid", "Hirito Raid", "Titan Raid", "Esper Raid" ,"Demon Lord Raid","Yomiichi Raid", "Christmas Raid","Combat Titan Raid", "Infinity Nojo Raid", "Gear 5 Fluffy Raid"}
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FroZen Hub V1",
    SubTitle = "Anime Dimensions",
    TabWidth = 160,
    Size = UDim2.fromOffset(520, 420),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "map-pin" }),
    Extra = Window:AddTab({ Title = "Extra", Icon = "locate" }),
    TP = Window:AddTab({ Title = "Teleport", Icon = "map" }),
    AutoSP = Window:AddTab({ Title = "Auto S & P", Icon = "scan" }),
    Raid = Window:AddTab({ Title = "Raid", Icon = "shield-alert" }),
    Afk = Window:AddTab({ Title = "AFK", Icon = "pause" }),
    Notify = Window:AddTab({ Title = "Notify", Icon = "bell" }),
    A = Window:AddTab({ Title = "Auto Sell", Icon = "coins" }),
    B = Window:AddTab({ Title = "Auto Spin", Icon = "life-buoy" }),
    C = Window:AddTab({ Title = "Auto Claim", Icon = "archive-restore" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "component" }),
    Credits = Window:AddTab({ Title = "Credits", Icon = "copyright" })
}

local Toggle = Tabs.Main:AddToggle("AutoLevel", {Title = "Auto Level", Default = false })
Toggle:OnChanged(function(H)
        _G.Settings.Autolvl = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(7) do
                        if not _G.Settings.Autolvl then
                            break
                        end
                        wait(10)
                        Lvl = game.Players.LocalPlayer.leaderstats.Level.Value
                        if Lvl > 0 and Lvl < 6 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Titan Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 5 and Lvl < 11 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Hard",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Titan Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 10 and Lvl < 16 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Titan Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 15 and Lvl < 21 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Demon Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 20 and Lvl < 26 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Hard",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Demon Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 25 and Lvl < 31 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Demon Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 30 and Lvl < 36 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Curse Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 35 and Lvl < 41 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Hard",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Curse Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 40 and Lvl < 46 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Curse Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 45 and Lvl < 51 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Villain Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 50 and Lvl < 56 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Hard",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Villain Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 55 and Lvl < 61 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Villain Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 60 and Lvl < 68 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Sword Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 67 and Lvl < 76 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Sword Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 75 and Lvl < 83 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Ghoul Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 82 and Lvl < 91 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Ghoul Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 90 and Lvl < 98 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Fate Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 97 and Lvl < 106 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Fate Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 105 and Lvl < 113 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Slime Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 112 and Lvl < 121 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Devil Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 131 and Lvl < 141 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Pirate Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 141 and Lvl < 151 then
                            wait(1)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Nightmare",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Alien Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                        if Lvl > 151 then
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "CreateRoom",
                                {
                                    ["Difficulty"] = "Easy",
                                    ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                    ["MapName"] = "Slime Dimension",
                                    ["Hardcore"] = false
                                }
                            )
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "TeleportPlayers"
                            )
                        end
                    end
                end
                )
        end
)


local Toggle = Tabs.Main:AddToggle("Auto Punch", {Title = "Auto Punch", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.AutoPunch = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.punchdelay) do
                        if not _G.Settings.AutoPunch then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteEvents.MainRemoteEvent:FireServer("UseSkill",{ ["attackNumber"] = 1},"BasicAttack")
                        end
                    end
            )
end)

local Toggle = Tabs.Main:AddToggle("Time Farm", {Title = "Auto Farm Time Challange", Default = false })
Toggle:OnChanged(function(H)
        _G.Settings.Autotrial = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(7) do
                        if not _G.Settings.Autotrial then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportToTimeChallenge"
                        )
                    end
                end
            )
end)

local Toggle = Tabs.Main:AddToggle("Specific Farm", {Title = "Auto Farm Specific Map", Default = false })
Toggle:OnChanged(function(H)
        _G.Settings.Autocustom = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(7) do
                        if not _G.Settings.Autocustom then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CreateRoom",
                            {
                                ["Difficulty"] = _G.Settings.CustomDifficulty,
                                ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                ["MapName"] = _G.Settings.custommapselect,
                                ["Hardcore"] = false
                            }
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportPlayers"
                        )
                    end
                end
            )
end)

local Dropdown = Tabs.Main:AddDropdown("Map select", {
        Title = "Select Map (for farm specific map)",
        Values = q,
        Multi = false,
        Default = 1,
})
Dropdown:OnChanged(function(H)
        _G.Settings.custommapselect = H
            saveSettings()
    end)

local Toggle = Tabs.Main:AddToggle("Boss Farm", {Title = "Auto Farm Boss", Default = false })
Toggle:OnChanged(function(H)
        _G.Settings.Autoboss = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(4) do
                        if not _G.Settings.Autoboss then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportToBossRush"
                        )
                    end
                end
            )
end)

local Toggle = Tabs.Main:AddToggle("Speed Farm", {Title = "Auto Farm Speed Raid", Default = false })
Toggle:OnChanged(function(H)
        _G.Settings.Autospeedraid = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(2) do
                        if not _G.Settings.Autospeedraid then
                            break
                        end
                        wait()
                        local X = {
                            "Sung Jin Woo",
                            "MilimCharacter (Valentine)",
                            "Ryuko",
                            "Saber Alter Character",
                            "Alice",
                            "Broly",
                            "Gilgamesh",
                            "Kokushibo",
                            "Ice Queen Esdeath",
                            "Katakuri",
                            "Levi",
                            "Naruto Six Paths",
                            "RimuruDemonLord",
                            "KiritoCharacter",
                            "Megumin (Halloween)",
                            "RengokuCharacter",
                            "KanekiCharacter",
                            "Lancer",
                            "Nezuko (New Year)",
                            "TogaCharacter (Halloween)",
                            "Megumin (Halloween)",
                            "Emiya Archer",
                            "Sukuna",
                            "Infinity Gojo",
                            "AsunaCharacter",
                            "Zoro",
                            "All Might",
                            "Rukia",
                            "Shinra",
                            "Tanjiro",
                            "Gray",
                            "Sasuke",
                            "Akaza",
                            "Asta",
                            "Killua",
                            "Natsu",
                            "Sakura",
                            "Accelerator",
                            "Deku",
                            "Goku",
                            "Ichigo",
                            "Luffy",
                            "Naruto",
                            "Gojo",
                            "Genos",
                            "Attack Titan",
                            "Eugeo",
                            "Gear 5 Luffy",
                            "Esper",
                            "Katakuri (Summer) Character",
                            "Astolfo Summer Character"
                        }
                        local Y = math.random(1, #X)
                        local Z = X[Y]
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportToShadowRaid",
                            Z
                        )
                    end
                end
            )
end)

--extra

local Toggle = Tabs.Extra:AddToggle("Name Hide", {Title = "Hide Name", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.Hidename = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.Hidename then
                            break
                        end
                        spawn(
                            function()
                                game.Players.LocalPlayer.Character.Head.PlayerHealthBarGui:Destroy()
                                game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
                            end
                        )
                        spawn(
                            function()
                                local j = game:GetService("Players").LocalPlayer
                                local a1
                                j.CharacterAdded:Connect(
                                    function(a2)
                                        a1 = a2:WaitForChild("Humanoid")
                                    end
                                )
                                a1.Died:Connect(
                                    function()
                                        game.Players.LocalPlayer.Character.Head.PlayerHealthBarGui:Destroy()
                                        game:GetService("StarterGui"):SetCoreGuiEnabled(
                                            Enum.CoreGuiType.PlayerList,
                                            false
                                        )
                                    end
                                )
                            end
                        )
                    end
                end
            )
end)

local Toggle = Tabs.Extra:AddToggle("Rejoin if Kick", {Title = "Rejoin if kick", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.kickrejoin = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.kickrejoin then
                            break
                        end
                        game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(
                            function(a3)
                                if
                                    a3.Name == "ErrorPrompt" and a3:FindFirstChild("MessageArea") and
                                        a3.MessageArea:FindFirstChild("ErrorFrame")
                                 then
                                    game:GetService("TeleportService"):Teleport(6938803436, LocalPlayer)
                                end
                            end
                        )
                    end
                end
            )
end)

--tp
local MobTP = Tabs.TP:AddSection("Position Type (on mob)")
local UpTp = MobTP:AddToggle("TPonTop", {Title = "On top", Default = false })
UpTp:OnChanged(function(H)
        _G.Settings.AutoTP = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoTP then
                            break
                        end
                        pcall(
                            function()
                                game.Players.LocalPlayer.Character.Humanoid:ChangeState(16)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                            end
                        )
                        pcall(
                            function()
                                for m, n in pairs(game:GetService("Workspace").Folders.Monsters:GetChildren()) do
                                    repeat
                                        game:GetService("RunService").Heartbeat:wait()
                                        local T =
                                            (n.Head.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                        if T < 999 then
                                            Speed2 = _G.Settings.Speed
                                        end
                                        local U = game:service "TweenService"
                                        local V = TweenInfo.new(T / Speed2, Enum.EasingStyle.Linear)
                                        local W =
                                            U:Create(
                                            game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                            V,
                                            {
                                                CFrame = n.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-90), 0, 0) +
                                                    Vector3.new(0, _G.Settings.Height, 0)
                                            }
                                        )
                                        W:Play()
                                        wait(T / Speed2)
                                    until not _G.Settings.AutoTP or n.Humanoid.Health <= 0 or not n.Parent or not n
                                end
                            end
                        )
                    end
                end
            )
         
end)

local BehindTp = MobTP:AddToggle("TpBehind", {Title = "Behind", Default = true })
BehindTp:OnChanged(function(H)
        _G.Settings.AutoTP2 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoTP2 then
                            break
                        end
                        pcall(
                            function()
                                for m, n in pairs(game:GetService("Workspace").Folders.Monsters:GetChildren()) do
                                    repeat
                                        game:GetService("RunService").Heartbeat:wait()
                                        local T =
                                            (n.HumanoidRootPart.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                        if T < 999 then
                                            Speed2 = _G.Settings.Speed
                                        elseif T < 1000 then
                                            Speed2 = _G.Settings.Speed
                                        elseif T >= 1000 then
                                            Speed2 = _G.Settings.Speed
                                        end
                                        local U = game:service "TweenService"
                                        local V = TweenInfo.new(T / Speed2, Enum.EasingStyle.Linear)
                                        local W =
                                            U:Create(
                                            game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                            V,
                                            {
                                                CFrame = n.HumanoidRootPart.CFrame *
                                                    CFrame.new(0, 0, _G.Settings.distance)
                                            }
                                        )
                                        W:Play()
                                        wait(T / Speed2)
                                    until not _G.Settings.AutoTP2 or n.Humanoid.Health <= 0 or not n.Parent or not n
                                end
                            end
                        )
                    end
                end
            )
            
end)

local UnderTp = MobTP:AddToggle("TpUnder", {Title = "Under", Default = false })
UnderTp:OnChanged(function(H)
        _G.Settings.AutoTP1 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.AutoTP1 then
                            break
                        end
                        pcall(
                            function()
                                game.Players.LocalPlayer.Character.Humanoid:ChangeState(16)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                            end
                        )
                        pcall(
                            function()
                                for m, n in pairs(game:GetService("Workspace").Folders.Monsters:GetChildren()) do
                                    repeat
                                        game:GetService("RunService").Heartbeat:wait()
                                        local T =
                                            (n.Head.Position -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                                        if T < 999 then
                                            Speed2 = _G.Settings.Speed
                                        end
                                        local U = game:service "TweenService"
                                        local V = TweenInfo.new(T / Speed2, Enum.EasingStyle.Linear)
                                        local W =
                                            U:Create(
                                            game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"],
                                            V,
                                            {
                                                CFrame = n.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0) +
                                                    Vector3.new(0, _G.Settings.Height1, 0)
                                            }
                                        )
                                        W:Play()
                                        wait(T / Speed2)
                                    until not _G.Settings.AutoTP1 or n.Humanoid.Health <= 0 or not n.Parent or not n
                                end
                            end
                        )
                    end
                end
            )
           
end)

local TpSettings = Tabs.TP:AddSection("TP Settings")

local Slider = TpSettings:AddSlider("Speed", {
        Title = "Speed",
        Description = "Tween Speed",
        Default = _G.Settings.Speed,
        Min = 80,
        Max = 100,
        Rounding = 1,
        Callback = function(H)
            _G.Settings.Speed = H
            saveSettings()
        end
    })
    
local Slider = TpSettings:AddSlider("OnTopHeight", {
        Title = "On Top Height",
        Description = "Studs",
        Default = _G.Settings.Height,
        Min = 5,
        Max = 10,
        Rounding = 1,
        Callback = function(H)
            _G.Settings.Height = H
            saveSettings()
        end
    })
    
local Slider = TpSettings:AddSlider("UnderHeight", {
        Title = "Under Height",
        Description = "Studs",
        Default = _G.Settings.Height1,
        Min = -15,
        Max = -10,
        Rounding = -1,
        Callback = function(H)
            _G.Settings.Height1 = H
            saveSettings()
        end
    })
    
local Slider = TpSettings:AddSlider("Behind Height", {
        Title = "Behind Height",
        Description = "Studs",
        Default = _G.Settings.distance,
        Min = 0,
        Max = 20,
        Rounding = 1,
        Callback = function(H)
            _G.Settings.distance = H
            saveSettings()
        end
    })
    
--autoSp
local Toggle = Tabs.AutoSP:AddToggle("Auto Skill1", {Title = "Auto Skill 1", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.AutoSkill1 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill1 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill1.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
end)

local Toggle = Tabs.AutoSP:AddToggle("Auto Skill2", {Title = "Auto Skill 2", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.AutoSkill2 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill2 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill2.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
end)

local Toggle = Tabs.AutoSP:AddToggle("Auto Skill3", {Title = "Auto Skill 3", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.AutoSkill3 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill3 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill3.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
end)

local Toggle = Tabs.AutoSP:AddToggle("Auto Skill4", {Title = "Auto Skill 4", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.AutoSkill4 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill4 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill4.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
end)

local Toggle = Tabs.AutoSP:AddToggle("Auto Skill5", {Title = "Auto Skill 5 (awakened units)", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.AutoSkill5 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill5 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.Skill5.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
end)

local Toggle = Tabs.AutoSP:AddToggle("Auto Assist1", {Title = "Auto Assist 1", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.AutoSkill6 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill6 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.SkillAssist1.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
end)

local Toggle = Tabs.AutoSP:AddToggle("Auto Assist 2", {Title = "Auto Assist 2", Default = true })
Toggle:OnChanged(function(H)
        _G.Settings.AutoSkill7 = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.skilldelay) do
                        if not _G.Settings.AutoSkill7 then
                            break
                        end
                        for m, n in pairs(
                            getconnections(
                                game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.SlotsHolder.SkillAssist2.MouseButton1Click
                            )
                        ) do
                            n:Fire()
                        end
                    end
                end
            )
end)

local Slider = Tabs.AutoSP:AddSlider("Skill Delay", {
        Title = "Skill Delay",
        Description = "",
        Default = _G.Settings.skilldelay,
        Min = 1,
        Max = 5,
        Rounding = 1,
        Callback = function(H)
            _G.Settings.skilldelay = H
            saveSettings()
        end
    })
    
--raid
local Toggle = Tabs.Raid:AddToggle("Friends Only", {Title = "Friends Only (applies to other farms)", Default = _G.Settings.FriendsOnly })
Toggle:OnChanged(function(H)
        _G.Settings.FriendsOnly = H
            saveSettings()
end)

local Dropdown = Tabs.Raid:AddDropdown("Difficulty select", {
        Title = "Select difficulty (universal)",
        Values = r,
        Multi = false,
        Default = 1,
})
Dropdown:OnChanged(function(H)
        _G.Settings.CustomDifficulty = H
            saveSettings()
    end)
   
local Dropdown = Tabs.Raid:AddDropdown("Raid select", {
        Title = "Select Raid",
        Values = t,
        Multi = false,
        Default = 1,
})
Dropdown:OnChanged(function(H)
        _G.Settings.Raidselectmap = H
            saveSettings()
    end)
    
local Toggle = Tabs.Raid:AddToggle("Raid Farm", {Title = "Auto Farm Raid", Default = false })
Toggle:OnChanged(function(H)
        _G.Settings.Autoraid = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(3) do
                        if not _G.Settings.Autoraid then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CreateRoom",
                            {
                                ["Difficulty"] = "Easy",
                                ["FriendsOnly"] = _G.Settings.FriendsOnly,
                                ["MapName"] = _G.Settings.Raidselectmap,
                                ["Hardcore"] = false
                            }
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "TeleportPlayers"
                        )
                    end
                end
            )
end)
    
 --afk options
local Toggle = Tabs.Afk:AddToggle("Auto Raid + Afk", {Title = "Auto Raid + AFK", Default = _G.Settings.afkandraid })
Toggle:OnChanged(function(H)
        _G.Settings.afkandraid = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(3) do
                        if not _G.Settings.afkandraid then
                            break
                        end
                        spawn(
                            function()
                                if game.PlaceId == 7274690025 or game.PlaceId == 6938803436 then
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                        "CreateRoom",
                                        {
                                            ["Difficulty"] = "Easy",
                                            ["FriendsOnly"] = true,
                                            ["MapName"] = _G.Settings.Raidselectmap,
                                            ["Hardcore"] = false
                                        }
                                    )
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                        "TeleportPlayers"
                                    )
                                    wait(5)
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                        "TeleportToAFK"
                                    )
                                end
                            end
                        )
                        spawn(
                            function()
                                if game.PlaceId == 6990131029 then
                                    wait(300)
                                    game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                        "TeleportToLobbyAFK",
                                        true
                                    )
                                end
                            end
                        )
                    end
                end
            )
end)

local Toggle = Tabs.Afk:AddToggle("Farm Raid Tokens", {Title = "Auto Farm Raid Tokens", Default = _G.Settings.farmraidtoken })
Toggle:OnChanged(function(H)
        _G.Settings.farmraidtoken = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(260) do
                        if not _G.Settings.farmraidtoken then
                            break
                        end
                        spawn(
                            function()
                                if game.PlaceId == 6990131029 then
                                    _G.Name = game.Players.LocalPlayer.Name .. "StatDisplay"
                                    valuecurrency = game.ReplicatedStorage[_G.Name].AfkCurrencyChosen.Value
                                    if valuecurrency == "Gem" then
                                        wait(1)
                                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                            "ChangeAFKCurrency"
                                        )
                                        for m, n in pairs(
                                            getconnections(
                                                game.Players.LocalPlayer.PlayerGui.AfkGui.CenterUIFrame.Frame.ChangeCurrency.MouseButton1Click
                                            )
                                        ) do
                                            n:Fire()
                                        end
                                    end
                                end
                            end
                        )
                    end
                end
            )
end)

--notify
local Slider = Tabs.Notify:AddSlider("DelayWebhook", {
        Title = "Notification Delay",
        Description = "This is a slider",
        Default = _G.Settings.webhookspeed,
        Min = 10,
        Max = 30,
        Rounding = 1,
        Callback = function(H)
            _G.Settings.webhookspeed = H
            saveSettings()
        end
    })
    
local Input = Tabs.Notify:AddInput("ID Yes Skibidi", {
        Title = "Your ID",
        Default = _G.Settings.dsuser,
        Placeholder = "Your Discord ID",
        Numeric = false, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(H)
            _G.Settings.dsuser = H
            saveSettings()
        end
})

local Input = Tabs.Notify:AddInput("ping", {
        Title = "Ping (@here / @everyone)",
        Default = _G.Settings.otherds,
        Placeholder = "@everyone",
        Numeric = false, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(H)
            _G.Settings.otherds = H
            saveSettings()
        end
})

local Input = Tabs.Notify:AddInput("url", {
        Title = "webhook url",
        Default = _G.Settings.webhookurl,
        Placeholder = "@everyone",
        Numeric = false, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(H)
            _G.Settings.webhookurl = H
            saveSettings()
        end
})

local Toggle = Tabs.Afk:AddToggle("Clear Notify", {Title = "Clear Notifier", Default = _G.Settings.webhook })
Toggle:OnChanged(function(H)
        _G.Settings.webhook = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.webhookspeed) do
                        if not _G.Settings.webhook then
                            break
                        end
                        if
                            game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.ResultUI.Visible ==
                                true
                         then
                            _G.Name = game.Players.LocalPlayer.Name .. "StatDisplay"
                            function webhook(_, a0)
                                local request = http_request or request or HttpPost or syn.request
                                request(
                                    {
                                        Url = _G.Settings.webhookurl,
                                        Method = "POST",
                                        Headers = {["Content-Type"] = "application/json"},
                                        Body = game:GetService("HttpService"):JSONEncode({embeds = {_}, content = a0})
                                    }
                                )
                            end
                            local _ = {
                                ["title"] = "Game Finished",
                                ["type"] = "rich",
                                ["thumbnail"] = {
                                    ["url"] = "https://cdn.discordapp.com/attachments/943829587090100224/987429857354973224/Opera_Snapshot_2022-06-18_015321_www.canva.com.png"
                                },
                                ["description"] = "Character Info / Session Info:",
                                ["fields"] = {
                                    {
                                        ["name"] = "My Level: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.Players.LocalPlayer.leaderstats.Level.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Exploit Detected: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].ExploitsDetected.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Infinite Mode Record: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].InfiniteRecord.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Dimension Cleared: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].StageClear.Value
                                        )
                                    },
                                },
                                ["timestamp"] = DateTime.now():ToIsoDate()
                            }
                            webhook(_, "<@" .. _G.Settings.dsuser .. ">" .. _G.Settings.otherds)
                        end
                    end
                end
            )
end)

local Toggle = Tabs.Afk:AddToggle("Raid Notify", {Title = "Raid Notifier", Default = _G.Settings.raidwebhook })
Toggle:OnChanged(function(H)
        _G.Settings.raidwebhook = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.webhookspeed) do
                        if not _G.Settings.raidwebhook then
                            break
                        end
                        if
                            game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.RaidResultUI.Visible ==
                                true
                         then
                            _G.Name = game.Players.LocalPlayer.Name .. "StatDisplay"
                            function webhook(_, a0)
                                local request = http_request or request or HttpPost or syn.request
                                request(
                                    {
                                        Url = _G.Settings.webhookurl,
                                        Method = "POST",
                                        Headers = {["Content-Type"] = "application/json"},
                                        Body = game:GetService("HttpService"):JSONEncode({embeds = {_}, content = a0})
                                    }
                                )
                            end
                            local _ = {
                                ["title"] = "Raid / Boss Rush game ended",
                                ["type"] = "rich",
                                ["thumbnail"] = {
                                    ["url"] = "https://cdn.discordapp.com/attachments/943829587090100224/987429857354973224/Opera_Snapshot_2022-06-18_015321_www.canva.com.png"
                                },
                                ["description"] = "Character Info / Session Info:",
                                ["fields"] = {
                                    {
                                        ["name"] = "Exploit Detected: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].ExploitsDetected.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Boss Rush Cleared: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].BossRushClears.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Boss Rush Ticket: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].BossRushFreeEntry.Value
                                        )
                                    },
                                    {
                                        ["name"] = "Raid Cleared: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.ReplicatedStorage[_G.Name].RaidClears.Value
                                        )
                                    }
                                },
                                ["timestamp"] = DateTime.now():ToIsoDate()
                            }
                            webhook(_, "<@" .. _G.Settings.dsuser .. ">" .. _G.Settings.otherds)
                        end
                    end
                end
            )
end)

local Toggle = Tabs.Afk:AddToggle("Level Notify", {Title = "Level Notifier", Default = _G.Settings.levelwebhook })
Toggle:OnChanged(function(H)
        _G.Settings.levelwebhook = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(3) do
                        if not _G.Settings.levelwebhook then
                            break
                        end
                        if
                            game.Players.LocalPlayer.PlayerGui.UniversalGui.UniversalCenterUIFrame.LevelUpImage.Visible ==
                                true
                         then
                            _G.Name = game.Players.LocalPlayer.Name .. "StatDisplay"
                            function webhook(_, a0)
                                local request = http_request or request or HttpPost or syn.request
                                request(
                                    {
                                        Url = _G.Settings.webhookurl,
                                        Method = "POST",
                                        Headers = {["Content-Type"] = "application/json"},
                                        Body = game:GetService("HttpService"):JSONEncode({embeds = {_}, content = a0})
                                    }
                                )
                            end
                            local _ = {
                                ["title"] = "You Have Leveled Up!",
                                ["type"] = "rich",
                                ["thumbnail"] = {
                                    ["url"] = "https://cdn.discordapp.com/attachments/943829587090100224/987429857354973224/Opera_Snapshot_2022-06-18_015321_www.canva.com.png"
                                },
                                ["description"] = "",
                                ["fields"] = {
                                    {
                                        ["name"] = "Your are now lvl: ",
                                        ["value"] = game:GetService("HttpService"):JSONDecode(
                                            game.Players.LocalPlayer.leaderstats.Level.Value
                                        )
                                    }
                                },
                                ["timestamp"] = DateTime.now():ToIsoDate()
                            }
                            webhook(_, "<@" .. _G.Settings.dsuser .. ">" .. _G.Settings.otherds)
                        end
                    end
                end
            )
end)

--Auto Sell
local Toggle = Tabs.A:AddToggle("Common", {Title = "Auto Sell Common", Default = _G.Settings.autosellcommon })
Toggle:OnChanged(function(H)
        _G.Settings.autosellcommon = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autosellcommon then
                            break
                        end
                        wait()
                        local I = {"Common"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
end)

local Toggle = Tabs.A:AddToggle("Uncommon", {Title = "Auto Sell Uncommon", Default = _G.Settings.autoselluncommon })
Toggle:OnChanged(function(H)
        _G.Settings.autoselluncommon = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoselluncommon then
                            break
                        end
                        wait()
                        local I = {"Uncommon"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
end)

local Toggle = Tabs.A:AddToggle("Rare", {Title = "Auto Sell Rare", Default = _G.Settings.autosellrare })
Toggle:OnChanged(function(H)
        _G.Settings.autosellrare = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autosellrare then
                            break
                        end
                        wait()
                        local I = {"Rare"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
end)

local Toggle = Tabs.A:AddToggle("Epic", {Title = "Auto Sell Epic", Default = _G.Settings.autosellepic })
Toggle:OnChanged(function(H)
        _G.Settings.autosellepic = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autosellepic then
                            break
                        end
                        wait()
                        local I = {"Epic"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
end)

local Toggle = Tabs.A:AddToggle("Leggy", {Title = "Auto Sell Legendary", Default = _G.Settings.autoselllegendary })
Toggle:OnChanged(function(H)
        _G.Settings.autoselllegendary = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoselllegendary then
                            break
                        end
                        wait()
                        local I = {"Legendary"}
                        local J = game.Players.LocalPlayer.PlayerGui.MainGui.CenterUIFrame.Inventory
                        local K = J.Frame.CardInventoryFrame.CardInventoryScrollingFrame
                        function SellCard(L)
                            game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                                "SellCard",
                                L
                            )
                        end
                        for M, N in pairs(K:GetChildren()) do
                            if N:IsA("ImageButton") then
                                for O, P in next, getconnections(N.CardClick.MouseButton1Down) do
                                    P:Fire()
                                    local Q = J.Frame.InvOverlayOuterFrame.CardInventoryOverlay.Rarity.Text
                                    for R, S in next, I do
                                        if Q == S then
                                            SellCard(N.Name)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            )
end)

--spin
local Dropdown = Tabs.B:AddDropdown("Capsule", {
        Title = "Select Capsule",
        Values = s,
        Multi = false,
        Default = 1,
})
Dropdown:OnChanged(function(H)
        _G.Settings.selectegg = H
            saveSettings()
    end)
    
local Toggle = Tabs.B:AddToggle("AutoSpin", {Title = "Auto Capsule", Default = _G.Settings.autospingem })
Toggle:OnChanged(function(H)
        _G.Settings.autospingem = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(_G.Settings.eggspintime) do
                        if not _G.Settings.autospingem then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "BuyEgg",
                            _G.Settings.selectegg
                        )
                    end
                end
            )
end)

local Slider = Tabs.B:AddSlider("SpinDelay", {
        Title = "Spin Delay",
        Description = "",
        Default = _G.Settings.eggspintime,
        Min = 0,
        Max = 10,
        Rounding = 1,
        Callback = function(H)
            _G.Settings.eggspintime = H
            saveSettings()
        end
    })

--claim

local Toggle = Tabs.C:AddToggle("ClaimDaily", {Title = "Auto Claim Daily Quests", Default = _G.Settings.Autoclaimquest })
Toggle:OnChanged(function(H)
        _G.Settings.Autoclaimquest = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.Autoclaimquest then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_Login"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_DungeonClear"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_Enemies"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_TimeChallenge"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_Raid"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_BossRush"
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "CompleteDailyQuest",
                            "DailyQuest_AllQuestClear"
                        )
                    end
                end
            )
end)

local Toggle = Tabs.C:AddToggle("SpeedRaidClaim", {Title = "Auto Claim Speed Raid Rewards", Default = _G.Settings.autoclaimrewardspeed })
Toggle:OnChanged(function(H)
        _G.Settings.autoclaimrewardspeed = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoclaimrewardspeed then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            1
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            2
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            3
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            4
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            5
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            6
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            7
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            8
                        )
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "ClaimWeeklySpeedRaidReward",
                            9
                        )
                    end
                end
            )
end)

local Toggle = Tabs.C:AddToggle("ClaimTicket", {Title = "Auto Claim Daily Raid Ticket", Default = _G.Settings.autoclaimrewardraid })
Toggle:OnChanged(function(H)
        _G.Settings.autoclaimrewardraid = H
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autoclaimrewardraid then
                            break
                        end
                        game:GetService("ReplicatedStorage").RemoteFunctions.MainRemoteFunction:InvokeServer(
                            "GiveFreeDailyGemFromShop"
                        )
                    end
                end
            )
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
    
    do
    Fluent:Notify({
        Title = "FroZen Hub has injected",
        Content = "report any bugs at https://dsc.gg/frozen-x",
        SubContent = "or copy the link trough the 'Misc' page", -- Optional
        Duration = 3.5 -- Set to nil to make the notification not disappear
    })
end
    
    print("FroZen Hub V1 | Propriety of Frostbite Development Team©")