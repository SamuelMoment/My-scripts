local points = 180
local radius = 12*6

local offset = points/(36/radius)

local circle = math.pi*2/points


if loop then loop:Disconnect() end
if lines then
    for id,line in pairs(lines) do
        line:Remove()
    end
    table.clear(lines)
end

getgenv().lines = {}
for i=1,points do
    lines[i] = Drawing.new('Line')
end
local LocalPlayer = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
getgenv().loop = game.RunService.RenderStepped:Connect(function()
    if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')) then return end
    local hrp = LocalPlayer.Character.HumanoidRootPart
    for point=1,points do
        local nextpoint = point+1
        if point == points then
            nextpoint = 1
        end
        
        local from,visible = Camera:WorldToViewportPoint((hrp.CFrame * CFrame.new((math.cos(point)*circle)*offset,0,(math.sin(point)*circle)*offset)).p)
        local to,visible2 = Camera:WorldToViewportPoint((hrp.CFrame * CFrame.new((math.cos(nextpoint)*circle)*offset,0,(math.sin(nextpoint)*circle)*offset)).p)

        if from.Z <= 0 then
            from *= -1
        end
        if to.Z <= 0 then
            to *= -1
        end

        lines[point].From = Vector2.new(from.X,from.Y)
        lines[point].To = Vector2.new(to.X,to.Y)
        lines[point].Visible = true
        --some gradient stuff
        local m = (to.Y-from.Y)/(to.X-from.X)
        lines[point].Color = Color3.fromHSV((tick()+m)/10%1,1,1)
    end
end)