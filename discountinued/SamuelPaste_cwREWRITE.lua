if game.CoreGui:FindFirstChild("electric boogalo") then return error('script is already executed or you executed another script')end

local BeforeLoad = tick()


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

local library,Signal = loadstring(game:HttpGet("https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/libraryV2.lua"))()
local blacklistedKeys = { --skidded cuz me lazy
	Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.Escape
}

repeat wait() until game:IsLoaded()


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
local messages = {
	"Lost to SamuelPaste? Who woulda thought",
	"what was that? Can't hear u over my kill sound",
	"he swings! and he misses",
	"SamuelPaste is pasted did you know?",
	"This hack is approved by Y1K",
	"fun fact: this person is using SamuelPaste",
	"oww, thats gonna leave a bruise in the morning",
	"this is a tough workout!",
	"No way you're this bad?",
	"Are you a train? Coz you're getting railed rn",
	"Oops i forgot you were there, oh wait you actually dont exist anyways.",
	"ez ez you got clapped by a low level haha!",
	"🤓: you cant just exploit in here!!111!!111 its illegal!!!!",
	"why are you dying to me bro fr fr",
	"clapped by SamuelPaste user 💀",
	"bro got clapped lol",
	"'🤓: imagine being fatherless'  where are yours then go check 😁😁😁",
	"sorry did my kill aura hit you?",
	"fr fr SamuelPaste on top",
	"wdym touch grass i have one of those on my feet",
	"fortnite 19$ gift card who wants it!!!??",
	--".gg/gswH7FGxyb <-- join for cool scripts (!!! real no fake !!!)",
	"your dad never came back from the milk store for a reason",
	"damn bro did your mother drop you when youre born",
	"Who are you talking to? a kill say bot? 😅",
	"damn bro you really need a therapist 😅😅",
	"🤓: stop hacking!!!! its against the rules!!!",
	"wenomechainsama tumajarbisaun",
	"you should go back to kindergarden bro 😂",
	"im just better than you!!!!!",
	"SamuelPaste better than you smh smh smh 😅",
	'Nya~'
	
}	
		
makefolder('SamuelPaste')
makefolder('SamuelPaste/cw')
if not isfile('SamuelPaste/cw/killsay.txt') then
	writefile('SamuelPaste/cw/killsay.txt','abc')
end
--[[ MENU SETUP ]]--
local main = library:init{
    Name = "SamuelPaste $$$ > SamuelHook",
    SizeX = 600,
    SizeY = 650,
    Theme = "Midnight",
    Extension = "cfg", -- config file extension
    Folder = 'SamuelPaste/cfgs' -- config folder name
}
local main = library
local rage 	  = main:Tab('Rage')
local legit   = main:Tab("Legit")
local misc 	  = main:Tab('Misc')
local visuals = main:Tab('Visuals')
local skins   = main:Tab('Skins')

--[[ FUNCTIONS ]]--
local frm = {}
do
	function frm.GetClosests(distane,addArgs)
		if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then return end
		local tbl = {}
		local magnitudes = {}
		local addArgs = addArgs or {}
		--[[
		onlyDown
		--]]
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

		local TargetDistance = distane or 50
		local Target

		for i, v in ipairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 then
				local TargetHRP = v.Character.HumanoidRootPart
				local mag = (HumanoidRootPart.Position - TargetHRP.Position).magnitude
				if mag < TargetDistance then
					if addArgs['onlyDown'] and not frm.IsDown(v) then continue end
					table.insert(tbl,v)
					magnitudes[v] = mag
				end
			end
		end
		table.sort(tbl,function(a,b)
			return magnitudes[a] < magnitudes[b]
		end)
		return tbl
	end
	function frm.GetClosestsNN(distane,from) --NN means no namecall
		if not LocalPlayer.Character or not LocalPlayer.Character.FindFirstChild(LocalPlayer.Character,'HumanoidRootPart') then return end
		local tbl = {}
		local magnitudes = {}
		
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character.HumanoidRootPart
		
		local from = from or HumanoidRootPart.CFrame.p
		
		local TargetDistance = distane or 50
		local Target

		for i, v in ipairs(Players.GetPlayers(Players)) do
			if v ~= LocalPlayer and v.Character and v.Character.FindFirstChild(v.Character,"HumanoidRootPart") and v.Character.FindFirstChildWhichIsA(v.Character,"Humanoid").Health ~= 0 then
				local TargetHRP = v.Character.HumanoidRootPart
				local mag = (from - TargetHRP.Position).magnitude
				if mag < TargetDistance then
					--if addArgs['onlyDown'] and not IsDown(v) then continue end
					table.insert(tbl,v)
					magnitudes[v] = mag
				end
			end
		end
		table.sort(tbl,function(a,b)
			return magnitudes[a] < magnitudes[b]
		end)
		return tbl
	end
	function frm.GetClosest(...) 
		local Closests = frm.GetClosests(...)
		if not Closests[1] then return nil end
		return Closests[1]
	end --im too lazy and it easiesr for me to modify code
	function frm.getClosestToMouse(distance)
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
	function frm.GetState(plr)
		local plr = plr or LocalPlayer
		return modules['DataHandler'].getSessionDataRoduxStoreForPlayer(plr):getState()
	end	
	function frm.IsAlive(plr)
		local plr = plr or LocalPlayer
		return plr.Character and plr.Character:FindFirstChildWhichIsA('Humanoid') and (plr.Character:FindFirstChildWhichIsA('Tool') or plr.Backpack:FindFirstChildWhichIsA('Tool')) and true or false
	end
	function frm.IsDown(plr)
		local plr = plr or LocalPlayer
		return frm.GetState(plr).down.isDowned
	end
end
--[[ BYPASS ]]--
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
    		v.Remote.Name = v.Name
    	end
    end
	local old_namecall;old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
		local args = {...}
		local method = getnamecallmethod()
		if method:lower() == 'kick' then return wait(9e9) end
		if tostring(self) == 'BAC' then return end
		if tostring(self) == 'ExportClientErrors' then return end
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
	--[[ BYPASS V2 ]]--
	do
		local antiCheat = {
			'AntiCheatHandler',
			'AntiInjectClient',
			'AntiSpeedClient',
			'AntiInfJumpClient',
			'AntiCheatHandlerClient',
			'AntiBodyMoverClient',
		}
		for i,v in pairs(antiCheat) do
			if rawget(AM,v) then
				AM[v]:Destroy()
			end
		end
	end
	for i,v in pairs(AM) do
		modules[i] = require(v)
	end
	for i,v in pairs(getgc(true)) do
		if typeof(v) == 'table' then
			if rawget(v,'removeKillFeedIdx') then
				modules['killfeed'] = v
			end
			if rawget(v,'FireServer') then
				modules['Network'] = v
			end
		end
	end
end

local Spawn = Signal.new()
local Died = Signal.new()
local KillFeed = Signal.new()
local Ranged = Signal.new()
--[[ SIGNALS ]]--
do
	-- KILLFEED --
	local old;old = hookfunction(modules['killfeed'].render,function(a,...)
		pcall(function()
			local props = a.props
			local killfeedItemInfo = props.killfeedItemInfo
			local whoKilled = killfeedItemInfo.characterThatKilled
			local whoDied = killfeedItemInfo.characterThatDied

			KillFeed:Fire(tostring(whoKilled),tostring(whoDied))
		end)
		return old(a,...)
	end)
	-- SPAWN AND DEATH --
	for i,v in pairs(getgc()) do
		if getinfo(v).name == 'onSpawnCharacter' then
			local old;old = hookfunction(v,function(...)
				task.spawn(function()
					repeat wait() until frm.IsAlive()
					LocalPlayer.Character:WaitForChild('Humanoid').Died:Connect(function()
						Died:Fire()
					end)
					Spawn:Fire(LocalPlayer.Character)
				end)
				return old(...) 
			end)
		end
	end
	-- RANGED --
	do
		local ids = {'weapon43','weapon44','utility9','weapon53'}
		local metadata = modules['WeaponMetadata']

		for i,v in pairs(ids) do
			local data = metadata[v]
			local originalValues = {
				maxSpread                 = data.maxSpread                ,
				minSpread 				  = data.minSpread				  ,
				recoilAmount              = data.recoilAmount             ,
				maxTotalBloom             = data.maxTotalBloom            ,
				startShootingAfterCharge  = data.startShootingAfterCharge ,
				gravity                   = data.gravity                  ,
				reloadWalkSpeedMultiplier = data.reloadWalkSpeedMultiplier,
				chargeOnDuration          = data.chargeOnDuration         ,
				chargeOffDuration		  = data.chargeOffDuration		  ,
				maxDistance 			  = data.maxDistance			  ,
			}
			local spoofedValues = {
				maxSpread                 = 0            ,
				minSpread                 = 0            ,
			    recoilAmount              = 0            ,
			    maxTotalBloom             = 0            ,
			    startShootingAfterCharge  = true         ,
			    gravity                   = Vector3.new(),
			    reloadWalkSpeedMultiplier = 1            ,
			    chargeOnDuration          = nil          ,
				chargeOffDuration		  = nil          ,
				maxDistance				  = 999999       ,
			}
			Ranged:Connect(function(index,toggle,newval)
				local newval = newval or spoofedValues[index]
				data[index] = toggle and newval or originalValues[index]
			end)
		end
	end
end

--[[ RAGE ]]--
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
			'Distance',
			'Health',
		},
		Default = 'Distance',
		Flag = 'KillauraPriority'
	}
	
	kaura:Slider{
		Name = 'Distance',
		Min = 1,
		Max = 13,
		Default = 13,
		Flag = 'KillauraDistance'
	}
	kaura:Dropdown{
		Name = 'Kill Downed Players',
		Content = {
			'Regular',
			'Finish'
		},
		Default = 'Regular',
		Flag = 'KillauraFinish'
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
		Flag = 'KillauraBehindDistance',
	}
	----------------------------------------------------------------------------
	do
		local executing = false

		local KillLoop = function()
			if executing == true then return end
			if not library.flags['KillauraEnabled'] then return end
			Weapon = nil
			local Closest = frm.GetClosests(library.flags['KillauraDistance'])
			
			if Closest ~= nil and #Closest ~= 0 then
				if library.flags['KillauraPriority'] == 'Health' then
					table.sort(Closest,function(a,b)
						return a.Character.Humanoid.Health < b.Character.Humanoid.Health
					end)
				end
				executing = true
				pcall(function()
					Weapon = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
					if Weapon and Weapon:FindFirstChild('Hitboxes') then								
						for i=1,3 do
							local args1 = {
								[1] = Weapon,
								[2] = i
							}		
							events.MeleeSwing:FireServer(unpack(args1))
							wait(.1)
							for i,v in pairs(Closest) do
								if Weapon.Parent ~= LocalPlayer.Character then break end
								if not v.Character:FindFirstChild('Torso') then continue end
								if (frm.IsDown(v) and library.flags['KillauraFinish'] ~= 'Regular') then continue end
								local args = {
									[1] = Weapon,
									[2] = v.Character.Torso,
									[3] = Weapon.Hitboxes.Hitbox,
									[4] = v.Character.Torso.Position,
									[5] = v.Character.Torso.CFrame:ToObjectSpace(
										CFrame.new(v.Character.Torso.Position)
									),
									[6] = v.Character.Torso.Position,
								} 
								if frm.GetState(v).parry.isParrying == false then
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
		end
		local executing2 = false
		local FinishLoop = function()
			if executing2 == true then return end
			if not library.flags['KillauraEnabled'] then return end
			if not library.flags['KillauraFinish'] == 'Finish' then return end
			local Closest = frm.GetClosest(library.flags['KillauraDistance'],{onlyDown = true})
			if Closest ~= nil then
				executing2 = true
				pcall(function()
					local Weapon = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
					if Weapon and Weapon:FindFirstChild('Hitboxes') then
						events.StartMeleeFinish:FireServer(Closest.Character,Weapon)
						task.wait(.1)

						events.MeleeFinishSlash:FireServer(Weapon,1)
						task.wait(.1)

						local args = {
							[1] = Weapon,
							[2] = Closest.Character.Head,
							[3] = Weapon.Hitboxes.Hitbox,
							[4] = Closest.Character.Head.Position,
							[5] = CFrame.new(-0.9444122314453125, -0.4338388442993164, -0.5000076293945312) * CFrame.Angles(-0.8700763583183289, 0.338703989982605, 0.4835035502910614),
							[6] = Vector3.new(0.5450236797332764, 0.5771650075912476, -0.6081362962722778),
							[7] = 1,
							[8] = Vector3.new(-0.15132836997509003, -0.9456773996353149, 0.28773969411849976)
						}

						events.MeleeFinish:FireServer(unpack(args))
										
					end
				end)
				executing2 = false
			end
		end
		
		RunService.Stepped:Connect(KillLoop)
		RunService.Stepped:Connect(FinishLoop)
		RunService.Stepped:Connect(function()
			if frm.IsAlive(LocalPlayer) and library.flags['KillauraBehind'] and library.flags['KillauraEnabled'] then
				local Closest = frm.GetClosest(library.flags['KillauraDistance'])
				if not Closest then return end
				local Weapon = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
				if Weapon and Weapon:FindFirstChild('Hitboxes') then
					local LastPos = Closest.Character.HumanoidRootPart.CFrame
					LocalPlayer.Character.HumanoidRootPart.CFrame = LastPos + LastPos.LookVector*-library.flags['KillauraBehindDistance']
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.CFrame.Position,Vector3.new(LastPos.X,LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y,LastPos.Z))
				end
			end
		end)
	end
	----------------------------------------------------------------------------
	--[[ RANGED MODS ]]--
	local rm = rage:Section{Name='Ranged',Side='Right'}
	rm:Toggle{
		Name = 'Instant Charge',
		Callback = function(toggle)
			Ranged:Fire('chargeOnDuration',toggle)
			Ranged:Fire('chargeOffDuration',toggle)
			Ranged:Fire('startShootingAfterCharge',toggle)
		end
	}
	rm:Toggle{
		Name = 'No Spread',
		Callback = function(toggle)
			Ranged:Fire('maxSpread',toggle)
			Ranged:Fire('minSpread',toggle)
		end
	}	
	rm:Toggle{
		Name = 'No Dropoff',
		Callback = function(toggle)
			Ranged:Fire('gravity',toggle)
		end
	}
	rm:Toggle{
		Name = 'No Recoil',
		Callback = function(toggle)
			Ranged:Fire('recoilAmount',toggle)
			Ranged:Fire('maxTotalBloom',toggle)
		end
	}
	rm:Toggle{
		Name = 'No Slowdown',
		Callback = function(toggle)
			Ranged:Fire('reloadWalkSpeedMultiplier',toggle)
		end
	}
	rm:Toggle{
		Name = 'No Reload Cancel',
		Flag = 'NRC'
	}
	rm:Toggle{
		Name = 'No Charge Cancel',
		Flag = 'NCC'
	}	
	rm:Toggle{
		Name = 'Infinite Range',
		Callback = function(toggle)
			Ranged:Fire('maxDistance',toggle)
		end
	}
	rm:Toggle{
		Name = 'Wallbang (breaks parkour)',
		Callback = function(toggle)
			if toggle then
				game.CollectionService:AddTag(workspace.Map,'RANGED_CASTER_IGNORE_LIST')	
				game.CollectionService:AddTag(workspace.Terrain,'RANGED_CASTER_IGNORE_LIST')				
			else
				game.CollectionService:RemoveTag(workspace.Map,'RANGED_CASTER_IGNORE_LIST')	
				game.CollectionService:RemoveTag(workspace.Terrain,'RANGED_CASTER_IGNORE_LIST')				
			end
		end
	}	
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
		--Default = Color3.fromRGB(255,255,255),
		DefaultAlpha = 1,
		Flag = 'RageFOVDrawColor'
	}
	
	sa:Toggle{
		Name = 'Filled FOV',
		Flag = 'RageFOVDrawFilled'
	}	
	
	sa:Slider{
		Name = 'FOV Thickness',
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

			Fov.Transparency = 1-library.flags['RageFOVDrawColor'].Transparency
			
			Fov.Color =  library.flags['RageFOVDrawColor'].Color
			Fov.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
			Fov.Radius = library.flags['RageFOV']
			Fov.Thickness = library.flags['RageFOVDrawThickness']
			Fov.Filled = library.flags['RageFOVDrawFilled']
		end)
	end)
	--sa:ToggleTrans', 'Highlight target')	

end

--[[ LEGIT (REAL😱)]]--
do
	--[[ FALL DAMAGE MODIFIER ]]--
	local modify = legit:Section{Name='Fall Damage Modifier',Side='Right'}
	modify:Toggle{
		Name = 'Less Fall Damage',
		Flag = 'LegitFallDamage'
	}
	modify:Slider{
		Name = 'Percentage Removed',
		Min = 1,
		Max = 100,
		Default = 50,
		Flag = 'LegitFallDamageSlider'
	}
	modify:Toggle{
		Name = 'Never Fatal',
		Flag = 'LegitFallDamageFatal'
	}
	--[[ RANGED MODS MODIFIER ]]--
	local mods = legit:Section{Name='Ranged Mods',Side = 'Left'}
	mods:Toggle{
		Name = 'Drop Off Modifier',
		Flag = 'LegitRangedDropOff',
		Callback = function(val)
			Ranged:Fire('gravity',val,Vector3.new(0,-(library.flags['LegitRangedDropOffVal'] or 0),0)) -- library calls callback for no fucking reason so i need "or 0"
		end
	}
	mods:Slider{
		Name = 'Gravity Studs',
		Min = -10,
		Max = 0,
		Flag = 'LegitRangedDropOffVal',
		Callback = function(val)
			Ranged:Fire('gravity',library.flags['LegitRangedDropOff'],Vector3.new(0,-val,0))
		end
	}
	
	mods:Toggle{
		Name = 'Spread Modifier',
		Flag = 'LegitRangedSpread',
		Callback = function(val)
			Ranged:Fire('maxSpread',val,library.flags['LegitRangedSpreadVal'])
			Ranged:Fire('minSpread',val,library.flags['LegitRangedSpreadVal'])
		end
	}
	mods:Slider{
		Name = 'Modifier Value',
		Min = 0,
		Max = 0.35,
		Float = 0.05,
		Flag = 'LegitRangedSpreadVal',
		Callback = function(val)
			Ranged:Fire('maxSpread',library.flags['LegitRangedSpread'],val)
			Ranged:Fire('minSpread',library.flags['LegitRangedSpread'],val)
		end
	}
	
	mods:Toggle{
		Name = 'Recoil Modifier',
		Flag = 'LegitRangedRecoil',
		Callback = function(val)
			Ranged:Fire('recoilAmount',val,library.flags['LegitRangedRecoilVal'])
		end
	}
	mods:Slider{
		Name = 'Modifier Value',
		Min = 0,
		Max = 35,
		Flag = 'LegitRangedRecoilVal',
		Callback = function(val)
			Ranged:Fire('recoilAmount',library.flags['LegitRangedRecoil'],val)
		end
	}	

	mods:Toggle{
		Name = 'Charge Time Modifier',
		Flag = 'LegitRangedCharge',
		Callback = function(val)
			Ranged:Fire('chargeOnDuration',val,library.flags['LegitRangedChargeVal'])
		end
	}
	mods:Slider{
		Name = 'Modifier Value',
		Min = 0,
		Max = 0.45,
		Float = 0.05,
		Flag = 'LegitRangedChargeVal',
		Callback = function(val)
			Ranged:Fire('chargeOnDuration',library.flags['LegitRangedCharge'],val)
		end
	}		
	
	mods:Toggle{
		Name = 'No Reload Cancel',
		Flag = 'LegitNRC'
	}
	mods:Toggle{
		Name = 'No Charge Cancel',
		Flag = 'LegitNCC'
	}	
	--[[ NETWORK MANIPULATION ]]--
	local oldFireServer = modules['Network'].FireServer
	modules['Network'].FireServer = function(self,name,...)
		local args = {...}
		
		if name == 'TakeFallDamage' and library.flags['LegitFallDamage'] then
			local modifier = library.flags['LegitFallDamageSlider']
			args[1] -= args[1] / 100 * modifier
			local health = LocalPlayer.Character.Humanoid.Health
			if health-args[1] >= 1 and library.flags['LegitFallDamageFatal'] then
				if health >= 16 then
					args[1] = health-10
				else
					args[1] = 2
				end
			end
		end
		return oldFireServer(self,name,unpack(args))
	end
end

--[[ SILENT AIM HANDLER ]]--
task.spawn(function()

	local old=modules['RangedWeaponHandler'].calculateFireDirection
	local closest
	modules['RangedWeaponHandler'].calculateFireDirection=function(...)
		if not library.flags['RageSilentAim'] then return old(...) end
		closest = frm.getClosestToMouse(library.flags['RageFOV'])
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
		local method = getnamecallmethod()
		local args = {...} 
		if method == 'Raycast' and library.flags['RageSilentAim'] then
			local a = getinfo(3)
			if a and a.name == 'SimulateCast' then
				local closests = frm.GetClosestsNN(20,args[1])
				if closests[1] then
					args[2] = (closests[1].Character.Head.Position-args[1]).Unit * 100
				end
			end
		end
		return oldNamecall(self,unpack(args))
	end)	
end)
--[[ RANGED MODS FOR LEGIT AND RAGE ]]--
do
	local rwc = modules['RangedWeaponClient']
	local old = rwc.cancelReload
	rwc.cancelReload = function(...)
		return (library.flags['NRC'] or library.flags['LegitNRC']) and '' or old(...)
	end
	local old2 = rwc.cancelCharge
	rwc.cancelCharge = function(...)
		return (library.flags['NCC'] or library.flags['LegitNCC']) and 0 or old2(...)
	end	
end
--[[ MISC ]]--
do
	--[[ CHARACTER EXPLOITS ]]--
	local misc2 = misc:Section{Name='Character Exploits',Side='Right'} -- skidded sort from pjhook prem
	misc2:Toggle{
		Name = 'No Jump Cooldown',
		Callback = function(toggle)
			modules['JumpConstants'].JUMP_DELAY_ADD = toggle and 0 or 1
		end
	}
	misc2:Toggle{
		Name = 'No Dash Cooldown',
		Callback = function(toggle)
			modules['DashConstants'].DASH_COOLDOWN = toggle and 0 or 3
		end
	}
	misc2:Toggle{
		Name = 'No Fall Damage',
		Callback = function(toggle)
			frm.GetState(LocalPlayer).fallDamageClient.isDisabled = toggle
		end
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
		Name = 'Jump Whenever',
		Flag = 'InfJump2'
	}
	misc2:Toggle{
		Name = 'Fly',
		Flag = 'Fly',
		Callback = function(toggle)
			if LocalPlayer.Character then
				frm.GetState(LocalPlayer).fly.isFlying = toggle
				if toggle then
					getupvalue(modules['FlyHandlerClient']._startModule,2)(LocalPlayer.Character)
				elseif LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('LinearVelocity') then
					LocalPlayer.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('LinearVelocity'):Destroy()
				end
			end			
		end
	}:Keybind{
		Blacklist = blacklistedKeys,
		Mode = 'Toggle',
	}

	misc2:Toggle{
		Name = 'No Clip',
		Flag = 'Noclip'
	}:Keybind{
		Blacklist = blacklistedKeys,
		Mode = 'Toggle',
	}
	--[[ CHARACTER MOVEMENT ]]-- 
	local charMov = misc:Section{Name = 'Character Movement',Side = 'Left'}
	charMov:Toggle{
		Name = 'Walk Speed',
		Flag = 'WalkSpeed',
		Callback = function(tog)
			if not tog and frm.IsAlive() then
				LocalPlayer.Character.Humanoid.WalkSpeed = 16
			end
		end		
	}
	charMov:Slider{
		Name = 'Speed',
		Min = 5,
		Max = 75,
		Default = 16,
		Flag = 'Speed'
	}
	charMov:Toggle{
		Name = 'Jump Power',
		Flag = 'JumpPower',
		Callback = function(tog)
			if not tog and frm.IsAlive() then
				LocalPlayer.Character.Humanoid.JumpPower = 50
			end
		end
	}
	charMov:Slider{
		Name = 'Power',
		Min = 5,
		Max = 150,
		Default = 50,
		Flag = 'Power'
	}

	--[[ ANTI ]]--
	local anti = misc:Section{Name = 'Anti',Side = 'Left'}
	anti:Toggle{
		Name = 'Ragdoll',
		Flag = 'NoRagdoll'
	}
	
	local auto = misc:Section{Name = 'Automatic',Side = 'Left'}
	auto:Toggle{
		Name = 'Equip Weapon',
		Flag = 'AutoTool'
	}
	--[[ VISUAL EXPLOITS ]]--
	local vexploits = misc:Section{Name = 'Visual Exploits',Side = 'Right'}
	
	vexploits:Toggle{
		Name = 'Hide Overhead Name',
		Flag = 'NoName',
		Callback = function(tog)
			if not tog then
				game:GetService("ReplicatedStorage").Communication.Events.UpdateIsCrouching:FireServer(false)			
			end
		end
	}
	--[[ CHAT RELATED ]]--
	local chat = misc:Section{Name = 'Chat Related',Side = 'Left'}
	chat:Toggle{
		Name = 'Kill Say',
		Flag = 'ChatKillSay'
	}
	chat:Toggle{
		Name = 'Use Custom Kill Say',
		Flag = 'ChatKillSayFile'
	}
	
	
	--[[ EXPLOITS WITHOUT HOOK ]]--
	
	-- INF JUMP --
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
	-- EVERYTHING THAT NEEDS LOOP FOR --
	RunService.Stepped:Connect(function()
		if frm.IsAlive(LocalPlayer) then
			if library.flags['Noclip'] then
				for i,v in pairs(LocalPlayer.Character:GetChildren()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
			if library.flags['WalkSpeed'] then
				LocalPlayer.Character.Humanoid.WalkSpeed = library.flags['Speed']
			end		
			if library.flags['JumpPower'] then
				LocalPlayer.Character.Humanoid.JumpPower = library.flags['Power']
			end	
			if library.flags['AutoTool'] then
				local Weapon = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
				if not Weapon then
					for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
						if not v:IsA("Tool") then continue end --just in case
						if v:FindFirstChild('Hitboxes') then
							v.Parent = LocalPlayer.Character
							break
						end
					end
				end
			end
			if library.flags['NoName'] then
				game:GetService("ReplicatedStorage").Communication.Events.UpdateIsCrouching:FireServer(true)	
			end
		end
	end)
	--[[ SIGNALS RELATED ]]--
	
	-- KILL SAY --	
	KillFeed:Connect(function(whoKilled,whoDied)
		if whoKilled == LocalPlayer.Name and whoDied ~= LocalPlayer.Name and library.flags['ChatKillSay'] then
			local output = messages[math.random(1,#messages)]
			if library.flags['ChatKillSayFile'] then
				local compiled = readfile('SamuelPaste/cw/killsay.txt'):split('\n')
				output = compiled[math.random(1,#compiled)]
			end
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(output)
		end
	end)
	--[[ HOOKS ]]--
	
	-- STAMINA --
	do
		local old = modules['Stamina'].getRealNewStaminaValue
		modules['Stamina'].getRealNewStaminaValue = function(...)
			return library.flags['InfStamina'] and 150 or old(...)
		end
	end
	
	-- JUMP WHENEVER --
	do
		local old = modules['JumpHandlerClient'].getCanJump
		modules['JumpHandlerClient'].getCanJump = function(...)
			return library.flags['InfJump2'] and true or old(...)
		end
	end
	
	-- NO RAGDOLL --
	do
		local old = modules['RagdollHandlerClient'].toggleRagdoll
		modules['RagdollHandlerClient'].toggleRagdoll = function(...)
			if library.flags['NoRagdoll'] then
				return
			end
			return old(...)
		end
	end
		
end
--[[ VISUALS ]]--
do
	
end
--[[ SKINS ]]--
do
	--[[ CHARACTER CHANGER ]]--
	local cacheModels = game:GetObjects("rbxassetid://12258574579")[1]
	repeat wait() until cacheModels ~= nil
	local R6Models = cacheModels:FindFirstChild('R6')
	
	local ChrModels  = R6Models:FindFirstChild('r6')
	local ChrModels2 = R6Models:FindFirstChild('r6 2')
	local ChrModels3 = R6Models:FindFirstChild('r6 3')

	local ChinaHat   = game:GetObjects('rbxassetid://11377527413')[1]
	local Effects    = game:GetObjects('rbxassetid://11377514627')[1]
	repeat wait() until ChinaHat ~= nil
	repeat wait() until Effects ~= nil	
	
	
end

library:LoadSettingsTab()