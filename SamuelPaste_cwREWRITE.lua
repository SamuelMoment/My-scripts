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
--[[
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
--]]

local library,Signal = loadstring(game:HttpGet("https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/library.lua"))()
--[[
since new library




--]]



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

--CreateHitElement(" Welcome, "..game.Players.LocalPlayer.Name.."!",MainUIColor,5)
--wait(0.5)

local Players = game:GetService("Players") 
local LocalPlayer = Players.LocalPlayer 
local ReplicatedStorage = game.ReplicatedStorage
local UserInputService = game.UserInputService
local RunService = game.RunService
local Lighting = game.Lighting
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local modules = {}
local events = game:GetService("ReplicatedStorage").Communication.Events
local functions = game:GetService("ReplicatedStorage").Communication.Functions

makefolder('SamuelPaste')
--[[ MENU SETUP ]]--
local main = library:Load{
    Name = "SamuelPaste",
    SizeX = 600,
    SizeY = 650,
    Theme = "Midnight",
    Extension = "cfg", -- config file extension
    Folder = 'SamuelPaste/cfgs' -- config folder name
}
local rage 	  = main:Tab('rage')
local legit   = main:Tab("legit")
local misc 	  = main:Tab('misc')
local visuals = main:Tab('visuals')
local skins   = main:Tab('skins')

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
					local distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(root.X, root.Y)).Magnitude

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
	local kaura = rage:Section{
		Name='Killaura',
		Side='Left',
	}
	kaura:Toggle{
		Name='Enabled',
		Flag='KillauraEnabled',
	}
	
	kaura:Dropdown{
		Name = 'Priority',
		Content = {
			'Health',
			'Distance',
		},
		Flag = 'KillauraPriority'
	}
	
	kaura:Slider{
		Name = 'Distance',
		Min = 1,
		Max = 13,
		Default = 13,
		Flag = 'KillauraDistance'
	}
	----------------------------------------------------------------------------
	kaura:Separator('Teleport Behind')
	----------------------------------------------------------------------------
	kaura:Toggle{
		Name = 'Enabled',
		Flag = 'KillauraBehind'
	}
	
	kaura:Slider{
		Name = 'Distance',
		Min = 1,
		Max = 10,
		Default = 5,
		Flag = 'KillauraBehindDistance'
	}
	
	kaura:Slider{
		Name = 'Distance',
		Min = 1,
		Max = 10,
		Default = 1,
		Flag = 'KillauraBehindDistanceY'
	}
	----------------------------------------------------------------------------
	do
		local executing = false
		local CurrentClosest
		RunService.Stepped:Connect(function()
			if not library.flags['KillauraEnabled'] then return end
			local Closest = GetClosests(library.flags['KillauraDistance'])
			
			if #Closest ~= 0 and executing == false then
				if library.flags['KillauraPriority'] == 'Health' then
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
					if library.flags['KillauraBehind'] then
						LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentClosest.Character.Torso.CFrame * CFrame.new(0,library.flags['KillauraBehindDistanceY'],library.flags['KillauraBehindDistance'])
					end		
				end
			end)
		end)
	end
	----------------------------------------------------------------------------
	--[[ SILENT AIM ]]--
	local sa = rage:Section{Name='Silent Aim',Side='Right'}
	sa:Toggle{
		Name = 'Enabled',
		Flag = 'RageSilentAim'
	}
	
	sa:Slider{
		Name = 'FOV',
		Min = 1,
		Max = 420,
		Default = 120,
		Flag = 'RageFOV'
	}
	
	sa:Toggle{
		Name = 'Draw FOV',
		Flag = 'RageFOVDraw'
	}:ColorPicker{
		Default = Color3.fromRGB(255,255,255),
		DefaultAlpha = 0,
		Flag = 'RageFOVDrawColor'
	}
	
	sa:Toggle{
		Name =  'Filled FOV',
		Flag = 'RageFOVDrawFilled'
	}	
	
	sa:Slider{
		Name = 'FOV',
		Min = 1,
		Max = 10,
		Default = 1,
		Flag = 'RageFOVDrawThickness'
	}
	task.spawn(function()
		local Fov = Drawing.new("Circle") 
		Fov.Filled = true 
		Fov.Color = Color3.fromRGB(15,15,15) 
		Fov.Transparency = 0.5 
		Fov.Position = Vector2.new(Mouse.X, Mouse.Y + 36) 
		Fov.Radius = 120
		RunService.Heartbeat:Connect(function()
			Fov.Visible = library.flags['RageFOVDraw']

			Fov.Transparency = 1-library.flags['RageFOVDrawColor'].A
			
			Fov.Color =  library.flags['RageFOVDrawColor']
			Fov.Position = Vec2(Mouse.X, Mouse.Y + 36)
			Fov.Radius = library.flags['RageFOV']
			Fov.Thickness = library.flags['RageFOVDrawThickness']
			Fov.Filled = library.flags['RageFOVDrawFilled']
		end)
	end)
	--sa:ToggleTrans', 'Highlight target')	
	
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
			closest = getClosestToMouse(library.flags['RageFOV'])
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
			if method == 'Raycast' and library.flags['RageSilentAim'] then
				local a = getinfo(4)
				if closest and closest.Character ~= nil and a and not table.find(blacklist,a.name) then
					if (closest.Character.Head.Position-args[1]).Magnitude <= 15 then
						args[2] = (closest.Character.Head.Position-args[1]).Unit * 100
					end
				end
			end
			return oldNamecall(self,unpack(args))
		end)	
	end)
end

--[[ MISC ]]--
do
	local misc2 = misc:Section{Name='Character Exploits',Side='Right'} -- skidded sort from pjhook prem
	misc2:Toggle{
		Name = 'No Jump Cooldown',
		Flag = 'NJC'
	}
	misc2:Toggle{
		Name = 'No Dash Cooldown',
		Flag = 'NDC'
	}
	misc2:Toggle{
		Name = 'No Fall Damage',
		Flag = 'NFD'
	}
	misc2:Toggle{
		Name = 'Infinite Stamina/Air',
		Flag = 'InfStamina'
	}
	misc2:Toggle{
		Name = 'Infinite Jump',
		Flag = 'InfJump'
	}
	
	misc2:Toggle{
		Name = 'Fly',
		Flag = 'Fly'
	}:Keybind{
		Blacklist = {Enum.UserInputType.MouseButton1},
		Flag = 'FlyKey',
		Mode = 'Toggle',
		Callback = function(key,from)
			if from then return end
			if LocalPlayer.Character then
				GetState(LocalPlayer).fly.isFlying = tbl.Toggle and tbl.Active
				if library.flags['Fly'] then
					getupvalue(modules['FlyHandlerClient']._startModule,2)(LocalPlayer.Character)
				elseif LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('LinearVelocity') then
					LocalPlayer.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('LinearVelocity'):Destroy()
				end
			end			
		end
	}

	misc2:Toggle{
		Name = 'No Clip',
		Flag = 'Noclip'
	}:Keybind{
		Blacklist = {Enum.UserInputType.MouseButton1},
		Flag = 'NoclipKey',
		Mode = 'Toggle',
	}
	--[[ SHIT THAT ISNT HOOK BUT IDK HOW TO CALL LMAO ]]--
	UserInputService.InputBegan:Connect(function(k,j)
		if j then return end
		if k.KeyCode ==  Enum.KeyCode.Space then
			if library.flags['InfJump'] then
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
		return library.flags['InfStamina'] and 150 or old(...)
	end
end

--[[ CONFIGURTAION ]]--
do
	--library:SaveConfig("config", true) -- universal config
	--library:SaveConfig("config") -- game specific config
	--library:DeleteConfig("config", true) -- universal config
	--library:DeleteConfig("config") -- game specific config
	--library:GetConfigs(true) -- return universal and game specific configs (table)
	--library:GetConfigs() -- return game specific configs (table)
	--library:LoadConfig("config", true) -- load universal config
	--library:LoadConfig("config") -- load game specific config

	local configs = main:Tab("Configuration")

	local themes = configs:Section{Name = "Theme", Side = "Left"}

	local themepickers = {}

	local themelist = themes:Dropdown{
		Name = "Theme",
		Default = library.currenttheme,
		Content = library:GetThemes(),
		Flag = "Theme Dropdown",
		Callback = function(option)
			if option then
				library:SetTheme(option)

				for option, picker in next, themepickers do
					picker:Set(library.theme[option])
				end
			end
		end
	}

	library:ConfigIgnore("Theme Dropdown")

	local namebox = themes:Box{
		Name = "Custom Theme Name",
		Placeholder = "Custom Theme",
		Flag = "Custom Theme"
	}

	library:ConfigIgnore("Custom Theme")

	themes:Button{
		Name = "Save Custom Theme",
		Callback = function()
			if library:SaveCustomTheme(library.flags["Custom Theme"]) then
				themelist:Refresh(library:GetThemes())
				themelist:Set(library.flags["Custom Theme"])
				namebox:Set("")
			end
		end
	}

	local customtheme = configs:Section{Name = "Custom Theme", Side = "Right"}

	themepickers["Accent"] = customtheme:ColorPicker{
		Name = "Accent",
		Default = library.theme["Accent"],
		Flag = "Accent",
		Callback = function(color)
			library:ChangeThemeOption("Accent", color)
		end
	}

	library:ConfigIgnore("Accent")

	themepickers["Window Background"] = customtheme:ColorPicker{
		Name = "Window Background",
		Default = library.theme["Window Background"],
		Flag = "Window Background",
		Callback = function(color)
			library:ChangeThemeOption("Window Background", color)
		end
	}

	library:ConfigIgnore("Window Background")

	themepickers["Window Border"] = customtheme:ColorPicker{
		Name = "Window Border",
		Default = library.theme["Window Border"],
		Flag = "Window Border",
		Callback = function(color)
			library:ChangeThemeOption("Window Border", color)
		end
	}

	library:ConfigIgnore("Window Border")

	themepickers["Tab Background"] = customtheme:ColorPicker{
		Name = "Tab Background",
		Default = library.theme["Tab Background"],
		Flag = "Tab Background",
		Callback = function(color)
			library:ChangeThemeOption("Tab Background", color)
		end
	}

	library:ConfigIgnore("Tab Background")

	themepickers["Tab Border"] = customtheme:ColorPicker{
		Name = "Tab Border",
		Default = library.theme["Tab Border"],
		Flag = "Tab Border",
		Callback = function(color)
			library:ChangeThemeOption("Tab Border", color)
		end
	}

	library:ConfigIgnore("Tab Border")

	themepickers["Tab Toggle Background"] = customtheme:ColorPicker{
		Name = "Tab Toggle Background",
		Default = library.theme["Tab Toggle Background"],
		Flag = "Tab Toggle Background",
		Callback = function(color)
			library:ChangeThemeOption("Tab Toggle Background", color)
		end
	}

	library:ConfigIgnore("Tab Toggle Background")

	themepickers["Section Background"] = customtheme:ColorPicker{
		Name = "Section Background",
		Default = library.theme["Section Background"],
		Flag = "Section Background",
		Callback = function(color)
			library:ChangeThemeOption("Section Background", color)
		end
	}

	library:ConfigIgnore("Section Background")

	themepickers["Section Border"] = customtheme:ColorPicker{
		Name = "Section Border",
		Default = library.theme["Section Border"],
		Flag = "Section Border",
		Callback = function(color)
			library:ChangeThemeOption("Section Border", color)
		end
	}

	library:ConfigIgnore("Section Border")

	themepickers["Text"] = customtheme:ColorPicker{
		Name = "Text",
		Default = library.theme["Text"],
		Flag = "Text",
		Callback = function(color)
			library:ChangeThemeOption("Text", color)
		end
	}

	library:ConfigIgnore("Text")

	themepickers["Disabled Text"] = customtheme:ColorPicker{
		Name = "Disabled Text",
		Default = library.theme["Disabled Text"],
		Flag = "Disabled Text",
		Callback = function(color)
			library:ChangeThemeOption("Disabled Text", color)
		end
	}

	library:ConfigIgnore("Disabled Text")

	themepickers["Object Background"] = customtheme:ColorPicker{
		Name = "Object Background",
		Default = library.theme["Object Background"],
		Flag = "Object Background",
		Callback = function(color)
			library:ChangeThemeOption("Object Background", color)
		end
	}

	library:ConfigIgnore("Object Background")

	themepickers["Object Border"] = customtheme:ColorPicker{
		Name = "Object Border",
		Default = library.theme["Object Border"],
		Flag = "Object Border",
		Callback = function(color)
			library:ChangeThemeOption("Object Border", color)
		end
	}

	library:ConfigIgnore("Object Border")

	themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
		Name = "Dropdown Option Background",
		Default = library.theme["Dropdown Option Background"],
		Flag = "Dropdown Option Background",
		Callback = function(color)
			library:ChangeThemeOption("Dropdown Option Background", color)
		end
	}

	library:ConfigIgnore("Dropdown Option Background")

	local configsection = configs:Section{Name = "Configs", Side = "Left"}

	local configlist = configsection:Dropdown{
		Name = "Configs",
		Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
		Flag = "Config Dropdown"
	}

	library:ConfigIgnore("Config Dropdown")

	local loadconfig = configsection:Button{
		Name = "Load Config",
		Callback = function()
			library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
		end
	}

	local delconfig = configsection:Button{
		Name = "Delete Config",
		Callback = function()
			library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
			configlist:Refresh(library:GetConfigs())
		end
	}


	local configbox = configsection:Box{
		Name = "Config Name",
		Placeholder = "Config Name",
		Flag = "Config Name"
	}

	library:ConfigIgnore("Config Name")

	local save = configsection:Button{
		Name = "Save Config",
		Callback = function()
			library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
			configlist:Refresh(library:GetConfigs())
		end
	}

	local keybindsection = configs:Section{Name = "UI Toggle Keybind", Side = "Left"}

	keybindsection:Keybind{
		Name = "UI Toggle",
		Flag = "UI Toggle",
		Default = Enum.KeyCode.RightShift,
		Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
		Callback = function(_, fromsetting)
			if not fromsetting then
				library:Close()
			end
		end
	}
end