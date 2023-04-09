
local offsets = {
    UpBehindRight = Vector3.new(3,3,3),
    UpBehindLeft = Vector3.new(-3,3,3),
    UpFrontRight = Vector3.new(3,3,-3),
    UpFrontLeft = Vector3.new(-3,3,-3),

    DownBehindRight = Vector3.new(3,-3,3),
    DownBehindLeft = Vector3.new(-3,-3,3),
    DownFrontRight = Vector3.new(3,-3,-3),
    DownFrontLeft = Vector3.new(-3,-3,-3),
}
local connectors = {
    UpBehindRight = {'UpBehindLeft','UpFrontRight','DownBehindRight'},
    UpBehindLeft = {'UpFrontLeft','DownBehindLeft'},
    UpFrontRight = {'UpFrontLeft','DownFrontRight'},
    UpFrontLeft = {'DownFrontLeft'},

    DownBehindRight = {'DownFrontRight','DownBehindLeft'},
    DownBehindLeft = {'DownFrontLeft'},
    DownFrontLeft = {'DownFrontRight'}
}
local LocalPlayer = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
if loop then loop:Disconnect() end
if lines then
    for id,line in pairs(lines) do
        line:Remove()
    end
    table.clear(lines)
end
getgenv().lines = {}
for from,tos in pairs(connectors) do
    for ind,to in pairs(tos) do
        lines[from..'To'..to] = Drawing.new('Line')
    end
end

local center = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
getgenv().loop = game.RunService.Stepped:Connect(function()
    for id,line in pairs(lines) do
        local lines = string.split(id,'To')

        local from,visible = Camera:WorldToViewportPoint(center.p + offsets[lines[1]])
        local to,visible2 = Camera:WorldToViewportPoint(center.p + offsets[lines[2]])

        if from.Z < 0 then
            from *= -1
        end
        if to.Z < 0 then
            to *= -1
        end
        line.From = Vector2.new(from.X,from.Y)
        line.To = Vector2.new(to.X,to.Y)
        line.Visible = true
        line.Color = Color3.fromRGB(255,255,255)
    end
end)

