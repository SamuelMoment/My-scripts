if drawings then
    for i,v in pairs(drawings) do
        if not v then continue end
        v:Remove()
        v = nil
    end
    drawings = nil
end
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local EspUtility = {
    default = {
        Square = {  
            Visible = true,
            Color = Color3.fromRGB(255,255,255),
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
    data = {
        HealthBar = {
            Left   = function(pos,size) return Vector2.new(-15,0)       end,
            Right  = function(pos,size) return Vector2.new(size.x+10,0) end
        },
        Health = {
            LeftCenter  = function(pos,size,bound) return pos + Vector2.new(-10,size.Y/2-13/2)       + Vector2.new(-bound.X/3,0) end,
            LeftUp      = function(pos,size,bound) return pos + Vector2.new(-10,0)                   + Vector2.new(-bound.X/3,0) end,
            LeftDown    = function(pos,size,bound) return pos + Vector2.new(-10,size.Y-14)           + Vector2.new(-bound.X/3,0) end,
    
            RightCenter = function(pos,size,bound) return pos + Vector2.new(size.X+bound.X/2,size.Y/2-13/2) end, 
            RightUp     = function(pos,size,bound) return pos + Vector2.new(size.X+bound.X/2,0)             end,
            RightDown   = function(pos,size,bound) return pos + Vector2.new(size.X+bound.X/2,size.Y-14)     end
        },
    }    
}
function EspUtility.draw(type,newargs)    
    local args    = EspUtility.default[type]
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
for i,v in pairs(game.Players:GetPlayers()) do
    if v == LocalPlayer then continue end
    EspUtility.Players[v.Name] = {
        box              = EspUtility.draw('Square',{ZIndex = 2}),
        boxOutline       = EspUtility.draw('Square',{Color = Color3.new(0,0,0),Thickness =3}),
        healthbar        = EspUtility.draw('Square',{ZIndex = 2,Filled = true}),
        healthbarOutline = EspUtility.draw('Square',{Filled = true,Color = Color3.new()}),
        
        health           = EspUtility.draw('Text', {ZIndex=3}),
        Name             = EspUtility.draw('Text'),
        Distance         = EspUtility.draw('Text'),
        Tool             = EspUtility.draw('Text')
    }
end
Players.PlayerAdded:Connect(function(plr)
    EspUtility.Players[plr.Name] = {
        box              = EspUtility.draw('Square',{ZIndex = 2}),
        boxOutline       = EspUtility.draw('Square',{Color = Color3.new(0,0,0),Thickness =3}),
        healthbar        = EspUtility.draw('Square',{ZIndex = 2,Filled = true}),
        healthbarOutline = EspUtility.draw('Square',{Filled = true,Color = Color3.new()}),
        
        health           = EspUtility.draw('Text', {ZIndex=3}),
        Name             = EspUtility.draw('Text'),
        Distance         = EspUtility.draw('Text'),
        Tool             = EspUtility.draw('Text')
    }    
end)
Players.PlayerRemoving:Connect(function(plr)
    if EspUtility.Players[plr.Name] then
        for i,v in pairs(EspUtility.Players[plr.Name]) do
            if v then v:Remove() end
            v = nil
        end
        EspUtility.Players[plr.Name] = nil
    end
end)
local settings = {
    Box = {
        Color = Color3.fromRGB(255,125,0)
    },
    HealthBar = {
        Enabled            = true,
        Side               = 'Right',
        ChangeColorOnLowHp = true,
        Color              = Color3.fromRGB(0,255,0)
    },
    Health = {
        Enabled            = true,
        ShouldFollowHealth = false,
        Side               = 'RightUp',
        Prefix             = '',
        Color              = Color3.fromRGB(255,255,50)
    },
    Name = {
        Enabled = true,
        Color   = Color3.fromRGB(0,255,255)
    },
    Distance = {
        Enabled = true,
        Color   = Color3.fromRGB(255,0,255),
    },
    Tool = {
        Enabled = true,
        Color   = Color3.fromRGB(255,255,0),
    }
}

local Camera = workspace.CurrentCamera
local Mouse =   LocalPlayer:GetMouse()
local function lerp(a,b,t)
    return a+(b-a)*t
end
if loop then loop:Disconnect() end
getgenv().loop = game.RunService.Stepped:Connect(function()
    for i,v in pairs(Players:GetPlayers()) do
        if v.Character and v.Character:FindFirstChild('HumanoidRootPart') then
            local drawings = EspUtility.Players[v.Name]
            if not drawings then continue end
            local root         = v.Character.HumanoidRootPart        
            local pos,onscreen = Camera:WorldToViewportPoint(root.CFrame.p)
            if onscreen then
                

			    local Size = (Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(root.Position + Vector3.new(0, 2.6, 0)).Y) / 2
                local BoxSize = Vector2.new(Size*1.5,Size*1.9)
                local BoxPos = Vector2.new(pos.X - Size*1.5 / 2, (pos.Y - Size*1.6 / 2))
                drawings.box.Size     = BoxSize
                drawings.box.Position = BoxPos
                drawings.box.Color    = settings.Box.Color
                drawings.box.Visible = true
                
                drawings.boxOutline.Size     = BoxSize
                drawings.boxOutline.Position = BoxPos
                drawings.boxOutline.Visible = true
                
                local bottom = Vector2.new(BoxPos.X,BoxPos.Y+BoxSize.Y)
                local health = v.Character.Humanoid.Health
                
                drawings.healthbar.Visible  = settings.HealthBar.Enabled
                drawings.healthbar.Position = bottom + EspUtility.data.HealthBar[settings.HealthBar.Side](BoxPos,BoxSize) 
                drawings.healthbar.Size     = Vector2.new(5,lerp(0,-BoxSize.Y,health/100))
                drawings.healthbar.Color    = not settings.HealthBar.ChangeColorOnLowHp and settings.HealthBar.Color or Color3.fromRGB(255,0,0):lerp(settings.HealthBar.Color,v.Character.Humanoid.Health/100)
     
                drawings.healthbarOutline.Visible  = settings.HealthBar.Enabled
                drawings.healthbarOutline.Position = BoxPos + EspUtility.data.HealthBar[settings.HealthBar.Side](BoxPos,BoxSize) + Vector2.new(-1,-1)
                drawings.healthbarOutline.Size     = Vector2.new(7,BoxSize.Y+2)
                
                drawings.health.Visible  = true
                drawings.health.Text     = tostring(v.Character.Humanoid.Health)..settings.Health.Prefix
                drawings.health.Position = settings.Health.ShouldFollowHealth and drawings.healthbar.Position + Vector2.new(3,drawings.healthbar.Size.Y) or EspUtility.data.Health[settings.Health.Side](BoxPos,BoxSize,drawings.health.TextBounds)
                drawings.health.Color    = settings.Health.Color
                
                drawings.Name.Visible   = settings.Name.Enabled
                drawings.Name.Position  = BoxPos+Vector2.new(BoxSize.X/2,-15)
                drawings.Name.Text      = v.Name
                drawings.Name.Color     = settings.Name.Color
    
                local offset = 5
                
                drawings.Distance.Visible  = settings.Distance.Enabled
                drawings.Distance.Position = bottom+Vector2.new(BoxSize.X/2,offset)
                drawings.Distance.Text     = '0 studs'
                drawings.Distance.Color    = settings.Distance.Color
                
                offset += settings.Distance.Enabled and 15 or 0
                
                drawings.Tool.Visible  = settings.Tool.Enabled
                drawings.Tool.Position = bottom+Vector2.new(BoxSize.X/2,offset)
                drawings.Tool.Text     = tostring(v.Character:FindFirstChildWhichIsA'Tool') or 'none'
                drawings.Tool.Color    = settings.Tool.Color
            else
                for i,v in pairs(drawings) do
                    v.Visible = false
                end
            end
        end
    end
end)