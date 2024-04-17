local SyncUI = loadstring(game:HttpGet('https://raw.githubusercontent.com/Alan0947383/Coemssjsns/main/SyncV2.lua%20(2)%20(1).txt'))()

SyncUI:Create({
  Service = "frozenhubv1", --- Your actual panda auth service name
  Name = "FroZen Hub V1", --- Your hub name
  Discord = "https://dsc.gg/frozen-x", --- Your discord link
  Color = "Blue",
  LibVersion = "v2",
  Callback = function() --- What happen if key correct
    Load_GUI()
  end,
  SaveKey = true --- Save key or not
})

function Load_GUI()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CorruptedClan/tridentsyr/main/FroZenHubV1/Loader/LoaderUI.lua"))()
end