--UID stuff
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Alternate = Instance.new("TextLabel")
local Access = Instance.new("TextLabel")
local User = Instance.new("TextLabel")
local UID = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.00312500005, 0, 0.0108303251, 0)
Frame.Size = UDim2.new(0, 106, 0, 76)

Alternate.Name = "Alternate"
Alternate.Parent = Frame
Alternate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Alternate.BackgroundTransparency = 1.000
Alternate.Size = UDim2.new(0, 60, 0, 33)
Alternate.Font = Enum.Font.SourceSansSemibold
Alternate.Text = "Alternate"
Alternate.TextColor3 = Color3.fromRGB(255, 255, 255)
Alternate.TextSize = 18.000
Alternate.TextWrapped = true
Alternate.TextXAlignment = Enum.TextXAlignment.Left

Access.Name = "Access"
Access.Parent = Frame
Access.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Access.BackgroundTransparency = 1.000
Access.Position = UDim2.new(0.566037714, 0, 0, 0)
Access.Size = UDim2.new(0, 60, 0, 33)
Access.Font = Enum.Font.SourceSansSemibold
Access.Text = "Access"
Access.TextColor3 = Color3.fromRGB(0, 46, 255)
Access.TextSize = 18.000
Access.TextWrapped = true
Access.TextXAlignment = Enum.TextXAlignment.Left

User.Name = "User"
User.Parent = Frame
User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
User.BackgroundTransparency = 1.000
User.Position = UDim2.new(0, 0, 0.302631587, 0)
User.Size = UDim2.new(0, 103, 0, 17)
User.Font = Enum.Font.SourceSansSemibold
User.Text = "user:".." ".."["..game.Players.LocalPlayer.Name.."]"
User.TextColor3 = Color3.fromRGB(255, 255, 255)
User.TextSize = 16.000
User.TextWrapped = true
User.TextXAlignment = Enum.TextXAlignment.Left

UID.Name = "UID"
UID.Parent = Frame
UID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UID.BackgroundTransparency = 1.000
UID.Position = UDim2.new(0, 0, 0.526315808, 0)
UID.Size = UDim2.new(0, 103, 0, 17)
UID.Font = Enum.Font.SourceSansSemibold
UID.Text = "uid:".." ".."["..math.random(1, 1).."]"
UID.TextColor3 = Color3.fromRGB(255, 255, 255)
UID.TextSize = 16.000
UID.TextWrapped = true
UID.TextXAlignment = Enum.TextXAlignment.Left

--ESP toggle
 local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/SexOffenderLoader/ESPLIB/main/Don", true))()
 ESP:Toggle(false)
 ESP.Tracers = false
 ESP.Names = false
 ESP.Boxes = false
 ESP.TeamColor = false
 
 --Aimbot toggle
loadstring(game:HttpGet("https://raw.githubusercontent.com/SexOffenderLoader/ArmBot/main/Api.lua"))()
getgenv().Aimbot.Settings = {
    SendNotifications = _G.SendNotifications,
    SaveSettings = _G.SaveSettings,
    ReloadOnTeleport = _G.ReloadOnTeleport,
    Enabled = _G.AimEnabled,
    TeamCheck = _G.TeamCheck,
    AliveCheck = true,
    WallCheck = _G.WallCheck,
    Sensitivity = _G.Sensitivity,
    TriggerKey = "MouseButton2",
    Toggle = false,
    LockPart = "Head"
}

getgenv().Aimbot.FOVSettings = {
    Enabled = _G.FieldEnabled,
    Visible = true,
    Amount = _G.Amount,
    Color = "255, 255, 255",
    LockedColor = "0, 0, 255",
    Transparency = 1,
    Sides = _G.Sides,
    Thickness = 1.75,
    Filled = _G.Filled
}

--Notifications
local notifications = loadstring(game:HttpGet(("https://raw.githubusercontent.com/SexOffenderLoader/AlternateAccessV2/main/Notifications.lua"),true))()
local startTime = os.clock()
 
  getgenv().runService = game:GetService"RunService"
  getgenv().textService = game:GetService"TextService"
  getgenv().inputService = game:GetService"UserInputService"
  getgenv().tweenService = game:GetService"TweenService"
  
  local runService = runService
  local textService = textService
  local inputService = inputService
  local tweenService = tweenService
  
  if getgenv().library then
	  getgenv().library:Unload()
  end
  
  -- [UI Library Settings]
  local library = {
	  tabs = {},
	  draggable = true,
	  flags = {},
	  title = "Alternate Access V2",
	  open = false,
	  mousestate = inputService.MouseIconEnabled,
	  popup = nil,
	  instances = {},
	  connections = {},
	  options = {},
	  notifications = {},
	  tabSize = 0,
	  theme = {},
	  foldername = "AAV2.winning",
	  fileext = ".ch"
  }
  
  getgenv().library = library
  
  local dragging, dragInput, dragStart, startPos, dragObject
  local blacklistedKeys = { 
	  Enum.KeyCode.Unknown,
	  Enum.KeyCode.W,
	  Enum.KeyCode.A,
	  Enum.KeyCode.S,
	  Enum.KeyCode.D,
	  Enum.KeyCode.Slash,
	  Enum.KeyCode.Tab,
	  Enum.KeyCode.Escape
  }
  local whitelistedMouseinputs = { 
	  Enum.UserInputType.MouseButton1,
	  Enum.UserInputType.MouseButton2,
	  Enum.UserInputType.MouseButton3
  }
  
  library.round = function(num, bracket)
	  bracket = bracket or 1
	  local a
	  if typeof(num) == "Vector2" then
		  a = Vector2.new(library.round(num.X), library.round(num.Y))
	  elseif typeof(num) == "Color3" then
		  return library.round(num.r * 255), library.round(num.g * 255), library.round(num.b * 255)
	  else
		  a = math.floor(num / bracket + (math.sign(num) * 0.5)) * bracket
		  if a < 0 then
			  a = a + bracket
		  end
		  return a
	  end
	  return a
  end
  
  local chromaColor
  spawn(function()
	  while library and wait() do
		  chromaColor = Color3.fromHSV(tick() % 6 / 6, 1, 1)
	  end
  end)
  
  function library:Create(class, properties)
	  properties = properties or {}
	  if not class then
		  return
	  end
	  local a = class == "Square" or class == "Line" or class == "Text" or class == "Quad" or class == "Circle" or class == "Triangle"
	  local t = a and Drawing or Instance
	  local inst = t.new(class)
	  for property, value in next, properties do
		  inst[property] = value
	  end
	  table.insert(self.instances, {
		  object = inst,
		  method = a
	  })
	  return inst
  end
  
  function library:AddConnection(connection, name, callback)
	  callback = type(name) == "function" and name or callback
	  connection = connection:connect(callback)
	  if name ~= callback then
		  self.connections[name] = connection
	  else
		  table.insert(self.connections, connection)
	  end
	  return connection
  end
  
  function library:Unload()
	  inputService.MouseIconEnabled = self.mousestate
	  for _, c in next, self.connections do
		  c:Disconnect()
	  end
	  for _, i in next, self.instances do
		  if i.method then
			  pcall(function()
				  i.object:Remove()
			  end)
		  else
			  i.object:Destroy()
		  end
	  end
	  for _, o in next, self.options do
		  if o.type == "toggle" then
			  pcall(function()
				  o:SetState()
			  end)
		  end
	  end
	  library = nil
	  getgenv().library = nil
  end
  
  function library:LoadConfig(config)
	  if table.find(self:GetConfigs(), config) then
		  local Read, Config = pcall(function()
			  return game:GetService"HttpService":JSONDecode(readfile(self.foldername .. "/" .. config .. self.fileext))
		  end)
		  Config = Read and Config or {}
		  for _, option in next, self.options do
			  if option.hasInit then
				  if option.type ~= "button" and option.flag and not option.skipflag then
					  if option.type == "toggle" then
						  spawn(function()
							  option:SetState(Config[option.flag] == 1)
						  end)
					  elseif option.type == "color" then
						  if Config[option.flag] then
							  spawn(function()
								  option:SetColor(Config[option.flag])
							  end)
							  if option.trans then
								  spawn(function()
									  option:SetTrans(Config[option.flag .. " Transparency"])
								  end)
							  end
						  end
					  elseif option.type == "bind" then
						  spawn(function()
							  option:SetKey(Config[option.flag])
						  end)
					  else
						  spawn(function()
							  option:SetValue(Config[option.flag])
						  end)
					  end
				  end
			  end
		  end
	  end
  end
  
  function library:SaveConfig(config)
	  local Config = {}
	  if table.find(self:GetConfigs(), config) then
		  Config = game:GetService"HttpService":JSONDecode(readfile(self.foldername .. "/" .. config .. self.fileext))
	  end
	  for _, option in next, self.options do
		  if option.type ~= "button" and option.flag and not option.skipflag then
			  if option.type == "toggle" then
				  Config[option.flag] = option.state and 1 or 0
			  elseif option.type == "color" then
				  Config[option.flag] = {
					  option.color.r,
					  option.color.g,
					  option.color.b
				  }
				  if option.trans then
					  Config[option.flag .. " Transparency"] = option.trans
				  end
			  elseif option.type == "bind" then
				  Config[option.flag] = option.key
			  elseif option.type == "list" then
				  Config[option.flag] = option.value
			  else
				  Config[option.flag] = option.value
			  end
		  end
	  end
	  writefile(self.foldername .. "/" .. config .. self.fileext, game:GetService"HttpService":JSONEncode(Config))
  end
  
  function library:GetConfigs()
	  if not isfolder(self.foldername) then
		  makefolder(self.foldername)
		  return {}
	  end
	  local files = {}
	  local a = 0
	  for i, v in next, listfiles(self.foldername) do
		  if v:sub(#v - #self.fileext + 1, #v) == self.fileext then
			  a = a + 1
			  v = v:gsub(self.foldername .. "\\", "")
			  v = v:gsub(self.fileext, "")
			  table.insert(files, a, v)
		  end
	  end
	  return files
  end
  
  local function createLabel(option, parent)
	  option.main = library:Create("TextLabel", {
		  LayoutOrder = option.position,
		  Position = UDim2.new(0, 6, 0, 0),
		  Size = UDim2.new(1, -12, 0, 24),
		  BackgroundTransparency = 1,
		  TextSize = 15,
		  Font = Enum.Font.Code,
		  TextColor3 = Color3.new(1, 1, 1),
		  TextXAlignment = Enum.TextXAlignment.Left,
		  TextYAlignment = Enum.TextYAlignment.Top,
		  TextWrapped = true,
		  Parent = parent
	  })
	  setmetatable(option, {
		  __newindex = function(t, i, v)
			  if i == "Text" then
				  option.main.Text = tostring(v)
				  option.main.Size = UDim2.new(1, -12, 0, textService:GetTextSize(option.main.Text, 15, Enum.Font.Code, Vector2.new(option.main.AbsoluteSize.X, 9e9)).Y + 6)
			  end
		  end
	  })
	  option.Text = option.text
  end
  
  local function createDivider(option, parent)
	  option.hasInit = true
	  option.main = library:Create("Frame", {
		  LayoutOrder = option.position,
		  Size = UDim2.new(1, 0, 0, 18),
		  BackgroundTransparency = 1,
		  Parent = parent
	  })
	  library:Create("Frame", {
		  AnchorPoint = Vector2.new(0.5, 0.5),
		  Position = UDim2.new(0.5, 0, 0.5, 0),
		  Size = UDim2.new(1, -24, 0, 1),
		  BackgroundColor3 = Color3.fromRGB(71, 69, 71),
		  BorderColor3 = Color3.new(),
		  Parent = option.main
	  })
	  option.title = library:Create("TextLabel", {
		  AnchorPoint = Vector2.new(0.5, 0.5),
		  Position = UDim2.new(0.5, 0, 0.5, 0),
		  BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		  BorderSizePixel = 0,
		  TextColor3 =  Color3.new(1, 1, 1),
		  TextSize = 15,
		  Font = Enum.Font.Code,
		  TextXAlignment = Enum.TextXAlignment.Center,
		  Parent = option.main
	  })
	  setmetatable(option, {
		  __newindex = function(t, i, v)
			  if i == "Text" then
				  if v then
					  option.title.Text = tostring(v)
					  option.title.Size = UDim2.new(0, textService:GetTextSize(option.title.Text, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X + 12, 0, 20)
					  option.main.Size = UDim2.new(1, 0, 0, 18)
				  else
					  option.title.Text = ""
					  option.title.Size = UDim2.new()
					  option.main.Size = UDim2.new(1, 0, 0, 6)
				  end
			  end
		  end
	  })
	  option.Text = option.text
  end
  
  local function createToggle(option, parent)
	  option.hasInit = true
	  option.main = library:Create("Frame", {
		  LayoutOrder = option.position,
		  Size = UDim2.new(1, 0, 0, 20),
		  BackgroundTransparency = 1,
		  Parent = parent
	  })
	  local tickbox
	  local tickboxOverlay
	  if option.style then
		  tickbox = library:Create("ImageLabel", {
			  Position = UDim2.new(0, 6, 0, 4),
			  Size = UDim2.new(0, 12, 0, 12),
			  BackgroundTransparency = 1,
			  Image = "rbxassetid://3570695787",
			  ImageColor3 = Color3.new(),
			  Parent = option.main
		  })
		  library:Create("ImageLabel", {
			  AnchorPoint = Vector2.new(0.5, 0.5),
			  Position = UDim2.new(0.5, 0, 0.5, 0),
			  Size = UDim2.new(1, -2, 1, -2),
			  BackgroundTransparency = 1,
			  Image = "rbxassetid://3570695787",
			  ImageColor3 = Color3.fromRGB(60, 60, 60),
			  Parent = tickbox
		  })
		  library:Create("ImageLabel", {
			  AnchorPoint = Vector2.new(0.5, 0.5),
			  Position = UDim2.new(0.5, 0, 0.5, 0),
			  Size = UDim2.new(1, -6, 1, -6),
			  BackgroundTransparency = 1,
			  Image = "rbxassetid://3570695787",
			  ImageColor3 = Color3.fromRGB(40, 40, 40),
			  Parent = tickbox
		  })
		  tickboxOverlay = library:Create("ImageLabel", {
			  AnchorPoint = Vector2.new(0.5, 0.5),
			  Position = UDim2.new(0.5, 0, 0.5, 0),
			  Size = UDim2.new(1, -6, 1, -6),
			  BackgroundTransparency = 1,
			  Image = "rbxassetid://3570695787",
			  ImageColor3 = library.flags["Menu Accent Color"],
			  Visible = option.state,
			  Parent = tickbox
		  })
		  library:Create("ImageLabel", {
			  AnchorPoint = Vector2.new(0.5, 0.5),
			  Position = UDim2.new(0.5, 0, 0.5, 0),
			  Size = UDim2.new(1, 0, 1, 0),
			  BackgroundTransparency = 1,
			  Image = "rbxassetid://5941353943",
			  ImageTransparency = 0.6,
			  Parent = tickbox
		  })
		  table.insert(library.theme, tickboxOverlay)
	  else
		  tickbox = library:Create("Frame", {
			  Position = UDim2.new(0, 6, 0, 4),
			  Size = UDim2.new(0, 12, 0, 12),
			  BackgroundColor3 = library.flags["Menu Accent Color"],
			  BorderColor3 = Color3.new(),
			  Parent = option.main
		  })
		  tickboxOverlay = library:Create("ImageLabel", {
			  Size = UDim2.new(1, 0, 1, 0),
			  BackgroundTransparency = option.state and 1 or 0,
			  BackgroundColor3 = Color3.fromRGB(50, 50, 50),
			  BorderColor3 = Color3.new(),
			  Image = "rbxassetid://4155801252",
			  ImageTransparency = 0.6,
			  ImageColor3 = Color3.new(),
			  Parent = tickbox
		  })
		  library:Create("ImageLabel", {
			  Size = UDim2.new(1, 0, 1, 0),
			  BackgroundTransparency = 1,
			  Image = "rbxassetid://2592362371",
			  ImageColor3 = Color3.fromRGB(60, 60, 60),
			  ScaleType = Enum.ScaleType.Slice,
			  SliceCenter = Rect.new(2, 2, 62, 62),
			  Parent = tickbox
		  })
		  library:Create("ImageLabel", {
			  Size = UDim2.new(1, -2, 1, -2),
			  Position = UDim2.new(0, 1, 0, 1),
			  BackgroundTransparency = 1,
			  Image = "rbxassetid://2592362371",
			  ImageColor3 = Color3.new(),
			  ScaleType = Enum.ScaleType.Slice,
			  SliceCenter = Rect.new(2, 2, 62, 62),
			  Parent = tickbox
		  })
		  table.insert(library.theme, tickbox)
	  end
	  option.interest = library:Create("Frame", {
		  Position = UDim2.new(0, 0, 0, 0),
		  Size = UDim2.new(1, 0, 0, 20),
		  BackgroundTransparency = 1,
		  Parent = option.main
	  })
	  option.title = library:Create("TextLabel", {
		  Position = UDim2.new(0, 24, 0, 0),
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Text = option.text,
		  TextColor3 =  option.state and Color3.fromRGB(210, 210, 210) or Color3.fromRGB(180, 180, 180),
		  TextSize = 15,
		  Font = Enum.Font.Code,
		  TextXAlignment = Enum.TextXAlignment.Left,
		  Parent = option.interest
	  })
	  option.interest.InputBegan:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  option:SetState(not option.state)
		  end
		  if input.UserInputType.Name == "MouseMovement" then
			  if not library.warning and not library.slider then
				  if option.style then
					  tickbox.ImageColor3 = library.flags["Menu Accent Color"]
				  else
					  tickbox.BorderColor3 = library.flags["Menu Accent Color"]
					  tickboxOverlay.BorderColor3 = library.flags["Menu Accent Color"]
				  end
			  end
			  if option.tip then
				  library.tooltip.Text = option.tip
				  library.tooltip.Size = UDim2.new(0, textService:GetTextSize(option.tip, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X, 0, 20)
			  end
		  end
	  end)
	  option.interest.InputChanged:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if option.tip then
				  library.tooltip.Position = UDim2.new(0, input.Position.X + 26, 0, input.Position.Y + 36)
			  end
		  end
	  end)
	  option.interest.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if option.style then
				  tickbox.ImageColor3 = Color3.new()
			  else
				  tickbox.BorderColor3 = Color3.new()
				  tickboxOverlay.BorderColor3 = Color3.new()
			  end
			  library.tooltip.Position = UDim2.new(2)
		  end
	  end)
  
	  function option:SetState(state, nocallback)
		  state = typeof(state) == "boolean" and state
		  state = state or false
		  library.flags[self.flag] = state
		  self.state = state
		  option.title.TextColor3 = state and Color3.fromRGB(210, 210, 210) or Color3.fromRGB(160, 160, 160)
		  if option.style then
			  tickboxOverlay.Visible = state
		  else
			  tickboxOverlay.BackgroundTransparency = state and 1 or 0
		  end
		  if not nocallback then
			  self.callback(state)
		  end
	  end
	  if option.state then
		  delay(1, function()
			  if library then
				  option.callback(true)
			  end
		  end)
	  end
	  setmetatable(option, {
		  __newindex = function(t, i, v)
			  if i == "Text" then
				  option.title.Text = tostring(v)
			  end
		  end
	  })
  end
  
  local function createButton(option, parent)
	  option.hasInit = true
	  option.main = library:Create("Frame", {
		  LayoutOrder = option.position,
		  Size = UDim2.new(1, 0, 0, 26),
		  BackgroundTransparency = 1,
		  Parent = parent
	  })
	  option.title = library:Create("TextLabel", {
		  AnchorPoint = Vector2.new(0.5, 1),
		  Position = UDim2.new(0.5, 0, 1, -5),
		  Size = UDim2.new(1, -12, 0, 18),
		  BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		  BorderColor3 = Color3.new(),
		  Text = option.text,
		  TextColor3 = Color3.new(1, 1, 1),
		  TextSize = 15,
		  Font = Enum.Font.Code,
		  Parent = option.main
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.fromRGB(60, 60, 60),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.title
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, -2, 1, -2),
		  Position = UDim2.new(0, 1, 0, 1),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.title
	  })
	  library:Create("UIGradient", {
		  Color = ColorSequence.new({
			  ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 180, 180)),
			  ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 253, 253)),
		  }),
		  Rotation = -90,
		  Parent = option.title
	  })
	  option.title.InputBegan:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  option.callback()
			  if library then
				  library.flags[option.flag] = true
			  end
			  if option.tip then
				  library.tooltip.Text = option.tip
				  library.tooltip.Size = UDim2.new(0, textService:GetTextSize(option.tip, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X, 0, 20)
			  end
		  end
		  if input.UserInputType.Name == "MouseMovement" then
			  if not library.warning and not library.slider then
				  option.title.BorderColor3 = library.flags["Menu Accent Color"]
			  end
		  end
	  end)
	  option.title.InputChanged:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if option.tip then
				  library.tooltip.Position = UDim2.new(0, input.Position.X + 26, 0, input.Position.Y + 36)
			  end
		  end
	  end)
	  option.title.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  option.title.BorderColor3 = Color3.new()
			  library.tooltip.Position = UDim2.new(2)
		  end
	  end)
  end
  
  local function createBind(option, parent)
	  option.hasInit = true
	  local binding
	  local holding
	  local Loop
	  if option.sub then
		  option.main = option:getMain()
	  else
		  option.main = option.main or library:Create("Frame", {
			  LayoutOrder = option.position,
			  Size = UDim2.new(1, 0, 0, 20),
			  BackgroundTransparency = 1,
			  Parent = parent
		  })
		  library:Create("TextLabel", {
			  Position = UDim2.new(0, 6, 0, 0),
			  Size = UDim2.new(1, -12, 1, 0),
			  BackgroundTransparency = 1,
			  Text = option.text,
			  TextSize = 15,
			  Font = Enum.Font.Code,
			  TextColor3 = Color3.fromRGB(210, 210, 210),
			  TextXAlignment = Enum.TextXAlignment.Left,
			  Parent = option.main
		  })
	  end
  
	  local bindinput = library:Create(option.sub and "TextButton" or "TextLabel", {
		  Position = UDim2.new(1, -6 - (option.subpos or 0), 0, option.sub and 2 or 3),
		  SizeConstraint = Enum.SizeConstraint.RelativeYY,
		  BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		  BorderSizePixel = 0,
		  TextSize = 15,
		  Font = Enum.Font.Code,
		  TextColor3 = Color3.fromRGB(160, 160, 160),
		  TextXAlignment = Enum.TextXAlignment.Right,
		  Parent = option.main
	  })
  
	  if option.sub then
		  bindinput.AutoButtonColor = false
	  end
  
	  local interest = option.sub and bindinput or option.main
	  local inContact
	  interest.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  binding = true
			  bindinput.Text = "[...]"
			  bindinput.Size = UDim2.new(0, -textService:GetTextSize(bindinput.Text, 16, Enum.Font.Code, Vector2.new(9e9, 9e9)).X, 0, 16)
			  bindinput.TextColor3 = library.flags["Menu Accent Color"]
		  end
	  end)
  
	  library:AddConnection(inputService.InputBegan, function(input)
		  if inputService:GetFocusedTextBox() then
			  return
		  end
		  if binding then
			  local key = (table.find(whitelistedMouseinputs, input.UserInputType) and not option.nomouse) and input.UserInputType
			  option:SetKey(key or (not table.find(blacklistedKeys, input.KeyCode)) and input.KeyCode)
		  else
			  if (input.KeyCode.Name == option.key or input.UserInputType.Name == option.key) and not binding then
				  if option.mode == "toggle" then
					  library.flags[option.flag] = not library.flags[option.flag]
					  option.callback(library.flags[option.flag], 0)
				  else
					  library.flags[option.flag] = true
					  if Loop then
						  Loop:Disconnect()
						  option.callback(true, 0)
					  end
					  Loop = library:AddConnection(runService.RenderStepped, function(step)
						  if not inputService:GetFocusedTextBox() then
							  option.callback(nil, step)
						  end
					  end)
				  end
			  end
		  end
	  end)
	  library:AddConnection(inputService.InputEnded, function(input)
		  if option.key ~= "none" then
			  if input.KeyCode.Name == option.key or input.UserInputType.Name == option.key then
				  if Loop then
					  Loop:Disconnect()
					  library.flags[option.flag] = false
					  option.callback(true, 0)
				  end
			  end
		  end
	  end)
  
	  function option:SetKey(key)
		  binding = false
		  bindinput.TextColor3 = Color3.fromRGB(160, 160, 160)
		  if Loop then
			  Loop:Disconnect()
			  library.flags[option.flag] = false
			  option.callback(true, 0)
		  end
		  self.key = (key and key.Name) or key or self.key
		  if self.key == "Backspace" then
			  self.key = "none"
			  bindinput.Text = "[NONE]"
		  else
			  local a = self.key
			  if self.key:match"Mouse" then
				  a = self.key:gsub("Button", ""):gsub("Mouse", "M")
			  elseif self.key:match"Shift" or self.key:match"Alt" or self.key:match"Control" then
				  a = self.key:gsub("Left", "L"):gsub("Right", "R")
			  end
			  bindinput.Text = "[" .. a:gsub("Control", "CTRL"):upper() .. "]"
		  end
		  bindinput.Size = UDim2.new(0, -textService:GetTextSize(bindinput.Text, 16, Enum.Font.Code, Vector2.new(9e9, 9e9)).X, 0, 16)
	  end
	  option:SetKey()
  end
  
  local function createSlider(option, parent)
	  option.hasInit = true
	  if option.sub then
		  option.main = option:getMain()
		  option.main.Size = UDim2.new(1, 0, 0, 42)
	  else
		  option.main = library:Create("Frame", {
			  LayoutOrder = option.position,
			  Size = UDim2.new(1, 0, 0, option.textpos and 24 or 40),
			  BackgroundTransparency = 1,
			  Parent = parent
		  })
	  end
	  option.slider = library:Create("Frame", {
		  Position = UDim2.new(0, 6, 0, (option.sub and 22 or option.textpos and 4 or 20)),
		  Size = UDim2.new(1, -12, 0, 16),
		  BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		  BorderColor3 = Color3.new(),
		  Parent = option.main
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2454009026",
		  ImageColor3 = Color3.new(),
		  ImageTransparency = 0.8,
		  Parent = option.slider
	  })
	  option.fill = library:Create("Frame", {
		  BackgroundColor3 = library.flags["Menu Accent Color"],
		  BorderSizePixel = 0,
		  Parent = option.slider
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.fromRGB(60, 60, 60),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.slider
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, -2, 1, -2),
		  Position = UDim2.new(0, 1, 0, 1),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.slider
	  })
	  option.title = library:Create("TextBox", {
		  Position = UDim2.new((option.sub or option.textpos) and 0.5 or 0, (option.sub or option.textpos) and 0 or 6, 0, 0),
		  Size = UDim2.new(0, 0, 0, (option.sub or option.textpos) and 14 or 18),
		  BackgroundTransparency = 1,
		  Text = (option.text == "nil" and "" or option.text .. ": ") .. option.value .. option.suffix,
		  TextSize = (option.sub or option.textpos) and 14 or 15,
		  Font = Enum.Font.Code,
		  TextColor3 = Color3.fromRGB(210, 210, 210),
		  TextXAlignment = Enum.TextXAlignment[(option.sub or option.textpos) and "Center" or "Left"],
		  Parent = (option.sub or option.textpos) and option.slider or option.main
	  })
	  table.insert(library.theme, option.fill)
	  library:Create("UIGradient", {
		  Color = ColorSequence.new({
			  ColorSequenceKeypoint.new(0, Color3.fromRGB(115, 115, 115)),
			  ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
		  }),
		  Rotation = -90,
		  Parent = option.fill
	  })
	  if option.min >= 0 then
		  option.fill.Size = UDim2.new((option.value - option.min) / (option.max - option.min), 0, 1, 0)
	  else
		  option.fill.Position = UDim2.new((0 - option.min) / (option.max - option.min), 0, 0, 0)
		  option.fill.Size = UDim2.new(option.value / (option.max - option.min), 0, 1, 0)
	  end
	  local manualInput
	  option.title.Focused:connect(function()
		  if not manualInput then
			  option.title:ReleaseFocus()
			  option.title.Text = (option.text == "nil" and "" or option.text .. ": ") .. option.value .. option.suffix
		  end
	  end)
	  option.title.FocusLost:connect(function()
		  option.slider.BorderColor3 = Color3.new()
		  if manualInput then
			  if tonumber(option.title.Text) then
				  option:SetValue(tonumber(option.title.Text))
			  else
				  option.title.Text = (option.text == "nil" and "" or option.text .. ": ") .. option.value .. option.suffix
			  end
		  end
		  manualInput = false
	  end)
	  local interest = (option.sub or option.textpos) and option.slider or option.main
	  interest.InputBegan:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  if inputService:IsKeyDown(Enum.KeyCode.LeftControl) or inputService:IsKeyDown(Enum.KeyCode.RightControl) then
				  manualInput = true
				  option.title:CaptureFocus()
			  else
				  library.slider = option
				  option.slider.BorderColor3 = library.flags["Menu Accent Color"]
				  option:SetValue(option.min + ((input.Position.X - option.slider.AbsolutePosition.X) / option.slider.AbsoluteSize.X) * (option.max - option.min))
			  end
		  end
		  if input.UserInputType.Name == "MouseMovement" then
			  if not library.warning and not library.slider then
				  option.slider.BorderColor3 = library.flags["Menu Accent Color"]
			  end
			  if option.tip then
				  library.tooltip.Text = option.tip
				  library.tooltip.Size = UDim2.new(0, textService:GetTextSize(option.tip, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X, 0, 20)
			  end
		  end
	  end)
	  interest.InputChanged:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if option.tip then
				  library.tooltip.Position = UDim2.new(0, input.Position.X + 26, 0, input.Position.Y + 36)
			  end
		  end
	  end)
	  interest.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  library.tooltip.Position = UDim2.new(2)
			  if option ~= library.slider then
				  option.slider.BorderColor3 = Color3.new()
			  end
		  end
	  end)
  
	  function option:SetValue(value, nocallback)
		  if typeof(value) ~= "number" then
			  value = 0
		  end
		  value = library.round(value, option.float)
		  value = math.clamp(value, self.min, self.max)
		  if self.min >= 0 then
			  option.fill:TweenSize(UDim2.new((value - self.min) / (self.max - self.min), 0, 1, 0), "Out", "Quad", 0.05, true)
		  else
			  option.fill:TweenPosition(UDim2.new((0 - self.min) / (self.max - self.min), 0, 0, 0), "Out", "Quad", 0.05, true)
			  option.fill:TweenSize(UDim2.new(value / (self.max - self.min), 0, 1, 0), "Out", "Quad", 0.1, true)
		  end
		  library.flags[self.flag] = value
		  self.value = value
		  option.title.Text = (option.text == "nil" and "" or option.text .. ": ") .. option.value .. option.suffix
		  if not nocallback then
			  self.callback(value)
		  end
	  end
	  delay(1, function()
		  if library then
			  option:SetValue(option.value)
		  end
	  end)
  end
  
  local function createList(option, parent)
	  option.hasInit = true
	  if option.sub then
		  option.main = option:getMain()
		  option.main.Size = UDim2.new(1, 0, 0, 48)
	  else
		  option.main = library:Create("Frame", {
			  LayoutOrder = option.position,
			  Size = UDim2.new(1, 0, 0, option.text == "nil" and 30 or 48),
			  BackgroundTransparency = 1,
			  Parent = parent
		  })
		  if option.text ~= "nil" then
			  library:Create("TextLabel", {
				  Position = UDim2.new(0, 6, 0, 0),
				  Size = UDim2.new(1, -12, 0, 18),
				  BackgroundTransparency = 1,
				  Text = option.text,
				  TextSize = 15,
				  Font = Enum.Font.Code,
				  TextColor3 = Color3.fromRGB(210, 210, 210),
				  TextXAlignment = Enum.TextXAlignment.Left,
				  Parent = option.main
			  })
		  end
	  end
  
	  local function getMultiText()
		  local s = ""
		  for _, value in next, option.values do
			  s = s .. (option.value[value] and (tostring(value) .. ", ") or "")
		  end
		  return string.sub(s, 1, #s - 2)
	  end
	  option.listvalue = library:Create("TextLabel", {
		  Position = UDim2.new(0, 6, 0, (option.text == "nil" and not option.sub) and 4 or 22),
		  Size = UDim2.new(1, -12, 0, 22),
		  BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		  BorderColor3 = Color3.new(),
		  Text = " " .. (typeof(option.value) == "string" and option.value or getMultiText()),
		  TextSize = 15,
		  Font = Enum.Font.Code,
		  TextColor3 = Color3.new(1, 1, 1),
		  TextXAlignment = Enum.TextXAlignment.Left,
		  TextTruncate = Enum.TextTruncate.AtEnd,
		  Parent = option.main
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2454009026",
		  ImageColor3 = Color3.new(),
		  ImageTransparency = 0.8,
		  Parent = option.listvalue
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.fromRGB(60, 60, 60),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.listvalue
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, -2, 1, -2),
		  Position = UDim2.new(0, 1, 0, 1),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.listvalue
	  })
	  option.arrow = library:Create("ImageLabel", {
		  Position = UDim2.new(1, -16, 0, 7),
		  Size = UDim2.new(0, 8, 0, 8),
		  Rotation = 90,
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://4918373417",
		  ImageColor3 = Color3.new(1, 1, 1),
		  ScaleType = Enum.ScaleType.Fit,
		  ImageTransparency = 0.4,
		  Parent = option.listvalue
	  })
	  option.holder = library:Create("TextButton", {
		  ZIndex = 4,
		  BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		  BorderColor3 = Color3.new(),
		  Text = "",
		  AutoButtonColor = false,
		  Visible = false,
		  Parent = library.base
	  })
	  option.content = library:Create("ScrollingFrame", {
		  ZIndex = 4,
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  BorderSizePixel = 0,
		  ScrollBarImageColor3 = Color3.new(),
		  ScrollBarThickness = 3,
		  ScrollingDirection = Enum.ScrollingDirection.Y,
		  VerticalScrollBarInset = Enum.ScrollBarInset.Always,
		  TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		  BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		  Parent = option.holder
	  })
	  library:Create("ImageLabel", {
		  ZIndex = 4,
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.fromRGB(60, 60, 60),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.holder
	  })
	  library:Create("ImageLabel", {
		  ZIndex = 4,
		  Size = UDim2.new(1, -2, 1, -2),
		  Position = UDim2.new(0, 1, 0, 1),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.holder
	  })
	  local layout = library:Create("UIListLayout", {
		  Padding = UDim.new(0, 2),
		  Parent = option.content
	  })
	  library:Create("UIPadding", {
		  PaddingTop = UDim.new(0, 4),
		  PaddingLeft = UDim.new(0, 4),
		  Parent = option.content
	  })
	  local valueCount = 0
	  layout.Changed:connect(function()
		  option.holder.Size = UDim2.new(0, option.listvalue.AbsoluteSize.X, 0, 8 + (valueCount > option.max and (-2 + (option.max * 22)) or layout.AbsoluteContentSize.Y))
		  option.content.CanvasSize = UDim2.new(0, 0, 0, 8 + layout.AbsoluteContentSize.Y)
	  end)
	  local interest = option.sub and option.listvalue or option.main
	  option.listvalue.InputBegan:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  if library.popup == option then
				  library.popup:Close()
				  return
			  end
			  if library.popup then
				  library.popup:Close()
			  end
			  option.arrow.Rotation = -90
			  option.open = true
			  option.holder.Visible = true
			  local pos = option.main.AbsolutePosition
			  option.holder.Position = UDim2.new(0, pos.X + 6, 0, pos.Y + ((option.text == "nil" and not option.sub) and 66 or 84))
			  library.popup = option
			  option.listvalue.BorderColor3 = library.flags["Menu Accent Color"]
		  end
		  if input.UserInputType.Name == "MouseMovement" then
			  if not library.warning and not library.slider then
				  option.listvalue.BorderColor3 = library.flags["Menu Accent Color"]
			  end
		  end
	  end)
	  option.listvalue.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if not option.open then
				  option.listvalue.BorderColor3 = Color3.new()
			  end
		  end
	  end)
	  interest.InputBegan:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if option.tip then
				  library.tooltip.Text = option.tip
				  library.tooltip.Size = UDim2.new(0, textService:GetTextSize(option.tip, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X, 0, 20)
			  end
		  end
	  end)
	  interest.InputChanged:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if option.tip then
				  library.tooltip.Position = UDim2.new(0, input.Position.X + 26, 0, input.Position.Y + 36)
			  end
		  end
	  end)
	  interest.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  library.tooltip.Position = UDim2.new(2)
		  end
	  end)
  
	  local selected
	  function option:AddValue(value, state)
		  if self.labels[value] then
			  return
		  end
		  valueCount = valueCount + 1
		  if self.multiselect then
			  self.values[value] = state
		  else
			  if not table.find(self.values, value) then
				  table.insert(self.values, value)
			  end
		  end
		  local label = library:Create("TextLabel", {
			  ZIndex = 4,
			  Size = UDim2.new(1, 0, 0, 20),
			  BackgroundTransparency = 1,
			  Text = value,
			  TextSize = 15,
			  Font = Enum.Font.Code,
			  TextTransparency = self.multiselect and (self.value[value] and 1 or 0) or self.value == value and 1 or 0,
			  TextColor3 = Color3.fromRGB(210, 210, 210),
			  TextXAlignment = Enum.TextXAlignment.Left,
			  Parent = option.content
		  })
		  self.labels[value] = label
		  local labelOverlay = library:Create("TextLabel", {
			  ZIndex = 4,
			  Size = UDim2.new(1, 0, 1, 0),
			  BackgroundTransparency = 0.8,
			  Text = " " .. value,
			  TextSize = 15,
			  Font = Enum.Font.Code,
			  TextColor3 = library.flags["Menu Accent Color"],
			  TextXAlignment = Enum.TextXAlignment.Left,
			  Visible = self.multiselect and self.value[value] or self.value == value,
			  Parent = label
		  })
		  selected = selected or self.value == value and labelOverlay
		  table.insert(library.theme, labelOverlay)
		  label.InputBegan:connect(function(input)
			  if input.UserInputType.Name == "MouseButton1" then
				  if self.multiselect then
					  self.value[value] = not self.value[value]
					  self:SetValue(self.value)
				  else
					  self:SetValue(value)
					  self:Close()
				  end
			  end
		  end)
	  end
	  for i, value in next, option.values do
		  option:AddValue(tostring(typeof(i) == "number" and value or i))
	  end
  
	  function option:RemoveValue(value)
		  local label = self.labels[value]
		  if label then
			  label:Destroy()
			  self.labels[value] = nil
			  valueCount = valueCount - 1
			  if self.multiselect then
				  self.values[value] = nil
				  self:SetValue(self.value)
			  else
				  table.remove(self.values, table.find(self.values, value))
				  if self.value == value then
					  selected = nil
					  self:SetValue(self.values[1] or "")
				  end
			  end
		  end
	  end
  
	  function option:SetValue(value, nocallback)
		  if self.multiselect and typeof(value) ~= "table" then
			  value = {}
			  for i, v in next, self.values do
				  value[v] = false
			  end
		  end
		  self.value = typeof(value) == "table" and value or tostring(table.find(self.values, value) and value or self.values[1])
		  library.flags[self.flag] = self.value
		  option.listvalue.Text = " " .. (self.multiselect and getMultiText() or self.value)
		  if self.multiselect then
			  for name, label in next, self.labels do
				  label.TextTransparency = self.value[name] and 1 or 0
				  if label:FindFirstChild"TextLabel" then
					  label.TextLabel.Visible = self.value[name]
				  end
			  end
		  else
			  if selected then
				  selected.TextTransparency = 0
				  if selected:FindFirstChild"TextLabel" then
					  selected.TextLabel.Visible = false
				  end
			  end
			  if self.labels[self.value] then
				  selected = self.labels[self.value]
				  selected.TextTransparency = 1
				  if selected:FindFirstChild"TextLabel" then
					  selected.TextLabel.Visible = true
				  end
			  end
		  end
		  if not nocallback then
			  self.callback(self.value)
		  end
	  end
	  delay(1, function()
		  if library then
			  option:SetValue(option.value)
		  end
	  end)
  
	  function option:Close()
		  library.popup = nil
		  option.arrow.Rotation = 90
		  self.open = false
		  option.holder.Visible = false
		  option.listvalue.BorderColor3 = Color3.new()
	  end
	  return option
  end
  
  local function createBox(option, parent)
	  option.hasInit = true
	  option.main = library:Create("Frame", {
		  LayoutOrder = option.position,
		  Size = UDim2.new(1, 0, 0, option.text == "nil" and 28 or 44),
		  BackgroundTransparency = 1,
		  Parent = parent
	  })
	  if option.text ~= "nil" then
		  option.title = library:Create("TextLabel", {
			  Position = UDim2.new(0, 6, 0, 0),
			  Size = UDim2.new(1, -12, 0, 18),
			  BackgroundTransparency = 1,
			  Text = option.text,
			  TextSize = 15,
			  Font = Enum.Font.Code,
			  TextColor3 = Color3.fromRGB(210, 210, 210),
			  TextXAlignment = Enum.TextXAlignment.Left,
			  Parent = option.main
		  })
	  end
	  option.holder = library:Create("Frame", {
		  Position = UDim2.new(0, 6, 0, option.text == "nil" and 4 or 20),
		  Size = UDim2.new(1, -12, 0, 20),
		  BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		  BorderColor3 = Color3.new(),
		  Parent = option.main
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2454009026",
		  ImageColor3 = Color3.new(),
		  ImageTransparency = 0.8,
		  Parent = option.holder
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.fromRGB(60, 60, 60),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.holder
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, -2, 1, -2),
		  Position = UDim2.new(0, 1, 0, 1),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.holder
	  })
	  local inputvalue = library:Create("TextBox", {
		  Position = UDim2.new(0, 4, 0, 0),
		  Size = UDim2.new(1, -4, 1, 0),
		  BackgroundTransparency = 1,
		  Text = "  " .. option.value,
		  TextSize = 15,
		  Font = Enum.Font.Code,
		  TextColor3 = Color3.new(1, 1, 1),
		  TextXAlignment = Enum.TextXAlignment.Left,
		  TextWrapped = true,
		  ClearTextOnFocus = false,
		  Parent = option.holder
	  })
	  inputvalue.FocusLost:connect(function(enter)
		  option.holder.BorderColor3 = Color3.new()
		  option:SetValue(inputvalue.Text, enter)
	  end)
	  inputvalue.Focused:connect(function()
		  option.holder.BorderColor3 = library.flags["Menu Accent Color"]
	  end)
	  inputvalue.InputBegan:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  inputvalue.Text = ""
		  end
		  if input.UserInputType.Name == "MouseMovement" then
			  if not library.warning and not library.slider then
				  option.holder.BorderColor3 = library.flags["Menu Accent Color"]
			  end
			  if option.tip then
				  library.tooltip.Text = option.tip
				  library.tooltip.Size = UDim2.new(0, textService:GetTextSize(option.tip, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X, 0, 20)
			  end
		  end
	  end)
	  inputvalue.InputChanged:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if option.tip then
				  library.tooltip.Position = UDim2.new(0, input.Position.X + 26, 0, input.Position.Y + 36)
			  end
		  end
	  end)
	  inputvalue.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if not inputvalue:IsFocused() then
				  option.holder.BorderColor3 = Color3.new()
			  end
			  library.tooltip.Position = UDim2.new(2)
		  end
	  end)
  
	  function option:SetValue(value, enter)
		  if tostring(value) == "" then
			  inputvalue.Text = self.value
		  else
			  library.flags[self.flag] = tostring(value)
			  self.value = tostring(value)
			  inputvalue.Text = self.value
			  self.callback(value, enter)
		  end
	  end
	  delay(1, function()
		  if library then
			  option:SetValue(option.value)
		  end
	  end)
  end
  
  local function createColorPickerWindow(option)
	  option.mainHolder = library:Create("TextButton", {
		  ZIndex = 4,
		  Size = UDim2.new(0, option.trans and 200 or 184, 0, 200),
		  BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		  BorderColor3 = Color3.new(),
		  AutoButtonColor = false,
		  Visible = false,
		  Parent = library.base
	  })
	  library:Create("ImageLabel", {
		  ZIndex = 4,
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.fromRGB(60, 60, 60),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.mainHolder
	  })
	  library:Create("ImageLabel", {
		  ZIndex = 4,
		  Size = UDim2.new(1, -2, 1, -2),
		  Position = UDim2.new(0, 1, 0, 1),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.mainHolder
	  })
	  local hue, sat, val = Color3.toHSV(option.color)
	  hue, sat, val = hue == 0 and 1 or hue, sat + 0.005, val - 0.005
	  local editinghue
	  local editingsatval
	  local editingtrans
	  local transMain
	  if option.trans then
		  transMain = library:Create("ImageLabel", {
			  ZIndex = 5,
			  Size = UDim2.new(1, 0, 1, 0),
			  BackgroundTransparency = 1,
			  Image = "rbxassetid://2454009026",
			  ImageColor3 = Color3.fromHSV(hue, 1, 1),
			  Rotation = 180,
			  Parent = library:Create("ImageLabel", {
				  ZIndex = 4,
				  AnchorPoint = Vector2.new(1, 0),
				  Position = UDim2.new(1, -6, 0, 6),
				  Size = UDim2.new(0, 10, 1, -12),
				  BorderColor3 = Color3.new(),
				  Image = "rbxassetid://4632082392",
				  ScaleType = Enum.ScaleType.Tile,
				  TileSize = UDim2.new(0, 5, 0, 5),
				  Parent = option.mainHolder
			  })
		  })
		  option.transSlider = library:Create("Frame", {
			  ZIndex = 5,
			  Position = UDim2.new(0, 0, option.trans, 0),
			  Size = UDim2.new(1, 0, 0, 2),
			  BackgroundColor3 = Color3.fromRGB(38, 41, 65),
			  BorderColor3 = Color3.fromRGB(255, 255, 255),
			  Parent = transMain
		  })
		  transMain.InputBegan:connect(function(Input)
			  if Input.UserInputType.Name == "MouseButton1" then
				  editingtrans = true
				  option:SetTrans(1 - ((Input.Position.Y - transMain.AbsolutePosition.Y) / transMain.AbsoluteSize.Y))
			  end
		  end)
		  transMain.InputEnded:connect(function(Input)
			  if Input.UserInputType.Name == "MouseButton1" then
				  editingtrans = false
			  end
		  end)
	  end
  
	  local hueMain = library:Create("Frame", {
		  ZIndex = 4,
		  AnchorPoint = Vector2.new(0, 1),
		  Position = UDim2.new(0, 6, 1, -6),
		  Size = UDim2.new(1, option.trans and -28 or -12, 0, 10),
		  BackgroundColor3 = Color3.new(1, 1, 1),
		  BorderColor3 = Color3.new(),
		  Parent = option.mainHolder
	  })
  
	  local Gradient = library:Create("UIGradient", {
		  Color = ColorSequence.new({
			  ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			  ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
			  ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
			  ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
			  ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
			  ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
			  ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
		  }),
		  Parent = hueMain
	  })
  
	  local hueSlider = library:Create("Frame", {
		  ZIndex = 4,
		  Position = UDim2.new(1 - hue, 0, 0, 0),
		  Size = UDim2.new(0, 2, 1, 0),
		  BackgroundColor3 = Color3.fromRGB(38, 41, 65),
		  BorderColor3 = Color3.fromRGB(255, 255, 255),
		  Parent = hueMain
	  })
	  hueMain.InputBegan:connect(function(Input)
		  if Input.UserInputType.Name == "MouseButton1" then
			  editinghue = true
			  X = (hueMain.AbsolutePosition.X + hueMain.AbsoluteSize.X) - hueMain.AbsolutePosition.X
			  X = math.clamp((Input.Position.X - hueMain.AbsolutePosition.X) / X, 0, 0.995)
			  option:SetColor(Color3.fromHSV(1 - X, sat, val))
		  end
	  end)
	  hueMain.InputEnded:connect(function(Input)
		  if Input.UserInputType.Name == "MouseButton1" then
			  editinghue = false
		  end
	  end)
  
	  local satval = library:Create("ImageLabel", {
		  ZIndex = 4,
		  Position = UDim2.new(0, 6, 0, 6),
		  Size = UDim2.new(1, option.trans and -28 or -12, 1, -28),
		  BackgroundColor3 = Color3.fromHSV(hue, 1, 1),
		  BorderColor3 = Color3.new(),
		  Image = "rbxassetid://4155801252",
		  ClipsDescendants = true,
		  Parent = option.mainHolder
	  })
  
	  local satvalSlider = library:Create("Frame", {
		  ZIndex = 4,
		  AnchorPoint = Vector2.new(0.5, 0.5),
		  Position = UDim2.new(sat, 0, 1 - val, 0),
		  Size = UDim2.new(0, 4, 0, 4),
		  Rotation = 45,
		  BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		  Parent = satval
	  })
	  satval.InputBegan:connect(function(Input)
		  if Input.UserInputType.Name == "MouseButton1" then
			  editingsatval = true
			  X = (satval.AbsolutePosition.X + satval.AbsoluteSize.X) - satval.AbsolutePosition.X
			  Y = (satval.AbsolutePosition.Y + satval.AbsoluteSize.Y) - satval.AbsolutePosition.Y
			  X = math.clamp((Input.Position.X - satval.AbsolutePosition.X) / X, 0.005, 1)
			  Y = math.clamp((Input.Position.Y - satval.AbsolutePosition.Y) / Y, 0, 0.995)
			  option:SetColor(Color3.fromHSV(hue, X, 1 - Y))
		  end
	  end)
	  library:AddConnection(inputService.InputChanged, function(Input)
		  if Input.UserInputType.Name == "MouseMovement" then
			  if editingsatval then
				  X = (satval.AbsolutePosition.X + satval.AbsoluteSize.X) - satval.AbsolutePosition.X
				  Y = (satval.AbsolutePosition.Y + satval.AbsoluteSize.Y) - satval.AbsolutePosition.Y
				  X = math.clamp((Input.Position.X - satval.AbsolutePosition.X) / X, 0.005, 1)
				  Y = math.clamp((Input.Position.Y - satval.AbsolutePosition.Y) / Y, 0, 0.995)
				  option:SetColor(Color3.fromHSV(hue, X, 1 - Y))
			  elseif editinghue then
				  X = (hueMain.AbsolutePosition.X + hueMain.AbsoluteSize.X) - hueMain.AbsolutePosition.X
				  X = math.clamp((Input.Position.X - hueMain.AbsolutePosition.X) / X, 0, 0.995)
				  option:SetColor(Color3.fromHSV(1 - X, sat, val))
			  elseif editingtrans then
				  option:SetTrans(1 - ((Input.Position.Y - transMain.AbsolutePosition.Y) / transMain.AbsoluteSize.Y))
			  end
		  end
	  end)
	  satval.InputEnded:connect(function(Input)
		  if Input.UserInputType.Name == "MouseButton1" then
			  editingsatval = false
		  end
	  end)
	  function option:updateVisuals(Color)
		  hue, sat, val = Color3.toHSV(Color)
		  hue = hue == 0 and 1 or hue
		  satval.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
		  if option.trans then
			  transMain.ImageColor3 = Color3.fromHSV(hue, 1, 1)
		  end
		  hueSlider.Position = UDim2.new(1 - hue, 0, 0, 0)
		  satvalSlider.Position = UDim2.new(sat, 0, 1 - val, 0)
	  end
	  return option
  end
  
  local function createColor(option, parent)
	  option.hasInit = true
	  if option.sub then
		  option.main = option:getMain()
	  else
		  option.main = library:Create("Frame", {
			  LayoutOrder = option.position,
			  Size = UDim2.new(1, 0, 0, 20),
			  BackgroundTransparency = 1,
			  Parent = parent
		  })
		  option.title = library:Create("TextLabel", {
			  Position = UDim2.new(0, 6, 0, 0),
			  Size = UDim2.new(1, -12, 1, 0),
			  BackgroundTransparency = 1,
			  Text = option.text,
			  TextSize = 15,
			  Font = Enum.Font.Code,
			  TextColor3 = Color3.fromRGB(210, 210, 210),
			  TextXAlignment = Enum.TextXAlignment.Left,
			  Parent = option.main
		  })
	  end
	  option.visualize = library:Create(option.sub and "TextButton" or "Frame", {
		  Position = UDim2.new(1, -(option.subpos or 0) - 24, 0, 4),
		  Size = UDim2.new(0, 18, 0, 12),
		  SizeConstraint = Enum.SizeConstraint.RelativeYY,
		  BackgroundColor3 = option.color,
		  BorderColor3 = Color3.new(),
		  Parent = option.main
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2454009026",
		  ImageColor3 = Color3.new(),
		  ImageTransparency = 0.6,
		  Parent = option.visualize
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.fromRGB(60, 60, 60),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.visualize
	  })
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, -2, 1, -2),
		  Position = UDim2.new(0, 1, 0, 1),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = option.visualize
	  })
	  local interest = option.sub and option.visualize or option.main
	  if option.sub then
		  option.visualize.Text = ""
		  option.visualize.AutoButtonColor = false
	  end
	  interest.InputBegan:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  if not option.mainHolder then
				  createColorPickerWindow(option)
			  end
			  if library.popup == option then
				  library.popup:Close()
				  return
			  end
			  if library.popup then
				  library.popup:Close()
			  end
			  option.open = true
			  local pos = option.main.AbsolutePosition
			  option.mainHolder.Position = UDim2.new(0, pos.X + 36 + (option.trans and -16 or 0), 0, pos.Y + 56)
			  option.mainHolder.Visible = true
			  library.popup = option
			  option.visualize.BorderColor3 = library.flags["Menu Accent Color"]
		  end
		  if input.UserInputType.Name == "MouseMovement" then
			  if not library.warning and not library.slider then
				  option.visualize.BorderColor3 = library.flags["Menu Accent Color"]
			  end
			  if option.tip then
				  library.tooltip.Text = option.tip
				  library.tooltip.Size = UDim2.new(0, textService:GetTextSize(option.tip, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X, 0, 20)
			  end
		  end
	  end)
	  interest.InputChanged:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if option.tip then
				  library.tooltip.Position = UDim2.new(0, input.Position.X + 26, 0, input.Position.Y + 36)
			  end
		  end
	  end)
	  interest.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseMovement" then
			  if not option.open then
				  option.visualize.BorderColor3 = Color3.new()
			  end
			  library.tooltip.Position = UDim2.new(2)
		  end
	  end)
	  function option:SetColor(newColor, nocallback)
		  if typeof(newColor) == "table" then
			  newColor = Color3.new(newColor[1], newColor[2], newColor[3])
		  end
		  newColor = newColor or Color3.new(1, 1, 1)
		  if self.mainHolder then
			  self:updateVisuals(newColor)
		  end
		  option.visualize.BackgroundColor3 = newColor
		  library.flags[self.flag] = newColor
		  self.color = newColor
		  if not nocallback then
			  self.callback(newColor)
		  end
	  end
	  if option.trans then
		  function option:SetTrans(value, manual)
			  value = math.clamp(tonumber(value) or 0, 0, 1)
			  if self.transSlider then
				  self.transSlider.Position = UDim2.new(0, 0, value, 0)
			  end
			  self.trans = value
			  library.flags[self.flag .. " Transparency"] = 1 - value
			  self.calltrans(value)
		  end
		  option:SetTrans(option.trans)
	  end
	  delay(1, function()
		  if library then
			  option:SetColor(option.color)
		  end
	  end)
	  
	  function option:Close()
		  library.popup = nil
		  self.open = false
		  self.mainHolder.Visible = false
		  option.visualize.BorderColor3 = Color3.new()
	  end
  end
  
  function library:AddTab(title, pos)
	  local tab = {
		  canInit = true,
		  columns = {},
		  title = tostring(title)
	  }
	  table.insert(self.tabs, pos or #self.tabs + 1, tab)
  
	  function tab:AddColumn()
		  local column = {
			  sections = {},
			  position = #self.columns,
			  canInit = true,
			  tab = self
		  }
		  table.insert(self.columns, column)
  
		  function column:AddSection(title)
			  local section = {
				  title = tostring(title),
				  options = {},
				  canInit = true,
				  column = self
			  }
			  table.insert(self.sections, section)
		  
			  function section:AddLabel(text)
				  local option = {
					  text = text
				  }
				  option.section = self
				  option.type = "label"
				  option.position = #self.options
				  option.canInit = true
				  table.insert(self.options, option)
				  if library.hasInit and self.hasInit then
					  createLabel(option, self.content)
				  else
					  option.Init = createLabel
				  end
				  return option
			  end
  
			  function section:AddDivider(text)
				  local option = {
					  text = text
				  }
				  option.section = self
				  option.type = "divider"
				  option.position = #self.options
				  option.canInit = true
				  table.insert(self.options, option)
				  if library.hasInit and self.hasInit then
					  createDivider(option, self.content)
				  else
					  option.Init = createDivider
				  end
				  return option
			  end
  
			  function section:AddToggle(option)
				  option = typeof(option) == "table" and option or {}
				  option.section = self
				  option.text = tostring(option.text)
				  option.state = typeof(option.state) == "boolean" and option.state or false
				  option.callback = typeof(option.callback) == "function" and option.callback or function()
				  end
				  option.type = "toggle"
				  option.position = #self.options
				  option.flag = (library.flagprefix and library.flagprefix .. " " or "") .. (option.flag or option.text)
				  option.subcount = 0
				  option.canInit = (option.canInit ~= nil and option.canInit) or true
				  option.tip = option.tip and tostring(option.tip)
				  option.style = option.style == 2
				  library.flags[option.flag] = option.state
				  table.insert(self.options, option)
				  library.options[option.flag] = option
  
				  function option:AddColor(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddColor(subOption)
				  end
  
				  function option:AddBind(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddBind(subOption)
				  end
  
				  function option:AddList(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddList(subOption)
				  end
  
				  function option:AddSlider(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddSlider(subOption)
				  end
				  if library.hasInit and self.hasInit then
					  createToggle(option, self.content)
				  else
					  option.Init = createToggle
				  end
				  return option
			  end
  
			  function section:AddButton(option)
				  option = typeof(option) == "table" and option or {}
				  option.section = self
				  option.text = tostring(option.text)
				  option.callback = typeof(option.callback) == "function" and option.callback or function()
				  end
				  option.type = "button"
				  option.position = #self.options
				  option.flag = (library.flagprefix and library.flagprefix .. " " or "") .. (option.flag or option.text)
				  option.subcount = 0
				  option.canInit = (option.canInit ~= nil and option.canInit) or true
				  option.tip = option.tip and tostring(option.tip)
				  table.insert(self.options, option)
				  library.options[option.flag] = option
  
				  function option:AddBind(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  option.main.Size = UDim2.new(1, 0, 0, 40)
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddBind(subOption)
				  end
  
				  function option:AddColor(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  option.main.Size = UDim2.new(1, 0, 0, 40)
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddColor(subOption)
				  end
				  if library.hasInit and self.hasInit then
					  createButton(option, self.content)
				  else
					  option.Init = createButton
				  end
				  return option
			  end
  
			  function section:AddBind(option)
				  option = typeof(option) == "table" and option or {}
				  option.section = self
				  option.text = tostring(option.text)
				  option.key = (option.key and option.key.Name) or option.key or "none"
				  option.nomouse = typeof(option.nomouse) == "boolean" and option.nomouse or false
				  option.mode = typeof(option.mode) == "string" and (option.mode == "toggle" or option.mode == "hold" and option.mode) or "toggle"
				  option.callback = typeof(option.callback) == "function" and option.callback or function()
				  end
				  option.type = "bind"
				  option.position = #self.options
				  option.flag = (library.flagprefix and library.flagprefix .. " " or "") .. (option.flag or option.text)
				  option.canInit = (option.canInit ~= nil and option.canInit) or true
				  option.tip = option.tip and tostring(option.tip)
				  table.insert(self.options, option)
				  library.options[option.flag] = option
				  if library.hasInit and self.hasInit then
					  createBind(option, self.content)
				  else
					  option.Init = createBind
				  end
				  return option
			  end
  
			  function section:AddSlider(option)
				  option = typeof(option) == "table" and option or {}
				  option.section = self
				  option.text = tostring(option.text)
				  option.min = typeof(option.min) == "number" and option.min or 0
				  option.max = typeof(option.max) == "number" and option.max or 0
				  option.value = option.min < 0 and 0 or math.clamp(typeof(option.value) == "number" and option.value or option.min, option.min, option.max)
				  option.callback = typeof(option.callback) == "function" and option.callback or function()
				  end
				  option.float = typeof(option.value) == "number" and option.float or 1
				  option.suffix = option.suffix and tostring(option.suffix) or ""
				  option.textpos = option.textpos == 2
				  option.type = "slider"
				  option.position = #self.options
				  option.flag = (library.flagprefix and library.flagprefix .. " " or "") .. (option.flag or option.text)
				  option.subcount = 0
				  option.canInit = (option.canInit ~= nil and option.canInit) or true
				  option.tip = option.tip and tostring(option.tip)
				  library.flags[option.flag] = option.value
				  table.insert(self.options, option)
				  library.options[option.flag] = option
				  function option:AddColor(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddColor(subOption)
				  end
  
				  function option:AddBind(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddBind(subOption)
				  end
				  if library.hasInit and self.hasInit then
					  createSlider(option, self.content)
				  else
					  option.Init = createSlider
				  end
				  return option
			  end
  
			  function section:AddList(option)
				  option = typeof(option) == "table" and option or {}
				  option.section = self
				  option.text = tostring(option.text)
				  option.values = typeof(option.values) == "table" and option.values or {}
				  option.callback = typeof(option.callback) == "function" and option.callback or function()
				  end
				  option.multiselect = typeof(option.multiselect) == "boolean" and option.multiselect or false
				  option.value = option.multiselect and (typeof(option.value) == "table" and option.value or {}) or tostring(option.value or option.values[1] or "")
				  if option.multiselect then
					  for i, v in next, option.values do
						  option.value[v] = false
					  end
				  end
				  option.max = option.max or 4
				  option.open = false
				  option.type = "list"
				  option.position = #self.options
				  option.labels = {}
				  option.flag = (library.flagprefix and library.flagprefix .. " " or "") .. (option.flag or option.text)
				  option.subcount = 0
				  option.canInit = (option.canInit ~= nil and option.canInit) or true
				  option.tip = option.tip and tostring(option.tip)
				  library.flags[option.flag] = option.value
				  table.insert(self.options, option)
				  library.options[option.flag] = option
  
				  function option:AddValue(value, state)
					  if self.multiselect then
						  self.values[value] = state
					  else
						  table.insert(self.values, value)
					  end
				  end
  
				  function option:AddColor(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddColor(subOption)
				  end
  
				  function option:AddBind(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddBind(subOption)
				  end
				  if library.hasInit and self.hasInit then
					  createList(option, self.content)
				  else
					  option.Init = createList
				  end
				  return option
			  end
  
			  function section:AddBox(option)
				  option = typeof(option) == "table" and option or {}
				  option.section = self
				  option.text = tostring(option.text)
				  option.value = tostring(option.value or "")
				  option.callback = typeof(option.callback) == "function" and option.callback or function()
				  end
				  option.type = "box"
				  option.position = #self.options
				  option.flag = (library.flagprefix and library.flagprefix .. " " or "") .. (option.flag or option.text)
				  option.canInit = (option.canInit ~= nil and option.canInit) or true
				  option.tip = option.tip and tostring(option.tip)
				  library.flags[option.flag] = option.value
				  table.insert(self.options, option)
				  library.options[option.flag] = option
				  if library.hasInit and self.hasInit then
					  createBox(option, self.content)
				  else
					  option.Init = createBox
				  end
				  return option
			  end
  
			  function section:AddColor(option)
				  option = typeof(option) == "table" and option or {}
				  option.section = self
				  option.text = tostring(option.text)
				  option.color = typeof(option.color) == "table" and Color3.new(option.color[1], option.color[2], option.color[3]) or option.color or Color3.new(1, 1, 1)
				  option.callback = typeof(option.callback) == "function" and option.callback or function()
				  end
				  option.calltrans = typeof(option.calltrans) == "function" and option.calltrans or (option.calltrans == 1 and option.callback) or function()
				  end
				  option.open = false
				  option.trans = tonumber(option.trans)
				  option.subcount = 1
				  option.type = "color"
				  option.position = #self.options
				  option.flag = (library.flagprefix and library.flagprefix .. " " or "") .. (option.flag or option.text)
				  option.canInit = (option.canInit ~= nil and option.canInit) or true
				  option.tip = option.tip and tostring(option.tip)
				  library.flags[option.flag] = option.color
				  table.insert(self.options, option)
				  library.options[option.flag] = option
				  function option:AddColor(subOption)
					  subOption = typeof(subOption) == "table" and subOption or {}
					  subOption.sub = true
					  subOption.subpos = self.subcount * 24
					  function subOption:getMain()
						  return option.main
					  end
					  self.subcount = self.subcount + 1
					  return section:AddColor(subOption)
				  end
				  if option.trans then
					  library.flags[option.flag .. " Transparency"] = option.trans
				  end
				  if library.hasInit and self.hasInit then
					  createColor(option, self.content)
				  else
					  option.Init = createColor
				  end
				  return option
			  end
  
			  function section:SetTitle(newTitle)
				  self.title = tostring(newTitle)
				  if self.titleText then
					  self.titleText.Text = tostring(newTitle)
					  self.titleText.Size = UDim2.new(0, textService:GetTextSize(self.title, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X + 10, 0, 3)
				  end
			  end
  
			  function section:Init()
				  if self.hasInit then
					  return
				  end
				  self.hasInit = true
				  self.main = library:Create("Frame", {
					  BackgroundColor3 = Color3.fromRGB(30, 30, 30),
					  BorderColor3 = Color3.new(),
					  Parent = column.main
				  })
				  self.content = library:Create("Frame", {
					  Size = UDim2.new(1, 0, 1, 0),
					  BackgroundColor3 = Color3.fromRGB(30, 30, 30),
					  BorderColor3 = Color3.fromRGB(60, 60, 60),
					  BorderMode = Enum.BorderMode.Inset,
					  Parent = self.main
				  })
				  library:Create("ImageLabel", {
					  Size = UDim2.new(1, -2, 1, -2),
					  Position = UDim2.new(0, 1, 0, 1),
					  BackgroundTransparency = 1,
					  Image = "rbxassetid://2592362371",
					  ImageColor3 = Color3.new(),
					  ScaleType = Enum.ScaleType.Slice,
					  SliceCenter = Rect.new(2, 2, 62, 62),
					  Parent = self.main
				  })
				  table.insert(library.theme, library:Create("Frame", {
					  Size = UDim2.new(1, 0, 0, 1),
					  BackgroundColor3 = library.flags["Menu Accent Color"],
					  BorderSizePixel = 0,
					  BorderMode = Enum.BorderMode.Inset,
					  Parent = self.main
				  }))
				  local layout = library:Create("UIListLayout", {
					  HorizontalAlignment = Enum.HorizontalAlignment.Center,
					  SortOrder = Enum.SortOrder.LayoutOrder,
					  Padding = UDim.new(0, 2),
					  Parent = self.content
				  })
				  library:Create("UIPadding", {
					  PaddingTop = UDim.new(0, 12),
					  Parent = self.content
				  })
				  self.titleText = library:Create("TextLabel", {
					  AnchorPoint = Vector2.new(0, 0.5),
					  Position = UDim2.new(0, 12, 0, 0),
					  Size = UDim2.new(0, textService:GetTextSize(self.title, 15, Enum.Font.Code, Vector2.new(9e9, 9e9)).X + 10, 0, 3),
					  BackgroundColor3 = Color3.fromRGB(30, 30, 30),
					  BorderSizePixel = 0,
					  Text = self.title,
					  TextSize = 15,
					  Font = Enum.Font.Code,
					  TextColor3 = Color3.new(1, 1, 1),
					  Parent = self.main
				  })
				  layout.Changed:connect(function()
					  self.main.Size = UDim2.new(1, 0, 0, layout.AbsoluteContentSize.Y + 16)
				  end)
				  for _, option in next, self.options do
					  if option.canInit then
						  option.Init(option, self.content)
					  end
				  end
			  end
			  if library.hasInit and self.hasInit then
				  section:Init()
			  end
			  return section
		  end
  
		  function column:Init()
			  if self.hasInit then
				  return
			  end
			  self.hasInit = true
			  self.main = library:Create("ScrollingFrame", {
				  ZIndex = 2,
				  Position = UDim2.new(0, 6 + (self.position * 239), 0, 2),
				  Size = UDim2.new(0, 233, 1, -4),
				  BackgroundTransparency = 1,
				  BorderSizePixel = 0,
				  ScrollBarImageColor3 = Color3.fromRGB(),
				  ScrollBarThickness = 4,
				  VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
				  ScrollingDirection = Enum.ScrollingDirection.Y,
				  Visible = false,
				  Parent = library.columnHolder
			  })
			  local layout = library:Create("UIListLayout", {
				  HorizontalAlignment = Enum.HorizontalAlignment.Center,
				  SortOrder = Enum.SortOrder.LayoutOrder,
				  Padding = UDim.new(0, 12),
				  Parent = self.main
			  })
			  library:Create("UIPadding", {
				  PaddingTop = UDim.new(0, 8),
				  PaddingLeft = UDim.new(0, 2),
				  PaddingRight = UDim.new(0, 2),
				  Parent = self.main
			  })
			  layout.Changed:connect(function()
				  self.main.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 14)
			  end)
			  for _, section in next, self.sections do
				  if section.canInit and #section.options > 0 then
					  section:Init()
				  end
			  end
		  end
		  if library.hasInit and self.hasInit then
			  column:Init()
		  end
		  return column
	  end
  
	  function tab:Init()
		  if self.hasInit then
			  return
		  end
		  self.hasInit = true
		  local size = textService:GetTextSize(self.title, 18, Enum.Font.Code, Vector2.new(9e9, 9e9)).X + 10
		  self.button = library:Create("TextLabel", {
			  Position = UDim2.new(0, library.tabSize, 0, 22),
			  Size = UDim2.new(0, size, 0, 30),
			  BackgroundTransparency = 1,
			  Text = self.title,
			  TextColor3 = Color3.new(1, 1, 1),
			  TextSize = 15,
			  Font = Enum.Font.Code,
			  TextWrapped = true,
			  ClipsDescendants = true,
			  Parent = library.main
		  })
		  library.tabSize = library.tabSize + size
		  self.button.InputBegan:connect(function(input)
			  if input.UserInputType.Name == "MouseButton1" then
				  library:selectTab(self)
			  end
		  end)
		  for _, column in next, self.columns do
			  if column.canInit then
				  column:Init()
			  end
		  end
	  end
	  if self.hasInit then
		  tab:Init()
	  end
	  return tab
  end
  
  function library:AddWarning(warning)
	  warning = typeof(warning) == "table" and warning or {}
	  warning.text = tostring(warning.text)
	  warning.type = warning.type == "confirm" and "confirm" or ""
	  local answer
	  function warning:Show()
		  library.warning = warning
		  if warning.main and warning.type == "" then
			  return
		  end
		  if library.popup then
			  library.popup:Close()
		  end
		  if not warning.main then
			  warning.main = library:Create("TextButton", {
				  ZIndex = 2,
				  Size = UDim2.new(1, 0, 1, 0),
				  BackgroundTransparency = 0.6,
				  BackgroundColor3 = Color3.new(),
				  BorderSizePixel = 0,
				  Text = "",
				  AutoButtonColor = false,
				  Parent = library.main
			  })
			  warning.message = library:Create("TextLabel", {
				  ZIndex = 2,
				  Position = UDim2.new(0, 20, 0.5, -60),
				  Size = UDim2.new(1, -40, 0, 40),
				  BackgroundTransparency = 1,
				  TextSize = 16,
				  Font = Enum.Font.Code,
				  TextColor3 = Color3.new(1, 1, 1),
				  TextWrapped = true,
				  RichText = true,
				  Parent = warning.main
			  })
			  if warning.type == "confirm" then
				  local button = library:Create("TextLabel", {
					  ZIndex = 2,
					  Position = UDim2.new(0.5, -105, 0.5, -10),
					  Size = UDim2.new(0, 100, 0, 20),
					  BackgroundColor3 = Color3.fromRGB(40, 40, 40),
					  BorderColor3 = Color3.new(),
					  Text = "Yes",
					  TextSize = 16,
					  Font = Enum.Font.Code,
					  TextColor3 = Color3.new(1, 1, 1),
					  Parent = warning.main
				  })
				  library:Create("ImageLabel", {
					  ZIndex = 2,
					  Size = UDim2.new(1, 0, 1, 0),
					  BackgroundTransparency = 1,
					  Image = "rbxassetid://2454009026",
					  ImageColor3 = Color3.new(),
					  ImageTransparency = 0.8,
					  Parent = button
				  })
				  library:Create("ImageLabel", {
					  ZIndex = 2,
					  Size = UDim2.new(1, 0, 1, 0),
					  BackgroundTransparency = 1,
					  Image = "rbxassetid://2592362371",
					  ImageColor3 = Color3.fromRGB(60, 60, 60),
					  ScaleType = Enum.ScaleType.Slice,
					  SliceCenter = Rect.new(2, 2, 62, 62),
					  Parent = button
				  })
				  local button1 = library:Create("TextLabel", {
					  ZIndex = 2,
					  Position = UDim2.new(0.5, 5, 0.5, -10),
					  Size = UDim2.new(0, 100, 0, 20),
					  BackgroundColor3 = Color3.fromRGB(40, 40, 40),
					  BorderColor3 = Color3.new(),
					  Text = "No",
					  TextSize = 16,
					  Font = Enum.Font.Code,
					  TextColor3 = Color3.new(1, 1, 1),
					  Parent = warning.main
				  })
				  library:Create("ImageLabel", {
					  ZIndex = 2,
					  Size = UDim2.new(1, 0, 1, 0),
					  BackgroundTransparency = 1,
					  Image = "rbxassetid://2454009026",
					  ImageColor3 = Color3.new(),
					  ImageTransparency = 0.8,
					  Parent = button1
				  })
				  library:Create("ImageLabel", {
					  ZIndex = 2,
					  Size = UDim2.new(1, 0, 1, 0),
					  BackgroundTransparency = 1,
					  Image = "rbxassetid://2592362371",
					  ImageColor3 = Color3.fromRGB(60, 60, 60),
					  ScaleType = Enum.ScaleType.Slice,
					  SliceCenter = Rect.new(2, 2, 62, 62),
					  Parent = button1
				  })
				  button.InputBegan:connect(function(input)
					  if input.UserInputType.Name == "MouseButton1" then
						  answer = true
					  end
				  end)
				  button1.InputBegan:connect(function(input)
					  if input.UserInputType.Name == "MouseButton1" then
						  answer = false
					  end
				  end)
			  else
				  local button = library:Create("TextLabel", {
					  ZIndex = 2,
					  Position = UDim2.new(0.5, -50, 0.5, -10),
					  Size = UDim2.new(0, 100, 0, 20),
					  BackgroundColor3 = Color3.fromRGB(30, 30, 30),
					  BorderColor3 = Color3.new(),
					  Text = "OK",
					  TextSize = 16,
					  Font = Enum.Font.Code,
					  TextColor3 = Color3.new(1, 1, 1),
					  Parent = warning.main
				  })
				  library:Create("ImageLabel", {
					  ZIndex = 2,
					  Size = UDim2.new(1, 0, 1, 0),
					  BackgroundTransparency = 1,
					  Image = "rbxassetid://2454009026",
					  ImageColor3 = Color3.new(),
					  ImageTransparency = 0.8,
					  Parent = button
				  })
				  library:Create("ImageLabel", {
					  ZIndex = 2,
					  AnchorPoint = Vector2.new(0.5, 0.5),
					  Position = UDim2.new(0.5, 0, 0.5, 0),
					  Size = UDim2.new(1, -2, 1, -2),
					  BackgroundTransparency = 1,
					  Image = "rbxassetid://3570695787",
					  ImageColor3 = Color3.fromRGB(50, 50, 50),
					  Parent = button
				  })
				  button.InputBegan:connect(function(input)
					  if input.UserInputType.Name == "MouseButton1" then
						  answer = true
					  end
				  end)
			  end
		  end
		  warning.main.Visible = true
		  warning.message.Text = warning.text
		  repeat
			  wait()
		  until answer ~= nil
		  spawn(warning.Close)
		  library.warning = nil
		  return answer
	  end
  
	  function warning:Close()
		  answer = nil
		  if not warning.main then
			  return
		  end
		  warning.main.Visible = false
	  end
	  return warning
  end
  
  function library:Close()
	  self.open = not self.open
	  if self.open then
		  inputService.MouseIconEnabled = false
	  else
		  inputService.MouseIconEnabled = self.mousestate
	  end
	  if self.main then
		  if self.popup then
			  self.popup:Close()
		  end
		  self.main.Visible = self.open
		  self.cursor.Visible  = self.open
		  self.cursor1.Visible  = self.open
	  end
  end
  hookfunction(gcinfo , function()
  return math.random(400,500)
  end)
  function library:Init()
	  if self.hasInit then
		  return
	  end
	  self.hasInit = true
	  self.base = library:Create("ScreenGui", {
		  IgnoreGuiInset = true
	  })
	  if runService:IsStudio() then
		  self.base.Parent = game:GetService"CoreGui"
	  elseif syn then
		  syn.protect_gui(self.base)
		  self.base.Parent = game:GetService"CoreGui"
	  end
	  self.main = self:Create("ImageButton", {
		  AutoButtonColor = false,
		  Position = UDim2.new(0, 100, 0, 46),
		  Size = UDim2.new(0, 90, 0, 90), --500, 600
		  BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		  BorderColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Tile,
		  Modal = true,
		  Visible = false,
		  Parent = self.base
	  })
	  local top = self:Create("Frame", {
		  Size = UDim2.new(1, 0, 0, 50),
		  BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		  BorderColor3 = Color3.new(),
		  Parent = self.main
	  })
	  self:Create("TextLabel", {
		  Position = UDim2.new(0, 6, 0, -1),
		  Size = UDim2.new(0, 0, 0, 20),
		  BackgroundTransparency = 1,
		  Text = tostring(self.title),
		  Font = Enum.Font.Code,
		  TextSize = 18,
		  TextColor3 = Color3.new(1, 1, 1),
		  TextXAlignment = Enum.TextXAlignment.Left,
		  Parent = self.main
	  })
	  table.insert(library.theme, self:Create("Frame", {
		  Size = UDim2.new(1, 0, 0, 1),
		  Position = UDim2.new(0, 0, 0, 24),
		  BackgroundColor3 = library.flags["Menu Accent Color"],
		  BorderSizePixel = 0,
		  Parent = self.main
	  }))
	  library:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  ImageColor3 = Color3.new(),
		  ImageTransparency = 0.4,
		  Parent = top
	  })
	  self.tabHighlight = self:Create("Frame", {
		  BackgroundColor3 = library.flags["Menu Accent Color"],
		  BorderSizePixel = 0,
		  Parent = self.main
	  })
	  table.insert(library.theme, self.tabHighlight)
	  self.columnHolder = self:Create("Frame", {
		  Position = UDim2.new(0, 5, 0, 55),
		  Size = UDim2.new(1, -10, 1, -60),
		  BackgroundTransparency = 1,
		  Parent = self.main
	  })
	  self.tooltip = self:Create("TextLabel", {
		  ZIndex = 2,
		  BackgroundTransparency = 1,
		  BorderSizePixel = 0,
		  TextSize = 15,
		  Font = Enum.Font.Code,
		  TextColor3 = Color3.new(1, 1, 1),
		  Visible = true,
		  Parent = self.base
	  })
	  self.cursor = self:Create("Triangle", {
		  Color = Color3.fromRGB(180, 180, 180),
		  Transparency = 0.6,
	  })
	  self.cursor1 = self:Create("Triangle", {
		  Color = Color3.fromRGB(240, 240, 240),
		  Transparency = 0.6,
	  })
	  self:Create("Frame", {
		  AnchorPoint = Vector2.new(0.5, 0),
		  Position = UDim2.new(0.5, 0, 0, 0),
		  Size = UDim2.new(1, 10, 1, 0),
		  Style = Enum.FrameStyle.RobloxRound,
		  Parent = self.tooltip
	  })
	  self:Create("ImageLabel", {
		  Size = UDim2.new(1, 0, 1, 0),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.fromRGB(60, 60, 60),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = self.main
	  })
	  self:Create("ImageLabel", {
		  Size = UDim2.new(1, -2, 1, -2),
		  Position = UDim2.new(0, 1, 0, 1),
		  BackgroundTransparency = 1,
		  Image = "rbxassetid://2592362371",
		  ImageColor3 = Color3.new(),
		  ScaleType = Enum.ScaleType.Slice,
		  SliceCenter = Rect.new(2, 2, 62, 62),
		  Parent = self.main
	  })
	  top.InputBegan:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  dragObject = self.main
			  dragging = true
			  dragStart = input.Position
			  startPos = dragObject.Position
			  if library.popup then
				  library.popup:Close()
			  end
		  end
	  end)
	  top.InputChanged:connect(function(input)
		  if dragging and input.UserInputType.Name == "MouseMovement" then
			  dragInput = input
		  end
	  end)
	  top.InputEnded:connect(function(input)
		  if input.UserInputType.Name == "MouseButton1" then
			  dragging = false
		  end
	  end)
	  function self:selectTab(tab)
		  if self.currentTab == tab then
			  return
		  end
		  if library.popup then
			  library.popup:Close()
		  end
		  if self.currentTab then
			  self.currentTab.button.TextColor3 = Color3.fromRGB(255, 255, 255)
			  for _, column in next, self.currentTab.columns do
				  column.main.Visible = false
			  end
		  end
		  self.main.Size = UDim2.new(0, 16 + ((#tab.columns < 2 and 2 or #tab.columns) * 239), 0, 600)
		  self.currentTab = tab
		  tab.button.TextColor3 = library.flags["Menu Accent Color"]
		  self.tabHighlight:TweenPosition(UDim2.new(0, tab.button.Position.X.Offset, 0, 50), "Out", "Quad", 0.2, true)
		  self.tabHighlight:TweenSize(UDim2.new(0, tab.button.AbsoluteSize.X, 0, -1), "Out", "Quad", 0.1, true)
		  for _, column in next, tab.columns do
			  column.main.Visible = true
		  end
	  end
	  spawn(function()
		  while library do
			  wait(1)
			  local Configs = self:GetConfigs()
			  for _, config in next, Configs do
				  if not table.find(self.options["Config List"].values, config) then
					  self.options["Config List"]:AddValue(config)
				  end
			  end
			  for i, config in next, self.options["Config List"].values do
				  if not table.find(Configs, config) then
					  self.options["Config List"]:RemoveValue(config)
				  end
			  end
		  end
	  end)
	  for _, tab in next, self.tabs do
		  if tab.canInit then
			  tab:Init()
			  self:selectTab(tab)
		  end
	  end
	  self:AddConnection(inputService.InputEnded, function(input)
		  if input.UserInputType.Name == "MouseButton1" and self.slider then
			  self.slider.slider.BorderColor3 = Color3.new()
			  self.slider = nil
		  end
	  end)
	  self:AddConnection(inputService.InputChanged, function(input)
		  if self.open then
			  if input.UserInputType.Name == "MouseMovement" then
				  if self.cursor then
					  local mouse = inputService:GetMouseLocation()
					  local MousePos = Vector2.new(mouse.X, mouse.Y)
					  self.cursor.PointA = MousePos
					  self.cursor.PointB = MousePos + Vector2.new(10, 10)
					  self.cursor.PointC = MousePos + Vector2.new(11, 11)
					  self.cursor1.PointA = MousePos
					  self.cursor1.PointB = MousePos + Vector2.new(10, 10)
					  self.cursor1.PointC = MousePos + Vector2.new(11, 11)
				  end
				  if self.slider then
					  self.slider:SetValue(self.slider.min + ((input.Position.X - self.slider.slider.AbsolutePosition.X) / self.slider.slider.AbsoluteSize.X) * (self.slider.max - self.slider.min))
				  end
			  end
			  if input == dragInput and dragging and library.draggable then
				  local delta = input.Position - dragStart
				  local yPos = (startPos.Y.Offset + delta.Y) < -36 and -36 or startPos.Y.Offset + delta.Y
				  dragObject:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, yPos), "Out", "Quint", 0.1, true)
			  end
		  end
	  end)
  
	  local Meta = getrawmetatable(game)
	  local Old_index = Meta.__index
	  local Old_new = Meta.__newindex
	  setreadonly(Meta, false)
	  Meta.__index = newcclosure(function(t, i)
		  if checkcaller() then
			  return Old_index(t, i)
		  end
		  if library and i == "MouseIconEnabled" then
			  return library.mousestate
		  end
		  return Old_index(t, i)
	  end)
	  Meta.__newindex = newcclosure(function(t, i, v)
		  if checkcaller() then
			  return Old_new(t, i, v)
		  end
		  if library and i == "MouseIconEnabled" then
			  library.mousestate = v
			  if library.open then
				  return
			  end
		  end
		  return Old_new(t, i, v)
	  end)
	  setreadonly(Meta, true)
	  if not getgenv().silent then
		  delay(1, function()
			  self:Close()
		  end)
	  end
  end
  
   local SettingsTab = library:AddTab("Welcome"); 
local SettingsColumn = SettingsTab:AddColumn(); 
local SettingsColumn2 = SettingsTab:AddColumn(); 
local GameSection = SettingsColumn2:AddSection("Game Info");
local PlayerInfSection = SettingsColumn:AddSection("Player Info");
local ExploitSection = SettingsColumn:AddSection("Executor");
  
   PlayerInfSection:AddLabel("Player Name:"..game.Players.LocalPlayer.Name);
   PlayerInfSection:AddLabel("Player Id:"..game.Players.LocalPlayer.UserId);
   PlayerInfSection:AddLabel("Account Age:"..game.Players.LocalPlayer.AccountAge);

   GameSection:AddLabel("Game:"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name);
   GameSection:AddLabel("Game Id:"..game.PlaceId);

  
	-- Aiming Tab
local SettingsTab = library:AddTab("Legit"); 
local SettingsColumn = SettingsTab:AddColumn(); 
local SettingsColumn2 = SettingsTab:AddColumn(); 
local AimlockSection = SettingsColumn2:AddSection("Aimlock");
local SilentSection = SettingsColumn:AddSection("Silent Aim");
local OtherSection = SettingsColumn2:AddSection("miscellaneous");

--// ExtraSection \\--
SilentSection:AddToggle({text = "Silent Aim Active", callback = function(state)
if state then
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local GetChildren = game.GetChildren
local WorldToScreen = Camera.WorldToScreenPoint
local WorldToViewportPoint = Camera.WorldToViewportPoint
local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget
local FindFirstChild = game.FindFirstChild
local RenderStepped = RunService.RenderStepped
local GuiInset = GuiService.GetGuiInset

local resume = coroutine.resume 
local create = coroutine.create

local ValidTargetParts = {"Head", "HumanoidRootPart"};

local function getPositionOnScreen(Vector)
  local Vec3, OnScreen = WorldToScreen(Camera, Vector)
  return Vector2.new(Vec3.X, Vec3.Y), OnScreen
end

local function ValidateArguments(Args, RayMethod)
  local Matches = 0
  if #Args < RayMethod.ArgCountRequired then
	  return false
  end
  for Pos, Argument in next, Args do
	  if typeof(Argument) == RayMethod.Args[Pos] then
		  Matches = Matches + 1
	  end
  end
  return Matches >= RayMethod.ArgCountRequired
end

local function getDirection(Origin, Position)
  return (Position - Origin).Unit * 1000
end

local function getMousePosition()
  return Vector2.new(Mouse.X, Mouse.Y)
end

local function IsPlayerVisible(Player)
  local PlayerCharacter = Player.Character
  local LocalPlayerCharacter = LocalPlayer.Character
  
  if not (PlayerCharacter or LocalPlayerCharacter) then return end 
  
  local PlayerRoot = FindFirstChild(PlayerCharacter, Options.TargetPart.Value) or FindFirstChild(PlayerCharacter, "HumanoidRootPart")
  
  if not PlayerRoot then return end 
  
  local CastPoints, IgnoreList = {PlayerRoot.Position, LocalPlayerCharacter, PlayerCharacter}, {LocalPlayerCharacter, PlayerCharacter}
  local ObscuringObjects = #GetPartsObscuringTarget(Camera, CastPoints, IgnoreList)
  
  return ((ObscuringObjects == 0 and true) or (ObscuringObjects > 0 and false))
end

local function getClosestPlayer()
  if not Options.TargetPart.Value then return end
  local Closest
  local DistanceToMouse
  for _, Player in next, GetChildren(Players) do
	  if Player == LocalPlayer then continue end
	  if Toggles.TeamCheck.Value and Player.Team == LocalPlayer.Team then continue end

	  local Character = Player.Character
	  if not Character then continue end
	  
	  if Toggles.VisibleCheck.Value and not IsPlayerVisible(Player) then continue end

	  local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
	  local Humanoid = FindFirstChild(Character, "Humanoid")

	  if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then continue end

	  local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)

	  if not OnScreen then continue end

	  local Distance = (getMousePosition() - ScreenPosition).Magnitude
	  if Distance <= (DistanceToMouse or (Toggles.fov_Enabled.Value and Options.Radius.Value) or 2000) then
		  Closest = ((Options.TargetPart.Value == "Random" and Character[ValidTargetParts[math.random(1, #ValidTargetParts)]]) or Character[Options.TargetPart.Value])
		  DistanceToMouse = Distance
	  end
  end
  return Closest
end
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Silent aim enabled",
	Icon = 6023426926
	}
else
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Silent aim disabled",
	Icon = 6023426926
	}
	end
end});

SilentSection:AddToggle({text = "Team Check", callback = function()
  end});

SilentSection:AddToggle({text = "Visual Check", callback = function()
  end});

SilentSection:AddList({text = "Aim Part", max = 4, flag = "Aim Part", values = {"Head", "HumanoidRootPart", "Random"}, value = "Head", callback = function(state)
end});

SilentSection:AddList({text = "Method", max = 4, flag = "Silent Method", values = {"Raycast", "FindPartOnRay", "FindPartOnRayWithWhitelist", "FindPartOnRayWithIgnoreList", "Mouse.Hit/Target"}, value = "Raycast", callback = function(state)
end});

SilentSection:AddToggle({text = "FOV Enable", callback = function(state)
if state then
local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = 100
fov_circle.Radius = 180
fov_circle.Filled = false
fov_circle.Visible = false
fov_circle.ZIndex = 999
fov_circle.Transparency = 1
fov_circle.Color = Color3.fromRGB(54, 57, 241)
  
local mouse_box = Drawing.new("Square")
mouse_box.Visible = true 
mouse_box.ZIndex = 999 
mouse_box.Color = Color3.fromRGB(54, 57, 241)
mouse_box.Thickness = 20 
mouse_box.Size = Vector2.new(20, 20)
mouse_box.Filled = true 

local PredictionAmount = 0.165
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fov enabled",
	Icon = 6023426926
	}
else
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fov disabled",
	Icon = 6023426926
	}
	end
end});

--SilentSection:AddSlider({text = "Fov Circle", min = 0, max = 360, value = 180, callback = function(Radius)
--  fov_circle.Radius = Options.Radius.Value
--end});

SilentSection:AddToggle({text = "Visible", flag = "color", color = Color3.new(255, 255, 255), callback = function()
  fov_circle.Visible = Toggles.Visible.Value
end});

SilentSection:AddToggle({text = "Prediction", callback = function()
  end});

--SilentSection:AddSlider({text = "Prediction Amount", min = 0.165, max = 1, value = 0.165, callback = function(Amount)
--  PredictionAmount = Options.Amount.Value
--end});

AimlockSection:AddToggle({text = "AimLock", callback = function(state)
if state then
_G.AimEnabled = true
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "AimLock enabled",
	Icon = 6023426926
	}
  else
_G.AimEnabled = false
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "AimLock disabled",
	Icon = 6023426926
	}
  end
end});

AimlockSection:AddToggle({text = "TeamCheck", callback = function(state)
if state then
_G.TeamCheck = true
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "TeamCheck enabled",
	Icon = 6023426926
	}
  else
_G.TeamCheck = false
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "TeamCheck disabled",
	Icon = 6023426926
	}
  end
end});

AimlockSection:AddToggle({text = "VisibleCheck", callback = function(state)
if state then
_G.WallCheck = true
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "VisibleCheck enabled",
	Icon = 6023426926
	}
  else
_G.WallCheck = false
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "VisibleCheck disabled",
	Icon = 6023426926
	}
  end
end});

AimlockSection:AddList({text = 'LockPart', values = {'Head', 'Body', 'Random'}, callback = function(state)
_G.Lockpart = State
end});

AimlockSection:AddSlider({text = "Sensitivity", min = 0, max = 10, value = 0, callback = function(c)
  _G.Sensitivity = c
end});

AimlockSection:AddToggle({text = "Fov", callback = function(state)
  if state then
	  _G.FieldEnabled = true
	  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fov enabled",
	Icon = 6023426926
	}
  else
	  _G.FieldEnabled = false
	  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fov disabled",
	Icon = 6023426926
	}
  end
end});

AimlockSection:AddToggle({text = "Fov Filled", callback = function(state)
  if state then
	  _G.Filled = true
	  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fov Filled enabled",
	Icon = 6023426926
	}
  else
	  _G.Filled = false
	  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fov Filled disabled",
	Icon = 6023426926
	}
  end
end});

AimlockSection:AddSlider({text = "Fov Circle", min = 0, max = 500, value = 25, callback = function(c)
  _G.Amount = c
end});

OtherSection:AddToggle({text = "S-Paw", callback = function(state)
    if state then
loadstring(game:HttpGet("https://raw.githubusercontent.com/IcoolKIIK/Roka/main/Please"))()
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "S-Paw enabled",
	Icon = 6023426926
	}
else
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "S-Paw disabled",
	Icon = 6023426926
	}
	end
end});

OtherSection:AddToggle({text = "No Recoil", callback = function(state)
    if state then
getgenv().Toggle = true
getgenv().ValueCheck = true
loadstring(game:HttpGet(('https://raw.githubusercontent.com/yesok3877/Miscellaneous/master/Universal-No-Recoil'),true))()
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "No Recoil enabled",
	Icon = 6023426926
	}
else
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "No Recoil disabled",
	Icon = 6023426926
	}
	end
end});
  
  --// Ragemode \\--
  local SettingsTab = library:AddTab("Rage"); 
  local SettingsColumn = SettingsTab:AddColumn(); 
  local SettingsColumn2 = SettingsTab:AddColumn(); 
  local SelfSection = SettingsColumn:AddSection("Self Mods"); 
  local MovementSection = SettingsColumn2:AddSection("Movement");
  local AntiSection = SettingsColumn:AddSection("Anti Hax");
  local CrashSection = SettingsColumn2:AddSection("Miscellaneous");
  local BanSection = SettingsColumn:AddSection("Ban Prevent");
  local PersonSection = SettingsColumn:AddSection("Local Player");
  local TeleportSection = SettingsColumn2:AddSection("Teleport");
  
  TeleportSection:AddBox({text = "Tp saved position", callback = function()
	tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(25, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(Vector3.new(0,0,0))}):Play()
notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Teleporting to location",
	Icon = 6023426926
	}
	  end});
  
   TeleportSection:AddLabel("Paste CFrame position");
  
   TeleportSection:AddLabel("from clipboard into box");
  
  TeleportSection:AddButton({text = "Save position (clipboard)", callback = function()
  setclipboard(tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Position copied",
	Icon = 6023426926
	}
  end});
  
  PersonSection:AddButton({text = "Sit Player", callback = function()
  local c = game.Players.LocalPlayer.Character
  if c then
  local h = c:findFirstChild("Humanoid")
  if h then h.Sit = not h.Sit 
  end
  end
  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "You are sitting",
	Icon = 6023426926
	}
  end});
  
  PersonSection:AddButton({text = "Remove Humanoid", callback = function()
  local p = game.Players.LocalPlayer.Character
		  p.Parent = nil
		  p.HumanoidRootPart:Destroy()
		  p.Parent = workspace
		  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Humanoid removed",
	Icon = 6023426926
	}
  end});
  
   PersonSection:AddButton({text = "Invisible", callback = function()
  game.Players.LocalPlayer.Character.LowerTorso:Destroy()
  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "You are now invisible",
	Icon = 6023426926
	}
  end});
  
  PersonSection:AddButton({text = "ARInvisible", callback = function()
	tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(15, Enum.EasingStyle.Linear)
   tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(Vector3.new(1213.4490966796875, 155.49627685546875, -2528.90283203125))}):Play()
   wait(15)
   tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
   tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(Vector3.new(4208.34716796875, 107.06092834472656, 4636.5146484375))}):Play()
   wait(20)
	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Please reset character",
	Icon = 6023426926
	}
	wait(7)
	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Press play",
	Icon = 6023426926
	}
   wait(30)
   notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Camera loaded",
	Icon = 6023426926
	}
   do
   game.Players.LocalPlayer.Character.LowerTorso:Destroy()
   end
	end});
 
	PersonSection:AddToggle({text = "HumanoidPart", callback = function(state)
 if state then
   local p = game.Players.LocalPlayer.Character
		  p.HumanoidRootPart.Transparency = 0
		  p.Parent = workspace
		  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "HumanoidPart is visible",
	Icon = 6023426926
	}
		  else
   local p = game.Players.LocalPlayer.Character
		  p.HumanoidRootPart.Transparency = 1
		  p.Parent = workspace	
		  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "HumanoidPart is invisible",
	Icon = 6023426926
	}
 end
	  end});
  
  
  CrashSection:AddToggle({text = "Server crash", callback = function()
  game:GetService("NetworkClient"):SetOutgoingKBPSLimit(math.huge)
  local function getmaxvalue(val) --calculate maximum value
	 local mainvalueifonetable = 4999999 --doing more per 1 table causes a kick
	 if type(val) ~= "number" then
		 return nil --we cant calcuate if our value isnt a number, lets prevent a error from happening!
	 end
	 local calculateperfectval = (mainvalueifonetable/(val+2)) --+2 to calculate the spammed table (+1) which is in the main table (+1)
	 return calculateperfectval --return the value.
  end
  
  local function bomb(tableincrease, tries) --thanks to syria for providing this function. (reestart)
   local maintable = {}
   local spammedtable = {}
   
   table.insert(spammedtable, {})
   z = spammedtable[1]
   
   for i = 1, tableincrease do
	  local tableins = {}
	  table.insert(z, tableins)
	  z = tableins
   end --increases each with the paremeter
   
   local calculatemax = getmaxvalue(tableincrease) --we increased tables, lets calculate the new maximum we're capable of using
   local maximum --setup the max we use after calculating
   
   if calculatemax then
	   maximum = calculatemax
	   else
	   maximum = 4999999 --ok?
   end
   
   for i = 1, maximum do
	   table.insert(maintable, spammedtable)
   end --pass each spammed table into main table
  
   for i = 1, tries do
	   game.RobloxReplicatedStorage.SetPlayerBlockList:FireServer(maintable) --push a as a argument and fire for each try.
   end
  end
  
  bomb(296, 4) --fire the function or include it in an bot api
  end});
  
  BanSection:AddToggle({text = "Spoof Name", callback = function(state)
  if state then
  game.Players.LocalPlayer.Name = "ROBLOX"
  else
 notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Data failed",
	Icon = 6023426926
	}
  end
  end});
  
  BanSection:AddToggle({text = "Spoof D-Name", callback = function(state)
  if state then
  game.Players.LocalPlayer.DisplayName = "discord.gg/Crt35bJ8k5"
  else
  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Data failed",
	Icon = 6023426926
	}
  end
  end});
  
  BanSection:AddToggle({text = "Mod Alerts", callback = function()
  if AdminUserCheck.UserId == 1580358332 then
		  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Mod Alert/n"..AdminUserCheck.Name..", Has joind the server",
	Icon = 6023426926
	}
			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Mod Alerts enabled",
	Icon = 6023426926
	}
	else
	    			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Mod Alerts disabled",
	Icon = 6023426926
	}
	  end
  end});
  
  BanSection:AddButton({text = "Join Logs", callback = function()
  local Players = game:GetService("Players")
   
  Players.PlayerAdded:Connect(function(player)
local JoinedPEP = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local JoinedName = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")

JoinedPEP.Name = "JoinedPEP"
JoinedPEP.Parent = game.CoreGui
JoinedPEP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = JoinedPEP
MainFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
MainFrame.BackgroundTransparency = 1.000
MainFrame.Position = UDim2.new(0.00545454537, 0, 0.387856245, 0)
MainFrame.Size = UDim2.new(0, 289, 0, 20)

JoinedName.Name = "JoinedName"
JoinedName.Parent = MainFrame
JoinedName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JoinedName.BackgroundTransparency = 1.000
JoinedName.Position = UDim2.new(0.0276816785, 0, -2.5999999, 0)
JoinedName.Size = UDim2.new(0, 308, 0, 20)
JoinedName.Font = Enum.Font.Arial
JoinedName.Text = "[Join] "..player.Name
JoinedName.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinedName.TextSize = 14.000
JoinedName.TextXAlignment = Enum.TextXAlignment.Left

UICorner.Parent = MainFrame
  delay(3, function() JoinedPEP:Destroy() end)
  end)
   
  Players.PlayerRemoving:Connect(function(player)
local LeftPEP = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LeftName = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")

LeftPEP.Name = "LeftPEP"
LeftPEP.Parent = game.CoreGui
LeftPEP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = LeftPEP
MainFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
MainFrame.BackgroundTransparency = 1.000
MainFrame.Position = UDim2.new(0.00545454537, 0, 0.420074344, 0)
MainFrame.Size = UDim2.new(0, 289, 0, 20)

LeftName.Name = "LeftName"
LeftName.Parent = MainFrame
LeftName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LeftName.BackgroundTransparency = 1.000
LeftName.Position = UDim2.new(0.0276816487, 0, -2.94999981, 0)
LeftName.Size = UDim2.new(0, 308, 0, 20)
LeftName.Font = Enum.Font.Arial
LeftName.Text = "[Left] "..player.Name
LeftName.TextColor3 = Color3.fromRGB(255, 255, 255)
LeftName.TextSize = 14.000
LeftName.TextXAlignment = Enum.TextXAlignment.Left

UICorner.Parent = MainFrame
  delay(3, function() LeftPEP:Destroy() end)
  end)
  			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Join Logs enabled",
	Icon = 6023426926
	}
  end});
  
  BanSection:AddButton({text = "Role Check", callback = function()
  local GroupID = 3441839 and 1066925 and 145163
  for i,v in pairs(game.Players:GetChildren()) do
	  local Role = v:GetRoleInGroup(GroupID)
	  print(v.Name .. " | " .. Role)
		  game.StarterGui:SetCore("SendNotification", 
	  {Title = "Alternate Access";
		  Text = (v.Name .. " | " .. Role);
		  Icon = "";
		  Duration = "5";
		  Button1 = "";
		  Button2 = "" })
  end
  end});
  
 CrashSection:AddButton({text = "Click Detectors", callback = function()
 local lp = game.Players.LocalPlayer
 local torso
 
 for i,v in next,workspace:GetDescendants() do
	 if v:IsA("ProximityPrompt") then
		 if lp.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
			 torso = "UpperTorso"
		 else
			 torso = "Torso"
		 end
		 v.MaxActivationDistance = math.huge
		 v.HoldDuration = 1
		 v.RequiresLineOfSight = false
		 
		 v.PromptButtonHoldBegan:Connect(
			 function(Player)
				 if Player.Character.HumanoidRootPart.Position ~= v.Parent.Position and Player == lp then
					 lp.Character.HumanoidRootPart.Position = v.Parent.Position
				 end
			 end
		 )
		 
		 v.PromptButtonHoldEnded:Connect(
			 function(Player)
				 if Player == lp then
					 lp.Character.HumanoidRootPart.Position = lp.Character[torso].Position
				 end
			 end
		 )
		 
		 v.Triggered:Connect(
			 function(Player)
				 if Player == lp then
					 lp.Character.HumanoidRootPart.Position = lp.Character[torso].Position
				 end
			 end
		 )
	 end
 end
 			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Click Detectors shown",
	Icon = 6023426926
	}
 end});
  
  CrashSection:AddButton({text = "Click Everything", callback = function()
  function gtdist(Part)
	local player = game.Players.LocalPlayer
  
	  if player.Character then
		 local distance = math.round((Part.Position - player.Character.HumanoidRootPart.Position).Magnidue)
		  return distance
		end
  end
  
  for i,v in pairs(game:GetDescendants()) do
	  if v.ClassName == "ClickDetector" and gtdist ~= 10 then
		  fireclickdetector(v)
	  end
  end
  			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Clicked everything",
	Icon = 6023426926
	}
  end});
  
  AntiSection:AddToggle({text = "Spinbot", callback = function(state)
	  if state then
power = 750
 
game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end)
wait(.1)
local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bambam.Force = Vector3.new(power,0,power)
bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
  			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Spinbot enabled, you can't see it spin",
	Icon = 6023426926
	}
  else
      			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Spinbot disabled",
	Icon = 6023426926
	}
	  end
  end});
  
  AntiSection:AddToggle({text = "Break Aimbots", callback = function(state)
  if state then
		  local height
	  if r15(speaker) then
		  height = args[1] or 2.1
		  			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Aimbots broken",
	Icon = 6023426926
	}
	  else
		  height = args[1] or 0
	  end
	  speaker.Character:FindFirstChildOfClass('Humanoid').HipHeight = 50
	  else
	  speaker.Character:FindFirstChildOfClass('Humanoid').HipHeight = 0  
	  end
  end});
  
  MovementSection:AddToggle({text = "Ws/Jp", callback = function(state)
  if state then
	  MovementSection:AddToggle({text = "Omni Sprint", callback = function(state)
if state then
	      			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Omni Sprint enabled",
	Icon = 6023426926
	}
	else
	    			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Omni Sprint disabled",
	Icon = 6023426926
	}
	end
  end});
  
  MovementSection:AddSlider({text = "Omni sprint Slider", min = 16, max = 34, value = 16, callback = function(s)
	 _G.Speed = s
  
  local mt = getrawmetatable(game)
  setreadonly(mt, false)
  local old = mt.__index
  
  local ospeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
  
  function WalkSpeed()
	  mt.__index = newcclosure(function(self, a)
		  if a == "WalkSpeed" then
			  return ospeed
		  end
		  return old(self, a)
	  end)
	  game:GetService("RunService").RenderStepped:Connect(function()
		  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
	  end)
  end
  
  WalkSpeed()
  end});
  
     MovementSection:AddButton({text = "Lerp Controller", callback = function()
  local walkSpeed = 75

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local W, A, S, D
local xVelo, yVelo

RS.RenderStepped:Connect(function()
   local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
   local C = game.Workspace.CurrentCamera
   local LV = C.CFrame.LookVector
   for i,v in pairs(UIS:GetKeysPressed()) do
       if v.KeyCode == Enum.KeyCode.W then
           W = true
       end
       if v.KeyCode == Enum.KeyCode.A then
           A = true
       end
       if v.KeyCode == Enum.KeyCode.S then
           S = true
       end
       if v.KeyCode == Enum.KeyCode.D then
           D = true
       end
   end

   if W == true and S == true then
       yVelo = false
       W,S = nil
   end

   if A == true and D == true then
       xVelo = false
       A,D = nil
   end

   if yVelo ~= false then
       if W == true then
           if xVelo ~= false then
               if A == true then
                   local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                   HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                   W,A = nil
               else
                   if D == true then
                       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                       HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                       W,D = nil
                   end
               end
           end
       else
           if S == true then
               if xVelo ~= false then
                   if A == true then
                       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                       HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                       S,A = nil
                   else
                       if D == true then
                           local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                           HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                           S,D = nil
                       end
                   end
               end
           end
       end
   end

   if W == true then
       HRP.Velocity = Vector3.new((LV.X * walkSpeed), HRP.Velocity.Y, (LV.Z * walkSpeed))
   end
   if S == true then
       HRP.Velocity = Vector3.new(-(LV.X * walkSpeed), HRP.Velocity.Y, -(LV.Z * walkSpeed))
   end
   if A == true then
       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
       HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
   end
   if D == true then
       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
       HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
   end

   xVelo, yVelo, W, A, S, D = nil
end)
			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Rewrote lerp",
	Icon = 6023426926
	}
  end});
  
     MovementSection:AddButton({text = "Origin Controller", callback = function()
  local walkSpeed = 300

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local W, A, S, D
local xVelo, yVelo

RS.RenderStepped:Connect(function()
   local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
   local C = game.Workspace.CurrentCamera
   local LV = C.CFrame.LookVector
   for i,v in pairs(UIS:GetKeysPressed()) do
       if v.KeyCode == Enum.KeyCode.W then
           W = true
       end
       if v.KeyCode == Enum.KeyCode.A then
           A = true
       end
       if v.KeyCode == Enum.KeyCode.S then
           S = true
       end
       if v.KeyCode == Enum.KeyCode.D then
           D = true
       end
   end

   if W == true and S == true then
       yVelo = false
       W,S = nil
   end

   if A == true and D == true then
       xVelo = false
       A,D = nil
   end

   if yVelo ~= false then
       if W == true then
           if xVelo ~= false then
               if A == true then
                   local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                   HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                   W,A = nil
               else
                   if D == true then
                       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                       HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                       W,D = nil
                   end
               end
           end
       else
           if S == true then
               if xVelo ~= false then
                   if A == true then
                       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                       HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                       S,A = nil
                   else
                       if D == true then
                           local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                           HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                           S,D = nil
                       end
                   end
               end
           end
       end
   end

   if W == true then
       HRP.Velocity = Vector3.new((LV.X * walkSpeed), HRP.Velocity.Y, (LV.Z * walkSpeed))
   end
   if S == true then
       HRP.Velocity = Vector3.new(-(LV.X * walkSpeed), HRP.Velocity.Y, -(LV.Z * walkSpeed))
   end
   if A == true then
       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
       HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
   end
   if D == true then
       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
       HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
   end

   xVelo, yVelo, W, A, S, D = nil
end)
			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Rewrote origin",
	Icon = 6023426926
	}
  end});
  
   MovementSection:AddButton({text = "Rewrite Controller", callback = function()
  local walkSpeed = 700

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local W, A, S, D
local xVelo, yVelo

RS.RenderStepped:Connect(function()
   local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
   local C = game.Workspace.CurrentCamera
   local LV = C.CFrame.LookVector
   for i,v in pairs(UIS:GetKeysPressed()) do
       if v.KeyCode == Enum.KeyCode.W then
           W = true
       end
       if v.KeyCode == Enum.KeyCode.A then
           A = true
       end
       if v.KeyCode == Enum.KeyCode.S then
           S = true
       end
       if v.KeyCode == Enum.KeyCode.D then
           D = true
       end
   end

   if W == true and S == true then
       yVelo = false
       W,S = nil
   end

   if A == true and D == true then
       xVelo = false
       A,D = nil
   end

   if yVelo ~= false then
       if W == true then
           if xVelo ~= false then
               if A == true then
                   local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                   HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                   W,A = nil
               else
                   if D == true then
                       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                       HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                       W,D = nil
                   end
               end
           end
       else
           if S == true then
               if xVelo ~= false then
                   if A == true then
                       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                       HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                       S,A = nil
                   else
                       if D == true then
                           local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                           HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                           S,D = nil
                       end
                   end
               end
           end
       end
   end

   if W == true then
       HRP.Velocity = Vector3.new((LV.X * walkSpeed), HRP.Velocity.Y, (LV.Z * walkSpeed))
   end
   if S == true then
       HRP.Velocity = Vector3.new(-(LV.X * walkSpeed), HRP.Velocity.Y, -(LV.Z * walkSpeed))
   end
   if A == true then
       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
       HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
   end
   if D == true then
       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
       HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
   end

   xVelo, yVelo, W, A, S, D = nil
end)
			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Rewrote lerp and origin",
	Icon = 6023426926
	}
  end});
  
  MovementSection:AddToggle({text = "Walkspeed Toggle", callback = function(s)
  if state then
	  h.WalkSpeed = s
	  			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Walkspeed enabled",
	Icon = 6023426926
	}
  else
	  local walkspeed = 16
  end
  			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Walkspeed disabled",
	Icon = 6023426926
	}
  end});
  
  MovementSection:AddSlider({text = "Walkspeed Slider", min = 16, max = 100, value = 16, callback = function(s)
	 local h = game.Players.LocalPlayer.Character.Humanoid
local current_ws = 16
for i,v in pairs(getconnections(h.Changed)) do v:Disable() end
local mt = getrawmetatable(game)
setreadonly(mt,false)
local backup = mt.__index
local backup2 = mt.__newindex
mt.__index = newcclosure(function(tbl,idx)
if checkcaller() then return backup(tbl,idx) end
if tbl == h and idx == "WalkSpeed" then
return current_ws
end
return backup(tbl,idx)
end)
mt.__newindex = newcclosure(function(tbl,idx,val)
if checkcaller() then return backup2(tbl,idx,val) end
if tbl == h and idx == "WalkSpeed" then
current_ws = val
return os.time()
end
return backup2(tbl,idx,val)
end)
setreadonly(mt,true)

wait(0.1)

h.WalkSpeed = s
	  end});
  
  MovementSection:AddToggle({text = "JumpPower Toggle", callback = function(state)
  if state then
  game.Players.LocalPlayer.Character.Humanoid.JumpPower = true
  			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "JumpPower enabled",
	Icon = 6023426926
	}
	else
	    			  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "JumpPower disabled",
	Icon = 6023426926
	}
	end
  end});
  
  MovementSection:AddSlider({text = "JumpPower Slider", min = 50, max = 250, value = 50, callback = function(s)
  game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
	  end});
  else
	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Data failed",
	Icon = 6023426926
	}
  end
  end});
  
  MovementSection:AddToggle({text = "Bhop", callback = function(state)
  if state then
 	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Bhop enabled",
	Icon = 6023426926
	}
	  getgenv().Bhop = true
	  repeat wait()
	  if getgenv().Bhop == true then
		  game.Players.LocalPlayer.Character.Humanoid.Jump = true
		  end
	  until getgenv().Bhop == false
  else
      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Bhop disabled",
	Icon = 6023426926
	}
	  getgenv().Bhop = false
  end
  end});
  
  MovementSection:AddToggle({text = "Inf Jump", callback = function(state)
	  if state then
	      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Inf Jump enabled",
	Icon = 6023426926
	}
		  InfiniteJumpEnabled = true
		  game:GetService("UserInputService").JumpRequest:connect(function()
			  if InfiniteJumpEnabled then
				  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			  end
		  end)
	  else
	      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Inf Jump disabled",
	Icon = 6023426926
	}
		  InfiniteJumpEnabled = false
	  end
  end});
  
  SelfSection:AddToggle({text = "Third Person", callback = function(state)
	  if state then
	      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Third Person",
	Icon = 6023426926
	}
	  local LP = game:GetService("Players").LocalPlayer
	  local userInputService = game:GetService("UserInputService")
	  LP.CameraMode = 'Classic'
	  game.Players.LocalPlayer.CameraMaxZoomDistance = 12
	  game.Players.LocalPlayer.CameraMinZoomDistance = 12
  else
      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Third Person disabled",
	Icon = 6023426926
	}
	  LP.CameraMode = 'LockFirstPerson'
	  game.Players.LocalPlayer.CameraMaxZoomDistance = 0
	  game.Players.LocalPlayer.CameraMinZoomDistance = 0
  end
  end});
  
  SelfSection:AddSlider({text = "Fov Changer", min = 70, max = 120, value = 70, callback = function(s)
	 workspace.CurrentCamera.FieldOfView = s
  end});
  
  SelfSection:AddButton({text = "Free Camera", callback = function()
      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Free Camera enabled, LShift + P",
	Icon = 6023426926
	}
  loadstring(game:HttpGet("https://raw.githubusercontent.com/IcoolKIIK/Freecam/main/RasBerryPi"))()
  end});
  
  MovementSection:AddToggle({text = "Noclip", callback = function(state)
	  if state then
	      notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Noclip enabled",
	Icon = 6023426926
	}
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
	      notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Noclip disabled",
	Icon = 6023426926
	}
		  getgenv().noclip = false
		  --v.CanCollide = true
	  end
  end});
  
  MovementSection:AddToggle({text = "Fly", callback = function(state)
	  if state then
	      notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fly enabled",
	Icon = 6023426926
	}
		  loadstring(game:HttpGet(('https://pastebin.com/raw/WxmvCLLH'),true))()
		  _G.Speed = 1.5
	  else
	      notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fly disabled",
	Icon = 6023426926
	}
		  for i,v in pairs(game.Workspace:GetChildren()) do
			  if v:IsA("Part") then
				  if v:FindFirstChild("BodyVelocity") then
					  v:Destroy()
				  end
			  end
		  end
	  end
  end});
  
  --MovementSection:AddSlider({text = "Fly Speed", min = 1, max = 15, value = 1, callback = function(s)
  --loadstring(game:HttpGet(('https://pastebin.com/raw/WxmvCLLH'),true))()
  --_G.Speed = s
  --end});
  
  MovementSection:AddToggle({text = "Click Teleport", callback = function(state)
	  if state then
	      notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Click Teleport enabled",
	Icon = 6023426926
	}
	  getgenv().Clicktp = true
	  repeat wait()
	  if getgenv().Clicktp == true then
	  repeat wait() until game:GetService("Players").LocalPlayer ~= nil and game:GetService("Players").LocalPlayer.Character ~= nil
	  local TS = game:GetService("TweenService")
	  local player = game:GetService("Players").LocalPlayer
	  local UIS = game:GetService("UserInputService")
	  local Mouse = player:GetMouse()
	  
	  local function tp(x, y, z)
		  local info = TweenInfo.new(0.1)
		  local move = TS:Create(player.Character.HumanoidRootPart, info, {CFrame = CFrame.new(x, y, z)})
		  move:Play()
	  end
	  
	  UIS.InputBegan:Connect(function(input)
		  if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
			  tp(Mouse.Hit.X,Mouse.Hit.Y+3,Mouse.Hit.Z)
		  end
	  end)
  end
  until getgenv().Clicktp == false
  else
      notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Click Teleport disabled",
	Icon = 6023426926
	}
	  getgenv().Clicktp = false
  end
  end});
  
  MovementSection:AddToggle({text = "Tween Teleport", callback = function(state)
      if state then
          notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Tween Teleport enabled",
	Icon = 6023426926
	}
  local speed = 150 -- set this lower to make it slower
  local bodyvelocityenabled = true -- set this to false if you are getting kicked
  
  local Imput = game:GetService("UserInputService")
  local Plr = game.Players.LocalPlayer
  local Mouse = Plr:GetMouse()
  
  function To(position)
  local Chr = Plr.Character
  if Chr ~= nil then
  local ts = game:GetService("TweenService")
  local char = game.Players.LocalPlayer.Character
  local hm = char.HumanoidRootPart
  local dist = (hm.Position - Mouse.Hit.p).magnitude
  local tweenspeed = dist/tonumber(speed)
  local ti = TweenInfo.new(tonumber(tweenspeed), Enum.EasingStyle.Linear)
  local tp = {CFrame = CFrame.new(position)}
  ts:Create(hm, ti, tp):Play()
  if bodyvelocityenabled == true then
  local bv = Instance.new("BodyVelocity")
  bv.Parent = hm
  bv.MaxForce = Vector3.new(100000,100000,100000)
  bv.Velocity = Vector3.new(0,0,0)
  wait(tonumber(tweenspeed))
  bv:Destroy()
  end
  end
  end
  
  Imput.InputBegan:Connect(function(input)
	 if input.UserInputType == Enum.UserInputType.MouseButton1 and Imput:IsKeyDown(Enum.KeyCode.LeftControl) then
		 To(Mouse.Hit.p)
	 end
  end)
  else
      notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Tween Teleport disabled",
	Icon = 6023426926
	}
	end
  end});
  
  MovementSection:AddButton({text = "tpwalk", callback = function()
      if true then
          notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "tpwalk active",
	Icon = 6023426926
	}
	end
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';
UIS.InputBegan:connect(function(UserInput)
	if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.LeftShift then
		_G.Running = true
			while wait(0.005) and _G.Running == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
end
	end
end)
UIS.InputEnded:connect(function(UserInput)
	if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.LeftShift then
			_G.Running = false
	end
end)
	  end})
  
  MovementSection:AddButton({text = "Tp UnderMap", callback = function()
      if true then
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Tp Bind unlocked",
	Icon = 6023426926
	}
	end
  MovementSection:AddBind({text = "Tp Bind", flag = "Drop Bind", nomouse = true, key = "F", callback = function(state)
  if state then
  local tweenService = game:GetService("TweenService")    
  local Velo = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
  local Hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
  tweenService:Create(Hrp , TweenInfo.new( 0.3 ,Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {Velocity= Velo - Vector3.new(3,147,0)}):Play()
  local player = game.Players.LocalPlayer
  local character = player.Character or player.CharacterAdded:Wait()
  local torso = character:WaitForChild("Torso")
  wait(0.3)
  torso.Anchored = true
  else
  local tweenService = game:GetService("TweenService")    
  local Velo = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
  local Hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
  wait(0.3)
  tweenService:Create(Hrp , TweenInfo.new( 0.7 ,Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0), {Velocity= Velo + Vector3.new(7,225,0)}):Play()
  local player = game.Players.LocalPlayer
  local character = player.Character or player.CharacterAdded:Wait()
  local torso = character:WaitForChild("Torso")
  wait(0.1)
  torso.Anchored = false
  end
  end});
  end});
  
  
  local SettingsTab = library:AddTab("Visuals"); 
  local SettingsColumn = SettingsTab:AddColumn(); 
  local SettingsColumn2 = SettingsTab:AddColumn(); 
  local ESPSection = SettingsColumn:AddSection("Player visuals");
  local ChatSection = SettingsColumn:AddSection("Chat");
  local MapSection = SettingsColumn2:AddSection("Map visuals");
  local ReSection = SettingsColumn2:AddSection("Remove");
  local TracersSection = SettingsColumn2:AddSection("Gun Visuals");
  
  ESPSection:AddToggle({text = "Qz ESP", callback = function(state)
   if true then
       notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Qz ESP enabled",
	Icon = 6023426926
	}
	end
  local esp_settings = { ---- table for esp settings 
	  textsize = 8,
	  colour = 255,255,255
  }
  
  local gui = Instance.new("BillboardGui")
  local esp = Instance.new("TextLabel",gui) ---- new instances to make the billboard gui and the textlabel
  
  
  
  gui.Name = "Cracked esp"; ---- properties of the esp
  gui.ResetOnSpawn = false
  gui.AlwaysOnTop = true;
  gui.LightInfluence = 0;
  gui.Size = UDim2.new(1.75, 0, 1.75, 0);
  esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
  esp.Text = ""
  esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
  esp.BorderSizePixel = 4;
  esp.BorderColor3 = Color3.new(esp_settings.colour)
  esp.BorderSizePixel = 0
  esp.Font = "GothamSemibold"
  esp.TextSize = esp_settings.textsize
  esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour
  
  
  local camera = workspace.CurrentCamera
  game:GetService("RunService").RenderStepped:Connect(function()
  for i,v in pairs(game.Workspace:GetChildren()) do
	  if string.len(v.Name) > 30 then
	   
		  for i,plr in pairs(v:GetDescendants()) do
  if plr:FindFirstChild("HumanoidRootPart") and plr.Name ~= game.Players.LocalPlayer.Name and not plr.LowerTorso:FindFirstChild("Cracked esp") and plr:FindFirstChild("Animate") then
	  
			  esp.Text = "["..plr.Name.."]"
			  gui:Clone().Parent = plr.LowerTorso
			  game.Players[plr.Name].Character = plr
			  else
				  
	  end
		  end
	  end
  end
  end)
  end});
  
   ESPSection:AddToggle({text = "Esp Toggle", callback = function(state)
	 if state then
	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Esp Toggled",
	Icon = 6023426926
	}
	 ESP:Toggle(true)
	 else
	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Esp Untoggled",
	Icon = 6023426926
	}
	 ESP:Toggle(false)
	 end
  end});
  
   ESPSection:AddToggle({text = "Names", callback = function(state)
	if state then
	    	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Names enabled",
	Icon = 6023426926
	}
	 ESP.Names = true
	 else
	     	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Names disabled",
	Icon = 6023426926
	}
	 ESP.Names = false
	 end
   end});
  
  ESPSection:AddToggle({text = "Boxes", callback = function(state)
	  if state then
	      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Boxes enabled",
	Icon = 6023426926
	}
	 ESP.Boxes = true
	 else
	     	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Boxes disabled",
	Icon = 6023426926
	}
	 ESP.Boxes = false
	 end
  end});
  
   ESPSection:AddToggle({text = "Tracers", callback = function(state)
	  if state then
	      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Tracers enabled",
	Icon = 6023426926
	}
	 ESP.Tracers = true
	 else
	     	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Tracers disabled",
	Icon = 6023426926
	}
	 ESP.Tracers = false
	 end
  end});
  
	ChatSection:AddToggle({text = "Unlock Chat", callback = function(state)
	  if state then
	      	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Unlocked Chat",
	Icon = 6023426926
	}
		 game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true
	 else
	     	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Disabled Chat",
	Icon = 6023426926
	}
		 game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = false
	 end
  end});
  
  TracersSection:AddToggle({text = "Gun Chams", callback = function(state)
	if state then
		notifications:message{
			Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
			Description = "Gun Chams enabled",
			Icon = 6023426926
			}
	  Blacklisted = {"Flame", "SightMark", "SightMark2A", "Tip", "Trigger"}
  workspace.CurrentCamera.DescendantAdded:Connect(function(O)
	  if O:IsA("BasePart") and not table.find(Blacklisted, O.Name) then
		  spawn(function()
			  while wait() do
				  O.Color = Color3.fromHSV((tick() % 5 / 5), 1, 1)
				  O.Transparency = 0.8
				  O.Material = Enum.Material.ForceField
			  end
		  end)
	  end
  end)
else
	notifications:message{
		Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
		Description = "Gun Chams disabled",
		Icon = 6023426926
		}
	end
  end});

  TracersSection:AddToggle({text = "Self Body Chams", callback = function()
		notifications:message{
			Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
			Description = "Self Body Chams enabled",
			Icon = 6023426926
			}
  local plr = game.Players.LocalPlayer
	local char = plr.Character or plr.CharacterAdded:Wait()
	local all = char:GetChildren("Parts")
	 
	for i=1, #all do
	    all[i].Material = Enum.Material.ForceField
	end
	end});
  
  ESPSection:AddToggle({text = "Chams", callback = function(state)
	 if state then
	     	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Chams enabled",
	Icon = 6023426926
	}
	  local players = game:GetService("Players")
	 local localPlayer = players.LocalPlayer
	 local storage = {}
	 
	 local function applyChams(player, Player)
		 local highlight = Instance.new("Highlight")
		 highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		 highlight.FillColor = Color3.fromRGB(1, 1, 1)
		 highlight.FillTransparency = 1
		 highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		 highlight.FillTransparency = 0.5
	 
		 local function onAdded(character)
			 highlight.Adornee = character
			 highlight.Parent = character
		 end
	 
		 local function onRemoved()
			 highlight.Adornee = nil
			 highlight.Parent = nil
		 end
	 
		 if player.Character then
			 onAdded(player.Character)
		 end
	 
		 player.CharacterAdded:Connect(onAdded)
		 player.CharacterRemoving:Connect(onRemoved)
	 
		 storage[player] = highlight
	 end
	 
	 
	 
	 local function removeChams(player, Player)
		 local highlight = storage[player]
		 if highlight then
			 highlight:Destroy()
			 highlight = nil
			 storage[player] = nil
		 end
	 end
	 
	 for i,v in next, players:GetPlayers() do
		 if v ~= localPlayer then
			 applyChams(v)
		 end
	 end
	 
	 
	 players.PlayerAdded:Connect(applyChams)
	 players.PlayerRemoving:Connect(removeChams)
	 
	 
	 else
	notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Optimized Chams",
	Icon = 6023426926
	}
		
		 
	  local players = game:GetService("Players")
	 local localPlayer = players.LocalPlayer
	 local storage = {}
	 
	 local function applyChams(player, Player)
		 local highlight = Instance.new("Highlight")
		 highlight.DepthMode = Enum.HighlightDepthMode.Occluded
		 highlight.FillColor = Color3.fromRGB(1, 1, 1)
		 highlight.FillTransparency = 1
		 highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		 highlight.FillTransparency = 0.5
	 
		 local function onAdded(character)
			 highlight.Adornee = character
			 highlight.Parent = character
		 end
	 
		 local function onRemoved()
			 highlight.Adornee = nil
			 highlight.Parent = nil
		 end
	 
		 if player.Character then
			 onAdded(player.Character)
		 end
	 
		 player.CharacterAdded:Connect(onAdded)
		 player.CharacterRemoving:Connect(onRemoved)
	 
		 storage[player] = highlight
	 end
	 
	 
	 
	 local function removeChams(player, Player)
		 local highlight = storage[player]
		 if highlight then
			 highlight:Destroy()
			 highlight = nil
			 storage[player] = nil
		 end
	 end
	 
	 for i,v in next, players:GetPlayers() do
		 if v ~= localPlayer then
			 applyChams(v)
		 end
	 end
	 
	 
	 players.PlayerAdded:Connect(applyChams)
	 players.PlayerRemoving:Connect(removeChams)
			 end
	 end});
  
  MapSection:AddList({text = "SkyBox Changer", max = 4, flag = "SkyBox", values = {"Default", "Among Us", "Quandale Dingle", "Team c00lkidd"}, value = "Default", callback = function(state)
local testArray = {"Default", "Among Us", "Quandale Dingle", "Team c00lkidd"}
  
  --Normal
  if testArray[1] == state then
 s = Instance.new("Sky")
  s.Name = "SKY"
  s.SkyboxBk = "http://www.roblox.com/asset/?id=8302074719"
  s.SkyboxDn = "http://www.roblox.com/asset/?id=8302076352"
  s.SkyboxFt = "http://www.roblox.com/asset/?id=8302081138"
  s.SkyboxLf = "http://www.roblox.com/asset/?id=8302082703"
  s.SkyboxRt = "http://www.roblox.com/asset/?id=8302084497"
  s.SkyboxUp = "http://www.roblox.com/asset/?id=8302085312"
  s.Parent = game.Lighting
  notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Default sky set",
	Icon = 6023426926
	}
  end
  
  --amog us
  if testArray[2] == state then
  s = Instance.new("Sky")
  s.Name = "SKY"
  s.SkyboxBk = "http://www.roblox.com/asset/?id=5752463190"
  s.SkyboxDn = "http://www.roblox.com/asset/?id=5872485020"
  s.SkyboxFt = "http://www.roblox.com/asset/?id=5752463190"
  s.SkyboxLf = "http://www.roblox.com/asset/?id=5752463190"
  s.SkyboxRt = "http://www.roblox.com/asset/?id=5752463190"
  s.SkyboxUp = "http://www.roblox.com/asset/?id=5752463190"
  s.Parent = game.Lighting
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Among Us sky set",
	Icon = 6023426926
	}
  end
  
  --quandale
  if testArray[3] == state then
  s = Instance.new("Sky")
  s.Name = "SKY"
  s.SkyboxBk = "http://www.roblox.com/asset/?id=9065554720"
  s.SkyboxDn = "http://www.roblox.com/asset/?id=9065554720"
  s.SkyboxFt = "http://www.roblox.com/asset/?id=9065554720"
  s.SkyboxLf = "http://www.roblox.com/asset/?id=9065554720"
  s.SkyboxRt = "http://www.roblox.com/asset/?id=9065554720"
  s.SkyboxUp = "http://www.roblox.com/asset/?id=9065554720"
  s.Parent = game.Lighting
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Quandale Dingle sky set",
	Icon = 6023426926
	}
  end

--c00lkidd
  if testArray[4] == state then
  s = Instance.new("Sky")
  s.Name = "SKY"
  s.SkyboxBk = "http://www.roblox.com/asset/?id=764055032"
  s.SkyboxDn = "http://www.roblox.com/asset/?id=764055032"
  s.SkyboxFt = "http://www.roblox.com/asset/?id=764055032"
  s.SkyboxLf = "http://www.roblox.com/asset/?id=764055032"
  s.SkyboxRt = "http://www.roblox.com/asset/?id=764055032"
  s.SkyboxUp = "http://www.roblox.com/asset/?id=764055032"
  s.Parent = game.Lighting
  end
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Team c00lkidd sky set",
	Icon = 6023426926
	}
  end});
  
  MapSection:AddSlider({text = "Time Of Day", min = 0, max = 24, value = 12, callback = function(s)
  game.Lighting.TimeOfDay = s
	  end});
  
  MapSection:AddButton({text = "Fullbright", callback = function()
      if true then
            notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Fullbright active",
	Icon = 6023426926
	}
	end
	  local Light = game:GetService("Lighting")
	   
	  function dofullbright()
	  Light.Ambient = Color3.new(1, 1, 1)
	  Light.ColorShift_Bottom = Color3.new(1, 1, 1)
	  Light.ColorShift_Top = Color3.new(1, 1, 1)
	  end
	   
	  dofullbright()
	   
	  Light.LightingChanged:Connect(dofullbright)
	  end});
  
  ReSection:AddToggle({text = "No Bloom", callback = function()
  game:GetService"Lighting".Bloom:Destroy()
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Removed Bloom",
	Icon = 6023426926
	}
  end});
  
  ReSection:AddToggle({text = "No Blur", callback = function()
  game:GetService"Lighting".Blur:Destroy()
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Removed Blur",
	Icon = 6023426926
	}
  end});
  
  ReSection:AddToggle({text = "No SunRays", callback = function()
  game:GetService"Lighting".SunRays:Destroy()   
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Removed SunRays",
	Icon = 6023426926
	}
  end});
  
  ReSection:AddToggle({text = "No ColorCorrection", callback = function()
  game:GetService"Lighting".ColorCorrection:Destroy()
    notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "Removed ColorCorrection",
	Icon = 6023426926
	}
  end});
	  
	   local SettingsTab = library:AddTab("Teleports"); 
  local SettingsColumn = SettingsTab:AddColumn(); 
  local SettingsColumn2 = SettingsTab:AddColumn(); 
  local LandSection = SettingsColumn:AddSection("Land Marks");
  local SmallSection = SettingsColumn2:AddSection("Secret");
	  
	  LandSection:AddLabel('Do not teleport to areas');
	  LandSection:AddLabel('that are close to you');
	  
LandSection:AddButton({text = "Huntington", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(Vector3.new(-3057.212158203125, 113.27350616455078, -1551.086181640625))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(-3057.212158203125, 113.27350616455078, -1551.086181640625))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});	

LandSection:AddButton({text = "Fairview", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-1511.034912109375, 162.35012817382812, -1701.2840576171875))}):Play()
	wait(21)
 if CFrame.new(Vector3.new(-1511.034912109375, 162.35012817382812, -1701.2840576171875))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

 LandSection:AddButton({text = "University", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(31.75849723815918, 149.77528381347656, -2097.498046875))}):Play()
wait(21)
 if CFrame.new(Vector3.new(31.75849723815918, 149.77528381347656, -2097.498046875))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
			end
 end});

LandSection:AddButton({text = "Beaufort", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(1232.706298828125, 152.02444458007812, -2991.722412109375))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(1232.706298828125, 152.02444458007812, -2991.722412109375))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

 LandSection:AddButton({text = "Regional Airport", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-539.779541015625, 124.3499755859375, -3906.209228515625))}):Play()
		 wait(21)
 if CFrame.new(Vector3.new(-539.779541015625, 124.3499755859375, -3906.209228515625))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

LandSection:AddButton({text = "Prison", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-3685.12109375, 140.74978637695312, -2976.354736328125))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(-3685.12109375, 140.74978637695312, -2976.354736328125))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

 LandSection:AddButton({text = "Huron", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-4944.36865234375, 131.33645629882812, -2071.038818359375))}):Play()
		 wait(21)
 if CFrame.new(Vector3.new(-4944.36865234375, 131.33645629882812, -2071.038818359375))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

LandSection:AddButton({text = "Navel Air Station", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-5099.4951171875, 163.3499755859375, 399.8398132324219))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(-5099.4951171875, 163.3499755859375, 399.8398132324219))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

LandSection:AddButton({text = "Radio Station", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-2744.50048828125, 244.84996032714844, 1121.9415283203125))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(-2744.50048828125, 244.84996032714844, 1121.9415283203125))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

LandSection:AddButton({text = "Hastings", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-4774.7744140625, 146.72171020507812, 3562.33984375))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(-4774.7744140625, 146.72171020507812, 3562.33984375))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

LandSection:AddButton({text = "Observatory", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-3591.544921875, 317.84991455078125, 3189.308837890625))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(-3591.544921875, 317.84991455078125, 3189.308837890625))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

	LandSection:AddButton({text = "Salem", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(689.0298461914062, 144.83229064941406, -284.8428649902344))}):Play()
			wait(21)
 if CFrame.new(Vector3.new(689.0298461914062, 144.83229064941406, -284.8428649902344))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

	LandSection:AddButton({text = "Eden", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(4216.10009765625, 115.02056884765625, -3420.512939453125))}):Play()
			wait(21)
 if CFrame.new(Vector3.new(4216.10009765625, 115.02056884765625, -3420.512939453125))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

	LandSection:AddButton({text = "Power Plant", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(2153.035888671875, 133.44998168945312, 1212.76953125))}):Play()
			wait(21)
 if CFrame.new(Vector3.new(2153.035888671875, 133.44998168945312, 1212.76953125))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});

	LandSection:AddButton({text = "Ashland", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(-8.958625793457031, 117.84998321533203, 2730.485107421875))}):Play()
			wait(21)
 if CFrame.new(Vector3.new(-8.958625793457031, 117.84998321533203, 2730.485107421875))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
	end});
	
	LandSection:AddButton({text = "Lockport", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(2951.647705078125, 118.30838012695312, 2237.041748046875))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(2951.647705078125, 118.30838012695312, 2237.041748046875))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});
	  
		SmallSection:AddButton({text = "Admin Land", callback = function()
  tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(20, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"]
.Character.HumanoidRootPart, tweenInfo,
{CFrame = CFrame.new(Vector3.new(4451.26416015625, 112.15000915527344, -885.1224365234375))}):Play()
		wait(21)
 if CFrame.new(Vector3.new(4451.26416015625, 112.15000915527344, -885.1224365234375))
then
game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport was successful";
			Duration = "12";
			Button1 = "Ok";})
			else
				game.StarterGui:SetCore("SendNotification", {Title = "Alternate Access";
			Text = "Teleport failed";
			Duration = "12";
			Button1 = "Ok";})
end
		end});	  
	  
  -- [Library Settings UI] -----------------------------------------------------------------------------------------------------------------------------------------------------
  local SettingsTab = library:AddTab("Settings"); 
  local SettingsColumn = SettingsTab:AddColumn(); 
  local SettingsColumn2 = SettingsTab:AddColumn(); 
  local SettingSection = SettingsColumn:AddSection("Menu"); 
  local ConfigSection = SettingsColumn2:AddSection("Configs");
  local CreditSection = SettingsColumn:AddSection("Credits");
  local Warning = library:AddWarning({type = "confirm"});
  
  SettingSection:AddBind({text = "Open / Close", flag = "UI Toggle", nomouse = true, key = "Insert", callback = function()
	  library:Close();
  end});
  
  SettingSection:AddColor({text = "Accent Color", flag = "Menu Accent Color", color = Color3.new(160, 160, 160), callback = function(color)
	  if library.currentTab then
		  library.currentTab.button.TextColor3 = color;
	  end
	  for i,v in pairs(library.theme) do
		  v[(v.ClassName == "TextLabel" and "TextColor3") or (v.ClassName == "ImageLabel" and "ImageColor3") or "BackgroundColor3"] = color;
	  end
  end});
  
  -- [Background List]
  local backgroundlist = {
	  Floral = "rbxassetid://5553946656",
	  Flowers = "rbxassetid://6071575925",
	  Circles = "rbxassetid://6071579801",
	  Hearts = "rbxassetid://6073763717"
  };
  
  -- [Background List]
  local back = SettingSection:AddList({text = "Background", max = 4, flag = "background", values = {"Floral", "Flowers", "Circles", "Hearts"}, value = "Floral", callback = function(v)
	  if library.main then
		  library.main.Image = backgroundlist[v];
	  end
  end});
  
  -- [Background Color Picker]
  back:AddColor({flag = "backgroundcolor", color = Color3.new(), callback = function(color)
	  if library.main then
		  library.main.ImageColor3 = color;
	  end
  end, trans = 1, calltrans = function(trans)
	  if library.main then
		  library.main.ImageTransparency = 1 - trans;
	  end
  end});
  
  -- [Tile Size Slider]
  SettingSection:AddSlider({text = "Tile Size", min = 50, max = 500, value = 50, callback = function(size)
	  if library.main then
		  library.main.TileSize = UDim2.new(0, size, 0, size);
	  end
  end});
  
  -- [Discord Button]
  SettingSection:AddButton({text = "Discord", callback = function()
  setclipboard("https://discord.gg/Crt35bJ8k5")
  end})
  
  SettingSection:AddToggle({text = "Watermark", flag = 'watermark'})
  
  
  -- [Config Box]
  ConfigSection:AddBox({text = "Config Name", skipflag = true});
  
  -- [Config List]
  ConfigSection:AddList({text = "Configs", skipflag = true, value = "", flag = "Config List", values = library:GetConfigs()});
  
  -- [Create Button]
  ConfigSection:AddButton({text = "Create", callback = function()
	  library:GetConfigs();
	  writefile(library.foldername .. "/" .. library.flags["Config Name"] .. library.fileext, "{}");
	  library.options["Config List"]:AddValue(library.flags["Config Name"]);
  end});
  
  -- [Save Button]
  ConfigSection:AddButton({text = "Save", callback = function()
	  local r, g, b = library.round(library.flags["Menu Accent Color"]);
	  Warning.text = "Are you sure you want to save the current settings to config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
	  if Warning:Show() then
		  library:SaveConfig(library.flags["Config List"]);
	  end
  end});
  
  -- [Load Button]
  ConfigSection:AddButton({text = "Load", callback = function()
	  local r, g, b = library.round(library.flags["Menu Accent Color"]);
	  Warning.text = "Are you sure you want to load config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
	  if Warning:Show() then
		  library:LoadConfig(library.flags["Config List"]);
	  end
  end});
  
  -- [Delete Button]
  ConfigSection:AddButton({text = "Delete", callback = function()
	  local r, g, b = library.round(library.flags["Menu Accent Color"]);
	  Warning.text = "Are you sure you want to delete config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
	  if Warning:Show() then
		  local config = library.flags["Config List"];
		  if table.find(library:GetConfigs(), config) and isfile(library.foldername .. "/" .. config .. library.fileext) then
			  library.options["Config List"]:RemoveValue(config);
			  delfile(library.foldername .. "/" .. config .. library.fileext);
		  end
	  end
  end});
  
  CreditSection:AddLabel('$amuel#0191 ~ Main Dev');
  CreditSection:AddLabel('Mr.Loaf#9281 ~ Side Dev');
  CreditSection:AddLabel('$_9#0001 ~ Side Dev');
  CreditSection:AddLabel('c00dy#0001 ~ Helper');
  CreditSection:AddLabel('Tick#1857 ~ Whitelist');

  -- [Init] --------------------------------------------------------------------------------------------------------------------------------------------------------------------
  library:Init();
  library:selectTab(library.tabs[1]);
 
      notifications:message{
	Title = "<font color='rgb(130, 220, 120)'>Alternate Access</font>",
	Description = "It took <b>"..string.sub(tostring(os.clock() - startTime),0,5).."ms to load".."</b>",
	Icon = 6023426926
}
