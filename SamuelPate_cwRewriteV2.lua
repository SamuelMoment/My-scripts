local BeforeLoad = tick()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game.ReplicatedStorage
local RunService = game.RunService

--[[ BYPASS ]]--
do
    for i,v in pairs(getgc(true)) do
        if typeof(v) ~= 'table' then continue end
        if rawget(v, 'getIsBodyMoverCreatedByGame') then
            v.getIsBodyMoverCreatedByGame = function()
                return true
            end
        end
        if rawget(v, 'connectCharacter') then
             v.connectCharacter = function() return wait(9e9) end
        end
    end
	local old_namecall;old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
		local args = {...}
		local method = getnamecallmethod()
		if method:lower() == 'kick' then return end
		if tostring(self) == 'BAC' then return end
		if tostring(self) == 'ExportClientErrors' then return end
		return old_namecall(self,unpack(args))
	end))
    for i,v in pairs(getreg()) do -- anti sanity checks
        if not (type(v) == 'thread') then continue end
        
        local source = debug.info(v,1,'s')
        if source and source:sub(-18,-1) == 'SanityChecksClient' then
            task.cancel(v)
        end
    end
    if LocalPlayer.Character then
        for i,v in pairs(getconnections(LocalPlayer.Character:WaitForChild('Humanoid'):GetPropertyChangedSignal('WalkSpeed'))) do
            v:Disable()
        end
    end
end

local library,Signal = loadstring(game:HttpGet('https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/libraryV2.lua'))()

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
    IsAlive = function(self,plr)
        local plr = plr or LocalPlayer

        return (plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (plr.Character:FindFirstChildWhichIsA('Tool') or plr.Backpack:FindFirstChildWhichIsA('Tool')))
    end,
    IsDown = function(self,plr)
        local plr = plr or LocalPlayer

        return self:GetState(plr).down.isDowned or (plr.Character and plr.Character:FindFirstChildWhichIsA('Humanoid') and plr.Character.Humanoid.Health <= 15)
    end,
    GetMelee = function(self)
        if self:IsAlive() then
            local tool = LocalPlayer.Character:FindFirstChildWhichIsA('Tool')
            if tool and tool:FindFirstChild('Hitboxes') then
                return tool
            end
        end
        return nil
    end,
    GetRemoteHandler = function(self,name)
        return Remotes[name]
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
    end
}

library:init{Folder = 'SamuelPaste_CW'}
local Tabs = {
    Rage = library:Tab('Rage'),
    Legit = library:Tab('Legit'),
    Visuals = library:Tab('Visual'),
    Misc = library:Tab('Misc')
}

local Spawn = Signal.new()
local Died = Signal.new()
local KillFeed = Signal.new()
do -- signals set up
    local reducer = Framework:GetReducerOf('KILL_FEED_LIST_ADD')
    local old = reducer.KILL_FEED_LIST_ADD
    reducer.KILL_FEED_LIST_ADD = function(tab,_)
        KillFeed:Fire(tab.characterThatKilled,tab.characterThatDied,tab.charactersWhoAssisted)
        return old(tab,_)
    end
    
    local func = Framework:GetCallbacks('SpawnCharacter')[1]
    local old;old = replaceclosure(func, function(...)
        local returns = {old(...)}    
        Spawn:Fire(LocalPlayer.Character)
        return unpack(returns)
    end)
end
do -- RAGE --
    local kaSection = Tabs.Rage:Section{Name = 'Killaura',Side = 'Left'}
    kaSection:Toggle{Name = 'Enabled',Flag = 'RageKillaura'}
    kaSection:Slider{Name = 'Distance',Flag = 'RageKillauraDistance',min = 1,max = 13}
    kaSection:Dropdown{Name = 'Priority',Flag = 'RageKillauraPriority',Options = {'Distance','Health'},Min = 1,Max = 1}
    kaSection:Dropdown{Name = 'Kill Downed Players',Flag = 'RageKillauraDowned',options = {'Regular','Finish'},Min = 0,Max = 1}
    coroutine.wrap(function()
        local running = false
        local running2 = false
        library:Connect(RunService.RenderStepped,function()
            if running2 then return end
            if library.flags['RageKillauraDowned'] ~= 'Finish' then return end
            local Weapon = Framework:GetMelee()
            if not Weapon then return end
            local closests = Framework:GetClosests(library.flags['RageKillauraDistance'])
            if #closests == 0 then return end

            running2 = true
            for i2,plr in pairs(closests) do
                if Weapon.Parent ~= LocalPlayer.Character then break end
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
                
                Framework:FireServer("MeleeFinish",unpack(args)) 
                Framework:FireServer("StopMeleeFinish",Weapon)
            end
            running2 = false
        end)

        library:Connect(RunService.Stepped,function()
            if running then return end
            local weapon = Framework:GetMelee() --it also checks if ur alive
            if not weapon then return end

            local closests = Framework:GetClosests(library.flags['RageKillauraDistance'])
            if #closests == 0 then return end
            if library.flags['RageKillauraPriority'] == 'Health' then
                table.sort(closests,function(plr1,plr2)
                    return plr1.Character.Humanoid.Health < plr2.Character.Humanoid.Health
                end)
            end

            running = true
            for i = 1,3 do	
                Framework:FireServer('MeleeSwing',weapon,i)
                task.wait(.1)
                for _,v in pairs(closests) do
                    if weapon.Parent ~= LocalPlayer.Character then break end
                    local part = v.Character:FindFirstChild('Torso') or v.Character:FindFirstChild('Head') or v.Character.PrimaryPart
                    if not part then continue end
                    if Framework:IsDown(v) and library.flags['RageKillauraDowned'] ~= 'Regular' then continue end
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
            end
            running = false
        end)
    end)()
end
local LoopFuncs = {}
local Types = {
    Callback = {
        ['SetValue'] = function(callback,boolean)
            local hook = callback.HookValue
            if callback.Callback then
                callback:Callback(boolean)
                if not hook then return end
            end
            if boolean then -- if hooked value is false/original value is false it's gonna get original value instead, so theres if condition
                hook[1][hook[2]] = callback.Value
            else
                hook[1][hook[2]] = callback.OriginalValue
            end
        end,
    },
    Once = {
        ['HookReducer'] = function(callback,flag) -- technically it's overwriting but who gives a shit
            if typeof(callback.Reducer) == 'table' then
                for i,v in pairs(callback.Reducer) do
                    local reducer = Framework:GetReducerOf(v)
                    local old = reducer[v]
                    reducer[v] = function(...)
                        if library.flags[flag] then
                            select(2,...).payload  = callback.Value[i]
                        end
                        return old(...)
                    end
                end
            else
                local reducer = Framework:GetReducerOf(callback.Reducer)
                local old = reducer[callback.Reducer];
                reducer[callback.Reducer] =  function(...)
                    if library.flags[flag] then
                        select(2,...).payload  = callback.Value
                    end
                    return old(...)
                end
            end
        end,
        ['SetValue'] = function(callback,flag)
            if callback.CallOnSpawn then
                Spawn:Connect(function()
                    local hook = callback.HookValue
                    if callback.Callback then
                        callback:Callback(library.flags[flag])
                        if not hook then return end
                    end
                    if library.flags[flag]   then -- if hooked value is false/original value is false it's gonna get original value instead, so theres if condition
                        hook[1][hook[2]] = callback.Value
                    else
                        hook[1][hook[2]] = callback.OriginalValue
                    end
                end)
            end
        end,
        ['Loop'] = function(callback,flag)
            table.insert(LoopFuncs,{callback,flag})
        end
    }
}
local miscSetUp = { -- here comes the funny
    [{Name = 'Character Exploits',Side = 'Left'}] = {
        {
            Name = 'No Jump Cooldown',
            Flag = 'NJC',
            Callback = {
                Type = 'SetValue',
                Value = 0,
                HookValue = {Framework:GetModule('JumpConstants'),'JUMP_DELAY_ADD'},
                OriginalValue = 1
            }
        },
        {
            Name = 'No Fall Damage',
            Tooltip = 'Instead of disabling fall damage, It disables fall handler completely.',
            Flag = 'NJC',
            Callback = {
                Type = 'SetValue',
                Value = true,
                HookValue = {Framework:GetState().fallDamageClient,'isDisabled'},
                OriginalValue = false
            }
        },
        {
            Name = 'No Dash Cooldown',
            Flag = 'NDC',
            Callback = {
                Type = {'SetValue','Loop'},
                Value = 0,
                OriginalValue = 3,
                HookValue = {Framework:GetModule('DashConstants'),'DASH_COOLDOWN'},

                Callback = function(self,flag)
                    local state = Framework:GetState()
                    if state and flag then
                        state.dashClient.isDashing = false
                    end
                end
            }
        },

        {
            Name = 'Infinite Stamina',
            Flag = 'InfStam',
            Callback = {
                Type = 'SetValue',
                Callback = function(self,b)
                    local value = b and 1000000 or 115
                    local stamina = Framework:GetModule('DefaultStaminaHandlerClient').getDefaultStamina()
                    if stamina and (b or stamina:getMaxStamina() == 1000000)  then
                        rawset(stamina,'_maxStamina',value)
                        rawset(stamina,'_stamina',value)
                    end
                end,
                CallOnSpawn = true
            }
        },
        {
            Name = 'Infinite Air',
            Flag = 'InfAir',
            Tooltip = 'Infinite air in water.',
            Callback = {
                Type = 'SetValue',
                Callback = function(self,b)
                    local value = b and 1000000 or 100
                    local air = getupvalue(Framework:GetModule('AirHandlerClient')._startModule,2)
                    if air and (b or air:getMaxStamina() == 1000000)  then
                        rawset(air,'_maxStamina',value)
                        rawset(air,'_stamina',value)
                    end
                end,
                CallOnSpawn = true
            }
        },
    },
    [{Name = 'Character Exploits',Side = 'Right'}] = {
        {
            Name = 'WalkSpeed',
            Flag = 'Walkspeed',
            Slider = {Name = 'Speed',Min = 1,Max = 75,Default = 16,Flag = 'WalkSpeed_slider'},
            Callback = {
                Type = {'SetValue','Loop'},
                Callback = function(self,b)
                    if Framework:IsAlive() and not b then
                        LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').WalkSpeed = 16
                    end
                end,
                LoopCallback = function(self,b)
                    if Framework:IsAlive() and b then
                        LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').WalkSpeed = library.flags['WalkSpeed_slider']
                    end
                end
            }
        },
        {
            Name = 'JumpPower',
            Flag = 'Jumppower',
            Slider = {Name = 'Power',Min = 1,Max = 250,Default = 50,Flag = 'JumpPower_slider'},
            Callback = {
                Type = {'SetValue','Loop'},
                Callback = function(self,b)
                    if Framework:IsAlive() and not b then
                        LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').JumpPower = 50
                    end
                end,
                LoopCallback = function(self,b)
                    if Framework:IsAlive() and b then
                        LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').JumpPower = library.flags['JumpPower_slider']
                    end
                end
            }
        }
    }
}
for section,toggles in pairs(miscSetUp) do
    local sector = Tabs.Misc:Section(section)
    for _,settings in pairs(toggles) do
        --------------------
        local toggle = sector:Toggle{Name = settings.Name,Flag = settings.Flag,Tooltip = settings.Tooltip or nil,Callback = function(enabled)
            if Types.Callback[settings.Callback.Type] then
                Types.Callback[settings.Callback.Type](settings.Callback,enabled)
            elseif typeof(settings.Callback.Type) == 'table' then
                for i,v in pairs(settings.Callback.Type) do
                    if Types.Callback[v] then
                        Types.Callback[v](settings.Callback,enabled)
                    end
                end
            end
        end}
        if Types.Once[settings.Callback.Type] then
            Types.Once[settings.Callback.Type](settings.Callback,settings.Flag)
        elseif typeof(settings.Callback.Type) == 'table' then
            for i,v in pairs(settings.Callback.Type) do
                if Types.Once[v] then
                    Types.Once[v](settings.Callback,settings.Flag)
                end
            end
        end
        --------------------
        if settings.Slider then
            sector:Slider(settings.Slider)
        end
    end
end
library:Connect(RunService.Stepped,function()
    if Framework:IsAlive() then
        for i,v in pairs(LoopFuncs) do
            local callback = v[1]
            local flag = v[2]
            local hook = callback.HookValue
            if callback.LoopCallback or callback.Callback then
                local loop = callback.LoopCallback or callback.Callback
                loop(callback,library.flags[flag])
                continue
            end
            if library.flags[flag] then
                hook[1][hook[2]] = callback.Value
            elseif callback.OriginalValue then
                hook[1][hook[2]] = callback.OriginalValue
            end
        end
    end
end)





library:LoadSettingsTab()