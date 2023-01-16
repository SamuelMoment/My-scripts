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
local function deepCopy(original)
  local copy = {}
  for k, v in pairs(original) do
    if type(v) == "table" then
      v = deepCopy(v)
    end
    copy[k] = v
  end
  return copy
end

local Players = game.Players
local LocalPlayer = Players.LocalPlayer

local holder = Instance.new('Folder',workspace)
getgenv().delay = 2.5
function actualDelay() return getgenv().delay end
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
        local thread = Queue.new()
        local cframes = {}
        task.spawn(function()
            local oldCFrame = v.CFrame
            while task.wait() do
                if oldCFrame ~= v.CFrame then
                    local cf = v.CFrame
                    oldCFrame = v.CFrame
                    table.insert(cframes,{cf,os.clock()})
                end
            end
        end)
        task.spawn(function()
            while task.wait(actualDelay()) do
                task.spawn(function()
                    local old = os.clock()
                    local clone = deepCopy(cframes)
                    table.clear(cframes)
                    for i1,v1 in pairs(clone) do
                        fakePart.CFrame = v1[1]
                        task.wait(old-v1[2])
                        old = v1[2]
                    end
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