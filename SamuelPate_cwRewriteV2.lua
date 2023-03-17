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
                    if not v.Character then continue end
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
    local autokick = Tabs.Rage:Section{Name = 'Auto Kick',Side = 'Right'}
    autokick:Toggle{Name = 'Enabled',Flag = 'RageKick'}
    autokick:Dropdown{Name = 'Ignore When',Flag = 'RageKickIgnore',Max = 99,Min = 0,Options = {'Player is Ragdolled','No Weapon Equipped'}}
    autokick:Slider{Name = 'Distance',Flag = 'RageKickDistance',min = 1,max = 13}
    coroutine.wrap(function()
        local executing = false
        library:Connect(RunService.Stepped,function()
            if executing then return end
            if not Framework:IsAlive() then return end
            if not library.flags['RageKick'] then return end
            if table.find(library.flags['RageKickIgnore'],'No Weapon Equipped') and not Framework:GetWeapon() then return end
            local args = {
                [1] = game:GetService("Players").LocalPlayer.Character.Stomp,
                [3] = game:GetService("Players").LocalPlayer.Character.Stomp.Hitboxes.RightLegHitbox,
            }
            local weapon = LocalPlayer.Character:FindFirstChild('Stomp')
            local hitbox = weapon and weapon.Hitboxes.RightLegHitbox
            if not weapon then return end

            local closests = Framework:GetClosests(library.flags['RageKickDistance'])
            if #closests == 0 then return end
            executing = true
            for i=1,3 do
                Framework:FireServer('MeleeSwing',weapon,i)
                task.wait(.1)
                for i,plr in pairs(closests) do
                    if not Framework:IsAlive(plr) then continue end
                    if not Framework:GetState(plr).parry.isParried then continue end   

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
                    pcall(Framework.FireServer,Framework,"MeleeFinish",unpack(args)) 
                end
            end
            executing = false
        end)
    end)()

end
local function BetterHookFunction(func,newfunc) -- prevents upvalues shit
    return hookfunction(func,function(...)
        return newfunc(...)
    end)
end
do
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
        local value = enabled and 1000000 or 100
        local air = getupvalue(Framework:GetModule('AirHandlerClient')._startModule,2)
        if air and (enabled or air:getMaxStamina() == 1000000)  then
            rawset(air,'_maxStamina',value)
            rawset(air,'_stamina',value)
        end
    end}
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
    charMov:Slider{Name = 'Speed',Min = 1,Max = 75,Default = 16,Flag = 'WalkSpeed_slider'}
    charMov:Toggle{Name = 'JumpPower',Flag = 'Jumppower',Callback = function(enabled)
        if Framework:IsAlive() and not enabled then
            LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').JumpPower = 50
        end
    end}
    charMov:Slider{Name = 'Speed',Min = 1,Max = 250,Default = 50,Flag = 'JumpPower_slider',Callback = function(enabled)
        if Framework:IsAlive() and not enabled then
            LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').JumpPower = 50
        end
    end}
    ------------------------------------------------
    local other = Tabs.Misc:Section{Name = 'Other',Side = 'Right'}
    other:Toggle{Name = 'Unlock All Servers',Flag = 'UnlockServers',Tooltip = 'Allows you to join all servers. Exceptions are beginner servers and vc only.'}

    ------------------------------------------------
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

            
        end
    end)
    ------------------------------------------------
    local oldNamecall;oldNamecall = hookmetamethod(game,'__namecall',function(self,...)
        local args = {...}
        local method = getnamecallmethod()

        if tostring(self) == 'GotHitRE' and library.flags['NoEnvDmg'] then
            return
        end

        return oldNamecall(self,unpack(args))
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
        local old;old = BetterHookFunction(Framework:GetModule('ServerUtilClient').getCanJoinServer,function(...)
            if library.flags['UnlockServers'] then
                return true
            end
            return old(...)
        end)
    end
    ------------------------------------------------
end


library:LoadSettingsTab()