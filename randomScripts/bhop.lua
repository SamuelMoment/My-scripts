getgenv().speed = 30

local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService('UserInputService')
local Camera = workspace.CurrentCamera
local BodyVelocity = Instance.new('BodyVelocity')
local function GetChar() -- also checks if ur alive
    local char = LocalPlayer.Character 

    local hrp = char and char:FindFirstChild('HumanoidRootPart')
    local hmd = char and char:FindFirstChildWhichIsA("Humanoid")
    if char and hrp and hmd.Health >= 0 then
        return char
    end
    return nil
end
local IsKeyDown = function(str)
   return UserInputService:IsKeyDown(str) 
end
local function YROTATION(cframe) 
	local x, y, z = cframe:ToOrientation() 
	return CFrame.new(cframe.Position) * CFrame.Angles(0,y,0) 
end

game.RunService.Stepped:Connect(function()
    local char = GetChar()
    if not char then return end

    BodyVelocity:Destroy()
    BodyVelocity = Instance.new('BodyVelocity')
    BodyVelocity.MaxForce = Vector3.new(math.huge,0,math.huge)
    if IsKeyDown('Space') then
        local add = IsKeyDown('S') and 180 or 0
        if IsKeyDown('A') then
            add = IsKeyDown('S') and 135 or IsKeyDown('W') and 45 or 90
        end
        if IsKeyDown('D') then
            add = IsKeyDown('S') and 225 or IsKeyDown('W') and 315 or 270
        end

        local rot = YROTATION(Camera.CFrame) * CFrame.Angles(0,math.rad(add),0)
        BodyVelocity.Parent = char.HumanoidRootPart
        BodyVelocity.Velocity = Vector3.new(rot.LookVector.X,0,rot.LookVector.Z) * speed * 2
    end
end)