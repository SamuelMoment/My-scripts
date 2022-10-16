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

local library,Signal,ConfigLoad,ConfigLoad1,ConfigUpdateCfgList,ConfigUpdateCfgList2,CreateHitElement = loadstring(game:HttpGet("https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/library.lua"))()
library.setcfglocation(cfglocation)


	CreateHitElement(" Welcome, "..LocalPlayer.Name.."!",MainUIColor,5, 340, 22)

 
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
local gui = library.New("SamuelPaste")
local legit = gui.Tab('legit')
local rage = gui.Tab('rage')
local visuals = gui.Tab('visuals')
local misc = gui.Tab('misc')
local other123123 = gui.Tab('other')




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
other:Element('Slider', 'Distance', {min = 1, max = 30})
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

local defaultSettings = {
	pretty = false;
	robloxFullName = false;
	robloxProperFullName = true;
	robloxClassName = true;
	tabs = false;
	semicolons = false;
	spaces = 3;
	sortKeys = true;
}

-- lua keywords
local keywords = {["and"]=true, ["break"]=true, ["do"]=true, ["else"]=true,
["elseif"]=true, ["end"]=true, ["false"]=true, ["for"]=true, ["function"]=true,
["if"]=true, ["in"]=true, ["local"]=true, ["nil"]=true, ["not"]=true, ["or"]=true,
["repeat"]=true, ["return"]=true, ["then"]=true, ["true"]=true, ["until"]=true, ["while"]=true}

local function isLuaIdentifier(str)
	if type(str) ~= "string" then return false end
	-- must be nonempty
	if str:len() == 0 then return false end
	-- can only contain a-z, A-Z, 0-9 and underscore
	if str:find("[^%d%a_]") then return false end
	-- cannot begin with digit
	if tonumber(str:sub(1, 1)) then return false end
	-- cannot be keyword
	if keywords[str] then return false end
	return true
end

-- works like Instance:GetFullName(), but invalid Lua identifiers are fixed (e.g. workspace["The Dude"].Humanoid)
local function properFullName(object, usePeriod)
	if object == nil or object == game then return "" end
	
	local s = object.Name
	local usePeriod = true
	if not isLuaIdentifier(s) then
		s = ("[%q]"):format(s)
		usePeriod = false
	end
	
	if not object.Parent or object.Parent == game then
		return s
	else
		return properFullName(object.Parent) .. (usePeriod and "." or "") .. s 
	end
end

local depth = 0
local shown
local INDENT
local reprSettings
local function DebugCheck(s,s2)

local success,err = pcall(function() return s[s2] end)

return success

end
local function DebugRepr(value, reprSettings)
	reprSettings = reprSettings or defaultSettings
	INDENT = (" "):rep(reprSettings.spaces or defaultSettings.spaces)
	if reprSettings.tabs then
		INDENT = "\t"
	end
	
	local v = value --args[1]
	local tabs = INDENT:rep(depth)
	
	if depth == 0 then
		shown = {}
	end
	if type(v) == "string" then
		return ("%q"):format(v)
	elseif type(v) == "number" then
		if v == math.huge then return "math.huge" end
		if v == -math.huge then return "-math.huge" end
		return tonumber(v)
	elseif type(v) == "boolean" then
		return tostring(v)
	elseif type(v) == "nil" then
		return "nil"
	elseif type(v) == "table" and type(v.__tostring) == "function" then
		return tostring(v.__tostring(v))
	elseif type(v) == "table" and getmetatable(v) and type(getmetatable(v).__tostring) == "function" then
		return tostring(getmetatable(v).__tostring(v))
	elseif type(v) == "table" then
		if shown[v] then return "{CYCLIC}" end
		shown[v] = true
		local str = "{" .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or "")
		local isArray = true
		for k, v in pairs(v) do
			if type(k) ~= "number" then
				isArray = false
				break
			end
		end
		if isArray then
			for i = 1, #v do
				if i ~= 1 then
					str = str .. (reprSettings.semicolons and ";" or ",") .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or " ")
				end
				depth = depth + 1
				str = str .. DebugRepr(v[i], reprSettings)
				depth = depth - 1
			end
		else
			local keyOrder = {}
			local keyValueStrings = {}
			for k, v in pairs(v) do
				depth = depth + 1
				local kStr = isLuaIdentifier(k) and k or ("[" .. DebugRepr(k, reprSettings) .. "]")
				local vStr = DebugRepr(v, reprSettings)
				--[[str = str .. ("%s = %s"):format(
					isLuaIdentifier(k) and k or ("[" .. DebugRepr(k, reprSettings) .. "]"),
					DebugRepr(v, reprSettings)
				)]]
				table.insert(keyOrder, kStr)
				keyValueStrings[kStr] = vStr
				depth = depth - 1
			end
			if reprSettings.sortKeys then table.sort(keyOrder) end
			local first = true
			for _, kStr in pairs(keyOrder) do
				if not first then
					str = str .. (reprSettings.semicolons and ";" or ",") .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or " ")
				end
				str = str .. ("%s = %s"):format(kStr, keyValueStrings[kStr])
				first = false
			end
		end
		shown[v] = false
		if reprSettings.pretty then
			str = str .. "\n" .. tabs
		end
		str = str .. "}"
		return str
	elseif typeof then
		-- Check Roblox types
		if typeof(v) == "Instance" then
			return  (reprSettings.robloxFullName
				and (reprSettings.robloxProperFullName and properFullName(v) or v:GetFullName())
			 or v.Name) .. (reprSettings.robloxClassName and ((" (%s)"):format(v.ClassName)) or "")
		elseif typeof(v) == "Axes" then
			local s = {}
			if v.X then table.insert(s, DebugRepr(Enum.Axis.X, reprSettings)) end
			if v.Y then table.insert(s, DebugRepr(Enum.Axis.Y, reprSettings)) end
			if v.Z then table.insert(s, DebugRepr(Enum.Axis.Z, reprSettings)) end
			return ("Axes.new(%s)"):format(table.concat(s, ", "))
		elseif typeof(v) == "BrickColor" then
			return ("BrickColor.new(%q)"):format(v.Name)
		elseif typeof(v) == "CFrame" then
			return ("CFrame.new(%s)"):format(table.concat({v:GetComponents()}, ", "))
		elseif typeof(v) == "Color3" then
			return ("Color3.new(%d, %d, %d)"):format(v.r, v.g, v.b)
		elseif typeof(v) == "ColorSequence" then
			if #v.Keypoints > 2 then
				return ("ColorSequence.new(%s)"):format(DebugRepr(v.Keypoints, reprSettings))
			else
				if v.Keypoints[1].Value == v.Keypoints[2].Value then
					return ("ColorSequence.new(%s)"):format(DebugRepr(v.Keypoints[1].Value, reprSettings))
				else
					return ("ColorSequence.new(%s, %s)"):format(
						DebugRepr(v.Keypoints[1].Value, reprSettings),
						DebugRepr(v.Keypoints[2].Value, reprSettings)
					)
				end
			end
		elseif typeof(v) == "ColorSequenceKeypoint" then
			return ("ColorSequenceKeypoint.new(%d, %s)"):format(v.Time, DebugRepr(v.Value, reprSettings))
		elseif typeof(v) == "DockWidgetPluginGuiInfo" then
			return ("DockWidgetPluginGuiInfo.new(%s, %s, %s, %s, %s, %s, %s)"):format(
				DebugRepr(v.InitialDockState, reprSettings),
				DebugRepr(v.InitialEnabled, reprSettings),
				DebugRepr(v.InitialEnabledShouldOverrideRestore, reprSettings),
				DebugRepr(v.FloatingXSize, reprSettings),
				DebugRepr(v.FloatingYSize, reprSettings),
				DebugRepr(v.MinWidth, reprSettings),
				DebugRepr(v.MinHeight, reprSettings)
			)
		elseif typeof(v) == "Enums" then
			return "Enums"
		elseif typeof(v) == "Enum" then
			return ("Enum.%s"):format(tostring(v))
		elseif typeof(v) == "EnumItem" then
			return ("Enum.%s.%s"):format(tostring(v.EnumType), v.Name)
		elseif typeof(v) == "Faces" then
			local s = {}
			for _, enumItem in pairs(Enum.NormalId:GetEnumItems()) do
				if v[enumItem.Name] then
					table.insert(s, DebugRepr(enumItem, reprSettings))
				end
			end
			return ("Faces.new(%s)"):format(table.concat(s, ", "))
		elseif typeof(v) == "NumberRange" then
			if v.Min == v.Max then
				return ("NumberRange.new(%d)"):format(v.Min)
			else
				return ("NumberRange.new(%d, %d)"):format(v.Min, v.Max)
			end
		elseif typeof(v) == "NumberSequence" then
			if #v.Keypoints > 2 then
				return ("NumberSequence.new(%s)"):format(DebugRepr(v.Keypoints, reprSettings))
			else
				if v.Keypoints[1].Value == v.Keypoints[2].Value then
					return ("NumberSequence.new(%d)"):format(v.Keypoints[1].Value)
				else
					return ("NumberSequence.new(%d, %d)"):format(v.Keypoints[1].Value, v.Keypoints[2].Value)
				end
			end
		elseif typeof(v) == "NumberSequenceKeypoint" then
			if v.Envelope ~= 0 then
				return ("NumberSequenceKeypoint.new(%d, %d, %d)"):format(v.Time, v.Value, v.Envelope)
			else
				return ("NumberSequenceKeypoint.new(%d, %d)"):format(v.Time, v.Value)
			end
		elseif typeof(v) == "PathWaypoint" then
			return ("PathWaypoint.new(%s, %s)"):format(
				DebugRepr(v.Position, reprSettings),
				DebugRepr(v.Action, reprSettings)
			)
		elseif typeof(v) == "PhysicalProperties" then
			return ("PhysicalProperties.new(%d, %d, %d, %d, %d)"):format(
				v.Density, v.Friction, v.Elasticity, v.FrictionWeight, v.ElasticityWeight
			)
		elseif typeof(v) == "Random" then
			return "<Random>"
		elseif typeof(v) == "Ray" then
			return ("Ray.new(%s, %s)"):format(
				DebugRepr(v.Origin, reprSettings),
				DebugRepr(v.Direction, reprSettings)
			)
		elseif typeof(v) == "RBXScriptConnection" then
			return "<RBXScriptConnection>"
		elseif typeof(v) == "RBXScriptSignal" then
			return "<RBXScriptSignal>"
		elseif typeof(v) == "Rect" then
			return ("Rect.new(%d, %d, %d, %d)"):format(
				v.Min.X, v.Min.Y, v.Max.X, v.Max.Y
			)
		elseif typeof(v) == "Region3" then
			local min = v.CFrame.p + v.Size * -.5
			local max = v.CFrame.p + v.Size * .5
			return ("Region3.new(%s, %s)"):format(
				DebugRepr(min, reprSettings),
				DebugRepr(max, reprSettings)
			)
		elseif typeof(v) == "Region3int16" then
			return ("Region3int16.new(%s, %s)"):format(
				DebugRepr(v.Min, reprSettings),
				DebugRepr(v.Max, reprSettings)
			)
		elseif typeof(v) == "TweenInfo" then
			return ("TweenInfo.new(%d, %s, %s, %d, %s, %d)"):format(
				v.Time, DebugRepr(v.EasingStyle, reprSettings), DebugRepr(v.EasingDirection, reprSettings),
				v.RepeatCount, DebugRepr(v.Reverses, reprSettings), v.DelayTime
			)
		elseif typeof(v) == "UDim" then
			return ("UDim.new(%d, %d)"):format(
				v.Scale, v.Offset
			)
		elseif typeof(v) == "UDim2" then
			return ("UDim2.new(%d, %d, %d, %d)"):format(
				v.X.Scale, v.X.Offset, v.Y.Scale, v.Y.Offset
			)
		elseif typeof(v) == "Vector2" then
			return ("Vector2.new(%d, %d"):format(v.X, v.Y)
		elseif typeof(v) == "Vector2int16" then
			return ("Vector2int16.new(%d, %d)"):format(v.X, v.Y)
		elseif typeof(v) == "Vector3" then
			return ("Vector3.new(%d, %d, %d)"):format(v.X, v.Y, v.Z)
		elseif typeof(v) == "Vector3int16" then
			return ("Vector3int16.new(%d, %d, %d)"):format(v.X, v.Y, v.Z)
		else
			return "<Roblox:" .. typeof(v) .. ">"
		end
	else
		return "<" .. type(v) .. ">"
	end
end

--values.other['Debug stuff']['Blacklist signals'].Jumbobox values.other['Debug stuff']['Logging type'].Dropdown (File,Console)
function debugging(name,...)
    if table.find(values.other['Debug stuff']['Blacklist signals'].Jumbobox,name) then return end
	stuff = ''
    local args = {...}
    for i,v in pairs(args) do
        s12312331 = ''
        if typeof(v) == 'Vector3' then
            s12312331 = 'Vector3.new('..v.X..','..v.Y..','..v.Z..')'..(i == #args and '' or ',')
        elseif typeof(v) == 'table' then
            s12312331 = 'table: '..DebugRepr(v)..(i == #args and '' or ',')
        elseif typeof(v) == 'Vector2' then
			s12312331 = 'Vector2.new('..v.X..','..v.Y..')'..','
		elseif typeof(v) == 'boolean' then
			s12312331 = v and 'true' or 'false'..(i == #args and '' or ',')
		elseif typeof(v) == 'Instance' then
			local tbl = {
				Name = v.Name,
				Parent = v.Parent.Name,
				Position = (DebugCheck(v,'Position') == true and v.Position or 'nil'),
				CFrame = (DebugCheck(v,'CFrame') == true and v.CFrame or 'nil'),
				ClassName = v.ClassName,
			}
			s12312331 = 'instance: '..DebugRepr(tbl)..(i == #args and '' or ',')
		elseif typeof(v) == 'string' then
			s12312331 = tostring(v)..(i == #args and '' or ',')
		elseif typeof(v) == 'number' then
			s12312331 = tostring(v)..(i == #args and '' or ',')
		else
			s12312331 = "Unidentified, type of argument: "..typeof(v)
		end
        stuff = stuff..s12312331
    end
	--values.other['Debug stuff']['Blacklist signals'].Jumbobox values.other['Debug stuff']['Logging type'].Dropdown (File,Console)
    if table.find(values.other['Debug stuff']['Logging type'].Jumbobox,'File') then
		if not isfile('DebugOutput.txt') then
			writefile('DebugOutput.txt',('['..os.date('%x %X')..'] '..name..' '..stuff..'\n'))
		else
			appendfile('DebugOutput.txt',('['..os.date('%x %X')..'] '..name..' '..stuff..'\n'))
		end
	end
	if table.find(values.other['Debug stuff']['Logging type'].Jumbobox,'Console') then
		rconsoleprint(('['..os.date('%X')..'] '..name..' '..stuff..'\n'))
	end
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
		if values.other['Debug stuff'] and values.other['Debug stuff']['Debug mode'] and values.other['Debug stuff']['Debug mode'].Toggle and name ~= 'ping' and name ~= 'repupdate' and name ~= 'perfdump' then
			debugging(name,...)
		end
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
							task.wait(0.2)
                            oldsend(client.network,"knifehit", v, 'Torso')
                            oldsend(client.network,"equip", equipped) 
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
    
	local gunbob = debug.getupvalue(loadgun, 57)
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
		local dvd = other123123:Sector('DVD Logo','Right')
		
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


local debug = other123123:Sector('Debug stuff','Right')
debug:Element('Toggle','Debug mode')
local words = {
	'suppressionassist','equip','stance','sprint','aim','newbullets','updatesight','bullethit','stab','knifehit'
}
debug:Element('Jumbobox','Blacklist signals',{options = words})
debug:Element('Jumbobox','Logging type',{options = {'File','Console'}})

--values.other['Debug stuff']['Blacklist signals'].Jumbobox values.other['Debug stuff']['Logging type'].Dropdown (File,Console)








local addons = misc:Sector("addons", "Left") 
				addons:Element('ToggleColor', 'Menu Accent', {default = {Color = MainUIColor}}, function(tbl)
					if tbl.Toggle then
						oldColor = MainUIColor
						getgenv().MainUIColor = tbl.Color
						game:GetService("CoreGui").KeybindList.Frame.Grad.BackgroundColor3 = MainUIColor
						game:GetService("CoreGui").SpectatorsList.Spectators.Color.BackgroundColor3 = MainUIColor
						if game.CoreGui:FindFirstChild('fl indicator') then
						game:GetService("CoreGui")["fl indicator"].wgrgerqgerq.gradins.BackgroundColor3 = MainUIColor
						end
						for i,v in pairs (game:GetService('CoreGui')['electric boogalo'].Menu.Tabs:GetDescendants()) do
							if v:IsA("Frame") and v.BackgroundColor3 == oldColor and v.Name ~= 'ColorDrag' then
								v.BackgroundColor3 = MainUIColor
							elseif v:IsA('ScrollingFrame') and v.Parent.Name == 'Scroll' then
								v.ScrollBarImageColor3 = MainUIColor
							elseif v:IsA('UIGradient') and v.Name ~= 'HueFrameGradient' then
								v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
							elseif v:IsA('TextLabel') and v.TextColor3 == oldColor and (v.Name ~= 'CheckerINeed' and v.Name ~= 'SectionText') then
								v.TextColor3 = MainUIColor
							end
						end
					  
						for i,v in pairs (game:GetService("CoreGui")["electric boogalo"].Menu.Holder.TabButtons:GetChildren()) do
							if v:IsA("TextButton") then
								v.Gard.BackgroundColor3 = MainUIColor
							end
						end	
						for i,v in pairs (game:GetService("CoreGui")["MX_ONHIT"].OnHitFrame:GetChildren()) do
							if v:IsA("Frame") then
								v.Grad.BackgroundColor3 = MainUIColor
							end
						end
					else
						oldColor = MainUIColor
						getgenv().MainUIColor = Color3.fromRGB(255,20,147)
						game:GetService("CoreGui").KeybindList.Frame.Grad.BackgroundColor3 = MainUIColor
						game:GetService("CoreGui").SpectatorsList.Spectators.Color.BackgroundColor3 = MainUIColor
						if game.CoreGui:FindFirstChild('fl indicator') then
						game:GetService("CoreGui")["fl indicator"].wgrgerqgerq.gradins.BackgroundColor3 = MainUIColor
						end
						for i,v in pairs (game:GetService('CoreGui')['electric boogalo'].Menu.Tabs:GetDescendants()) do
							if v:IsA("Frame") and v.BackgroundColor3 == oldColor and v.Name ~= 'ColorDrag' then
								v.BackgroundColor3 = MainUIColor
							elseif v:IsA('ScrollingFrame') and v.Parent.Name == 'Scroll' then
								v.ScrollBarImageColor3 = MainUIColor
							elseif v:IsA('UIGradient') and v.Name ~= 'HueFrameGradient' then
								v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
							elseif v:IsA('TextLabel') and v.TextColor3 == oldColor and (v.Name ~= 'CheckerINeed' and v.Name ~= 'SectionText') then
								v.TextColor3 = MainUIColor
							elseif v:IsA('Frame') and v.Name == 'Toggle' then
								v.BackgroundColor3 = MainUIColor
							end
						end
					  
						for i,v in pairs (game:GetService("CoreGui")["electric boogalo"].Menu.Holder.TabButtons:GetChildren()) do
							if v:IsA("TextButton") then
								v.Gard.BackgroundColor3 = MainUIColor
							end
						end	
						for i,v in pairs (game:GetService("CoreGui")["MX_ONHIT"].OnHitFrame:GetChildren()) do
							if v:IsA("Frame") then
								v.Grad.BackgroundColor3 = MainUIColor
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