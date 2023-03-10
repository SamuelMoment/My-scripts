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
end

local library,Signal = loadstring(game:HttpGet('https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/libraryV2.lua'))()

local events = game:GetService("ReplicatedStorage").Communication.Events
local functions = game:GetService("ReplicatedStorage").Communication.Functions

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
    GetReducer = function(self,type)
        for i,tbl in pairs(Reducers) do
            local index = table.find(tbl,type)
            if index then
                return tbl[index]
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
    FireServer = function(self,name,...)
        local remote = events:FindFirstChild(name)
        if remote then
            remote:FireServer(...)
        end
    end,
}

library:init()
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
    local func = Framework:GetReducer('KILL_FEED_LIST_ADD')
    old = library:HookFunction(function(tab,_)
        print('called')
        KillFeed:Fire(tab.characterThatKilled,tab.characterThatDied,tab.charactersWhoAssisted)
        return old(tab,_)
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
                
                Framework:FireServer('StartMeleeFinish',plr.Character,Weapon) -- needed 
                task.wait(.1)
                local args = {
                    [1] = Weapon,
                    [2] = plr.Character.HumanoidRootPart,
                    [3] = Weapon.Hitboxes.Hitbox,
                    [4] = plr.Character.HumanoidRootPart.Position,
                    [6] = Vector3.new(-0.77, 0, 0.63),
                    [7] = 1,
                    [8] = Vector3.new(0.2, -0.9, -0.3)
                }
                
                Framework:FireServer("MeleeFinish",unpack(args)) 
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
                    if not v.Character:FindFirstChild('Torso') then continue end
                    if Framework:IsDown(v) and library.flags['RageKillauraDowned'] ~= 'Regular' then continue end
                    local args = {
                        [1] = weapon,
                        [2] = v.Character.Torso,
                        [3] = weapon.Hitboxes.Hitbox,
                        [4] = v.Character.Torso.Position,
                        [5] = v.Character.Torso.CFrame:ToObjectSpace(
                            CFrame.new(v.Character.Torso.Position)
                        ),
                        [6] = v.Character.Torso.Position,
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
local Types = {
    Callback = {
        ['SetValue'] = function(callback,boolean)
            local hook = callback.HookValue
            if boolean then -- if hooked value is false/original value is false it's gonna get wrong value otherwise
                hook[1][hook[2]] = callback.Value
            else
                hook[1][hook[2]] = callback.OriginalValue
            end
        end,
    },
    Once = {
        ['HookReducer'] = function(callback,flag)
            old = library:HookFunction(callback.Reducer, function(tab,newValue)
                if library.flags[flag] then
                    newValue = callback.Value
                end
                return old(tab,newValue)
            end)
        end
    }
}
local miscSetUp = { -- here comes the funny
    [{Name = 'Character Exploits',Side = 'Left'}] = {
        {
            Name = 'No Dash Cooldown',
            Flag = 'NDC',
            Callback = {
                Type = 'SetValue',
                Value = 0,
                HookValue = {Framework:GetModule('DashConstants'),'DASH_COOLDOWN'},
                OriginalValue = 3.5
            }
        },

        {
            Name = 'Infinite Stamina',
            Flag = 'InfStam',
            Callback = {
                Type = 'HookReducer',
                Value = 100,
                Reducer = Framework:GetReducer('STAMINA_CLIENT_CURRENT_CHANGE')
            }
        }
    }
}
for section,toggles in pairs(miscSetUp) do
    local sector = Tabs.Misc:Section(section)
    for _,settings in pairs(toggles) do
        local toggle = sector:Toggle{Name = settings.Name,Flag = settings.Flag,Callback = function(enabled)
            if Types.Callback[settings.Callback.Type] then
                Types.Callback[settings.Callback.Type](settings.Callback,enabled)
            end
        end}
        if Types.Once[settings.Callback.Type] then
            Types.Once[settings.Callback.Type](settings.Callback,settings.Flag)
        end
    end
end






library:LoadSettingsTab()