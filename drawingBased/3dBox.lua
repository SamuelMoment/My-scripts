
local offsets = {
    UpBehindRight = Vector3.new(1,2,1),
    UpBehindLeft = Vector3.new(-1,2,1),
    UpFrontRight = Vector3.new(1,2,-1),
    UpFrontLeft = Vector3.new(-1,2,-1),

    DownBehindRight = Vector3.new(1,-3,1),
    DownBehindLeft = Vector3.new(-1,-3,1),
    DownFrontRight = Vector3.new(1,-3,-1),
    DownFrontLeft = Vector3.new(-1,-3,-1),
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
getgenv().loop = game.RunService.Stepped:Connect(function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild('HumanoidRootPart')

    if not hrp then return end
    for id,line in pairs(lines) do
        local lines = string.split(id,'To')

        local from,visible = Camera:WorldToViewportPoint(hrp.CFrame.p + offsets[lines[1]])
        local to,visible2 = Camera:WorldToViewportPoint(hrp.CFrame.p + offsets[lines[2]])

        line.From = Vector2.new(from.X,from.Y)
        line.To = Vector2.new(to.X,to.Y)
        line.Visible = visible or visible2
        line.Color = Color3.fromRGB(255,255,255)
    end
end)

