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
        task.spawn(function(...)
            table.insert(self._queue,fakeThread)
            repeat wait() until self._queue[1] == fakeThread
            fakeThread(...)
            table.remove(self._queue,1)
        end,...)
    end
end