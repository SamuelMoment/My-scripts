if square then square:Remove() end
if loop then loop:Disconnect() end

local part = workspace.Part
local camera = workspace.CurrentCamera

local circle = math.pi*2
local radius = 100

getgenv().square = Drawing.new('Square')
square.Size = Vector2.new(50,50)
square.Filled = true
--square.Position = Vector2.new(camera.ViewportSize.X/2+math.sin(p)*circle,camera.ViewportSize.Y/2+math.cos(p)*circle)
square.Visible = true

getgenv().loop = game.RunService.Stepped:Connect(function()
    local p = camera.CFrame.LookVector:Dot(part.CFrame.p-camera.CFrame.p)
    square.Position = camera.ViewportSize/2 + Vector2.new(math.cos(p)*radius,math.sin(p)*radius) + square.Size/2

    local pos,OnScreen = camera:WorldToScreenPoint(part.Position)
    if not OnScreen then pos *= -1 end
    square.Position = Vector2.new(pos.X,pos.Y)
end)