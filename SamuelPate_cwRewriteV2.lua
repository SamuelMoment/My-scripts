local BeforeLoad = tick()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game.ReplicatedStorage
local RunService = game.RunService

local library,Signal = loadstring(game:HttpGet('https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/libraryV2.lua'))()

local events = game:GetService("ReplicatedStorage").Communication.Events
local functions = game:GetService("ReplicatedStorage").Communication.Functions

local Modules = {Name = {},Id = {}}
local Nevermore = require(ReplicatedStorage.Framework.Nevermore)
local NevermoreModules = rawget(Nevermore, '_lookupTable') --credits to snnwer for that
for i,v in pairs(NevermoreModules) do
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

        return self:GetState(plr).down.isDowned
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
    local func = getupvalue(Framework:GetModule('RoduxHandlerClient')._startModule,7)
    local old;old = hookfunction(func,function(killed,assisted,died,...)
        KillFeed:Fire(killed,died,assisted)
        return old(killed,assisted,died,...)
    end)
end

do -- RAGE --
    local kaSection = Tabs.Rage:Section{Name = 'Killaura',Side = 'Left'}
    kaSection:Toggle{Name = 'Enabled',Flag = 'RageKillaura'}
    kaSection:Slider{Name = 'Distance',Flag = 'RageKillauraDistance'}
    kaSection:Dropdown{Name = 'Priority',Flag = 'RageKillauraPriority',Options = {'Distance','Health'},Min = 1,Max = 1}

    coroutine.wrap(function()
        while RunService.Stepped:Wait() do
            local weapon = Framework:GetMelee() --it also checks if ur alive
            if not weapon then return end

            local closests = Framework:GetClosests(library.flags['RageKillauraDistance'])
            if #closests == 0 then return end
            for i = 1,3 do	
                Framework:FireServer('MeleeSwing',weapon,i)
                task.wait(.1)
                for _,v in pairs(closests) do
                    if weapon.Parent ~= LocalPlayer.Character then break end
                    if not v.Character:FindFirstChild('Torso') then continue end

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
                    else
                        continue
                    end
                end
            end
        end
    end)()
end








library:LoadSettingsTab()