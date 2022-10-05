if getgenv().drawing then return end
getgenv().drawing = {} do
    local services = setmetatable({}, {
        __index = function(self, key)
            if key == "InputService" then
                key = "UserInputService"
            end
            
            if not rawget(self, key) then
                local service = game:GetService(key)
                rawset(self, service, service)
    
                return service
            end
        
            return rawget(self, key)
        end
    })

    -- taken from Nevermore Engine https://github.com/Quenty/NevermoreEngine/tree/main/src

    local HttpService = game:GetService("HttpService")

    local ENABLE_TRACEBACK = false

    local Signal = {}
    Signal.__index = Signal
    Signal.ClassName = "Signal"

    --[=[
        Returns whether a class is a signal
        @param value any
        @return boolean
    ]=]
    function Signal.isSignal(value)
        return type(value) == "table"
            and getmetatable(value) == Signal
    end

    --[=[
        Constructs a new signal.
        @return Signal<T>
    ]=]
    function Signal.new()
        local self = setmetatable({}, Signal)

        self._bindableEvent = Instance.new("BindableEvent")
        self._argMap = {}
        self._source = ENABLE_TRACEBACK and debug.traceback() or ""

        -- Events in Roblox execute in reverse order as they are stored in a linked list and
        -- new connections are added at the head. This event will be at the tail of the list to
        -- clean up memory.
        self._bindableEvent.Event:Connect(function(key)
            self._argMap[key] = nil

            -- We've been destroyed here and there's nothing left in flight.
            -- Let's remove the argmap too.
            -- This code may be slower than leaving this table allocated.
            if (not self._bindableEvent) and (not next(self._argMap)) then
                self._argMap = nil
            end
        end)

        return self
    end

    --[=[
        Fire the event with the given arguments. All handlers will be invoked. Handlers follow
        @param ... T -- Variable arguments to pass to handler
    ]=]
    function Signal:Fire(...)
        if not self._bindableEvent then
            warn(("Signal is already destroyed. %s"):format(self._source))
            return
        end

        local args = table.pack(...)

        -- TODO: Replace with a less memory/computationally expensive key generation scheme
        local key = HttpService:GenerateGUID(false)
        self._argMap[key] = args

        -- Queues each handler onto the queue.
        self._bindableEvent:Fire(key)
    end

    --[=[
        Connect a new handler to the event. Returns a connection object that can be disconnected.
        @param handler (... T) -> () -- Function handler called when `:Fire(...)` is called
        @return RBXScriptConnection
    ]=]
    function Signal:Connect(handler)
        if not (type(handler) == "function") then
            error(("connect(%s)"):format(typeof(handler)), 2)
        end

        return self._bindableEvent.Event:Connect(function(key)
            -- note we could queue multiple events here, but we'll do this just as Roblox events expect
            -- to behave.

            local args = self._argMap[key]
            if args then
                handler(table.unpack(args, 1, args.n))
            else
                error("Missing arg data, probably due to reentrance.")
            end
        end)
    end

    --[=[
        Wait for fire to be called, and return the arguments it was given.
        @yields
        @return T
    ]=]
    function Signal:Wait()
        local key = self._bindableEvent.Event:Wait()
        local args = self._argMap[key]
        if args then
            return table.unpack(args, 1, args.n)
        else
            error("Missing arg data, probably due to reentrance.")
            return nil
        end
    end

    --[=[
        Disconnects all connected events to the signal. Voids the signal as unusable.
        Sets the metatable to nil.
    ]=]
    function Signal:Destroy()
        if self._bindableEvent then
            -- This should disconnect all events, but in-flight events should still be
            -- executed.

            self._bindableEvent:Destroy()
            self._bindableEvent = nil
        end

        -- Do not remove the argmap. It will be cleaned up by the cleanup connection.

        setmetatable(self, nil)
    end

    local signal = Signal

    local function ismouseover(obj)
        local posX, posY = obj.Position.X, obj.Position.Y
        local sizeX, sizeY = posX + obj.Size.X, posY + obj.Size.Y
        local mousepos = services.InputService:GetMouseLocation()

        if mousepos.X >= posX and mousepos.Y >= posY and mousepos.X <= sizeX and mousepos.Y <= sizeY then
            return true
        end

        return false
    end

    local function udim2tovector2(udim2, vec2)
        local xscalevector2 = vec2.X * udim2.X.Scale
        local yscalevector2 = vec2.Y * udim2.Y.Scale

        local newvec2 = Vector2.new(xscalevector2 + udim2.X.Offset, yscalevector2 + udim2.Y.Offset)

        return newvec2
    end

    -- totally not skidded from devforum (trust)
    local function istouching(pos1, size1, pos2, size2)
        local top = pos2.Y - pos1.Y
        local bottom = pos2.Y + size2.Y - (pos1.Y + size1.Y)
        local left = pos2.X - pos1.X
        local right = pos2.X + size2.X - (pos1.X + size1.X)

        local touching = true
        
        if top > 0 then
            touching = false
        elseif bottom < 0 then
            touching = false
        elseif left > 0 then
            touching = false
        elseif right < 0 then
            touching = false
        end
        
        return touching
    end

    local objchildren = {}
    local objmts = {}
    local objvisibles = {}
    local mtobjs = {}
    local udim2posobjs = {}
    local udim2sizeobjs = {}
    local objpositions = {}
    local listobjs = {}
    local listcontents = {}
    local listchildren = {}
    local listadds = {}
    local objpaddings = {}
    local scrollobjs = {}
    local listindexes = {}
    local custompropertysets = {}
    local custompropertygets = {}
    local objconnections = {}
    local objmtchildren = {}
    local scrollpositions = {}
    local currentcanvasposobjs = {}
    local childrenposupdates = {}
    local childrenvisupdates = {}
    local squares = {}
    local objsignals = {}
    local objexists = {}

    local function mouseoverhighersquare(obj)
        for _, square in next, squares do
            if square.Visible == true and square.ZIndex > obj.ZIndex then
                if ismouseover(square) then
                    return true
                end
            end
        end
    end

    services.InputService.InputEnded:Connect(function(input, gpe)
        for obj, signals in next, objsignals do
            if objexists[obj] then
                if signals.inputbegan[input] then
                    signals.inputbegan[input] = false

                    if signals.InputEnded then
                        signals.InputEnded:Fire(input, gpe)
                    end
                end

                if obj.Visible then
                    if ismouseover(obj) then
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and not mouseoverhighersquare(obj) then
                            if signals.MouseButton1Up then
                                signals.MouseButton1Up:Fire()
                            end

                            if signals.mouse1down and signals.MouseButton1Click then
                                signals.mouse1down = false
                                signals.MouseButton1Click:Fire()
                            end
                        end

                        if input.UserInputType == Enum.UserInputType.MouseButton2 and not mouseoverhighersquare(obj) then
                            if signals.MouseButton2Clicked then
                                signals.MouseButton2Clicked:Fire()
                            end

                            if signals.MouseButton2Up then
                                signals.MouseButton2Up:Fire()
                            end
                        end
                    end
                end
            end
        end
    end)

    services.InputService.InputChanged:Connect(function(input, gpe)
        for obj, signals in next, objsignals do
            if objexists[obj] and obj.Visible and (signals.MouseEnter or signals.MouseMove or signals.InputChanged or signals.MouseLeave) then
                if ismouseover(obj) then
                    if not signals.mouseentered then
                        signals.mouseentered = true

                        if signals.MouseEnter then
                            signals.MouseEnter:Fire(input.Position)
                        end

                        if signals.MouseMoved then
                            signals.MouseMoved:Fire(input.Position)
                        end
                    end

                    if signals.InputChanged then
                        signals.InputChanged:Fire(input, gpe)
                    end
                elseif signals.mouseentered then
                    signals.mouseentered = false

                    if signals.MouseLeave then
                        signals.MouseLeave:Fire(input.Position)
                    end
                end
            end
        end
    end)

    services.InputService.InputBegan:Connect(function(input, gpe)
        for obj, signals in next, objsignals do
            if objexists[obj] then
                if obj.Visible then
                    if ismouseover(obj) and not mouseoverhighersquare(obj) then 
                        signals.inputbegan[input] = true

                        if signals.InputBegan then
                            signals.InputBegan:Fire(input, gpe)
                        end

                        if input.UserInputType == Enum.UserInputType.MouseButton1 and (not mouseoverhighersquare(obj) or obj.Transparency == 0) then
                            signals.mouse1down = true

                            if signals.MouseButton1Down then
                                signals.MouseButton1Down:Fire()
                            end
                        end

                        if input.UserInputType == Enum.UserInputType.MouseButton2 and (not mouseoverhighersquare(obj) or obj.Transparency == 0) then
                            if signals.MouseButton2Down then
                                signals.MouseButton2Down:Fire()
                            end
                        end
                    end
                end
            end
        end
    end)

    function drawing:new(shape)
        local obj = Drawing.new(shape)
        objexists[obj] = true
        local signalnames = {}

        local listfunc
        local scrollfunc
        local refreshscrolling

        objconnections[obj] = {}

        if shape == "Square" then
            table.insert(squares, obj)

            signalnames = {
                MouseButton1Click = signal.new(),
                MouseButton1Up = signal.new(),
                MouseButton1Down = signal.new(),
                MouseButton2Click = signal.new(),
                MouseButton2Up = signal.new(),
                MouseButton2Down = signal.new(),
                InputBegan = signal.new(),
                InputEnded = signal.new(),
                InputChanged = signal.new(),
                MouseEnter = signal.new(),
                MouseLeave = signal.new(),
                MouseMoved = signal.new()
            }

            local attemptedscrollable = false

            scrollfunc = function(self)
                if listobjs[self] then
                    scrollpositions[self] = 0
                    scrollobjs[self] = true

                    self.ClipsDescendants = true

                    local function scroll(amount)
                        local totalclippedobjs, currentclippedobj, docontinue = 0, nil, false

                        for i, object in next, listchildren[self] do
                            if amount == 1 then
                                if object.Position.Y > mtobjs[self].Position.Y then
                                    if not istouching(object.Position, object.Size, mtobjs[self].Position, mtobjs[self].Size) then
                                        if not currentclippedobj then
                                            currentclippedobj = object
                                        end

                                        totalclippedobjs = totalclippedobjs + 1
                                        docontinue = true
                                    end
                                end
                            end

                            if amount == -1 then
                                if object.Position.Y <= mtobjs[self].Position.Y then
                                    if not istouching(object.Position, object.Size, mtobjs[self].Position, mtobjs[self].Size) then
                                        currentclippedobj = object
                                        totalclippedobjs = totalclippedobjs + 1
                                        docontinue = true
                                    end
                                end
                            end
                        end

                        if docontinue then
                            if amount > 0 then
                                local poschange = -(currentclippedobj.Size.Y + objpaddings[self])
                                local closestobj

                                for i, object in next, objchildren[self] do
                                    if istouching(object.Position + Vector2.new(0, poschange), object.Size, mtobjs[self].Position, mtobjs[self].Size) then
                                        closestobj = object
                                        break
                                    end
                                end

                                local diff = (Vector2.new(0, mtobjs[self].Position.Y) - Vector2.new(0, (closestobj.Position.Y + poschange + objpaddings[self]))).magnitude

                                if custompropertygets[mtobjs[self]]("ClipsDescendants") then
                                    for i, object in next, objchildren[self] do
                                        if not istouching(object.Position + Vector2.new(0, poschange - diff + objpaddings[self]), object.Size, mtobjs[self].Position, mtobjs[self].Size) then
                                            object.Visible = false
                                            childrenvisupdates[objmts[object]](objmts[object], false)
                                        else
                                            object.Visible = true
                                            childrenvisupdates[objmts[object]](objmts[object], true)
                                        end
                                    end
                                end

                                scrollpositions[self] = scrollpositions[self] + (poschange - diff + objpaddings[self])

                                for i, object in next, objchildren[self] do
                                    childrenposupdates[objmts[object]](objmts[object], object.Position + Vector2.new(0, poschange - diff + objpaddings[self]))
                                    object.Position = object.Position + Vector2.new(0, poschange - diff + objpaddings[self])
                                end
                            else
                                local poschange = currentclippedobj.Size.Y + objpaddings[self]

                                if custompropertygets[mtobjs[self]]("ClipsDescendants") then
                                    for i, object in next, objchildren[self] do
                                        if not istouching(object.Position + Vector2.new(0, poschange), object.Size, mtobjs[self].Position, mtobjs[self].Size) then
                                            object.Visible = false
                                            childrenvisupdates[objmts[object]](objmts[object], false)
                                        else
                                            object.Visible = true
                                            childrenvisupdates[objmts[object]](objmts[object], true)
                                        end
                                    end
                                end

                                scrollpositions[self] = scrollpositions[self] + poschange

                                for i, object in next, objchildren[self] do
                                    childrenposupdates[objmts[object]](objmts[object], object.Position + Vector2.new(0, poschange))
                                    object.Position = object.Position + Vector2.new(0, poschange)
                                end
                            end
                        end

                        return docontinue
                    end

                    refreshscrolling = function()
                        repeat
                        until
                            not scroll(-1)
                    end

                    self.InputChanged:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseWheel then
                            if input.Position.Z > 0 then
                                scroll(-1)
                            else
                                scroll(1)
                            end
                        end
                    end)
                else
                    attemptedscrollable = true
                end
            end

            listfunc = function(self, padding)
                objpaddings[self] = padding
                listcontents[self] = 0
                listchildren[self] = {}
                listindexes[self] = {}
                listadds[self] = {}

                listobjs[self] = true

                for i, object in next, objchildren[self] do
                    table.insert(listchildren[self], object)
                    table.insert(listindexes[self], listcontents[self] + (#listchildren[self] == 1 and 0 or padding))

                    local newpos = mtobjs[self].Position + Vector2.new(0, listcontents[self] + (#listchildren[self] == 1 and 0 or padding))
                    object.Position = newpos
                    
                    childrenposupdates[object](objmts[object], newpos)

                    custompropertysets[object]("AbsolutePosition", newpos)
                    
                    listadds[self][object] = object.Size.Y + (#listchildren[self] == 1 and 0 or padding)
                    listcontents[self] = listcontents[self] + object.Size.Y + (#listchildren[self] == 1 and 0 or padding)
                end

                if attemptedscrollable then
                    scrollfunc(self)
                end
            end
        end

        local customproperties = {
            Parent = nil,
            AbsolutePosition = nil,
            AbsoluteSize = nil,
            ClipsDescendants = false
        }

        custompropertysets[obj] = function(k, v)
            customproperties[k] = v
        end

        custompropertygets[obj] = function(k)
            return customproperties[k]
        end

        local mt = setmetatable({exists = true}, {
            __index = function(self, k)
                if k == "Parent" then
                    return customproperties.Parent
                end

                if k == "Visible" then
                    return objvisibles[obj]
                end

                if k == "Position" then
                    return udim2posobjs[obj] or objpositions[obj] or obj[k]
                end

                if k == "Size" then
                    return udim2sizeobjs[obj] or obj[k]
                end

                if k == "AddListLayout" and listfunc then
                    return listfunc
                end

                if k == "MakeScrollable" and scrollfunc then
                    return scrollfunc
                end

                if k == "RefreshScrolling" and refreshscrolling then
                    return refreshscrolling
                end

                if k == "AbsoluteContentSize" then
                    return listcontents[self]
                end

                if k == "GetChildren" then
                    return function(self)
                        return objmtchildren[self]
                    end
                end

                if k == "Remove" then
                    return function(self)
                        rawset(self, "exists", false)
                        objexists[obj] = false

                        if customproperties.Parent and listobjs[customproperties.Parent] then
                            local objindex = table.find(objchildren[customproperties.Parent], obj)

                            listcontents[customproperties.Parent] = listcontents[customproperties.Parent] - listadds[customproperties.Parent][obj]
            
                            for i, object in next, objchildren[customproperties.Parent] do
                                if i > objindex then
                                    object.Position = object.Position - Vector2.new(0, listadds[customproperties.Parent][obj])
                                end
                            end

                            if table.find(listchildren[customproperties.Parent], obj) then
                                table.remove(listchildren[customproperties.Parent], table.find(listchildren[customproperties.Parent], obj))
                            end

                            if table.find(objchildren[customproperties.Parent], obj) then
                                table.remove(objchildren[customproperties.Parent], table.find(objchildren[customproperties.Parent], obj))
                                table.remove(listindexes[customproperties.Parent], table.find(objchildren[customproperties.Parent], obj))
                            end
                        end

                        if table.find(squares, mtobjs[self]) then
                            table.remove(squares, table.find(squares, mtobjs[self]))
                        end
                        
                        for _, object in next, objchildren[self] do
                            if objexists[object] then
                                table.remove(objsignals, table.find(objsignals, object))
                                objmts[object]:Remove()
                            end
                        end

                        table.remove(objsignals, table.find(objsignals, obj))
                        obj:Remove()
                    end
                end

                if signalnames and signalnames[k] then
                    objsignals[obj] = objsignals[obj] or {}
                    
                    if not objsignals[obj][k] then
                        objsignals[obj][k] = signalnames[k]
                    end

                    objsignals[obj].inputbegan = objsignals[obj].inputbegan or {}
                    objsignals[obj].mouseentered = objsignals[obj].mouseentered or {}
                    objsignals[obj].mouse1down = objsignals[obj].mouse1down or {}

                    return signalnames[k]
                end

                return customproperties[k] or obj[k]
            end,

            __newindex = function(self, k, v)
                local changechildrenvis
                changechildrenvis = function(parent, vis)
                    if objchildren[parent] then
                        for _, object in next, objchildren[parent] do
                            if (custompropertygets[mtobjs[parent]]("ClipsDescendants") and not istouching(object.Position, object.Size, mtobjs[parent].Position, mtobjs[parent].Size)) then
                                object.Visible = false
                                changechildrenvis(objmts[object], false)
                            else
                                object.Visible = vis and objvisibles[object] or false
                                changechildrenvis(objmts[object], vis and objvisibles[object] or false)
                            end
                        end
                    end
                end

                childrenvisupdates[self] = changechildrenvis

                if k == "Visible" then
                    objvisibles[obj] = v

                    if customproperties.Parent and (not mtobjs[customproperties.Parent].Visible or (custompropertygets[mtobjs[customproperties.Parent]]("ClipsDescendants") and not istouching(obj.Position, obj.Size, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size))) then
                        v = false
                        changechildrenvis(self, v)
                    else
                        changechildrenvis(self, v)
                    end
                end

                if k == "ClipsDescendants" then
                    customproperties.ClipsDescendants = v

                    for _, object in next, objchildren[self] do
                        object.Visible = v and (istouching(object.Position, object.Size, obj.Position, obj.Size) and objvisibles[object] or false) or objvisibles[object]
                    end

                    return
                end

                local changechildrenpos
                changechildrenpos = function(parent, val)
                    if objchildren[parent] then
                        if listobjs[parent] then
                            for i, object in next, objchildren[parent] do
                                local newpos = val + Vector2.new(0, listindexes[parent][i])
        
                                if scrollobjs[parent] then
                                    newpos = val + Vector2.new(0, listindexes[parent][i] + scrollpositions[parent])
                                end

                                newpos = Vector2.new(math.floor(newpos.X), math.floor(newpos.Y))

                                object.Position = newpos
                                custompropertysets[object]("AbsolutePosition", newpos)

                                changechildrenpos(objmts[object], newpos)
                            end
                        else
                            for _, object in next, objchildren[parent] do
                                local newpos = val + objpositions[object]
                                newpos = Vector2.new(math.floor(newpos.X), math.floor(newpos.Y))

                                object.Position = newpos

                                custompropertysets[object]("AbsolutePosition", newpos)
                                
                                changechildrenpos(objmts[object], newpos)
                            end
                        end
                    end
                end

                childrenposupdates[self] = changechildrenpos

                if k == "Position" then
                    if typeof(v) == "UDim2" then
                        udim2posobjs[obj] = v
                        
                        if customproperties.Parent then
                            objpositions[obj] = udim2tovector2(v, mtobjs[customproperties.Parent].Size)

                            if listobjs[customproperties.Parent] then
                                return
                            else
                                v = mtobjs[customproperties.Parent].Position + udim2tovector2(v, mtobjs[customproperties.Parent].Size)
                            end
                        else
                            local newpos = udim2tovector2(v, workspace.CurrentCamera.ViewportSize)
                            objpositions[obj] = newpos
                            v = udim2tovector2(v, workspace.CurrentCamera.ViewportSize)
                        end

                        customproperties.AbsolutePosition = v

                        if customproperties.Parent and custompropertygets[mtobjs[customproperties.Parent]]("ClipsDescendants") then
                            obj.Visible = istouching(v, obj.Size, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size) and objvisibles[obj] or false
                            changechildrenvis(self, istouching(v, obj.Size, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size) and objvisibles[obj] or false)
                        end

                        changechildrenpos(self, v)
                    else
                        objpositions[obj] = v

                        if customproperties.Parent then
                            if listobjs[customproperties.Parent] then
                                return
                            else
                                v = mtobjs[customproperties.Parent].Position + v
                            end
                        end

                        customproperties.AbsolutePosition = v

                        if customproperties.Parent and custompropertygets[mtobjs[customproperties.Parent]]("ClipsDescendants") then
                            obj.Visible = istouching(v, obj.Size, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size) and objvisibles[obj] or false
                            changechildrenvis(self, istouching(v, obj.Size, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size) and objvisibles[obj] or false)
                        end

                        changechildrenpos(self, v)
                    end

                    v = v
                end

                local changechildrenudim2pos
                changechildrenudim2pos = function(parent, val)
                    if objchildren[parent] and not listobjs[parent] then
                        for _, object in next, objchildren[parent] do
                            if udim2posobjs[object] then
                                local newpos = mtobjs[parent].Position + udim2tovector2(udim2posobjs[object], val)
                                newpos = Vector2.new(math.floor(newpos.X), math.floor(newpos.Y))
                                
                                if not listobjs[parent] then
                                    object.Position = newpos
                                end

                                custompropertysets[object]("AbsolutePosition", newpos)
                                objpositions[object] = udim2tovector2(udim2posobjs[object], val)
                                changechildrenpos(objmts[object], newpos)
                            end
                        end
                    end
                end

                local changechildrenudim2size
                changechildrenudim2size = function(parent, val)
                    if objchildren[parent] then
                        for _, object in next, objchildren[parent] do
                            if udim2sizeobjs[object] then
                                local newsize = udim2tovector2(udim2sizeobjs[object], val)
                                object.Size = newsize

                                if custompropertygets[mtobjs[parent]]("ClipsDescendants") then
                                    object.Visible = istouching(object.Position, object.Size, mtobjs[parent].Position, mtobjs[parent].Size) and objvisibles[object] or false
                                end

                                custompropertysets[object]("AbsoluteSize", newsize)

                                changechildrenudim2size(objmts[object], newsize)
                                changechildrenudim2pos(objmts[object], newsize)
                            end
                        end
                    end
                end

                if k == "Size" then
                    if typeof(v) == "UDim2" then
                        udim2sizeobjs[obj] = v 

                        if customproperties.Parent then
                            v = udim2tovector2(v, mtobjs[customproperties.Parent].Size)
                        else
                            v = udim2tovector2(v, workspace.CurrentCamera.ViewportSize)
                        end

                        if customproperties.Parent and listobjs[customproperties.Parent] then
                            local oldsize = obj.Size.Y
                            local sizediff = v.Y - oldsize

                            local objindex = table.find(objchildren[customproperties.Parent], obj)

                            listcontents[customproperties.Parent] = listcontents[customproperties.Parent] + sizediff
                            listadds[customproperties.Parent][obj] = listadds[customproperties.Parent][obj] + sizediff

                            for i, object in next, objchildren[customproperties.Parent] do
                                if i > objindex then
                                    object.Position = object.Position + Vector2.new(0, sizediff)
                                    listindexes[customproperties.Parent][i] = listindexes[customproperties.Parent][i] + sizediff
                                end
                            end
                        end

                        customproperties.AbsoluteSize = v

                        changechildrenudim2size(self, v)
                        changechildrenudim2pos(self, v)

                        if customproperties.ClipsDescendants then
                            for _, object in next, objchildren[self] do
                                object.Visible = istouching(object.Position, object.Size, obj.Position, v) and objvisibles[object] or false
                            end
                        end

                        if customproperties.Parent and custompropertygets[mtobjs[customproperties.Parent]]("ClipsDescendants") then
                            obj.Visible = istouching(obj.Position, v, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size) and objvisibles[obj] or false
                            changechildrenvis(self, istouching(obj.Position, v, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size) and objvisibles[obj] or false)
                        end
                    else
                        if customproperties.Parent and listobjs[customproperties.Parent] then
                            local oldsize = obj.Size.Y
                            local sizediff = v.Y - oldsize

                            local objindex = table.find(objchildren[customproperties.Parent], obj)

                            listcontents[customproperties.Parent] = listcontents[customproperties.Parent] + sizediff
                            listadds[customproperties.Parent][obj] = listadds[customproperties.Parent][obj] + sizediff

                            for i, object in next, objchildren[customproperties.Parent] do
                                if i > objindex then
                                    object.Position = object.Position + Vector2.new(0, sizediff)
                                    listcontents[customproperties.Parent] = listcontents[customproperties.Parent] + sizediff
                                    listindexes[customproperties.Parent][i] = listindexes[customproperties.Parent][i] + sizediff
                                end
                            end
                        end

                        customproperties.AbsoluteSize = v

                        changechildrenudim2size(self, v)
                        changechildrenudim2pos(self, v)

                        if customproperties.ClipsDescendants then
                            for _, object in next, objchildren[self] do
                                object.Visible = istouching(object.Position, object.Size, obj.Position, v) and objvisibles[object] or false
                            end
                        end

                        if customproperties.Parent and custompropertygets[mtobjs[customproperties.Parent]]("ClipsDescendants") then
                            obj.Visible = istouching(obj.Position, v, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size) and objvisibles[obj] or false
                            changechildrenvis(self, istouching(obj.Position, v, mtobjs[customproperties.Parent].Position, mtobjs[customproperties.Parent].Size) and objvisibles[obj] or false)
                        end
                    end

                    if typeof(v) == "Vector2" then
                        v = Vector2.new(math.floor(v.X), math.floor(v.Y))
                    end
                end

                if k == "Parent" then
                    assert(type(v) == "table", "Invalid type " .. type(v) .. " for parent")

                    table.insert(objchildren[v], obj)
                    table.insert(objmtchildren[v], self)

                    changechildrenvis(v, mtobjs[v].Visible)

                    if udim2sizeobjs[obj] then
                        local newsize = udim2tovector2(udim2sizeobjs[obj], mtobjs[v].Size)
                        obj.Size = newsize

                        if custompropertygets[mtobjs[v]]("ClipsDescendants") then
                            obj.Visible = istouching(obj.Position, newsize, mtobjs[v].Position, mtobjs[v].Size) and objvisibles[obj] or false
                        end

                        changechildrenudim2pos(self, newsize)
                    end

                    if listobjs[v] then
                        table.insert(listchildren[v], obj)
                        table.insert(listindexes[v], listcontents[v] + (#listchildren[v] == 1 and 0 or objpaddings[v]))

                        local newpos = Vector2.new(0, listcontents[v] + (#listchildren[v] == 1 and 0 or objpaddings[v]))

                        if scrollobjs[v] then
                            newpos = Vector2.new(0, listcontents[v] + (#listchildren[v] == 1 and 0 or objpaddings[v]) + scrollpositions[v])
                        end

                        listadds[v][obj] = obj.Size.Y + (#listchildren[v] == 1 and 0 or objpaddings[v])

                        listcontents[v] = listcontents[v] + obj.Size.Y + (#listchildren[v] == 1 and 0 or objpaddings[v])

                        obj.Position = newpos

                        customproperties.AbsolutePosition = newpos

                        changechildrenpos(self, newpos)
                    end

                    if udim2posobjs[obj] then
                        local newpos = mtobjs[v].Position + udim2tovector2(udim2posobjs[obj], mtobjs[v].Size)
                        objpositions[obj] = udim2tovector2(udim2posobjs[obj], mtobjs[v].Size)
                        obj.Position = newpos
                        customproperties.AbsolutePosition = newpos

                        if custompropertygets[mtobjs[v]]("ClipsDescendants") then
                            obj.Visible = istouching(newpos, obj.Size, mtobjs[v].Position, mtobjs[v].Size) and objvisibles[obj] or false
                        end

                        changechildrenpos(self, newpos)
                    elseif shape ~= "Line" and shape ~= "Quad" and shape ~= "Triangle" then
                        local newpos = mtobjs[v].Position + obj.Position
                        obj.Position = newpos
                        customproperties.AbsolutePosition = newpos

                        if custompropertygets[mtobjs[v]]("ClipsDescendants") then
                            obj.Visible = istouching(newpos, obj.Size, mtobjs[v].Position, mtobjs[v].Size) and objvisibles[obj] or false
                        end

                        changechildrenpos(self, newpos)
                    end

                    if custompropertygets[mtobjs[v]]("ClipsDescendants") then
                        obj.Visible = istouching(obj.Position, obj.Size, mtobjs[v].Position, mtobjs[v].Size) and objvisibles[obj] or false
                    end
                    
                    customproperties.Parent = v
                    return
                end

                obj[k] = v
            end
        })

        objmts[obj] = mt
        mtobjs[mt] = obj
        objchildren[mt] = {}
        objmtchildren[mt] = {}

        if shape ~= "Line" and shape ~= "Quad" and shape ~= "Triangle" then
            mt.Position = Vector2.new(0, 0)
        end

        mt.Visible = true

        return mt
    end
	local LerpCIELUV
	--
	do -- CIELUV color space lerping
		-- Combines two colors in CIELUV space.
		-- function<function<Color3 result>(float t)>(Color3 fromColor, Color3 toColor)

		-- https://www.w3.org/Graphics/Color/srgb
		
		local clamp = math.clamp
		local C3 = Color3.new
		local black = C3(0, 0, 0)

		-- Convert from linear RGB to scaled CIELUV
		local function RgbToLuv13(c)
			local r, g, b = c.r, c.g, c.b
			-- Apply inverse gamma correction
			r = r < 0.0404482362771076 and r/12.92 or 0.87941546140213*(r + 0.055)^2.4
			g = g < 0.0404482362771076 and g/12.92 or 0.87941546140213*(g + 0.055)^2.4
			b = b < 0.0404482362771076 and b/12.92 or 0.87941546140213*(b + 0.055)^2.4
			-- sRGB->XYZ->CIELUV
			local y = 0.2125862307855956*r + 0.71517030370341085*g + 0.0722004986433362*b
			local z = 3.6590806972265883*r + 11.4426895800574232*g + 4.1149915024264843*b
			local l = y > 0.008856451679035631 and 116*y^(1/3) - 16 or 903.296296296296*y
			if z > 1e-15 then
				local x = 0.9257063972951867*r - 0.8333736323779866*g - 0.09209820666085898*b
				return l, l*x/z, l*(9*y/z - 0.46832)
			else
				return l, -0.19783*l, -0.46832*l
			end
		end

		function LerpCIELUV(c0, c1)
			local l0, u0, v0 = RgbToLuv13(c0)
			local l1, u1, v1 = RgbToLuv13(c1)

			return function(t)
				-- Interpolate
				local l = (1 - t)*l0 + t*l1
				if l < 0.0197955 then
					return black
				end
				local u = ((1 - t)*u0 + t*u1)/l + 0.19783
				local v = ((1 - t)*v0 + t*v1)/l + 0.46832

				-- CIELUV->XYZ
				local y = (l + 16)/116
				y = y > 0.206896551724137931 and y*y*y or 0.12841854934601665*y - 0.01771290335807126
				local x = y*u/v
				local z = y*((3 - 0.75*u)/v - 5)

				-- XYZ->linear sRGB
				local r =  7.2914074*x - 1.5372080*y - 0.4986286*z
				local g = -2.1800940*x + 1.8757561*y + 0.0415175*z
				local b =  0.1253477*x - 0.2040211*y + 1.0569959*z

				-- Adjust for the lowest out-of-bounds component
				if r < 0 and r < g and r < b then
					r, g, b = 0, g - r, b - r
				elseif g < 0 and g < b then
					r, g, b = r - g, 0, b - g
				elseif b < 0 then
					r, g, b = r - b, g - b, 0
				end

				return C3(
					-- Apply gamma correction and clamp the result
					clamp(r < 3.1306684425e-3 and 12.92*r or 1.055*r^(1/2.4) - 0.055, 0, 1),
					clamp(g < 3.1306684425e-3 and 12.92*g or 1.055*g^(1/2.4) - 0.055, 0, 1),
					clamp(b < 3.1306684425e-3 and 12.92*b or 1.055*b^(1/2.4) - 0.055, 0, 1)
				)
			end
		end
	end
	-- // Variables
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local GuiService = game:GetService("GuiService")
	local Workspace = game:GetService("Workspace")
	--
	-- // Functions
	function drawing:Tween(Render, RenderInfo, RenderTo)
		local Start = {}
		local CurrentTime = 0
		--
		local Connection
		--
		for Index, Value in pairs(RenderTo) do
			Start[Index] = Render[Index]
			RenderTo[Index] = (typeof(Value) == "Color3" and LerpCIELUV(Start[Index], Value) or (Value - Start[Index]))
		end
		--
		Connection = RunService.RenderStepped:Connect(function(Delta)
			if CurrentTime < RenderInfo.Time then
				CurrentTime = CurrentTime + Delta
				--
				local TweenedValue = TweenService:GetValue((CurrentTime / RenderInfo.Time), RenderInfo.EasingStyle, RenderInfo.EasingDirection)
				--
				for Index, Value in pairs(RenderTo) do
					if typeof(Value) == "number" then
						Render[Index] = (Value * TweenedValue) + Start[Index]
					elseif typeof(Value) == "Vector2" then
						Render[Index] = Vector2.new((Value.X * TweenedValue) + Start[Index].X, (Value.Y * TweenedValue) + Start[Index].Y)
					elseif typeof(Value) == "function" then
						Render[Index] = Value(TweenedValue)
					end
				end
			else
				Connection:Disconnect()
			end
		end)
	end
end