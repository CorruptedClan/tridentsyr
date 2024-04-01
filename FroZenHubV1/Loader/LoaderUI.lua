local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "FroZen Hub V1",
    SubTitle = "Loader | v.0.0.4",
    TabWidth = 160,
    Size = UDim2.fromOffset(560, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main Games", Icon = "gamepad-2" }),
    Other = Window:AddTab({ Title = "Other Scripts", Icon = "album" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "airplay" })
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
        Title = "Obby but You're on a Bikel",
        Description = "",
        Callback = function()
            BikeObby_Script()
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

function InfiniteYield_Other()
Fluent:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
end

function MobileKeyboard_Other()
Fluent:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end
