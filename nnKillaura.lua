
if getgenv().loops ~= nil then for i,loop in pairs(loops) do loop:Disconnect() end else getgenv().loops = {} end
local bossList = {
    'Bandit Boss' --i aint doing no research add it urself
}
getgenv().blacklist = {
    'rbxassetid://9638325045',
    'rbxassetid://9638326971',
    'rbxassetid://9638321009',
    'rbxassetid://9678210273',
    'rbxassetid://9432068539',
    'rbxassetid://11993046220'
}
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local path = game:GetService("Workspace").Terrain.World.TargetFilter.Characters.Enemys

local target,cooldown
local IsAlive = function()
    return (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')) and true or false
end
local IsRagdolled = function(char)
    local boolean = char:FindFirstChild('RagdollBol')
    return boolean ~= nil and boolean.Value
end
local MainLoop = function()
    local bosses = {}
    for i,v in pairs(bossList) do
        if path:FindFirstChild(v) then
            table.insert(bosses,path:FindFirstChild(v))
        end
    end
    --comparing distance
    table.sort(bosses,function(a,b)
        if not (a and b) then return false end -- idk how it's gonna react to nil LOL
        local hrp = a:FindFirstChild('HumanoidRootPart')
        local hrp2 = b:FindFirstChild('HumanoidRootPart')
        if not (hrp and hrp2) then return false end
        local hrp3 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
        if not hrp3 then return false end
        return (hrp3.Position-hrp.Position).Magnitude < (hrp3.Position-hrp2.Position).Magnitude
    end)
    target = bosses[1]
    if not getgenv().loop then
        getgenv().loop = target:FindFirstChildWhichIsA('Humanoid').AnimationPlayed:Connect(function(anim)
            if not table.find(blacklist,tostring(anim.Animation.AnimationId)) then
                print(anim.Animation.AnimationId)
            end
        end)
    end
end
local KillLoop = function()
    if target and IsAlive() and not cooldown then
        local tool = LocalPlayer.Character:FindFirstChildWhichIsA('Tool') or nil
        if not (tool and tool.Name == 'Melee') then return end
        cooldown = true

        local args = {
            [1] = {
                ["TypeInput"] = "Combat",
                ["Type"] = "Click"
            }
        }
            
        game:GetService("ReplicatedStorage").Files.Remotes.SinglePlayers:FindFirstChild(LocalPlayer.Name).InputEvent.inputFunc:InvokeServer(unpack(args))        
        task.delay(0.35,function()
            cooldown = false
        end)
    end
end

local TeleportLoop = function()
    if target and IsAlive() then
        local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA('Tool') or nil
        if not (tool and tool.Name == 'Melee') then return end
        local LastPos = target.HumanoidRootPart.CFrame
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LastPos.X,LastPos.Y+(IsRagdolled(LocalPlayer.Character) and 15 or 5),LastPos.Z)
    end    
end
table.insert(getgenv().loops,game.RunService.Stepped:Connect(MainLoop))
table.insert(getgenv().loops,game.RunService.Stepped:Connect(KillLoop))
table.insert(getgenv().loops,game.RunService.RenderStepped:Connect(TeleportLoop))

if not getgenv().hooked then
    local oldNamecall; oldNamecall = hookmetamethod(game, '__namecall', function(self,...)
        local args = {...}
        local method = getnamecallmethod()
        if tostring(self) == 'inputFunc' and method == 'InvokeServer' and not checkcaller() then return end
        return oldNamecall(self,unpack(args))
    end)
    getgenv().hooked = true
end