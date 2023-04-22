local UserInputService = game:GetService("UserInputService")
local BeforeLoad = tick()

local library,Signal = loadstring(game:HttpGet('https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/libraryV2.lua'))()

library:init{name = 'SpaceWare',Folder = 'SpaceWare/CounterBlox'}

local Tabs = {
    Legit = library:Tab('Legit'),
    Rage = library:Tab('Rage'),
    Visuals = library:Tab('Visual'),
    Skins = library:Tab('Skins'),
    Esp = library:Tab('ESP'),
    Misc = library:Tab('Misc')
}

--// Variables \\--
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local RunService = game.RunService
local ReplicatedStorage = game.ReplicatedStorage
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()
local Events = ReplicatedStorage.Events

--// Functions \\--
local function BetterHookFunction(func,newfunc) -- prevents upvalues shit
    return hookfunction(func,function(...)
        return newfunc(...)
    end)
end

local GetPlayers = Players.GetPlayers
local WorldToViewportPoint = Camera.WorldToViewportPoint
local FindFirstChild = game.FindFirstChild
local Raycast = workspace.Raycast
local FindPartOnRayWithIgnoreList = workspace.FindPartOnRayWithIgnoreList
local FindPartOnRayWithWhitelist = workspace.FindPartOnRayWithWhitelist

--// Exploiting variables \\--
local Client = getsenv(LocalPlayer.PlayerGui.Client)
local Weapons = { -- took them from stormy because i dont want to look for them for 20 minutes
	Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"},
	SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"},
	Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"},
	Sniper = {"AWP", "Scout", "G3SG1"}
}
local DmgMultipliers = { -- took them from stormy because i dont want to spend an hour getting multipliers
    ["Head"] = 4,
    ["FakeHead"] = 4,
    ["HeadHB"] = 4,
    ["UpperTorso"] = 1,
    ["LowerTorso"] = 1.25,
    ["LeftUpperArm"] = 1,
    ["LeftLowerArm"] = 1,
    ["LeftHand"] = 1,
    ["RightUpperArm"] = 1,
    ["RightLowerArm"] = 1,
    ["RightHand"] = 1,
    ["LeftUpperLeg"] = 0.75,
    ["LeftLowerLeg"] = 0.75,
    ["LeftFoot"] = 0.75,
    ["RightUpperLeg"] = 0.75,
    ["RightLowerLeg"] = 0.75,
    ["RightFoot"] = 0.75,
}
local WallModifiers = {
    DiamondPlate = 3,
    CorrodedMetal = 2,
    Metal = 2,
    Concrete = 2,
    Brick = 2,
    Wood = 0.1,
    WoodPlanks = 0.1,
    nowallbang = 100,
	Grate = 0.1,
	Glass = 0.1,
	Cardboard = 0.1
}
local HitPart = Events.HitPart
local DistributedTime = workspace.DistributedTime
local RayIgnore = workspace.Ray_Ignore
local Debris = workspace.Debris

local RageTarget

--// Remotes handler \\--
local BlockedRemotes = {}
local MethodHooks = {}
local InvokeSpoof = {}
local OnRemote = {}

local oldNamecall;oldNamecall = hookmetamethod(game,'__namecall',function(self,...)
    local method = tostring(getnamecallmethod()) -- \0 shit preventer
    local args = {...}
    local sum = select('#',...)
    if BlockedRemotes[tostring(self)] then return end
    if MethodHooks[method] then
        for i,v in pairs(MethodHooks[method]) do
            v(args,checkcaller())
        end
        --return oldNamecall(self,unpack(args))
    end
    if OnRemote[tostring(self)] then
        for i,v in pairs(OnRemote[tostring(self)]) do
            v(args,checkcaller())
        end
    end
    if method == 'InvokeServer' and InvokeSpoof[tostring(self)] then
        for i,v in pairs(InvokeSpoof[tostring(self)]) do
            local success,returned = pcall(v,args)
            if success and returned then
                return returned
            end
        end
    end

    return oldNamecall(self,unpack(args,1,sum))
end)

--------------------------

local Framework = {
    GetClosests = function(self,distance)
        if not (LocalPlayer.Character and FindFirstChild(LocalPlayer.Character,'HumanoidRootPart')) then return end

        local closests = {}
        local magnitudes = {}

        local hrp = LocalPlayer.Character.HumanoidRootPart
        for i,plr in pairs(GetPlayers(Players)) do
            if plr == LocalPlayer then continue end
            if not (plr.Character and FindFirstChild(plr.Character,'HumanoidRootPart')) then continue end

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
    GetClosestToMouse = function(self,fov,visiblecheck) --Camera:WorldToScreenPoint(HumanoidRootPart.Position)
        local from = Vector2.new(Mouse.X,Mouse.Y+36)
        local distance,closest = fov,nil

        for i,v in pairs(GetPlayers(Players)) do
            if v == LocalPlayer then continue end
            if v.Character and FindFirstChild(v.Character,'HumanoidRootPart') then
                local hrp = v.Character.HumanoidRootPart
                local screenPos,visible = WorldToViewportPoint(Camera,hrp.Position)

                if not self:IsVisible(hrp) and visiblecheck then continue end

                local mag = (Vector2.new(screenPos.X,screenPos.Y)-from).Magnitude
                if mag <= distance then
                    distance = mag
                    closest = v
                end
            end
        end
        return closest
    end,
    IsAlive = function(self,plr)
        local plr = plr or LocalPlayer
        return plr.Character and FindFirstChild(plr.Character,'HumanoidRootPart') and FindFirstChild(plr.Character,'UpperTorso')
    end,
    IsVisible = function(self,target,origin)
        local origin = origin or Camera.CFrame.p
        local direction = (target.Position-origin).Unit*9999

        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, target, RayIgnore}
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

        local raycast = Raycast(workspace,origin,direction,raycastParams)
        return not raycast
    end,
    GetDistance = function(self,plr,plr2)
        local pos = (plr.Character and (plr.Character:FindFirstChild('HumanoidRootPart') or plr.Character:FindFirstChild('Torso')) or Camera).CFrame.p
        local part2 = plr2.Character and (plr2.Character:FindFirstChild('HumanoidRootPart') or plr2.Character:FindFirstChild('Torso'))
        if not part2 then
            return 99999
        end
        return (pos-part2.Position).Magnitude
    end,
    GetWeapon = function(self)
        return Client.gun
    end,
    GetWeaponClass = function(self)
        local weapon = tostring(self:GetWeapon())
        if weapon == 'nil' or weapon == 'none' then return '' end
        for name,t in pairs(Weapons) do
            if table.find(t,weapon) then
                return name
            end
        end
        return ''
    end,
    BlockRemote = function(self,remoteName)
        BlockedRemotes[remoteName] = true
    end,
    UnblockRemote = function(self,remoteName)
        BlockedRemotes[remoteName] = false
    end,
    OnMethod = function(self,method,func)
        if not MethodHooks[method] then
            MethodHooks[method] = {}
        end
        table.insert(MethodHooks[method],func or function()end)
    end,
    OnRemote = function(self,name,func)
        if not OnRemote[name] then
            OnRemote[name] = {}
        end
        table.insert(OnRemote[name],func or function() end)
    end,
    SpoofInvoke = function(self,remoteName,func)
        if not InvokeSpoof[remoteName] then
            InvokeSpoof[remoteName] = {}
        end 
        table.insert(InvokeSpoof[remoteName],func or function() end)
    end,
    DeobfuscatePosition = function(self,pos)
        return Vector3.new((pos.X/13 - 1325)/4 + 74312,(pos.Y + 4201432)/4 - 3183421,(pos.Z/2 + 581356)/41)
    end,
    ObfuscatePosition = function(self,pos)
        return Vector3.new(((pos.X - 74312) * 4 + 1325) * 13, (pos.Y + 3183421) * 4 - 4201432, (pos.Z * 41 - 581357) * 2)
    end,
    GetWallModifier = function(self,inst)
        return WallModifiers[tostring(inst.Material)] or WallModifiers[inst.Name] or (inst:FindFirstChild('PartModifier') and inst.PartModifier.Value) or (inst:IsDescendantOf(RayIgnore) or inst:IsDescendantOf(Debris)) and 0 or 1
    end,
    HitPlayer = function(self,part,pos,gunName,range,gunInstance,dmgModifier,isWallbang,normal)
        HitPart:FireServer(part,pos,gunName,range,gunInstance,nil,dmgModifier,range==48,isWallbang,Camera.CFrame.p,DistributedTime.Value,normal,true,nil,nil,nil)
    end,
    CalculateWallbang = function(self,origin,inst,ignorelist,partsList)
        local gun = self:GetWeapon()
        if not gun or gun == 'none' then print('check gun retard') return false end

        local finish = inst.Position
        local direction = CFrame.new(origin,finish).LookVector.unit*4096*0.0694

        local Penetration = gun.Penetration.Value * 0.01
        local WallsHit,limit = 0,0

        local dmgModifier = 1
        local raycasts = 0

        while task.wait() do
            local part,pos,normal = FindPartOnRayWithIgnoreList(workspace,Ray.new(origin,direction),ignorelist,false,true)
            raycasts += 1
            if part and part.Parent then
                local p = Instance.new('Part',workspace)
                p.Size = Vector3.new(0.1,0.1,0.1)
                p.Anchored = true
                p.Position = pos
                p.CanCollide = false
                table.insert(partsList,p)
                table.insert(ignorelist,p)
                --if part == inst then break end
                local WallModifier = self:GetWallModifier(part)
                local _,endPos = FindPartOnRayWithWhitelist(workspace,Ray.new(origin+direction*1,direction*-2),{part},true)

                local p = Instance.new('Part',workspace)
                p.Size = Vector3.new(0.1,0.1,0.1)
                p.Anchored = true
                p.Position = endPos
                p.CanCollide = false
                table.insert(partsList,p)
                table.insert(ignorelist,p)

                local thickness = (endPos-pos).magnitude

                limit = math.min(Penetration,limit+(thickness*WallModifier))
                if WallModifier > 0 then WallsHit += 1 end
                dmgModifier = 1 - limit/Penetration
                table.insert(ignorelist,part)
            end
            if not (part and Penetration > limit and WallsHit < 4 and dmgModifier > 0 and raycasts < 20) then break end
        end
        if WallsHit >= 4 or raycasts >= 20 then
            dmgModifier = 0
        end
        
        return (WallsHit < 4 and Penetration > limit and dmgModifier > 0 and raycasts < 20),dmgModifier
    end
}



local WeaponNames = {
    'Default','Pistol','SMG','Rifle','Sniper'
}
do -- legit
    local legitBot = Tabs.Legit:MultiSection{Side = 'Right'}

    local function AddLegit(name)
        local sector = legitBot:AddSection{Name = name}
        if name ~= 'Default' then
            sector:Toggle{Name = 'Override Default',Flag = 'Legit'..name..'Override'}
        end
        sector:Slider{Name = 'FOV',Flag = 'Legit'..name..'FOV',Min=1,Max=420}
        sector:Dropdown{Name = 'Priority',Min=0,Max=10,Options = {'Closest','Head','Torso'},Default = 'Closest',Flag = 'Legit'..name..'Priority'}
        sector:Slider{Name = 'Hit Chance',Flag = 'Legit'..name..'HitChance',min=1,max=100,default = 100}
    end
    for i,v in pairs(WeaponNames) do
        AddLegit(v)
    end
    local view = Tabs.Legit:Section{Side='Left',Name = 'Legitbot Settings'}
    view:Toggle{Name = 'Silent Aim',Flag = 'LegitSilentAimEnabled'}
    view:Dropdown{Name = 'Weapon View',Options = WeaponNames,Min=1,Max=1,Default=WeaponNames[1],callback = function(t) legitBot:ChangeSection(t) end}
    view:Toggle{Name = 'Visible Check',Flag = 'LegitVisibleCheck'}


    
end



do -- rage
    local main = Tabs.Rage:Section{Name = 'Main',Side = 'Left'}
    main:Dropdown{Name = 'Origin',Flag = 'RageOrigin',Max=1,Min=1,Options = {'Character','Camera'}}
    main:Toggle{Name = 'Enabled',Flag = 'RageEnabled'}
    main:Toggle{Name = 'Auto Wall',Flag = 'RageAutoWall'}
    main:Toggle{Name = 'Force Hit',Flag = 'RageForceHit'}
    local weapons = Tabs.Rage:MultiSection{Side = 'Right'}
    main:Dropdown{Name = 'View Settings',Options = WeaponNames,Max=1,Min=1,Callback = function(t) weapons:ChangeSection(t) end}
    local function AddRage(name)
        local sector = weapons:AddSection{Name = name}
        if name ~= 'Default' then
            sector:Toggle{Name = 'Override Default',Flag = 'Rage'..name..'Override'}
        end
        sector:Dropdown{Name = 'Hitboxes',Min=0,Max=10,Options = {'Head','Torso','Legs'},Flag = 'Rage'..name..'Hitboxes'}
        sector:Slider{Name = 'Min Damage',Flag = 'Rage'..name..'MinDmg',min=1,max=100,default = 100}
    end
    for i,v in pairs(WeaponNames) do
        AddRage(v)
    end

    library:Connect(RunService.RenderStepped,function()
        RageTarget = nil
        if not Framework:IsAlive() then return end
        if not library.flags['RageEnabled'] then return end
        local hitboxes = {}
        local class = Framework:GetWeaponClass()
        if class == '' then return end
        if not library.flags['Rage'..class..'Override'] then
            class = 'Default'
        end
        for _,plr in pairs(Players:GetPlayers()) do
            if plr == LocalPlayer or plr.TeamColor == LocalPlayer.TeamColor then continue end
            if Framework:IsAlive(plr) then
                if table.find(library.flags['Rage'..class..'Hitboxes'],'Head') and plr.Character:FindFirstChild('Head') then
                    table.insert(hitboxes,plr.Character.Head)
                end
                if table.find(library.flags['Rage'..class..'Hitboxes'],'Torso') and plr.Character:FindFirstChild('UpperTorso') then
                    table.insert(hitboxes,plr.Character.UpperTorso)
                    table.insert(hitboxes,plr.Character:FindFirstChild('LowerTorso'))
                end
                if table.find(library.flags['Rage'..class..'Hitboxes'],'Legs') and plr.Character:FindFirstChild('LeftUpperLeg') and plr.Character:FindFirstChild('RightUpperLeg') then
                    table.insert(hitboxes,plr.Character.LeftUpperLeg)
                    table.insert(hitboxes,plr.Character:FindFirstChild('RightUpperLeg'))
                    table.insert(hitboxes,plr.Character:FindFirstChild('RightLowerLeg'))
                    table.insert(hitboxes,plr.Character:FindFirstChild('LeftLowerLeg'))
                end
            end
        end
        local ignoreList = {
            Debris,Camera,RayIgnore,workspace.Map:WaitForChild('Clips'),workspace.Map:WaitForChild('SpawnPoints'),LocalPlayer.Character
        }
        local damage = Client.gun.DMG.Value
        local origin = library.flags['RageOrigin'] == 'Character' and LocalPlayer.Character.UpperTorso.Position or Camera.CFrame.p
        local parts = {}
        for i,v in pairs(hitboxes) do
            if Client.gun ~= 'none' and not Client.gun:FindFirstChild('Melee') and not Client.DISABLED then
                if library.flags['RageAutoWall'] then
                    local penetratable,dmgModifier = Framework:CalculateWallbang(Camera.CFrame.p,v,ignoreList,parts)
                    local realDmg = damage*DmgMultipliers[v.Name]*dmgModifier
                    if penetratable and realDmg >= library.flags['Rage'..class..'MinDmg'] then
                        print(createList(ignoreList))
                        --print(('CASTED TO %s SUCCESSFULLY, RESULTS: Walls Hit: %s, Penetration required: %s, Current Pentration: %s, Raycasts called: %s, Damage modifier: %s'):format(v.Parent.Name,WallsHit,limit,Penetration,raycasts,dmgModifier))
                        RageTarget = v
                        Client.firebullet()
                        RageTarget = nil
                    end
                else
                    if not Framework:IsVisible(v,origin) then continue end
                    local damage = Client.gun.DMG.Value*DmgMultipliers[v.Name]
                    if damage >= library.flags['Rage'..class..'MinDmg'] then
                        RageTarget = v
                        Client.firebullet()
                        RageTarget = nil
                    end
                end
            end
        end
        --garbage collector idk
        table.clear(hitboxes)
        hitboxes = nil
        table.clear(ignoreList)
        ignoreList = nil
        for i,v in pairs(parts) do
            v:Destroy()
        end
    end)
end



do -- visuals
    local thirdperson = Tabs.Visuals:Section{Name = 'Third Person',Side = 'Left'}
    thirdperson:Toggle({Name = 'Enabled',Flag = 'VisualThirdP'}):Keybind()
    thirdperson:Slider{Name = 'Distance',Min = 5,Max=15,Default = 5,Flag = 'VisualThirdPDistance'}
    thirdperson:Toggle{Name = 'Show Arms',Flag = 'VisualThirdPArms'}

    local world = Tabs.Visuals:Section{Name = 'World',Side = 'Right'}
    -- smoke workspace.Ray_Ignore.Smokes | molotov Ray_Ignore.Fires
    local flashEvent = getconnections(ReplicatedStorage.Events.Flash.OnClientEvent)[1]
    local smokeSize = NumberSequence.new({NumberSequenceKeypoint.new(0,7.5,0),NumberSequenceKeypoint.new(1,10,0)})
    world:Dropdown{Name = 'Disable',Options = {'Smoke','Flashbang','Molotov'},Max = 100,Min = 0,Flag = 'VisualRemove',Callback = function(tbl)
        if table.find(tbl,'Flashbang') then
            flashEvent:Disable()
        else
            flashEvent:Enable()
        end
        if table.find(tbl,'Molotov') then
            Framework:BlockRemote('BURNME')
        else
            Framework:UnblockRemote('BURNME')
        end
        for i,v in pairs(RayIgnore.Smokes:GetChildren()) do
            v.ParticleEmitter.Enabled = not table.find(tbl,'Smoke') and true or false
            v.ParticleEmitter.Size = table.find(tbl,'Smoke') and NumberSequence.new(0) or smokeSize
        end
    end}
    
    library:Connect(RayIgnore.Smokes.ChildAdded,function(child)
        task.wait()
        if table.find(library.flags['VisualRemove'],'Smoke') then
            child.ParticleEmitter.Enabled = false
            child.ParticleEmitter.Size = NumberSequence.new(0)
        end
    end)
    library:Connect(RunService.RenderStepped,function()
        local distance = library.flags['VisualThirdP'] and library.flags['VisualThirdPDistance'] or 0
        LocalPlayer.CameraMinZoomDistance = distance
        LocalPlayer.CameraMaxZoomDistance = distance
    end)
    
end
do -- skins
    local blacklist = {
        'CharacterMesh',
        'Shirt',
        'Pants',
        'Hat',
        'Accessory'
    }
    function ChangeCharacter(NewCharacter,OrigChar)
        OrigChar = OrigChar or LocalPlayer.Character
        if not NewCharacter then return end
        if not OrigChar then return end

        for i,v in pairs(OrigChar:GetChildren()) do
            for _,blacklistedClass in pairs(blacklist) do
                if v:IsA(blacklistedClass) then
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

    local Chars = chars:FindFirstChild('R15')
    local chars1 = Chars:FindFirstChild('ChrModels')
    local chars2 = Chars:FindFirstChild('ChrModels2')
    local chars3 = Chars:FindFirstChild('ChrModels3')
    
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
    if LocalPlayer.Character and LocalPlayer:HasAppearanceLoaded() then
        LocalPlayer.Character.Archivable = true
        OriginalCharacter = LocalPlayer.Character:Clone()
        OriginalCharacter.Parent = workspace
        OriginalCharacter:WaitForChild('HumanoidRootPart').Anchored = true
        OriginalCharacter.HumanoidRootPart.CFrame *= CFrame.new(0,55555555555,0)
    end
    local charChanger = Tabs.Skins:Section{Name = 'Character Changer',Side = 'Left'}
    charChanger:Toggle{Name = 'Enabled',Flag = 'VisualsCharChanger',Callback = function(b)
        if not LocalPlayer.Character then return end
        LocalPlayer.Character:WaitForChild('HeadHB')
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
        LocalPlayer.Character:WaitForChild('HeadHB')

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
        char:WaitForChild('HeadHB')
        char.Archivable = true
        if OriginalCharacter then OriginalCharacter:Destroy() end
        OriginalCharacter = char:Clone()
        OriginalCharacter.Parent = workspace
        OriginalCharacter.HumanoidRootPart.Anchored = true
        OriginalCharacter.HumanoidRootPart.CFrame *= CFrame.new(0,55555555555,0)


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
    library:Connect(LocalPlayer.CharacterRemoving,function()
        if OriginalCharacter then OriginalCharacter:Destroy() OriginalCharacter = nil end
    end)

end
do--esp
    local espSections = Tabs.Esp:MultiSection{Side = 'Right'}
    local a = Tabs.Esp:Section{Name = 'Main',Side = 'Left'}
    a:Toggle{Name = 'Enable ESP',Flag = 'ESPEnabled'}
    a:Slider{Name = 'Max Distance',Flag = 'EspDistance',min = 1,max = 5000}
    a:Dropdown{Name = 'View',Options = {'Teammates','Enemies'},Default = 'Teammates',Min=1,Max=1,Callback = function(t)
        espSections:ChangeSection(t)
    end}

    local outoffov = Tabs.Esp:Section{Name = 'Out Of Fov',Side = 'Left'}
    outoffov:Toggle({Name = 'Enabled',Flag = 'ESPOutOfFov'}):ColorPicker{Flag = 'ESPOutOfFovColor',Default = Color3.fromRGB(255,255,255)}
    outoffov:Slider{Name= 'Size',Flag = 'ESPOutOfFovSize',Min=10,Max=15,Default=15}
    outoffov:Slider{Name= 'Offset',Flag = 'ESPOutOfFovOffset',Min=100,Max=700,Default=500}
    outoffov:Dropdown{Name = 'Settings',Flag = 'EspOutOfFovSettings',Options = {'Outline','Blinking'},Max=2,Min=0}
    outoffov:Toggle{Name = 'Ignore Teammates',Flag = 'EspOutOfFovTeammates',Default = true}

    local function AddEsp(sectionName)
        local esp = espSections:AddSection{Name = sectionName}
        local box = esp:Toggle{Name = 'Show Bounding Box',Flag = sectionName..'Box'}
        box:ColorPicker{Flag = sectionName..'BoxColorInner',Default    = Color3.fromRGB(255,255,255)}
        box:ColorPicker{Flag = sectionName..'BoxColorOuter',Default = Color3.fromRGB(0,0,0)}

        local name = esp:Toggle{Name = 'Show Name',Flag = sectionName..'Name'}
        name:ColorPicker{Flag = sectionName..'NameColorInner',Default = Color3.fromRGB(255,255,255)}
        name:ColorPicker{Flag = sectionName..'NameColorOuter',Default = Color3.fromRGB(0,0,0)}

        local healthbar = esp:Toggle{Name = 'Show Health Bar',Flag = sectionName..'Bar'}
        healthbar:ColorPicker{Flag = sectionName..'BarMax',Default = Color3.fromRGB(0,255,0)}
        healthbar:ColorPicker{Flag = sectionName..'BarMin',Default = Color3.fromRGB(255,0,0)}
        healthbar:ColorPicker{Flag = sectionName..'BarOutline',Default = Color3.fromRGB(0,0,0)}

        esp:Dropdown{Name = 'Health Bar Color',Flag = sectionName..'BarColor',Options = {
            'Solid',
            'Dynamic',
        },Default = 'Solid',Max = 1,Min = 1}
        esp:Dropdown{Name = 'Health Bar Side',Flag = sectionName..'BarSide',Options = {
            'Right',
            'Left',
        },Default = 'Right',Max = 1,Min = 1}

        local health = esp:Toggle{Name = 'Show Health',Flag = sectionName..'Health'}
        health:ColorPicker{Flag = sectionName..'HealthMax',Default = Color3.fromRGB(0,255,0)}
        health:ColorPicker{Flag = sectionName..'HealthMin',Default = Color3.fromRGB(255,0,0)}
        health:ColorPicker{Flag = sectionName..'HealthOutline',Default = Color3.fromRGB(0,0,0)}

        esp:Dropdown{Name = 'Health Text Color',Flag = sectionName..'HealthColor',Options = {
            'Solid',
            'Dynamic',
        },Max = 1,Min = 1,Default = 'Solid'}    
        esp:Dropdown{Name = 'Health Text Side',Flag = sectionName..'HealthSide',Options = {
            'Right',
            'Left',
        },Default = 'Right',Max = 1,Min = 1}

        local indicators = esp:Toggle{Name = 'Show Indicators',Flag = sectionName..'Indicator'}
        indicators:ColorPicker{Flag = sectionName..'IndicatorColor',Default = Color3.fromRGB(255,255,255)}

        esp:Dropdown{Name = 'Indicators',Flag = sectionName..'Indicators',Options = {
            'Weapon',
            'Distance',
        },Max = 999}
    end
    AddEsp('Teammates')
    AddEsp('Enemies')

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
                local prefix = v.TeamColor == LocalPlayer.TeamColor and 'Teammates' or 'Enemies'
                if library.flags['ESPEnabled'] and Framework:GetDistance(LocalPlayer,v) <= library.flags['EspDistance'] then
                    if not onscreen then
                        for i,v in pairs(drawings) do
                            if i ~= 'Offscreen' and v    then
                                v.Visible = false
                            end
                        end
                        if v.TeamColor == LocalPlayer.TeamColor and library.flags['EspOutOfFovTeammates'] then drawings.Offscreen.Visible = false continue end
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
                        drawings.Box.Color    = library.flags[prefix..'BoxColorInner'].Color
                        drawings.Box.Visible = library.flags[prefix..'Box']
                        
                        drawings.BoxOutline.Size     = BoxSize
                        drawings.BoxOutline.Position = BoxPos
                        drawings.BoxOutline.Color = library.flags[prefix..'BoxColorOuter'].Color
                        drawings.BoxOutline.Visible = library.flags[prefix..'Box']
                        
                        local bottom = Vector2.new(BoxPos.X,BoxPos.Y+BoxSize.Y)
                        local health = v.Character:WaitForChild('Humanoid').Health
                        local maxhealth = v.Character.Humanoid.MaxHealth

                        drawings.Healthbar.Visible  = library.flags[prefix..'Bar']
                        drawings.Healthbar.Position = EspUtility.Data.HealthBar[library.flags[prefix..'BarSide']](BoxPos,BoxSize)
                        drawings.Healthbar.Size     = Vector2.new(5,lerp(0,-BoxSize.Y,health/maxhealth))
                        if library.flags[prefix..'BarColor'] == 'Dynamic' then
                            drawings.Healthbar.Color = library.flags[prefix..'BarMin'].Color:lerp(library.flags[prefix..'BarMax'].Color,health/maxhealth)
                        else
                            drawings.Healthbar.Color = library.flags[prefix..'BarMax'].Color
                        end

                        drawings.HealthbarOutline.Visible  = library.flags[prefix..'Bar']
                        drawings.HealthbarOutline.Position = drawings.Healthbar.Position - Vector2.new(1,-1)
                        drawings.HealthbarOutline.Size     = Vector2.new(7,-(BoxSize.Y+2))
                        drawings.HealthbarOutline.Color = library.flags[prefix..'BarOutline'].Color
                        
                        drawings.Health.Visible  = library.flags[prefix..'Health']
                        drawings.Health.Text     = tostring(math.floor((health/maxhealth*100)*10)/10)
                        drawings.Health.Position = EspUtility.Data.Health[library.flags[prefix..'HealthSide']](BoxPos,BoxSize,drawings.Health.TextBounds)
                        if library.flags[prefix..'HealthColor'] == 'Dynamic' then
                            drawings.Health.Color = library.flags[prefix..'HealthMin'].Color:lerp(library.flags[prefix..'HealthMax'].Color,health/maxhealth)
                        else
                            drawings.Health.Color = library.flags[prefix..'HealthMax'].Color
                        end
                        drawings.Health.OutlineColor = library.flags[prefix..'HealthOutline'].Color
                        
                        drawings.Name.Visible   = library.flags[prefix..'Name']
                        drawings.Name.Position  = BoxPos+Vector2.new(BoxSize.X/2,-15)
                        drawings.Name.Text      = v.Name
                        drawings.Name.Color     = library.flags[prefix..'NameColorInner'].Color
                        drawings.Name.OutlineColor = library.flags[prefix..'NameColorOuter'].Color
                        
                        
                        if library.flags[prefix..'Indicator'] then
                            
                            local offset = 5

                            drawings.Distance.Visible  = table.find(library.flags[prefix..'Indicators'],'Distance') and true or false
                            drawings.Distance.Position = bottom+Vector2.new(BoxSize.X/2,offset)
                            drawings.Distance.Text     = '0 studs'
                            drawings.Distance.Color    = library.flags[prefix..'IndicatorColor'].Color
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                                drawings.Distance.Text = tostring(math.floor((LocalPlayer.Character.HumanoidRootPart.Position-v.Character.HumanoidRootPart.Position).Magnitude*100)/100)..' studs'
                            end

                            offset += table.find(library.flags[prefix..'Indicators'],'Distance') and 15 or 0
                            
                            drawings.Tool.Visible  = table.find(library.flags[prefix..'Indicators'],'Weapon') and true or false
                            drawings.Tool.Position = bottom+Vector2.new(BoxSize.X/2,offset)
                            drawings.Tool.Text     = tostring(v.Character:FindFirstChildWhichIsA'Tool' or 'None')
                            drawings.Tool.Color    = library.flags[prefix..'IndicatorColor'].Color
                            
                            offset += table.find(library.flags[prefix..'Indicators'],'Weapon') and 15 or 0
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

do -- misc
    local bhop = Tabs.Misc:Section{Name = 'BHop',Side = 'Left'}
    bhop:Toggle{Name = 'Enabled',Flag = 'BhopEnabled'}
    bhop:Dropdown{Name = 'Type',Options = {'Gyro','CFrame','Velocity'},Min=1,Max=1,Default = 'Gyro',Flag = 'BhopType'}
    bhop:Slider{Name = 'Speed',Max=150,Min = 1,Default = 50,Flag = 'BhopSpeed'}

    local bv
    local YROTATION = function(cf)
        local x,y,z = cf:ToOrientation()
        return CFrame.new(cf.p)*CFrame.Angles(0,y,0)
    end

    library:Connect(RunService.Stepped,function()
        if Framework:IsAlive() and library.flags['BhopEnabled'] then
            local hrp = LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
            local humanoid = LocalPlayer.Character:FindFirstChild('Humanoid')
            if not (hrp and humanoid) then return end

            if bv then bv:Destroy() end

            bv = Instance.new('BodyVelocity')
            bv.MaxForce = Vector3.new(math.huge,0,math.huge)
            if UserInputService:IsKeyDown('Space') and not UserInputService:GetFocusedTextBox() then
                local add = 0
        
                local w = UserInputService:IsKeyDown('W')
                local a = UserInputService:IsKeyDown('A')
                local s = UserInputService:IsKeyDown('S')
                local d = UserInputService:IsKeyDown('D')
                add = a and 90 or d and 270 or 0
                if w and (d or a) then
                    add = a and 45 or d and 315
                end
                if s and (d or a) then
                    add = a and 145 or d and 225
                elseif s then
                    add = 180
                end
                if w and s then
                    add = 0 
                end
                
                local rot = YROTATION(Camera.CFrame) * CFrame.Angles(0,math.rad(add),0)
                local speed = library.flags['BhopSpeed']
                if library.flags['BhopType'] == 'Gyro' then
                    bv.Velocity = Vector3.new(rot.LookVector.X*speed,0,rot.LookVector.Z*speed)
                    bv.Parent = hrp
                else
                    bv:Destroy()
                    if library.flags['BhopType'] == 'Velocity' then
                        hrp.Velocity = Vector3.new(rot.LookVector.X*speed,hrp.Velocity.Y,rot.LookVector.Z*speed)
                    else
                        hrp.CFrame += Vector3.new(rot.LookVector.X*speed/100,0,rot.LookVector.Z*speed/100)
                    end
                end
                humanoid.Jump = true
            end
        end
    end)

    local plr = Tabs.Misc:Section{Name = 'Player',Side = 'Right'}
    plr:Toggle{Name = 'No Fall Damage',Callback = function(t)
        if t then
            Framework:BlockRemote('FallDamage')
        else
            Framework:UnblockRemote('FallDamage')
        end
    end}
    plr:Dropdown{Name = 'Gun Mods',Options = {'Ammo','Spread','Recoil','Automatic','Reload','Firerate','Wallbang'},Flag = 'PlayerGunMods',Max = 999,Min = 0}
    plr:Toggle{Name = 'No Crouch Cooldown',Flag = 'PlayerNoCrounchCooldown'}

    local chat = Tabs.Misc:Section{Name = 'Chat',Side = 'Left'}
    chat:Toggle{Name = 'No Filter',Flag = 'ChatNoFilter'}

    Framework:SpoofInvoke('Filter',function(args)
        if library.flags['ChatNoFilter'] then
            return args[1]
        end
    end)

    local old;old = BetterHookFunction(Client.updtcam,function(...) if table.find(library.flags['PlayerGunMods'],'Recoil') then return end return old(...) end)
    library:Connect(RunService.RenderStepped,function()
        local mods = library.flags['PlayerGunMods']
        if table.find(mods,'Ammo') then
            setupvalue(Client.countammo,5,9999)
            setupvalue(Client.countammo,6,9999)
            setupvalue(Client.countammo,7,9999)
            setupvalue(Client.countammo,8,9999)
            Client.countammo()
        end
        if table.find(mods,'Reload') then
            Client.reloadtime = 0.01
        end
        if table.find(mods,'Automatic') then
            Client.mode = 'automatic'
        end
        if table.find(mods,'Firerate') then
            Client.DISABLED = false
        end
        if table.find(mods,'Spread') then
            Client.firespread = 0
            Client.accuracy_sd = 0
        end
        if library.flags['PlayerNoCrounchCooldown'] then
            Client.crouchcooldown = 0
        end

    end)
end

--// Direction hook \\--
Framework:OnMethod('FindPartOnRayWithIgnoreList',function(args,check)
    local s,e = pcall(function()
        if getinfo(7) and getinfo(7).name == 'pcall' then
            --// Wallbang \\--
            if table.find(library.flags['PlayerGunMods'],'Wallbang') then
                table.insert(args[2],workspace.Map)
            end 
            --// Legit Silent Aim \\--
            if library.flags['LegitSilentAimEnabled'] and not check then
                local class = Framework:GetWeaponClass()
                local p = 'Legit'..class --prefix
                if not library.flags[p..'Override'] then
                    p = 'LegitDefault'
                end

                local closest = Framework:GetClosestToMouse(library.flags[p..'FOV'],library.flags['LegitVisibleCheck'])
                if closest then
                    local chance = math.random(1,100)
                    if chance <= library.flags[p..'HitChance'] then
                        local origin = args[1].Origin -- some glitch with casting from cframe to vector
                        local direction = args[1].Direction
                        args[1] = Ray.new(origin,(closest.Character.Head.Position-origin).Unit * (origin-direction).Magnitude)
                    end
                end
            end
            --// Rage Silent Aim \\--
            if RageTarget then
                args[1] = Ray.new(Camera.CFrame.p,(RageTarget.Position-Camera.CFrame.p).unit*99999)
            end
        end
    end)
end)









library:LoadSettingsTab()   