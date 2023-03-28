local points = 3600
local radius = 12

local offset = points/(36/(radius*60))
print(offset)

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
local function getangle(pos,pos2)
    local deltax = pos2.X-pos.X
    local deltay = pos2.y-pos.y

    return math.atan2(deltay,deltax)
end

getgenv().loop = game.RunService.RenderStepped:Connect(function()
    if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')) then return end
    local hrp = LocalPlayer.Character.HumanoidRootPart
    for point=1,points do

        local centre = Camera.ViewportSize/2
        local fun = Vector2.new((math.cos(point)*circle),(math.sin(point)*circle))

        local from = centre+fun*offset
        local to = centre+fun*5


        lines[point].From = from
        lines[point].To = to
        lines[point].Visible = true
        --some gradient stuff

        local m = getangle(to,centre)
        if m >= 3.5 then
            m *= 2.9 -m
        end
        print(m)
        lines[point].Color = Color3.fromHSV((os.clock()+m)/10%1,1,1)
    end
end)