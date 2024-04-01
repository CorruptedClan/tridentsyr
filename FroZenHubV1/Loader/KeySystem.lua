local KeySystemUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/ui/xrer_mstudio45.lua"))()
KeySystemUI.New({
    ApplicationName = "FroZenHub", -- Your Key System Application Name
    Name = "FroZen Hub V1", -- Your Script name
    Info = "to acces FroZen Hub you have to cpmplete the key system. this will help us earn money to maintain the script.", -- Info text in the GUI, keep empty for default text.
    DiscordInvite = "https://dsc.gg/frozen-x", -- Optional.
    AuthType = "ip" -- Can select verification with ClientId or IP ("clientid" or "ip")
})
repeat task.wait() until KeySystemUI.Finished() or KeySystemUI.Closed
if KeySystemUI.Finished() and KeySystemUI.Closed == false then
    print("Key verified, can load script") loadstring(game:HttpGet("https://raw.githubusercontent.com/CorruptedClan/tridentsyr/main/FroZenHubV1/Loader/LoaderUI.lua"))()
primt("script loaded")
else
    print("Player closed the GUI.")
end
