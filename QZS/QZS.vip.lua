--ESP toggle
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlternateAccess/NewEspLibV1.1/main/RewriteV1", true))()
ESP:Toggle(false)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.TeamColor = true
ESP.Distance = false
ESP.TeamMates = false
ESP.Health = false
ESP.Items = false

--UI Library
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'QZS.vip',
    Center = true, 
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    ['UI Settings'] = Window:AddTab('Main'),
    Visuals = Window:AddTab('Visuals'), 
    Combat = Window:AddTab('Combat'), 
    Player = Window:AddTab('Player'), 
    World = Window:AddTab('World'), 
    Misc = Window:AddTab('Misc'), 
}

-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

-- Sets the watermark text
Library:SetWatermark('QZS.vip (priv lol)')

Library.KeybindFrame.Visible = false; -- todo: add a function for this

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

MenuGroup:AddToggle('WaterMark', {
    Text = 'Watermark',
    Default = true, -- Default value (true / false)
})

Toggles.WaterMark:OnChanged(function(state)
    if state then
        Library:SetWatermarkVisibility(true)
    else
        Library:SetWatermarkVisibility(false)
	 end
end)

MenuGroup:AddToggle('KeyMenu', {
    Text = 'Keybinds Menu',
    Default = false, -- Default value (true / false)
})

Toggles.KeyMenu:OnChanged(function(state)
    if state then
        Library.KeybindFrame.Visible = true;
    else
        Library.KeybindFrame.Visible = false;
	 end
end)

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('BP2SV2')
SaveManager:SetFolder('BP2SV2/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config 
-- which has been marked to be one that auto loads!

local Credits = Tabs['UI Settings']:AddRightGroupbox('Credits')
Credits:AddLabel('Dontaii#1380 ~ Owner')
Credits:AddLabel('P2P#7356 ~ Main Dev')
Credits:AddLabel('Nerd_Emoji#3425 ~ Main Dev')
Credits:AddLabel('grzmot69#2004 ~ Side Dev')
Credits:AddLabel('c00dy#4525 ~ Side Dev')
Credits:AddLabel('Eag0la#8263 ~ Panel Manager')

local ESPWindow = Tabs.Visuals:AddLeftGroupbox('Player Visuals')

ESPWindow:AddToggle('EspToggle', {
    Text = 'Esp Toggle',
    Default = false, -- Default value (true / false)
    Tooltip = 'Toggles Esp Library', -- Information shown when you hover over the toggle
})

Toggles.EspToggle:OnChanged(function(state)
    if state then
        ESP:Toggle(true)
    else
        ESP:Toggle(false)
	 end
end)

ESPWindow:AddToggle('Names', {
    Text = 'Names',
    Default = false, -- Default value (true / false)
})

Toggles.Names:OnChanged(function(state)
    if state then
        ESP.Names = true
    else
        ESP.Names = false
	 end
end)

ESPWindow:AddToggle('Boxes', {
    Text = 'Boxes',
    Default = false, -- Default value (true / false)
})

Toggles.Boxes:OnChanged(function(state)
    if state then
        ESP.Boxes = true
    else
        ESP.Boxes = false
	 end
end)

ESPWindow:AddToggle('Tracers', {
    Text = 'Tracers',
    Default = false, -- Default value (true / false)
})

Toggles.Tracers:OnChanged(function(state)
    if state then
        ESP.Tracers = true
    else
        ESP.Tracers = false
	 end
end)

ESPWindow:AddToggle('Distance', {
    Text = 'Distance',
    Default = false, -- Default value (true / false)
})

Toggles.Distance:OnChanged(function(state)
    if state then
        ESP.Distance = true
    else
        ESP.Distance = false
	 end
end)

ESPWindow:AddToggle('TeamMates', {
    Text = 'TeamMates',
    Default = true, -- Default value (true / false)
})

Toggles.TeamMates:OnChanged(function(state)
    if state then
        ESP.TeamMates = true
    else
        ESP.TeamMates = false
	 end
end)

ESPWindow:AddToggle('HealthBars', {
    Text = 'HealthBars',
    Default = false, -- Default value (true / false)
})

Toggles.HealthBars:OnChanged(function(state)
    if state then
        ESP.Health = true
    else
        ESP.Health = false
	 end
end)

ESPWindow:AddToggle('Holding', {
    Text = 'Holding',
    Default = false, -- Default value (true / false)
    Tooltip = 'Shows what a player is holding out', -- Information shown when you hover over the toggle
})

Toggles.Holding:OnChanged(function(state)
    if state then
        ESP.Items = true
    else
        ESP.Items = false
	 end
end)

ESPWindow:AddToggle('TeamColor', {
    Text = 'Team Color',
    Default = false, -- Default value (true / false)
})

Toggles.TeamColor:OnChanged(function(state)
    if state then
        ESP.TeamColor = true
    else
        ESP.TeamColor = false
	 end
end)

local Player1 = Tabs.Player:AddLeftGroupbox('Movement')

Player1:AddToggle('FlyHack', {
    Text = 'FlyHack',
    Default = false, -- Default value (true / false)
    Tooltip = 'Space to toggle FlyHack', -- Information shown when you hover over the toggle
})

Toggles.FlyHack:OnChanged(function(state)
    if state then
        local FlyKey = Enum.KeyCode.Space
local SpeedKey = Enum.KeyCode.LeftControl

local SpeedKeyMultiplier = 12
local FlightSpeed = 40
local FlightAcceleration = 12
local TurnSpeed = 14

local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local User = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UserCharacter = nil
local UserRootPart = nil
local Connection = nil


workspace.Changed:Connect(function()
    Camera = workspace.CurrentCamera
end)

local setCharacter = function(c)
    UserCharacter = c
    UserRootPart = c:WaitForChild("HumanoidRootPart")
end

User.CharacterAdded:Connect(setCharacter)
if User.Character then
    setCharacter(User.Character)
end

local CurrentVelocity = Vector3.new(0,0,0)
local Flight = function(delta)
    local BaseVelocity = Vector3.new(0,0,0)
    if not UserInputService:GetFocusedTextBox() then
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
        end
    	if UserInputService:IsKeyDown(SpeedKey) then
    		BaseVelocity = BaseVelocity * SpeedKeyMultiplier
    	end
    end
    if UserRootPart then
        local car = UserRootPart:GetRootPart()
        if car.Anchored then return end
        if not isnetworkowner(car) then return end
        CurrentVelocity = CurrentVelocity:Lerp(
            BaseVelocity,
            math.clamp(delta * FlightAcceleration, 0, 1)
        )
        car.Velocity = CurrentVelocity + Vector3.new(0,2,0)
        if car ~= UserRootPart then
            car.RotVelocity = Vector3.new(0,0,0)
            car.CFrame = car.CFrame:Lerp(CFrame.lookAt(
                car.Position,
                car.Position + CurrentVelocity + Camera.CFrame.LookVector
            ), math.clamp(delta * TurnSpeed, 0, 1))
        end
    end
end

UserInputService.InputBegan:Connect(function(userInput,gameProcessed)
    if gameProcessed then return end
    if userInput.KeyCode == FlyKey then
        if Connection then
            Connection:Disconnect()
            Connection = nil
        else
            CurrentVelocity = UserRootPart.Velocity
            Connection = RunService.Heartbeat:Connect(Flight)
        end
    end
end)
    else
        if Connection then
            Connection:Disconnect()
            Connection = nil
        end
    end
end)

Player1:AddToggle('InfiniteJump', {
    Text = 'Infinite Jump',
    Default = false, -- Default value (true / false)
})

local infiniteJumpEnabled = false

Toggles.InfiniteJump:OnChanged(function(state)
    infiniteJumpEnabled = state
end)

local Player = game:GetService'Players'.LocalPlayer
local UIS = game:GetService'UserInputService'

UIS.InputBegan:Connect(function(UserInput)
    if infiniteJumpEnabled and UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        if Player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping or Player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)


Player1:AddSlider('JumpPower', {
    Text = 'Jump Power',
    Default = 25,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = true, -- If set to true, then it will hide the label
})

local Number = Options.JumpPower.Value
Options.JumpPower:OnChanged(function(s)
    _G.JumpHeight = s;

    local Player = game:GetService'Players'.LocalPlayer
    local UIS = game:GetService'UserInputService'
    local canJump = true
    
    function Action(Object, Function) 
        if Object ~= nil then 
            Function(Object); 
        end 
    end
    
    UIS.InputBegan:Connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space and canJump then
            Action(Player.Character.Humanoid, function(self)
                if self:GetState() ~= Enum.HumanoidStateType.Jumping and self:GetState() ~= Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                        canJump = false
                    end)
                end
            end)
        end
    end)
    Player.Character.Humanoid.Jumping:Connect(function()
        canJump = true
    end)
end)

local Player2 = Tabs.Player:AddLeftGroupbox('Game Exploits')

Player2:AddToggle('Noclip', {
    Text = 'Noclip',
    Default = false, -- Default value (true / false)
})

Toggles.Noclip:OnChanged(function(state)
    if state then
        getgenv().noclip = true
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        local mouse = player:GetMouse()

        mouse.KeyDown:Connect(function(key)
            if key == "" then
                getgenv().noclip = not getgenv().noclip

                if not StealthMode then
                    Indicator.Text = "Noclip: " .. (getgenv().noclip and "Enabled" or "Disabled")
                end
            end
        end)

        while true do
            player = game.Players.LocalPlayer
            character = player.Character

            if getgenv().noclip then
                for _, v in pairs(character:GetDescendants()) do
                    pcall(function()
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end)
                end
            end

            game:GetService("RunService").Stepped:wait()
        end
    else
        getgenv().noclip = false
        --v.CanCollide = true
	 end
end)

Player2:AddToggle('ForceBody', {
    Text = 'Force Body',
    Default = false, -- Default value (true / false)
})

Toggles.ForceBody:OnChanged(function(state)
    if state then
        
    else
        
	 end
end)

local World3 = Tabs.World:AddRightGroupbox('Modifiers')

World3:AddToggle('CC', {
    Text = 'Color Correction',
    Default = false, -- Default value (true / false)
})

Toggles.CC:OnChanged(function(state)
    if state then
        game:GetService("Lighting").ColorCorrection.Enabled = true
    else
        game:GetService("Lighting").ColorCorrection.Enabled = false
    end
end)

World3:AddSlider('CC2', {
    Text = 'Brightness',
    Default = 0.5,
    Min = 0,
    Max = 3,
    Rounding = 2,
    Compact = true,
})

local Number = Options.CC2.Value
Options.CC2:OnChanged(function(s)
    game:GetService("Lighting").ColorCorrection.Brightness = s
end)

World3:AddSlider('CC3', {
    Text = 'Contrast',
    Default = 0.5,
    Min = 0,
    Max = 3,
    Rounding = 2,
    Compact = true, -- If set to true, then it will hide the label
})

local Number = Options.CC3.Value
Options.CC3:OnChanged(function(s)
    game:GetService("Lighting").ColorCorrection.Contrast = s
end)

World3:AddSlider('CCSaturation', {
    Text = 'Saturation',
    Default = 0.5,
    Min = 0,
    Max = 3,
    Rounding = 2,
    Compact = true,
})

Options.CCSaturation:OnChanged(function(s)
    game:GetService("Lighting").ColorCorrection.Saturation = s
end)
