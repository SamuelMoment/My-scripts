if game.CoreGui:FindFirstChild("electric boogalo") then return error('script is already executed or you executed another script')end

BeforeLoad = tick()


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

local Vec2 = Vector2.new
local Vec3 = Vector3.new
local CF = CFrame.new
local INST = Instance.new
local COL3 = Color3.new 
local UDIM2 = UDim2.new

local COL3RGB = Color3.fromRGB
local COL3HSV = Color3.fromHSV
local COL3HEX = Color3.fromHex

local CLAMP = math.clamp 
local FLOOR = math.floor 

local RANDOM = math.random 

local CFAngles = CFrame.Angles

local FIND = string.find 
local LEN = string.len 
local SUB = string.sub 
local GSUB = string.gsub 
local RAY = Ray.new

local INSERT = table.insert 
local TBLFIND = table.find 
local TBLREMOVE = table.remove
local TBLSORT = table.sort 

function findtextrandom(text)
	if text:find(' @r ') then 
		local b = text:split(' @r ')
		return b[math.random(#b)]
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

local cfglocation = "SamuelPaste_cw/cfgs/"
makefolder('SamuelPaste_cw')
makefolder('SamuelPaste_cw/cfgs')

local loopkillplr = {}
for i,v in pairs(game.Players:GetPlayers()) do
	if v == game.Players.LocalPlayer then continue end
	table.insert(loopkillplr,v.Name)
end

if not isfile('SamuelPaste_cw/customkillsay.txt') then
	writefile('SamuelPaste_cw/customkillsay.txt', "message1\
message2\
message3"
)
end

local library,Signal,ConfigLoad,ConfigLoad1,ConfigUpdateCfgList,ConfigUpdateCfgList2,CreateHitElement = loadstring(game:HttpGet("https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/library.lua"))()
library.setcfglocation(cfglocation)

local Spawn = Signal.new()
local Died = Signal.new()
local KillFeed = Signal.new()
	
local cacheModels = game:GetObjects("rbxassetid://11377511083")[1]
repeat wait() until cacheModels ~= nil
local ChrModels = cacheModels:FindFirstChild('r6')
repeat wait() until ChrModels ~= nil 

local ChrModels2 = cacheModels:FindFirstChild('r6 2')
repeat wait() until ChrModels2 ~= nil 

local ChrModels3 = cacheModels:FindFirstChild('r6 3')
repeat wait() until ChrModels3 ~= nil

local ChinaHat = game:GetObjects('rbxassetid://11377527413')[1]
repeat wait() until ChinaHat ~= nil

local Effects = game:GetObjects('rbxassetid://11377514627')[1]
repeat wait() until Effects ~= nil

repeat wait() until game:IsLoaded()

CreateHitElement(" Welcome, "..game.Players.LocalPlayer.Name.."!",MainUIColor,5)
wait(0.5)

local Players = game:GetService("Players") 
local LocalPlayer = Players.LocalPlayer 
local ReplicatedStorage = game.ReplicatedStorage
local UserInputService = game.UserInputService
local RunService = game.RunService
local Lighting = game.Lighting
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local mouse = Mouse

local modules = {}
local events = game:GetService("ReplicatedStorage").Communication.Events
local functions = game:GetService("ReplicatedStorage").Communication.Functions

--[[ MENU SETUP ]]--
local gui = library.New("SamuelPaste")
local rage = gui.Tab('rage')
local legit = gui.Tab("legit")
local misc = gui.Tab('misc')
local visuals = gui.Tab('visuals')
local skins = gui.Tab('skins')
local other = gui.Tab("other")

--[[FUNCTIONS]]--
do
	function GetClosest(distane,additional)
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
		if not (Character or HumanoidRootPart) then
			return
		end

		local TargetDistance = distane or 50
		local additional = additional or function(...) return true end
		local Target

		for i, v in ipairs(Players:GetPlayers()) do
			if
				v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
					v.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and additional(v) == true
			 then
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
	function GetClosests(distane,additional)
		if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then return end
		local tbl = {}
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		local TargetDistance = distane or 50
		local additional = additional or function(...) return true end
		local Target

		for i, v in ipairs(Players:GetPlayers()) do
			if
				v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
					v.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and additional(v) == true
			 then
				local TargetHRP = v.Character.HumanoidRootPart
				local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
				if mag < TargetDistance then
					table.insert(tbl,{v,mag})
				end
			end
		end
		table.sort(tbl,function(a,b)
			return a[2] < b[2]
		end)
	   return tbl
	end
	function getClosestToMouse(distance)
		local player, nearestDistance = nil, distance or 99999
		for i,v in pairs(Players:GetPlayers()) do
			if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") then
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
	function GetState(plr)
		return modules['DataHandler'].getSessionDataRoduxStoreForPlayer(plr):getState()
	end	
end




--[[BYPASS]]--
do
	for i,v in pairs(getgc(true)) do
		if typeof(v) ~= 'table' then continue end
		if rawget(v, 'getIsBodyMoverCreatedByGame') then
			v.getIsBodyMoverCreatedByGame = function(gg)
				return true
			end
			
		end
		if rawget(v, 'connectCharacter') then
			 v.connectCharacter = function(gg) return wait(9e9) end
		end
		if rawget(v,'Remote')  then
			for i,v in pairs(getconnections(v.Remote:GetPropertyChangedSignal('Name'))) do
				v:Disable()
			end
			v.Remote.Name = v.Name
		end
	end
	local old_namecall;old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
		local args = {...}
		local method = getnamecallmethod()
		if method == 'Kick' then return wait(9e9) end
		if self.Name == 'BAC' and not checkcaller() then
			args[1] = {}
			args[1][1] = args[1]
		end
		return old_namecall(self,unpack(args))
	end))
	for i = 1,10 do -- inf jump bypass
		events.StartFastRespawn:FireServer()
		functions.CompleteFastRespawn:FireServer()
		wait(.1)
	end	
end
--[[ NEVERMORE ]]--
do
	local nm = require(ReplicatedStorage.Framework.Nevermore)
	local AM = rawget(nm, '_lookupTable') --credits to snnwer for that
	--[[ shit i keep forgetting
	getSessionDataRoduxStoreForPlayer
	--]]
	for i,v in pairs(AM) do
		modules[i] = require(v)
	end
	for i,v in pairs(getgc(true)) do
		if typeof(v) == 'table' then
			if rawget(v,'removeKillFeedIdx') then
				modules['killfeed'] = v
			end
		end
	end
end
--[[ SIGNALS ]]--
do
	--killfeed
	local old;old = hookfunction(modules['killfeed'].render,function(a)
		local props = a.props
		local whoKilled = props.characterThatKilled
		local whoDied = props.characterThatDied
		if not (whoKilled or whoDied) then return end
		KillFeed:Fire(tostring(whoKilled),tostring(whoDied))
		
		return old(a)
	end)
	--spawn and death
	for i,v in pairs(getgc()) do
		if getinfo(v).name == 'onSpawnCharacter' then
			local old;old = hookfunction(v,function(...)
				task.spawn(function()
					repeat wait() until LocalPlayer.Character and LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool')
					LocalPlayer.Character:WaitForChild('Humanoid').Died:Connect(function()
						Died:Fire()
					end)
					Spawn:Fire(LocalPlayer.Character)
				end)
				return old(...) 
			end)
		end
	end
end

--[[ MAIN ]]--
do
	--[[ TARGET INFO ]]--
	
	--[[ KILL AURA ]]--
	local kaura = rage:Sector('Killaura','Left')
	kaura:Element('Toggle','Enabled')
	kaura:Element('Dropdown','Priority',{options={'distance','health'}})
	kaura:Element('Slider','Distance',{min = 1,max = 13,default = 13})
	--[[ TELEPORT BEHIND ]]--
	kaura:Element('Toggle','Teleport behind')
	kaura:Element('Slider','Teleport distance',{min = 1,max = 10,default = 5})
	kaura:Element('Slider','Teleport distance Y',{min = 0,max = 10,default = 1})
	----------------------------------------------------------------------------
	do
		local executing = false
		local CurrentClosest
		RunService.Stepped:Connect(function()
			if not values.rage.Killaura.Enabled.Toggle then return end
			local Closest = GetClosests(values.rage.Killaura.Distance.Slider)
			
			if #Closest ~= 0 and executing == false then
				if values.rage.Killaura.Priority.Dropdown == 'health' then
					table.sort(Closest,function(a,b)
						return a[1].Character.Health < b[1].Character.Health
					end)
				end
				executing = true
				pcall(function()
					for i, v in pairs(LocalPlayer.Character:GetChildren()) do
						if v:IsA("Tool") then
							if v:FindFirstChild("Hitboxes") ~= nil then
								Weapon = v
							end
						end
					end
					if not Weapon then
					else								
						for i=1,3 do
							local args1 = {
								[1] = Weapon,
								[2] = i
							}		
							events.MeleeSwing:FireServer(unpack(args1))
							wait(.1)
							for i,v in pairs(Closest) do
								if Weapon.Parent ~= LocalPlayer.Character then break end
								if not v[1].Character:FindFirstChild('Torso') then continue end
								CurrentClosest = v[1]
								local args = {
									[1] = Weapon,
									[2] = v[1].Character.Torso,
									[3] = Weapon.Hitboxes.Hitbox,
									[4] = v[1].Character.Torso.Position,
									[5] = v[1].Character.Torso.CFrame:ToObjectSpace(
										CFrame.new(v[1].Character.Torso.Position)
									),
									[6] = v[1].Character.Torso.Position,
								} 
								if modules['DataHandler'].getSessionDataRoduxStoreForPlayer(v[1]):getState().parry.isParrying == false then
									events.MeleeDamage:FireServer(unpack(args))
									events.MeleeDamage:FireServer(unpack(args))
								else
									continue
								end
							end
							if Weapon.Parent ~= LocalPlayer.Character then break end
						end
					end
				end)
				executing = false
			end
		end)
		RunService.Stepped:Connect(function()
			pcall(function()
				if CurrentClosest and IsAlive(CurrentClosest) then
					if values.rage.Killaura['Teleport behind'].Toggle then
						LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentClosest.Character.Torso.CFrame * CFrame.new(0,values.rage.Killaura['Teleport distance Y'].Slider,values.rage.Killaura['Teleport distance'].Slider)
					end		
				end
			end)
		end)
	end
	----------------------------------------------------------------------------
	--[[ SILENT AIM ]]--
	local sa = rage:Sector('Silent Aim','Right')
	sa:Element('Toggle','Enabled')
	sa:Element('Slider','Distance',{min = 1,max = 20,default = 20})
	sa:Element('Slider','FOV',{min = 1,max = 420,default = 120})
	sa:Element('ToggleTrans', 'Draw FOV', {default = {Color = COL3RGB(255,255,255), Transparency = 0}})
	sa:Element('Toggle', 'Filled FOV')
	sa:Element('Slider', 'FOV Thickness', {min = 1, max = 10, default = 1})
	task.spawn(function()
		local Fov = Drawing.new("Circle") 
		Fov.Filled = true 
		Fov.Color = COL3RGB(15,15,15) 
		Fov.Transparency = 0.5 
		Fov.Position = Vec2(Mouse.X, Mouse.Y + 36) 
		Fov.Radius = 120
		RunService.Heartbeat:Connect(function()
		
			--pcall(function()
				Fov.Visible = values.rage['Silent Aim']['Draw FOV'].Toggle

				Fov.Transparency = 1-values.rage['Silent Aim']['Draw FOV'].Transparency
			
				Fov.Color =  values.rage['Silent Aim']['Draw FOV'].Color
				Fov.Position = Vec2(Mouse.X, Mouse.Y + 36)
				Fov.Radius = values.rage['Silent Aim']['FOV'].Slider
				Fov.Thickness = values.rage['Silent Aim']['FOV Thickness'].Slider
				Fov.Filled = values.rage['Silent Aim']['Filled FOV'].Toggle
			--end)		
			
		end)
	end)
	sa:Element('ToggleTrans', 'Highlight target')
	sa:Element('ToggleTrans', 'Outline highlight target')	
	
	task.spawn(function()
		local blacklist = {
			'getLedgeManifestAtCurrentPos',
			'isLedgePositionObstructed',
			'getFloorRayRes',
			'detectGrabbableLedge',
			'getLedgeManifest',
			'detectLedgeVerticalCorner'
		}
		local old=modules['RangedWeaponHandler'].calculateFireDirection
		local closest
		modules['RangedWeaponHandler'].calculateFireDirection=function(...)
			closest = getClosestToMouse(values.rage['Silent Aim'].FOV.Slider)
			if closest ~= nil then
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA('Tool') and LocalPlayer.Character:FindFirstChildWhichIsA('Tool'):FindFirstChild('ClientAmmo') then
					local tool = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
					local firepos = tool:FindFirstChild('FirePoint',true)
					if firepos then
						return CFrame.new(firepos.WorldCFrame.Position,closest.Character.Head.Position).LookVector*30
					end
				end
			end
			return old(...)
		end	
		local oldNamecall; oldNamecall = hookmetamethod(game,'__namecall', function(self, ...) 
			local method = tostring(getnamecallmethod()) 
			local args = {...} 
			if method == 'Raycast' and values.rage['Silent Aim'].Enabled.Toggle then
				local a = getinfo(4)
				if closest and closest.Character ~= nil and a and not table.find(blacklist,a.name) then
					if (closest.Character.Head.Position-args[1]).Magnitude <= values.rage['Silent Aim'].FOV.Slider then
						args[2] = (closest.Character.Head.Position-args[1]).Unit * 100
					end
				end
			end
			return oldNamecall(self,unpack(args))
		end)	
	end)
end

--[[ CONFIG SHIT ]]--
do
	local allcfgs = {} 
	for _,cfg in pairs(listfiles(cfglocation)) do 
		local cfgname = GSUB(cfg, cfglocation, "") 
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
			local cfgname = GSUB(cfg, cfglocation, "") 
			INSERT(allcfgs, cfgname) 
		end
		ConfigUpdateCfgList2:Fire()
		ConfigUpdateCfgList:Fire()
	end)

	configs:Element("Toggle", "keybind list", nil, function(tbl) 
		library:SetKeybindVisible(tbl.Toggle) 
	end) 


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
end

--[[ MISC ]]--
do
	local misc2 = misc:Sector('Character Exploits','Right') -- skidded sort from pjhook prem
	misc2:Element('Toggle','No Jump Cooldown')
	misc2:Element('Toggle','No Dash Cooldown')
	misc2:Element('Toggle','No Fall Damage')
	
	misc2:Element('Toggle','Infinite Stamina/Air')
	misc2:Element('Toggle','Infinite Jump')
	
	misc2:Element('ToggleKeybind','Fly',{},function(tbl)
		if LocalPlayer.Character then
			GetState(LocalPlayer).fly.isFlying = tbl.Toggle and tbl.Active
			if tbl.Toggle and tbl.Active then
				getupvalue(modules['FlyHandlerClient']._startModule,2)(LocalPlayer.Character)
			elseif LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('LinearVelocity') then
				LocalPlayer.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('LinearVelocity'):Destroy()
			end
		end
	end)
	misc2:Element('ToggleKeybind','No Clip')
	--[[ SHIT THAT ISNT HOOK BUT IDK HOW TO CALL LMAO ]]--
	UserInputService.InputBegan:Connect(function(k,j)
		if j then return end
		if k.KeyCode ==  Enum.KeyCode.Space then
			if values.misc['Character Exploits']["Infinite Jump"].Toggle then
				pcall(function()
					LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end)
			end
		end
	end)
	
	--[[ HOOKS ]]--
	-------------------STAMINA-------------------
	local old = modules['Stamina'].getRealNewStaminaValue
	modules['Stamina'].getRealNewStaminaValue = function(...)
		return values.misc['Character Exploits']['Infinite Stamina/Air'].Toggle and 150 or old(...)
	end
end