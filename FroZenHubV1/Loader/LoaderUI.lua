local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FroZen Hub V1",
    SubTitle = "Loader | v.0.1.9",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main Games", Icon = "gamepad-2" }),
    Other = Window:AddTab({ Title = "Other Scripts", Icon = "album" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "airplay" }),
    Update = Window:AddTab({ Title = "Changelogs", Icon = "clipboard-list" }),
    Event = Window:AddTab({ Title = "Event/Giveaways", Icon = "gift" })
}
--main scripts
Tabs.Main:AddButton({
        Title = "Blade Ball",
        Description = "",
        Callback = function()
            BladeBall_Script()
        end
    })
    
Tabs.Main:AddButton({
        Title = "Break In 2",
        Description = "",
        Callback = function()
            BreakInTwo_Script()
        end
    })
    
Tabs.Main:AddButton({
        Title = "Slap Battles",
        Description = "",
        Callback = function()
            SlapBattles_Script()
        end
    })
    
Tabs.Main:AddButton({
        Title = "Obby but You're on a Bike!",
        Description = "",
        Callback = function()
            BikeObby_Script()
        end
    })
    
Tabs.Main:AddButton({
        Title = "Murder Mystery 2",
        Description = "",
        Callback = function()
            MM2_Script()
        end
    })
--other scripts 
Tabs.Other:AddButton({
        Title = "Infinite Yield",
        Description = "",
        Callback = function()
            InfiniteYield_Other()
        end
    })
    
Tabs.Other:AddButton({
        Title = "Mobile Keyboard",
        Description = "",
        Callback = function()
            MobileKeyboard_Other()
        end
    })
--misc
Tabs.Misc:AddParagraph({
        Title = "Credits",
        Content = "Credits to:\n• Frostbite Development Team\n• EdxymRBLX\n• Edxym Solutions"
    })
    
Tabs.Misc:AddParagraph({
        Title = "Showcasers/Content Creators",
        Content = "No videos showcasing FroZen Hub V1 Yet"
    })

--updates
local Update2 = Tabs.Update:AddSection("Update 2")
Update2:AddParagraph({
        Title = "April 6th 2024:",
        Content = "Obby but You're on a Bike:\n • Updated for World 22 and 23\n • Updated 'Get Bike' to all 103 bikes\n • Fixed Crashes\n • Improved Stability\n\nNEW GAME ADDED:\n • Murder Mystery 2 [BETA]\n\nLoader:\n • Added Events/Giveaway page\n • Added this Chnagelog page\n • Improved raw performance upon launching the script"
    })
 
--giveaways
local Giveaway = Tabs.Event:AddSection("Giveaways")
Giveaway:AddParagraph({
        Title = "FREE 1 WEEK/MONTH/LIFETIME PREMIUM KEYS GIVEAWAY",
        Content = "How to Enter?\n1. Like our scripts at https://rscripts.net and https://scriptblox.com\n2. Join the discord at https://dsc.gg/frozen-x\n3. go to the giveaway page"
 })
 
 Giveaway:AddButton({
        Title = "Get Rscripts link for step 1",
        Description = "",
        Callback = function()
            setclipboard("https://rscripts.net/script/frozen-hub-or-blade-ball-or-easy-to-use-QHqB")
        end
    })
 Giveaway:AddButton({
        Title = "Get Scriptblox link for step 1",
        Description = "",
        Callback = function()
            setclipboard("https://scriptblox.com/script/Slap-Battles-FroZen-Hub-V1-Easy-to-use-11918")
        end
    })
 Giveaway:AddButton({
        Title = "Get Discord link for step 2",
        Description = "",
        Callback = function()
            setclipboard("https://dsc.gg/frozen-x")
        end
    })
 local Event = Tabs.Event:AddSection("Event")
 Event:AddParagraph({
        Title = "Youtube Event",
        Content = "making videos showcasing FroZen Hub V1 on youtube and using the #FroZenHub Tag will give you a chance to qualify and let you to earn some neat rewards!\n Reward List:\n • free 1 week key\n • free 1 month key\n • free lifetime key\n • 50-200 robux\n • 300-400 robux"
    })
    
--script functions
function BladeBall_Script()
Fluent:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CorruptedClan/tridentsyr/main/FroZenHubV1/Games/BladeBall.lua"))()
end

function BreakInTwo_Script()
Fluent:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CorruptedClan/tridentsyr/main/FroZenHubV1/Games/BreakIn2.lua"))()
end

function SlapBattles_Script()
Fluent:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CorruptedClan/tridentsyr/main/FroZenHubV1/Games/SlapBattles.lua"))()
end

function BikeObby_Script()
Fluent:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CorruptedClan/tridentsyr/main/FroZenHubV1/Games/BikeObby.lua"))()
end

function MM2_Script()
Fluent:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CorruptedClan/tridentsyr/main/FroZenHubV1/Games/MM2.lua"))()
end

function InfiniteYield_Other()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end

function MobileKeyboard_Other()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end