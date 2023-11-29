-- VERSION .5 FIXED TOGGLES FOR GADGETS AND DRONE CHAMS!

--- a few things are fucked so please wait till version 2.0 for shit to really work
local function addCham(object, tbl)
  if not object:FindFirstChild("cham") then
      local h = Instance.new("Highlight")
      h.Name = "cham"
      h.Parent = object
      h.Adornee = object
      h.Enabled = true
      h.FillColor = tbl.color
      h.FillTransparency = tbl.fTransparency
      h.OutlineColor = tbl.color
      h.OutlineTransparency = tbl.oTransparency
  end
end
getgenv().gadget = true
getgenv().dronechams = true
getgenv().config = {
  chams = true,
  fixTeam = true, 
  transSoftWall = true,
  transBarricade = true,
  bringEnemies = false, -- super buggy cant be undone once toggled?
  dronechams = true,
  waittime = 5, -- wait time for drone chams and object chams lower might be more glitchy
  objectschams = true, -- if they stop highlighting its due to 30 limit reached
  dronecolor = Color3.fromRGB(167, 71, 141), -- pink ish
  objectcolor = Color3.fromRGB(18, 158, 0), -- green
  bombColor = Color3.fromHex("#ffac00"), -- orange
  teamColor = {
      attacker = Color3.fromHex("#ff0000"), -- red
      defender = Color3.fromHex("#0000ff") -- blue
  }
}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
  Name = "Operations Siege Script Hub",
  LoadingTitle = "Buy MACSPLOIT <3, NO KEYSYTEM <3",
  LoadingSubtitle = "by ThatsMyMute, Exunys (esp), griffin (.gg/griffin)",
  ConfigurationSaving = {
     Enabled = true,
     FolderName = nil, -- Create a custom folder for your hub/game
     FileName = "SETTINGS"
  },
  Discord = {
     Enabled = true,
     Invite = "griffin", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
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
local Esp = Window:CreateTab("ESP (Players and Drones)", 4483362458) -- Title, Image
local Walls = Window:CreateTab("Walls/Map misc", 4483362458) -- Title, Image
local Plresp = Esp:CreateSection("General esp")


local Toggle = Esp:CreateToggle({
  Name = "Player esp (Exunys)",
  CurrentValue = false,
  Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
  Callback = function(eh)
    local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))()
if eh == true then do 
  ExunysDeveloperESP.Load()
end
if eh == false then do
  ExunysDeveloperESP.RemoveCrosshair()
ExunysDeveloperESP.UnwrapPlayers()
end
end
end
  end,
})

local Toggle = Esp:CreateToggle({
  Name = "Player esp (chams griffin)",
  CurrentValue = false,
  Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
  Callback = function(cheems)
    getgenv().cheems = true
    while getgenv().cheems == false do
        v.Destroy()
        end
    -- Function to get the team color
    local function getTeamColor(plr)
       local team = plr.Team
       if team then
           return team.TeamColor.Color
       else
           return Color3.new(255, 255, 255)  -- Default color if the player is not on any team
       end
    end
    
    while getgenv().cheems == true do
       for _, v in pairs(game.Players:GetChildren()) do
           if v ~= game.Players.LocalPlayer and v.Character and not v.Character:FindFirstChild("Highlight") then
               local highlight = Instance.new("Highlight", v.Character)
               highlight.FillTransparency = 0.5
               highlight.OutlineTransparency = 0.5
               highlight.FillColor = getTeamColor(v)
           elseif v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Highlight") then
               v.Character.Highlight.FillColor = getTeamColor(v)
           end
       end
      task.wait(0.1)
    end
    end
})
local Toggle = Walls:CreateToggle({
  Name = "View Through walls (GRIFFIN, Glitches on reinforcements)",
  CurrentValue = false,
  Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
  Callback = function(test)
    getgenv().test = true
    local Breach = game.workspace["SE_Workspace"].Breach
    while test and wait() do
        for i,v in ipairs(Breach:GetDescendants()) do
            if v:IsA("Part") then
                if (v.Material == Enum.Material.WoodPlanks and v.Transparency ~= 0.5) then
                    v.Transparency = 0.5
                else
                    if (v.Material ~= Enum.Material.WoodPlanks and v.Transparency ~= 0.2) then
                        v.Transparency = 0.2
                    end
                end
            end
        end
    end
  end,
})

local LocalPlayer = game.Players.LocalPlayer
local pgui = LocalPlayer.PlayerGui
local context = pgui.GameGui.TimerHUD.Contex.TextLabel
local Breach = game.workspace["SE_Workspace"].Breach
local Doors = game.workspace["SE_Workspace"].Doors

local Toggle = Esp:CreateToggle({
  Name = "Drone CHAMS",
  CurrentValue = true,
  Flag = "Toggle5",
  Callback = function(dronechams)
  

  
  while getgenv().dronechams do
      for _, v in ipairs(game.workspace.SE_Workspace.Drones:GetChildren()) do
          if not v:FindFirstChild("cham") then
              addCham(v, {
                  color = dronecolor,
                  oTransparency = 0,
                  fTransparency = 0.5
              })
          end
      end
      wait()
  end
  end
  })
  

  local Toggle = Esp:CreateToggle({
    Name = "Object Chams Made By ME ✅",
    CurrentValue = true,
    Flag = "Toggle6",
    Callback = function(gadget)

local function addCham(object, tbl)
    if not object:FindFirstChild("cham") then
        local h = Instance.new("Highlight")
        h.Name = "cham"
        h.Parent = object
        h.Adornee = object
        h.Enabled = true
        h.FillColor = tbl.color
        h.FillTransparency = tbl.fTransparency
        h.OutlineColor = tbl.color
        h.OutlineTransparency = tbl.oTransparency
    end
end

while getgenv().gadget do
    for _, v in ipairs(game.workspace.Gadgets:GetChildren()) do
        if not v:FindFirstChild("cham") then
            addCham(v, {
                color = Color3.fromRGB(255, 0, 0),
                oTransparency = 0,
                fTransparency = 0.5
            })
        end
    end
    wait()
end

end
  })
