if game.CoreGui:FindFirstChild("electric boogalo") then return error('script is already executed or you executed another script')end
getgenv().PasteDisabled = false
local wait = task.wait -- small test
getgenv().values = {} --blahwrlqwrqwr
local library = {tabs = {}}
local Signal = loadstring(game:HttpGet("https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/backup_signal.lua"))()
--------------------------------------------------------------
local EspLibrary = loadstring(game:HttpGet('https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/esp_library.lua'))()
EspLibrary.settings.enabled = false
--------------------------------------------------------------
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
        return b[RANDOM(#b)]
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
 
local cfglocation = "SamuelPaste_pf/cfgs/"
makefolder('SamuelPaste_pf')
makefolder('SamuelPaste_pf/cfgs')


if not isfile('SamuelPaste_pf/customkillsay.txt') then
	writefile('SamuelPaste_pf/customkillsay.txt', "message1\
message2\
message3"
)
end

if not isfile('SamuelPaste_pf/customchatspam.txt') then
	writefile('SamuelPaste_pf/customchatspam.txt', "message1\
message2\
message3"
)
end

getgenv().Players = game:GetService("Players") 
getgenv().LocalPlayer = Players.LocalPlayer 


getgenv().MainUIColor = Color3.fromRGB(255,20,147)


getgenv().planting = false
getgenv().defusing = false
-- i see those pastes lying around\

getgenv().loopkillplr = {}


for _,v in pairs(game.Players:GetPlayers()) do 
	C.INSERT(loopkillplr, v.Name)
end

	if #loopkillplr == 0 then
		C.INSERT(loopkillplr, 'none')
	end

																																																																												-- Bad 9672 & WetIDreamz 0001 & zeox 9999												
getgenv().emojis = {
	[":clown:"] = utf8.char(129313);
	[":cold_face:"] = utf8.char(129398);
	[":neutral:"] = utf8.char(128528);
	[":sob:"] = utf8.char(128557);
}
local allcfgs = {} 

for _,cfg in pairs(listfiles('SamuelPaste_pf/cfgs')) do 
	local cfgname = C.GSUB(cfg, 'SamuelPaste_pf/cfgs\\', "") 
	C.INSERT(allcfgs, cfgname) 
end
--[[if #allcfgs == 0 then
INSERT(allcfgs, 'shit so script wont crash')
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
				Menu.Image = ""
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
															TBLREMOVE(Element.value.Jumbobox, i) 
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
									val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) or 0 
									Value.Text = val 
									Element.value.Slider = val 
									values[tabname][sectorname][tabtext][text] = Element.value 
									callback(Element.value) 
									moveconnection = mouse.Move:Connect(function() 
										Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
										val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) 
										Value.Text = val 
										Element.value.Slider = val 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
											val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) 
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
								Element.value = {Scroll = {}, Dropdown = ""} 

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


								local amount = data.Amount or 6 
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
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(255, 255, 255)}) 
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
										for i,v in ipairs(joe2) do 
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

												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 

												Element.value.Scroll[joell] = v 

												values[tabname][sectorname][text] = Element.value 
												callback(Element.value) 
											end) 
											Button.MouseEnter:Connect(function() 
												if Element.value.Scroll[joell] ~= v then 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
												end 
											end) 
											Button.MouseLeave:Connect(function() 
												if Element.value.Scroll[joell] ~= v then 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
												end 
											end) 
										end 
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
														TBLREMOVE(Element.value.Jumbobox, i) 
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
												setclipboard(toHex(C.COL3RGB(l,m,a)))
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
								TextLabel35.Text = 'Paste colors (RGB only)' 
								TextLabel35.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel35.TextSize = 11.000
								TextLabel35.ZIndex = 4

									

									
								Button_325.MouseButton1Down:Connect(function() 
									TextLabel35.TextColor3 = MainUIColor 
									library:Tween(TextLabel35, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									local clipboard = getclipboard()
									local colors = string.split(clipboard, ',')
									local IsAColorTable = {'false','false','false'}
									local IsAColor = false
									if #colors == 3 then
										for i = 1, #colors do
											if tonumber(colors[i]) then
												IsAColorTable[i] = 'true'
											end
										end
										if IsAColorTable[1] == 'true' and IsAColorTable[2] == 'true' and IsAColorTable[3] == 'true' then
											IsAColor = true
										end
									else
										IsAColor = false
									end
									
									if IsAColor then
										local retarded, lmao = pcall(function()
												Element.value.Color = C.COL3RGB(colors[1],colors[2],colors[3])
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
												TextLabel35.Text = 'Paste colors (RGB only)'
											else
												TextLabel35.Text = 'Error!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors (RGB only)'
												print(lmao)
											end
									else
										TextLabel35.Text = 'Not a color'
										wait(1.5)
										TextLabel35.Text = "Paste colors (RGB only)"
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
																				--        library.options['Accent Color']:SetColor(Color3.fromHSV(i,1,1)) -- also u can change any flag that has color by prinitng flags (table.foreach(library.flags,print)
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
									ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 

									values[tabname][sectorname][text] = data.default.Color 
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
									setclipboard(toHex(C.COL3RGB(l,m,a)))
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
								TextLabel35.Text = 'Paste colors (RGB only)' 
								TextLabel35.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel35.TextSize = 11.000
								TextLabel35.ZIndex = 4

									

									
								Button_325.MouseButton1Down:Connect(function() 
									TextLabel35.TextColor3 = MainUIColor 
									library:Tween(TextLabel35, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									local clipboard = getclipboard()
									local colors = string.split(clipboard, ',')
									local IsAColorTable = {'false','false','false'}
									local IsAColor = false
									if #colors == 3 then
										for i = 1, #colors do
											if tonumber(colors[i]) then
												IsAColorTable[i] = 'true'
											end
										end
										if IsAColorTable[1] == 'true' and IsAColorTable[2] == 'true' and IsAColorTable[3] == 'true' then
											IsAColor = true
										end
									else
										IsAColor = false
									end
									
									if IsAColor then
										local retarded, lmao = pcall(function()
												Element.value.Color = C.COL3RGB(colors[1],colors[2],colors[3])
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
																				--        library.options['Accent Color']:SetColor(Color3.fromHSV(i,1,1)) -- also u can change any flag that has color by prinitng flags (table.foreach(library.flags,print)

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
									val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) or 0 
									Value.Text = val 
									Element.value.Slider = val 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
									moveconnection = mouse.Move:Connect(function() 
										Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
										val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) 
										Value.Text = val 
										Element.value.Slider = val 
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
											val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)) 
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
								errorCode = data.errorCode or 'Error!'
								if tostring(data.errorCode) then
								else
								errorCode = 'Error!'
								end
								
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
 
--waaaaa i dont want to code waaaaa :sob:
-- samuel doesnt pay me and i live in his basement pls help
 
repeat wait() until game:IsLoaded()
 
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService('Workspace')
local workspace = game:GetService('Workspace')
local Camera = workspace.CurrentCamera
local Left = "Left"
local Right = "Right"
local Weapon = nil
local Mouse = LocalPlayer:GetMouse()
local function VectorRGB(RGB) 
	return C.Vec3(RGB.R, RGB.G, RGB.B) 
end 
local gui = library:New("SamuelPaste")
local legit = gui:Tab('legit')
local rage = gui:Tab('rage')
local visuals = gui:Tab('visuals')
local misc = gui:Tab('misc')
local other123123 = gui:Tab('other')




----------------------------------------------LEGIT TAB----------------------------------------------------------------------------------------------------------------------------------------------------------------
animations = {}
getgenv().client = {}; do
    local gc = getgc(true)  
    for i = #gc, 1, -1 do
        local v = gc[i]
        local type = type(v)
        if type == 'function' then
            if debug.getinfo(v).name == "loadmodules" then
                client.loadmodules = v
            end
        end 
        if type == "table" then
            if (rawget(v, 'send')) then
                client.network = v
            elseif (rawget(v, 'basecframe')) then
                client.camera = v
            elseif (rawget(v, "gammo")) then
                client.gamelogic = v
            elseif (rawget(v, "getbodyparts")) then
                client.replication = v
                client.replication.bodyparts = debug.getupvalue(client.replication.getbodyparts, 1)
            elseif (rawget(v, "updateammo")) then
                client.hud = v
            elseif (rawget(v, "setbasewalkspeed")) then
                client.char = v
            elseif (rawget(v, "getscale")) then
                client.uiscaler = v
            end
            if rawget(v, 'player') then
                --print("Got animation")
                table.insert(animations, v)
            end
        end
    end
end
    EspLibrary:Init()
    EspLibrary.settings.limitdistance = false

    function EspLibrary:GetHealth(Player)
        return client.hud:getplayerhealth(Player)
    end

    function EspLibrary:GetCharacter(Player)
        local Character = client.replication.getbodyparts(Player)

        return Character and Character.torso.Parent, Character and Character.torso
    end

local Fov = Drawing.new("Circle") 
Fov.Filled = true 
Fov.Color = C.COL3RGB(15,15,15) 
Fov.Transparency = 0.5 
Fov.Position = C.Vec2(Mouse.X, Mouse.Y + 16) 
Fov.Radius = 120 

local aimbot = legit:Sector("aimbot", "Left") 
aimbot:Element("ToggleKeybind", "aim assist") 
aimbot:Element("ToggleKeybind", "silent aim")
aimbot:Element("ToggleKeybind", "triggerbot")
local main = legit:MSector("main", "Left") 
local default = main:Tab('default')
--default:Element("Dropdown", "target", {options = {"crosshair", "health", "distance"}}) 
default:Element("Dropdown", "hitbox", {options = {"Head", 'Torso', 'Left Arm', 'Right Arm', 'Left Leg', 'Right Leg', 'Random'}}) 
default:Element("Dropdown", "silent aim mode", {options = {'Silent','Mouse'}})
default:Element('Slider', 'smoothness', {min = 3, max = 100, default = 3})
local FOVLegit = 120
default:Element("Slider", "FOV", {min = 5, max = 600, default = 120}, function(tbl)
	FOVLegit = tbl.Slider
end)
--default:Element("Slider", "smoothing", {min = 1, max = 50, default = 1}) 
default:Element("Toggle", "silent aim")
default:Element("Toggle", "follow barrel", {}, function(tbl)
	followbarrel = tbl.Toggle
end)
default:Element("Toggle", "visible check")
default:Element("Slider", "hitchance", {min = 1, max = 100, default = 100}) 
--default:Element("Dropdown", "priority", {options = {"closest", "head", "chest"}}) 
--default:Element("Toggle", "triggerbot") 
--default:Element("Slider", "delay (ms)", {min = 0, max = 300, default = 200}) 
--default:Element("Slider", "minimum dmg", {min = 0, max = 100, default = 15})
local settings = legit:Sector("settings", "Right") 
settings:Element("Toggle", "free for all") 
settings:Element('ToggleTrans', 'draw fov', {default = {Color = C.COL3RGB(255,255,255), Transparency = 0}})
settings:Element('Toggle', 'filled fov')
settings:Element('Slider', 'fov thickness', {min = 1, max = 10, default = 1})
--settings:Element("Toggle", "forcefield check") 


    local MouseDown = false
    UserInputService.InputBegan:Connect(function(key)
        if key.UserInputType == Enum.UserInputType.MouseButton1 then
            MouseDown = true
        end
    end)

    UserInputService.InputEnded:Connect(function(key)
        if key.UserInputType == Enum.UserInputType.MouseButton1 then
            MouseDown = false
        end
    end)
	
function IsAlive(player)
    if client.replication.bodyparts[player] and client.replication.bodyparts[player].head then
        return true 
    end
    return false
end

function PlayerOnScreen(player)
    if IsAlive(player) then
        local Pos, OnScreen = Camera:WorldToViewportPoint(client.replication.bodyparts[player].head.Position)
        local RealMouseLocation = game:GetService('UserInputService'):GetMouseLocation()
        local Distance = FOVLegit
        local IsInFOV = false 
        local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude
        if Dist < Distance then 
            Distance = Dist
            IsInFOV = true
        end
        return {OnScreen = OnScreen, IsInFOV = IsInFOV}
    end
end
function IsVisible(player)
    if IsAlive(player) and client.replication.bodyparts[player] then
        local HeadPos = client.replication.bodyparts[player].head.Position
        local Hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(Camera.CFrame.p, HeadPos - Camera.CFrame.p), {
            workspace.Ignore,
            workspace.Players,
            workspace.Terrain,
            Camera
        })
        return Hit == nil 
    end
    return false
end

    local Closest
    local ClosestPosition
    local OnScreen, ScreenPos = nil,nil
    RunService:BindToRenderStep("Aimbot", 1, function()
        --CharAlive = client.char.alive
        if client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then
            Barrel = client.gamelogic.currentgun.barrel
        else
            Barrel = nil
        end
        --[[Circle.NumSides = library.flags.FOVRadius
        Circle.Thickness = library.flags.FOVThickness
        Circle.Color = library.flags.FOVColor
        Circle.Radius = library.flags.FOVLegit
        Circle.Transparency = library.flags.FOVTransparency
        Circle.Color = library.flags.FOVColor
        Circle.Visible = library.flags.ShowFOV--]]
		Fov.Visible = values.legit.settings['draw fov'].Toggle

		Fov.Transparency = values.legit.settings['draw fov'].Transparency
	
		Fov.Color =  values.legit.settings['draw fov'].Color
		Fov.Position = C.Vec2(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
		Fov.Radius = FOVLegit
		Fov.Thickness = values.legit.settings['fov thickness'].Slider
		Fov.Filled = values.legit.settings['filled fov'].Toggle

        if client.char.alive and client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then 
            if followbarrel then
                local Pos, OnScreen = Camera:WorldToViewportPoint(client.gamelogic.currentgun.barrel.CFrame * Vector3.new(0, 0, -10))
                Fov.Position = Vector2.new(Pos.X, Pos.Y)
            else
                Fov.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
            end
        else
            Fov.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
        end
        if values.legit.aimbot['silent aim'].Toggle and values.legit.main.default['silent aim'].Toggle and client.char.alive then
            local Distance = FOVLegit
			--print("got slider")
            local Bodyparts
            local RealMouseLocation
            if followbarrel then
                local Pos = Camera:WorldToViewportPoint(client.gamelogic.currentgun.barrel.CFrame * Vector3.new(0, 0, -10))
                RealMouseLocation = Vector2.new(Pos.X, Pos.Y) --cba changing variable name + ratio
            else
                RealMouseLocation = game:GetService('UserInputService'):GetMouseLocation()
            end
            if RealMouseLocation ~= nil then
                for i,v in pairs(Players:GetPlayers()) do
                    if (v ~= LocalPlayer) and (v.Team ~= LocalPlayer.Team) and IsAlive(v) then
                        Bodyparts = client.replication.bodyparts[v]
                        local Pos, OnScreen = Camera:WorldToViewportPoint(Bodyparts.head.Position)
                        local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude
                        if Dist < Distance then
                            Distance = Dist
                            Closest = v
                            aimtarget = v 
                        end
                    end
                end
				--print("closest found")
                local ScreenPos, OnScreen = nil, nil
                if Closest and client.replication.bodyparts[Closest] then 
					--print('got closest')
                    local ClosestParts = client.replication.bodyparts[Closest]
                    if values.legit.main.default.hitbox.Dropdown == "Head" then
                        ClosestPosition = ClosestParts.head.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.head.Position)
                    elseif values.legit.main.default.hitbox.Dropdown == "Torso" then
                        ClosestPosition = ClosestParts.torso.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.torso.Position)
                    elseif values.legit.main.default.hitbox.Dropdown == "Left Arm" then
                        ClosestPosition = ClosestParts.larm.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.larm.Position)
                    elseif values.legit.main.default.hitbox.Dropdown == "Right Arm" then
                        ClosestPosition = ClosestParts.rarm.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.rarm.Position)
                    elseif values.legit.main.default.hitbox.Dropdown == "Left Leg" then
                        ClosestPosition = ClosestParts.lleg.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.lleg.Position)
                    elseif values.legit.main.default.hitbox.Dropdown == "Right Leg" then
                        ClosestPosition = ClosestParts.rleg.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.rleg.Position)
                    elseif values.legit.main.default.hitbox.Dropdown == "Random" then
                        local Parts = { -- garbage code
                            ClosestParts.head,
                            ClosestParts.torso,
                            ClosestParts.larm,
                            ClosestParts.rarm,
                            ClosestParts.lleg,
                            ClosestParts.rleg
                        }
                        local Part = Parts[math.random(1, #Parts)]
                        ClosestPosition = Part.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(Part.Position)
                    end
					--print("picked hitboxes")
                    if values.legit.main.default['silent aim mode'].Dropdown == "Silent" then
                        if math.random(1,100) < values.legit.main.default['hitchance'].Slider then
                            ClosestPosition = ClosestParts.head.Position
                        else
                            ClosestPosition = ClosestParts.torso.Position
                        end
						--print('is silent aim')
                    end
                    if OnScreen and values.legit.main.default['silent aim mode'].Dropdown == "Mouse" and MouseDown then
                        local Smoothing = math.clamp(values.legit.main.default.smoothness.Slider, 3, 100) 
                        local X = ((ScreenPos.X) - (Mouse.X)) / Smoothing
                        local Y = ((ScreenPos.Y) - (Mouse.Y)) / Smoothing 
                        if values.legit.main.default['visible check'].Toggle and not IsVisible(Closest) then
                            return print('not visible, mouse')
                        end
                        mousemoverel(X, Y)
						--print('visible, mouse')
                    end
                else --print("no hitboxes") 
				end
            end
        else --print('not enabled') 
		end
    end)
	
	    local Old
    Old = hookmetamethod(game, "__index", function(Self, Key)
        if values.legit.main.default['silent aim mode'].Dropdown == "Silent" and client.char.alive then
            if Key == "CFrame" and not checkcaller() then
                if client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then
                    if Self == client.gamelogic.currentgun.barrel or Self == client.gamelogic.currentgun.aimsightdata[1].sightpart then
					--print('is silent aim, hook')
                        if Closest and ClosestPosition then
                            if getcallingscript().Name == "RenderSteppedRunner" then
                                local PlayerOnScreen1 = PlayerOnScreen(Closest)
                                if PlayerOnScreen1 and PlayerOnScreen1.OnScreen then
                                    local OnScreen = PlayerOnScreen1.OnScreen
                                    local IsInFOV = PlayerOnScreen1.IsInFOV
                                    local Position = Self.Position
                                    if IsInFOV and OnScreen then
                                        if values.legit.main.default['visible check'].Toggle and not IsVisible(Closest) then
                                            return Old(Self, Key)
                                        end
                                        --local CFramePosition = CFrame.new(Position, ClosestPosition)
                                        return CFrame.new(Position, ClosestPosition)
                                    end 
                                end
                            end
                        end
						
                    end
                end
            end
        end
        return Old(Self, Key)
    end)
-------------------------------------------RAGE TAB------------------------------------------------
local loopkillloop

local Loopkill = rage:Sector("Loop kill", "Right") 
Loopkill:Element("lmao", "Player", {options = loopkillplr, Amount = 20}, function(tbl)
	pcall(function()
		loopkillloop:Disconnect()
	end)
 	if game.Players:FindFirstChild(tbl.Dropdown) then
		loopkillloop = RunService.RenderStepped:Connect(function()
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



Loopkill:Element("ToggleColor", "Target box", {default = {Color = C.COL3RGB(255,255,255)}}) 
Loopkill:Element("ToggleColor", "Target name", {default = {Color = C.COL3RGB(255,255,255)}}) 
Loopkill:Element("ToggleColor", "Target health", {default = {Color = C.COL3RGB(0,1,0)}}) 

Loopkill:Element('Label', 'Alive: ')
Loopkill:Element('Label', 'Team: ')
Loopkill:Element('Label', 'Account age: ')


--------------------------------------------VISUALS TAB AKA ESP-----------------------------------------
local players = visuals:Sector("ESP", "Left") 
players:Element('Toggle', "enabled", {}, function(tbl)
	EspLibrary.settings.enabled = tbl.Toggle
end)
players:Element('Slider', "Refresh Rate (ms)", {min = 0, max = 1000, default = 5}, function(tbl)
	EspLibrary.settings.refreshrate = tbl.Slider
end)
players:Element('Toggle', "Team check", {}, function(tbl)
	EspLibrary.settings.teamcheck = tbl.Toggle
end)
players:Element('Toggle', "Team color", {default = {Toggle = true}}, function(tbl)
	EspLibrary.settings.teamcolor = tbl.Toggle
end)
players:Element('ToggleColor', "Names enabled", {default = {Color = C.COL3RGB(1,1,1),Toggle = true}}, function(tbl)
	EspLibrary.settings.names = tbl.Toggle
	EspLibrary.settings.namescolor = tbl.Color
end)
players:Element('Toggle', "Names Outline", {}, function(tbl)
	EspLibrary.settings.namesoutline = tbl.Toggle
end)
players:Element('ToggleColor', "Distance", {default = {Color = C.COL3RGB(1,1,1),Toggle = true}}, function(tbl)
	EspLibrary.settings.distance = tbl.Toggle
	EspLibrary.settings.distancecolor = tbl.Color
end)
players:Element('Toggle', "Distance Outline", {}, function(tbl)
	EspLibrary.settings.distanceoutline = tbl.Toggle
end)
players:Element('ToggleColor', "Boxes", {default = {Color = C.COL3RGB(1,1,1), Toggle = true}}, function(tbl)
	EspLibrary.settings.boxes = tbl.Toggle
	EspLibrary.settings.boxescolor = tbl.Color
end)
players:Element('Toggle', "Boxes Outline", {}, function(tbl)
	EspLibrary.settings.boxesoutline = tbl.Toggle
end)
players:Element('ToggleTrans', "Boxes Fill", {default = {Color = C.COL3RGB(1,1,1)}}, function(tbl)
	EspLibrary.settings.boxesfill = tbl.Toggle
	EspLibrary.settings.boxesfillcolor = tbl.Color
	EspLibrary.settings.boxesfilltrans = tbl.Transparency
end)
players:Element('ToggleColor', "Healtbars", {default = {Color = C.COL3RGB(1,1,1)}}, function(tbl)
	EspLibrary.settings.healthbars = tbl.Toggle
	EspLibrary.settings.healthbarscolor = tbl.Color
end)
players:Element('Slider', "Healthbar X Offset", {min = 0, max = 10, default = 2}, function(tbl)
	EspLibrary.settings.healthbarsoffset = tbl.Slider
end)
players:Element('ToggleColor', "Tracers", {default = {Color = C.COL3RGB(1,1,1)}}, function(tbl)
	EspLibrary.settings.tracers = tbl.Toggle
	EspLibrary.settings.tracerscolor = tbl.Color
end)
EspLibrary.settings.tracersorigin = 'Mouse'
players:Element('Dropdown', "Tracers side of screen", {options = {"Mouse","Top", "Left", "Right", "Bottom", "Center"}}, function(tbl)
	EspLibrary.settings.tracersorigin = tbl.Dropdown
end)
players:Element('Dropdown', "Text Font", {options = {"UI", "System", "Plex", "Monospace"}}, function(tbl)
	EspLibrary.settings.textfont = Drawing.Fonts[tbl.Dropdown]
end)
players:Element('Slider', "Text Font Size", {min = 13, max = 18, default = 18}, function(tbl)
	EspLibrary.settings.textsize = tbl.Slider
end)



--big ass code incoming
--[[local function DrawLine()
    local l = Drawing.new("Line")
    l.Visible = false
    l.From = C.Vec2(0, 0)
    l.To = C.Vec2(1, 1)
    l.Color = values.visuals.ESP['skeleton esp'].Color
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
                    local H = Camera:WorldToViewportPoint(plr.Character.Head.Position)
                    if limbs.Head_Spine.From ~= Vector2.new(H.X, H.Y) then
                        local T_Height = plr.Character.Torso.Size.Y/2 - 0.2
                        local UT = Camera:WorldToViewportPoint((plr.Character.Torso.CFrame * CFrame.new(0, T_Height, 0)).p)
                        local LT = Camera:WorldToViewportPoint((plr.Character.Torso.CFrame * CFrame.new(0, -T_Height, 0)).p)

                        local LA_Height = plr.Character["Left Arm"].Size.Y/2 - 0.2
                        local LUA = Camera:WorldToViewportPoint((plr.Character["Left Arm"].CFrame * CFrame.new(0, LA_Height, 0)).p)
                        local LLA = Camera:WorldToViewportPoint((plr.Character["Left Arm"].CFrame * CFrame.new(0, -LA_Height, 0)).p)

                        local RA_Height = plr.Character["Right Arm"].Size.Y/2 - 0.2
                        local RUA = Camera:WorldToViewportPoint((plr.Character["Right Arm"].CFrame * CFrame.new(0, RA_Height, 0)).p)
                        local RLA = Camera:WorldToViewportPoint((plr.Character["Right Arm"].CFrame * CFrame.new(0, -RA_Height, 0)).p)

                        local LL_Height = plr.Character["Left Leg"].Size.Y/2 - 0.2
                        local LUL = Camera:WorldToViewportPoint((plr.Character["Left Leg"].CFrame * CFrame.new(0, LL_Height, 0)).p)
                        local LLL = Camera:WorldToViewportPoint((plr.Character["Left Leg"].CFrame * CFrame.new(0, -LL_Height, 0)).p)

                        local RL_Height = plr.Character["Right Leg"].Size.Y/2 - 0.2
                        local RUL = Camera:WorldToViewportPoint((plr.Character["Right Leg"].CFrame * CFrame.new(0, RL_Height, 0)).p)
                        local RLL = Camera:WorldToViewportPoint((plr.Character["Right Leg"].CFrame * CFrame.new(0, -RL_Height, 0)).p)

                        -- Head
                        limbs.Head_Spine.From = Vector2.new(H.X, H.Y)
                        limbs.Head_Spine.To = Vector2.new(UT.X, UT.Y)

                        --Spine
                        limbs.Spine.From = Vector2.new(UT.X, UT.Y)
                        limbs.Spine.To = Vector2.new(LT.X, LT.Y)

                        --Left Arm
                        limbs.LeftArm.From = Vector2.new(LUA.X, LUA.Y)
                        limbs.LeftArm.To = Vector2.new(LLA.X, LLA.Y)

                        limbs.LeftArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
                        limbs.LeftArm_UpperTorso.To = Vector2.new(LUA.X, LUA.Y)

                        --Right Arm
                        limbs.RightArm.From = Vector2.new(RUA.X, RUA.Y)
                        limbs.RightArm.To = Vector2.new(RLA.X, RLA.Y)

                        limbs.RightArm_UpperTorso.From = Vector2.new(UT.X, UT.Y)
                        limbs.RightArm_UpperTorso.To = Vector2.new(RUA.X, RUA.Y)

                        --Left Leg
                        limbs.LeftLeg.From = Vector2.new(LUL.X, LUL.Y)
                        limbs.LeftLeg.To = Vector2.new(LLL.X, LLL.Y)

                        limbs.LeftLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
                        limbs.LeftLeg_LowerTorso.To = Vector2.new(LUL.X, LUL.Y)

                        --Right Leg
                        limbs.RightLeg.From = Vector2.new(RUL.X, RUL.Y)
                        limbs.RightLeg.To = Vector2.new(RLL.X, RLL.Y)

                        limbs.RightLeg_LowerTorso.From = Vector2.new(LT.X, LT.Y)
                        limbs.RightLeg_LowerTorso.To = Vector2.new(RUL.X, RUL.Y)
                    end

                    if limbs.Head_Spine.Visible ~= true then
                        Visibility(true)
                    end
                else 
                    if limbs.Head_Spine.Visible ~= false then
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
				if plr.TeamColor == LocalPlayer.TeamColor and not (values.visuals.ESP['Team Check'].Toggle) then
					Visibility(false)
				   for i, v in pairs(limbs) do
						v.Transparency = 0
                        v:Remove()
                    end
                    connection:Disconnect()
				end
            end
				if not values.visuals.ESP['skeleton esp'].Toggle then 
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
			if v.Name ~= LocalPlayer.Name and (values.visuals.ESP['Team Check'].Toggle and true or v.Team ~= LocalPlayer.Team) then
				DrawESP(v)
			end
		end
		game.Players.PlayerAdded:Connect(function(newplr)
			if newplr.Name ~= LocalPlayer.Name and tbl.Toggle then
				DrawESP(newplr)
			end
		end)
	end
end)--]]




local effects = visuals:Sector('effects', "Right")

function UpdateWeapon()
	if not IsAlive(LocalPlayer) then return end
		for i,obj in pairs(Camera:GetChildren()) do
			if obj.Name ~= "Left Arm" or obj.Name ~= 'Right Arm' then
				Weapon = obj
			end
		end
	local selected = values.visuals.effects["weapon material"].Dropdown
	local ffanim = values.visuals.effects["weapon ff anim"].Dropdown
	for i,obj in pairs(Weapon:GetChildren()) do
		--if (not obj:IsA('Part') or not obj:IsA('MeshPart')) then return end
		if not obj:FindFirstChild('OldMaterial') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldMaterial'
			StringValue.Parent = obj
			StringValue.Value = obj.Material.Name
		end
		if not obj:FindFirstChild('OldTransparency') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldTransparency'
			StringValue.Parent = obj
			StringValue.Value = obj.Transparency
		end	
		if not obj:FindFirstChild('OldColor') then
			local StringValue = Instance.new('Color3Value')
			StringValue.Name = 'OldColor'
			StringValue.Parent = obj
			StringValue.Value = obj.Color
		end
		if not obj:FindFirstChild('OldReflectance') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldReflectance'
			StringValue.Parent = obj
			StringValue.Value = obj.Reflectance
		end
		if obj:IsA('MeshPart') and not obj:FindFirstChild('OldTextureID') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldTextureID'
			StringValue.Parent = obj
			StringValue.Value = obj.TextureID		
		end
		if obj:FindFirstChild("Mesh") and not obj.Mesh:FindFirstChild('OldVertex') then
			local e = Instance.new('Vector3Value',obj.Mesh)
			e.Name = 'OldVertex'
			e.Value = obj.Mesh.VertexColor
		end
		
		if values.visuals.effects["weapon chams"].Toggle then
			if obj:IsA("MeshPart") and selected == "ForceField" then 
				if ffanim == "nothing" then
					obj.TextureID = ""
				elseif ffanim == "skin" then

				elseif ffanim == "galaxy" then
					obj.TextureID = "rbxassetid://268022762"
				elseif ffanim == "weird" then
					obj.TextureID = "rbxassetid://1066669420"
				elseif ffanim == "cover" then
					obj.TextureID = "rbxassetid://5827121543"
				elseif ffanim == "light" then
					obj.TextureID = "rbxassetid://5826866653"
				elseif ffanim == "rought" then
					obj.TextureID = "rbxassetid://5834264212"
				elseif ffanim == "parts" then
					obj.TextureID = "rbxassetid://5917340153"
				elseif ffanim == "corrupted" then
					obj.TextureID = "rbxassetid://6187334802"
				elseif ffanim == "lines2" then
					obj.TextureID = "rbxassetid://9667524738"
				elseif ffanim == "lines" then
					obj.TextureID = "rbxassetid://5838417242"
				elseif ffanim == "scanning" then
					obj.TextureID = "rbxassetid://5843010904"
				elseif ffanim == "lava" then
					obj.TextureID = "rbxassetid://53883408"
				elseif ffanim == "pulse" then
					obj.TextureID = "rbxassetid://wtf"
				elseif ffanim == "web" then
					obj.TextureID = "rbxassetid://301464986"
				elseif ffanim == "swirl" then
					obj.TextureID = "rbxassetid://8133639623"
				elseif obj:IsA('MeshPart') and (selected == "Smooth" or selected == "Flat") then obj.TextureID = '' end
			end
			
if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") and not obj.Mesh:IsA('BlockMesh') then
	obj.Mesh.VertexColor = VectorRGB(values.visuals.effects["weapon chams"].Color)
	if selected == "Smooth" or selected == "Flat" then
		obj.Mesh.TextureId = ""
	end
end
			obj.Color = values.visuals.effects["weapon chams"].Color
			obj.Material = (selected == "Smooth" and "SmoothPlastic" or selected == "Flat" and "Neon" or selected == "ForceField" and "ForceField") or selected
			obj.Reflectance = values.visuals.effects["reflectance"].Slider/10
			obj.Transparency = values.visuals.effects["weapon chams"].Transparency
		else
			if obj:IsA("MeshPart") then 
				obj.TextureID = obj.OldTextureID.Value
			end
			if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") then
				obj.Mesh.VertexColor = obj.Mesh.OldVertex.Value
			end
			obj.Color = obj.OldColor.Value
			obj.Material = obj.OldMaterial.Value
			obj.Reflectance = obj.OldReflectance.Value
			obj.Transparency = obj.OldTransparency.Value			
		end
	end
end

function UpdateArms()
if not IsAlive(LocalPlayer) then return end
		for i,obj in pairs(Camera:GetChildren()) do
			if obj.Name == "Left Arm" then
				Weapon = obj
			end
		end
	local selected = values.visuals.effects["left arm material"].Dropdown
	local ffanim = values.visuals.effects["left arm ff anim"].Dropdown
	for i,obj in pairs(Weapon:GetChildren()) do
		--if (not obj:IsA('Part') or not obj:IsA('MeshPart')) then return end
		if not obj:FindFirstChild('OldMaterial') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldMaterial'
			StringValue.Parent = obj
			StringValue.Value = obj.Material.Name
		end
		if not obj:FindFirstChild('OldTransparency') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldTransparency'
			StringValue.Parent = obj
			StringValue.Value = obj.Transparency
		end	
		if not obj:FindFirstChild('OldColor') then
			local StringValue = Instance.new('Color3Value')
			StringValue.Name = 'OldColor'
			StringValue.Parent = obj
			StringValue.Value = obj.Color
		end
		if not obj:FindFirstChild('OldReflectance') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldReflectance'
			StringValue.Parent = obj
			StringValue.Value = obj.Reflectance
		end
		if obj:IsA('MeshPart') and not obj:FindFirstChild('OldTextureID') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldTextureID'
			StringValue.Parent = obj
			StringValue.Value = obj.TextureID		
		end
		if obj:FindFirstChild("Mesh") and not obj.Mesh:FindFirstChild('OldVertex') then
			local e = Instance.new('Vector3Value',obj.Mesh)
			e.Name = 'OldVertex'
			e.Value = obj.Mesh.VertexColor
		end
		
		if values.visuals.effects["left arm chams"].Toggle then
			if obj:IsA("MeshPart") and selected == "ForceField" then 
				if ffanim == "nothing" then
					obj.TextureID = ""
				elseif ffanim == "skin" then

				elseif ffanim == "galaxy" then
					obj.TextureID = "rbxassetid://268022762"
				elseif ffanim == "weird" then
					obj.TextureID = "rbxassetid://1066669420"
				elseif ffanim == "cover" then
					obj.TextureID = "rbxassetid://5827121543"
				elseif ffanim == "light" then
					obj.TextureID = "rbxassetid://5826866653"
				elseif ffanim == "rought" then
					obj.TextureID = "rbxassetid://5834264212"
				elseif ffanim == "parts" then
					obj.TextureID = "rbxassetid://5917340153"
				elseif ffanim == "corrupted" then
					obj.TextureID = "rbxassetid://6187334802"
				elseif ffanim == "lines2" then
					obj.TextureID = "rbxassetid://9667524738"
				elseif ffanim == "lines" then
					obj.TextureID = "rbxassetid://5838417242"
				elseif ffanim == "scanning" then
					obj.TextureID = "rbxassetid://5843010904"
				elseif ffanim == "lava" then
					obj.TextureID = "rbxassetid://53883408"
				elseif ffanim == "pulse" then
					obj.TextureID = "rbxassetid://wtf"
				elseif ffanim == "web" then
					obj.TextureID = "rbxassetid://301464986"
				elseif ffanim == "swirl" then
					obj.TextureID = "rbxassetid://8133639623"
				elseif obj:IsA('MeshPart') and (selected == "Smooth" or selected == "Flat") then obj.TextureID = '' end
			end
			
if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") and not obj.Mesh:IsA('BlockMesh') then
	obj.Mesh.VertexColor = VectorRGB(values.visuals.effects["left arm chams"].Color)
	if selected == "Smooth" or selected == "Flat" then
		obj.Mesh.TextureId = ""
	end
end
			obj.Color = values.visuals.effects["left arm chams"].Color
			obj.Material = (selected == "Smooth" and "SmoothPlastic" or selected == "Flat" and "Neon" or selected == "ForceField" and "ForceField") or selected
			obj.Reflectance = values.visuals.effects["left arm reflectance"].Slider/10
			obj.Transparency = values.visuals.effects["left arm chams"].Transparency
		else
			if obj:IsA("MeshPart") then 
				obj.TextureID = obj.OldTextureID.Value
			end
			if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") then
				obj.Mesh.VertexColor = obj.Mesh.OldVertex.Value
			end
			obj.Color = obj.OldColor.Value
			obj.Material = obj.OldMaterial.Value
			obj.Reflectance = obj.OldReflectance.Value
			obj.Transparency = obj.OldTransparency.Value			
		end
	end
	
	
	
	
	
	
	
		for i,obj in pairs(Camera:GetChildren()) do
			if obj.Name == "Right Arm" then
				Weapon = obj
			end
		end
	local selected = values.visuals.effects["right arm material"].Dropdown
	local ffanim = values.visuals.effects["right arm ff anim"].Dropdown
	for i,obj in pairs(Weapon:GetChildren()) do
		--if (not obj:IsA('Part') or not obj:IsA('MeshPart')) then return end
		if not obj:FindFirstChild('OldMaterial') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldMaterial'
			StringValue.Parent = obj
			StringValue.Value = obj.Material.Name
		end
		if not obj:FindFirstChild('OldTransparency') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldTransparency'
			StringValue.Parent = obj
			StringValue.Value = obj.Transparency
		end	
		if not obj:FindFirstChild('OldColor') then
			local StringValue = Instance.new('Color3Value')
			StringValue.Name = 'OldColor'
			StringValue.Parent = obj
			StringValue.Value = obj.Color
		end
		if not obj:FindFirstChild('OldReflectance') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldReflectance'
			StringValue.Parent = obj
			StringValue.Value = obj.Reflectance
		end
		if obj:IsA('MeshPart') and not obj:FindFirstChild('OldTextureID') then
			local StringValue = Instance.new('StringValue')
			StringValue.Name = 'OldTextureID'
			StringValue.Parent = obj
			StringValue.Value = obj.TextureID		
		end
		if obj:FindFirstChild("Mesh") and not obj.Mesh:FindFirstChild('OldVertex') then
			local e = Instance.new('Vector3Value',obj.Mesh)
			e.Name = 'OldVertex'
			e.Value = obj.Mesh.VertexColor
		end
		
		if values.visuals.effects["right arm chams"].Toggle then
			if obj:IsA("MeshPart") and selected == "ForceField" then 
				if ffanim == "nothing" then
					obj.TextureID = ""
				elseif ffanim == "skin" then

				elseif ffanim == "galaxy" then
					obj.TextureID = "rbxassetid://268022762"
				elseif ffanim == "weird" then
					obj.TextureID = "rbxassetid://1066669420"
				elseif ffanim == "cover" then
					obj.TextureID = "rbxassetid://5827121543"
				elseif ffanim == "light" then
					obj.TextureID = "rbxassetid://5826866653"
				elseif ffanim == "rought" then
					obj.TextureID = "rbxassetid://5834264212"
				elseif ffanim == "parts" then
					obj.TextureID = "rbxassetid://5917340153"
				elseif ffanim == "corrupted" then
					obj.TextureID = "rbxassetid://6187334802"
				elseif ffanim == "lines2" then
					obj.TextureID = "rbxassetid://9667524738"
				elseif ffanim == "lines" then
					obj.TextureID = "rbxassetid://5838417242"
				elseif ffanim == "scanning" then
					obj.TextureID = "rbxassetid://5843010904"
				elseif ffanim == "lava" then
					obj.TextureID = "rbxassetid://53883408"
				elseif ffanim == "pulse" then
					obj.TextureID = "rbxassetid://wtf"
				elseif ffanim == "web" then
					obj.TextureID = "rbxassetid://301464986"
				elseif ffanim == "swirl" then
					obj.TextureID = "rbxassetid://8133639623"
				elseif obj:IsA('MeshPart') and (selected == "Smooth" or selected == "Flat") then obj.TextureID = '' end
			end
			
if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") and not obj.Mesh:IsA('BlockMesh') then
	obj.Mesh.VertexColor = VectorRGB(values.visuals.effects["right arm chams"].Color)
	if selected == "Smooth" or selected == "Flat" then
		obj.Mesh.TextureId = ""
	end
end
			obj.Color = values.visuals.effects["right arm chams"].Color
			obj.Material = (selected == "Smooth" and "SmoothPlastic" or selected == "Flat" and "Neon" or selected == "ForceField" and "ForceField") or selected
			obj.Reflectance = values.visuals.effects["right arm reflectance"].Slider/10
			obj.Transparency = values.visuals.effects["right arm chams"].Transparency
		else
			if obj:IsA("MeshPart") then 
				obj.TextureID = obj.OldTextureID.Value
			end
			if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") then
				obj.Mesh.VertexColor = obj.Mesh.OldVertex.Value
			end
			obj.Color = obj.OldColor.Value
			obj.Material = obj.OldMaterial.Value
			obj.Reflectance = obj.OldReflectance.Value
			obj.Transparency = obj.OldTransparency.Value			
		end
	end	
	
	
	
end

effects:Element('ToggleColor','weapon chams', {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl)
	UpdateWeapon()
end)
effects:Element("Dropdown", "weapon material", {options = {"Smooth","Flat", "ForceField", "Glass"}}, function(tbl) 
	UpdateWeapon()
end)
effects:Element("Dropdown", "weapon ff anim", {options = {"nothing",'skin','galaxy','weird','cover','light','rought','parts','corrupted','lines2','lines','scanning','lava','pulse', 'web', 'swirl'}}, function(tbl)
	UpdateWeapon()
end)

effects:Element("Slider", "reflectance", {min = 0, max = 100, default = 0}, function(tbl) 
	UpdateWeapon()
end) 





effects:Element('ToggleColor','left arm chams', {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl)
	UpdateArms()
end)
effects:Element("Dropdown", "left arm material", {options = {"Smooth","Flat", "ForceField", "Glass"}}, function(tbl) 
	UpdateArms()
end)
effects:Element("Dropdown", "left arm ff anim", {options = {"nothing",'skin','galaxy','weird','cover','light','rought','parts','corrupted','lines2','lines','scanning','lava','pulse', 'web', 'swirl'}}, function(tbl)
	UpdateArms()
end)

effects:Element("Slider", "left arm reflectance", {min = 0, max = 100, default = 0}, function(tbl) 
	UpdateArms()
end) 




effects:Element('ToggleColor','right arm chams', {default = {Color = C.COL3RGB(255,255,255)}}, function(tbl)
	UpdateArms()
end)
effects:Element("Dropdown", "right arm material", {options = {"Smooth","Flat", "ForceField", "Glass"}}, function(tbl) 
	UpdateArms()
end)
effects:Element("Dropdown", "right arm ff anim", {options = {"nothing",'skin','galaxy','weird','cover','light','rought','parts','corrupted','lines2','lines','scanning','lava','pulse', 'web', 'swirl'}}, function(tbl)
	UpdateArms()
end)

effects:Element("Slider", "right arm reflectance", {min = 0, max = 100, default = 0}, function(tbl) 
	UpdateArms()
end) 

Camera.ChildAdded:Connect(function(obj)
	UpdateWeapon() 
	UpdateArms()
end)

		for i,obj in pairs(Camera:GetChildren()) do
			if obj.Name ~= "Left Arm" or obj.Name ~= 'Right Arm' then
				Weapon = obj
			end
		end
	
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

local Lighting = game:GetService("Lighting")
local OldBrightness = Lighting.Brightness
local OldAmbience = Lighting.Ambient

local ambientenabled = false
local fullbright = false
local world = visuals:Sector('world', 'Right')
world:Element('Toggle', 'Fullbright', {}, function(tbl)
	fullbright = tbl.Toggle
end)
--world:Element('Toggle', 'Disco mode')
world:Element('ToggleColor','Ambient', {}, function(tbl)
	ambientenabled = tbl.Toggle
end)

    Lighting:GetPropertyChangedSignal("Brightness"):Connect(function(v)
        if fullbright then
            Lighting.Brightness = 1000
            Lighting.GlobalShadows=false
        else
            Lighting.Brightness = OldBrightness
            Lighting.GlobalShadows=true
        end
    end)

do
   for i,v in pairs(getgc(true)) do
       if (type(v) == "table") then
            if (rawget(v, "getbodyparts")) then
                client.replication = v
                client.replication.bodyparts = debug.getupvalue(client.replication.getbodyparts, 1)
           end
       end
   end
end

game:GetService("RunService").RenderStepped:Connect(function()
   for i,v in pairs(game.Players:GetPlayers()) do
       if (v and client.replication.bodyparts[v]) then
           local char = client.replication.bodyparts[v]
           char.head.Parent.Name = v.Name
           v.Character = char.head.Parent
       end
   end
end)










-----------------------------------------------MISC TAB-------------------------------------------

local allcfgs = {} 

for _,cfg in pairs(listfiles('SamuelPaste_pf/cfgs')) do 
	local cfgname = C.GSUB(cfg, 'SamuelPaste_pf/cfgs\\', "") 
	C.INSERT(allcfgs, cfgname) 
end

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

for _,cfg in pairs(listfiles('SamuelPaste_pf/cfgs')) do 
	local cfgname = C.GSUB(cfg, 'SamuelPaste_pf/cfgs\\', "") 
	C.INSERT(allcfgs, cfgname) 
end
	ConfigUpdateCfgList2:Fire()
	ConfigUpdateCfgList:Fire()
end)
configs:Element("Button", 'overwrite cfgs from old folder', {}, function()
	--[[for _,cfg in pairs(listfiles("pastedstormy/pastedstormycfgs")) do 
		local cfgname = GSUB(cfg, "pastedstormy/pastedstormycfgs\\", "") 
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
			W.Position = UDIM2(0.488053292, 0, 0.728395104, 0)
			W.Size = UDIM2(0, 29, 0, 28)
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
			_.Position = UDIM2(0.488053292, 0, 0.728395104, 0)
			_.Size = UDIM2(0, 29, 0, 28)
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
			A.Position = UDIM2(0.453584045, 0, 0.777777791, 0)
			A.Size = UDIM2(0, 29, 0, 28)
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
			_2.Position = UDIM2(0.453584045, 0, 0.777777791, 0)
			_2.Size = UDIM2(0, 29, 0, 28)
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
			S.Position = UDIM2(0.488053292, 0, 0.777777791, 0)
			S.Size = UDIM2(0, 29, 0, 28)
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
			_3.Position = UDIM2(0.488053292, 0, 0.777777791, 0)
			_3.Size = UDIM2(0, 29, 0, 28)
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
			D.Position = UDIM2(0.522522688, 0, 0.777777791, 0)
			D.Size = UDIM2(0, 29, 0, 28)
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
			_4.Position = UDIM2(0.522522688, 0, 0.777777791, 0)
			_4.Size = UDIM2(0, 29, 0, 28)
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
			E.Position = UDIM2(0.453584045, 0, 0.728395045, 0)
			E.Size = UDIM2(0, 29, 0, 28)
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
			_5.Position = UDIM2(0.453584045, 0, 0.728395045, 0)
			_5.Size = UDIM2(0, 29, 0, 28)
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
			R.Position = UDIM2(0.522522688, 0, 0.728395045, 0)
			R.Size = UDIM2(0, 29, 0, 28)
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
			_6.Position = UDIM2(0.522522688, 0, 0.728395045, 0)
			_6.Size = UDIM2(0, 29, 0, 28)
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

for i,v in pairs(animations) do
   if v.player then 
        local old_player = v.player
        v.player = function(a, b)
            if client.char.alive and client.gamelogic.currentgun and values.misc['Weapon mods']['no anims'].Toggle then
                if client.gamelogic.currentgun.type ~= "KNIFE" then
                    for i,v in pairs(client.gamelogic.currentgun.data.animations) do
                        if b == v then
                            return function() end
                        end
                    end
                end
            end
            return old_player(a,b)
        end
    end
end

local weapons = misc:Sector("Weapon mods", 'Right')
--weapons:Element('Label',"TO MAKE IT WORK U HAVE TO REEQUIP OR RESPAWN")
weapons:Element('Toggle','no anims')
weapons:Element('Toggle','no gun bob')
weapons:Element('Toggle','Spread modification')
weapons:Element('Slider','Spread modifier', {min = 0, max = 1000, default = 1000})
weapons:Element('Toggle','Recoil modifier')
weapons:Element('Toggle','Custom reload speed')
weapons:Element('Toggle','Inf amount of ammo')
--weapons:Element('Toggle','Custom firerate')

weapons:Element('Slider','Recoil modifier ', {min = 0, max = 100, default = 0})
weapons:Element('Slider','Reload speed modifier', {min = 0, max = 1000, default = 1000})
--weapons:Element('Slider','Firerate modifier', {min = 0, max = 2000, default = 2000})


local other = misc:Sector('Client', 'Right')

other:Element('Toggle', 'Knife aura')
other:Element('Slider', 'Distance', {min = 1, max = 50})
other:Element('Toggle', 'Held only')

other:Element('Toggle','Custom walkspeed')
other:Element('Slider', 'Walkspeed modifier', {min = 10,max = 70})
other:Element('Toggle','Custom jump power')
other:Element('Slider', 'Jump power modifier', {min = 2,max = 80})

other:Element('Toggle','No fall damage')
other:Element('Toggle','Hitbox extender')
other:Element('Slider','Hitbox extender modifier', {min = 0, max = 5})

--other:Element('Toggle','GrenadeTP')
--other:Element('Slider','Blow up time (ms)', {min = 0, max = 2500})

    function closest()
        local Distance = math.huge
        local Closest
        local Bodyparts
        local AimPart
        local RealMouseLocation = UserInputService:GetMouseLocation()
        local Pos, OnScreen = nil, nil
        local Autowallable = false 
        local inFOV = false 
        for i,v in pairs(Players:GetPlayers()) do
            if (v ~= LocalPlayer) and (v.Team ~= LocalPlayer.Team) and client.replication.bodyparts[v] and client.replication.bodyparts[v].head then
                Bodyparts = client.replication.bodyparts[v]
                -- Bulletcheck arguments : Origin, Target, Trajectory, Acceleration, Penetration Depth 
                local Pos2, OnScreen2 = Camera:WorldToScreenPoint(Bodyparts.head.Position)
                local Dist = (Vector2.new(Pos2.X, Pos2.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude
                if Dist < Distance then
                    AimPart = Bodyparts['head']
                    Distance = Dist
                    Closest = v
                    inFOV = true 
                    Pos, OnScreen = Pos2, OnScreen2
                end
            end
        end
        return {Closest = Closest, OnScreen = OnScreen, Part = AimPart, InFOV = inFOV}
    end

    local oldsend = client.network.send
    equipped = 1
    client.network.send = function(self, name, ...)
        if name == "falldamage" and values.misc.Client['No fall damage'].Toggle then
				sex = {...}
				sex[1] = 0.0000000001
		end
        
        if name == "equip" then 
            equipped = ...
        end
        
 --[[       if name == "newgrenade" and values.misc.Client.GrenadeTP.Toggle then
            local args = {...}
            if args[2].blowuptime then args[2].blowuptime = values.misc.Client['Blow up time (ms)'].Slider end
            local ClosestPlayer = closest()
            if not ClosestPlayer or not ClosestPlayer.Closest or not ClosestPlayer.Part then return old(self, data, ...) end
            for i,v in pairs(args[2].frames) do
                if v ~= args[2].frames[1] then
                    if ClosestPlayer.OnScreen then
                        if v.p0 then
                            v.p0 = ClosestPlayer.Part.Position
                        end
                    end
                end
            end
        end--]]
        return oldsend(self, name, ...)
    end

    RunService:BindToRenderStep("Misc", 1, function()
        if values.misc.Client['Hitbox extender'].Toggle then
            for i,v in pairs(Players:GetPlayers()) do
                if IsAlive(v) and client.replication.bodyparts[v] and client.replication.bodyparts[v].head and client.char.alive then
                    local bp = client.replication.bodyparts[v]
                    local hbv = values.misc.Client['Hitbox extender modifier'].Slider
                    bp.head.Size = Vector3.new(hbv,hbv,hbv)
                    bp.torso.Size = Vector3.new(hbv,hbv,hbv)
                    bp.lleg.Size = Vector3.new(hbv,hbv,hbv)
                    bp.rleg.Size = Vector3.new(hbv,hbv,hbv)
                    bp.larm.Size = Vector3.new(hbv,hbv,hbv)
                    bp.rarm.Size = Vector3.new(hbv,hbv,hbv)
                end
            end
        end 

        if values.misc.Client['Custom walkspeed'].Toggle then
            client.char:setbasewalkspeed(values.misc.Client['Walkspeed modifier'].Slider)
        else
			client.char:setbasewalkspeed(16)
		end
        if not ambientenabled and fullbright then
            Lighting.Ambient = Color3.fromRGB(255,255,255)
            Lighting.Brightness = 1000
        end
        if fullbright then
            Lighting.Brightness = 1000
            Lighting.Ambient = Color3.fromRGB(255,255,255)
        end
        if not fullbright and ambientenabled then
            Lighting.Ambient = values.visuals.world.Ambient.Color
        elseif not fullbright and not ambientenabled then
            Lighting.Ambient = OldAmbience
        end
        if ambientenabled then
            Lighting.Ambient = values.visuals.world.Ambient.Color 
        end
        
        if values.misc.Client['Knife aura'].Toggle and client.char.alive then
            if values.misc.Client['Held only'].Toggle then
                if client.gamelogic.currentgun.type ~= "KNIFE" then
                    return
                end
            end
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
                    if IsAlive(v) and client.replication.bodyparts[v] then
                        local Closest 
                        local Distance = values.misc.Client.Distance.Slider
                        local Dist = (client.replication.bodyparts[v].head.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Dist < Distance then
                            Dist = Distance
                            oldsend(client.network, "equip", 3)
							oldsend(client.network, "stab")
							task.wait(0.2)-- thx iray for telling me this
							table.foreach(client.replication.bodyparts[v],print)
                            client.network:send("knifehit", client.replication.getplayerhit(client.replication.bodyparts[v].head), "Head")
                            client.network:send("equip", equipped) 
                        end
                    end
                end
            end
        end
        --[[if SpaceDown and client.char.alive and library.flags.BunnyHop then
            client.char:setbasewalkspeed(library.flags.BunnyHopSpeed)
            client.char:jump(4)
        elseif not SpaceDown and client.char.alive and not library.flags.WalkspeedOn then
            client.char:setbasewalkspeed(12)
        end--]]
    end)
	
    local oldjump = client.char.jump
    client.char.jump = function(tbl, jp)
        if values.misc.Client['Custom jump power'].Toggle then
            return oldjump(tbl, values.misc.Client['Jump power modifier'].Slider)
        end
        return oldjump(tbl, jp)
    end
--[[weapons:Element('Toggle','no anims')
weapons:Element('Toggle','no gun bob')
weapons:Element('Toggle','Spread modification')
weapons:Element('Slider','Spread modifier', {min = 0, max = 1000, default = 1000})
weapons:Element('Toggle','Enable recoil')
weapons:Element('Toggle','Custom reload speed')
weapons:Element('Toggle','Custom firerate')

weapons:Element('Slider','Recoil modifier', {min = 0, max = 1000, default = 1000})
weapons:Element('Slider','Reload speed modifier', {min = 0, max = 1000, default = 1000})
weapons:Element('Slider','Firerate modifier', {min = 0, max = 2000, default = 2000})--]]
function SolveVector3(Vector)
    if values.misc['Weapon mods']['Recoil modifier '].Slider == 0 then
        return Vector3.new(0,0,0)
    else
        return Vector * values.misc['Weapon mods']['Recoil modifier '].Slider
    end
end 


for i,v in pairs(getgc(true)) do
    if type(v) == "function"then
        local name =  getinfo(v).name
        if name == "loadgun" then
            loadgun = v
        end
    end
    if loadgun then break end
end


    local oldmodifiedgundata = debug.getupvalue(loadgun,1)
    debug.setupvalue(loadgun,1,function(arg1,arg2,arg3)
		setreadonly(arg1,false)
		v1 = arg1

        --[[if values.misc['Weapon mods']['Custom firerate'].Toggle then
            if type(retv.firecap) == 'number' then
                retv.firecap = retv.firecap + values.misc['Weapon mods']['Firerate modifier'].Slider
            end
        end--]]
        if values.misc['Weapon mods']['Recoil modifier'].Toggle then

            v1.rotkickmin = SolveVector3(v1.rotkickmin)
            v1.rotkickmax = SolveVector3(v1.rotkickmax)
            v1.transkickmin = SolveVector3(v1.transkickmin)
            v1.transkickmax = SolveVector3(v1.transkickmax)
			
            --v1.camkickmin = SolveVector3(v1.camkickmin)
            --v1.camkickmax = SolveVector3(v1.camkickmax)
            v1.camkickspeed = 0;
            
			v1.aimrotkickmin = SolveVector3(v1.aimrotkickmin)
            v1.aimrotkickmax = SolveVector3(v1.aimrotkickmax)
            v1.aimtranskickmin = SolveVector3(v1.aimtranskickmin)
            v1.aimtranskickmax = SolveVector3(v1.aimtranskickmax)
            v1.aimcamkickmin = SolveVector3(v1.aimcamkickmin)
            v1.aimcamkickmax = SolveVector3(v1.aimcamkickmax)
            --v1.aimcamkickspeed = 0;
            --v1.modelkickspeed = 0;
            --v1.modelrecoverspeed = 0;
            --v1.modelkickdamper = 0.0;
            --v1.aimkickmult = 0.0;

        end
		if values.misc['Weapon mods']['Inf amount of ammo'].Toggle then
			v1.magsize = 99999999999999999999999
			v1.sparerounds = 99999999999999999999
		end		
        if values.misc['Weapon mods']['Spread modification'].Toggle then
			v1.hipfirespread = v1.hipfirespread * values.misc['Weapon mods']['Spread modifier'].Slider;
			v1.hipfirestability = v1.hipfirestability * values.misc['Weapon mods']['Spread modifier'].Slider;
            v1.hipfirespreadrecover = v1.hipfirespreadrecover * values.misc['Weapon mods']['Spread modifier'].Slider;
        end
        if values.misc['Weapon mods']['Custom reload speed'].Toggle then
            local anim = v1.animations
            if anim.tacticalreload then
                v1.animations.tacticalreload.resettime = values.misc['Weapon mods']['Reload speed modifier'].Slider
                v1.animations.tacticalreload.stdtimescale = values.misc['Weapon mods']['Reload speed modifier'].Slider
                v1.animations.tacticalreload.timescale = values.misc['Weapon mods']['Reload speed modifier'].Slider
            elseif anim.reload then
                v1.animations.reload.resettime = values.misc['Weapon mods']['Reload speed modifier'].Slider
                v1.animations.reload.stdtimescale = values.misc['Weapon mods']['Reload speed modifier'].Slider
                v1.animations.reload.timescale = values.misc['Weapon mods']['Reload speed modifier'].Slider
            elseif anim.pullbolt then
                v1.animations.pullbolt.stdtimescale = values.misc['Weapon mods']['Reload speed modifier'].Slider
                v1.animations.pullbolt.timescale = values.misc['Weapon mods']['Reload speed modifier'].Slider
                v1.animations.pullbolt.resettime = values.misc['Weapon mods']['Reload speed modifier'].Slider
            end
        end
        return oldmodifiedgundata(arg1,arg2,arg3)
    end)
    local gunbob = debug.getupvalue(loadgun, 58)
    debug.setupvalue(loadgun, 57, function(...)
        if values.misc['Weapon mods']['no gun bob'].Toggle then 
            return CFrame.new()
        end
        return gunbob(...)
    end)







do
	local radio = other123123:Sector('Radio','Left')
	radio:Element('TextBox', 'music',{placeholder = 'ID or path',NoLimit = true})
	radio:Element('Dropdown','type',{options = {'Roblox ID','workspace mp3'}})
	local function ValidateSong(songID) 
		if not songID or not tonumber(songID) then return false end

		local success, result = pcall(function()
			return game.MarketplaceService:GetProductInfo(songID)
		end)

		if success and result and result.AssetTypeId == 3 then
			return true
		else
			return false
		end
	end
	radio:Element('Slider','Volume', {min = 0,max = 10}, function(tbl)
		if getgenv().RadioSound then
			RadioSound.Volume = tbl.Slider/10
		end
	end)
	radio:Element('Button2','Play (resets audio)',{}, function()
		
		if values.other.Radio.type.Dropdown == 'Roblox ID' then
			if ValidateSong(values.other.Radio.music.Text) == true then
				if getgenv().RadioSound ~= nil then
					RadioSound:Stop()
					getgenv().RadioSound:Destroy()
					getgenv().RadioSound = nil
				end
				getgenv().RadioSound = Instance.new('Sound',workspace)
				RadioSound.Volume = values.other.Radio.Volume.Slider/10
				RadioSound.SoundId = "rbxassetid://"..values.other.Radio.music.Text
				RadioSound:Play()
			else return error('Wrong id or path!') end
		else
			getAsset = getsynasset or getcustomasset
			if not isfile(values.other.Radio.music.Text) then
				return error('Wrong id or path!')
			end
			if getgenv().RadioSound then
				getgenv().RadioSound:Destroy()
				getgenv().RadioSound = nil
			end
			getgenv().RadioSound = Instance.new('Sound',workspace)
			RadioSound.Volume = values.other.Radio.Volume.Slider/10
			RadioSound.SoundId = getAsset(values.other.Radio.music.Text)
			RadioSound:Play()			
		end
	end)
	radio:Element('Button2','Pause',nil,function()
		if RadioSound then
			RadioSound:Pause()
		end
	end)
	radio:Element('Button2','Resume',nil,function()
		if RadioSound then
			RadioSound:Resume()
		end
	end)	
	radio:Element('Button2','Stop (reset audio)',nil,function()
		if RadioSound then
			RadioSound:Stop()
		end
	end)	
	radio:Element('Toggle','Loop',nil,function(tbl)
		if RadioSound then
			RadioSound.Looped = tbl.Toggle
		end
	end)
	do
		local dvd = other:Sector('DVD Logo','Left')
		
		local ScreenGui = Instance.new("ScreenGui")
		local ImageLabel = Instance.new("ImageLabel")

		--Properties:

		ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		ScreenGui.Name = 'dvd logo'
		ScreenGui.Enabled = false

		ImageLabel.Parent = ScreenGui
		ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.Position = UDim2.new(0.187000006, 0, 0.270999998, 0)
		ImageLabel.Size = UDim2.new(0, 187, 0, 83)
		ImageLabel.Image = "rbxassetid://10789990891"
		ImageLabel.SliceScale = 3.000

		-- Scripts:

		local function JVMZPQB_fake_script() -- ImageLabel.LocalScript 
			local script = Instance.new('LocalScript', ImageLabel)

			--script.Parent.Position = UDim2.new(0,math.random(10,script.Parent.Parent.AbsoluteSize.X),0,math.random(10,script.Parent.Parent.AbsoluteSize.Y))
			
			--print('check')
			
			getgenv().YSpeed = 5
			getgenv().XSpeed = 5
			
			getgenv().changecolor = false
			
			game:GetService('RunService').RenderStepped:Connect(function()
				local ScreenSize = script.Parent.Parent.AbsoluteSize
				
				script.Parent.Position += UDim2.new(0,getgenv().XSpeed,0,getgenv().YSpeed)
				--print(script.Parent.AbsolutePosition)
				if (script.Parent.AbsolutePosition.X >= ScreenSize.X or script.Parent.AbsolutePosition.X <= 0) or ((script.Parent.AbsolutePosition.X + script.Parent.AbsoluteSize.X) >= ScreenSize.X or (script.Parent.AbsolutePosition.X + script.Parent.AbsoluteSize.X) <= 0) then
					getgenv().XSpeed = getgenv().XSpeed * -1
					--print('X')
					if getgenv().changecolor then
						script.Parent.ImageColor3 = Color3.fromHSV(tick() % 1/1,1,1)
					end
				end
				if (script.Parent.AbsolutePosition.Y >= ScreenSize.Y or script.Parent.AbsolutePosition.Y <= 0) or ((script.Parent.AbsolutePosition.Y + script.Parent.AbsoluteSize.Y) >= ScreenSize.Y or (script.Parent.AbsolutePosition.Y + script.Parent.AbsoluteSize.Y) <= 0) then
					getgenv().YSpeed = getgenv().YSpeed * -1
					if getgenv().changecolor then
						script.Parent.ImageColor3 = Color3.fromHSV(tick() % 1/1,1,1)
					end
				end
			end)
		end
		coroutine.wrap(JVMZPQB_fake_script)()
		
		dvd:Element('ToggleColor','Enable',{},function(tbl)
			ScreenGui.Enabled = tbl.Toggle
			ScreenGui.ImageLabel.ImageColor3 = tbl.Color
		end)
		dvd:Element('Toggle','Change color when screen edge touched',{},function(tbl)
			getgenv().changecolor = tbl.Toggle
			--ScreenGui.ImageLabel.ImageColor3 = tbl.Color
		end)		
		dvd:Element("Slider",'Speed',{min = 1,max = 20,default = 10},function(tbl)
			if getgenv().YSpeed <= 0 then
				getgenv().YSpeed = tbl.Slider * -1
			else
				getgenv().YSpeed = tbl.Slider
			end
			if getgenv().XSpeed <= 0 then
				getgenv().XSpeed = tbl.Slider * -1
			else
				getgenv().XSpeed = tbl.Slider
			end			
		end)
	end
end














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
						--game:GetService("CoreGui")["fl indicator"].wgrgerqgerq.gradins.BackgroundColor3 = tbl.Color
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
						--game:GetService("CoreGui")["fl indicator"].wgrgerqgerq.gradins.BackgroundColor3 = MainUIColor
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