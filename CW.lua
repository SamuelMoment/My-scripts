local BeforeLoad = tick()

local UserInputService = game:GetService("UserInputService")
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local ReplicatedStorage = game.ReplicatedStorage
local RunService = game.RunService
local Lighting = game.Lighting

--[[ BYPASS ]]--
do
    local anticheats = {
        'AntiBodyMoverClient',
        'AntiFlyClient',
        'AntiInfJumpClient',
        'AntiInjectClient',
        'AntiSpeedClient',
        'SanityChecksClient',
        'AntiCheatHandlerClient',
        'AntiCheatHandler',
        'LightingUtil'
    }
    local reg = getreg()
    for i=1,#reg do -- anti sanity checks
        local thread = reg[i]
        if not (type(thread) == 'thread') then continue end
        
        local source = debug.info(thread,1,'s')
        if source then
            for i,v in pairs(anticheats) do
                if source:sub(-v:len(),-1) == v then
                    task.cancel(thread)
                end
            end
        end
    end
    for i,connection in pairs(getconnections(LocalPlayer.CharacterAdded)) do
        pcall(function()
            local src = debug.getinfo(connection.Function,'s').source
            if src:sub(-22,-1) == 'AntiCheatHandlerClient' then
                connection:Disable()
            end
        end)
    end
    if LocalPlayer.Character then -- additional bypass i need
        for i,connection in pairs(getconnections(LocalPlayer.CharacterRemoving)) do
            pcall(function()
                local src = debug.getinfo(connection.Function,'s').source
                if src:sub(-22,-1) == 'AntiCheatHandlerClient' then
                    local maid = getupvalue(connection.Function,1)
                    for i,v in pairs(maid._tasks) do
                        if typeof(v) == 'table' then
                            v:Destroy()
                        end
                    end
                end
            end)
        end
    end
    
end

local library,Signal = loadstring(game:HttpGet('https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/libraryV2.lua'))()
makefolder('SpaceWare')
library:init{Name = 'SpaceWare',Folder = 'SpaceWare/CombatWarriors'}

local Modules = {Name = {},Id = {}}
local Reducers = {}

local Nevermore = require(ReplicatedStorage.Framework.Nevermore)
local NevermoreModules = rawget(Nevermore, '_lookupTable') --credits to snnwer for that
for i,v in pairs(NevermoreModules) do
    if i:sub(-7,-1) == 'Reducer' or i:sub(-13,-1) == 'ReducerClient'  or i:sub(-17,-1) == 'ReducerInfoClient' then
        table.insert(Reducers,getupvalue(require(v).reducer,2))
        continue
    end
    Modules.Name[i] = require(v)
    Modules.Id[v] = i
end
local Remotes = getupvalue(getfenv(getupvalue(rawget(getrawmetatable(Modules.Name['Network']),'__index'),1).FireServer).GetEventHandler,1)

local WeaponMetadata = Modules.Name['WeaponMetadata']
local UtilityMetadata = Modules.Name['UtilityMetadata']

local UtilityIds = {}
local WeaponIds = {}
local RemotesConnections = {}
local RemotesConnectionsNames = {}
for i,v in pairs(Remotes) do
    if not v.Remote then continue end
    RemotesConnections[v.Remote] = {}
    RemotesConnectionsNames[i] = {}
end
local oldNamecall;oldNamecall = hookmetamethod(game, '__namecall', function(self,...)
    local args = {...}
    if RemotesConnections[self] then
        for i,v in pairs(RemotesConnections[self]) do
            v(args)
        end
    end
    if RemotesConnectionsNames[tostring(self)] then
        for i,v in pairs(RemotesConnectionsNames[tostring(self)]) do
            v(args)
        end
    end
    return oldNamecall(self,unpack(args))
end)
library.OnUnload:Connect(function()
    table.clear(RemotesConnectionsNames)
    table.clear(RemotesConnections)
    hookmetamethod(game,'__namecall',oldNamecall)
end)
for i,v in pairs(Modules.Name['UtilityIds']) do
    UtilityIds[i:lower()] = v
end
for i,v in pairs(Modules.Name['WeaponIds']) do
    WeaponIds[i:lower()] = v
end
local Framework = {
    GetClosests = function(self,distance)
        if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')) then return end

        local closests = {}
        local magnitudes = {}

        local hrp = LocalPlayer.Character.HumanoidRootPart
        for i,plr in pairs(Players:GetPlayers()) do
            if plr == LocalPlayer then continue end
            if not (plr.Character and plr.Character:FindFirstChild('HumanoidRootPart')) then continue end

            local mag = (hrp.Position-plr.Character.HumanoidRootPart.Position).Magnitude
            if mag <= distance then
                table.insert(closests,plr)
                magnitudes[plr] = mag
            end
        end
        table.sort(closests,function(a,b)
            return magnitudes[a] < magnitudes[b]
        end)
        return closests
    end,
    GetClosest = function(self,distance)
        local closests = self:GetClosests(distance)
        if not closests then return end

        return closests[1]
    end,
    GetClosestNoNamecall = function(self,distance,from)
        if not (LocalPlayer.Character and LocalPlayer.Character.FindFirstChild(LocalPlayer.Character,'HumanoidRootPart')) then return end

        local closest,distance = nil,distance or 99

        for i,plr in pairs(Players.GetPlayers(Players)) do
            if plr == LocalPlayer then continue end
            if not (plr.Character and plr.Character.FindFirstChild(plr.Character,'HumanoidRootPart')) then continue end

            local mag = (from-plr.Character.HumanoidRootPart.Position).Magnitude
            if mag <= distance then
                distance = mag
                closest = plr
            end
        end
        return closest
    end,
    GetClosestToMouse = function(self,fov,visiblecheck) --Camera:WorldToScreenPoint(HumanoidRootPart.Position)
        local from = Vector2.new(Mouse.X,Mouse.Y+36)
        local distance,closest = fov,nil

        for i,v in pairs(Players:GetPlayers()) do
            if v == LocalPlayer then continue end
            if self:IsAlive(v) then
                local hrp = v.Character.HumanoidRootPart
                local screenPos,visible = Camera:WorldToViewportPoint(hrp.Position)

                local i,p = self:Raycast(LocalPlayer.Character.HumanoidRootPart.Position,hrp.Position)
                if not i ~= hrp and visiblecheck then continue end
                local mag = (Vector2.new(screenPos.X,screenPos.Y)-from).Magnitude
                if mag <= distance then
                    distance = mag
                    closest = v
                end
            end
        end
        return closest
    end,
    GetModule = function(self,module)
        return Modules.Name[module] or Modules.Id[module]
    end,
    GetReducerOf = function(self,type)
        for i,tbl in pairs(Reducers) do
            if tbl[type] then
                return tbl
            end
        end
        return nil
    end,
    GetState = function(self,plr)
        local plr = plr or LocalPlayer
        return self:GetModule('DataHandler').getSessionDataRoduxStoreForPlayer(plr):getState()
    end,
    GetDistance = function(self,plr,plr2)
        local part = plr.Character:FindFirstChild('HumanoidRootPart') or plr.Character:FindFirstChild('Torso')
        local part2 =plr2.Character:FindFirstChild('HumanoidRootPart') or plr2.Character:FindFirstChild('Torso')
        if not (part or part2) then
            return 99999
        end
        return (part.Position-part2.Position).Magnitude
    end,
    IsAlive = function(self,plr)
        local plr = plr or LocalPlayer

        return (plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and plr.Character:FindFirstChild('Head') and (plr.Character:FindFirstChildWhichIsA('Tool') or plr.Backpack:FindFirstChildWhichIsA('Tool')))
    end,
    IsDown = function(self,plr)
        local plr = plr or LocalPlayer

        return self:GetState(plr).down.isDowned or (plr.Character and plr.Character:FindFirstChildWhichIsA('Humanoid') and plr.Character.Humanoid.Health <= 15)
    end,
    GetMelee = function(self,useBackpack)
        if self:IsAlive() then
            local tool = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
            if useBackpack and not tool then
                for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:FindFirstChild('Hitboxes') then
                        return v
                    end
                end
            end
            if tool and tool:FindFirstChild('Hitboxes') then
                return tool
            end
        end
        return nil
    end,
    GetRanged = function(self,useBackpack)
        if self:IsAlive() then
            local tool = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
            if useBackpack and not tool then
                for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:FindFirstChild('ClientAmmo') then
                        return v
                    end
                end
            end
            if tool and tool:FindFirstChild('ClientAmmo') then
                return tool
            end
        end
        return nil
    end,
    GetRemoteHandler = function(self,name)
        return Remotes[name]
    end,
    GetRemote = function(self,name)
        return Remotes[name].Remote
    end,
    GetCallbacks = function(self,remote)
        local callbacks = {}
        local remote = self:GetRemoteHandler(remote)
        if not remote then return error(tostring(remote)..'doesnt exist!') end

        for i,func in pairs(remote.Callbacks) do
            table.insert(callbacks,getupvalue(func,5))
        end
        return callbacks
    end,
    FireServer = function(self,name,...)
        local remote = Remotes[name]
        if remote then
            remote.Remote:FireServer(...)
        end
    end,
    InvokeServer = function(self,...)
        return self:FireServer(...)
    end,
    GetWeaponData = function(self,name)
        if typeof(name) == 'Instance' and name:GetAttribute('ItemId') then
            return WeaponMetadata[name:GetAttribute('ItemId')]
        end
        local id = WeaponIds[name:lower():gsub(' ','')]
        if not id then return end
        return WeaponMetadata[id]
    end,
    GetUtilityData = function(self,name)
        if typeof(name) == 'Instance' and name:GetAttribute('ItemId') then
            return UtilityMetadata[name:GetAttribute('ItemId')]
        end
        local id = UtilityIds[name:lower():gsub(' ','')]
        if not id then return end
        return UtilityMetadata[id]
    end,
    GetMeleeFuncs = function(self)
        local tool = self:GetMelee()
        if not tool then return end

        for i,v in pairs(getconnections(tool.Equipped)) do
            if v.Function then
                local uv = getupvalues(v.Function)
                if #uv == 1 and uv[1].singleWeaponMetadata then
                    return uv[1]
                end
            end
        end
    end,
    GetRangedFuncs = function(self)
        local tool = self:GetRanged()
        if not tool then return end

        for i,v in pairs(getconnections(tool.Equipped)) do
            if v.Function then
                local uv = getupvalues(v.Function)
                if #uv == 1 and uv[1].singleWeaponMetadata then
                    return uv[1]
                end
            end
        end
    end,
    OnRemote = function(self,remote,func)
        local func = func or function() end
        local remote = self:GetRemoteHandler(remote)
        table.insert(RemotesConnections[remote.Remote],func)
    end,
    OnRemoteName = function(self,remoteName,func)
        local func = func or function() end
        if not RemotesConnectionsNames[remoteName] then
            RemotesConnectionsNames[remoteName] = {}
        end
        table.insert(RemotesConnectionsNames[remoteName],func)
    end,
    AddCallback = function(self,remote,func)
        local handler = self:GetRemoteHandler(remote)
        table.insert(handler.Callbacks,func)
    end,
    Raycast = function(self,from,to)
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.RespectCanCollide = true
        params.IgnoreWater = true
        params.FilterDescendantsInstances = game.CollectionService:GetTagged('RANGED_CASTER_IGNORE_LIST')	
        local result = workspace:Raycast(from,(to-from).Unit*9999,params)
        return result.Instance,result.Position
    end,
}
local Tabs = {
    Rage = library:Tab('Rage'),
    Legit = library:Tab('Legit'),
    Visuals = library:Tab('Visuals'),
    Esp = library:Tab('Esp'),
    Misc = library:Tab('Misc')
}

local Spawn = Signal.new()
local Died = Signal.new()
local ModifyRanged = Signal.new() -- no need for that but who gives a shit
do -- signals set up
    
    local func = Framework:GetCallbacks('SpawnCharacter')[1]
    local old;old = replaceclosure(func, function(...)
        local returns = {old(...)}    
        Spawn:Fire(LocalPlayer.Character)
        return unpack(returns)
    end)
    LocalPlayer.CharacterAdded:Connect(function(character)
        character:WaitForChild('Humanoid').Died:Connect(function()
            Died:Fire()
        end)
    end)
    if LocalPlayer.Character then
        LocalPlayer.Character:WaitForChild('Humanoid').Died:Connect(function()
            Died:Fire()
        end)
    end
    local ranged = {
        'specRpg',
        'rpg',
        'tommygun',
        'specTommyGun',
        'airdropRPG',
        'longbow',
        'heavybow',
        'crossbow',
        'throwableKunai'
    }
    local HookValues = { -- skidded from v2 rewrite
        maxSpread                 = 0,
        minSpread                 = 0,
        recoilAmount              = 0,
        maxTotalBloom             = 0,
        startShootingAfterCharge  = true,
        gravity                   = Vector3.new(),
        reloadWalkSpeedMultiplier = 1,
        chargeOnDuration          = nil,
        chargeOffDuration		  = nil,
        maxDistance				  = 999999,
    }
    for _,id in pairs(ranged) do
        local data = Framework:GetWeaponData(id) or Framework:GetUtilityData(id)
        if not data then error('no data for '..id) continue end

        local original = table.clone(data)
        ModifyRanged:Connect(function(id,boolean,newvalue)
            newvalue = newvalue or HookValues[id]
            if boolean then
                data[id] = newvalue
            else
                data[id] = original[id]
            end
        end)
    end
end

local function BetterHookFunction(func,newfunc) -- prevents upvalues shit
    return hookfunction(func,function(...)
        return newfunc(...)
    end)
end
local function BetterHookFunction2(tab,indx,newfunc) -- in case function has **NO** upvalues at all (cancelCharge)
    local old = tab[indx]
    tab[indx] = newfunc
    return old
end

do -- RAGE --
    local kaSection = Tabs.Rage:Section{Name = 'Killaura',Side = 'Left'}
    kaSection:Toggle{Name = 'Enabled',Flag = 'RageKillaura'}
    kaSection:Slider{Name = 'Distance',Flag = 'RageKillauraDistance',min = 0,max = 15}
    kaSection:Dropdown{Name = 'Priority',Flag = 'RageKillauraPriority',Options = {'Distance','Health'},Min = 1,Max = 1,Default = 'Distance'}
    kaSection:Dropdown{Name = 'Kill Downed Players',Flag = 'RageKillauraDowned',options = {'Regular','Finish'},Min = 0,Max = 1}
    kaSection:Toggle{Name = 'Increase Cooldown',Flag = 'RageKillauraWeapon',Tooltip = 'Increases cooldown of killaura by 0.2 seconds, makes heavy weapons work.'}
    kaSection:Toggle({Name = 'Visualize Killaura Range',Flag = 'RageKillauraCircle'}):ColorPicker{Flag = 'RageKillauraCircleColor',Default = Color3.fromRGB(255,255,255)}

    coroutine.wrap(function()
        local circle = Instance.new('Part',workspace)
        circle.Shape = Enum.PartType.Cylinder
        circle.Transparency = 1
        circle.CanCollide = false
        circle.Anchored = true
        circle.CFrame *= CFrame.Angles(0,0,math.rad(90))
        circle.Material = 'SmoothPlastic'
        local gui = Instance.new('SurfaceGui')
        gui.Face = "Right"
        gui.Adornee = circle
        gui.AlwaysOnTop = true
        gui.Parent = circle
        local circleImage = Instance.new("ImageLabel")
        circleImage.Size = UDim2.new(1,0,1,0)
        circleImage.BackgroundTransparency = 1
        circleImage.Image = "rbxassetid://7185003058"
        circleImage.ImageColor3 = Color3.fromRGB(255,255,255)
        circleImage.ImageTransparency = 0.5
        circleImage.Parent = gui

        local gui2 = Instance.new('SurfaceGui')
        gui2.Face = "Left"
        gui2.Adornee = circle
        gui2.AlwaysOnTop = true
        gui2.Parent = circle
        local circleImage2 = Instance.new("ImageLabel")
        circleImage2.Size = UDim2.new(1,0,1,0)
        circleImage2.BackgroundTransparency = 1
        circleImage2.Image = "rbxassetid://7185003058"
        circleImage2.ImageColor3 = Color3.fromRGB(255,0,0)
        circleImage2.ImageTransparency = 0.5
        circleImage2.Parent = gui2

        library:Connect(RunService.RenderStepped,function()
            gui.Enabled = library.flags['RageKillauraCircle']
            gui2.Enabled = gui.Enabled
            circleImage.ImageColor3 = library.flags['RageKillauraCircleColor'].Color
            circleImage2.ImageColor3 = circleImage.ImageColor3
            circleImage.ImageTransparency = library.flags['RageKillauraCircleColor'].Transparency
            circleImage2.ImageTransparency = circleImage.ImageTransparency
            if Framework:IsAlive() then
                circle.Position = LocalPlayer.Character.HumanoidRootPart.CFrame.p - Vector3.new(0,3,0)
                circle.Size = Vector3.new(.1,library.flags['RageKillauraDistance']*2,library.flags['RageKillauraDistance']*2)
            end
        end)

        local running = false
        local running2 = false
        library:Connect(RunService.RenderStepped,function()
            if running2 then return end
            if library.flags['RageKillauraDowned'] ~= 'Finish' then return end

            local Weapon = Framework:GetMelee()
            if not (Weapon and Weapon:FindFirstChild('Hitboxes')) then return end

            local closests = Framework:GetClosests(library.flags['RageKillauraDistance'])
            if #closests == 0 then return end

            local downed = {}
            for i,plr in pairs(closests) do
                if not Framework:IsDown(plr) then continue end
                table.insert(downed,plr)
            end

            running2 = true
            for _,plr in pairs(downed) do
                if Weapon.Parent ~= LocalPlayer.Character then break end
                if not Weapon:FindFirstChild('Hitboxes') then break end

                if not plr.Character then continue end

                local part = plr.Character:FindFirstChild('Torso') or plr.Character:FindFirstChild('Head') or plr.Character.PrimaryPart
                if not part then continue end

                Framework:FireServer('StartMeleeFinish',plr.Character,Weapon)
                task.wait(.1)
                local args = {
                    [1] = Weapon,
                    [2] = part,
                    [3] = Weapon.Hitboxes.Hitbox,
                    [4] = part.Position,
                    [6] = Vector3.new(-0.77, 0, 0.63),
                    [7] = 1,
                    [8] = Vector3.new(0.2, -0.9, -0.3)
                }
                
                pcall(Framework.FireServer,Framework,"MeleeFinish",unpack(args)) 
                Framework:FireServer("StopMeleeFinish",Weapon)
            end
            running2 = false

        end)

        library:Connect(RunService.Stepped,function()
            if running then return end
            if not library.flags['RageKillaura'] then return end

            local weapon = Framework:GetMelee() --it also checks if ur alive
            if not weapon then return end

            local closests = Framework:GetClosests(library.flags['RageKillauraDistance'])
            local hittable = {}

            if #closests == 0 then return end
            if library.flags['RageKillauraPriority'] == 'Health' then
                table.sort(closests,function(plr1,plr2)
                    return plr1.Character.Humanoid.Health < plr2.Character.Humanoid.Health
                end)
            end
            running = true
            pcall(function()
                for i = 1,3 do	
                    table.clear(hittable)
                    for i,v in pairs(closests) do
                        if weapon.Parent ~= LocalPlayer.Character then break end
                        if not (v.Character and Framework:IsAlive(v)) then continue end
                        if Framework:GetDistance(LocalPlayer,v) >= library.flags['RageKillauraDistance'] then continue end
                        if Framework:IsDown(v) and library.flags['RageKillauraDowned'] ~= 'Regular' then continue end

                        table.insert(hittable,v)
                    end
                    if #hittable == 0 then continue end

                    Framework:FireServer('MeleeSwing',weapon,i)
                    task.wait(.1)
                    for _,v in pairs(hittable) do
                        
                        if weapon.Parent ~= LocalPlayer.Character then break end
                        if not (v.Character and Framework:IsAlive(v)) then continue end
                        if Framework:GetDistance(LocalPlayer,v) >= library.flags['RageKillauraDistance'] then continue end
                        if Framework:IsDown(v) and library.flags['RageKillauraDowned'] ~= 'Regular' then continue end

                        local part = v.Character:FindFirstChild('Torso') or v.Character:FindFirstChild('Head') or v.Character.PrimaryPart
                        if not part then continue end
                        local args = {
                            [1] = weapon,
                            [2] = part,
                            [3] = weapon.Hitboxes.Hitbox,
                            [4] = part.Position,
                            [5] = part.CFrame:ToObjectSpace(
                                CFrame.new(part.Position)
                            ),
                            [6] = part.Position,
                        } 
                        if Framework:GetState(v).parry.isParrying == false then
                            Framework:FireServer('MeleeDamage',unpack(args))
                            Framework:FireServer('MeleeDamage',unpack(args))
                        end
                    end
                    if library.flags['RageKillauraWeapon'] then
                        task.wait(.2)
                    end
                end
            end)
            running = false
        end)
    end)()

    local autokick = Tabs.Rage:Section{Name = 'Auto Kick',Side = 'Left'}
    autokick:Toggle{Name = 'Enabled',Flag = 'RageKick',Tooltip = 'Kicks every parried player in distance.'}
    autokick:Dropdown{Name = 'Ignore When',Flag = 'RageKickIgnore',Max = 99,Min = 0,Options = {'Player is Ragdolled','No Weapon Equipped'}}
    autokick:Slider{Name = 'Distance',Flag = 'RageKickDistance',min = 1,max = 13}
    coroutine.wrap(function()
        local executing = false
        library:Connect(RunService.Stepped,function()
            if executing then return end
            if not Framework:IsAlive() then return end
            if not library.flags['RageKick'] then return end
            if table.find(library.flags['RageKickIgnore'],'No Weapon Equipped') and not Framework:GetMelee() then return end

            local weapon = LocalPlayer.Character:FindFirstChild('Stomp')
            local hitbox = weapon and weapon.Hitboxes:FindFirstChild("SideKickHitbox")
            if not weapon then return end

            local closests = Framework:GetClosests(library.flags['RageKickDistance'])
            local parried = {} -- otherwise its gonna spam kick which'll lead to cooldown of stomp
            for i,v in pairs(closests) do
                if not Framework:GetState(v).parry.isParried then continue end 
                table.insert(parried,v)
            end
            if #parried == 0 then return end
            executing = true
            Framework:FireServer('MeleeSwing',weapon,2)
            task.wait(.1)
            for i,plr in pairs(closests) do
                if not Framework:IsAlive(plr) then continue end
                if not Framework:GetState(plr).parry.isParried then continue end   
                if table.find(library.flags['RageKickIgnore'],'Player is Ragdolled') and Framework:GetState(plr).ragdoll.isRagdolled then continue end

                local part = plr.Character:FindFirstChild('Torso') or plr.Character:FindFirstChild('Head') or plr.Character.PrimaryPart
                if not part then continue end

                local args = {
                    weapon,
                    part,
                    hitbox,
                    part.Position,
                    part.CFrame:ToObjectSpace(
                       CFrame.new(part.Position)
                    ),
                    part.Position,
                }
                pcall(Framework.FireServer,Framework,"MeleeDamage",unpack(args))
            end
            executing = false
        end)
    end)()

    local rm = Tabs.Rage:Section{Name = 'Ranged Exploits',Side = 'Right'}
    rm:Toggle{
		Name = 'Instant Charge',
		Callback = function(toggle)
			ModifyRanged:Fire('chargeOnDuration',toggle)
			ModifyRanged:Fire('chargeOffDuration',toggle)
			ModifyRanged:Fire('startShootingAfterCharge',toggle)
		end
	}
	rm:Toggle{
		Name = 'No Spread',
		Callback = function(toggle)
			ModifyRanged:Fire('maxSpread',toggle)
			ModifyRanged:Fire('minSpread',toggle)
            ModifyRanged:Fire('maxTotalBloom',toggle)
		end
	}	
	rm:Toggle{
		Name = 'No Dropoff',
		Callback = function(toggle)
			ModifyRanged:Fire('gravity',toggle)
		end
	}
	rm:Toggle{
		Name = 'No Recoil',
		Callback = function(toggle)
			ModifyRanged:Fire('recoilAmount',toggle)
		end
	}
	rm:Toggle{
		Name = 'No Slowdown',
		Callback = function(toggle)
			ModifyRanged:Fire('reloadWalkSpeedMultiplier',toggle)
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
			ModifyRanged:Fire('maxDistance',toggle)
		end
	}
	rm:Toggle{
		Name = 'Wallbang',
        Flag = 'RageSAWallbang'
	}
    local rm = Tabs.Rage:Section{Name = 'Silent Aim',Side = 'Right'}
    rm:Toggle{Name = 'Silent Aim',Flag = 'RageSA'}
    rm:Slider{Name = 'Silent Aim Distance',Flag = 'RageSADistance',Min = 1,Max = 20,Default = 10}
    rm:Toggle({Name = 'Show FOV',Flag = 'RageSAShowFov'}):ColorPicker{Flag = 'RageSAShowFovColor'}
    rm:Toggle{Name = 'Filled FOV',Flag = 'RageSAFovFilled'}
    rm:Slider{Name = 'FOV',Flag = 'RageSAFov',Min = 1,Max = 600,Default = 120}


    coroutine.wrap(function()
        ----------------------------------------
        local circle = Drawing.new('Circle')
        circle.Visible = false
        circle.Radius = 120
        circle.Thickness = 1
        circle.Position = workspace.CurrentCamera.ViewportSize/2
        library:Connect(RunService.RenderStepped,function()
            circle.Position = Vector2.new(Mouse.X,Mouse.Y+36)
            circle.Visible = library.flags['RageSAShowFov']
            circle.Radius = library.flags['RageSAFov']
            circle.Color = library.flags['RageSAShowFovColor'].Color
            circle.Transparency = 1-library.flags['RageSAShowFovColor'].Transparency
            circle.Filled = library.flags['RageSAFovFilled']
        end)
        ----------------------------------------
    end)()

    local autoparry = Tabs.Rage:Section{Name = 'Auto Parry',Side = 'Right'}
    autoparry:Toggle{Name = 'Enabled',Flag = 'RageAutoParry',Tooltip = [[
Serversided parry - your parry wont be seen on client, however people see it on server and get stunned if they hit it.
Clientsided parry - your parry is visible on client and slows you down.

Animation detection - detects if player hit you by animation, most likely ignores killaura users.
Sound detection - detects if player hit you by sound.

Teleport to attacker - makes sure player hits your parry.]]}
    autoparry:Slider{Name = 'Parry Distance',Flag = 'RageAutoParryDistance',Min = 1,Max = 15,Default = 7.5,float = 0.1}
    autoparry:Dropdown{Name = 'Parry Type',Flag = 'RageAutoParryType',Options = {'Serversided','Clientsided'},Max = 1}
    autoparry:Dropdown{Name = 'Parry Detection',Flag = 'RageAutoParryDetection',Options = {'Animation','Sound'},Max = 2,Min = 0}
    autoparry:Toggle{Name = 'Teleport To Attacker',Flag = 'RageAutoParryTeleport',Tooltip = 'This is for clientsided parry only.'}
end
do -- legit
    -- auto parry
    local legitParry = Tabs.Legit:Section{Name = 'Auto Parry',Side = 'Left'}
    legitParry:Toggle{Name = 'Enabled',Flag = 'LegitAutoParry'}
    legitParry:Slider{Name = 'Success Rate',Min = 1,Max = 100,Default = 100,Flag = 'LegitAutoParryChance'}
    legitParry:PlayerList{Name = 'Player Whitelist',Max = 100,Flag = 'LegitAutoParryWhitelist'}
    legitParry:Toggle{Name = 'Always Parry When Low',Flag = 'LegitAutoParryLow'}
    legitParry:Slider{Name = 'Low Hp',Min = 1,Max = 100,Default = 30,Flag = 'LegitAutoParryLowHP'}

    -- modifiers stuff
    local modificators = Tabs.Legit:Section{Name = 'Modifiers',Side = 'Right'}
	modificators:Toggle{
		Name = 'Spread',
        Flag = 'LSpread',
		Callback = function(toggle)
            if not library.flags['SpreadSlider'] then return end
			ModifyRanged:Fire('maxSpread',toggle,library.flags['SpreadSlider'])
			ModifyRanged:Fire('minSpread',toggle,library.flags['SpreadSlider'])
            --ModifyRanged:Fire('maxTotalBloom',toggle)
		end
	}	
    modificators:Slider{
        Name = 'Value',
        Flag = 'SpreadSlider',
        Min = 0,
        Max = 0.35,
        Float = 0.01,
        Default = 0.35,
        Callback = function(v)
			ModifyRanged:Fire('maxSpread',library.flags['LSpread'],v)
			ModifyRanged:Fire('minSpread',library.flags['LSpread'],v)
        end
    }

	modificators:Toggle{
		Name = 'Dropoff',
        Flag = 'LDropdoff',
		Callback = function(toggle)
            if not library.flags['DropdoffSlider'] then return end
			ModifyRanged:Fire('gravity',toggle,Vector3.new(0,-library.flags['DropdoffSlider'],0))
		end
	}
    modificators:Slider{
        Name = 'Value',
        Flag = 'DropdoffSlider',
        Min = 0,
        Max = 35,
        Float = 0.1,
        Default = 35,
        Callback = function(v)
			ModifyRanged:Fire('gravity',library.flags['LDropdoff'],Vector3.new(0,-v,0))
        end
    }

	modificators:Toggle{
		Name = 'Recoil',
        Flag = 'LRecoil',
		Callback = function(toggle)
            if not library.flags['RecoilSlider'] then return end
			ModifyRanged:Fire('recoilAmount',toggle,library.flags['RecoilSlider'])
		end
	}
    modificators:Slider{
        Name = 'Value',
        Flag = 'RecoilSlider',
        Min = 0,
        Max = 35,
        Float = 0.01,
        Default = 35,
        Callback = function(v)
			ModifyRanged:Fire('recoilAmount',library.flags['LRecoil'],v)
        end
    }

	modificators:Toggle{
		Name = 'Slowdown',
        Flag = 'LSlowdown',
		Callback = function(toggle)
            if not library.flags['SlowdownSlider'] then return end
			ModifyRanged:Fire('reloadWalkSpeedMultiplier',toggle,library.flags['SlowdownSlider'])
		end
	}
    modificators:Slider{
        Name = 'Multiplier',
        Flag = 'SlowdownSlider',
        Min = 0,
        Max = 1,
        Float = 0.01,
        Default = 1,
        Callback = function(v)
			ModifyRanged:Fire('reloadWalkSpeedMultiplier',library.flags['LSlowdown'],v)
        end
    }

	modificators:Toggle{
		Name = 'No Reload Cancel',
		Flag = 'LNRC'
	}
	modificators:Toggle{
		Name = 'No Charge Cancel',
		Flag = 'LNCC'
	}	

    local silentAim = Tabs.Legit:Section{Name = 'Silent Aim',Side = 'Right'}
    silentAim:Toggle{Name = 'Enabled',Flag = 'LegitSA'} --
    silentAim:Slider{Name = 'Correction',Flag = 'LegitSADistance',Min = 1,Max = 15,Default = 8} --
    silentAim:Slider{Name = 'FOV',Flag = 'LegitSAFov',Min = 1,Max = 360,Default = 30} --
    silentAim:Toggle({Name = 'Show FOV',Flag = 'LShowFov'}):ColorPicker{Flag = 'LShowFovColor',Default = Color3.fromRGB(255,255,255)}
    silentAim:Toggle{Name = 'Show Fov Filled',Flag = 'LShowFovFilled'}

    silentAim:Dropdown{Name = 'Hitbox',Options = {'Head','Torso','Random'},Default = 'Random',Min=1,Max=1,Flag = 'LegitSAHitbox'} --
    silentAim:Toggle{Name = 'Visible Check',Flag = 'LVisibleCheck'} --

    silentAim:Slider{Name = 'Hit Chance',Flag = 'LHitChance',Min=1,Max=100,Default=80} --
    silentAim:Slider{Name = 'Redirection Chance',Flag = 'LRedirectionChance',Min=1,Max=100,Default=80} --

    coroutine.wrap(function()
        ----------------------------------------
        local circle = Drawing.new('Circle')
        circle.Visible = false
        circle.Radius = 120
        circle.Thickness = 1
        circle.Position = workspace.CurrentCamera.ViewportSize/2
        library:Connect(RunService.RenderStepped,function()
            circle.Position = Vector2.new(Mouse.X,Mouse.Y+36)
            circle.Visible = library.flags['LegitSA'] and library.flags['LShowFov']
            circle.Radius = library.flags['LegitSAFov']
            circle.Color = library.flags['LShowFovColor'].Color
            circle.Transparency = 1-library.flags['LShowFovColor'].Transparency
            circle.Filled = library.flags['LShowFovFilled']
        end)
        ----------------------------------------
    end)()

    local function SetStamina()
        local stamina = Framework:GetModule('DefaultStaminaHandlerClient').getDefaultStamina()
        if stamina and (library.flags['LegitStaminaRegen'] or stamina.gainDelay ~= 0.33) then
            rawset(stamina,'gainDelay',library.flags['LegitStaminaRegen'] and library.flags['LegitStaminaDelay'] and 0.15 or 0.33)
            rawset(stamina,'gainPerSecond',library.flags['LegitStaminaRegen'] and 25*library.flags['LegitStaminaRegenModifier'] or 25)
        end
        Framework:GetModule('DefaultStaminaConstants').gainDelay = library.flags['LegitStaminaRegen'] and library.flags['LegitStaminaDelay'] and 0.15 or 0.33
        Framework:GetModule('DefaultStaminaConstants').gainPerSecond = library.flags['LegitStaminaRegen'] and 25*library.flags['LegitStaminaRegenModifier'] or 25
    end
    local function SetAir()
        local airConstants = Framework:GetModule('AirConstants')
        airConstants.AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = library.flags['LegitAirConsumption'] and -library.flags['LegitAirConsumptionModifier'] or -15
        airConstants.AIR_GAIN_DELAY = library.flags['LegitAirConsumption'] and library.flags['LegitAirDelay'] and 0.075 or 0.125
    end
    local function SetDashCooldown()
        Framework:GetModule('DashConstants').DASH_COOLDOWN = library.flags['LegitDashCooldown'] and library.flags['LegitDashCooldownModifier'] or 3
    end

    local staminaModifier = Tabs.Legit:Section{Name = 'Stamina Modifier',Side = 'Left'}
    staminaModifier:Toggle{Name = 'Faster Stamina Regen',Flag = 'LegitStaminaRegen',Callback = SetStamina}
    staminaModifier:Slider{Name = 'Regen Modifier',Flag = 'LegitStaminaRegenModifier',Min = 1,Max = 5,Default = 2,Float = 0.1,Callback = SetStamina}
    staminaModifier:Toggle{Name = 'Lower Gain Delay',Flag = 'LegitStaminaDelay',Callback = SetStamina}

    local airModifier = Tabs.Legit:Section{Name = 'Air Modifier',Side = 'Left'}
    airModifier:Toggle{Name = 'Slower Air Consumption',Flag = 'LegitAirConsumption',Callback = SetAir}
    airModifier:Slider{Name = 'Consumption Speed',Flag = 'LegitAirConsumptionModifier',Min = 1,Max = 15,Default = 7,Float = 0.1,Callback = SetAir}
    airModifier:Toggle{Name = 'Lower Air Gain Delay',Flag = 'LegitAirDelay',Callback = SetAir}

    local fallModifier = Tabs.Legit:Section{Name = 'Fall Damage Modifier',Side = 'Left'}
    fallModifier:Toggle{Name = 'Less Fall Damage',Flag = 'LegitFallDamage'}
    fallModifier:Slider{Name = 'Percentage Removed',Flag = 'LegitFallDamageSlider',Min = 1,Max = 100,Default = 50,Float = 0.1}
    fallModifier:Toggle{Name = 'Never Fatal',Flag = 'LegitFallDamageFatal'}

    
    local dashModifier = Tabs.Legit:Section{Name = 'Dash Modifier',Side = 'Left'}
    dashModifier:Toggle{Name = 'Lower Dash Cooldown',Flag = 'LegitDashCooldown',Callback = SetDashCooldown}
    dashModifier:Slider{Name = 'Dash Cooldown',Flag = 'LegitDashCooldownModifier',Min = 1,Max = 3,Default = 2,Float = 0.1,Callback = SetDashCooldown}

    Framework:OnRemote('TakeFallDamage',function(args) 
        local damage = args[1]
        local percentage = args[1]/100

        local fakeDamage = damage-(library.flags['LegitFallDamage'] and percentage*library.flags['LegitFallDamageSlider'] or 0)
        local health = LocalPlayer.Character.Humanoid.Health
        if health-fakeDamage <= 0 and library.flags['LegitFallDamageFatal'] then
            if health >= 16 then
                fakeDamage = health-10
            else
                fakeDamage = 2
            end
        end
        args[1] = fakeDamage
        --args[1] = 0
    end)
end

coroutine.wrap(function() -- silent aim handler
    local hitboxes = {
        'Head',
        'Torso'
    }
    local old;old = BetterHookFunction(Framework:GetModule('RangedWeaponHandler').calculateFireDirection,function(a,b,c,d)
        if library.flags['RageSA'] or library.flags['LegitSA'] then
            local success,msg = pcall(function() -- if it errors its gonna break ranged until u respawn
                if library.flags['LegitSA'] and math.random(1,100) >= library.flags['LRedirectionChance'] then
                    return
                end
                local closest = Framework:GetClosestToMouse((library.flags['RageSA'] and library.flags['RageSAFov'] or library.flags['LegitSAFov']),library.flags['LegitSA'] and libray.flags['LVisibleCheck'] or false)
                local tool = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
                
                if closest and tool then
                    local hitbox = (library.flags['LegitSA'] and (library.flags['LegitSAHitbox'] == 'Random' and hitboxes[math.random(1,#hitboxes)] or library.flags['LegitSAHitbox'])) or 'Head'
                    return CFrame.new(tool.Contents.Handle.FirePoint.WorldCFrame.p,closest.Character[hitbox].Position).LookVector*d
                end
            end)
            if success and msg then
                return msg
            end
        end
        return old(a,b,c,d)
    end)
    local old;old = BetterHookFunction2(Framework:GetModule('RangedWeaponClient'),'cancelCharge',function(...)
        if library.flags['NCC'] or library.flags['LNCC'] then
            return
        end
        return old(...)
    end)
    local old;old = BetterHookFunction2(Framework:GetModule('RangedWeaponClient'),'cancelReload',function(...)
        if library.flags['NRC'] or library.flags['LNRC'] then
            return
        end
        return old(...)
    end)
    local old;old = BetterHookFunction(Framework:GetModule('RangedCasters').main.RayHit.Connections[3].Delegate,function(...)
        if library.flags['LegitSA'] and math.random(1,100) >= library.flags['LHitChance'] then
            return
        end
        return old(...)
    end)
    local silentAimIndx
    local filter = {
        'SimulateCast',
        'updateRipples',
        'isCameraInWater'
    }
    local oldNamecall; oldNamecall = hookmetamethod(game,'__namecall', function(self, ...) 
        local method = tostring(getnamecallmethod()) 
        local args = {...} 

        if method == 'Raycast'then
            if not silentAimIndx then
                for i=3,10 do
                    pcall(function()
                        if table.find(filter,getinfo(i).name) then
                            silentAimIndx = i
                        end
                    end)
                    if silentAimIndx then break end
                end
            end
            pcall(function()
                local info = getinfo(silentAimIndx or 5)
                if info.name == 'SimulateCast' then
                    if library.flags['RageSAWallbang'] then
                        local list = args[3].FilterDescendantsInstances
                        table.insert(list,workspace.Map)
                        table.insert(list,workspace.Terrain)
                        args[3].FilterDescendantsInstances = list
                    end
                    if library.flags['RageSA'] or library.flags['LegitSA'] then
                        local hitbox = (library.flags['LegitSA'] and (library.flags['LegitSAHitbox'] == 'Random' and hitboxes[math.random(1,#hitboxes)] or library.flags['LegitSAHitbox'])) or 'Head'
                        local distance = (library.flags['LegitSA'] and library.flags['LegitSADistance']) or library.flags['RageSADistance']
                        local closest = Framework:GetClosestNoNamecall(distance,args[1])

                        if closest ~= nil then
                            args[2] = (closest.Character[hitbox].Position-args[1]).Unit*100
                        end
                    end
                end
            end)
        end

        return oldNamecall(self, unpack(args)) 
    end)
end)()
coroutine.wrap(function() -- auto parry handler
    local SwingAnims = {}
    for id,tab in pairs(Framework:GetModule('WeaponMetadata')) do
        if not tab.slashMetadata then continue end
        for _,data in pairs(tab.slashMetadata) do
            if not table.find(SwingAnims,data.animation.AnimationId) then
                table.insert(SwingAnims,data.animation.AnimationId)
            end
        end
    end
    local SwingSounds = {}
    for i,weapon in pairs(game.ReplicatedStorage.Shared.Assets.Melee:GetChildren()) do
        if not weapon:FindFirstChild('Sounds') then continue end
        if not weapon.Sounds:FindFirstChild('Slashes') then continue end
        for i,sound in pairs(weapon.Sounds.Slashes:GetChildren()) do
            table.insert(SwingSounds,sound.SoundId)
        end
    end
    local Parry = function(char)
        if not (Framework:GetMelee()) then return end
        if library.flags['LegitAutoParry'] and table.find(library.flags['LegitAutoParryWhitelist'],char.Name) then return end
        local type = library.flags['RageAutoParry'] and library.flags['RageAutoParryType'] or 'Clientsided'
        local chance = library.flags['RageAutoParry'] and 100 or math.random(1,100)
        local minchance = library.flags['RageAutoParry'] and 100 or library.flags['LegitAutoParryChance']
        if type == 'Clientsided' then
            local parry = Framework:GetState().parry
            local parryTick = parry.lastIsParryingFalseTick or workspace:GetServerTimeNow()
            local cooldown = Framework:GetModule('ParryConstants')[parry.lastParrySucceeded and 'PARRY_COOLDOWN_IN_SECONDS_AFTER_SUCCESSFUL_PARRY' or 'PARRY_COOLDOWN_IN_SECONDS']
            
            if (workspace:GetServerTimeNow()-parryTick) >= cooldown and (chance <= minchance or (library.flags['LegitAutoParry'] and library.flags['LegitAutoParryLow'] and LocalPlayer.Character.Humanoid.Health <= library.flags['LegitAutoParryLowHP'])) then
                Framework:GetMeleeFuncs():parry()
                if library.flags['RageAutoParry'] and library.flags['RageAutoParryTeleport'] then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
                end
            end
        else
            Framework:FireServer('Parry')
        end
    end
    local function ConnectParry(plr)
        if (plr.Character and plr.Character:FindFirstChild('Humanoid')) then
            local loop = library:Connect(plr.Character.Humanoid.AnimationPlayed,function(anim)
                if not table.find(library.flags['RageAutoParryDetection'],'Animation') then return end
                if (LocalPlayer.Character.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= library.flags['RageAutoParryDistance'] then
                    if table.find(SwingAnims,anim.Animation.AnimationId) then
                        Parry(plr.Character)
                    end
                end
            end) 
            library:Connect(plr.Character.Humanoid.Died,function()
                library:Disconnect(loop)
            end)
        end
    end
    for i,v in pairs(Players:GetPlayers()) do
        if v == LocalPlayer then continue end
        if not v.Character then v.CharacterAdded:Wait() end
        ConnectParry(v)
        library:Connect(v.CharacterAdded,function(character)
            character:WaitForChild('Humanoid')
            ConnectParry(v)
        end)
    end
    library:Connect(Players.PlayerAdded,function(player)
        ConnectParry(player)
        library:Connect(player.CharacterAdded,function(character)
            character:WaitForChild('Humanoid')
            ConnectParry(player)
        end)
    end)
    library:Connect(workspace.PlayerCharacters.DescendantAdded,function(sound)
        local weapon = sound:FindFirstAncestorWhichIsA('Model')
        if weapon.Name == 'Stomp' then return end -- anti niggers
        if not (library.flags['RageAutoParry'] and table.find(library.flags['RageAutoParryDetection'],'Sound') or library.flags['LegitAutoParry']) then return end
        if not (sound:IsA('Sound') and table.find(SwingSounds,sound.SoundId) and Framework:IsAlive()) then return end
        if sound:IsDescendantOf(LocalPlayer.Character) then return end

        local distance = (library.flags['RageAutoParry'] and library.flags['RageAutoParryDistance']) or 13

        if (LocalPlayer.Character.HumanoidRootPart.Position-weapon:FindFirstAncestorWhichIsA('Model').HumanoidRootPart.Position).Magnitude <= distance then
            Parry(weapon:FindFirstAncestorWhichIsA('Model'))
        end
    end) 
end)()

do -- misc
    ------------------------------------------------
    local charExploits = Tabs.Misc:Section{Name = 'Character Exploits',Side = 'Left'}
    charExploits:Toggle{Name = 'No Jump Cooldown',Flag = 'NJC',Callback = function(enabled)
        Framework:GetModule('JumpConstants').JUMP_DELAY_ADD = enabled and 0 or 1
    end}
    charExploits:Toggle{Name = 'No Dash Cooldown',Flag = 'NDC',Callback = function(enabled)
        Framework:GetModule('DashConstants').DASH_COOLDOWN = enabled and 0 or 3
    end}
    charExploits:Toggle{Name = 'No Fall Damage',Flag = 'NFD',Callback = function(enabled)
        Framework:GetState().fallDamageClient.isDisabled = enabled
    end}
    ------------------------------------------------
    charExploits:Toggle{Name = 'Infinite Stamina',Flag = 'InfStam', Callback = function(enabled)
        local value = enabled and 1000000 or 150
        local stamina = Framework:GetModule('DefaultStaminaHandlerClient').getDefaultStamina()
        if stamina and (enabled or stamina:getMaxStamina() == 1000000)  then
            rawset(stamina,'_maxStamina',value)
            rawset(stamina,'_stamina',value)
        end
    end}
    charExploits:Toggle{Name = 'Infinite Air',Flag = 'InfAir',Callback = function(enabled)
        Framework:GetModule('AirConstants').AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = enabled and 0 or -15
    end}
    ------------------------------------------------
    charExploits:Toggle{Name = 'Infinite Jump',Flag = 'InfJump',Tooltip = "Let's you jump in air."}
    charExploits:Toggle{Name = 'Jump Whenever',Flag = 'InfJump2',Tooltip = "Let's you jump in any state (ragdoll,parried,downed,etc.)."}
    ------------------------------------------------
    charExploits:Toggle{Name = 'Disable Env. Damage',Flag = 'NoEnvDmg',Tooltip = 'Disables damage from bear traps and fire.',}
    ------------------------------------------------
    local anti = Tabs.Misc:Section{Name = 'Anti',Side = 'Left'}
    anti:Toggle{Name = 'Anti Knockback',Flag = 'Antiknock'}
    anti:Toggle{Name = 'Anti Ragdoll',Flag = 'AntiRagdoll',}
    ------------------------------------------------
    local charMov = Tabs.Misc:Section{Name = 'Character Movement',Side = 'Right'}
    charMov:Toggle{Name = 'WalkSpeed',Flag = 'Walkspeed',Callback = function(enabled)
        if Framework:IsAlive() and not enabled then
            LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').WalkSpeed = 16
        end
    end}
    charMov:Slider{Name = 'Speed',Min = 1,Max = 60,Default = 16,Flag = 'WalkSpeed_slider'}
    charMov:Toggle{Name = 'JumpPower',Flag = 'Jumppower',Callback = function(enabled)
        if Framework:IsAlive() and not enabled then
            LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').JumpPower = 50
        end
    end}
    charMov:Slider{Name = 'Power',Min = 1,Max = 250,Default = 50,Flag = 'JumpPower_slider',Callback = function(enabled)
        if Framework:IsAlive() and not enabled then
            LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').JumpPower = 50
        end
    end}
    charMov:Toggle{Name = 'Fly',Callback = function(bol)
        Framework:GetState().fly.isFlying = bol
        if not LocalPlayer.Character then return end
        if bol then
            getupvalue(Framework:GetModule('FlyHandlerClient')._startModule,2)(LocalPlayer.Character)
        elseif LocalPlayer.Character.HumanoidRootPart:FindFirstChild('LinearVelocity') then
            LocalPlayer.Character.HumanoidRootPart:FindFirstChild('LinearVelocity'):Destroy()
        end
    end}
    ------------------------------------------------
    local auto = Tabs.Misc:Section{Name = 'Auto',Side = 'Left'}
    auto:Toggle{Name = 'Equip Weapon',Flag = 'AutoTool'}
    auto:Toggle{Name = 'Airdrop Claimer',Flag = 'AutoAirdrop'}
    auto:Toggle{Name = 'Revive',Flag = 'AutoRevive'}
    ------------------------------------------------
    local instant = Tabs.Misc:Section{Name = 'Instant',Side = 'Left'}
    instant:Toggle{Name = 'Ghost Potion',Callback = function(enabled)
        local data = Framework:GetUtilityData('ghostpotion')
        data.useTime = enabled and 0 or 2
    end}
    instant:Toggle{Name = 'Bear Trap',Callback = function(enabled)
        local data = Framework:GetUtilityData('beartrap')
        data.useTime = enabled and 0 or 1.75
    end}
    ------------------------------------------------
    local killsay = Tabs.Misc:Section{Name = 'Kill Say',Side = 'Right'}
    killsay:Toggle{Name = 'Enabled',Flag = 'KillSay'}
    killsay:Dropdown{Name = 'Kill Say Type',Options = {'Premade','Message','File'},Min = 1,Max = 1,Default = 'Premade',Flag = 'KillSayType'}
    killsay:Box{Placeholder = 'Message',Flag = 'KillSayMessage'}
    ------------------------------------------------
    local other = Tabs.Misc:Section{Name = 'Other',Side = 'Right'}
    other:Toggle{Name = 'Unlock All Servers',Flag = 'UnlockServers',Tooltip = 'Allows you to join all servers. Exceptions are beginner servers and vc only.'}
    other:Toggle{Name = 'Hide Overhead Name',Flag = 'NoName',Callback = function(enabled)
        Framework:FireServer('UpdateIsCrouching',enabled)
    end}
    local oldAnim
    other:Toggle{Name = 'Hurt Animation',Flag = 'HurtAnim', Tooltip = 'Makes your walking animation a hurt walking animation.',Callback = function(enabled)
        local anims = Framework:GetModule('CharacterHandlerClient').getAnimations()
        if not anims then return end
        if not oldAnim then
            oldAnim = anims.walk
        end

        anims.walk = enabled and anims.hurtWalk or oldAnim
    end}
    ------------------------------------------------
    makefolder('SpaceWare/CombatWarriors/emotes')
    local path = 'SpaceWare/CombatWarriors/emotes'
    local function GetEmotesLayout()
        local emotes = {}
        for i,v in pairs(listfiles('SpaceWare/CombatWarriors/emotes')) do
            emotes[i] = string.gsub(v:sub(0,-5),(path..[[\]]),'')
        end
        return emotes
    end
    local emotes = Tabs.Misc:Section{Name = 'Emotes',Side = 'Right'}
    local emotesList = emotes:Dropdown{Name = 'Emotes Layout',options = GetEmotesLayout(),FLAG = 'EmoteLayout',Max = 1,Min = 0}

    emotes:Button{Name = 'Save',Callback = function()
        if not library.flags['EmoteLayout']then return end

        local slots = Framework:GetState().emoteWheelClient.slots
        writefile(path..'/'..library.flags['EmoteLayout']..'.txt',game.HttpService:JSONEncode(slots))
        local layout = GetEmotesLayout()
        emotesList:UpdateOptions(layout,library.flags['EmotesName'] or layout[1])
    end}
    emotes:Button{Name = 'Load',Tooltip = 'Unlock Emotes Required.',Callback = function()
        if not library.flags['EmoteLayout']then return end

        local slotsSTR = game.HttpService:JSONDecode(readfile(path..'/'..library.flags['EmoteLayout']..'.txt'))
        local slots = Framework:GetState().emoteWheelClient.slots
        for i,v in pairs(slots) do
            slots[i] = slotsSTR[i]
        end
    end}
    emotes:Box{placeholder = 'Emotes Layout Name',Flag = 'EmotesName'}
    emotes:Button{Name = 'Save',Callback = function()
        if library.flags['EmotesName'] == '' then return end

        local slots = Framework:GetState().emoteWheelClient.slots
        writefile(path..'/'..library.flags['EmotesName']..'.txt',game.HttpService:JSONEncode(slots))
        local layout = GetEmotesLayout()
        emotesList:UpdateOptions(layout,library.flags['EmotesName'] or layout[1])
    end}    
    emotes:Button{Name = 'Unlock Emotes',Callback = function()
        local emotes = Framework:GetModule('EmoteIds')
        local emoteIds = {}
        for name,id in pairs(emotes) do
            emoteIds[id] = name
        end        
        Framework:GetState().OwnedEmotes = emoteIds
    end}
    ------------------------------------------------
    Spawn:Connect(function(chr)
        task.wait()
        local anims = Framework:GetModule('CharacterHandlerClient').getAnimations()
        if not oldAnim then
            oldAnim = anims.walk
        end
        if library.flags['HurtAnim'] then
            anims.walk = anims.hurtWalk
        end
    end)
    Died:Connect(function()
        oldAnim = nil
    end)
    ------------------------------------------------
    local isReviving = false
    library:Connect(RunService.Stepped,function()
        if Framework:IsAlive() then
            local state = Framework:GetState()
            if library.flags['NDC'] then
                state.dashClient.isDashing = false
            end
            if library.flags['Walkspeed'] then
                LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').WalkSpeed = library.flags['WalkSpeed_slider']
            end
            if library.flags['Jumppower'] then
                LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').JumpPower = library.flags['JumpPower_slider']
            end
            if library.flags['AutoTool'] and not LocalPlayer.Character:FindFirstChild('Tool') then
                local weapon = Framework:GetMelee(true)
                if weapon then
                    weapon.Parent = LocalPlayer.Character
                end
            end
            if library.flags['NoName'] then
                Framework:FireServer('UpdateIsCrouching',true)
            end
            if library.flags['AutoAirdrop'] and workspace.Airdrops:FindFirstChildWhichIsA('Model') then
                local airdrop = workspace.Airdrops:FindFirstChildWhichIsA('Model')   
                if not (airdrop:FindFirstChild('Crate') and airdrop.Crate:FindFirstChild('Hitbox') and airdrop.Crate.Hitbox:FindFirstChild('ProximityPrompt')) then return end
                --LocalPlayer.Character.HumanoidRootPart.Anchored = true
                pcall(function()
                    LocalPlayer.Character.HumanoidRootPart.CFrame = airdrop.Crate.Base.CFrame
                    wait(.2)
                    fireproximityprompt(airdrop.Crate.Hitbox.ProximityPrompt)
                end)
                --LocalPlayer.Character.HumanoidRootPart.Anchored = false
            end
            if library.flags['AutoRevive'] and Framework:IsDown() and not isReviving then
                isReviving = true
                Framework:FireServer('SelfReviveStart')
                task.wait(.8)
                Framework:FireServer('SelfRevive')
                isReviving = false
            end
        end
    end)
    ------------------------------------------------
    library:Connect(UserInputService.InputBegan,function(input,focused)
        if focused then return end
        if library.flags['InfJump'] and input.KeyCode == Enum.KeyCode.Space and Framework:IsAlive() and not Framework:GetState().waterClient.isSwimming then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
    ------------------------------------------------
    Framework:OnRemoteName('GotHitRE',function(args)
        if library.flags['NoEnvDmg'] then
            args[1] = nil
        end
    end)
    ------------------------------------------------
    do
        ------------------------------------------------
        local knockback = Framework:GetModule('KnockbackHandler')
        local ReturnFuncs = {
            Antiknock = {
                knockback.knockbackPartAngular,
                knockback.knockbackCharacterPart,
            },
            AntiRagdoll = {
                Framework:GetModule('RagdollHandlerClient').toggleRagdoll
            }
        }
        for flag,funcs in pairs(ReturnFuncs) do
            for _,func in pairs(funcs) do
                local old;old = BetterHookFunction(func,function(...)
                    if library.flags[flag] then
                        return
                    end
                    return old(...)
                end)
            end
        end
        ------------------------------------------------
        local ReturnTrue = {
            UnlockServers = {
                Framework:GetModule('ServerUtilClient').getCanJoinServer
            },
            InfJump2 = {
                {
                    Framework:GetModule('JumpHandlerClient').getCanJump,
                    function(func) 
                        local timer = getupvalue(func,3)
                        if timer:getTimeLeft() > 0 then
                            return false
                        end
                        return true
                    end
                }
            }
        }
        for flag,funcs in pairs(ReturnTrue) do
            for _,func in pairs(funcs) do
                if typeof(func) == 'table' then
                    local old; old = BetterHookFunction(func[1],function(...)
                        if library.flags[flag] then
                            return func[2](old)
                        end
                        return old(...)
                    end)
                    continue
                end
                local old; old = BetterHookFunction(func,function(...)
                    if library.flags[flag] then
                        return true
                    end
                    return old(...)
                end)
            end
        end

    end
    ------------------------------------------------
    Spawn:Connect(function()
        task.wait(.2)

        local value = library.flags['InfStam'] and 1000000 or 150
        local stamina = Framework:GetModule('DefaultStaminaHandlerClient').getDefaultStamina()
        if stamina and (library.flags['InfStam'] or stamina:getMaxStamina() == 1000000)  then
            rawset(stamina,'_maxStamina',value)
            rawset(stamina,'_stamina',value)
        end
    end)
    ------------------------------------------------
    local KillSayMessages = {
        'bye bye loser!',
        "what was that? Can't hear u over my kill sound",
        "this is a tough workout!",
        "This hack is approved by leaked",
        "This hack is approved by len",
        "This hack is approved by y1k",
        'spaceware on top $$$',
        'your not invited to my birthday party👎'
    }
    if not isfile('SpaceWare/CombatWarriors/KillSay.txt') then
        writefile('SpaceWare/CombatWarriors/KillSay.txt', 'test\n')
    end
    local function Chat(...)
        return game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(...)
    end

    Framework:AddCallback('AddItemToKillFeed',function(killed,assisted,died)
        if library.flags['KillSay'] and killed == LocalPlayer.Character and died ~= LocalPlayer.Character then
            local msg = ''
            if library.flags['KillSayType'] == 'Premade' then
                msg = KillSayMessages[math.random(1,#KillSayMessages)]
            elseif library.flags['KillSayType'] == 'Message' then
                msg = library.flags['KillSayMessage']
            else
                local messages = readfile('SpaceWare/CombatWarriors/KillSay.txt'):split('\n')
                msg = messages[math.random(1,#messages)]
            end
            Chat(msg)
        end
    end)
end

do--visuals
    do -- char changer
        local blacklist = {
            'CharacterMesh',
            'Shirt',
            'Pants',
            'Hat',
            'Accessory'
        }
        local function ChangeCharacter(NewCharacter,OrigChar)
            OrigChar = OrigChar or LocalPlayer.Character
            if not NewCharacter then return end
            if not OrigChar then return end

            for i,v in pairs(OrigChar:GetChildren()) do
                for i2,v2 in pairs(blacklist) do
                    if v:IsA(v2) then
                        v:Destroy()
                        break
                    end
                end
                if v:IsA('BasePart') then
                    local part = NewCharacter:FindFirstChild(v.Name)
                    if part then
                        v.Transparency = part.Transparency
                        v.Color = part.Color
                    end
                end        
            end
            -- DESTROY FACE --
            do
                local face = NewCharacter:FindFirstChild('Head'):FindFirstChild("face")
                local origHead = OrigChar:FindFirstChild('Head')
                local origFace = origHead and origHead:FindFirstChild('face') or nil
                if origFace then
                    origFace:Destroy()
                end
                if face and origHead then
                    face:Clone().Parent = origHead
                end        
            end
            -- HEAD MESH --
            do
                local mesh = NewCharacter:FindFirstChild('Head'):FindFirstChildWhichIsA('SpecialMesh')
                local origHead = OrigChar:FindFirstChild('Head')
                local origMesh = origHead and origHead:FindFirstChildWhichIsA('SpecialMesh') or nil
                if origMesh then
                    origMesh:Destroy()
                end
                if mesh and origHead then
                    if mesh.MeshId == '' then
                        Instance.new('SpecialMesh',origHead).Scale = Vector3.new(1.25,1.25,1.25)
                    else
                        mesh:Clone().Parent = origHead
                    end
                end
            end
            
            for i,v in pairs(NewCharacter:GetChildren()) do
                for i2,v2 in pairs(blacklist) do
                    if v:IsA(v2) then
                        local Clone = v:Clone()
                        Clone.Parent = OrigChar
                        if v2 == 'Accessory' then
                            for _,Weld in pairs (Clone.Handle:GetChildren()) do 
                                if Weld:IsA("Weld") and Weld.Part1 ~= nil then 
                                    Weld.Part1 = LocalPlayer.Character[Weld.Part1.Name] 
                                end 
                            end 
                        end
                        break
                    end
                end
            end
        end 

        local chars = game:GetObjects('rbxassetid://12258574579')[1]
        repeat wait() until chars ~= nil
    
        local R6Chars = chars:FindFirstChild('R6')
        local chars1 = R6Chars:FindFirstChild('r6')
        local chars2 = R6Chars:FindFirstChild('r6 2')
        local chars3 = R6Chars:FindFirstChild('r6 3')
        
        local chars = {
            ['Custom Characters'] = {'None'},
            ['Custom Characters 2'] = {'None'},
            ['Custom Characters 3'] = {'None'}
        }
        for i,v in pairs(chars1:GetChildren()) do
            table.insert(chars['Custom Characters'],v.Name)
        end
        for i,v in pairs(chars2:GetChildren()) do
            table.insert(chars['Custom Characters 2'],v.Name)
        end
        for i,v in pairs(chars3:GetChildren()) do
            table.insert(chars['Custom Characters 3'],v.Name)
        end
        
        local OriginalCharacter
        if LocalPlayer.Character then
            if not LocalPlayer:HasAppearanceLoaded() then
                LocalPlayer.CharacterAppearanceLoaded:Wait()   
            end
            LocalPlayer.Character.Archivable = true
            OriginalCharacter = LocalPlayer.Character:Clone()
            OriginalCharacter.Parent = workspace
            OriginalCharacter.HumanoidRootPart.Anchored = true
            OriginalCharacter.HumanoidRootPart.CFrame *= CFrame.new(0,55555555555,0)
        end
        local charChanger = Tabs.Visuals:Section{Name = 'Character Changer',Side = 'Left'}
        charChanger:Toggle{Name = 'Enabled',Flag = 'VisualsCharChanger',Callback = function(b)
            if not LocalPlayer.Character then return end
            local scroll = library.flags['VisualsCharChanger_Chars']
            if not scroll then return end
            if not b or scroll.Scroll == 'None' then 
                if OriginalCharacter then
                    ChangeCharacter(OriginalCharacter,LocalPlayer.Character)
                end
                return
            end
            

            if scroll.Dropdown == 'Custom Characters' then
                ChangeCharacter(chars1:FindFirstChild(scroll.Scroll),LocalPlayer.Character)
            elseif scroll.Dropdown == 'Custom Characters 2' then
                ChangeCharacter(chars2:FindFirstChild(scroll.Scroll),LocalPlayer.Character)
            else
                ChangeCharacter(chars3:FindFirstChild(scroll.Scroll),LocalPlayer.Character)
            end
        end}
        charChanger:ScrollDrop{Name = 'Characters',Options = chars,Flag = 'VisualsCharChanger_Chars',Callback = function(scroll)
            if not LocalPlayer.Character then return end
            if not library.flags['VisualsCharChanger'] or scroll.Scroll == 'None' then 
                if OriginalCharacter then
                    ChangeCharacter(OriginalCharacter,LocalPlayer.Character)
                end
                return
            end

            if scroll.Dropdown == 'Custom Characters' then
                ChangeCharacter(chars1:FindFirstChild(scroll.Scroll),LocalPlayer.Character)
            elseif scroll.Dropdown == 'Custom Characters 2' then
                ChangeCharacter(chars2:FindFirstChild(scroll.Scroll),LocalPlayer.Character)
            else
                ChangeCharacter(chars3:FindFirstChild(scroll.Scroll),LocalPlayer.Character  )
            end
        end}

        library:Connect(LocalPlayer.CharacterAdded,function(char)
            LocalPlayer.CharacterAppearanceLoaded:Wait()   
            task.wait()
            char.Archivable = true
            OriginalCharacter = char:Clone()
            OriginalCharacter.Parent = workspace
            OriginalCharacter.HumanoidRootPart.Anchored = true
            OriginalCharacter.HumanoidRootPart.CFrame *= CFrame.new(0,55555555555,0)
        end)

        Spawn:Connect(function(char)
            local scroll = library.flags['VisualsCharChanger_Chars']
            if not library.flags['VisualsCharChanger'] or scroll.Scroll == 'None' then 
                return
            end
            

            if scroll.Dropdown == 'Custom Characters' then
                ChangeCharacter(chars1:FindFirstChild(scroll.Scroll),char)
            elseif scroll.Dropdown == 'Custom Characters 2' then
                ChangeCharacter(chars2:FindFirstChild(scroll.Scroll),char)
            else
                ChangeCharacter(chars3:FindFirstChild(scroll.Scroll),char)
            end
        end)
    end
    do -- sky chnager
        local sky = Tabs.Visuals:Section{Name = 'Sky Chnager',Side = 'Right'}
        local skyboxes = {
            ["Purple Nebula"] = {
                ["SkyboxBk"] = "rbxassetid://159454299",
                ["SkyboxDn"] = "rbxassetid://159454296",
                ["SkyboxFt"] = "rbxassetid://159454293",
                ["SkyboxLf"] = "rbxassetid://159454286",
                ["SkyboxRt"] = "rbxassetid://159454300",
                ["SkyboxUp"] = "rbxassetid://159454288"
            },
            ["Night Sky"] = {
                ["SkyboxBk"] = "rbxassetid://12064107",
                ["SkyboxDn"] = "rbxassetid://12064152",
                ["SkyboxFt"] = "rbxassetid://12064121",
                ["SkyboxLf"] = "rbxassetid://12063984",
                ["SkyboxRt"] = "rbxassetid://12064115",
                ["SkyboxUp"] = "rbxassetid://12064131"
            },
            ["Pink Daylight"] = {
                ["SkyboxBk"] = "rbxassetid://271042516",
                ["SkyboxDn"] = "rbxassetid://271077243",
                ["SkyboxFt"] = "rbxassetid://271042556",
                ["SkyboxLf"] = "rbxassetid://271042310",
                ["SkyboxRt"] = "rbxassetid://271042467",
                ["SkyboxUp"] = "rbxassetid://271077958"
            },
            ["Morning Glow"] = {
                ["SkyboxBk"] = "rbxassetid://1417494030",
                ["SkyboxDn"] = "rbxassetid://1417494146",
                ["SkyboxFt"] = "rbxassetid://1417494253",
                ["SkyboxLf"] = "rbxassetid://1417494402",
                ["SkyboxRt"] = "rbxassetid://1417494499",
                ["SkyboxUp"] = "rbxassetid://1417494643"
            },
            ["Setting Sun"] = {
                ["SkyboxBk"] = "rbxassetid://626460377",
                ["SkyboxDn"] = "rbxassetid://626460216",
                ["SkyboxFt"] = "rbxassetid://626460513",
                ["SkyboxLf"] = "rbxassetid://626473032",
                ["SkyboxRt"] = "rbxassetid://626458639",
                ["SkyboxUp"] = "rbxassetid://626460625"
            },
            ["Fade Blue"] = {
                ["SkyboxBk"] = "rbxassetid://153695414",
                ["SkyboxDn"] = "rbxassetid://153695352",
                ["SkyboxFt"] = "rbxassetid://153695452",
                ["SkyboxLf"] = "rbxassetid://153695320",
                ["SkyboxRt"] = "rbxassetid://153695383",
                ["SkyboxUp"] = "rbxassetid://153695471"
            },
            ["Elegant Morning"] = {
                ["SkyboxBk"] = "rbxassetid://153767241",
                ["SkyboxDn"] = "rbxassetid://153767216",
                ["SkyboxFt"] = "rbxassetid://153767266",
                ["SkyboxLf"] = "rbxassetid://153767200",
                ["SkyboxRt"] = "rbxassetid://153767231",
                ["SkyboxUp"] = "rbxassetid://153767288"
            },
            ["Neptune"] = {
                ["SkyboxBk"] = "rbxassetid://218955819",
                ["SkyboxDn"] = "rbxassetid://218953419",
                ["SkyboxFt"] = "rbxassetid://218954524",
                ["SkyboxLf"] = "rbxassetid://218958493",
                ["SkyboxRt"] = "rbxassetid://218957134",
                ["SkyboxUp"] = "rbxassetid://218950090"
            },
            ["Redshift"] = {
                ["SkyboxBk"] = "rbxassetid://401664839",
                ["SkyboxDn"] = "rbxassetid://401664862",
                ["SkyboxFt"] = "rbxassetid://401664960",
                ["SkyboxLf"] = "rbxassetid://401664881",
                ["SkyboxRt"] = "rbxassetid://401664901",
                ["SkyboxUp"] = "rbxassetid://401664936"
            },
        }
        if Lighting:FindFirstChildWhichIsA('Sky') then
            local s = Lighting:FindFirstChildWhichIsA('Sky')
            skyboxes['Original'] = {
                ['SkyboxBk'] = s.SkyboxBk,
                ['SkyboxDn'] = s.SkyboxDn,
                ['SkyboxFt'] = s.SkyboxFt,
                ['SkyboxLf'] = s.SkyboxLf,
                ['SkyboxRt'] = s.SkyboxRt,
                ['SkyboxUp'] = s.SkyboxUp
            }
        end
        local skyboxesNames = {'Original'} -- fucks with order so original is the first one
        for name,sky in pairs(skyboxes) do
            if table.find(skyboxesNames,name) then continue end
            table.insert(skyboxesNames,name)
        end
        sky:Toggle{Name = 'Enabled',Flag = 'VisualsSkyEnabled',Callback = function(toggle)
            if not Lighting:FindFirstChildWhichIsA('Sky') then return end
            local s = Lighting:FindFirstChildWhichIsA('Sky')
            for indx,id in pairs(skyboxes[(toggle and library.flags['VisualSkyChoice'] or 'Original')]) do
                s[indx] = id
            end
        end}
        sky:Dropdown{Name = 'Sky',Flag = 'VisualSkyChoice',Options = skyboxesNames,Min = 1,Max = 1,Default = 'Original',callback = function(dropdown)
            if not Lighting:FindFirstChildWhichIsA('Sky') then return end
            local s = Lighting:FindFirstChildWhichIsA('Sky')
            for indx,id in pairs(skyboxes[library.flags['VisualsSkyEnabled'] and dropdown or 'Original']) do
                s[indx] = id
            end
        end}
        library:Connect(Lighting.ChildAdded,function(child)
            task.wait()
            if child:IsA('Sky') then
                if not (library.flags['VisualsSkyEnabled']) then return end
                for indx,id in pairs(skyboxes[library.flags['VisualSkyChoice']]) do
                    child[indx] = id
                end 
            end
        end)
    end
    do-- custom sounds
        local killsounds = {
            Original = 'rbxassetid://2868331684',
            Skeet = "rbxassetid://5447626464",
            Neverlose = 'rbxassetid://5043539486' ,
            Rust = "rbxassetid://5043539486",
            Bag = "rbxassetid://364942410",
            Baimware = "rbxassetid://6607339542",
            Osu = "rbxassetid://7149919358",
            Tf2 = "rbxassetid://296102734",
            ['Tf2 pan'] = "rbxassetid://3431749479",
            M55solix = "rbxassetid://364942410",
            Slap = "rbxassetid://4888372697",
            ['1'] = "rbxassetid://7349055654",
            Minecraft = "rbxassetid://7273736372",
            Jojo = "rbxassetid://6787514780",
            Vibe = "rbxassetid://1848288500",
            Supersmash = "rbxassetid://2039907664",
            Epic = "rbxassetid://7344303740",
            Retro = "rbxassetid://3466984142",
            Quek = "rbxassetid://4868633804",
            SEMI = "rbxassetid://7791675603",
        }
        local path = ReplicatedStorage.Shared.Assets.Sounds.KillSound

        local soundNames = {}
        for name,id in pairs(killsounds) do
            table.insert(soundNames,name)
        end

        local customSounds = Tabs.Visuals:Section{Name = 'Custom Sounds',Side = 'Right'}
        customSounds:Toggle{Name = 'Kill Sound',Flag = 'CustomKillSound',Callback = function(toggle)
            if not library.flags['CustomKillSoundChoice'] then return end
            local choice = toggle and library.flags['CustomKillSoundChoice'] or 'Original'
            path.SoundId = killsounds[choice]
            path.Volume = library.flags['CustomKillSoundVolume']
            path.PlaybackSpeed = choice == 'Original' and 1.25 or library.flags['CustomKillSoundVolume']
        end}
        customSounds:Dropdown{Name = 'Sound Type',Flag = 'CustomKillSoundChoice',Options = soundNames,Default = 'Original',Min=1,Max=1,Callback = function(dropdown)
            local choice = library.flags['CustomKillSound'] and dropdown or 'Original'
            path.SoundId = killsounds[choice]
            path.Volume = library.flags['CustomKillSoundVolume']
            path.PlaybackSpeed = choice == 'Original' and 1.25 or 1
        end}
        customSounds:Slider{Name = 'Volume',Flag = 'CustomKillSoundVolume',Min = 0.1,Max = 3,Float = 0.01,Default = 0.2,callback = function(value)
            path.Volume = library.flags['CustomKillSoundVolume']
        end}
        customSounds:Button{Name = 'Test Sound',Callback = function()
            path:Play()
        end}
    end
end


do--esp
    local a = Tabs.Esp:Section{Name = 'Settings',Side = 'Left'}
    a:Toggle{Name = 'Enabled',Flag = 'ESPEnabled'}
    a:Slider{Name = 'Max Distance',Flag = 'EspDistance',min = 1,max = 5000}

    local outoffov = Tabs.Esp:Section{Name = 'Out Of Fov',Side = 'Left'}
    outoffov:Toggle({Name = 'Enabled',Flag = 'ESPOutOfFov'}):ColorPicker{Flag = 'ESPOutOfFovColor',Default = Color3.fromRGB(255,255,255)}
    outoffov:Slider{Name= 'Size',Flag = 'ESPOutOfFovSize',Min=10,Max=15,Default=15}
    outoffov:Slider{Name= 'Offset',Flag = 'ESPOutOfFovOffset',Min=100,Max=700,Default=500}
    outoffov:Dropdown{Name = 'Settings',Flag = 'EspOutOfFovSettings',Options = {'Outline','Blinking'},Max=2,Min=0}

    local esp = Tabs.Esp:Section{Name = 'ESP',Side = 'Right'}
    local box = esp:Toggle{Name = 'Show Bounding Box',Flag = 'EspBox'}
    box:ColorPicker{Flag = 'EspBoxColorInner',Default    = Color3.fromRGB(255,255,255)}
    box:ColorPicker{Flag = 'EspBoxColorOuter',Default = Color3.fromRGB(0,0,0)}

    local name = esp:Toggle{Name = 'Show Name',Flag = 'EspName'}
    name:ColorPicker{Flag = 'EspNameColorInner',Default = Color3.fromRGB(255,255,255)}
    name:ColorPicker{Flag = 'EspNameColorOuter',Default = Color3.fromRGB(0,0,0)}

    local healthbar = esp:Toggle{Name = 'Show Health Bar',Flag = 'EspBar'}
    healthbar:ColorPicker{Flag = 'EspBarMax',Default = Color3.fromRGB(0,255,0)}
    healthbar:ColorPicker{Flag = 'EspBarMin',Default = Color3.fromRGB(255,0,0)}
    healthbar:ColorPicker{Flag = 'EspBarOutline',Default = Color3.fromRGB(0,0,0)}

    esp:Dropdown{Name = 'Health Bar Color',Flag = 'EspBarColor',Options = {
        'Solid',
        'Dynamic',
    },Default = 'Solid',Max = 1,Min = 1}
    esp:Dropdown{Name = 'Health Bar Side',Flag = 'EspBarSide',Options = {
        'Right',
        'Left',
    },Default = 'Right',Max = 1,Min = 1}

    local health = esp:Toggle{Name = 'Show Health',Flag = 'EspHealth'}
    health:ColorPicker{Flag = 'EspHealthMax',Default = Color3.fromRGB(0,255,0)}
    health:ColorPicker{Flag = 'EspHealthMin',Default = Color3.fromRGB(255,0,0)}
    health:ColorPicker{Flag = 'EspHealthOutline',Default = Color3.fromRGB(0,0,0)}

    esp:Dropdown{Name = 'Health Text Color',Flag = 'EspHealthColor',Options = {
        'Solid',
        'Dynamic',
    },Max = 1,Min = 1,Default = 'Solid'}    
    esp:Dropdown{Name = 'Health Text Side',Flag = 'EspHealthSide',Options = {
        'Right',
        'Left',
    },Default = 'Right',Max = 1,Min = 1}

    local indicators = esp:Toggle{Name = 'Show Indicators',Flag = 'EspIndicator'}
    indicators:ColorPicker{Flag = 'EspIndicatorColor',Default = Color3.fromRGB(255,255,255)}

    esp:Dropdown{Name = 'Indicators',Flag = 'EspIndicators',Options = {
        'Weapon',
        'Distance',
    },Max = 999}


    local EspUtility = {
        Default = {
            Square = {  
                Visible = true,
                Color = Color3.fromRGB(255,255,255),
                Thickness = 1
            },
            Triangle = {
                Color = Color3.fromRGB(255, 255, 255),
                Filled = true,
                Visible = false,
                Thickness = 1
            },
            Text = {
                Size = 13,
                Center = true,
                Outline = true,
                Font = Drawing.Fonts.Plex,
                Color = Color3.fromRGB(255, 255, 255),
                Visible = true        
            }
        },
        Players = {},
        Data = {
            HealthBar = {
                Left   = function(pos,size) return pos - Vector2.new(10,-size.Y)      end,
                Right  = function(pos,size) return pos + Vector2.new(size.x+5,size.Y) end
            },
            Health = {
                Left  = function(pos,size,bound) return Vector2.new(pos.X+size.X+bound.X-8,pos.Y) end,
                Right = function(pos,size,bound) return pos + Vector2.new(size.X+bound.X/2+8,0)             end,
            },
        }    
    }
    function EspUtility:Draw(type,newargs)    
        local args    = EspUtility.Default[type] or {}
        local newargs = newargs or {}
        local drawing = Drawing.new(type)
        for i,v in pairs(args) do
            drawing[i] = v
        end
        for i,v in pairs(newargs) do
            drawing[i] = v
        end
        return drawing
    end
    local function AddPlayer(plr)
        if plr == LocalPlayer then return end
        EspUtility.Players[plr.Name] = {
            Box              = EspUtility:Draw('Square',{ZIndex = 2}),
            BoxOutline       = EspUtility:Draw('Square',{Color = Color3.new(0,0,0),Thickness =3}),
            Healthbar        = EspUtility:Draw('Square',{ZIndex = 2,Filled = true}),
            HealthbarOutline = EspUtility:Draw('Square',{Filled = true,Color = Color3.new()}),
            
            Health           = EspUtility:Draw('Text', {ZIndex=3}),
            Name             = EspUtility:Draw('Text'),
            Distance         = EspUtility:Draw('Text'),
            Tool             = EspUtility:Draw('Text'),
            Offscreen        = EspUtility:Draw('Triangle')
        }
    end
    for i,v in pairs(Players:GetPlayers()) do
        AddPlayer(v)
    end
    library:Connect(Players.PlayerAdded,AddPlayer)
    library:Connect(Players.PlayerRemoving,function(plr)
        if EspUtility.Players[plr.Name] then
            for i,v in pairs(EspUtility.Players[plr.Name]) do
                if v then v:Remove() end
                v = nil
            end
            EspUtility.Players[plr.Name] = nil
        end
    end)

    local function lerp(a,b,t)
        return a+(b-a)*t
    end
    local function Rotate(point, center, angle)
        angle = math.rad(angle)
        local rotatedX =
            math.cos(angle) * (point.X - center.X) - math.sin(angle) * (point.Y - center.Y) + center.X
        local rotatedY =
            math.sin(angle) * (point.X - center.X) + math.cos(angle) * (point.Y - center.Y) + center.Y

        return Vector2.new(math.floor(rotatedX), math.floor(rotatedY))
    end
    
    library:Connect(game.RunService.Stepped,function()
        for i,v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild('HumanoidRootPart') then
                local drawings = EspUtility.Players[v.Name]
                if not drawings then continue end
                local root         = v.Character.HumanoidRootPart        
                local pos,onscreen = Camera:WorldToViewportPoint(root.CFrame.p)
                if library.flags['ESPEnabled'] and Framework:GetDistance(LocalPlayer,v) <= library.flags['EspDistance'] then
                    if not onscreen then
                        for i,v in pairs(drawings) do
                            if i ~= 'Offscreen' and v    then
                                v.Visible = false
                            end
                        end
                        local RootPos = root.Position
                        local CameraVector = Camera.CFrame.Position
                        local LookVector = Camera.CFrame.LookVector
        
                        local Dot = LookVector:Dot(root.Position - Camera.CFrame.Position)
                        if Dot <= 0 then
                            RootPos = (CameraVector + ((root.Position - CameraVector) - ((LookVector * Dot) * 1.01)))
                        end
        
                        local ScreenPos, OnScreen = Camera:WorldToScreenPoint(RootPos)
                        if not OnScreen then
                            local Drawing = drawings.Offscreen
                            local FOV = 800 - library.flags['ESPOutOfFovOffset']
                            local Size = library.flags['ESPOutOfFovSize']
        
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
        
                            local Rotation = math.floor(-math.deg(Radian)) - 47
                            Drawing.PointA = Rotate(Point + Vector2.new(Size, Size), Point, Rotation)
                            Drawing.PointB = Rotate(Point + Vector2.new(-Size, -Size), Point, Rotation)
                            Drawing.PointC = Rotate(Point + Vector2.new(-Size, Size), Point, Rotation)
                            Drawing.Color = library.flags['ESPOutOfFovColor'].Color
                            Drawing.Filled = not table.find(library.flags['EspOutOfFovSettings'], "Outline")
                            if table.find(library.flags['EspOutOfFovSettings'], "Blinking") then
                                Drawing.Transparency = (math.sin(tick() * 5) + 1) / 2
                            else
                                Drawing.Transparency = 1-library.flags['ESPOutOfFovColor'].Transparency
                            end
        
                            Drawing.Visible = library.flags['ESPOutOfFov']
                        end
                    else
                        drawings.Offscreen.Visible = false
                        local Size = (Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(root.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                        local BoxSize = Vector2.new(Size*1.5,Size*1.9)
                        local BoxPos = Vector2.new(pos.X - Size*1.5 / 2, (pos.Y - Size*1.6 / 2))
                        drawings.Box.Size     = BoxSize
                        drawings.Box.Position = BoxPos
                        drawings.Box.Color    = library.flags['EspBoxColorInner'].Color
                        drawings.Box.Visible = library.flags['EspBox']
                        
                        drawings.BoxOutline.Size     = BoxSize
                        drawings.BoxOutline.Position = BoxPos
                        drawings.BoxOutline.Color = library.flags['EspBoxColorOuter'].Color
                        drawings.BoxOutline.Visible = library.flags['EspBox']
                        
                        local bottom = Vector2.new(BoxPos.X,BoxPos.Y+BoxSize.Y)
                        local health = v.Character.Humanoid.Health
                        local maxhealth = v.Character.Humanoid.MaxHealth

                        drawings.Healthbar.Visible  = library.flags['EspBar']
                        drawings.Healthbar.Position = EspUtility.Data.HealthBar[library.flags['EspBarSide']](BoxPos,BoxSize)
                        drawings.Healthbar.Size     = Vector2.new(5,lerp(0,-BoxSize.Y,health/maxhealth))
                        if library.flags['EspBarColor'] == 'Dynamic' then
                            drawings.Healthbar.Color = library.flags['EspBarMin'].Color:lerp(library.flags['EspBarMax'].Color,health/maxhealth)
                        else
                            drawings.Healthbar.Color = library.flags['EspBarMax'].Color
                        end

                        drawings.HealthbarOutline.Visible  = library.flags['EspBar']
                        drawings.HealthbarOutline.Position = drawings.Healthbar.Position - Vector2.new(1,-1)
                        drawings.HealthbarOutline.Size     = Vector2.new(7,-(BoxSize.Y+2))
                        drawings.HealthbarOutline.Color = library.flags['EspBarOutline'].Color
                        
                        drawings.Health.Visible  = library.flags['EspHealth']
                        drawings.Health.Text     = tostring(math.floor((health/maxhealth*100)*10)/10)
                        drawings.Health.Position = EspUtility.Data.Health[library.flags['EspHealthSide']](BoxPos,BoxSize,drawings.Health.TextBounds)
                        if library.flags['EspHealthColor'] == 'Dynamic' then
                            drawings.Health.Color = library.flags['EspHealthMin'].Color:lerp(library.flags['EspHealthMax'].Color,health/maxhealth)
                        else
                            drawings.Health.Color = library.flags['EspHealthMax'].Color
                        end
                        drawings.Health.OutlineColor = library.flags['EspHealthOutline'].Color
                        
                        drawings.Name.Visible   = library.flags['EspName']
                        drawings.Name.Position  = BoxPos+Vector2.new(BoxSize.X/2,-15)
                        drawings.Name.Text      = v.Name
                        drawings.Name.Color     = library.flags['EspNameColorInner'].Color
                        drawings.Name.OutlineColor = library.flags['EspNameColorOuter'].Color
                        
                        
                        if library.flags['EspIndicator'] then
                            
                            local offset = 5

                            drawings.Distance.Visible  = table.find(library.flags['EspIndicators'],'Distance') and true or false
                            drawings.Distance.Position = bottom+Vector2.new(BoxSize.X/2,offset)
                            drawings.Distance.Text     = '0 studs'
                            drawings.Distance.Color    = library.flags['EspIndicatorColor'].Color
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                                drawings.Distance.Text = tostring(math.floor((LocalPlayer.Character.HumanoidRootPart.Position-v.Character.HumanoidRootPart.Position).Magnitude*100)/100)..' studs'
                            end

                            offset += table.find(library.flags['EspIndicators'],'Distance') and 15 or 0
                            
                            drawings.Tool.Visible  = table.find(library.flags['EspIndicators'],'Weapon') and true or false
                            drawings.Tool.Position = bottom+Vector2.new(BoxSize.X/2,offset)
                            drawings.Tool.Text     = tostring(v.Character:FindFirstChildWhichIsA'Tool' or 'None')
                            drawings.Tool.Color    = library.flags['EspIndicatorColor'].Color
                            
                            offset += table.find(library.flags['EspIndicators'],'Weapon') and 15 or 0
                        end
                    end
                else
                    for i,v in pairs(drawings) do
                        v.Visible = false
                    end
                end
            elseif EspUtility.Players[v.Name] then
                for i,v in pairs(EspUtility.Players[v.Name]) do
                    v.Visible = false
                end                
            end
        end
    end)
end



library:LoadSettingsTab()