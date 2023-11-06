local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Realistic hood; enjoy",
    LoadingTitle = "Poorly Made Productions Script Hub",
    LoadingSubtitle = "I Shit my pants making this; Poorly Made Productions",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "mog Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "DMFNvPC8sv", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local PlayerTab = Window:CreateTab("Player stuff like speed and jump", 4483362458) -- Title, Image
 local GunTab = Window:CreateTab("Gun mods", 4483362458) -- Title, Image
 local EspTab = Window:CreateTab("Esp and soon aimbot", 4483362458) -- Title, Image

 local Slider = PlayerTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {1, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

-- Function to update WalkSpeed based on the slider's value continuously
local function updateWalkSpeed()
    while true do
        local sliderValue = walkSpeedSlider:GetValue()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sliderValue
        wait(0.1) -- Adjust the delay as needed
    end
end

-- Start the function in a new thread
spawn(updateWalkSpeed)

local Button = GunTab:CreateButton({
   Name = "Gun mods",
   Callback = function()
       while true do
    local Plr = game:GetService("Players").LocalPlayer
    for i, v in pairs(Plr.Backpack:GetChildren()) do
        Plr.Character.Humanoid:EquipTool(v)
        wait(1) -- Adjust the wait time as needed, in seconds
        Plr.Character.Humanoid:UnequipTools(v)
    end

    for i, v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'Ammo') then
            v.Ammo = 9e9
            v.StoredAmmo = 9e9
            v.MaxStoredAmmo = 9e9
            v.gunRecoil = {
                gunRecoilUp = {0, 0},
                gunRecoilTilt = {0, 0},
                gunRecoilLeft = {0, 0},
                gunRecoilRight = {0, 0},
            }
            v.camRecoil = {
                camRecoilUp = {0, 0},
                camRecoilTilt = {0, 0},
                camRecoilLeft = {0, 0},
                camRecoilRight = {0, 0},
            }
            v.FireModes = {
                ChangeFiremode = true,
                Semi = true,
                Burst = true,
                Auto = true
            }
            v.MinSpread = 0
            v.MaxSpread = 0
        end
    end
    wait(30) -- Adjust the wait time between iterations, in seconds
end

end,    
})
local Button = EspTab:CreateButton({
   Name = "Esp its fucked",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/ESP/Base.lua"))()
})
local Button = EspTab:CreateButton({
   Name = "Aimbot",
   Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()
ExunysDeveloperAimbot()
end,    
})

 local Slider = PlayerTab:CreateSlider({
    Name = "Jump Height",
    Range = {10, 500},
    Increment = 1,
    Suffix = "Height",
    CurrentValue = 10,
    Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
     game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
 })
