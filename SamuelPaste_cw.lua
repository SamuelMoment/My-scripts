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
['COL3HEX'] = Color3.fromHex,

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

local function GetTeam(plr)
	return game.Teams[plr.Team.Name]
end   


local bordercolorlist = {}

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
string.sub(string,startstring,endstring), exam: string.sub('banana',1,3) - ban



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
--local cfglocation = "pastedstormy/pastedstormycfgs/"
 
--makefolder("pastedstormy") 
--makefolder("pastedstormy/pastedstormycfgs/")
 
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

if not isfile('SamuelPaste_cw/customchatspam.txt') then
	writefile('SamuelPaste_cw/customchatspam.txt', "message1\
message2\
message3"
)
end
--[[if not isfile('SamuelPaste_cw/customantitags.txt') then
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
end--]]


local Players = game:GetService("Players") 
local LocalPlayer = Players.LocalPlayer 


local MainUIColor = Color3.fromRGB(255,20,147)
											
getgenv().emojis = {
	[":clown:"] = utf8.char(129313);
	[":cold_face:"] = utf8.char(129398);
	[":neutral:"] = utf8.char(128528);
	[":sob:"] = utf8.char(128557);
}

--[[if #allcfgs == 0 then
INSERT(allcfgs, 'shit so script wont crash')
end--]]


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
	CreateHitElement(" Welcome, "..LocalPlayer.Name.."!",MainUIColor,5)
	wait(0.5)
	--[[CreateHitElement(" To close gui, go to misc tab and set up keybind  ",MainUIColor,5, 0, 340, 0, 30)
	CreateHitElement(" !!!  IMPORTANT  !!!\
 Expect many bugs/lags since dev is a retard,\
 Report any issues to my server!  ",MainUIColor,15, 0, 300, 0, 50)--]]

 
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
--for i,v in pairs(getgc(true)) do if type(v) == "table" and rawget(v,"AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING") then v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 99999999999999999999999999999 end end 
	getgenv().rangedvalues = {}
local SavedValues = {}
for i,v in pairs(getgc(true)) do
	if typeof(v) == 'table'  then
		if rawget(v,"getIsBodyMoverCreatedByGame") then
			v.getIsBodyMoverCreatedByGame = function(...)
				return true
			end
		end
		if rawget(v, 'kick') then
			v.kick = function() return wait(9e9) end
		end
		if rawget(v, 'randomDelayKick') then
			v.randomDelayKick = function() return wait(9e9) end
		end
		if rawget(v, 'connectCharacter') then
			v.connectCharacter = function(gg) return wait(9e9) end
		end
		if rawget(v,"Remote")  then
			v.Remote.Name = v.Name
		end
		if rawget(v,'antiSpeed') then
			v.antiSpeed = {}
			v.antiBodyMover = {}
			v.antiInfJump = {}
			--print('sex')
		end
		if rawget(v,'cancelReload') then
			task.spawn(function()
				SavedValues['oldReload'] = v.cancelReload
				RunService.RenderStepped:Connect(function()
					pcall(function()
						if values.rage['Ranged sector']['No reload cancel'].Toggle then
							v.cancelReload = function(...)
								return
							end
						else
							v.cancelReload = SavedValues['oldReload']
						end
					end)
				end)
			end)
		end
		if rawget(v,'maxSpread') and rawget(v,'minSpread') then
			pcall(function()
				table.clear(rangedvalues[string.lower(v.displayName)])
			end)
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
				['maxDistance'] = v.maxDistance
			}
		end
		if rawget(v,'removeKillFeedIdx') and rawget(v,'render') then
			--print('found')
			SavedValues['oldrender'] = v.render
			v.render = function(sex1)
				KillFeed:Fire(sex1.props.killfeedItemInfo.playerThatKilled,sex1.props.killfeedItemInfo.playerThatDied)
				return SavedValues['oldrender'](sex1)
			end
		end
		if rawget(v, 'removeRichTextTags') then
			replaceclosure(rawget(v, 'removeRichTextTags'), function(a)
				return a
			end)
		end
		if rawget(v,'getSessionDataRoduxStoreForPlayer') then
			SavedValues['getState'] = v.getSessionDataRoduxStoreForPlayer(game.Players.LocalPlayer)
			
		end
		if rawget(v,'knockbackCharacterPartAngular') then
			SavedValues['oldknockbackCharacterPartAngular'] = v.knockbackCharacterPartAngular
			
		end
		if rawget(v,'knockbackCharacterPart') then
			SavedValues["oldknockbackCharacterPart"] = v.knockbackCharacterPart
			
		end
		if rawget(v,'knockbackPartAngular') then
			SavedValues["oldknockbackPartAngular"] = v.knockbackPartAngular
			
		end
		if rawget(v,'knockbackPartForce') then
			SavedValues["oldknockbackPartForcer"] = v.knockbackPartForce
			
		end
		if rawget(v,'displayName') then
			if v.displayName == 'C4' then
				SavedValues["oldC4"] = v.preThrowDuration
			elseif v.displayName == 'Ghost Potion' then
				SavedValues['oldGhostTime'] = v.useTime
			elseif v.displayName == 'Bear Trap' then
				SavedValues['oldBear'] = v.useTime
			elseif v.displayName == 'Molotov' then
				SavedValues['oldMolotov'] = v.preThrowDuration
			elseif v.displayName == 'Frag Grenade' then
				SavedValues['oldGrenade'] = v.preThrowDuration
			elseif v.displayName == 'Smoke Grenade' then
				SavedValues['oldSmoke'] = v.preThrowDuration
			end
		end
	end	
end

if syn then

	local fw = require(game.ReplicatedStorage.Framework.Nevermore);
	syn_context_set(2)
	local acc = fw("AntiCheatHandlerClient")
	syn_context_set(7)
	
	nhk = hookfunction(Instance.new, function(...)
	   if getcallingscript() == "AntiCheatHandler" then
		   return wait(9e9) end
	   return nhk(...)
	end)
	lolz = hookfunction(task.spawn, function(...)
	   if getcallingscript() == "AntiCheatHandler" then return wait(9e9) end
	   if getcallingscript() == "AntiCheatHandlerClient" then return wait(9e9) end
	   return lolz(...)
	end)
	syn_context_set(2)
	local acc = fw("Flag")
	syn_context_set(7)

	hookfunction(acc.setFlags, function() return end)
	hookfunction(acc.addFlags, function() return end)
	hookfunction(acc.getIsMaxed, function() return end)
	hookfunction(acc.getFlags, function() return end)
	syn_context_set(1)
	hookfunc(fw("AntiCheatHandler").punish, function()
	   return;
	end)
	syn_context_set(7)
end




local flyKeyDown
local flyKeyUp
local events = game:GetService("ReplicatedStorage").Communication.Events
local functions = game:GetService("ReplicatedStorage").Communication.Functions


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

local GetClosest = function(Distance,Priority,IgnoreTarget)
	if IgnoreTarget == nil then IgnoreTarget = false end
	if Priority == nil then Priority = 'Dis' end
	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
	if not (Character or HumanoidRootPart) then return end

	local TargetDistance = Distance
	TargetHealth = 101
	local Target

	for i,v in ipairs(Players:GetPlayers()) do
		if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA('Humanoid').Health > 0 and LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').Health > 0 and (v.Backpack:FindFirstChildWhichIsA('Tool') or v.Character:FindFirstChildWhichIsA('Tool')) and (not values.rage.Players['Whitelist players'].Toggle or not table.find(values.rage['Players'].Players.Jumbobox,v.Name)) then
			local TargetHRP = v.Character.HumanoidRootPart
			local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
			if Priority == 'Health' then
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
			if values.rage['Players']['Target player'].Toggle and Target.Name == values.rage['Players']['Target'].Scroll and not IgnoreTarget and (Target.Backpack:FindFirstChildWhichIsA('Tool') or Target.Character:FindFirstChildWhichIsA('Tool')) then
				return Target
			end			
		end
	end
	
	return Target
end

function sFLY(vfly, ragdoll, platform)
	if flyKeyDown or flyKeyUp then
		flyKeyDown:Disconnect()
		flyKeyUp:Disconnect()
	end
	local T = LocalPlayer.Character.HumanoidRootPart
	local ctrl = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lctrl = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local s = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new("BodyGyro")
		local BV = Instance.new("BodyVelocity")
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(
			function()
				repeat
					wait()
					if LocalPlayer.Character.Humanoid:FindFirstChild("RagdollRemoteEvent") ~= nil then
						if ragdoll then
							LocalPlayer.Character.Humanoid:FindFirstChild("RagdollRemoteEvent"):FireServer(true)
						end
					end
					for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
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
					if not vfly and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
						LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = platform
					end
					if ctrl.L + ctrl.R ~= 0 or ctrl.F + ctrl.B ~= 0 or ctrl.Q + ctrl.E ~= 0 then
						s = 50
					elseif
						not (ctrl.L + ctrl.R ~= 0 or ctrl.F + ctrl.B ~= 0 or ctrl.Q + ctrl.E ~= 0) and
							s ~= 0
					 then
						s = 0
					end
					if (ctrl.L + ctrl.R) ~= 0 or (ctrl.F + ctrl.B) ~= 0 or (ctrl.Q + ctrl.E) ~= 0 then
						BV.velocity =
							((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.F + ctrl.B)) +
							((workspace.CurrentCamera.CoordinateFrame *
								CFrame.new(
									ctrl.L + ctrl.R,
									(ctrl.F + ctrl.B + ctrl.Q + ctrl.E) * 0.2,
									0
								).p) -
								workspace.CurrentCamera.CoordinateFrame.p)) *
							s
						lctrl = {F = ctrl.F, B = ctrl.B, L = ctrl.L, R = ctrl.R}
					elseif
						(ctrl.L + ctrl.R) == 0 and (ctrl.F + ctrl.B) == 0 and (ctrl.Q + ctrl.E) == 0 and
							s ~= 0
					 then
						BV.velocity =
							((workspace.CurrentCamera.CoordinateFrame.lookVector * (lctrl.F + lctrl.B)) +
							((workspace.CurrentCamera.CoordinateFrame *
								CFrame.new(
									lctrl.L + lctrl.R,
									(lctrl.F + lctrl.B + ctrl.Q + ctrl.E) * 0.2,
									0
								).p) -
								workspace.CurrentCamera.CoordinateFrame.p)) *
							s
					else
						BV.velocity = Vector3.new(0, 0, 0)
					end
					BG.cframe = workspace.CurrentCamera.CoordinateFrame
				until not FLYING
				ctrl = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				lctrl = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				s = 0
				BG:Destroy()
				BV:Destroy()
				if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
					LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
				end
			end
		)
	end
	flyKeyDown =
		Mouse.KeyDown:Connect(
		function(k)
			if k:lower() == "w" then
				ctrl.F = (vfly and vehicleflyspeed or iyflyspeed)
			elseif k:lower() == "s" then
				ctrl.B = -(vfly and vehicleflyspeed or iyflyspeed)
			elseif k:lower() == "a" then
				ctrl.L = -(vfly and vehicleflyspeed or iyflyspeed)
			elseif k:lower() == "d" then
				ctrl.R = (vfly and vehicleflyspeed or iyflyspeed)
			elseif QEfly and k:lower() == "e" then
				ctrl.Q = (vfly and vehicleflyspeed or iyflyspeed) * 2
			elseif QEfly and k:lower() == "q" then
				ctrl.E = -(vfly and vehicleflyspeed or iyflyspeed) * 2
			end
			pcall(
				function()
					workspace.CurrentCamera.CameraType = Enum.CameraType.Track
				end
			)
		end
	)
	flyKeyUp =
		Mouse.KeyUp:Connect(
		function(k)
			if k:lower() == "w" then
				ctrl.F = 0
			elseif k:lower() == "s" then
				ctrl.B = 0
			elseif k:lower() == "a" then
				ctrl.L = 0
			elseif k:lower() == "d" then
				ctrl.R = 0
			elseif k:lower() == "e" then
				ctrl.Q = 0
			elseif k:lower() == "q" then
				ctrl.E = 0
			end
		end
	)
	FLY()
end


invisfling = function()
    local oldHumanoid = LocalPlayer.Character.Humanoid
    local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
    local mouse = LocalPlayer:GetMouse()
    local flying = true
    local deb = true
    local ctrl = {f = 0, b = 0, l = 0, r = 0}
    local lastctrl = {f = 0, b = 0, l = 0, r = 0}
    local maxspeed = 50
    local speed = 50

    workspace.CurrentCamera.CameraSubject = torso


    function Fly()

        local bt = Instance.new("BodyThrust")
        bt.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        bt.Force = Vector3.new(99999, 0, 99999)
        bt.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		
        Instance.new("SelectionBox", game.Players.LocalPlayer.Character.HumanoidRootPart).Adornee = game.Players.LocalPlayer.Character.HumanoidRootPart
		
        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(0, 0, 0)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0, 0, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        repeat
            wait()
            if oldHumanoid:FindFirstChildOfClass "RemoteEvent" ~= nil then
                oldHumanoid.RagdollRemoteEvent:FireServer(true)
            end
            game.ReplicatedStorage.Communication.Events.UpdateIsCrouching:FireServer(true)

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed + .2
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed - 1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity =
                    ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
                    ((game.Workspace.CurrentCamera.CoordinateFrame *
                        CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
                        game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                    speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity =
                    ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
                    ((game.Workspace.CurrentCamera.CoordinateFrame *
                        CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
                        game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                    speed
            else
                bv.velocity = Vector3.new(0, 0.1, 0)
            end
        until not flying
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
    end
    mouse.KeyDown:connect(
        function(key)
            if key:lower() == "w" then
                ctrl.f = 1
            elseif key:lower() == "s" then
                ctrl.b = -1
            elseif key:lower() == "a" then
                ctrl.l = -1
            elseif key:lower() == "d" then
                ctrl.r = 1
            end
        end
    )
    mouse.KeyUp:connect(
        function(key)
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
        end
    )
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v:Destroy()
    end
    wait(.1)
    oldHumanoid.RagdollRemoteEvent:FireServer(true)
    wait(.5)
    coroutine.wrap(Fly)()
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint.Part0 = nil
end

local gui = library.New("SamuelPaste")
local main = gui.Tab('rage')
--local legit = gui:Tab("legit")
local misc = gui.Tab('misc')
local visuals = gui.Tab('visuals')
local skins = gui.Tab('skins')
local other = gui.Tab("other")

fonts = {}
for i,v in pairs(Enum.Font:GetEnumItems()) do
	if v.Name ~= 'Unknown' then
		table.insert(fonts,v.Name)
	end
end
--chat
do
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
		--[[chat:Element('Toggle','No tags')
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
			METHOD = 1
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
		},
		['fu'] = {
		   FULLWORD = {
			   ['stfu'] = 1
		   
		   },
		   METHOD = 4
		},
		['nis'] = {
			FULLWORD = {
			 ['penis'] = 1  
			},
			METHOD = 4
		  },
		['ys'] = {
			FULLWORD = {
			 ['kys'] = 1  
			},
			METHOD = 4
		  },
		['tch'] = {
			FULLWORD = {
			 ['bitch'] = 1  
			},
			METHOD = 4
		  }  
	}
	function CheckIfIsInTable(Word)
		--print(Word)
		if values.rage.chat['Main no tags method'].Dropdown == 'in script' then
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
		
		if values.rage.chat['Main no tags method'].Dropdown == 'in script' then
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
	end--]]

	fire = false

		chat:Element("Toggle", "kill say")
		chat:Element("Dropdown", "kill say type", {options = {"message", "random", "custom file"}})
		chat:Element('Dropdown', 'custom file type', {options = {'1,2,3 etc.', 'random'}})
		chat:Element("TextBox", "message", {placeholder = "message"})
		--[[chat:Element('Button','Clean chat',{}, function()
		game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\na")
		end)--]]
		KillFeed:Connect(function(killed,died)
			if values.rage.chat["kill say"].Toggle then 
				if killed ~= LocalPlayer then return end
				if died == LocalPlayer then return end
				
				if values.rage.chat["kill say type"].Dropdown == "message" then
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(values.rage.chat["message"].Text ~= "" and values.rage.chat["message"].Text or "L bro cant win the pasted script")
				elseif values.rage.chat['kill say type'].Dropdown == 'random' then
					game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(chatmessages_pasteed[math.random(#chatmessages_pasteed)])
				else
					local messages = readfile('SamuelPaste/customkillsay.txt'):split('\n', '')
					if values.rage.chat['custom file type'].Dropdown == 'random' then
						game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(messages[math.random(#messages)])	
					else
						game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(messages[customtypemessagesnumber])
						customtypemessagesnumber += 1
						if customtypemessagesnumber == (#messages + 1) then
							customtypemessagesnumber = 1
						end
					end
				end
			end
		end)
	
	local edited = false
	--local oldIncomingMessage = game:GetService("TextChatService").OnIncomingMessage
	game:GetService("TextChatService").OnIncomingMessage = function(L)
		if L.TextSource and L.TextSource.UserId == game.Players.LocalPlayer.UserId then
			--patched
			--[[if values.rage.chat['No tags'].Toggle then
				if values.rage.chat['No tags method'].Dropdown == '1' then
					if L.TextSource and tonumber(L.TextSource.UserId) == game:FindService("Players").LocalPlayer.UserId then 
						for i,v in next, randomtable do
							L.Text =  L.Text:gsub(i,v)
						end
					end
				elseif values.rage.chat['No tags method'].Dropdown == '2' then
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
					if (not (Bypassed == "" or Bypassed == nil)) then
						L.Text = Bypassed
					end
				end
			end--]]		
			if edited == false and (values.rage.chat['custom text color'].Toggle or values.rage.chat['custom message size'].Toggle or values.rage.chat['custom font'].Toggle) then 
				text = L.Text
				if values.rage.chat['custom text color'].Toggle or values.rage.chat['custom message size'].Toggle or values.rage.chat['custom font'].Toggle then
					customText = 0
					--L.Text = '<font '
					
					L.Text = ''
					text2 = ''
					if values.rage.chat['custom text color'].Toggle then
						text2 = '<font color = '..'\"'..values.rage.chat['custom text color'].Color:ToHex()..'\">'
						
						customText += 1
					end
					if values.rage.chat['custom message size'].Toggle then
						text2 = text2..'<font size = '..'\"'..values.rage.chat.size.Slider..'\">'
						customText += 1
					end
					if values.rage.chat['custom font'].Toggle then
						text2 = text2..'<font face = '..'\"'..values.rage.chat['message font'].Dropdown..'\">'
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

--main
function parry()
	game:GetService("ReplicatedStorage").Communication.Events.Parry:FireServer()
end
do
	local playersTab = main:Sector('Players','Left')
	playersTab:Element('Toggle','Target player')
	playersTab:Element('Slider','Log Time',{min = 1,max = 10,default = 3})
	playersTab:Element('Toggle','Log Leave')
	--playersTab:Element('Toggle','Log Spawn')
	playersTab:Element('Toggle','Log Self-Respawn')
	
	game.Players.PlayerRemoving:Connect(function(plr)
		if values.rage['Players']['Target player'].Toggle and values.rage['Players']['Log Leave'].Toggle and plr.Name == values.rage['Players']['Target'].Scroll then
			CreateHitElement(tostring('Your target %s has left the server'):format(plr.Name),MainUIColor,values.rage['Players']['Log Time'].Slider)
		end
	end)
	KillFeed:Connect(function(killed,died)
		if values.rage['Players']['Target player'].Toggle and values.rage['Players']['Log Self-Respawn'].Toggle and (killed.Name == values.rage['Players']['Target'].Scroll and died.Name == values.rage['Players']['Target'].Scroll) then
			CreateHitElement(tostring('Your target %s has self-respawned'):format(v.Name),MainUIColor,values.rage['Players']['Log Time'].Slider)
		end
	end)
	local loop123
	playersTab:Element('lmao2','Target',{options = loopkillplr},function(tbl)
		pcall(function()
			loop123:Disconnect()
		end)
		loop123 = RunService.Heartbeat:Connect(function()
			if not game.Players:FindFirstChild(tbl.Scroll) then return loop123:Disconnect() end
			values.rage['Players']['Alive: '].stringchange('Alive: '..(game.Players[tbl.Scroll] and game.Players[tbl.Scroll].Character and (game.Players[tbl.Scroll].Backpack:FindFirstChildWhichIsA('Tool') or game.Players[tbl.Scroll].Character:FindFirstChildWhichIsA('Tool')) and 'true' or 'false'))
			values.rage['Players']['Score: '].stringchange('Score: '..tostring(game.Players[tbl.Scroll].leaderstats.Score.Value))
			values.rage['Players']['Level: '].stringchange('Level: '..tostring(game.Players[tbl.Scroll].leaderstats.Level.Value))
			values.rage['Players']['Account age: '].stringchange('Account age: '..tostring(game.Players[tbl.Scroll].AccountAge))
			values.rage['Players']['Display nickname: '].stringchange('Display nickname: '..tostring(game.Players[tbl.Scroll].DisplayName))
		end)
	end)
	playersTab:Element('Label','Alive: ')
	playersTab:Element('Label','Score: ')
	playersTab:Element('Label','Level: ')
	playersTab:Element('Label','Account age: ')
	playersTab:Element('Label','Display nickname: ')

	playersTab:Element('Toggle','Whitelist players')
	playersTab:Element('lmao3','Players',{options = loopkillplr})
	local combat = main:Sector('combat', 'Left')

	local Autos = main:Sector("Autos", "Right")
	local Misc = main:Sector("Misc", "Right")
	local Spins = main:Sector("Spins",'Right')
	Misc:Element("Toggle", "Auto jump")
	Misc:Element('Toggle', 'bunny hop')
	Misc:Element('Dropdown', 'direction', {options = {'forward', 'directional', 'directional 2'}})
	Misc:Element('Dropdown', 'type', {options = {'gyro', 'cframe', 'velocity', 'idk'}})
	Misc:Element('Slider', 'speed', {min = 0, max = 200, default = 40})	
	Misc:Element('Toggle', 'prevent launch')
	Misc:Element('Slider', 'launch block (y velocity)', {min = 0, max = 100, default = 40})
	
	Misc:Element('Toggle', 'first person-like camera',{},function(tbl)
		firstperson = RunService.RenderStepped:Connect(function()
			if not LocalPlayer.Character then return end
			if not tbl.Toggle then return firstperson:Disconnect() end
			
			UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter 
			local pos = LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position
			local camLv = workspace.CurrentCamera.CFrame.lookVector
			local camRotation = math.atan2(-camLv.X, -camLv.Z)
			 LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position) * CFrame.Angles(0, camRotation, 0)

		end)
	end)
	
	
	BodyVelocity = C.INST("BodyVelocity") 
	BodyVelocity.MaxForce = C.Vec3(C.HUGE, 0, C.HUGE) 

	local function YROTATION(cframe) 
		local x, y, z = cframe:ToOrientation() 
		return C.CF(cframe.Position) * C.CFAngles(0,y,0) 
	end

	switchtrigger = {false, nil, nil}
		
	Autos:Element("Toggle", "Auto Equip")
	Autos:Element("Toggle", "Auto Revive")
	--Autos:Element("Toggle", "Fast Respawn")
	combat:Element("Toggle", "Kill Aura")
	 --combat:Element("Toggle", "AA Aura")
	combat:Element("Dropdown", "Priority",{options = {'Distance','Health'}})
	combat:Element("Slider", "Kill Aura Distance", {min = 0, max = 12, default = 12})
	combat:Element("Toggle", "Teleport")	
	combat:Element('Dropdown','Teleport type',{options = {'Behind','Stroke'}})
	combat:Element("Slider", "Teleport Distance", {min = 0, max = 5, default = 5})
	--combat:Element("Toggle", "Custom Kill Aura Distance")
	--combat:Element("Slider", "Custom Distance", {min = 0, max = 10000, default = 600})
	
	combat:Element('Toggle','Visualize target',{default = {Color = Color3.fromRGB(255, 255, 255)}})
	combat:Element("ToggleColor", "Box",{default = {Color = Color3.fromRGB(255, 255, 255)}})
	combat:Element("ToggleColor", "Name",{default = {Color = Color3.fromRGB(255, 255, 255)}})
	combat:Element("ToggleColor", "Health",{default = {Color = Color3.fromRGB(0, 255, 0)}})
	combat:Element('ToggleColor','Health Text',{default = {Color = Color3.fromRGB(255,255,255)}})
	combat:Element("ToggleColor", "Indicators",{default = {Color = Color3.fromRGB(255, 255, 255)}})
	combat:Element("Toggle", "Stomp Aura")
	combat:Element("Dropdown", "Stomp aura priority",{options = {'Distance','Health'}})
	combat:Element("Slider", "Stomp Aura Distance", {min = 0, max = 25, default = 25})
	--combat:Element("Toggle", "Custom Stomp Aura Distance")
	--combat:Element("Slider", "Custom Stomp Distance", {min = 0, max = 1000, default = 600})
	--[[randomtableidk = {}
	for _,v in pairs(game.Players:GetPlayers()) do 
		C.INSERT(randomtableidk, v.Name)
	end

	if #randomtableidk == 0 then
		C.INSERT(randomtableidk, 'none')
	end--]]
	--values.rage.combat['Target player'].Toggle
	Spins:Element("Toggle", "Spin")
	Spins:Element("Slider", "Spin Power", {min = 0, max = 50, default = 50})
	Autos:Element("Toggle", "Auto Parry")
	Autos:Element('Dropdown','Auto Parry Method',{options = {'Animation','Sound'}})
	Autos:Element("Slider", "Auto Parry Distance", {min = 0, max = 25, default = 10})
	Autos:Element("Slider", "Auto Parry Chance", {min = 0, max = 100, default = 100})
	local respawn = main:Sector('Respawn', 'Right')
	respawn:Element('Toggle', 'Fast Respawn')
	respawn:Element('Toggle', 'Auto spawn')
	--respawn:Element('Toggle', 'Respawn on death position')
	
	--respawn:Element('Toggle', 'Respawn when low hp')
	--respawn:Element('Slider', 'low hp', {min = 1, max = 100, default = 30})
	task.spawn(
		function()
			function added(p)
				function balls(c)
					local Humanoid = c:WaitForChild "Humanoid"
					if Humanoid then
						Humanoid.AnimationPlayed:Connect(
							function(anim)
								for i, v in pairs(weapon_anims) do
									if
										values.rage.Autos["Auto Parry"].Toggle and
											anim.Animation.AnimationId == v and values.rage.Autos["Auto Parry Method"].Dropdown == 'Animation'
									 then
										if values.rage.Autos["Auto Parry Chance"].Slider >= 90 then
											if
												(LocalPlayer.Character ~= nil and
													LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and
													p.Character:FindFirstChild("HumanoidRootPart") ~= nil)
											 then
												local mag =
													(p.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
												if mag < values.rage.Autos["Auto Parry Distance"].Slider then
													parry()
													break
												end
											end
										else
											local chance = math.random(1, 90)
											if chance >= values.rage.Autos["Auto Parry Chance"].Slider then
												if
													(LocalPlayer.Character ~= nil and
														LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil and
														p.Character:FindFirstChild("HumanoidRootPart") ~= nil)
												 then
													local mag =
														(p.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
													if mag < values.rage.Autos["Auto Parry Distance"].Slider then
														parry()
														break
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
	
	local Sounds = {
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"10"
	}
--7287
	workspace.PlayerCharacters.DescendantAdded:Connect(function(e)
		if (e:IsA("Sound") and e.Parent.Name == "Hitbox") and values.rage.Autos["Auto Parry Method"].Dropdown == 'Sound' and values.rage.Autos["Auto Parry"].Toggle then
			task.spawn(function()
				for i,v in pairs(Sounds) do
					if e.Name == v and e.Parent.Parent.Parent.Parent.Name ~= LocalPlayer.Name then
						local Character = LocalPlayer.Character
						if (Character and Character:FindFirstChild("HumanoidRootPart")) then
							local distance = (Character.HumanoidRootPart.Position-e.Parent.Position).Magnitude
							if distance <= values.rage.Autos["Auto Parry Distance"].Slider then 
								parry()
							end
						end
						break
					end
				end
			end)
		end
	end)
	
	--[[task.spawn(function()
		RunService.RenderStepped:Connect(function()
			pcall(function()
				local Closest
				if values.rage.combat["Custom Kill Aura Distance"].Toggle then
					Closest = GetClosest(values.rage.combat["Custom Distance"].Slider,values.rage.combat["Priority"].Dropdown) or nil
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
						if values.rage.combat["Custom Kill Aura Distance"].Toggle then
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
	end)--]]
	RunService.RenderStepped:Connect(function()
		if not values.rage.combat["Kill Aura"].Toggle then return end 
		Closest = GetClosest(values.rage.combat["Kill Aura Distance"].Slider,values.rage.combat["Priority"].Dropdown) or nil		
		local Weapon
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				if v:FindFirstChild("Hitboxes") ~= nil then
					Weapon = v
				end
			end
		end		
		if not (Closest and Weapon) then return end
		if values.rage.combat["Teleport"].Toggle then
			if values.rage.combat['Teleport type'].Dropdown == 'Behind' then
				LocalPlayer.Character.HumanoidRootPart.CFrame =
					Closest.Character.HumanoidRootPart.CFrame *
					CFrame.new(0, 0, values.rage.combat["Teleport Distance"].Slider)
			else
				LocalPlayer.Character.HumanoidRootPart.CFrame = Closest.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-values.rage.combat["Teleport Distance"].Slider,values.rage.combat["Teleport Distance"].Slider),math.random(-values.rage.combat["Teleport Distance"].Slider,values.rage.combat["Teleport Distance"].Slider),math.random(-values.rage.combat["Teleport Distance"].Slider,values.rage.combat["Teleport Distance"].Slider)) 
			end
		end	
	end)
task.spawn(
		function()
			while task.wait() do
			  pcall(
				  function()
						if values.rage.combat["Kill Aura"].Toggle then
							local Closest
							--wait(.4)
							if not values.rage.combat["Kill Aura"].Toggle then return end 
							Closest = GetClosest(values.rage.combat["Kill Aura Distance"].Slider,values.rage.combat["Priority"].Dropdown) or nil
							if Closest ~= nil then
								if Closest.Character:FindFirstChild("Humanoid").Health == 0 then
								else
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
										for i=1,3 do
											local args1 = {
												[1] = Weapon,
												[2] = i
											}

											events.MeleeSwing:FireServer(unpack(args1))
											wait(.1)

											local args = {
												[1] = Weapon,
												[2] = Closest.Character.Head,
												[3] = Weapon.Hitboxes.Hitbox,
												[4] = Closest.Character.Head.Position,
												[5] = Closest.Character.Head.CFrame:ToObjectSpace(CFrame.new(Closest.Character.Head.Position)),
												[6] = Closest.Character.HumanoidRootPart.CFrame.LookVector,
												[7] = Vector3.new(1,1,1),
												[8] = Vector3.new(0,1,0)
											}
											if Closest.Character:FindFirstChild("SemiTransparentShield").Transparency == 1 then
												events.MeleeDamage:FireServer(unpack(args))

												events.MeleeDamage:FireServer(unpack(args))
											else
												return
											end
										end
									end
								end
							end
						end
					end)
				end
			end)
	
	task.spawn(
		function()
			while task.wait() do
				pcall(
					function()
						if values.rage.combat["Stomp Aura"].Toggle then
							local Closest
							--if values.rage.combat["Custom Stomp Aura Distance"].Toggle then
								--Closest = GetClosest(values.rage.combat["Custom Stomp Distance"].Slider,values.rage.combat["Stomp aura priority"].Dropdown)
							--else
								Closest = GetClosest(values.rage.combat["Stomp Aura Distance"].Slider,values.rage.combat["Stomp aura priority"].Dropdown)
							--end
							if Closest then
								if Closest.Character:FindFirstChild("Humanoid").Health == 0 then
								else
									local Weapon = LocalPlayer.Character.Stomp
									if not Weapon then
									else
										if Closest.Character.Humanoid.Health <= 15 then
											--[[if values.rage.combat["Custom Stomp Aura Distance"].Toggle then
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
											end--]]

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
							--[[elseif Closest == nil then
								for i, v in pairs(Weapon:GetDescendants()) do
									if v:IsA "BasePart" then
										v.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
										v.Velocity = Vector3.new(100000,100000,100000)
										v.CanCollide = false
									end
								end--]]
							end
						end
					end
				)
			end
		end
	)

	task.spawn(function()
		game:GetService("RunService").RenderStepped:Connect(function()
			pcall(function()
				if LocalPlayer.Character:FindFirstChildWhichIsA('Tool') then return end
				for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
					if v:IsA("Tool") then
						if v:FindFirstChild("Hitboxes") ~= nil then
							if values.rage.Autos["Auto Equip"].Toggle then
								v.Parent = LocalPlayer.Character
							end
						end
					end
				end
			end)
		end)
	end)
	--print('task.spawn #3')
   -- print('task.spawn #4')
	task.spawn(function()
		while task.wait() do
			pcall(function()
				if values.rage.Respawn["Fast Respawn"].Toggle then
					if LocalPlayer.Character.Humanoid.Health == 0 then
						--if values.rage.Respawn['Respawn on death position'].Toggle then
							--deathpos = LocalPlayer.Character.HumanoidRootPart.CFrame
						--end
						--events.SelfDamage:FireServer(150)
						task.wait(1)
						events.StartFastRespawn:FireServer()
						task.wait(.2)
						functions.CompleteFastRespawn:FireServer()
						if values.rage.Respawn['Auto spawn'].Toggle then
							repeat wait() until game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")
							functions.SpawnCharacter:FireServer()
							--task.wait(1)
							--[[if values.rage.Respawn['Respawn on death position'].Toggle and deathpos then
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
						if values.rage.Spins["Spin"].Toggle then
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
										Vector3.new(0, values.rage.Spins["Spin Power"].Slider, 0)
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
						if values.rage.Misc["Auto jump"].Toggle then
							if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
								LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
							end
						end
					end
				)
			end
		end
	)--print('task.spawn #6')
	local silent = main:Sector("Ranged sector", 'Left')
	silent:Element('Toggle', 'silent aim')
	
	silent:Element('Slider','field of view',{min = 1,max = 420,default = 120})
	silent:Element('ToggleTrans', 'draw fov', {default = {Color = C.COL3RGB(255,255,255), Transparency = 0}})
	silent:Element('Toggle', 'filled fov')
	silent:Element('Slider', 'fov thickness', {min = 1, max = 10, default = 1})
	task.spawn(function()
		local Fov = Drawing.new("Circle") 
		Fov.Filled = true 
		Fov.Color = C.COL3RGB(15,15,15) 
		Fov.Transparency = 0.5 
		Fov.Position = C.Vec2(Mouse.X, Mouse.Y + 16) 
		Fov.Radius = 120
		RunService.Heartbeat:Connect(function()
		
			pcall(function()
				Fov.Visible = values.rage['Ranged sector']['draw fov'].Toggle

				Fov.Transparency = 1-values.rage['Ranged sector']['draw fov'].Transparency
			
				Fov.Color =  values.rage['Ranged sector']['draw fov'].Color
				Fov.Position = C.Vec2(Mouse.X,Mouse.Y+36)
				Fov.Radius = values.rage['Ranged sector']['field of view'].Slider
				Fov.Thickness = values.rage['Ranged sector']['fov thickness'].Slider
				Fov.Filled = values.rage['Ranged sector']['filled fov'].Toggle
			end)		
			
		end)
	end)
	
	silent:Element('ToggleTrans', 'Highlight target')
	silent:Element('ToggleTrans', 'Outline highlight target')
	silent:Element('ToggleColor', 'Silent aim info gui',{default = {Color = Color3.new(85, 170, 255)}})

	silent:Element('Dropdown','hit type',{options = {'redirect','auto hit'}})
	silent:Element('Dropdown', 'body part to hit', {options = {"Head","HumanoidRootPart","Torso","Left Leg","Right Leg","Left Arm","Right Arm"}})
	silent:Element('Slider','hitchance',{min = 1,max = 100,default = 100})
	silent:Element('Slider','hit distance',{min = 1,max = 25,default = 15})
	task.spawn(function()
		RunService.Heartbeat:Connect(function()
			if values.rage['Ranged sector']['Highlight target'].Toggle or values.rage['Ranged sector']['Outline highlight target'].Toggle then
				if not game.CoreGui:FindFirstChild('SilentAimTarget') then
					local highlight = C.INST('Highlight',game.CoreGui)
					highlight.Name = 'SilentAimTarget'
					if values.rage['Ranged sector']['Highlight target'].Toggle then
						highlight.FillColor = values.rage['Ranged sector']['Highlight target'].Color
						highlight.FillTransparency = values.rage['Ranged sector']['Highlight target'].Transparency
					else
						highlight.FillTransparency = 1
					end
					
					if values.rage['Ranged sector']['Outline highlight target'].Toggle then
						highlight.OutlineColor = values.rage['Ranged sector']['Outline highlight target'].Color
						highlight.OutlineTransparency = values.rage['Ranged sector']['Outline highlight target'].Transparency
					else
						highlight.OutlineTransparency = 1
					end
				elseif game.CoreGui:FindFirstChild('SilentAimTarget') then
					highlight = game.CoreGui:FindFirstChild('SilentAimTarget')
					--highlight.Name = 'SilentAimTarget'
					if values.rage['Ranged sector']['Highlight target'].Toggle then
					highlight.FillColor = values.rage['Ranged sector']['Highlight target'].Color
					highlight.FillTransparency = values.rage['Ranged sector']['Highlight target'].Transparency
					else
					highlight.FillTransparency = 1
					end
					if values.rage['Ranged sector']['Outline highlight target'].Toggle then
						highlight.OutlineColor = values.rage['Ranged sector']['Outline highlight target'].Color
						highlight.OutlineTransparency = values.rage['Ranged sector']['Outline highlight target'].Transparency
					else
						highlight.OutlineTransparency = 1
					end			
				end
			end
		end)
	end)
	

		silent:Element('Toggle', 'Wallbang')
		task.spawn(function()
			while RunService.Heartbeat:Wait() do 
				if values.rage['Ranged sector'].Wallbang.Toggle then
					game.CollectionService:AddTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')	
					game.CollectionService:AddTag(game:GetService("Workspace").Terrain,'RANGED_CASTER_IGNORE_LIST')						
				else
					game.CollectionService:RemoveTag(game:GetService("Workspace").Map,'RANGED_CASTER_IGNORE_LIST')	
					game.CollectionService:RemoveTag(game:GetService("Workspace").Terrain,'RANGED_CASTER_IGNORE_LIST')		
				end		
			end
		end)
		
		-----------------------------------
		rangedmods = function()
			for i,v in pairs(getgc(true)) do
				if typeof(v) == 'table' and rawget(v,'maxSpread') and rawget(v,'displayName') then
					if values.rage['Ranged sector']['No recoil'].Toggle then
						v.recoilYMin = 0
						v.recoilZMin = 0
						v.recoilXMin = 0
						v.recoilYMax = 0
						v.recoilZMax = 0
						v.recoilXMax = 0
					else
						v.recoilYMin = rangedvalues[string.lower(v.displayName)]['recoilYMin']
						v.recoilZMin = rangedvalues[string.lower(v.displayName)]['recoilZMin']
						v.recoilXMin = rangedvalues[string.lower(v.displayName)]['recoilXMin']
						v.recoilYMax = rangedvalues[string.lower(v.displayName)]['recoilYMax']
						v.recoilZMax = rangedvalues[string.lower(v.displayName)]['recoilZMax']
						v.recoilXMax = rangedvalues[string.lower(v.displayName)]['recoilXMax']		
					end
					if values.rage['Ranged sector']['No spread'].Toggle then
						v.minSpread = 0
						v.maxSpread = 0
					else
						v.minSpread = rangedvalues[string.lower(v.displayName)]['minSpread']
						v.maxSpread = rangedvalues[string.lower(v.displayName)]['maxSpread']
					end
					if values.rage['Ranged sector']['Inf range'].Toggle then
						v.gravity = Vector3.new(0,0,0)
						v.maxDistance = 99999
					else
						v.gravity = rangedvalues[string.lower(v.displayName)]['gravity']
						v.maxDistance = rangedvalues[string.lower(v.displayName)]['maxDistance']			
					end
					if values.rage['Ranged sector']['Instant charge'].Toggle then
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
		end
		silent:Element('Slider', 'Prediction val', {min = 0,max = 1})
		silent:Element('Toggle', 'No recoil',{},function()
			rangedmods()
		end)
		silent:Element('Toggle', 'No spread',{},function()
			rangedmods()
		end)
		silent:Element('Toggle', 'Inf range',{},function()
			rangedmods()
		end)
		silent:Element('Toggle', 'Instant charge',{},function()
			rangedmods()
		end)
		silent:Element('Toggle', 'No reload cancel',{},function()
			rangedmods()
		end)
		silent:Element('Toggle', 'Always headshot',{},function()
			rangedmods()
		end)
		-------------------------------------------------------------
		silent:Element('Toggle', 'Auto reload')


		getgenv().shootfunc = {}
		getgenv().reloadfunc = {}
		silent:Element('Toggle','Auto shoot')
		
		table.clear(shootfunc)
		table.clear(reloadfunc)
		
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' then
				if rawget(v,'canShoot') and rawget(v,'tool') and v.tool ~= nil and v.tool.Parent ~= nil then
					shootfunc[v.tool.Name] = function()
						if v.tool.Parent == LocalPlayer.Character then
							if v:getCanShoot() then
								v:shoot()
							end
						end
					end
					reloadfunc[v.tool.Name] = function()
						v:reload()
					end
				end
			end
		end			
		Spawn:Connect(function()
			table.clear(shootfunc)
			table.clear(reloadfunc)
			repeat wait() until LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool') 
			task.wait(0.3)
			for i,v in pairs(getgc(true)) do
				if typeof(v) == 'table' then
					if rawget(v,'canShoot') and rawget(v,'tool') and v.tool ~= nil and v.tool.Parent ~= nil then
						if v.tool.Parent == nil then
							return
						end
						shootfunc[v.tool.Name] = function()
							if v.tool.Parent == LocalPlayer.Character then
								if v:getCanShoot() then
									v:shoot()
								end
							end
						end
						reloadfunc[v.tool.Name] = function()
							v:reload()
						end
					end
				end
			end
		end)
		local shootloop;shootloop = RunService.Heartbeat:Connect(function()
			if (not values.rage['Ranged sector']['Auto reload'].Toggle) or (not values.rage['Ranged sector']['Auto shoot'].Toggle) then return end
			pcall(function()
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA('Tool') then
					if values.rage['Ranged sector']['Auto shoot'].Toggle then
						shootfunc[LocalPlayer.Character:FindFirstChildWhichIsA('Tool').Name]()
					end
					if values.rage['Ranged sector']['Auto reload'].Toggle then
						reloadfunc[LocalPlayer.Character:FindFirstChildWhichIsA('Tool').Name]()
					end
				end
			end)
		end)
	end


--config tab
do

	local allcfgs = {} 
	
	for _,cfg in pairs(listfiles(cfglocation)) do 
		local cfgname = C.GSUB(cfg, cfglocation, "") 
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
		local cfgname = C.GSUB(cfg, cfglocation, "") 
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
		title.Text = '		 yes.no'
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
	addons:Element('ToggleTrans', 'background color', {default = {Color = C.COL3RGB(180,180,180), Transparency = 0}})
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

	watermark:Element('Slider', 'watermark offset X', {min = -100, max = 0, default = watermarklocation.watermark.Position.X.Scale}, function(tbl)
		watermarklocation.watermark.Position = UDim2.new(0.912 + (tbl.Slider / 150), 0, watermarklocation.watermark.Position.Y.Scale, 0)
	end)

	watermark:Element('Slider', 'watermark offset y', {min = -100, max = 0, default = watermarklocation.watermark.Position.Y.Scale}, function(tbl)
		watermarklocation.watermark.Position = UDim2.new(watermarklocation.watermark.Position.X.Scale, 0,  0.00858895481 + (tbl.Slider / 150) , 0)
	end)

	task.spawn(function()
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
	end)
end
function isAlive(plr)
	return plr.Character and (plr.Backpack:FindFirstChildWhichIsA('Tool') or plr.Character:FindFirstChildWhichIsA('Tool')) and true or false
end

function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	
	if SavedValues['getState']:getState().ragdoll.isRagdolled == true then
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

--misc tab
do
	local FakelagFolder = Instance.new('Folder',workspace)

	local misc1 = misc:MSector("misc", "Right")
	local misc2 = misc:MSector("misc2", "Right")
	local miscsector = misc2:Tab("misc")
	--local fakelag = misc2:Tab('fake lag')
	local instants = misc2:Tab('instants')
	
	local player = misc1:Tab("player")
	local utility = misc1:Tab("utility")
	miscsector:Element("Button", "No Identity fling", nil, function()
		invisfling()
	end)
local fakeRagdoll = Signal.new()			
local randomtable = {}
for i,v in pairs(getgc(true)) do
    if typeof(v) == 'table' then

        if rawget(v,'setupMotors') then
            oldsetup = v.setupMotors
			oldstate = v.setupState
			fake = function(...)
                return
            end
			fakeRagdoll:Connect(function(b)
				if b == false then
					v.setupMotors = oldsetup
					v.setupState = oldstate
				else
					v.setupMotors = fake
					v.setupState = fake					
				end
			end)
        end
		--[[if rawget(v,'CROUCHED_HIP_HEIGHT_ADDITION') then
			crouchedhip = v.CROUCHED_HIP_HEIGHT_ADDITION
		end			
		if rawget(v,'toggleCrouching') then
			oldtoggle = v.toggleCrouching
			v.toggleCrouching(false)
			fake = function(sex)
				if sex == true then
					game.Players.LocalPlayer.Character.Humanoid.HipHeight = crouchedhip
				else
					game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
				end
				return oldtoggle(sex)
			end
			fakeRagdoll:Connect(function(b)
				if b == false then
					v.SLIDE_CLIENT_IS_SLIDING_CHANGE = oldtoggle
				else
					v.SLIDE_CLIENT_IS_SLIDING_CHANGE = fake			
				end
			end)
		end
		if rawget(v,'SLIDE_CLIENT_IS_SLIDING_CHANGE') then
			oldslide = v.SLIDE_CLIENT_IS_SLIDING_CHANGE
			fake = function(table1,table2)
				randomtable = oldslide(table1,table2)
				if randomtable.isSliding == true then
					LocalPlayer.Character.Humanoid.HipHeight = -1.4
				else
					LocalPlayer.Character.Humanoid.HipHeight = 0
				end
				return randomtable
			end
			fakeRagdoll:Connect(function(b)
				if b == false then
					v.SLIDE_CLIENT_IS_SLIDING_CHANGE = oldslide
				else
					v.SLIDE_CLIENT_IS_SLIDING_CHANGE = fake			
				end
			end)			
		end	--]]
	end
end

miscsector:Element('Button','Fake ragdoll (cant swing)',{},function()
	if not LocalPlayer.Character then return end
	if not LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid') then return end
	for i,v in pairs(getgc(true)) do
		if typeof(v) == 'table' then
			if rawget(v,'isStunned')  then
				v.isStunned = false
			end
			if rawget(v,'isFrozen')  then
				v.isFrozen = false
			end
			if rawget(v,'isRagdolled')  then
				v.isRagdolled = false
			end
		end
	end	
	fakeRagdoll:Fire(true)
	LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(true)
	task.wait(1)

	for i,v in pairs(game.Players.LocalPlayer.Character.Torso:GetChildren()) do
		if v:IsA('Motor6D') then
			v.Enabled = true
		end
	end
	LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):SetStateEnabled(Enum.HumanoidStateType.Running, true)

	local StarterGui = game:GetService("StarterGui")
	StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)

	LocalPlayer.Character.Humanoid.AutoRotate = true
	local Noclip
	Noclip = RunService.Stepped:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
		game.Players.LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(true)    
		if LocalPlayer.Character then
			for i,v in pairs(game.Players.LocalPlayer.Character.Torso:GetChildren()) do
				if v:IsA('Motor6D') then
					v.Enabled = true
				end
			end	
			for i,v in pairs(LocalPlayer.Character:GetChildren()) do
				if v:IsA('Part') then
					v.CanCollide = false
				end
			end
		end
	end)
	game.Players.LocalPlayer.CharacterAdded:Connect(function(chr)
		fakeRagdoll:Fire(false)
		Noclip:Disconnect()
		chr:WaitForChild('Humanoid').AutoRotate = true
		chr.Humanoid:WaitForChild('RagdollRemoteEvent'):FireServer(false)    
	end)		
end)	
	miscsector:Element('Button','Teleport up',{},function()
		if LocalPlayer.Character and (LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool') or LocalPlayer.Character:FindFirstChildWhichIsA('Tool')) and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
			--LocalPlayer.Character.HumanoidRootPart.Anchored = true
			LocalPlayer.Character.HumanoidRootPart.Position += Vector3.new(0,values.misc.misc2.misc['Distance'].Slider,0)
		end
	end)
	miscsector:Element('Button','Teleport down',{},function()
		if LocalPlayer.Character and (LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool') or LocalPlayer.Character:FindFirstChildWhichIsA('Tool')) and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
			--LocalPlayer.Character.HumanoidRootPart.Anchored = true
			LocalPlayer.Character.HumanoidRootPart.Position -= Vector3.new(0,values.misc.misc2.misc['Distance'].Slider,0)
		end
	end)
	miscsector:Element('Slider','Distance',{min = 100,max = 10000,default = 6000})
	miscsector:Element('Button','Anchor hrp',{},function()
		if LocalPlayer.Character and (LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool') or LocalPlayer.Character:FindFirstChildWhichIsA('Tool')) and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
			LocalPlayer.Character.HumanoidRootPart.Anchored = true
			--LocalPlayer.Character.HumanoidRootPart.Position += Vector3.new(0,values.misc.misc2.misc['Distance'].Slider,0)
		end
	end)
	miscsector:Element('Button','Unanchor hrp',{},function()
		if LocalPlayer.Character and (LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool') or LocalPlayer.Character:FindFirstChildWhichIsA('Tool')) and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
			LocalPlayer.Character.HumanoidRootPart.Anchored = false
			--LocalPlayer.Character.HumanoidRootPart.Position -= Vector3.new(0,values.misc.misc2.misc['Distance'].Slider,0)
		end
	end)	
	
	--[[local freezeLoop = nil
	fakelag:Element('ToggleKeybind','Freeze',nil,function(tbl)
		pcall(function()
			freezeLoop:Disconnect()
		end)
		if tbl.Toggle and tbl.Active then
			if LocalPlayer.Character then
				for i,v in pairs(FakelagFolder:GetChildren()) do
					v:Destroy()
				end
				if values.misc.misc2['fake lag']['Visualize lag'].Toggle then
					for _,hitbox in pairs(LocalPlayer.Character:GetChildren()) do
						if hitbox:IsA('BasePart') and hitbox.Name ~= 'HumanoidRootPart' then
							local Part = hitbox:Clone()
							Part.Parent = FakelagFolder
							Part.CFrame = hitbox.CFrame
							Part.Color = values.misc.misc2['fake lag']['Visualize lag'].Color
							Part.CanCollide = false
							Part.Anchored = true
							Part.Material = 'ForceField'
						end
					end				
				end
				freezeLoop = game.RunService.Stepped:Connect(function()
					pcall(function()
						game.Players.LocalPlayer.Character.Torso.Anchored = false
						task.wait()
						game.Players.LocalPlayer.Character.Torso.Anchored = true
					end)
				end)
			end
		end
	end)
	fakelag:Element('ToggleColor','Visualize lag',{default = {Color = MainUIColor}},function(tbl)
		for i,v in pairs(FakelagFolder:GetChildren()) do
			v:Destroy()
		end
		if LocalPlayer.Character and tbl.Toggle then
			for _,hitbox in pairs(LocalPlayer.Character:GetChildren()) do
				if hitbox:IsA('BasePart') and hitbox.Name ~= 'HumanoidRootPart' then
					local Part = hitbox:Clone()
					Part.Parent = FakelagFolder
					Part.CFrame = hitbox.CFrame
					Part.Color = tbl.Color
					Part.CanCollide = false
					Part.Anchored = true
					Part.Material = 'ForceField'
				end
			end	
		end
	end)
	Spawn:Connect(function(c)
		pcall(function()
			freezeLoop:Disconnect()
		end)
		for i,v in pairs(FakelagFolder:GetChildren()) do
			v:Destroy()
		end
		if values.misc.misc2['fake lag'].Freeze.Toggle and values.misc.misc2['fake lag'].Freeze.Active then
			if values.misc.misc2['fake lag']['Visualize lag'].Toggle then
				for _,hitbox in pairs(c:GetChildren()) do
					if hitbox:IsA('BasePart') and hitbox.Name ~= 'HumanoidRootPart' then
						local Part = hitbox:Clone()
						Part.Parent = FakelagFolder
						Part.CFrame = hitbox.CFrame
						Part.Color = values.misc.misc2['fake lag']['Visualize lag'].Color
						Part.CanCollide = false
						Part.Anchored = true
						Part.Material = 'ForceField'
					end
				end					
			end
			if freezeLoop == nil then
				freezeLoop = game.RunService.Stepped:Connect(function()
					pcall(function()
						game.Players.LocalPlayer.Character.Torso.Anchored = false
						task.wait()
						game.Players.LocalPlayer.Character.Torso.Anchored = true
					end)
				end)			
			end
		end
	end)
	Died:Connect(function()
		for i,v in pairs(FakelagFolder:GetChildren()) do
			v:Destroy()
		end
		pcall(function()
			freezeLoop:Disconnect()
		end)
	end)--]]
	utility:Element("Toggle", "No Utility Damage (expect bombs)")
	utility:Element('Toggle', 'No knockback', {}, function(tbl)
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' and rawget(v,'knockbackCharacterPartAngular') then
				if tbl.Toggle then
					v.knockbackCharacterPartAngular = function(...)
						return
					end
				else
					v.knockbackCharacterPartAngular = SavedValues['oldknockbackCharacterPartAngular']
				end
			end
			if typeof(v) == 'table' then 
				if rawget(v,'knockbackCharacterPart') then
					if tbl.Toggle then
						v.knockbackCharacterPart = function(...)
							return
						end
					else
						v.knockbackCharacterPart = SavedValues["oldknockbackCharacterPart"]
					end
				end
				if rawget(v,'knockbackPartAngular') then
					if tbl.Toggle then
						v.knockbackPartAngular = function(...)
							return
						end
					else
						v.knockbackPartAngular = SavedValues['oldknockbackPartAngular']
					end
				end
				if rawget(v,'knockbackPartForce') then
					if tbl.Toggle then
						v.knockbackPartForce = function(...)
							return
						end
					else
						v.knockbackPartForce = SavedValues["oldknockbackPartForcer"]
					end
				end 
			end
		end	
	end)
	--utility:Element('Toggle','Ignore when parkouring')
	utility:Element('Toggle','Redirect throwable grenades to closest player')
	utility:Element('Slider','Distance',{min = 1,max = 500,default = 100})
	utility:Element('Toggle','Increase force of grenades')
	
	instants:Element('Toggle','Instant ghost potion',{},function(tbl)
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' then
				if rawget(v,'displayName') and v.displayName == 'Ghost Potion'  then
					if tbl.Toggle then
						v.useTime = 0.01
					else
						v.useTime = SavedValues['oldGhostTime']
					end
				end
			end
		end	
	end)
	instants:Element('Toggle','Instant bear trap',{},function(tbl)
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' then
				if rawget(v,'displayName') and v.displayName == 'Bear Trap'  then
					if tbl.Toggle then
						v.useTime = 0.01
					else
						v.useTime = SavedValues['oldBear']
					end
				end
			end
		end	
	end)	
	instants:Element('Toggle','Instant c4 throw',{},function(tbl)
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' then
				if rawget(v,'displayName') and v.displayName == 'C4' then
					if tbl.Toggle then
						v.preThrowDuration = 0.01
					else
						v.preThrowDuration = SavedValues["oldC4"]
					end
				end
			end
		end
	end)
	instants:Element('Toggle','Instant grenades throw',{},function(tbl)
		for i,v in pairs(getgc(true)) do
			if typeof(v) == 'table' then
				if rawget(v,'displayName') then
					if v.displayName == 'Molotov' then
						if tbl.Toggle then
							v.preThrowDuration = 0.01
						else
							v.preThrowDuration = SavedValues["oldMolotov"]
						end
					elseif v.displayName == 'Frag Grenade' then
						if tbl.Toggle then
							v.preThrowDuration = 0.01
						else
							v.preThrowDuration = SavedValues["oldGrenade"]
						end
					elseif v.displayName == 'Smoke Grenade' then
						if tbl.Toggle then
							v.preThrowDuration = 0.01
						else
							v.preThrowDuration = SavedValues['oldSmoke']
						end
					end
				end
			end
		end
	end)
	--values.misc.misc.utility['Redirect throwable grenades to closest player']
	 player:Element("Toggle", "Auto Airdrop-Claimer")
	 miscsector:Element("ToggleKeybind","Velocity Fly",nil,function(state)
		 if state.Toggle and state.Active then
			 NOFLY()
			 sFLY(false,false,false)
		 else
			 NOFLY()
		 end
	 end)
		local function keydown(key)
			return game:GetService("UserInputService"):IsKeyDown(key)
		end 
	miscsector:Element('ToggleKeybind','Velocity fly 2',nil,function(tbl)
		g = game.RunService.Heartbeat:Connect(function()
			if not (tbl.Toggle and tbl.Active) then return g:Disconnect() end
			if not LocalPlayer.Character then return end
				local move = game.Players.LocalPlayer.Character.Humanoid.MoveDirection * 16 * 4
				if keydown(Enum.KeyCode.Space) then
					game.Players.LocalPlayer.Character.Humanoid.RootPart.Velocity = Vector3.new(0,55,0) + move
				elseif keydown(Enum.KeyCode.C) then
					game.Players.LocalPlayer.Character.Humanoid.RootPart.Velocity = Vector3.new(0,-55,0) + move
				else
					game.Players.LocalPlayer.Character.Humanoid.RootPart.Velocity = Vector3.new(0,2,0) + move
				end
		end)	 
	 end)
	miscsector:Element("ToggleKeybind", "Fly",nil,function(state)
		if state.Toggle and state.Active then
			NOFLY()
			sFLY(false, true, true)
			LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(true)
		else
			NOFLY()
			--LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
		end
	end)
		getgenv().lookuptable = lookuptable or require(game.ReplicatedStorage.Framework.Nevermore)['_lookupTable']

		getgenv().datastore = datastore or require(lookuptable['DataHandler']).getSessionDataRoduxStoreForPlayer(game.Players.LocalPlayer):getState()

	miscsector:Element('ToggleKeybind','cw fly',nil,function(tbl)
		if tbl.Toggle and tbl.Active then
			datastore.fly.isFlying = tbl.Toggle
			getupvalue(require(lookuptable.FlyHandlerClient)['_startModule'], 2)(game.Players.LocalPlayer.Character)
		else
			datastore.fly.isFlying = false
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('LinearVelocity') then
				LocalPlayer.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('LinearVelocity'):Destroy()
			end
		end
	end)
	Spawn:Connect(function()
				if values.misc.misc2.misc["Fly"].Toggle and values.misc.misc2.misc["Fly"].Active then
					NOFLY()
					sFLY(false, true, true)
					LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(true)
				else
					NOFLY()
					LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
				end		
				if values.misc.misc2.misc["Velocity Fly"].Toggle and values.misc.misc2.misc["Velocity Fly"].Active then
					 NOFLY()
					 sFLY(false,false,false)
				else
					NOFLY()
				end
	end)
	miscsector:Element("Toggle", "Noclip",nil,function(state)
		if values.misc.misc2.misc["Noclip"].Toggle then
			Clip = false
		else
			Clip = true
		end
	end)



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
	player:Element('Toggle', 'Prevent parry')
	player:Element('Dropdown','Prevent parry type',{options = {'Skip damage','Unequip'}})
	
	miscsector:Element("Toggle", "Kill Feed Spam")
	miscsector:Element("Toggle", "Free Emotes") 
	miscsector:Element("Toggle", "Hide Name")
	miscsector:Element('Toggle', 'Horizontal body',{}, function(tbl)
		task.spawn(function()
			while wait() do
				for i = 1,15 do
					if not tbl.Toggle then break end
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
				if not tbl.Toggle then break end
			end
		end)
	end)
	player:Element("Toggle", "Walk Speed")
	player:Element("Slider", "Speed", {min = 0, max = 75, default = 75})
	player:Element("Toggle", "Jump Power")
	player:Element("Slider", "Power", {min = 0, max = 500, default = 150})
	Noclipping = game:GetService'RunService'.Stepped:Connect(NoclipLoop)
	
	local old;old = hookmetamethod(game,'__newindex',function(o, k, v)
		if values.misc.misc.player["Walk Speed"].Toggle and (k == 'WalkSpeed') then
			return old(o,k,values.misc.misc.player["Speed"].Slider)
		end
				
		if values.misc.misc.player["Jump Power"].Toggle and (k == 'JumpPower') then
			return old(o,k,values.misc.misc.player["Power"].Slider)
		end
		return old(o, k, v)
	end)		
	local old1;old1 = hookmetamethod(game,'__index',function(o, k)
		if values.misc.misc.player["Walk Speed"].Toggle and (o == 'WalkSpeed') then
			return values.misc.misc.player["Speed"].Slider
		end
				
		if values.misc.misc.player["Jump Power"].Toggle and (o == 'JumpPower') then
			return values.misc.misc.player["Power"].Slider
		end
		return old1(o, k)
	end)	
	UserInputService.InputBegan:Connect(function(k,j)
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
	Mouse.KeyUp:Connect(function(k)
		if k == "q" then
			FloatValue = FloatValue + 0.5
		end
		if k == "e" then
			FloatValue = FloatValue - 0.5
		end			
	end)
	Mouse.KeyDown:Connect(function(k)
		if k == "e" then
			FloatValue = FloatValue + 0.5
		end
		if k == "q" then
			FloatValue = FloatValue - 0.5
		end		
	end)


	for i, v in pairs(getgc(true)) do
		if type(v) == "table" and rawget(v, "AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING") then
			local old = v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING

			task.spawn(function()
				while true do
					if values.misc.misc.player["Infinite Air"].Toggle then
						v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 99999999999999999999999999999
					else
						v.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = old
					end
					task.wait()
				end
			end)
		end
		if typeof(v) == "table" and rawget(v, "getCanJump") then
			local old = v.getCanJump

			v.getCanJump = function(...)
				if values.misc.misc.player["Jump Whenever"].Toggle then
					return true
				else
					return old(...)
				end
			end
		end

		if typeof(v) == "table" and rawget(v, "JUMP_DELAY_ADD") then
			local old = v.JUMP_DELAY_ADD

			task.spawn(function()
				while true do
					if values.misc.misc.player["No Jump Cooldown"].Toggle then
						v.JUMP_DELAY_ADD = 0.5
					else
						v.JUMP_DELAY_ADD = old
					end
					task.wait()
				end
			end)
		end

		if typeof(v) == "table" and rawget(v, "_setStamina") then
			local old = v._setStamina

			v._setStamina = function(gg, ...)
				if values.misc.misc.player["Infinite Stamina"].Toggle then
					gg._stamina = math.huge
					gg._staminaChangedSignal:Fire(150)
				else
					return old(gg, ...)
				end
			end
		end
		
		if typeof(v) == "table" and rawget(v, "toggleRagdoll") then
			local old = v.toggleRagdoll
			
			v.toggleRagdoll = function(...)
				if values.misc.misc.player["No Ragdoll"].Toggle then
					return
				else
					return old(...)
				end
			end
		end

		if typeof(v) == "table" and rawget(v, "DASH_COOLDOWN") then
			local old = v.DASH_COOLDOWN
			
			task.spawn(function()
				while true do
					if values.misc.misc.player["No Dash Cooldown"].Toggle then
						v.DASH_COOLDOWN = -500
					else
						v.DASH_COOLDOWN = old
					end
					task.wait()
				end
			end)
		end

		if typeof(v) == "table" and rawget(v, "gamepassIdRequired") and string.find(v.gamepassIdRequired,'Emotes') then
			task.spawn(function()
				local old = v.gamepassIdRequired
				
				while true do
					if values.misc.misc2.misc["Free Emotes"].Toggle then
						v.gamepassIdRequired = nil
					elseif v.gamepassIdRequired == nil then
						v.gamepassIdRequired = old
					end
					task.wait()
				end
			end)
		end
	end
	
end


	local runService = RunService.Heartbeat:Connect(function()
		if (values.misc.misc.player["Walk On Air (Q,E)"].Toggle and not values.misc.misc.player["Walk Speed"].Toggle) then
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
		elseif not values.misc.misc.player["Walk On Air (Q,E)"].Toggle and LocalPlayer.Character:FindFirstChild("Float") ~= nil then
			LocalPlayer.Character:FindFirstChild("Float"):Destroy()
			events.UpdateIsParkouring:FireServer(false)
			FloatValue = -3.1
		end
			-- epic kill feed spammer
		if values.misc.misc2.misc["Kill Feed Spam"].Toggle then
			events.StartFastRespawn:FireServer()
			functions.CompleteFastRespawn:FireServer()
		end
		
		if values.misc.misc.player["Jesus"].Toggle then
			if workspace.Map:FindFirstChildOfClass"Model" ~= nil then
				workspace.Map:FindFirstChildOfClass"Model".MapConfiguration.WaterAreas.WaterArea.CanCollide = true
			end
		else
			if workspace.Map:FindFirstChildOfClass"Model" ~= nil then
				workspace.Map:FindFirstChildOfClass"Model".MapConfiguration.WaterAreas.WaterArea.CanCollide = false
			end
		end
		if values.misc.misc2.misc["Hide Name"].Toggle then
			events.UpdateIsCrouching:FireServer(true)
		end
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
		
		if game:GetService("Workspace").Airdrops:FindFirstChildWhichIsA('Model') and values.misc.misc.player['Auto Airdrop-Claimer'].Toggle then
			if game:GetService("Workspace").Airdrops:FindFirstChildWhichIsA('Model'):FindFirstChild('Crate') and game:GetService("Workspace").Airdrops:FindFirstChildWhichIsA('Model'):FindFirstChild('Crate'):FindFirstChild('Hitbox') and game:GetService("Workspace").Airdrops:FindFirstChildWhichIsA('Model'):FindFirstChild('Crate'):FindFirstChild('Hitbox'):FindFirstChild('ProximityPrompt') then
				
				--LocalPlayer.Character.HumanoidRootPart.Anchored = true
				pcall(function()
					LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Airdrops:FindFirstChildWhichIsA('Model'):WaitForChild'Crate'.Base.CFrame
					wait(.2)
					fireproximityprompt(game:GetService("Workspace").Airdrops:FindFirstChildWhichIsA('Model'):WaitForChild'Crate'.Hitbox.ProximityPrompt)
				end)
				--LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end
		end
		task.spawn(function()
			if not LocalPlayer.Character then return end
			local CamCFrame = game.workspace.CurrentCamera.CFrame
			local Root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			BodyVelocity:Destroy()
			BodyVelocity = C.INST('BodyVelocity')
			BodyVelocity.MaxForce = C.Vec3(C.HUGE,0,C.HUGE)
			if UserInputService:IsKeyDown('Space') and values.rage.Misc['bunny hop'].Toggle == true then
				local add = 0
				if values.rage.Misc['direction'].Dropdown == 'directional' or values.rage.Misc['direction'].Dropdown == 'directional 2' then
					if UserInputService:IsKeyDown("A") then add = 90 end 
					if UserInputService:IsKeyDown("S") then add = 180 end 
					if UserInputService:IsKeyDown("D") then add = 270 end 
					if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("W") then add = 45 end 
					if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("W") then add = 315 end 
					if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("S") then add = 225 end 
					if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("S") then add = 145 end 
				end
				local rot = YROTATION(CamCFrame) * C.CFAngles(0,C.RAD(add),0)
				local bhopspeed = values.rage.Misc['speed'].Slider		
				BodyVelocity.Parent = LocalPlayer.Character['HumanoidRootPart']
				
				if LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
					LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
				
				BodyVelocity.Velocity = C.Vec3(rot.LookVector.X,0,rot.LookVector.Z) * (bhopspeed * 2)
				if add == 0 and values.rage.Misc['direction'].Dropdown == 'directional' and not UserInputService:IsKeyDown('W') then
					BodyVelocity:Destroy()
				else
					if values.rage.Misc['type'].Dropdown == 'cframe' then
						BodyVelocity:Destroy()
						Root.CFrame = Root.CFrame + C.Vec3(rot.LookVector.X,0,rot.LookVector.Z) * bhopspeed/50
					elseif values.rage.Misc['type'].Dropdown == 'velocity'  then
						BodyVelocity:Destroy()
						Root.Velocity = C.Vec3(rot.LookVector.X * (bhopspeed * 2), Root.Velocity.y, rot.LookVector.Z * (bhopspeed * 2))
					elseif values.rage.Misc['type'].Dropdown == 'idk' then
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
			if values.rage.Misc['prevent launch'].Toggle and values.rage.Misc['prevent launch'].Active then 
				if Root.Velocity.Y > values.rage.Misc['launch block (y velocity)'].Slider then 
					Root.Velocity = C.Vec3(Root.Velocity.x, 0, Root.Velocity.z)
				end
			end			
		end)
			pcall(function()
				if values.rage.Autos["Auto Revive"].Toggle then
					if SavedValues['getState']:getState().down.isDowned == true then
						events.SelfReviveStart:FireServer()
						task.wait(.2)
						events.SelfRevive:FireServer()
					end
				end
			end)		
	end)




task.spawn(function()
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
		RunService.Heartbeat:Connect(function()
			if values.rage['Ranged sector']['silent aim'].Toggle and values.rage['Ranged sector']['Silent aim info gui'].Toggle then
				if game.CoreGui:FindFirstChild("Aiming real real") then
					game.CoreGui:FindFirstChild('Aiming real real').Enabled = true
					game.CoreGui:FindFirstChild('Aiming real real').Frame.BackgroundColor3 = values.rage['Ranged sector']['Silent aim info gui'].Color
				end
			else
				if game.CoreGui:FindFirstChild("Aiming real real") then
					game.CoreGui:FindFirstChild('Aiming real real').Enabled = false
				end			
			end
			PredictionV.Text = "Prediction Value: "..values.rage['Ranged sector']['Prediction val'].Slider
		end)
	end)

	
	
	
	
	
	
	
-- Simple Networking

	local remotes = {}
	local functions = {}
	local function checkParent(P)
		if P.Name == "Functions" then
			return 'RF'
		elseif P.Name == "Events" then
			return 'RE'
		end
	end
	for i,v in pairs(getgc(true)) do
		if typeof(v) == "table" and rawget(v,"Remote") then
			local Parent = checkParent(v.Remote.Parent)
			if Parent == "RF" then
				functions[v.Name] = v.Remote
			elseif Parent == "RE" then
				remotes[v.Name] = v.Remote
			end
		end
	end

	function fireserver(name,args)
		local Args = (args and true or false)
		if Args then
			if remotes[name] then
				if typeof(args) == "table" then
					remotes[name]:FireServer(unpack(args))
				else
					remotes[name]:FireServer(args)
				end
			end
		else
			if remotes[name] then
				remotes[name]:FireServer()
			end
		end
	end

	function invokeserver(name,args)
		local Args = (args and true or false)
		if Args then
			if functions[name] then
				functions[name]:FireServer(unpack(args))
			end
		else
			if functions[name] then
				functions[name]:FireServer()
			end
		end
	end

	local mouse = LocalPlayer:GetMouse()
	local function getClosestToMouse()
		local player, nearestDistance = nil, values.rage['Ranged sector']['field of view'].Slider
		for i,v in pairs(Players:GetPlayers()) do
			if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") and (not values.rage.Players['Whitelist players'].Toggle or not table.find(values.rage['Players'].Players.Jumbobox,v.Name)) then
				local root, visible = workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
				if visible then
					local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(root.X, root.Y)).Magnitude

					if distance < nearestDistance then
						nearestDistance = distance
						player = v
					end
				end
				if values.rage['Players']['Target player'].Toggle and v.Name == values.rage['Players']['Target'].Scroll then
					local root,visible = workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
					if visible then
						return v
					end
				end
			end
		end
		return player
	end

	local Arrow
	local ShotIdx
	local Predicted
	local C
	local Shot = false
	local HitGet = function(Path,Type)
		for i,v in pairs(Path:GetChildren()) do
			if v:IsA("Tool") then
				local IsBow = (v:FindFirstChild("ClientAmmo") and true or v:FindFirstChild("Hitboxes") and false) 
				if IsBow and Type == "Ranged" then
					return v
				elseif not IsBow and Type == "Melee" then
					return v
				end
			end
		end
	end

	local Functions = {
		GetWeapon = function(Path,Type)
			if not LocalPlayer.Character then return end
			Path = LocalPlayer.Character
			for i,v in pairs(Path:GetChildren()) do
				if v:IsA("Tool") then
					local IsBow = (v:FindFirstChild("ClientAmmo") and true or v:FindFirstChild("Hitboxes") and false) 
					if IsBow and Type == "Ranged" then
						return v
					elseif not IsBow and Type == "Melee" then
						return v
					end
				end
			end
			return nil
		end,
		Hit = function(Target)
			local Fake
			Fake = Target[values.rage['Ranged sector']['body part to hit'].Dropdown].Position + Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5))
			fireserver("RangedHit",{
				HitGet(LocalPlayer.Character,"Ranged"),
				Target[values.rage['Ranged sector']['body part to hit'].Dropdown],
				Fake,
				Target[values.rage['Ranged sector']['body part to hit'].Dropdown].CFrame:ToObjectSpace(CFrame.new(Fake)),
				Fake * Vector3.new(math.random(1,5),math.random(1,5),math.random(1,5)),
				tostring(ShotIdx)}
			)
		end
	}
	workspace.EffectsJunk.ChildAdded:Connect(function(p)
		task.wait()
		if LocalPlayer.Character:FindFirstChildOfClass("Tool") == nil then
			Shot = false
			return
		end
		local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
		if Tool:FindFirstChild("ClientAmmo") == nil then
			Shot = false
			return
		end
		if (Shot and p:IsA("MeshPart") and p:FindFirstChild("Tip") ~= nil) then
			Arrow = p
			--Instance.new('Highlight',p).Adornee = p
			Shot = false
			if createbullettracer then
				createbullettracer(p)
			end
		end
	end)


	for i,v in pairs(getgc(true)) do
		if typeof(v) == "table" and rawget(v,"shoot") then
			local old = v.shoot

			v.shoot = function(a)
				Shot = true
				ShotIdx = a.shotIdx
				return old(a)
			end
		end
		
		if typeof(v) == "table" and rawget(v,"calculateFireDirection") then
		--do
			
			local old;old = v.calculateFireDirection
			v.calculateFireDirection =	function(...)
				local Tool = Functions.GetWeapon("Ranged")
				if not Tool then
					return old(...)
				end
				if (Shot) then
					if not Predicted then
						return old(...)
					else
						return Predicted
					end
				end
				return old(...)
			end
		end
		--end
	end

	function GetFirePos(Tool)
		for i,v in pairs(Tool:GetDescendants()) do
			if (v:IsA("Attachment") and v.Name == "FirePoint") then
				return v.WorldCFrame.Position
			end
		end
	end

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

	local C
	local Predict
	RunService.Heartbeat:Connect(function()
		local Tool = Functions.GetWeapon(LocalPlayer.Character,"Ranged")
		C = getClosestToMouse()
			
		if not Tool then
			Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
			Aiming.Text = "Aiming At: None"
			Position.Text = "Position: None"
			if game.CoreGui:FindFirstChild('SilentAimTarget') then
				game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = nil
			end
			return 
		end
				--local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
		if not values.rage['Ranged sector']['silent aim'].Toggle then
			Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
			Aiming.Text = "Aiming At: None"
			Position.Text = "Position: None"
			if game.CoreGui:FindFirstChild('SilentAimTarget') then
				game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = nil
			end
			return
		end
		if Tool and values.rage['Ranged sector']['silent aim'].Toggle then
			
			local FirePos = GetFirePos(Tool)
			if C then
				if game.CoreGui:FindFirstChild('SilentAimTarget') then
					game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = C.Character
				end
						--Frame.Transparency = 0
					Aiming.Text = "Aiming At: "..C.Name
					PredictionV.Text = "Prediction Value: "..values.rage['Ranged sector']['Prediction val'].Slider/100
				
				Predict = C.Character[values.rage['Ranged sector']['body part to hit'].Dropdown].CFrame + (C.Character[values.rage['Ranged sector']['body part to hit'].Dropdown].Velocity * values.rage['Ranged sector']['Prediction val'].Slider/100 + Vector3.new(0, .1, 0))
				Predicted = CFrame.new(FirePos,(typeof(Predict) == "CFrame" and Predict.Position or Predict)).LookVector * 30
					
						--predicted = (CFrame.lookAt(Tool.Contents.Handle.FirePoint.WorldCFrame.Position, Prediction.Position)).LookVector * 30;
					Position.Text = "Position: "..(math.floor(Predict.Position.X*100)/100)..", "..(math.floor(Predict.Position.X*100)/100)..", "..(math.floor(Predict.Position.X*100)/100)
					local Vec = WorldToScreen(Predict.Position)
					Frame.Position = UDim2.new(0,Vec.X,0,Vec.Y)				
			else
				Frame.Position = UDim2.new(0.100260414, 0, 0.349072516, 0)
				Aiming.Text = "Aiming At: None"
				Position.Text = "Position: None"
				if game.CoreGui:FindFirstChild('SilentAimTarget') then
					game.CoreGui:FindFirstChild('SilentAimTarget').Adornee = nil
				end			
			end
			if Arrow then
				if C then
					if (Arrow.Position - C.Character.HumanoidRootPart.Position).Magnitude <= values.rage['Ranged sector']['hit distance'].Slider then
						if values.rage['Ranged sector']['hit type'].Dropdown == 'auto hit' then
							if values.rage['Ranged sector'].hitchance.Slider == 100 then
								Functions.Hit(C.Character)
								Shot = false
								Arrow = nil
							else
								if math.random(1,100) >= values.rage['Ranged sector'].hitchance.Slider then
									Functions.Hit(C.Character)
									Shot = false
									Arrow = nil						
								end
							end
						end
					end
				end
			end
		end
	end)
	local oldNamecall; oldNamecall = hookmetamethod(game,'__namecall', function(self, ...) 
		local method = tostring(getnamecallmethod()) 
		local args = {...} 
		if method == 'Raycast' and values.rage['Ranged sector']['hit type'].Dropdown == 'redirect' then
			local Origin = args[1]
			if C and (C.Character.HumanoidRootPart.Position-Origin).Magnitude <= values.rage['Ranged sector']['hit distance'].Slider then
				args[2] = (C.Character[values.rage['Ranged sector']['body part to hit'].Dropdown].Position-Origin).Unit * 100
				--print(Origin == Arrow.Position and 'true' or 'false',(Origin-Arrow.Position).Magnitude<=5 and 'true' or 'false',(Origin-Arrow.Position).Magnitude)
			end
		end
		if self.Name == 'RangedHit' then
			if values.rage['Ranged sector']['Always headshot'].Toggle then
				args[2] = args[2].Parent.Head
			elseif values.rage['Ranged sector']['silent aim'].Toggle then
				args[2] = args[2].Parent[values.rage['Ranged sector']['body part to hit'].Dropdown]
			end
	
			Shot = false
			Arrow = nil
		end
		return oldNamecall(self,unpack(args))
	end)	
end)

--visuals tab
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
	
do
		--local players = visuals:Sector("players",'Right')


		local Playere = visuals:Sector("players",'Left')
		Playere:Element("ToggleKeybind", "Enabled")
		Playere:Element("Slider", "Max Distance",{min = 250, max = 5000, default = 5000})
		Playere:Element("ToggleColor", "Box",{default = {Color = Color3.fromRGB(255, 255, 255)}})
		Playere:Element("ToggleColor", "Name",{default = {Color = Color3.fromRGB(255, 255, 255)}})
		Playere:Element("ToggleColor", "Health",{default = {Color = Color3.fromRGB(0, 255, 0)}})
		Playere:Element('ToggleColor','Health Text',{default = {Color = Color3.fromRGB(255,255,255)}})
		Playere:Element("ToggleColor", "Indicators",{default = {Color = Color3.fromRGB(255, 255, 255)}})
		Playere:Element("Jumbobox", "Types", {options = {"Tool", "Distance"}})
		Playere:Element("Dropdown", "Font", {options = {"Plex", "Monospace", "System", "UI"}}) 
		Playere:Element("Slider", "Size", {min = 12, max = 16, default = 13})
		
		--my code fuck anyone who complains about it
		local chams = {} -- too lazy to check for highlight everytime
		highlightfolder = Instance.new('Folder',game.CoreGui)
		Playere:Element('ToggleTrans','Chams',{},function(tbl)
			for i,v in pairs(Players:GetPlayers()) do
				if (not chams[v.Name]) and v.Character and v ~= LocalPlayer then
					if tbl.Toggle or values.visuals.players['Outline chams'].Toggle then
						local highlight = Instance.new('Highlight',highlightfolder)
						highlight.Adornee = v.Character
						if tbl.Toggle then
							highlight.FillColor = tbl.Color
							highlight.FillTransparency = tbl.Transparency
						
						else
							highlight.FillTransparency = 1
						end
						if values.visuals.players['Outline chams'].Toggle then
							highlight.OutlineColor = values.visuals.players['Outline chams'].Color
							highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
						else
							highlight.OutlineTransparency = 1
						end
							if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end						
						chams[v.Name] = highlight
					end
				elseif v.Character and v ~= LocalPlayer then
					if tbl.Toggle or values.visuals.players['Outline chams'].Toggle then
						local highlight = chams[v.Name]
						highlight.Adornee = v.Character
						if tbl.Toggle then
							highlight.FillColor = tbl.Color
							highlight.FillTransparency = tbl.Transparency
						
						else
							highlight.FillTransparency = 1
						end
						if values.visuals.players['Outline chams'].Toggle then
							highlight.OutlineColor = values.visuals.players['Outline chams'].Color
							highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
						else
							highlight.OutlineTransparency = 1
						end
							if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end						
					else
						chams[v.Name]:Destroy()
						chams[v.Name] = nil
					end
				end
			end
		end)
		Playere:Element('ToggleTrans','Outline chams',{},function(tbl)
			for i,v in pairs(Players:GetPlayers()) do
				if (not chams[v.Name]) and v.Character and v ~= LocalPlayer then
					if tbl.Toggle or values.visuals.players['Chams'].Toggle then
						local highlight = Instance.new('Highlight',highlightfolder)
						highlight.Adornee = v.Character
						if values.visuals.players['Chams'].Toggle then
							highlight.FillColor = tbl.Color
							highlight.FillTransparency = tbl.Transparency
						else
							highlight.FillTransparency = 1
						end
						if tbl.Toggle then
							highlight.OutlineColor = values.visuals.players['Outline chams'].Color
							highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
						else
							highlight.OutlineTransparency = 1
						end
							if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end					
						chams[v.Name] = highlight
					end
				elseif v.Character and v ~= LocalPlayer then
					if tbl.Toggle or values.visuals.players['Chams'].Toggle then
						local highlight = chams[v.Name]
						highlight.Adornee = v.Character
						if values.visuals.players['Chams'].Toggle then
							highlight.FillColor = values.visuals.players['Chams'].Color
							highlight.FillTransparency = values.visuals.players['Chams'].Transparency
						else
							highlight.FillTransparency = 1
						end
						if tbl.Toggle then
							highlight.OutlineColor = values.visuals.players['Outline chams'].Color
							highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
						else
							highlight.OutlineTransparency = 1
						end
							if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end						
					else
						chams[v.Name]:Destroy()
						chams[v.Name] = nil
					end
				end
			end
		end)
		Playere:Element('Toggle','Visible only',{},function(tbl)
			for i,v in pairs(Players:GetPlayers()) do
				--v.CharacterAdded:Connect(function()
					if (not chams[v.Name]) and v.Character and v ~= LocalPlayer then
						if values.visuals.players['Outline chams'].Toggle or values.visuals.players['Chams'].Toggle then
							local highlight = Instance.new('Highlight',highlightfolder)
							highlight.Adornee = v.Character
							if values.visuals.players['Chams'].Toggle then
								highlight.FillColor = values.visuals.players['Chams'].Color
								highlight.FillTransparency = values.visuals.players['Chams'].Transparency
							else
								highlight.FillTransparency = 1
							end
							if values.visuals.players['Outline chams'].Toggle then
								highlight.OutlineColor = values.visuals.players['Outline chams'].Color
								highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
							else
								highlight.OutlineTransparency = 1
							end
							if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end							
							chams[v.Name] = highlight
						end
					elseif v.Character and v ~= LocalPlayer then
						if values.visuals.players['Outline chams'].Toggle or values.visuals.players['Chams'].Toggle then
							local highlight = chams[v.Name]
							highlight.Adornee = v.Character
							if values.visuals.players['Chams'].Toggle then
								highlight.FillColor = values.visuals.players['Chams'].Color
								highlight.FillTransparency = values.visuals.players['Chams'].Transparency
							else
								highlight.FillTransparency = 1
							end
							if values.visuals.players['Outline chams'].Toggle then
								highlight.OutlineColor = values.visuals.players['Outline chams'].Color
								highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
							else
								highlight.OutlineTransparency = 1
							end
							if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end
						else
							chams[v.Name]:Destroy()
							chams[v.Name] = nil
						end
					end
				--end)		
			end		
		end)
		Players.PlayerAdded:Connect(function(v)
		
		--for i,v in pairs(Players:GetPlayers()) do
			v.CharacterAdded:Connect(function()
				if (not chams[v.Name]) and v.Character and v ~= LocalPlayer then
					if values.visuals.players['Outline chams'].Toggle or values.visuals.players['Chams'].Toggle then
						local highlight = Instance.new('Highlight',highlightfolder)
						highlight.Adornee = v.Character
						if values.visuals.players['Chams'].Toggle then
							highlight.FillColor = values.visuals.players['Chams'].Color
							highlight.FillTransparency = values.visuals.players['Chams'].Transparency
						else
							highlight.FillTransparency = 1
						end
						if values.visuals.players['Outline chams'].Toggle then
							highlight.OutlineColor = values.visuals.players['Outline chams'].Color
							highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
						else
							highlight.OutlineTransparency = 1
						end
							if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end						
						chams[v.Name] = highlight
					end
				elseif v.Character and v ~= LocalPlayer then
					if values.visuals.players['Outline chams'].Toggle or values.visuals.players['Chams'].Toggle then
						local highlight = chams[v.Name]
						highlight.Adornee = v.Character
						if values.visuals.players['Chams'].Toggle then
							highlight.FillColor = values.visuals.players['Chams'].Color
							highlight.FillTransparency = values.visuals.players['Chams'].Transparency
						else
							highlight.FillTransparency = 1
						end
						if values.visuals.players['Outline chams'].Toggle then
							highlight.OutlineColor = values.visuals.players['Outline chams'].Color
							highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
						else
							highlight.OutlineTransparency = 1
						end
						if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end							
					else
						chams[v.Name]:Destroy()
						chams[v.Name] = nil
					end
				end
			end)
		end)
		Players.PlayerRemoving:Connect(function(v)
			if chams[v.Name] then
				pcall(function()
					chams:Destroy()
					chams = nil
				end)
			end
		end)
		--task.wait(0.2)
		for i,v in pairs(Players:GetPlayers()) do
			v.CharacterAdded:Connect(function()
				if (not chams[v.Name]) and v.Character and v ~= LocalPlayer then
					if values.visuals.players['Outline chams'].Toggle or values.visuals.players['Chams'].Toggle then
						local highlight = Instance.new('Highlight',highlightfolder)
						highlight.Adornee = v.Character
						if values.visuals.players['Chams'].Toggle then
							highlight.FillColor = values.visuals.players['Chams'].Color
							highlight.FillTransparency = values.visuals.players['Chams'].Transparency
						else
							highlight.FillTransparency = 1
						end
						if values.visuals.players['Outline chams'].Toggle then
							highlight.OutlineColor = values.visuals.players['Outline chams'].Color
							highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
						else
							highlight.OutlineTransparency = 1
						end
						if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end	
						chams[v.Name] = highlight
					end
				elseif v.Character and v ~= LocalPlayer then
					if values.visuals.players['Outline chams'].Toggle or values.visuals.players['Chams'].Toggle then
						local highlight = chams[v.Name]
						highlight.Adornee = v.Character
						if values.visuals.players['Chams'].Toggle then
							highlight.FillColor = values.visuals.players['Chams'].Color
							highlight.FillTransparency = values.visuals.players['Chams'].Transparency
						else
							highlight.FillTransparency = 1
						end
						if values.visuals.players['Outline chams'].Toggle then
							highlight.OutlineColor = values.visuals.players['Outline chams'].Color
							highlight.OutlineTransparency = values.visuals.players['Outline chams'].Transparency
						else
							highlight.OutlineTransparency = 1
						end
							if values.visuals.players['Visible only'].Toggle then
								highlight.DepthMode = 1
							else
								highlight.DepthMode = 0
							end						
					else
						chams[v.Name]:Destroy()
						chams[v.Name] = nil
					end
				end
			end)		
		end
		local oof = visuals:Sector("Out Of FOV", "Right")
		oof:Element("ToggleColor", "Enabled",{default = {Color = Color3.fromRGB(255, 255, 255)}})
		oof:Element("Slider", "Size", {min = 10, max = 15, default = 15})
		oof:Element("Slider", "Offset", {min = 100, max = 700, default = 400})
		oof:Element("Jumbobox", "Settings", {options = {"Outline", "Blinking"}})

	local PlayerDrawings = {}
	local Settings = {
		Line = {
			Thickness = 1,
			Color = Color3.fromRGB(0, 255, 0)
		},
		Text = {
			Size = 13,
			Center = true,
			Outline = true,
			Font = Drawing.Fonts.Plex,
			Color = Color3.fromRGB(255, 255, 255)
		},
		Square = {
			Thickness = 1,
			Color = values.visuals.players["Box"].Color,
			Filled = false
		},
		Triangle = {
			Color = Color3.fromRGB(255, 255, 255),
			Filled = true,
			Visible = false,
			Thickness = 1
		}
	}

	function New(Type, Outline, Name)
		local drawing = Drawing.new(Type)
		for i, v in pairs(Settings[Type]) do
			drawing[i] = v
		end
		if Outline then
			drawing.Color = Color3.new(0, 0, 0)
			drawing.Thickness = 3
		end
		return drawing
	end

	function Add(Player)
		if not PlayerDrawings[Player] then
			PlayerDrawings[Player] = {
				Offscreen = New("Triangle", nil, "Offscreen"),
				Name = New("Text", nil, "Name"),
				Tool = New("Text", nil, "Tool"),
				Distance = New("Text", nil, "Distance"),
				BoxOutline = New("Square", true, "BoxOutline"),
				Box = New("Square", nil, "Box"),
				HealthOutline = New("Line", true, "HealthOutline"),
				Health = New("Line", nil, "Health"),
				HealthText = New('Text',nil,'HealthText')
			}
		end
	end

	for _, Player in pairs(Players:GetPlayers()) do
		if Player ~= LocalPlayer then
			Add(Player)
		end
	end
	Players.PlayerAdded:Connect(Add)
	Players.PlayerRemoving:Connect(
		function(Player)
			if PlayerDrawings[Player] then
				for i, v in pairs(PlayerDrawings[Player]) do
					if v then
						v:Remove()
					end
				end

				PlayerDrawings[Player] = nil
			end
		end
	)


local ESPLoop =
    game:GetService("RunService").RenderStepped:Connect(
    function()
        for _, Player in pairs(Players:GetPlayers()) do
            local PlayerDrawing = PlayerDrawings[Player]
            if not PlayerDrawing then
                continue
            end

            for _, Drawing in pairs(PlayerDrawing) do
                Drawing.Visible = false
            end

            if (not values.visuals.players.Enabled.Toggle or not values.visuals.players["Enabled"].Active) then
                continue
            end
            local Character = Player.Character
            local RootPart, Humanoid =
                Character and Character:FindFirstChild("HumanoidRootPart"),
                Character and Character:FindFirstChildOfClass("Humanoid")
            if not Character or not RootPart or not Humanoid then
                continue
            end

            local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude
            if values.visuals.players["Max Distance"].Slider < DistanceFromCharacter then
				continue
            end

            local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
            if not OnScreen then
                local VisualTable = values.visuals["Out Of FOV"]

                local RootPos = RootPart.Position
                local CameraVector = Camera.CFrame.Position
                local LookVector = Camera.CFrame.LookVector

                local Dot = LookVector:Dot(RootPart.Position - Camera.CFrame.Position)
                if Dot <= 0 then
                    RootPos = (CameraVector + ((RootPos - CameraVector) - ((LookVector * Dot) * 1.01)))
                end

                local ScreenPos, OnScreen = Camera:WorldToScreenPoint(RootPos)
                if not OnScreen then
                    local Drawing = PlayerDrawing.Offscreen
                    local FOV = 800 - values.visuals["Out Of FOV"].Offset.Slider
                    local Size = values.visuals["Out Of FOV"].Size.Slider

                    local Center = (Camera.ViewportSize / 2)
                    local Direction = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Center).Unit
                    local Radian = math.atan2(Direction.X, Direction.Y)
                    local Angle = (((math.pi * 2) / FOV) * Radian)
                    local ClampedPosition =
                        (Center +
                        (Direction *
                            math.min(
                                math.abs(((Center.Y - FOV) / math.sin(Angle)) * FOV),
                                math.abs((Center.X - FOV) / (math.cos(Angle)) / 2)
                            )))
                    local Point =
                        Vector2.new(
                        math.floor(ClampedPosition.X - (Size / 2)),
                        math.floor((ClampedPosition.Y - (Size / 2) - 15))
                    )

                    local function Rotate(point, center, angle)
                        angle = math.rad(angle)
                        local rotatedX =
                            math.cos(angle) * (point.X - center.X) - math.sin(angle) * (point.Y - center.Y) + center.X
                        local rotatedY =
                            math.sin(angle) * (point.X - center.X) + math.cos(angle) * (point.Y - center.Y) + center.Y

                        return Vector2.new(math.floor(rotatedX), math.floor(rotatedY))
                    end

                    local Rotation = math.floor(-math.deg(Radian)) - 47
                    Drawing.PointA = Rotate(Point + Vector2.new(Size, Size), Point, Rotation)
                    Drawing.PointB = Rotate(Point + Vector2.new(-Size, -Size), Point, Rotation)
                    Drawing.PointC = Rotate(Point + Vector2.new(-Size, Size), Point, Rotation)
                    Drawing.Color = VisualTable["Enabled"].Color
                    Drawing.Filled =
                        not table.find(values.visuals["Out Of FOV"].Settings.Jumbobox, "Outline") and true or false
                    if table.find(values.visuals["Out Of FOV"].Settings.Jumbobox, "Blinking") then
                        Drawing.Transparency = (math.sin(tick() * 5) + 1) / 2
                    else
                        Drawing.Transparency = 1
                    end

                    if VisualTable.Enabled.Toggle then
                        Drawing.Visible = true
                    else
                        Drawing.Visible = false
                    end
                end
            else
				local VisualTable = values.visuals.players
                local Size =
                    (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y -
                    Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) /
                    2
                local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
                local BoxPos = Vector2.new(math.floor(Pos.X - Size * 1.5 / 2), math.floor(Pos.Y - Size * 1.6 / 2))

                local Name = PlayerDrawing.Name
                local Tool = PlayerDrawing.Tool
                local Distance = PlayerDrawing.Distance
                local Box = PlayerDrawing.Box
                local BoxOutline = PlayerDrawing.BoxOutline
                local Health = PlayerDrawing.Health
				local HealthText = PlayerDrawing.HealthText
                local HealthOutline = PlayerDrawing.HealthOutline

                if VisualTable.Box.Toggle then
                    Box.Size = BoxSize
                    Box.Position = BoxPos
                    Box.Visible = true
                    Box.Color = VisualTable["Box"].Color
                    BoxOutline.Size = BoxSize
                    BoxOutline.Position = BoxPos
                    BoxOutline.Visible = true
                end

                if VisualTable.Health.Toggle then
                    Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    Health.To =
                        Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
                    Health.Color = VisualTable["Health"].Color
                    Health.Visible = true

                    HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
                    HealthOutline.To = Vector2.new(Health.From.X, (Health.From.Y - 1 * BoxSize.Y) - 1)
                    HealthOutline.Visible = true
									

--math.floor(value*100)/100
					if VisualTable['Health Text'].Toggle then
						HealthText.Text = tostring(math.floor(Humanoid.Health*100)/100)
						
						HealthText.Position = Vector2.new(Health.To.X, Health.To.Y-5) -- 0 up - 1366 down
						HealthText.Size = VisualTable['Size'].Slider
						HealthText.Font = Drawing.Fonts[VisualTable['Font'].Dropdown]
						HealthText.Visible = true
						HealthText.Color = VisualTable['Health Text'].Color
					end
                end

                if VisualTable.Name.Toggle then
                    Name.Text = Player.Name
                    Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    Name.Color = VisualTable["Name"].Color
                    Name.Font = Drawing.Fonts[VisualTable['Font'].Dropdown]
                    Name.Visible = true
					Name.Size = VisualTable['Size'].Slider
                end

                if VisualTable.Indicators.Toggle then
                    local BottomOffset = BoxSize.Y + BoxPos.Y + 1
                    if table.find(VisualTable.Types.Jumbobox, "Tool") then
                        local Equipped =
                            Player.Character:FindFirstChildOfClass("Tool") and
                            Player.Character:FindFirstChildOfClass("Tool").Name or
                            "None"
                        Equipped = Equipped
                        Tool.Text = Equipped
                        Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                        Tool.Color = VisualTable["Indicators"].Color
                        Tool.Font = Drawing.Fonts[VisualTable['Font'].Dropdown]
                        Tool.Visible = true
						Tool.Size = VisualTable['Size'].Slider
                        BottomOffset = BottomOffset + 15
                    end
                    if table.find(VisualTable.Types.Jumbobox, "Distance") then
                        Distance.Text = math.floor(DistanceFromCharacter) .. "m"
                        Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                        Distance.Color = VisualTable["Indicators"].Color
                        Distance.Font = Drawing.Fonts[VisualTable['Font'].Dropdown]
                        Distance.Visible = true
						Distance.Size = VisualTable['Size'].Slider

                        BottomOffset = BottomOffset + 15
                    end
                end
            end
        end
		
		
		
		
		if values.rage.combat['Visualize target'].Toggle and ClosestKillaura ~= nil and game.Players[ClosestKillaura.Name] ~= nil  then
			local Player = game.Players[ClosestKillaura.Name]
			local PlayerDrawing = PlayerDrawings[Player]
            if not PlayerDrawing then
                return
            end

            for _, Drawing in pairs(PlayerDrawing) do
                Drawing.Visible = false
            end


            local Character = Player.Character
            local RootPart, Humanoid =
                Character and Character:FindFirstChild("HumanoidRootPart"),
                Character and Character:FindFirstChildOfClass("Humanoid")
            if not Character or not RootPart or not Humanoid then
                return
            end

            local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude

            local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
            if OnScreen then
			--values.visuals.players
				local VisualTable = values.visuals.players
                local Size =
                    (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y -
                    Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) /
                    2
                local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
                local BoxPos = Vector2.new(math.floor(Pos.X - Size * 1.5 / 2), math.floor(Pos.Y - Size * 1.6 / 2))

                local Name = PlayerDrawing.Name
                local Tool = PlayerDrawing.Tool
                local Distance = PlayerDrawing.Distance
                local Box = PlayerDrawing.Box
                local BoxOutline = PlayerDrawing.BoxOutline
                local Health = PlayerDrawing.Health
				local HealthText = PlayerDrawing.HealthText
                local HealthOutline = PlayerDrawing.HealthOutline

                if VisualTable.Box.Toggle then
                    Box.Size = BoxSize
                    Box.Position = BoxPos
                    Box.Visible = true
                    Box.Color = (values.rage.combat['Box'].Toggle and values.rage.combat['Box'].Color or VisualTable['Box'].Color)
                    BoxOutline.Size = BoxSize
                    BoxOutline.Position = BoxPos
                    BoxOutline.Visible = true
                end

                if VisualTable.Health.Toggle then
                    Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    Health.To =
                        Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
                    Health.Color = (values.rage.combat['Health'].Toggle and values.rage.combat['Health'].Color or VisualTable['Health'].Color)
                    Health.Visible = true

                    HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
                    HealthOutline.To = Vector2.new(Health.From.X, (Health.From.Y - 1 * BoxSize.Y) - 1)
                    HealthOutline.Visible = true
									

--math.floor(value*100)/100
					if VisualTable['Health Text'].Toggle then
						HealthText.Text = tostring(math.floor(Humanoid.Health*100)/100)
						
						HealthText.Position = Vector2.new(Health.To.X, Health.To.Y-5) -- 0 up - 1366 down
						HealthText.Size = VisualTable['Size'].Slider
						HealthText.Font = Drawing.Fonts[VisualTable['Font'].Dropdown]
						HealthText.Visible = true
						HealthText.Color = (values.rage.combat['Health Text'].Toggle and values.rage.combat['Health Text'].Color or VisualTable['Health Text'].Color)
					end
                end

                if VisualTable.Name.Toggle then
                    Name.Text = Player.Name
                    Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    Name.Color =(values.rage.combat['Name'].Toggle and values.rage.combat['Name'].Color or VisualTable['Name'].Color)
                    Name.Font = Drawing.Fonts[VisualTable['Font'].Dropdown]
                    Name.Visible = true
					Name.Size = VisualTable['Size'].Slider
                end

                if VisualTable.Indicators.Toggle then
                    local BottomOffset = BoxSize.Y + BoxPos.Y + 1
                    if table.find(VisualTable.Types.Jumbobox, "Tool") then
                        local Equipped =
                            Player.Character:FindFirstChildOfClass("Tool") and
                            Player.Character:FindFirstChildOfClass("Tool").Name or
                            "None"
                        Equipped = Equipped
                        Tool.Text = Equipped
                        Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                        Tool.Color = (values.rage.combat['Indicators'].Toggle and values.rage.combat['Indicators'].Color or VisualTable['Indicators'].Color)
                        Tool.Font = Drawing.Fonts[VisualTable['Font'].Dropdown]
                        Tool.Visible = true
						Tool.Size = VisualTable['Size'].Slider
                        BottomOffset = BottomOffset + 15
                    end
                    if table.find(VisualTable.Types.Jumbobox, "Distance") then
                        Distance.Text = math.floor(DistanceFromCharacter) .. "m"
                        Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                        Distance.Color = (values.rage.combat['Indicators'].Toggle and values.rage.combat['Indicators'].Color or VisualTable['Indicators'].Color)
                        Distance.Font = Drawing.Fonts[VisualTable['Font'].Dropdown]
                        Distance.Visible = true
						Distance.Size = VisualTable['Size'].Slider

                        BottomOffset = BottomOffset + 15
                    end
                end
            end
		end
--i want to kill myself			
    end
)




	
	--world
	do
		local world = visuals:Sector("world", "Left") 
		world:Element("Slider", "time changer", {min = 0, max = 15, default = game.Lighting.ClockTime}, function(tbl)
			game.Lighting.ClockTime = tbl.Slider
		end)
		local Skyboxes = { 
			["nebula"] = { 
				SkyboxLf = "rbxassetid://159454286", 
				SkyboxBk = "rbxassetid://159454299", 
				SkyboxDn = "rbxassetid://159454296", 
				SkyboxFt = "rbxassetid://159454293", 
				SkyboxRt = "rbxassetid://159454300", 
				SkyboxUp = "rbxassetid://159454288", 
			}, 
			["vaporwave"] = { 
				SkyboxLf = "rbxassetid://1417494402", 
				SkyboxBk = "rbxassetid://1417494030", 
				SkyboxDn = "rbxassetid://1417494146", 
				SkyboxFt = "rbxassetid://1417494253", 
				SkyboxRt = "rbxassetid://1417494499", 
				SkyboxUp = "rbxassetid://1417494643", 
			}, 
			["clouds"] = { 
				SkyboxLf = "rbxassetid://570557620", 
				SkyboxBk = "rbxassetid://570557514", 
				SkyboxDn = "rbxassetid://570557775", 
				SkyboxFt = "rbxassetid://570557559", 
				SkyboxRt = "rbxassetid://570557672", 
				SkyboxUp = "rbxassetid://570557727", 
			}, 
			["twilight"] = { 
				SkyboxLf = "rbxassetid://264909758", 
				SkyboxBk = "rbxassetid://264908339", 
				SkyboxDn = "rbxassetid://264907909", 
				SkyboxFt = "rbxassetid://264909420", 
				SkyboxRt = "rbxassetid://264908886", 
				SkyboxUp = "rbxassetid://264907379", 
			}, 
		} 		
		local oldSkybox
		if Lighting:FindFirstChildOfClass("Sky") then oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone() end 
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
		world:Element('Dropdown', 'Tracers', {options = {"normal", "lightning 1", "lightning 2", "lightning 3",'lighting 4','lightning 5','lightning 6'}})
		world:Element("ToggleColor", "bullet tracers", {default = {Color = C.COL3RGB(255, 255, 255)}}) 
		local Folder = C.INST("Folder")
		Folder.Parent = game:GetService("Workspace")
		Folder.Name = 'beams'
		function createbullettracer(arrow)
			if not values.visuals.world['bullet tracers'].Toggle then return end
			local Part = C.INST("Part")
			Part.CanCollide = false
			Part.CFrame = arrow.CFrame
			Part.Size = C.Vec3(0, 0, 0)
			Part.TopSurface = Enum.SurfaceType.Smooth
			Part.Parent = Folder
			Part.Transparency = 1
			Part.Anchored = true



				
			local Object1 = C.INST("Attachment")
			Object1.Name = "1"
			Object1.Parent = Part

			local Object2 = C.INST("Attachment")
			Object2.Name = "2"
			Object2.Parent = arrow

			local Beam = C.INST("Beam")
			Beam.Attachment0 = Object1
			Beam.Attachment1 = Object2
			Beam.LightInfluence = 1
			Beam.Texture = values.visuals.world["Tracers"].Dropdown == "normal" and "rbxassetid://5854341017" or values.visuals.world["Tracers"].Dropdown == "lightning 1" and "rbxassetid://7151777149" or values.visuals.world["Tracers"].Dropdown == "lightning 2" and "rbxassetid://7501973572" or values.visuals.world["Tracers"].Dropdown == "lightning 3" and "rbxassetid://257173628"or values.visuals.world["Tracers"].Dropdown == "lightning 4" and "rbxassetid://6060542021"or values.visuals.world["Tracers"].Dropdown == "lightning 5" and "rbxassetid://6060542158"or values.visuals.world["Tracers"].Dropdown == "lightning 6" and "rbxassetid://6060542252"
			Beam.Parent = Folder
			Beam.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, values.visuals.world["bullet tracers"].Color), ColorSequenceKeypoint.new(1, values.visuals.world["bullet tracers"].Color)}
		end
	end
	
	--effects
	local effects = visuals:Sector('effects','Right')
	do
		effects:Element("ToggleColor", "world color", {default = {Color = C.COL3RGB(255,255,255)}}, function(val) 
			if val.Toggle and Lighting:FindFirstChild('ColorCorrection') then 
				Lighting.ColorCorrection.TintColor = val.Color 
			elseif Lighting:FindFirstChild('ColorCorrection') then
				Lighting.ColorCorrection.TintColor = C.COL3RGB(255,255,255) 
			end 
		end)
		RunService.RenderStepped:Connect(function()
			if values.visuals.effects['world color'].Toggle and Lighting:FindFirstChild('ColorCorrection') then 
				Lighting.ColorCorrection.TintColor = values.visuals.effects['world color'].Color 
			elseif Lighting:FindFirstChild('ColorCorrection') then
				Lighting.ColorCorrection.TintColor = C.COL3RGB(255,255,255) 
			end 		
		end)
		effects:Element('Dropdown','lighting technology',{options = {'ShadowMap','Legacy','Future'}},function(tbl) 
			sethiddenproperty(game.Lighting,'Technology',tbl.Dropdown)
		end)
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
	end
	
	do
	--hit rbxassetid://160432334 kill rbxassetid://2868331684 nuke rbxassetid://3237286675 
		local uncomplicatedfunction = function(s,path,tbl)
			if tbl.Toggle then
				if values.visuals.sounds[s..' sound type'].Dropdown == 'Roblox ID' then
					if ValidateSong(values.visuals.sounds[''..s..' sound'].Text) == true then
						if s == 'kill' then
							path.PlaybackSpeed = 1
						end
							path.Volume = values.visuals.sounds[''..s..' volume'].Slider
							path.SoundId = 'rbxassetid://'..values.visuals.sounds[''..s..' sound'].Text
						--end
					else return error('Wrong id or path!') end
				elseif values.visuals.sounds[s..' sound type'].Dropdown == "skeet" or values.visuals.sounds[s..' sound type'].Dropdown == "neverlose" or values.visuals.sounds[s..' sound type'].Dropdown == "rust" or values.visuals.sounds[s..' sound type'].Dropdown == "bag" or values.visuals.sounds[s..' sound type'].Dropdown == "baimware" or values.visuals.sounds[s..' sound type'].Dropdown == "osu" or values.visuals.sounds[s..' sound type'].Dropdown == "Tf2" or values.visuals.sounds[s..' sound type'].Dropdown == "Tf2 pan" or values.visuals.sounds[s..' sound type'].Dropdown  == "M55solix" or values.visuals.sounds[s..' sound type'].Dropdown == "Slap" or values.visuals.sounds[s..' sound type'].Dropdown  == "1" or values.visuals.sounds[s..' sound type'].Dropdown == "Minecraft" or values.visuals.sounds[s..' sound type'].Dropdown == "jojo" or values.visuals.sounds[s..' sound type'].Dropdown == "vibe" or values.visuals.sounds[s..' sound type'].Dropdown == "supersmash" or values.visuals.sounds[s..' sound type'].Dropdown == "epic" or values.visuals.sounds[s..' sound type'].Dropdown == "retro" or values.visuals.sounds[s..' sound type'].Dropdown == "quek" or values.visuals.sounds[s..' sound type'].Dropdown == "SEMI" then
						if s == 'kill' then
							path.PlaybackSpeed = 1
						end					
						path.Volume = values.visuals.sounds[''..s..' volume'].Slider						
					path.SoundId = values.visuals.sounds[s..' sound type'].Dropdown == "skeet" and "rbxassetid://5447626464" or values.visuals.sounds[s..' sound type'].Dropdown == "neverlose" and "rbxassetid://5043539486" or values.visuals.sounds[s..' sound type'].Dropdown == "rust" and "rbxassetid://5043539486" or values.visuals.sounds[s..' sound type'].Dropdown == "bag" and "rbxassetid://364942410" or values.visuals.sounds[s..' sound type'].Dropdown == "baimware" and "rbxassetid://6607339542" or values.visuals.sounds[s..' sound type'].Dropdown == "osu" and "rbxassetid://7149919358" or values.visuals.sounds[s..' sound type'].Dropdown == "Tf2" and "rbxassetid://296102734" or values.visuals.sounds[s..' sound type'].Dropdown == "Tf2 pan" and "rbxassetid://3431749479" or values.visuals.sounds[s..' sound type'].Dropdown  == "M55solix" and "rbxassetid://364942410" or values.visuals.sounds[s..' sound type'].Dropdown == "Slap" and "rbxassetid://4888372697" or values.visuals.sounds[s..' sound type'].Dropdown  == "1" and "rbxassetid://7349055654" or values.visuals.sounds[s..' sound type'].Dropdown == "Minecraft" and "rbxassetid://7273736372" or values.visuals.sounds[s..' sound type'].Dropdown == "jojo" and "rbxassetid://6787514780" or values.visuals.sounds[s..' sound type'].Dropdown == "vibe" and "rbxassetid://1848288500" or values.visuals.sounds[s..' sound type'].Dropdown == "supersmash" and "rbxassetid://2039907664" or values.visuals.sounds[s..' sound type'].Dropdown == "epic" and "rbxassetid://7344303740" or values.visuals.sounds[s..' sound type'].Dropdown == "retro" and "rbxassetid://3466984142" or values.visuals.sounds[s..' sound type'].Dropdown == "quek" and "rbxassetid://4868633804" or values.visuals.sounds[s..' sound type'].Dropdown == "SEMI" and "rbxassetid://7791675603" 
				else
					getAsset = getsynasset or getcustomasset
					if not isfile(values.other.Radio.music.Text) then
						return error('Wrong id or path!')
					end
						if s == 'kill' then
							path.PlaybackSpeed = 1
						end					
						path.Volume = values.visuals.sounds[''..s..' volume'].Slider
						path.SoundId = getAsset(values.visuals.sounds[''..s..' sound'].Text)					
				end
			else
				if s == 'kill' then
					path.PlaybackSpeed = 1.25
					path.Volume = 0.2
					path.SoundId = 'rbxassetid://2868331684'
				elseif s == 'hit' then
					path.Volume = 0.2
					path.SoundId = 'rbxassetid://160432334'
				elseif s == 'nuke' then
					path.Volume = 1
					path.SoundId = 'rbxassetid://3237286675'
				end
			end
		end
		local sounds = visuals:Sector('sounds','Right')

		--values.visuals.sounds

		sounds:Element('Toggle','Custom kill sound',{},function(tbl)
			uncomplicatedfunction('kill',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.KillSound,tbl)
		end)

		sounds:Element('TextBox','kill sound',{placeholder = 'rbx id or workspace path'},function()
			uncomplicatedfunction('kill',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.KillSound,values.visuals.sounds['Custom kill sound'])		
		end)
		sounds:Element('Dropdown','kill sound type',{options = {'Roblox ID','workspace path',"skeet", "neverlose", "rust", "bag", "baimware", "osu", "Tf2", "Tf2 pan", "M55solix", "Slap", "1", "Minecraft", "jojo", "vibe", "supersmash", "epic", "retro", "quek", "SEMI"}},function()
			uncomplicatedfunction('kill',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.KillSound,values.visuals.sounds['Custom kill sound'])		
		end)
		sounds:Element('Slider','kill volume',{min = 0,max = 2,default = 0.2},function()
			uncomplicatedfunction('kill',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.KillSound,values.visuals.sounds['Custom kill sound'])		
		end)
		sounds:Element('Button','test kill sound',{},function()
			game:GetService("ReplicatedStorage").Shared.Assets.Sounds.KillSound:Play()
		end)
		--values.visuals.sounds

		sounds:Element('Toggle','Custom hit sound',{},function(tbl)
			uncomplicatedfunction('hit',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.HitmarkerSound,tbl)
		end)
		sounds:Element('TextBox','hit sound',{placeholder = 'rbx id or workspace path'},function()
			uncomplicatedfunction('hit',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.HitmarkerSound,values.visuals.sounds['Custom hit sound'])		
		end)
		sounds:Element('Dropdown','hit sound type',{options = {'Roblox ID','workspace path'}},function()
			uncomplicatedfunction('hit',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.HitmarkerSound,values.visuals.sounds['Custom hit sound'])		
		end)
		sounds:Element('Slider','hit volume',{min = 0,max = 2,default = 0.2},function()
			uncomplicatedfunction('hit',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.HitmarkerSound,values.visuals.sounds['Custom hit sound'])		
		end)
		sounds:Element('Button','test hit sound',{},function()
			game:GetService("ReplicatedStorage").Shared.Assets.Sounds.HitmarkerSound:Play()
		end)
		--values.visuals.sounds

		sounds:Element('Toggle','custom nuke sound',{},function(tbl)
			uncomplicatedfunction('nuke',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.NukeAlarmSound,tbl)
		end)
		sounds:Element('Toggle','nuke looped',{default = {Toggle = true}},function(tbl)
			if tbl.Toggle then
				game:GetService("ReplicatedStorage").Shared.Assets.Sounds.NukeAlarmSound.Looped	= true
			else
				game:GetService("ReplicatedStorage").Shared.Assets.Sounds.NukeAlarmSound.Looped = false
			end
		end)
		sounds:Element('TextBox','Custom nuke sound',{placeholder = 'rbx id or workspace path'},function()
			uncomplicatedfunction('nuke',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.NukeAlarmSound,values.visuals.sounds['Custom nuke sound'])		
		end)
		sounds:Element('Dropdown','nuke sound type',{options = {'Roblox ID','workspace path'}})
		
		sounds:Element('Button','test nuke sound',{},function()
			game:GetService("ReplicatedStorage").Shared.Assets.Sounds.NukeAlarmSound:Play()
		end)
		sounds:Element('Slider','nuke volume',{min = 0,max = 2,default = 1},function()
			uncomplicatedfunction('nuke',game:GetService("ReplicatedStorage").Shared.Assets.Sounds.NukeAlarmSound,values.visuals.sounds['Custom nuke sound'])		
		end)
		sounds:Element('Button','stop nuke sound(when looped)',{},function()
			game:GetService("ReplicatedStorage").Shared.Assets.Sounds.NukeAlarmSound:Stop()
		end)		
	end
	--Kill screen
	do
	
	
		effects:Element('ToggleTrans','Kill screen')
		effects:Element('Dropdown','Kill screen type',{options = {'Color','Image','Both'}})
		effects:Element('TextBox', 'Image',{placeholder = 'ID or path',NoLimit = true})
		effects:Element('Dropdown','Image type',{options = {'Roblox ID','workspace image'}})
		effects:Element('Slider','Delay disappearing',{min = 0.1,max = 2, default = 1.5})
		effects:Element('Slider','Speed disappearing',{min = 0.1,max = 1, default = 0.5})
		
		effects:Element('Slider','Image size(X)',{min = 1,max = game.CoreGui:FindFirstChildOfClass('ScreenGui').AbsoluteSize.X,default = 1})
		effects:Element('Slider','Image size(Y)',{min = 1,max = game.CoreGui:FindFirstChildOfClass('ScreenGui').AbsoluteSize.Y+36,default = 1})
		
		effects:Element('Slider','Image Transparency', {min = 0,max = 1})
		
		killeffect = function(killed,died)		
			if not values.visuals.effects['Kill screen'].Toggle then return end
			if killed ~= LocalPlayer then return end
			if died == LocalPlayer then return end
			task.spawn(function()
				scren = Instance.new('ScreenGui',game.CoreGui)
				scren.IgnoreGuiInset = true
				if values.visuals.effects['Kill screen type'].Dropdown == 'Image' or values.visuals.effects['Kill screen type'].Dropdown == 'Both' then
					frem = Instance.new("ImageLabel",scren)
					frem.BackgroundTransparency = 1
					frem.ImageTransparency = values.visuals.effects['Image Transparency'].Slider
					frem.Position = UDim2.new(0.5,0,0.5,0)
					frem.AnchorPoint = Vector2.new(0.5,0.5)
					frem.Size = UDim2.new(0.5,values.visuals.effects['Image size(X)'].Slider,0.5,values.visuals.effects['Image size(Y)'].Slider)
					frem.BorderSizePixel = 0
					if values.visuals.effects['Image type'] == 'workspace image' then
						getAsset = getsynasset or getcustomasset
						
						frem.Image = getAsset(values.visuals.effects['Image'].Text)
					else
						frem.Image = 'rbxassetid://'..values.visuals.effects['Image'].Text
					end
					repeat wait() until frem:IsLoaded()
				end
				if values.visuals.effects['Kill screen type'].Dropdown == 'Color' or values.visuals.effects['Kill screen type'].Dropdown == 'Both' then
					frem2 = Instance.new('Frame',scren)
					frem2.BackgroundTransparency = values.visuals.effects['Kill screen'].Transparency
					frem2.Size = UDim2.new(1,0,1,0)
					frem2.BorderSizePixel = 0
					frem2.BackgroundColor3 = values.visuals.effects['Kill screen'].Color
					
					task.delay(values.visuals.effects['Delay disappearing'].Slider,function()
						if frem ~= nil then
							library:Tween(frem, TweenInfo.new(values.visuals.effects['Speed disappearing'].Slider, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}) 
						end
						if frem2 ~= nil then
							library:Tween(frem2, TweenInfo.new(values.visuals.effects['Speed disappearing'].Slider, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = 1}) 
						end
						
						if frem ~= nil then	
							task.spawn(function()
								repeat wait() until frem.ImageTransparency == 1
								frem:Destroy()
							end)
						end
						if frem2 ~= nil then
							task.spawn(function()
								repeat wait() until frem2.BackgroundTransparency == 1
								frem2:Destroy()
							end)
						end
						repeat wait() until not scren:FindFirstChildOfClass('Frame')
						scren:Destroy()
					end)
				end
			end)
		end
		effects:Element('Button','Test',{},killeffect)
		KillFeed:Connect(killeffect)
		--Kill screen Kill screen type (Color,Image), Image Image type(Roblox ID workspace image)
	end
end


--skins tab
do
	
	
	
	
	
local AllCharacters = {} 

for i,v in pairs(ChrModels:GetChildren()) do 
	C.INSERT(AllCharacters, v.Name) 
end 
local AllCharacters2 = {} 

for i,v in pairs(ChrModels2:GetChildren()) do 
	C.INSERT(AllCharacters2, v.Name) 
end 	
local AllCharacters3 = {} 

for i,v in pairs(ChrModels3:GetChildren()) do 
	C.INSERT(AllCharacters3, v.Name) 
end 

	
	
	function ChangeCharacter(NewCharacter)
		if not LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool') then return end
		if SavedValues['getState']:getState().mainMenu.Isin == true then return end
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
					--[[if not Part:FindFirstChild('Original') then
						local a = Instance.new('StringValue',Part:FindFirstChildOfClass('Decal'))
						a.Name = 'Original'
						a.Value = Part:FindFirstChildOfClass('Decal').Texture
						--v.MeshId = '0'					
					end		--]]		
					Part:FindFirstChildOfClass("Decal").Texture = NewCharacter.Head:FindFirstChildOfClass("Decal").Texture
				end 
				if (Part.Name == "Head" or Part.Name == "FakeHead") and Part:FindFirstChildOfClass("SpecialMesh") and NewCharacter.Head:FindFirstChildOfClass("SpecialMesh") then 
					if NewCharacter.Head:FindFirstChildOfClass("SpecialMesh").MeshId ~= '' then
						--[[if not Part:FindFirstChild('Original') then
							local a = Instance.new('StringValue',Part:FindFirstChildOfClass('SpecialMesh'))
							a.Name = 'Original'
							a.Value = Part:FindFirstChildOfClass('SpecialMesh').MeshId
							--v.MeshId = '0'					
						end	--]]								
						Part:FindFirstChildOfClass("SpecialMesh").MeshId = NewCharacter.Head:FindFirstChildOfClass("SpecialMesh").MeshId

				   else
						--[[if not Part:FindFirstChild('Original') then
							local a = Instance.new('StringValue',Part:FindFirstChildOfClass('SpecialMesh'))
							a.Name = 'Original'
							a.Value = Part:FindFirstChildOfClass('SpecialMesh').MeshId
							--v.MeshId = '0'					
						end		--]]					   
						Part:FindFirstChildOfClass("SpecialMesh"):Destroy()
						Instance.new('SpecialMesh',Part).Scale = Vector3.new(1.25,1.25,1.25)
				   end
				end
			end
			
			if NewCharacter:FindFirstChildOfClass("Shirt") then 
				local Clone = NewCharacter:FindFirstChildOfClass("Shirt"):Clone() 		
				
				if LocalPlayer.Character:FindFirstChildOfClass("Shirt")	then 
					--[[if Clone:FindFirstChildOfClass("Shirt") and not Clone:FindFirstChildOfClass("Shirt"):FindFirstChild('OriginalTexture') then
						local String = C.INST("StringValue") 
						String.Name = "OriginalTexture" 
						String.Value = LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate 
						String.Parent = Clone
					end--]]
					LocalPlayer.Character:FindFirstChildOfClass("Shirt"):Destroy() 


							
				end 
				Clone.Parent = LocalPlayer.Character 
			else
				LocalPlayer.Character:FindFirstChildOfClass('Shirt').ShirtTemplate = ''
			end

			if NewCharacter:FindFirstChildOfClass("Pants") then 
				local Clone = NewCharacter:FindFirstChildOfClass("Pants"):Clone() 
				if LocalPlayer.Character:FindFirstChildOfClass("Pants") then 
					--[[if Clone:FindFirstChildOfClass("Pants") and not Clone:FindFirstChildOfClass("Pants"):FindFirstChild('OriginalTexture') then
						local String = C.INST("StringValue") 
						String.Name = "OriginalTexture" 
						String.Value = LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate 
						String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Pants") 
					end--]]
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
	
	getgenv().folder1 = Instance.new('Folder',workspace)
	folder1.Name = 'LocalPlayerCharClone'	
	getgenv().oldcharacter = nil
			
	local characters = skins:Sector('characters','Left')
	characters:Element("Toggle", "character changer", nil, function(tbl) 
		if tbl.Toggle then 
			if LocalPlayer.Character then 

				if values.skins.characters.skin.Dropdown == 'Custom characters' then
					ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown])) 
				elseif values.skins.characters.skin.Dropdown == 'Custom characters 2' then
					ChangeCharacter(ChrModels2:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown])) 
				elseif values.skins.characters.skin.Dropdown == 'Custom characters 3' then
					ChangeCharacter(ChrModels3:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]))
				else
					ChangeCharacter(game.Players:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]).Character)
				end
			end 
		elseif LocalPlayer.Character then
			ChangeCharacter(oldcharacter)
		end
	end) 
	--values.skins.characters.skin
	scrolldropchars = {}
	
	scrolldropchars['Custom characters'] = AllCharacters
	scrolldropchars['Custom characters 2'] = AllCharacters2
	scrolldropchars['Custom characters 3'] = AllCharacters3
	local names123 = {}
	for i,v in pairs(Players:GetPlayers()) do
		if v ~= LocalPlayer then
			if v.Character then
				C.INSERT(names123,v.Name)
			end
			v.CharacterAdded:Connect(function()
				if not C.TBLFIND(names123,v.Name) then
					C.INSERT(names123,v.Name)
					values.skins.characters.skin.UpdateValue['Players characters'](names123)
				end
			end)
			v.CharacterRemoving:Connect(function()
				removewithoutdupes(names123,v.Name)
				values.skins.characters.skin.UpdateValue['Players characters'](names123)
			end)
		end
	end
	scrolldropchars['Players characters'] = names123
	
	characters:Element("ScrollDrop", "skin", {options = scrolldropchars, Amount = 9, alphabet = true}, function(tbl) 
		if values.skins.characters["character changer"].Toggle then 
			if LocalPlayer.Character then 
				if tbl.Dropdown == 'Custom characters' then
					ChangeCharacter(ChrModels:FindFirstChild(tbl.Scroll[tbl.Dropdown])) 
				elseif tbl.Dropdown == 'Custom characters 2' then
					ChangeCharacter(ChrModels2:FindFirstChild(tbl.Scroll[tbl.Dropdown])) 
				elseif tbl.Dropdown == 'Custom characters 3' then
					ChangeCharacter(ChrModels3:FindFirstChild(tbl.Scroll[tbl.Dropdown]))
					
				elseif game.Players:FindFirstChild(tbl.Scroll[tbl.Dropdown]) then
					repeat wait() if not game.Players:FindFirstChild(tbl.Scroll[tbl.Dropdown]) then break end until game.Players:FindFirstChild(tbl.Scroll[tbl.Dropdown]).Character ~= nil
					if not game.Players:FindFirstChild(tbl.Scroll[tbl.Dropdown]) then return end
					ChangeCharacter(game.Players:FindFirstChild(tbl.Scroll[tbl.Dropdown]).Character)
				end
			end 
		end 
	end) 
	
	Players.PlayerAdded:Connect(function(plr)
		plr.CharacterAdded:Connect(function()
			insertwithoutdupes(names123,plr.Name)
			values.skins.characters.skin.UpdateValue['Players characters'](names123)
		end)
		plr.CharacterRemoving:Connect(function()
			removewithoutdupes(names123,plr.Name)
			values.skins.characters.skin.UpdateValue['Players characters'](names123)		
		end)
	end)
	Players.PlayerRemoving:Connect(function(plr)
		removewithoutdupes(names123,plr.Name)
		values.skins.characters.skin.UpdateValue['Players characters'](names123)
	end)
	

local trannyenabled = false

local niggers = skins:Sector("trannyware", "Right") 

local a = C.INST("MeshPart",workspace)
a.Size = C.Vec3(1.35,1.4,1.35)
a.CanCollide = false
a.Anchored = true
a.MeshId = "rbxassetid://4249338569"
a.TextureID = "rbxassetid://4249293955"

niggers:Element('Toggle', 'skirt', {}, function(tbl)
	trannyenabled = tbl.Toggle
end)




local chinahatsector = skins:Sector('China hat', 'Right')
chinahatsector:Element('ToggleColor', 'enabled')
chinahatsector:Element('Dropdown', 'animation', {options = {"none", 'default',"scanning", "lava", "pulse"}})
chinahatsector:Element('ToggleColor', 'trails')

--getgenv().cf = -0.4
RunService.RenderStepped:connect(function()
	if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Torso") and trannyenabled then
		a.Position = game.Players.LocalPlayer.Character.Torso.Position - Vector3.new(0,1.3,0)
		a.Rotation = game.Players.LocalPlayer.Character.Torso.Rotation
	end
	a.Transparency = trannyenabled and 0 or 1
	
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('Torso') and values.skins['China hat'].enabled.Toggle and not LocalPlayer.Character:FindFirstChild('PlainMenacingStrawHatAccessory') then 
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
		AccessoryWeld.C0 = C.CF(0, -0.7, 0)
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

	local AllEffects = {'none'}

	for i,v in pairs(Effects:GetChildren()) do
		C.INSERT(AllEffects,v.Name)
	end

local WeaponEffects = skins:Sector('Custom weapon effects','Left')
WeaponEffects:Element('Toggle','enabled',{},function(tbl)
		if LocalPlayer.Character:FindFirstChildOfClass('Tool') and LocalPlayer.Character:FindFirstChildOfClass('Tool'):FindFirstChild('Hitboxes') then
			for i,v in pairs(LocalPlayer.Character:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle'):GetChildren()) do
				if v.Name == 'Effect' then
					v:Destroy()
				end
			end		
			if tbl.Toggle then

				if Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll) then
			
					effect = Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll)
					sex1 = effect:Clone()

					for i,v in pairs(sex1:GetChildren()) do
						if v:IsA('Attachment') then
							v.Position = Vector3.new(0,1.6,0)
						end
						
						v.Parent = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle')
						v.Name = 'Effect'
					end		
				end
			end
			elseif LocalPlayer.Backpack:FindFirstChildOfClass('Tool') and LocalPlayer.Backpack:FindFirstChildOfClass('Tool'):FindFirstChild('Hitboxes') then
					for i,v in pairs(LocalPlayer.Backpack:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle'):GetChildren()) do
						if v.Name == 'Effect' then
							v:Destroy()
						end
					end			
				if tbl.Toggle then
					if Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll) then
				
						effect = Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll)
						sex1 = effect:Clone()

						for i,v in pairs(sex1:GetChildren()) do
							if v:IsA('Attachment') then
								v.Position = Vector3.new(0,1.6,0)
							end
							
							v.Parent = LocalPlayer.Backpack:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle')
							v.Name = 'Effect'
						end				
					end
				end
			end
end)
WeaponEffects:Element('Scroll','effect',{options = AllEffects, Amount = 9},function(tbl)
		if LocalPlayer.Character:FindFirstChildOfClass('Tool') and LocalPlayer.Character:FindFirstChildOfClass('Tool'):FindFirstChild('Hitboxes') then
					for i,v in pairs(LocalPlayer.Character:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle'):GetChildren()) do
						if v.Name == 'Effect' then
							v:Destroy()
						end
					end		
			if values.skins['Custom weapon effects'].enabled.Toggle then
				if Effects:FindFirstChild(tbl.Scroll) then
			
					effect = Effects:FindFirstChild(tbl.Scroll)
					sex1 = effect:Clone()

					for i,v in pairs(sex1:GetChildren()) do
						if v:IsA('Attachment') then
							v.Position = Vector3.new(0,1.6,0)
						end
						
						v.Parent = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle')
						v.Name = 'Effect'
					end		
				end
			end
			elseif LocalPlayer.Backpack:FindFirstChildOfClass('Tool') and LocalPlayer.Backpack:FindFirstChildOfClass('Tool'):FindFirstChild('Hitboxes') then
					for i,v in pairs(LocalPlayer.Backpack:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle'):GetChildren()) do
						if v.Name == 'Effect' then
							v:Destroy()
						end
					end
				if values.skins['Custom weapon effects'].enabled.Toggle then
					if Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll) then
				
						effect = Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll)
						sex1 = effect:Clone()

						for i,v in pairs(sex1:GetChildren()) do
							if v:IsA('Attachment') then
								v.Position = Vector3.new(0,1.6,0)
							end
							
							v.Parent = LocalPlayer.Backpack:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle')
							v.Name = 'Effect'
						end				
					end
				end
			end
end)


local boobs = skins:Sector('boobs','Right')
boobs:Element('ToggleColor','enabled',{},function(tbl)
	if not LocalPlayer.Character:FindFirstChild('boobsModel') then
		local char = game.Players.LocalPlayer.Character
		--char:WaitForChild('UpperTorso')
		local torso = char.Torso	
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
	
	Spawn:Connect(function(char)
		--if values.skins.characters["character changer"].Toggle then 
			--task.wait(.3)
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


			--task.wait(0.3)

			if values.skins.characters["character changer"].Toggle then

				if values.skins.characters.skin.Dropdown == 'Custom characters' then

					ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown])) 
				elseif values.skins.characters.skin.Dropdown == 'Custom characters 2' then
					ChangeCharacter(ChrModels2:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown])) 
				elseif values.skins.characters.skin.Dropdown == 'Custom characters 3' then
					ChangeCharacter(ChrModels3:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]))
										
				elseif game.Players:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]) then
					--print('not')
					repeat wait() if not game.Players:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]) then break end until game.Players:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]).Character ~= nil
					if not game.Players:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]) then return end
					ChangeCharacter(game.Players:FindFirstChild(values.skins.characters.skin.Scroll[values.skins.characters.skin.Dropdown]).Character)
				end
			end
			
		------------------------------------------------------	
			
			
			local torso = char.Torso	
			Instance.new('Model',char).Name = 'boobsModel'
			local part = Instance.new('Part',char.boobsModel)
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
			local weld = Instance.new('Weld',char.boobsModel)
			weld.Part0 = torso
			weld.Part1 = part
			weld.C0 = CFrame.new() + Vector3.new(0.5,0.3,-0.75)

			local part2 = Instance.new('Part',char.boobsModel)
			part2.Name = 'boob2'
			part2.CanCollide = false
			part2.Anchored = false
			part2.Shape = Enum.PartType.Ball
			part2.Position = torso.Position
			part2.Size = Vector3.new(1,1,1)
			part2.Color = Color3.new(1,1,1)
			part2.Material = 'Water'
			part2.Transparency = 1

			local weld = Instance.new('Weld',char.boobsModel)
			weld.Part0 = torso
			weld.Part1 = part2
			weld.C0 = CFrame.new() + Vector3.new(-0.5,0.3,-0.75)			

			if values.skins.boobs.enabled.Toggle then
				part.Transparency = 0
				part2.Transparency = 0
			end
			part.Color = values.skins.boobs.enabled.Color
			part2.Color = values.skins.boobs.enabled.Color
			
			
			
		------------------------------------------------------	
			
			
		if LocalPlayer.Character:FindFirstChildOfClass('Tool') and LocalPlayer.Character:FindFirstChildOfClass('Tool'):FindFirstChild('Hitboxes') then
				for i,v in pairs(game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle'):GetChildren()) do
					if v.Name == 'Effect' then
						v:Destroy()
					end
				end		
			if values.skins['Custom weapon effects'].enabled.Toggle then
				if Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll) then
			
					effect = Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll)
					sex1 = effect:Clone()

					for i,v in pairs(sex1:GetChildren()) do
						if v:IsA('Attachment') then
							v.Position = Vector3.new(0,1.6,0)
						end
						
						v.Parent = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle')
						v.Name = 'Effect'
					end		
				end
			end
			elseif LocalPlayer.Backpack:FindFirstChildOfClass('Tool') and LocalPlayer.Backpack:FindFirstChildOfClass('Tool'):FindFirstChild('Hitboxes') then
					for i,v in pairs(LocalPlayer.Backpack:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle'):GetChildren()) do
						if v.Name == 'Effect' then
							v:Destroy()
						end
					end			
				if values.skins['Custom weapon effects'].enabled.Toggle then
					if Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll) then
				
						effect = Effects:FindFirstChild(values.skins['Custom weapon effects'].effect.Scroll)
						sex1 = effect:Clone()

						for i,v in pairs(sex1:GetChildren()) do
							if v:IsA('Attachment') then
								v.Position = Vector3.new(0,1.6,0)
							end
							
							v.Parent = LocalPlayer.Backpack:FindFirstChildOfClass('Tool').Contents:FindFirstChild('Handle')
							v.Name = 'Effect'
						end				
					end
				end
			end
	
	end)
	
	events.StartFastRespawn:FireServer()
	functions.CompleteFastRespawn:FireServer()
	
end


------------------------old code------------
			--or values.rage.chat['custom tag'].Toggle or values.rage.chat['custom nickname'].Toggle) then
				--[[oldPrefixText = L.PrefixText
				customTag = ""
				if values.rage.chat['custom tag'].Toggle then
					customTagFont = 1
					customTag = ''
					customTag = string.gsub(customTag, '<font color = #01a2ff>', '')
					--print(customtTag)
					
					customTag = customTag..'<font color = '..'\"'..toHex(values.rage.chat['custom tag'].Color)..'\">'
					--print(L.PrefixText)
					
					if values.rage.chat['custom message size'].Toggle then
			customTag = customTag..'<font size = '..'\"'..values.rage.chat.size.Slider..'\">'
						customTagFont += 1
						--print(L.PrefixText)
					end
					if values.rage.chat['custom font'].Toggle then
						customTag = customTag..'<font face = '..'\"'..values.rage.chat['message font'].Dropdown..'\">'
						customTagFont += 1
						--print(L.PrefixText)
					end
					--print(L.PrefixText)
		
					customTag = customTag..'['..values.rage.chat.tag.Text..']'..(string.rep('</font>',customTagFont))
					--print(customtTag)
				end
				if values.rage.chat['custom nickname'].Toggle then
					customNickname = 1	
					--print(L.PrefixText)
					L.PrefixText = customTag..'<font color = '..'\"'..toHex(values.rage.chat['custom nickname'].Color)..'\">'
					
					if values.rage.chat['custom message size'].Toggle then
						L.PrefixText = L.PrefixText..'<font size = '..'\"'..values.rage.chat.size.Slider..'\">'
						customNickname += 1	
					end
					if values.rage.chat['custom font'].Toggle then
						L.PrefixText = L.PrefixText..'<font face = '..'\"'..values.rage.chat['message font'].Dropdown..'\">'
						customNickname += 1	
					end
					L.PrefixText = L.PrefixText..values.rage.chat.nickname.Text..(string.rep('</font>', customNickname))	
					--print(L.PrefixText)			
				else
					L.PrefixText = customTag..L.PrefixText
				end--]]
RunService.Heartbeat:Connect(function()
	if values.misc.misc.utility['Redirect throwable grenades to closest player'].Toggle then
		ClosestC4 = GetClosest(values.misc.misc.utility.Distance.Slider,'Distance',true) or nil
	end
	if values.rage.combat['Kill Aura'].Toggle and values.rage.combat['Visualize target'].Toggle then
					local Weapon
					for i, v in pairs(LocalPlayer.Character:GetChildren()) do
						if v:IsA("Tool") then
							if v:FindFirstChild("Hitboxes") ~= nil then
								Weapon = v
							end
						end
					end	
		if Weapon ~= nil then
			--if values.rage.combat["Custom Kill Aura Distance"].Toggle and Weapon ~= nil then
				--ClosestKillaura = GetClosest(values.rage.combat["Custom Distance"].Slider,values.rage.combat["Priority"].Dropdown) or nil
			--else
				ClosestKillaura = GetClosest(values.rage.combat["Kill Aura Distance"].Slider,values.rage.combat["Priority"].Dropdown) or nil
			--end
		else
			ClosestKillaura = nil
		end
	else
		ClosestKillaura = nil
	end
end)			
				
local oldnamecall; oldnamecall = hookmetamethod(game, "__namecall", function(self, ...)
  local args = {...}
  local Method = getnamecallmethod();
 
  if ((Method == "Kick" or Method == "kick") and self == game.Players.LocalPlayer) or self.Name == 'LogKick' then
	  return;
  end
	
	if not checkcaller() then
		if Method == "FireServer" then
			if self.Name == "GotHitRE" and values.misc.misc.utility["No Utility Damage (expect bombs)"].Toggle then
				return wait(9e9)
			end
			if self.Name == "RagdollRemoteEvent" and (values.misc.misc.player["No Ragdoll"].Toggle ~= nil and values.misc.misc.player["No Ragdoll"].Toggle == true) then
				return wait(9e9)
			end
			if (self.Name == "StartFallDamage" or self.Name == "TakeFallDamage") and values.misc.misc.player["No Fall Damage"].Toggle then
				return wait(9e9)
			end
			if self.Name == "UpdateIsCrouching" and values.misc.misc2.misc["Hide Name"].Toggle then
				return
			end
			if self.Name == "UpdateIsParkouring" and values.misc.misc.player["Walk On Air (Q,E)"].Toggle then
				return
			end
		end
	end
	if self.Name == 'SpawnCharacter' then
		task.spawn(function()
			repeat wait() until LocalPlayer.Character and LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool')
			task.wait(0.3)
			Spawn:Fire(LocalPlayer.Character)
			LocalPlayer.Character.Humanoid.Died:Connect(function()
				Died:Fire()
			end)
		end)
	end
			
	if self.Name == 'ReplicateThrowable' then

		if values.misc.misc.utility['Redirect throwable grenades to closest player'].Toggle then
			--Closest = GetClosest(values.misc.misc.utility.Distance.Slider,'Distance',true) or nil

			if ClosestC4 ~= nil then
				args[2] = C4Closest
			end
			--print(args[2])
		end
		if values.misc.misc.utility['Increase force of grenades'].Toggle then
			args[3] = Vector3.new(math.huge,math.huge,math.huge)
		end
		return oldnamecall(self, unpack(args))
	end
	if self.Name == 'MeleeDamage' and values.misc.misc.player['Prevent parry'].Toggle and (args[2].Parent:FindFirstChild("SemiTransparentShield").Transparency == 0 or args[2].Parent:FindFirstChild("SemiTransparentShield"):FindFirstChildWhichIsA("Sound")) then
		if values.misc.misc.player['Prevent parry type'].Dropdown == 'Skip damage' then
			return
		else
			args[1].Parent = LocalPlayer.Backpack
		end
	end
  return oldnamecall(self, unpack(args))
end)




do
	local radio = other:Sector('Radio','Left')
	radio:Element('TextBox', 'music',{placeholder = 'ID or path',NoLimit = true})
	radio:Element('Dropdown','type',{options = {'Roblox ID','workspace mp3'}})
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
		local dvd = other:Sector('DVD Logo','Right')
		
		local ScreenGui = Instance.new("ScreenGui")
		local ImageLabel = Instance.new("ImageLabel")

		--Properties:

		ScreenGui.Parent = game.CoreGui
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

			--ImageLabel.Position = UDim2.new(0,math.random(10,ImageLabel.Parent.AbsoluteSize.X),0,math.random(10,ImageLabel.Parent.AbsoluteSize.Y))
			
			--print('check')
			
			getgenv().YSpeed = 5
			getgenv().XSpeed = 5
			
			getgenv().changecolor = false
			getgenv().dvdmethod = 'tick'
			RunService.RenderStepped:Connect(function()
				local ScreenSize = ScreenGui.AbsoluteSize
				
				ImageLabel.Position += UDim2.new(0,getgenv().XSpeed,0,getgenv().YSpeed)
				--print(ImageLabel.AbsolutePosition)
				if (ImageLabel.AbsolutePosition.X >= ScreenSize.X or ImageLabel.AbsolutePosition.X <= 0) or ((ImageLabel.AbsolutePosition.X + ImageLabel.AbsoluteSize.X) >= ScreenSize.X or (ImageLabel.AbsolutePosition.X + ImageLabel.AbsoluteSize.X) <= 0) then
					getgenv().XSpeed = getgenv().XSpeed * -1
					--print('X')
					if getgenv().changecolor then
						if dvdmethod == 'tick' then
						ImageLabel.ImageColor3 = Color3.fromHSV(tick() % 1/1,1,1)
						else
						ImageLabel.ImageColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
						end
					end
				end
				if (ImageLabel.AbsolutePosition.Y >= ScreenSize.Y or ImageLabel.AbsolutePosition.Y <= -35) or ((ImageLabel.AbsolutePosition.Y + ImageLabel.AbsoluteSize.Y) >= ScreenSize.Y or (ImageLabel.AbsolutePosition.Y + ImageLabel.AbsoluteSize.Y) <= -35) then
					getgenv().YSpeed = getgenv().YSpeed * -1
					if getgenv().changecolor then
						if getgenv().dvdmethod == 'tick' then
						ImageLabel.ImageColor3 = Color3.fromHSV(tick() % 1/1,1,1)
						else
						ImageLabel.ImageColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))
						end
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
		dvd:Element('Dropdown','Color change method',{options = {'tick','random'}},function(tbl)
			getgenv().dvdmethod = tbl.Dropdown
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
CreateHitElement("Script loaded in "..(math.floor((tick() - BeforeLoad)*100)/100).." seconds!",MainUIColor,5)