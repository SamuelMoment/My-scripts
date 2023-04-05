if square then square:Remove() end
if loop then loop:Disconnect() end

local part = Instance.new('Part',workspace)
part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
part.Anchored = true
local camera = workspace.CurrentCamera

local circle = math.pi*2
local radius = 100

getgenv().square = Drawing.new('Square')
square.Size = Vector2.new(50,50)
square.Filled = true
--square.Position = Vector2.new(camera.ViewportSize.X/2+math.sin(p)*circle,camera.ViewportSize.Y/2+math.cos(p)*circle)
square.Visible = true
local function Rotate(point, center, angle)
    angle = math.rad(angle)
    local rotatedX =
        math.cos(angle) * (point.X - center.X) - math.sin(angle) * (point.Y - center.Y) + center.X
    local rotatedY =
        math.sin(angle) * (point.X - center.X) + math.cos(angle) * (point.Y - center.Y) + center.Y

    return Vector2.new(math.floor(rotatedX), math.floor(rotatedY))
end
getgenv().loop = game.RunService.Stepped:Connect(function()
    local p = camera.CFrame.LookVector:Dot(part.CFrame.p-camera.CFrame.p)
    square.Position = camera.ViewportSize/2 + Vector2.new(math.cos(p)*radius,math.sin(p)*radius) + square.Size/2

    local ScreenPos,OnScreen = camera:WorldToScreenPoint(part.Position)
    if ScreenPos.Z <= 0 then
        ScreenPos *= -1
    end
    if not OnScreen then
        local Center = camera.ViewportSize/2
        local Size = 50
        local FOV = 800-300
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
        square.Position  = Rotate(Point + Vector2.new(Size, Size), Point, Rotation)
    end
end)