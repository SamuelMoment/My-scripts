local Queue = {}
Queue.__index = Queue

function Queue.new()
    local self = setmetatable({},Queue)
    self._queue = {}
    
    return self
end
function Queue:AddToQueue(func,...)
    if self._queue then
        local function fakeThread(...) -- coroutine is retarded and im preventing from fake queue this way
            return func(...)
        end
        coroutine.wrap(function(...)
            table.insert(self._queue,fakeThread)
            repeat wait() until self._queue[1] == fakeThread
            fakeThread(...)
            table.remove(self._queue,1)
        end)(...)
    end
end
function Queue:DelayQueue(delay,func,...)
    if self._queue then
        local function fakeThread(...) -- coroutine is retarded and im preventing from fake queue this way
            return func(...)
        end
        coroutine.wrap(function(...)
            task.wait(delay) --outside would just yield 
            table.insert(self._queue,fakeThread)
            repeat wait() until self._queue[1] == fakeThread
            fakeThread(...)
            table.remove(self._queue,1)
        end)(delay,...)
    end    
end
function Queue:FunctionDelayQueue(delay,func,...) -- same as delayqueue but delay is dynamic
    if self._queue then
        local function fakeThread(...) -- coroutine is retarded and im preventing from fake queue this way
            return func(...)
        end
        coroutine.wrap(function(...)
            local time = os.clock()
            repeat task.wait() until os.clock()-time >= delay()
            table.insert(self._queue,fakeThread)
            repeat wait() until self._queue[1] == fakeThread
            fakeThread(...)
            table.remove(self._queue,1)
        end)(delay,...)
    end    
end
local Players = game.Players
local LocalPlayer = Players.LocalPlayer

local holder = Instance.new('Folder',workspace)
getgenv().delay = 2.5
function backtrack(plr)
    local m = Instance.new('Model',holder)
    for i,v in pairs(plr.Character:GetChildren()) do
        if not v:IsA('BasePart') then continue end
        local fakePart = v:Clone()
        fakePart:ClearAllChildren()
        fakePart.Parent = m
        fakePart.Anchored = true
        fakePart.CFrame = v.CFrame
        fakePart.Color = Color3.fromRGB(255,255,255)
        fakePart.CanCollide = false
        local oldCFrame = v.CFrame
        local thread = Queue.new()
        game.RunService.Stepped:Connect(function()
            if oldCFrame ~= v.CFrame then
                local cf = v.CFrame
                oldCFrame = v.CFrame
                thread:FunctionDelayQueue(function() return getgenv().delay end,function()
                    fakePart.CFrame =cf
                end)
            end
        end)

    end
end
for i,v in pairs(Players:GetPlayers()) do
    --if v == LocalPlayer then continue end
    if v.Character then
        backtrack(v)
    end
end