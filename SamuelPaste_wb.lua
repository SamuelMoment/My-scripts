if game.CoreGui:FindFirstChild("electric boogalo") then return error('script is already executed or you executed another script')end

local location = 'SamuelPaste_wb/'
local cfglocation = location.."cfgs/"
makefolder('SamuelPaste_wb')
makefolder(location..'cfgs')


if not isfile(location.."customkillsay.txt") then
	writefile(location.."customkillsay.txt", "message1\
message2\
message3"
)
end

if not isfile(location..'customchatspam.txt') then
	writefile(location..'customchatspam.txt', "message1\
message2\
message3"
)
end


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

local Vec2 = Vector2.new
local Vec3 = Vector3.new
local CF = CFrame.new
local INST = Instance.new
local COL3 = Color3.new

local COL3RGB = Color3.fromRGB
local COL3HSV = Color3.fromHSV

local CLAMP = math.clamp

local DEG = math.deg
local FLOOR = math.floor
local ACOS= math.acos

local RANDOM = math.random
local ATAN2 = math.atan2

local HUGE = math.huge
local RAD = math.rad

local MIN = math.min
local POW = math.pow

local UDIM2 = UDim2.new
local CFAngles = CFrame.Angles

local FIND = string.find
local LEN = string.len
local SUB = string.sub
local GSUB = string.gsub
local RAY = Ray.nen
 
local INSERT = table.insert 
local TBLFIND = table.find
local TBLREMOVE = table.remove
local TBLSORT = table.sort 


local makeDraggable = function(frame)
	dragging = false 
	local a = frame
	local dragInput 
	local dragStart 
	local startPos 
	local function update(input) 
		local delta = input.Position - dragStart 
		a.Position = UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
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

function findtextrandom(text)
    if text:find(' @r ') then 
        local b = text:split(' @r ')
        return b[RANDOM(#b)]
    else 
        return text
    end
end

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
		text = GSUB(text, a, b)
	end

	return findtextrandom(text)
end

local loopkillplr = {}


for _,v in pairs(game.Players:GetPlayers()) do 
	INSERT(loopkillplr, v.Name)
end

if #loopkillplr == 0 then
	INSERT(loopkillplr, 'none')
end											
emojis = {
	[":clown:"] = utf8.char(129313);
	[":cold_face:"] = utf8.char(129398);
	[":neutral:"] = utf8.char(128528);
	[":sob:"] = utf8.char(128557);
}
local allcfgs = {} 

for _,cfg in pairs(listfiles(cfglocation)) do 
	local cfgname = GSUB(cfg, cfglocation..'\\', "") 
	INSERT(allcfgs, cfgname) 
end
--[[if #allcfgs == 0 then
INSERT(allcfgs, 'shit so script wont crash')
end--]]

local library,Signal,ConfigLoad,ConfigLoad1,ConfigUpdateCfgList,ConfigUpdateCfgList2,CreateHitElement = loadstring(game:HttpGet("https://raw.githubusercontent.com/SamuelMoment/My-scripts/main/library.lua"))()
library.setcfglocation(cfglocation)


local gui = library.New('SamuelPaste')
local main = gui.Tab('main')
local misc = gui.Tab('misc')
local visuals = gui.Tab('visuals')
local skins = gui.Tab('skins')

local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService('RunService')
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
--[[ MAIN ]]--
do

end
--[[ MISC ]]--
do
	do
	
		local allcfgs = {} 
		
		for _,cfg in pairs(listfiles('SamuelPaste_cw/cfgs')) do 
			local cfgname = GSUB(cfg, 'SamuelPaste_cw/cfgs\\', "") 
			INSERT(allcfgs, cfgname) 
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
			local cfgname = GSUB(cfg, 'SamuelPaste_cw/cfgs\\', "") 
			INSERT(allcfgs, cfgname) 
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
				local cfgname = GSUB(cfg, "pastedstormy/pastedstormycfgs\\", "") 
				writefile('SamuelPaste_cw/cfgs/'..cfgname, readfile(cfg))
			end
			table.clear(allcfgs)
		
			for _,cfg in pairs(listfiles(cfglocation)) do 
				local cfgname = GSUB(cfg, cfglocation.."\\", "") 
				INSERT(allcfgs, cfgname) 
			end
				ConfigUpdateCfgList2:Fire()
				ConfigUpdateCfgList:Fire()
		end)
	
		configs:Element("Toggle", "keybind list", nil, function(tbl) 
			library:SetKeybindVisible(tbl.Toggle) 
		end) 
		configs:Element("Toggle", "keystrokes", {}, function(tbl)
			if tbl.Toggle then
				local ScreenGuiKey = INST("ScreenGui")
				local W = INST("TextLabel")
				local A = INST("TextLabel")
				local S = INST("TextLabel")
				local D = INST("TextLabel")
				local E = INST("TextLabel")
				local R = INST("TextLabel")
				local _ = INST("TextLabel")
				local _2 = INST("TextLabel")
				local _3 = INST("TextLabel")
				local _4 = INST("TextLabel")
				local _5 = INST("TextLabel")
				local _6 = INST("TextLabel")
	
	
				ScreenGuiKey.Parent = game.CoreGui
				ScreenGuiKey.Name = "keystrokess"
	
				W.Name = "W"
				W.Parent = ScreenGuiKey
				W.BackgroundColor3 = COL3RGB(255, 255, 255)
				W.BackgroundTransparency = 1.000
				W.Position = UDIM2(0.488053292, 0, 0.728395104, 0)
				W.Size = UDIM2(0, 29, 0, 28)
				W.Visible = false
				W.Font = Enum.Font.Code
				W.Text = "W"
				W.TextColor3 = COL3RGB(255, 255, 255)
				W.TextSize = 14.000
				W.TextStrokeTransparency = 0.000
	
				A.Name = "A"
				A.Parent = ScreenGuiKey
				A.BackgroundColor3 = COL3RGB(255, 255, 255)
				A.BackgroundTransparency = 1.000
				A.Position = UDIM2(0.453584045, 0, 0.777777791, 0)
				A.Size = UDIM2(0, 29, 0, 28)
				A.Visible = false
				A.Font = Enum.Font.Code
				A.Text = "A"
				A.TextColor3 = COL3RGB(255, 255, 255)
				A.TextSize = 14.000
				A.TextStrokeTransparency = 0.000
	
				S.Name = "S"
				S.Parent = ScreenGuiKey
				S.BackgroundColor3 = COL3RGB(255, 255, 255)
				S.BackgroundTransparency = 1.000
				S.Position = UDIM2(0.488053292, 0, 0.777777791, 0)
				S.Size = UDIM2(0, 29, 0, 28)
				S.Visible = false
				S.Font = Enum.Font.Code
				S.Text = "S"
				S.TextColor3 = COL3RGB(255, 255, 255)
				S.TextSize = 14.000
				S.TextStrokeTransparency = 0.000
	
				D.Name = "D"
				D.Parent = ScreenGuiKey
				D.BackgroundColor3 = COL3RGB(255, 255, 255)
				D.BackgroundTransparency = 1.000
				D.Position = UDIM2(0.522522688, 0, 0.777777791, 0)
				D.Size = UDIM2(0, 29, 0, 28)
				D.Visible = false
				D.Font = Enum.Font.Code
				D.Text = "D"
				D.TextColor3 = COL3RGB(255, 255, 255)
				D.TextSize = 14.000
				D.TextStrokeTransparency = 0.000
	
				E.Name = "E"
				E.Parent = ScreenGuiKey
				E.BackgroundColor3 = COL3RGB(255, 255, 255)
				E.BackgroundTransparency = 1.000
				E.Position = UDIM2(0.453584045, 0, 0.728395045, 0)
				E.Size = UDIM2(0, 29, 0, 28)
				E.Visible = false
				E.Font = Enum.Font.Code
				E.Text = "C"
				E.TextColor3 = COL3RGB(255, 255, 255)
				E.TextSize = 14.000
				E.TextStrokeTransparency = 0.000
	
				R.Name = "R"
				R.Parent = ScreenGuiKey
				R.BackgroundColor3 = COL3RGB(255, 255, 255)
				R.BackgroundTransparency = 1.000
				R.Position = UDIM2(0.522522688, 0, 0.728395045, 0)
				R.Size = UDIM2(0, 29, 0, 28)
				R.Visible = false
				R.Font = Enum.Font.Code
				R.Text = "J"
				R.TextColor3 = COL3RGB(255, 255, 255)
				R.TextSize = 14.000
				R.TextStrokeTransparency = 0.000
		
	
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
						W.Text = 'W'
					elseif (input.KeyCode == A1Key) then
						A.Text = 'A'
					elseif (input.KeyCode == S1Key) then
						S.Text = 'S'
					elseif (input.KeyCode == D1Key) then
						D.Text = 'D'
					elseif (input.KeyCode == E1Key) then
						E.Text = 'C'
					elseif (input.KeyCode == SpaceKey) then
						R.Text = 'J'
					end
				end)
	
				UserInputService.InputEnded:Connect(function(input)
					if (input.KeyCode == W1Key) then
						W.Text = '_'
					elseif (input.KeyCode == A1Key) then
						A.Text = '_'
					elseif (input.KeyCode == S1Key) then
						S.Text = '_'
					elseif (input.KeyCode == D1Key) then
						D.Text = '_'
					elseif (input.KeyCode == E1Key) then
						E.Text = '_'
					elseif (input.KeyCode == SpaceKey) then
						R.Text = '_'
					end
				end)		
			else
				game.CoreGui.keystrokess:Destroy()
			end
		end)
	end
	
		local function YROTATION(cframe) 
			local x, y, z = cframe:ToOrientation() 
			return CF(cframe.Position) * CFAngles(0,y,0) 
		end
	
	do
		local switchtrigger = {false, nil, nil}
		local bhop = misc:Sector('movement','Left')
		bhop:Element('ToggleKeybind','bunny hop')
		bhop:Element('Dropdown','direction',{options = {'forward','directional','directional 2'}})
		bhop:Element('Dropdown','type',{options = {'gyro','cframe','velocity','idk'}})
		bhop:Element('Slider','speed',{min = 0,max = 300,default = 50})
		bhop:Element('ToggleKeybind','prevent launch')
		bhop:Element('Slider','launch block(y velocity)',{min = 0,max = 100,default = 40})
		bhop:Element('ToggleKeybind','no jump')
		BodyVelocity = INST('BodyVelocity')
		RunService.Stepped:Connect(function()
			if not LocalPlayer.Character then return end
			local CamCFrame = workspace.CurrentCamera.CFrame
			local Root = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
			BodyVelocity:Destroy()
			BodyVelocity = INST('BodyVelocity')
			BodyVelocity.MaxForce = Vec3(HUGE,0,HUGE)
			if values.misc.movement['no jump'].Toggle and values.misc.movement['no jump'].Active then
				LocalPlayer.Character:WaitForChild('Humanoid'):SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
			else
				LocalPlayer.Character:WaitForChild('Humanoid'):SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
			end
			if UserInputService:IsKeyDown('Space') and values.misc.movement['bunny hop'].Toggle == true then
				local add = 0
				if values.misc.movement['direction'].Dropdown == 'directional' or values.misc.movement['direction'].Dropdown == 'directional 2' then
					if UserInputService:IsKeyDown("A") then add = 90 end 
					if UserInputService:IsKeyDown("S") then add = 180 end 
					if UserInputService:IsKeyDown("D") then add = 270 end 
					if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("W") then add = 45 end 
					if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("W") then add = 315 end 
					if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("S") then add = 225 end 
					if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("S") then add = 145 end 
				end
				local rot = YROTATION(CamCFrame) * CFAngles(0,RAD(add),0)
				local bhopspeed = values.misc.movement['speed'].Slider		
				BodyVelocity.Parent = LocalPlayer.Character['HumanoidRootPart']
				
				if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air and not (values.misc.movement['no jump'].Toggle and values.misc.movement['no jump'].Active) then
					LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
				
				BodyVelocity.Velocity = Vec3(rot.LookVector.X,0,rot.LookVector.Z) * (bhopspeed * 2)
				if add == 0 and values.misc.movement['direction'].Dropdown == 'directional' and not UserInputService:IsKeyDown('W') then
					BodyVelocity:Destroy()
				else
					if values.misc.movement['type'].Dropdown == 'cframe' then
						BodyVelocity:Destroy()
						Root.CFrame = Root.CFrame + Vec3(rot.LookVector.X,0,rot.LookVector.Z) * bhopspeed/50
					elseif values.misc.movement['type'].Dropdown == 'velocity'  then
						BodyVelocity:Destroy()
						Root.Velocity = Vec3(rot.LookVector.X * (bhopspeed * 2), Root.Velocity.y, rot.LookVector.Z * (bhopspeed * 2))
					elseif values.misc.movement['type'].Dropdown == 'idk' then
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
							
						Root.CFrame = Root.CFrame + Vec3(rot.LookVector.X, 0, rot.LookVector.Z) * bhopspeed/50
					end
				end
			end	
			if values.misc.movement['prevent launch'].Toggle and values.misc.movement['prevent launch'].Active then 
				if Root.Velocity.Y > values.misc.movement['launch block(y velocity)'].Slider then 
					Root.Velocity = Vec3(Root.Velocity.x, 0, Root.Velocity.z)
				end
			end		
		end)
	end
	
	do
		local addons = misc:Sector("addons", "Left") 
		addons:Element('ToggleColor', 'Menu Accent', {default = {Color = MainUIColor}}, function(tbl)
			if tbl.Toggle then
				oldColor = MainUIColor
				getgenv().MainUIColor = tbl.Color
				game:GetService("CoreGui").KeybindList.Frame.Grad.BackgroundColor3 = MainUIColor
				for i,v in pairs (game:GetService('CoreGui')['electric boogalo'].Menu.Tabs:GetDescendants()) do
					if v:IsA("Frame") and v.BackgroundColor3 == oldColor and v.Name ~= 'ColorDrag' then
						v.BackgroundColor3 = MainUIColor
					elseif v:IsA('ScrollingFrame') and v.Parent.Name == 'Scroll' then
						v.ScrollBarImageColor3 = MainUIColor
					elseif v:IsA('UIGradient') and v.Name ~= 'HueFrameGradient' then
						v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, COL3RGB(75, 92, 112))}
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
				for i,v in pairs (game:GetService('CoreGui')['electric boogalo'].Menu.Tabs:GetDescendants()) do
					if v:IsA("Frame") and v.BackgroundColor3 == oldColor and v.Name ~= 'ColorDrag' then
						v.BackgroundColor3 = MainUIColor
					elseif v:IsA('ScrollingFrame') and v.Parent.Name == 'Scroll' then
						v.ScrollBarImageColor3 = MainUIColor
					elseif v:IsA('UIGradient') and v.Name ~= 'HueFrameGradient' then
						v.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, MainUIColor), ColorSequenceKeypoint.new(1.00, COL3RGB(75, 92, 112))}
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
	
	
		do
			local watermark = INST('ScreenGui')
			local watermark_2 = INST('Frame')
			local title = INST('TextLabel')
			local none = INST('UIGradient')
			local linetop = INST('UIGradient')
			local linetopandbottem = INST('UIGradient')
			local shadowatbottem = INST('UIGradient')
			local shadowattop = INST('UIGradient')
			local shadowattopandbottom = INST('UIGradient')
	
			watermarklocation = watermark
	
			watermark.Name = 'watermark'
			watermark.Parent = game.CoreGui
			watermark.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
			watermark_2.Name = 'watermark'
			watermark_2.Parent = watermark
			watermark_2.BackgroundColor3 = COL3RGB(29, 29, 29)
			watermark_2.BorderColor3 = COL3RGB(255, 255, 255)
			watermark_2.Position = UDIM2(0.912, 0, 0.00858895481, 0)
			watermark_2.Size = UDIM2(0, 89, 0, 20)
			
			title.Name = 'title'
			title.Parent = watermark_2
			title.BackgroundColor3 = COL3RGB(255, 255, 255)
			title.BackgroundTransparency = 1.000
			title.Position = UDIM2(0, 0, 0.0597654358, 0)
			title.Size = UDIM2(0, 0, 0, 18)
			title.Font = Enum.Font.Nunito
			title.LineHeight = 1.21
			title.Text = '		 yes.no'
			title.TextColor3 = COL3RGB(255, 255, 255)
			title.TextSize = 16.000
			title.TextStrokeColor3 = COL3RGB(25, 25, 25)
			title.TextStrokeTransparency = 0.000
			title.TextXAlignment = Enum.TextXAlignment.Left
	
			none.Enabled = false
			none.Color =ColorSequence.new{ColorSequenceKeypoint.new(0.00, COL3RGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, COL3RGB(255, 255, 255))}
			none.Rotation = 0
			none.Name = 'none'
			none.Parent = watermark_2
	
			linetop.Enabled = false
			linetop.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, COL3RGB(0, 0, 0)), ColorSequenceKeypoint.new(0.00, COL3RGB(56, 56, 56)), ColorSequenceKeypoint.new(0.00, COL3RGB(0, 0, 0)), ColorSequenceKeypoint.new(0.66, COL3RGB(0, 0, 0)), ColorSequenceKeypoint.new(0.99, COL3RGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, COL3RGB(255, 255, 255))}
			linetop.Rotation = -90
			linetop.Name = 'linetop'
			linetop.Parent = watermark_2
			
			shadowatbottem.Enabled = false
			shadowatbottem.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, COL3RGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, COL3RGB(0, 0, 0))}
			shadowatbottem.Rotation = 90
			shadowatbottem.Name = 'shadowatbottem'
			shadowatbottem.Parent = watermark_2
	
			shadowattop.Enabled = false
			shadowattop.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, COL3RGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, COL3RGB(0, 0, 0))}
			shadowattop.Rotation = -90
			shadowattop.Name = 'shadowattop'
			shadowattop.Parent = watermark_2
	
			shadowattopandbottom.Enabled = false
			shadowattopandbottom.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, COL3RGB(25, 25, 25)), ColorSequenceKeypoint.new(0.59, COL3RGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, COL3RGB(25, 25, 25))}
			shadowattopandbottom.Rotation = -90
			shadowattopandbottom.Name = 'shadowattopandbottom'
			shadowattopandbottom.Parent = watermark_2
	
			for a,b in next, watermark_2:GetChildren() do -- inserts all the theme names into 'watermarkthemes'
				if b:IsA('UIGradient') then
					INSERT(watermarkthemes, b.Name)
				end
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
		INSERT(Images_names, 'Default')
		for a,b in next, themebackground do 
			insertwithoutdupes(Images_names, a)
		end
						
		addons:Element('ToggleColor', 'ui border', {default = {Color = COL3RGB(255,255,255)}})	
						
		addons:Element('ToggleKeybind', 'gui keybind', {default = {Key = 'RightShift', Type = 'Toggle', Toggle = true}}, function(tbl)
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
		addons:Element('ToggleTrans', 'background color', {default = {Color = COL3RGB(180,180,180), Transparency = 0}})
		local watermark = misc:Sector('watermark', 'Right')
	
		watermark:Element('Toggle', 'enabled', {default = {Toggle = true}}, function(tbl)
			watermarklocation.Enabled = tbl.Toggle
		end)
		watermark:Element('Dropdown', 'themes', {options = watermarkthemes})
		local watermarktext
		watermark:Element('TextBox', 'watermark text', {placeholder = 'text here', default = {text = '		 yes.no'}}, function(tbl)
			pcall(function()
				watermarktext:Disconnect()
			end)
			watermarktext = RunService.RenderStepped:Connect(function()
				wait(1)
				local textierawr = textboxtriggers(tbl.Text)
				watermarklocation.watermark.title.Text = textierawr
			end)
		end)
		local fonts = {}
		for i,v in pairs(Enum.Font:GetEnumItems()) do
			if v.Name ~= 'Unknown' then
				INSERT(fonts,v.Name)
			end
		end	
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
			watermarklocation.watermark.Size = UDIM2(0, tbl.Slider * 5, 0, values.misc.watermark['watermark height'].Slider)
		end)
		watermark:Element('Slider', 'watermark height', {min = 0, max = 100, default = 20}, function(tbl)
			watermarklocation.watermark.Size = UDIM2(0, values.misc.watermark['watermark lenght'].Slider * 5, 0, tbl.Slider)
		end)
		watermark:Element('ToggleColor', 'border color', {default = {Color = COL3RGB(255,255,255)}}, function(tbl)
			watermarklocation.watermark.BorderColor3 = tbl.Color
		end)
		watermark:Element('ToggleColor', 'text color', {default = {Color = COL3RGB(255,255,255)}}, function(tbl)
			watermarklocation.watermark.title.TextColor3 = tbl.Color
		end)
	
		watermark:Element('Slider', 'watermark offset X', {min = -100, max = 0, default = watermarklocation.watermark.Position.X.Scale}, function(tbl)
			watermarklocation.watermark.Position = UDim2.new(0.912 + (tbl.Slider / 150), 0, watermarklocation.watermark.Position.Y.Scale, 0)
		end)
	
		watermark:Element('Slider', 'watermark offset y', {min = -100, max = 0, default = watermarklocation.watermark.Position.Y.Scale}, function(tbl)
			watermarklocation.watermark.Position = UDim2.new(watermarklocation.watermark.Position.X.Scale, 0,  0.00858895481 + (tbl.Slider / 150) , 0)
		end)
	
	end
	
	
	do
		local oldFunctions = {}
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' then
				if rawget(v,'EnableRagdoll') then
					oldFunctions['oldRagdoll'] = v.EnableRagdoll
				end
			end
		end
		LocalPlayer.CharacterAdded:Connect(function()
			for i,v in pairs(getgc(true)) do
				if typeof(v) == 'table' then
					if rawget(v,'EnableRagdoll') then
						oldFunctions['oldRagdoll'] = v.EnableRagdoll
						if values.misc.misc.player['No ragdoll'].Toggle then
							v.EnableRagdoll = function()
								return
							end
						end
					end
				end
			end
		end)
		local misc1 = misc:MSector('misc','Right')
		local miscTab  = misc1:Tab('player')
		miscTab:Element('Toggle','No ragdoll',{},function(tbl)
			for i,v in pairs(getgc(true)) do
				if typeof(v) == 'table' then
					if rawget(v,'EnableRagdoll') then
						if tbl.Toggle then
							v.EnableRagdoll = function()
								return
							end
						else
							v.EnableRagdoll = oldFunctions['oldRagdoll']
						end
					end
				end
			end		
		end)
		miscTab:Element('Toggle','No enviroment damage')
		local old; old = hookmetamethod(game,'__namecall',function(self,...)
			local method = getnamecallmethod()
			local args = {...}
			if self.Name == 'ChangeCharacter' then
				if values.misc.misc.player['No enviroment damage'].Toggle and args[1] == 'Damage' then
					return
				end
			end
			return old(self,unpack(args))
		end)
	end
end
--[[ VISUALS ]]--
do

end
--[[ SKINS ]]--
do
	local models = game:GetObjects('rbxassetid://11377496028')[1]
	repeat wait() until models ~= nil
	local ChrModels = models:FindFirstChild('ChrModels')
	local ChrModels2 = models:FindFirstChild('ChrModels2')
	local ChrModels3 = models:FindFirstChild('ChrModels3')
	
	local CharNames = {}
	local CharNames2 = {}
	local CharNames3 = {}
	local CharNames4 = {}
	for i,v in pairs(ChrModels:GetChildren()) do
		INSERT(CharNames,v.Name)
	end
	for i,v in pairs(ChrModels2:GetChildren()) do
		INSERT(CharNames2,v.Name)
	end
	for i,v in pairs(ChrModels3:GetChildren()) do
		INSERT(CharNames3,v.Name)
	end
	for i,v in pairs(Players:GetPlayers()) do
		if v ~= LocalPlayer then
			if v.Character then
				INSERT(CharNames4,v.Name)
			end
			v.CharacterAdded:Connect(function()
				if not TBLFIND(CharNames4,v.Name) then
					INSERT(CharNames4,v.Name)
					values.skins.characters.skin.UpdateValue['Players characters'](CharNames4)
				end
			end)
			v.CharacterRemoving:Connect(function()
				removewithoutdupes(CharNames4,v.Name)
				values.skins.characters.skin.UpdateValue['Players characters'](CharNames4)
			end)
		end
	end
	
	getgenv().oldcharacter = nil
	
	function ChangeCharacter(NewCharacter)
		if not NewCharacter then return end
		--print('asqwqeq')

		for i,v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA('CharacterMesh') then
				v:Destroy()
				--v:Destroy()
			end
		end		
		pcall(function()
			if NewCharacter:FindFirstChild('Head') and not NewCharacter:FindFirstChild('Head'):FindFirstChild('face') then

				LocalPlayer.Character.Head:FindFirstChild('face').Texture = ''
			end
		end)
			for _,Part in pairs (LocalPlayer.Character:GetChildren()) do 
				if Part:IsA("Accessory") then 
					Part:Destroy() 
				end 
				if Part:IsA("BasePart") then 
					if NewCharacter:FindFirstChild(Part.Name) then

						Part.Color = NewCharacter:FindFirstChild(Part.Name).Color 
						Part.Transparency = NewCharacter:FindFirstChild(Part.Name).Transparency 
					end 
				end 

				if (Part.Name == "Head" or Part.Name == "FakeHead") and Part:FindFirstChildOfClass("Decal") and NewCharacter.Head:FindFirstChildOfClass("Decal") then 
	
					Part:FindFirstChildOfClass("Decal").Texture = NewCharacter.Head:FindFirstChildOfClass("Decal").Texture
				end 
				if (Part.Name == "Head" or Part.Name == "FakeHead") and Part:FindFirstChildOfClass("SpecialMesh") and NewCharacter.Head:FindFirstChildOfClass("SpecialMesh") then 
					if NewCharacter.Head:FindFirstChildOfClass("SpecialMesh").MeshId ~= '' then
							
						Part:FindFirstChildOfClass("SpecialMesh").MeshId = NewCharacter.Head:FindFirstChildOfClass("SpecialMesh").MeshId

				   else
			   
						Part:FindFirstChildOfClass("SpecialMesh"):Destroy()
						Instance.new('SpecialMesh',Part).Scale = Vector3.new(1.25,1.25,1.25)
				   end
				end
			end
			
			if NewCharacter:FindFirstChildOfClass("Shirt") then 
				local Clone = NewCharacter:FindFirstChildOfClass("Shirt"):Clone() 		
				
				if LocalPlayer.Character:FindFirstChildOfClass("Shirt")	then 

					LocalPlayer.Character:FindFirstChildOfClass("Shirt"):Destroy() 


							
				end 
				Clone.Parent = LocalPlayer.Character 
			else
				LocalPlayer.Character:FindFirstChildOfClass('Shirt').ShirtTemplate = ''
			end

			if NewCharacter:FindFirstChildOfClass("Pants") then 
				local Clone = NewCharacter:FindFirstChildOfClass("Pants"):Clone() 
				if LocalPlayer.Character:FindFirstChildOfClass("Pants") then 

					LocalPlayer.Character:FindFirstChildOfClass("Pants"):Destroy() 
				end 
				
				Clone.Parent = LocalPlayer.Character 
			else
				LocalPlayer.Character:FindFirstChildOfClass('Pants').PantsTemplate = ''			
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
				if Part:IsA('CharacterMesh') then
					Part:Clone().Parent = LocalPlayer.Character
				end
			end 
	end
	folder1 = Instance.new('Folder',workspace)
	folder1.Name = 'OldCharacter'
	
	local characters = skins:Sector('characters','Right')
	characters:Element('Toggle','character changer',{},function(tbl)
		if tbl.Toggle then
			if values.skins.characters.skin.Dropdown == 'Custom characters' then
				ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]))
				return
			elseif values.skins.characters.skin.Dropdown == 'Custom characters 2' then
				ChangeCharacter(ChrModels2:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]))
				return
			elseif values.skins.characters.skin.Dropdown == 'Custom characters 3' then
				ChangeCharacter(ChrModels3:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]))
				return
			else
				ChangeCharacter(Players:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]).Character)
				return
			end		
				elseif oldcharacter ~= nil then
			ChangeCharacter(oldcharacter)
			end
	end)
	characters:Element('ScrollDrop','skin',{options = {['Custom characters'] = CharNames,['Custom characters 2'] = CharNames2,['Custom characters 3'] = CharNames3,['Players characters'] = CharNames4},Amount = 9,alphabet = true},function(tbl)
		if values.skins.characters['character changer'].Toggle then
			if tbl.Dropdown == 'Custom characters' then
				ChangeCharacter(ChrModels:FindFirstChild(tbl.Scroll[tbl.Dropdown]))
				return
			elseif tbl.Dropdown == 'Custom characters 2' then
				ChangeCharacter(ChrModels2:FindFirstChild(tbl.Scroll[tbl.Dropdown]))
				return
			elseif tbl.Dropdown == 'Custom characters 3' then
				ChangeCharacter(ChrModels3:FindFirstChild(tbl.Scroll[tbl.Dropdown]))
				return
			else
				ChangeCharacter(Players:FindFirstChild(tbl.Scroll[tbl.Dropdown]).Character)
				return
			end
		end
	end)
	if LocalPlayer.Character then
			oldcharacter = LocalPlayer.Character:Clone()
			--task.wait(.2)
			for i,v in pairs(folder1:GetChildren()) do
				v:Destroy()
			end
			oldcharacter.Parent = folder1
			
			oldcharacter.HumanoidRootPart.Anchored = true
			if not oldcharacter:FindFirstChildWhichIsA('Shirt') then
				for i,v in pairs(LocalPlayer.Character:GetChildren()) do
					if not oldcharacter:FindFirstChild(v.Name) then
						v:Clone().Parent = oldcharacter
					end
				end
			end
			for i,v in pairs(oldcharacter:GetChildren()) do
				if v:IsA('Part') then
					v.Position = Vector3.new(0,100000,0)
				end
			end
			task.wait(.1)
			if oldcharacter:FindFirstChild('Head'):FindFirstChild('Template') then
				oldcharacter:FindFirstChild('Head'):FindFirstChild('Template'):Destroy()
			end
			for i,v in pairs(oldcharacter:GetChildren()) do
				if v:IsA('Tool') then v:Destroy() end
			end
	end
	
local boobs = skins:Sector('boobs','Right')
boobs:Element('ToggleColor','enabled',{},function(tbl)
	if LocalPlayer.Character and not LocalPlayer.Character:FindFirstChild('boobsModel') then
		local char = LocalPlayer.Character
		--char:WaitForChild('UpperTorso')
		local torso = char.UpperTorso	
		Instance.new('Model',char).Name = 'boobsModel'
		local part = Instance.new('Part',char.boobsModel)
		part.Name = 'boob'
		part.CanCollide = false
		part.Anchored = false
		part.Shape = Enum.PartType.Ball
		part.Position = torso.Position
		part.Size = Vector3.new(1,1,1)
		part.Color = torso.Color
		part.Material = 'Water'
		part.Transparency = 1
			--[[local render
			render = game:GetService('RunService').RenderStepped:Connect(function()
			
			part.Position = torso.Position
			end)--]]
		getgenv().weld = Instance.new('Weld',char.boobsModel)
		weld.Part0 = torso
		weld.Part1 = part
		weld.C0 = CFrame.new() + Vector3.new(0.5,0.3,-0.75)

		getgenv().part2 = Instance.new('Part',char.boobsModel)
		part2.Name = 'boob2'
		part2.CanCollide = false
		part2.Anchored = false
		part2.Shape = Enum.PartType.Ball
		part2.Position = torso.Position
		part2.Size = Vector3.new(1,1,1)
		part2.Color = torso.Color
		part2.Material = 'Water'
		part2.Transparency = 1

		local weld = Instance.new('Weld',char.boobsModel)
		weld.Part0 = torso
		weld.Part1 = part2
		weld.C0 = CFrame.new() + Vector3.new(-0.5,0.3,-0.75)
		
		if tbl.Toggle then
			
			s = LocalPlayer.Character:FindFirstChild('boobsModel')
			s.boob1.Transparency = 0
			s.boob2.Transparency = 0
			s.boob1.Color = tbl.Color
			s.boob2.Color = tbl.Color
		else
			s = LocalPlayer.Character:FindFirstChild('boobsModel')
			s.boob.Transparency = 1
			s.boob2.Transparency = 1
			s.boob.Color = tbl.Color
			s.boob2.Color = tbl.Color		
		end	
	else
		if tbl.Toggle then
			
			s = LocalPlayer.Character:FindFirstChild('boobsModel')
			s.boob.Transparency = 0
			s.boob2.Transparency = 0
			s.boob.Color = tbl.Color
			s.boob2.Color = tbl.Color
		else
			s = LocalPlayer.Character:FindFirstChild('boobsModel')
			s.boob.Transparency = 1
			s.boob2.Transparency = 1
			s.boob.Color = tbl.Color
			s.boob2.Color = tbl.Color		
		end
	end
end)
	
	LocalPlayer.CharacterAdded:Connect(function(chr)
		chr:WaitForChild('HumanoidRootPart')
		chr:WaitForChild('UpperTorso')
		chr:WaitForChild('Head')
		task.wait(.2)
			chr.Archivable = true
			oldcharacter = chr:Clone()

			--task.wait(.2)
			for i,v in pairs(folder1:GetChildren()) do
				v:Destroy()
			end
			oldcharacter.Parent = folder1
			
			oldcharacter.HumanoidRootPart.Anchored = true
			if not oldcharacter:FindFirstChildWhichIsA('Shirt') then
				for i,v in pairs(LocalPlayer.Character:GetChildren()) do
					if not oldcharacter:FindFirstChild(v.Name) then
						v:Clone().Parent = oldcharacter
					end
				end
			end
			for i,v in pairs(oldcharacter:GetChildren()) do
				if v:IsA('BasePart') then
					v.Position = Vector3.new(0,100000,0)
				end
			end
			task.wait(.1)
			if oldcharacter:FindFirstChild('Head'):FindFirstChild('Template') then
				oldcharacter:FindFirstChild('Head'):FindFirstChild('Template'):Destroy()
			end
			for i,v in pairs(oldcharacter:GetChildren()) do
				if v:IsA('Tool') then v:Destroy() end
			end
			
		if values.skins.characters['character changer'].Toggle then
			if values.skins.characters.skin.Dropdown == 'Custom characters' then
				ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]))
				return
			elseif values.skins.characters.skin.Dropdown == 'Custom characters 2' then
				ChangeCharacter(ChrModels2:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]))
				return
			elseif values.skins.characters.skin.Dropdown == 'Custom characters 3' then
				ChangeCharacter(ChrModels3:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]))
				return
			else
				ChangeCharacter(Players:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]).Character)
				return
			end	
		end	

			local torso = chr.UpperTorso	
			Instance.new('Model',chr).Name = 'boobsModel'
			local part = Instance.new('Part',chr.boobsModel)
			part.Name = 'boob'
			part.CanCollide = false
			part.Anchored = false
			part.Shape = Enum.PartType.Ball
			part.Position = torso.Position
			part.Size = Vector3.new(1,1,1)
			part.Color = Color3.new(1,1,1)
			part.Material = 'Water'
			part.Transparency = 1
				--[[local render
				render = game:GetService('RunService').RenderStepped:Connect(function()
				
				part.Position = torso.Position
				end)--]]
			local weld = Instance.new('Weld',chr.boobsModel)
			weld.Part0 = torso
			weld.Part1 = part
			weld.C0 = CFrame.new() + Vector3.new(0.5,0.3,-0.75)

			local part2 = Instance.new('Part',chr.boobsModel)
			part2.Name = 'boob2'
			part2.CanCollide = false
			part2.Anchored = false
			part2.Shape = Enum.PartType.Ball
			part2.Position = torso.Position
			part2.Size = Vector3.new(1,1,1)
			part2.Color = Color3.new(1,1,1)
			part2.Material = 'Water'
			part2.Transparency = 1

			local weld = Instance.new('Weld',chr.boobsModel)
			weld.Part0 = torso
			weld.Part1 = part2
			weld.C0 = CFrame.new() + Vector3.new(-0.5,0.3,-0.75)			

			if values.skins.boobs.enabled.Toggle then
				part.Transparency = 0
				part2.Transparency = 0
			end
			part.Color = values.skins.boobs.enabled.Color
			part2.Color = values.skins.boobs.enabled.Color
		
	end)
	
	Players.PlayerAdded:Connect(function(v)
		v.CharacterAdded:Connect(function()
			if not TBLFIND(CharNames4,v.Name) then
				INSERT(CharNames4,v.Name)
				values.skins.characters.skin.UpdateValue['Players characters'](CharNames4)
			end
		end)
		v.CharacterRemoving:Connect(function()
			removewithoutdupes(CharNames4,v.Name)
			values.skins.characters.skin.UpdateValue['Players characters'](CharNames4)
		end)
		values.skins.characters.skin.UpdateValue['Players characters'](CharNames4)
	end)
	Players.PlayerRemoving:Connect(function(v)
		removewithoutdupes(CharNames4,v.Name)
		values.skins.characters.skin.UpdateValue['Players characters'](CharNames4)
	end)
	local trannyenabled = false

	local tranny = skins:Sector("trannyware", "Right") 

	local a = INST("MeshPart",workspace)
	a.Size = Vec3(1.35,1.4,1.35)
	a.CanCollide = false
	a.Anchored = true
	a.MeshId = "rbxassetid://4249338569"
	a.TextureID = "rbxassetid://4249293955"

	tranny:Element('Toggle', 'skirt', {}, function(tbl)
		trannyenabled = tbl.Toggle
	end)





	local chinahatsector = skins:Sector('China hat', 'Right')
	chinahatsector:Element('ToggleColor', 'enabled')
	chinahatsector:Element('Dropdown', 'animation', {options = {"none", 'default',"scanning", "lava", "pulse"}})
	chinahatsector:Element('ToggleColor', 'trails')

	local ChinaHat = game:GetObjects('rbxassetid://9756426202')[1]

	RunService.RenderStepped:connect(function()
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("LowerTorso") and trannyenabled then
			a.Position = game.Players.LocalPlayer.Character.LowerTorso.Position + Vec3(0,-0.4,0)
			a.Rotation = game.Players.LocalPlayer.Character.LowerTorso.Rotation
		end
		a.Transparency = trannyenabled and 0 or 1
		
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('UpperTorso') and values.skins['China hat'].enabled.Toggle and not LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory') then 
			local l = ChinaHat['China hat'].PlainMenacingStrawHatAccessory:Clone()
			l.Parent = LocalPlayer.Character
			l.Handle.Color = values.skins['China hat'].enabled.Color
			for _, v in pairs(LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory').Handle:GetChildren()) do
				if v:IsA'Trail' then
					v.Enabled = values.skins['China hat'].trails.Toggle
					v.Color = ColorSequence.new(values.skins['China hat'].trails.Color,values.skins['China hat'].trails.Color)
				end
			end
			local AccessoryWeld = Instance.new('Weld')
			AccessoryWeld.Name = 'AccessoryWeld'
			AccessoryWeld.Parent = l.Handle
			AccessoryWeld.Part1 = LocalPlayer.Character.Head
			AccessoryWeld.Part0 = l.Handle
			AccessoryWeld.C0 = CF(0, -0.7, 0)
		end
		
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('Torso') and LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory') and not values.skins['China hat'].enabled.Toggle then
			LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory'):Destroy()
		elseif values.skins['China hat'].enabled.Toggle and LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory') then
			local obj = LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory')
			if values.skins['China hat'].animation.Dropdown == "none" then
				obj.Handle.SpecialMesh.TextureId = ""
			elseif values.skins['China hat'].animation.Dropdown == "scanning" then
				obj.Handle.SpecialMesh.TextureId = "rbxassetid://5843010904"
			elseif values.skins['China hat'].animation.Dropdown == "lava" then
				obj.Handle.SpecialMesh.TextureId = "rbxassetid://53883408"
			elseif values.skins['China hat'].animation.Dropdown == "pulse" then
				obj.Handle.SpecialMesh.TextureId = "rbxassetid://wtf"
			elseif values.skins['China hat'].animation.Dropdown == 'default' then
				obj.Handle.SpecialMesh.TextureId = 'rbxassetid://8369894581'
			end
			if obj.Handle.Color ~= values.skins['China hat'].enabled.Color then
				obj.Handle.Color = values.skins['China hat'].enabled.Color
			end
			for _, v in pairs(LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory').Handle:GetChildren()) do
				if v:IsA'Trail' then
					v.Enabled = values.skins['China hat'].trails.Toggle
					v.Color = ColorSequence.new(values.skins['China hat'].trails.Color,values.skins['China hat'].trails.Color)
				end
			end
		end
	end)	
end

--[[
for i,v in pairs(getgc(true)) do
	if typeof(v) == 'table' then
		if rawget(v,'EnableRagdoll')  then
			v.EnableRagdoll = function()
			    return
			   end
		end
	end
end

local LocalPlayer = game.Players.LocalPlayer

local ChrModels = game:GetObjects("rbxassetid://7951832105")[1]
--repeat wait() until ChrModels ~= nil 

ChangeCharacter(ChrModels['Imposter'])

local oldNamecall; oldNamecall = hookmetamethod(game,'__namecall', function(self, ...) 
	local method = tostring(getnamecallmethod()) 
	local args = {...} 
    if self.Name == 'ChangeCharacter' then
        return wait(9e9)
    end

	return oldNamecall(self, unpack(args)) 
end)
--]]