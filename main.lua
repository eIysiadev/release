local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- [[ THEME: ELITE CYBER GOLD ]]
local Window = WindUI:CreateWindow({
    Title = "THE CID PANEL ◆ PREMIUM",
    Folder = "cid_ultimate_v2",
    Icon = "solar:crown-bold",
    NewElements = true,
    AccentColor = Color3.fromHex("#FFD700"),
    OpenButton = {
        Title = "CID MENU",
        Enabled = true,
        Draggable = true,
        Color = ColorSequence.new(Color3.fromHex("#FFD700"), Color3.fromHex("#FF4B4B"))
    }
})

-- [[ INSTANT NOTIFICATION ]]
WindUI:Notify({
    Title = "CID PREMIUM ACTIVE",
    Content = "Welcome, " .. game.Players.LocalPlayer.DisplayName .. " | V2.5 Loaded.",
    Duration = 3,
    Icon = "solar:shield-check-bold"
})

-- --- DASHBOARD ---
local Dash = Window:Tab({ Title = "Dashboard", Icon = "solar:home-bold", IconColor = Color3.fromHex("#FFD700") })

local Profile = Dash:Section({ Title = "User Status" })
Profile:Section({ Title = "User: " .. game.Players.LocalPlayer.Name, TextTransparency = 0.5 })
Profile:Section({ Title = "Rank: [ PREMIUM ]", Icon = "solar:verified-check-bold" })

local LiveStats = Dash:Section({ Title = "Live Metrics" })
local PingLabel = LiveStats:Section({ Title = "Ping: --", Icon = "solar:transmission-bold" })
local FPSLabel = LiveStats:Section({ Title = "FPS: --", Icon = "solar:graph-bold" })

task.spawn(function()
    local RS = game:GetService("RunService")
    while task.wait(0.5) do
        local fps = math.floor(1 / RS.RenderStepped:Wait())
        local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        PingLabel:SetTitle("Ping: " .. ping .. "ms")
        FPSLabel:SetTitle("FPS: " .. fps)
    end
end)

-- --- MAIN GAMES ---
local Main = Window:Tab({ Title = "Main Games", Icon = "solar:star-bold", IconColor = Color3.fromHex("#FF4B4B") })

Main:Divider({ Title = "Adopt Me Collection" })
Main:Button({
    Title = "Adopt Me (Gingerbread)",
    Desc = "Auto-farm winter currency instantly.",
    Icon = "solar:play-bold",
    Callback = function() loadstring(game:HttpGet('https://pastefy.app/71SURyDf/raw'))() end
})
Main:Button({
    Title = "Adopt Me (Pet Spawner)",
    Desc = "Exclusive pet management tools.",
    Icon = "solar:play-bold",
    Callback = function() loadstring(game:HttpGet('https://pastefy.app/nTv8VJUz/raw'))() end
})

Main:Divider({ Title = "Combat & Social" })
Main:Button({
    Title = "Murder Mystery 2",
    Desc = "Silent Aim, ESP, and Auto-Farm.",
    Icon = "solar:play-bold",
    Callback = function() loadstring(game:HttpGet('https://pastefy.app/OMoSSnvZ/raw'))() end
})
Main:Button({
    Title = "Brookhaven (Premium)",
    Desc = "Unlock all gamepasses & house features.",
    Icon = "solar:play-bold",
    Callback = function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))() end
})

-- --- OTHER GAMES ---
local Other = Window:Tab({ Title = "Other Games", Icon = "solar:gamepad-old-bold", IconColor = Color3.fromHex("#00BFFF") })

-- [[ ADDED EVADE DARA HUB ]]
Other:Button({
    Title = "Evade (Dara Hub)",
    Desc = "Keyless hub for Evade features.",
    Icon = "solar:ghost-bold",
    Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Evade-Dara-Hub-KEYLESS-70545"))() end
})

Other:Button({
    Title = "Speed Hub X",
    Desc = "All-in-one Hub (Blox Fruits, Pet Sim, etc.)",
    Icon = "solar:fire-bold",
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))() 
    end
})

Other:Button({
    Title = "Blox Fruits (Premium)",
    Desc = "Auto-farm levels and fruits.",
    Icon = "solar:play-bold",
    Callback = function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))() end
})
Other:Button({
    Title = "Arsenal (Verified)",
    Desc = "Universal aimbot and wallhacks.",
    Icon = "solar:play-bold",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/0x0d3f/Quartyz/main/Gold.lua"))() end
})
Other:Button({
    Title = "Rivals (New Script)",
    Desc = "Latest update for Rivals dominance.",
    Icon = "solar:play-bold",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/blexn9/Script/refs/heads/main/Main"))() end
})
Other:Button({
    Title = "Strongest Battlegrounds",
    Desc = "S-P Hub combat integration.",
    Icon = "solar:play-bold",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/S-PScripts/S-P-Hub/main/Main.lua"))() end
})

-- --- SETTINGS & UTILITIES ---
local Settings = Window:Tab({ Title = "Settings", Icon = "solar:settings-bold", IconColor = Color3.new(1,1,1) })

local PlayerUtils = Settings:Section({ Title = "Player Utility" })
PlayerUtils:Slider({ Title = "Walkspeed", Value = { Min = 16, Max = 500, Default = 16 }, Callback = function(v) pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end) end })
PlayerUtils:Slider({ Title = "Jump Power", Value = { Min = 50, Max = 800, Default = 50 }, Callback = function(v) pcall(function() game.Players.LocalPlayer.Character.Humanoid.JumpPower = v end) end })

local System = Settings:Section({ Title = "System" })
System:Toggle({ 
    Title = "Anti-AFK", 
    Desc = "Prevent idle disconnect.",
    Callback = function(v)
        _G.AntiAFK = v
        WindUI:Notify({Title = "Security", Content = v and "Anti-AFK Protocol On" or "Anti-AFK Protocol Off"})
    end
})

System:Button({
    Title = "Rejoin",
    Icon = "solar:restart-bold",
    Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end
})

-- --- CREDITS ---
local Info = Window:Tab({ Title = "Credits", Icon = "solar:info-circle-bold", IconColor = Color3.fromHex("#10C550") })
Info:Section({ Title = "THE CID PANEL v2.5", FontWeight = Enum.FontWeight.Bold })
Info:Button({ 
    Title = "Copy Discord Link", 
    Icon = "solar:copy-bold", 
    Callback = function() 
        setclipboard("https://discord.gg/2vxSdFF375") 
        WindUI:Notify({Title = "Copied", Content = "Discord invite copied!"})
    end 
})

-- [[ KEYBIND TO TOGGLE UI ]]
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightControl then
        Window:Toggle()
    end
end)
