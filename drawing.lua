local drawing = loadstring(readfile('drawing.lua'))()

local fromrgb = Color3.fromRGB
local rand = math.random
local TabInsert = function(tab,value)
    if not table.find(tab,value) then
        table.insert(tab,value)
    end
end
local TabRemove = function(tab,value)
    if table.find(tab,value) then
        table.remove(tab,table.find(tab,value))
    end
end
if library and frame then
    library:Unload()
end
if frame and frame.exists then frame.Visible = false frame:Remove() end

getgenv().library = {
    zOrder = {
        window = 1000
    },
    tabs = {},
    tabsText = {},
    currentTab = nil,
    sectorHolders = {},
    flags = {},
    UpdateByFlag = {}, --idgaf about the name, im too lazy to get something better
    connections = {},
    location = ''
}
local utility = {
    Dragify = function(self,drag,frame)
        local frame = frame or drag
        local dragging = false 
        local dragInput 
        local dragStart 
        local startPos 
        local function update(input) 
            local delta = input.Position - dragStart 
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
        end 
        self.connect(drag.InputBegan,function(input) 
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
                dragging = true 
                dragStart = input.Position 
                startPos = frame.Position 

                input.Changed:Connect(function() 
                    if input.UserInputState == Enum.UserInputState.End then 
                        dragging = false 
                    end 
                end) 
            end 
        end) 
        self.connect(drag.InputChanged,function(input) 
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
                dragInput = input 
            end 
        end) 
        self.connect(game:GetService('UserInputService').InputChanged,function(input) 
            if input == dragInput and dragging then 
                update(input) 
            end 
        end)
    end,
    GetCenter = function(self,x,y)
        return UDim2.new(0.5,-x/2,0.5,-y/2)
    end,
    Draw = function(self,shape,properties)
        local instance = drawing:new(shape)
        local properties = properties or {}
        
        for i,v in pairs(properties) do
            instance[i] = v
        end
        return instance
    end,
    Outline = function(self,draw,color)
        local frame = self:Draw('Square',{
            Filled = true,
            ZIndex = draw.ZIndex-1,
            Color = color,
            Parent = draw,  
            Size = UDim2.new(1,2,1,2),
            Position = UDim2.new(0,-1,0,-1),
            Thickness = 0
        })
        return frame
    end,
    DoubleOutline = function(self,draw,color,color2)
        local frame = self:Draw('Square',{
            Filled = true,
            ZIndex = draw.ZIndex-1,
            Color = color,
            Parent = draw,  
            Size = UDim2.new(1,2,1,2),
            Position = Vector2.new(-1,-1),
            Thickness = 0
        })
        local frame2 = self:Outline(draw,color2)
        frame2.ZIndex -= 1
        frame2.Position = UDim2.new(0,-2,0,-2)
        frame2.Size = UDim2.new(1,4,1,4)
        return frame,frame2
    end,
    MakeSlider = function(self,slider,options,side) -- side is like if slider goes up-down or left-right
        local options = self.table(options or {})
        local min = options.min or 0
        local max = options.max or 100
        local float = options.float or 1
        local callback = options.callback or function() end
        local side = side or 'X'

        local sliding = false
        local function slide(input)
            local sizeX = ((input.Position[side] + (side == 'Y' and 36 or 0)) - slider.AbsolutePosition[side]) / (slider.AbsoluteSize[side])
            
            local value = ((max - min) * sizeX) + min
            value = math.clamp(value, min,max)
            value = math.floor(value*(1/float))/(1/float)
            callback(value)
        end
        self.connect(slider.InputBegan,function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                sliding = true
                slide(input)
            end                    
        end)
        self.connect(slider.InputEnded,function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                sliding = false
            end
        end)
        self.connect(game.UserInputService.InputChanged,function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                if sliding then
                    slide(input)
                end
            end                
        end)
    end,
    GetTextBounds = function(self,text,font)
        local text = self:Draw('Text',{
            Size = 13,
            Font = font,
            Text = text,
            Visible = true
        })
        local size = text.TextBounds
        text:Remove()
        return size
    end,
    _connections = {},
    connect = function(signal,func)
        local connection = signal:Connect(func)
        TabInsert(library.connections,connection)

        return connection
    end,
    disconnect = function(connection)
        local index = table.find(library.connections, connection)
        connection:Disconnect()
    
        if index then
            table.remove(library.connections, index)
        end
    end,
    table = function(tab)
        tbl = tab or {}

        local oldtbl = table.clone(tbl)
        table.clear(tbl)

        for i, v in next, oldtbl do
            if type(i) == "string" then
                tbl[i:lower()] = v
            else
                tbl[i] = v
            end
        end

        return tab
    end
}
local Themes = {
    ['Vozoid'] = {
        Border = fromrgb(56, 56, 56),
        
        Ascent = fromrgb(113, 93, 133),

        WindowBackground = fromrgb(30,30,35),
        TabBackground = fromrgb(20,20,25),

        ActiveTab = fromrgb(35,35,40),
        InActiveTab = fromrgb(25, 25, 25),

        Sectors = fromrgb(27, 27, 31),
        SectorsBackground = fromrgb(26, 26, 29),

        Text = fromrgb(240,240,240),
        InActiveText = fromrgb(145,145,145),

        Object = fromrgb(23,23,28), -- toggles n sliders n other shit

        success = fromrgb(95, 255, 90),
        error = fromrgb(255, 0, 0),
    },
    Custom = {
        Border = fromrgb(56, 56, 56),
        
        Ascent = fromrgb(113, 93, 133),

        WindowBackground = fromrgb(30,30,35),
        TabBackground = fromrgb(20,20,25),

        ActiveTab = fromrgb(35,35,40),
        InActiveTab = fromrgb(25, 25, 25),

        Sectors = fromrgb(27, 27, 31),
        SectorsBackground = fromrgb(26, 26, 29),

        Text = fromrgb(240,240,240),
        InActiveText = fromrgb(145,145,145),

        Object = fromrgb(23,23,28), -- toggles n sliders n other shit

        success = fromrgb(95, 255, 90),
        error = fromrgb(255, 0, 0),
    }
}
local settings = {
    Size = UDim2.new(0,600,0,700),
    Theme = 'Vozoid',
    Path = 'DrawingTesting'
}
local Theme = settings.Theme or 'Vozoid'
local path = settings.Path or '/'

local ThemeDrawings = {
    Border = {},
        
    Ascent = {},
    Object = {},

    WindowBackground = {},
    TabBackground = {},

    ActiveTab = {},
    InActiveTab = {},

    Sectors = {},
    SectorsBackground = {},

    Text = {},
    InActiveText = {},

}

local premade = {-- same shit as make slider but 100% premade rather than connections                                                                                       idea was not totally skidded from vozoid trust
    Dropdown = function(parent,choices,default,callback,min,max)
        local isOpen = false
        local chosen = {}
        local chosenHolders = {}
        local holders = {}
        local holdersName = {}

        local callback = callback or function()end

        
        local dropdown = utility:Draw('Square',{
            Parent = parent,
            Position = UDim2.new(0,0,0,15),
            ZIndex = library.zOrder.window+10,
            Size = UDim2.new(1,0,0,15),
            Filled = true,
            Color = Themes[Theme].Object
        })
        TabInsert(ThemeDrawings.Object,dropdown)
        local isOpened = utility:Draw('Text',{
            Parent = dropdown,
            Text = '+',
            Font = Drawing.Fonts["Plex"],
            Size = 13,
            ZIndex = library.zOrder.window+11,
            Position = UDim2.new(1,-13,0,0),
            Visible = true,
            Center = false,
            Color = Themes[Theme].Text,
            Outline = true                   
        })
        TabInsert(ThemeDrawings.Text,isOpened)
        local openText = utility:Draw('Text',{
            Parent = dropdown,
            Text = default=='__NONE__' and 'NONE' or default,
            Font = Drawing.Fonts["Plex"],
            Size = 13,
            ZIndex = library.zOrder.window+11,
            Position = UDim2.new(0,3,0,0),
            Visible = true,
            Center = false,
            Color = default=='__NONE__' and Themes[Theme].InActiveText or Themes[Theme].Text,
            Outline = true                   
        })
        TabInsert(ThemeDrawings[default == '__NONE__' and 'InActiveText' or 'Text'],openText)
        local optionsHolder = utility:Draw('Square',{
            Parent = dropdown,
            Position = UDim2.new(0,2,1,5),
            Size = UDim2.new(1,0,0,15),
            Transparency = 0,
            Visible = false
        })
        local options = utility:Draw('Square',{
            Parent = dropdown,
            Filled = true,
            Position = UDim2.new(0,0,1,3),
            Size = UDim2.new(1,0,0,15),
            ZIndex = library.zOrder.window+15,
            Color = Themes[Theme].Object,
            Visible = false
        })                
        TabInsert(ThemeDrawings.Object,options)
        optionsHolder:AddListLayout(2)
        local function UpdateOpen(boolean)
            isOpen = boolean
            options.Visible = isOpen
            optionsHolder.Visible = isOpen
            isOpened.Text = isOpen and '-' or '+'
        end
        local function UpdateText()
            local str = ''
            for i,v in pairs(chosen) do
                local length = utility:GetTextBounds(v,Drawing.Fonts["Plex"]).X
                if utility:GetTextBounds(str,Drawing.Fonts["Plex"]).X + length >= (dropdown.AbsoluteSize.X-15) then
                    str = str..'...'
                    break
                end
                str = str..tostring(v)..(i == #chosen and '' or ', ')
            end
        
            openText.Text = str =='' and 'NONE' or str
            openText.Color = str == '' and Themes[Theme].InActiveText or Themes[Theme].Text
        end

        local function update(index,shouldSet)
            local holder = holders[index]
            local name = holdersName[index]
            if not (holder and name) then print('not found',index) return end

            local label = holder:GetChildren()[1]
            print(label.Text)
            if table.find(chosen,label.Text) then -- is chosen/trying to remove?
                --local next = #chosen - 1
                if shouldSet then return end
                if #chosen == min then
                    return
                end
                label.Color = Themes[Theme].InActiveText
                TabRemove(chosenHolders,holder)
                TabRemove(chosen,label.Text)
                callback(max == 1 and chosen[1] or chosen)
                --library.flags[flag] = max == 1 and chosen[1] or chosen                    
            else
                if #chosen == max then
                    chosenHolders[1]:GetChildren()[1].Color = Themes[Theme].InActiveText
                    table.remove(chosen,1)
                    table.remove(chosenHolders,1)
                end
                table.insert(chosen,name)
                table.insert(chosenHolders,holder)
                label.Color = Themes[Theme].Text
            end 
        
            UpdateText()

            local draw = ThemeDrawings[#chosen == 0 and 'InActiveText' or 'Text']
            local reversed = ThemeDrawings[#chosen == 0 and 'Text' or 'InActiveText']
            TabInsert(draw,openText)
            TabRemove(reversed,openText)

            local value = (max == 1 and chosen[1] == nil and 1 or chosen[1]) or chosen
            if typeof(value) == 'number' then value = nil end
            callback(value)
            --library.flags[flag] = value 

        end


        local function updateOptions(optionss,default)
            for i,v in pairs(optionss) do
               local holder = utility:Draw('Square',{
                    Parent = optionsHolder,
                    ZIndex = options.ZIndex+2,
                    Filled = true,
                    Position = UDim2.new(0,2,0,0),
                    Size = UDim2.new(1,-4,0,15),
                    Color = Themes[Theme].Object,
                    Visible = true
                })
                TabInsert(ThemeDrawings.Object,holder)
                local t = utility:Draw('Text',{
                    Parent = holder,
                    Text = v,
                    Font = Drawing.Fonts["Plex"],
                    Size = 13,
                    ZIndex = holder.ZIndex+1,
                    Position = UDim2.new(0,5,0,0),
                    Visible = true,
                    Center = false,
                    Color = Themes[Theme].InActiveText,
                    Outline = true                   
                })
                TabInsert(ThemeDrawings.InActiveText,t)
                 --
                if v == default then
                    TabInsert(chosen,v)
                    TabInsert(chosenHolders,holder)
                    t.Color = Themes[Theme].Text
                    TabInsert(ThemeDrawings.Text,t)
                    TabRemove(ThemeDrawings.InActiveText,t)
                end
                --               
                TabInsert(holders,holder)
                TabInsert(holdersName,v)
                local sig;sig = utility.connect(holder.MouseButton1Down,function()
                    if not holder then return utility.disconnect(sig) end
                    update(i)
                end)
                --
                holder.MouseEnter:Connect(function()
                    t.OutlineColor = Themes[Theme].Ascent
                end)
                holder.MouseLeave:Connect(function()
                    t.OutlineColor = fromrgb()
                end)
                options.Size = UDim2.new(1,0,0,optionsHolder.AbsoluteContentSize+4)
                local old = optionsHolder.Parent.Position
                optionsHolder.Parent.Position = UDim2.new()
                optionsHolder.Parent.Position = old
            end
        end
        updateOptions(choices,default)

        utility.connect(dropdown.MouseButton1Click,function()
            UpdateOpen(not isOpen)
        end)



        utility:DoubleOutline(dropdown,Themes[Theme].Border,fromrgb(10,10,10))
        utility:DoubleOutline(options,Themes[Theme].Border,fromrgb(10,10,10))

        local dropdownFuncs = {}
        dropdownFuncs.UpdateOptions = function(self,tab,default)
            for i,v in pairs(ThemeDrawings.Object) do
                TabRemove(ThemeDrawings.Object,v)
            end
            for i,v in pairs(holders) do
                if not v.exists then continue end
                v:Remove()
            end
            table.clear(holders)
            table.clear(holdersName)
            table.clear(chosenHolders)

            local default = default or nil

            updateOptions(tab,default)
            table.clear(chosen)
            if default ~= nil then
                TabInsert(chosen,default)
            end
            UpdateText()
        end
        local funcs = {
            Update = update
        }
        return funcs,dropdownFuncs,dropdown
    end,
    Scroll = function(parent,choices,default,callback)
        local scroll = utility:Draw('Square',{
            Parent = parent,
            Size = UDim2.new(1,-4,0,50),
            Visible = true,
            Filled = true,
            Position = UDim2.new(0,0,0,10),
            ZIndex = library.zOrder.window+10,
            Color = Themes[Theme].Object
        })
        TabInsert(ThemeDrawings.Object,scroll)
        local choicesHolder = utility:Draw('Square',{
            Parent = scroll,
            Position = UDim2.new(0,0,0,2),
            Size = UDim2.new(1,0,1,-4)
        })
        choicesHolder:AddListLayout(2)
        local choice = {text = '',holder = nil}
        local holders = {}
        for i,v in pairs(choices) do
            local Textholder = utility:Draw('Square',{
                Parent = choicesHolder,
                Size = UDim2.new(1,-4,0,15),
                --Position = UDim2.new(0,4,0,0)
                ZIndex = scroll.ZIndex+1,
                Transparency = 0
            })
            local text = utility:Draw('Text',{
                Parent = Textholder,
                Size = 13,
                Text = v,
                ZIndex = scroll.ZIndex+1,
                Position = UDim2.new(0,4,0,0),
                Font = Drawing.Fonts["Plex"],
                Color = Themes[Theme].InActiveText,
                Outline = true
            })
            TabInsert(ThemeDrawings.InActiveText,text)
            if default == v then
                text.Color = Themes[Theme].Text
                TabRemove(ThemeDrawings.InActiveText,#ThemeDrawings.InActiveText)
                TabInsert(ThemeDrawings.Text,text)
                choice.holder = text
                choice.text = v
                --library.flags[flag] = v
                callback(v)
            end
            Textholder.MouseEnter:Connect(function()
                text.OutlineColor = Themes[Theme].Ascent
            end)
            Textholder.MouseLeave:Connect(function()
                text.OutlineColor = fromrgb()
            end)
            Textholder.MouseButton1Click:Connect(function()
                if choice.holder then
                    choice.holder.Color = Themes[Theme].InActiveText
                    TabInsert(ThemeDrawings.InActiveText,choice.Holder)
                    TabRemove(ThemeDrawings.Text,choice.Holder)
                end
                text.Color = Themes[Theme].Text
                TabInsert(ThemeDrawings.Text,text)
                TabRemove(ThemeDrawings.InActiveText,text)
                choice.holder = text
                choice.text = v
                --library.flags[flag] = v
                callback(v)
            end)

            holders[v] = text
            scroll.Size = UDim2.new(1,-4,0,choicesHolder.AbsoluteContentSize+4)

        end

        local scrollFuncs = {}
        function scrollFuncs:Update(option)
            if table.find(choices,option) then
                if choice.holder then
                    choice.holder.Color = Themes[Theme].InActiveText
                    TabInsert(ThemeDrawings.InActiveText,choice.Holder)
                    TabRemove(ThemeDrawings.Text,choice.Holder)
                end

                holders[option].Color = Themes[Theme].Text
                TabInsert(ThemeDrawings.Text, holders[option])
                TabRemove(ThemeDrawings.InActiveText,holders[option])
                choice.text = option
                choice.holder = holders[option]
                callback(option)
            end
        end

        utility:DoubleOutline(scroll,Themes[Theme].Border,fromrgb(10,10,10))
        return choicesHolder,scrollFuncs
    end

}


local decode = (syn and syn.crypt.base64.decode) or (crypt and crypt.base64decode) or base64_decode
local images = {
    alpha = decode("iVBORw0KGgoAAAANSUhEUgAAABIAAAAKBAMAAABLZROSAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAGUExURb+/v////5nD/3QAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAVSURBVBjTY2AQhEIkliAWSLY6QQYAknwC7Za+1vYAAAAASUVORK5CYII="),    colorpicker = decode('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'),
    hue = decode("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"),
    alphapicker = decode("iVBORw0KGgoAAAANSUhEUgAAAAkAAABuCAYAAAD1YDnyAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFMSURBVFhHvZMhTMNQFEX/WOZwKBwON4dDNMHN4XBzc3M43BwOh8PhULip1s3hcLg53Nxcue9mIy/ty/8kDfcktzlpsv97xEZ1XacjVVUdLKWmaQ6W0slfNmrbdgIh/tf+1PCX3YUvu7MPP4WQQR8evuzO6s4gRFN3DiG5unFpvaOjWd0FhOTqwiv8ekdHs7pLCNHUTSFEU3cFIZq6awjR1N1AiKZuBiG5uuLsEX6Hn9XdQkiurjh7hFf4Wd0dhGjq5hCiqVtAiKZuCSGaunsI0dQ9QMjguuKsbgUhg+uKs7pHCNHUPUGIpu4ZQjR1LxCiqXuFEE3dG4Ro6t4hJFcX/mv9ekdHs7o1hOTqwiv8ekdHs7rfOzR1GwjR1H1AiKbuE0I0dV8QoqnbQkiurjh7hN/hZ3XfEJKrK84e4RV+VreDEE3dHkL+uy6NfwDz0OfO0eCa+AAAAABJRU5ErkJggg==")
}
--skidded from vozoid cuz lazy
local allowedcharacters = {}
local shiftcharacters = {
    ["1"] = "!",
    ["2"] = "@",
    ["3"] = "#",
    ["4"] = "$",
    ["5"] = "%",
    ["6"] = "^",
    ["7"] = "&",
    ["8"] = "*",
    ["9"] = "(",
    ["0"] = ")",
    ["-"] = "_",
    ["="] = "+",
    ["["] = "{",
    ["\\"] = "|",
    [";"] = ":",
    ["'"] = "\"",
    [","] = "<",
    ["."] = ">",
    ["/"] = "?",
    ["`"] = "~"
}

for i = 32, 126 do
    TabInsert(allowedcharacters, utf8.char(i))
end

local keys = {
    [Enum.KeyCode.LeftShift] = "L-SHIFT",
    [Enum.KeyCode.RightShift] = "R-SHIFT",
    [Enum.KeyCode.LeftControl] = "L-CTRL",
    [Enum.KeyCode.RightControl] = "R-CTRL",
    [Enum.KeyCode.LeftAlt] = "L-ALT",
    [Enum.KeyCode.RightAlt] = "R-ALT",
    [Enum.KeyCode.CapsLock] = "CAPSLOCK",
    [Enum.KeyCode.One] = "1",
    [Enum.KeyCode.Two] = "2",
    [Enum.KeyCode.Three] = "3",
    [Enum.KeyCode.Four] = "4",
    [Enum.KeyCode.Five] = "5",
    [Enum.KeyCode.Six] = "6",
    [Enum.KeyCode.Seven] = "7",
    [Enum.KeyCode.Eight] = "8",
    [Enum.KeyCode.Nine] = "9",
    [Enum.KeyCode.Zero] = "0",
    [Enum.KeyCode.KeypadOne] = "NUM-1",
    [Enum.KeyCode.KeypadTwo] = "NUM-2",
    [Enum.KeyCode.KeypadThree] = "NUM-3",
    [Enum.KeyCode.KeypadFour] = "NUM-4",
    [Enum.KeyCode.KeypadFive] = "NUM-5",
    [Enum.KeyCode.KeypadSix] = "NUM-6",
    [Enum.KeyCode.KeypadSeven] = "NUM-7",
    [Enum.KeyCode.KeypadEight] = "NUM-8",
    [Enum.KeyCode.KeypadNine] = "NUM-9",
    [Enum.KeyCode.KeypadZero] = "NUM-0",
    [Enum.KeyCode.Minus] = "-",
    [Enum.KeyCode.Equals] = "=",
    [Enum.KeyCode.Tilde] = "~",
    [Enum.KeyCode.LeftBracket] = "[",
    [Enum.KeyCode.RightBracket] = "]",
    [Enum.KeyCode.RightParenthesis] = ")",
    [Enum.KeyCode.LeftParenthesis] = "(",
    [Enum.KeyCode.Semicolon] = ",",
    [Enum.KeyCode.Quote] = "'",
    [Enum.KeyCode.BackSlash] = "\\",
    [Enum.KeyCode.Comma] = ",",
    [Enum.KeyCode.Period] = ".",
    [Enum.KeyCode.Slash] = "/",
    [Enum.KeyCode.Asterisk] = "*",
    [Enum.KeyCode.Plus] = "+",
    [Enum.KeyCode.Period] = ".",
    [Enum.KeyCode.Backquote] = "`",
    [Enum.UserInputType.MouseButton1] = "MOUSE-1",
    [Enum.UserInputType.MouseButton2] = "MOUSE-2",
    [Enum.UserInputType.MouseButton3] = "MOUSE-3"
}
--
local userinputservice = game.UserInputService
local capslock = userinputservice:IsKeyDown('CapsLock')
utility.connect(userinputservice.InputBegan,function(input)
    if input.KeyCode == Enum.KeyCode.CapsLock then
        capslock = not capslock
    end
end)
--
function library:Unload()
    if frame.exists then
        frame.Visible = false
        frame:Remove()
    end
    game.ContextActionService:UnbindAction('disablekeyboard')
    for signal,connection in pairs(library.connections) do
        connection:Disconnect()
    end
end

function library:init(options)
    local options = utility.table(options or {})
    
    Theme = (options.theme and Themes[options.theme] and options.theme) or settings.Theme
    path = options.folder or settings.Path
    makefolder(path)
    makefolder(path..'/themes')
    makefolder(path..'/cfgs')

    getgenv().frame = utility:Draw('Square',{
        Thickness = 0,
        Color = Themes[Theme].WindowBackground,
        Size = settings.Size,
        ZIndex = library.zOrder.window,
        Filled = true,
        Position = utility:GetCenter(settings.Size.X.Offset,settings.Size.Y.Offset)
    })
    TabInsert(ThemeDrawings.WindowBackground,frame)
    --
    local border = utility:DoubleOutline(frame,Themes[Theme].Border,fromrgb(10,10,10))
    TabInsert(ThemeDrawings.Border,border)
    -- dragify handler
    local dragify = utility:Draw('Square',{
        Parent = frame,
        Visible = true,
        Transparency = 0,
        ZIndex = library.zOrder.window+1,
        Size = UDim2.new(1,0,1,0),
        Color = Color3.fromRGB(255,255,255),
        Filled = true
    })
    utility:Dragify(dragify,frame)
    -- Name handler
    local holder = utility:Draw('Square',{
        Size = UDim2.new(1,0,1,0),
        Position = UDim2.new(0,5,0,5),
        Parent = frame,
        ZIndex = library.zOrder.window+1,
        Filled = true,
        Visible = true,
        Transparency = 0
    })
    local name = utility:Draw('Text',{
        Text = options.name or 'SamuelPaste $$$',
        Size = 13,
        Font = Drawing.Fonts['Plex'],
        Color = Color3.fromRGB(255,255,255),
        Parent = holder,
        Center = false,
        Outline = true,
        ZIndex = library.zOrder.window+1
    })
    holder.Size = name.TextBounds

    -- Tab handler
    local backgroundTab = utility:Draw('Square',{
        Parent = frame,
        Position = UDim2.new(0,7,0,25),
        Size =  UDim2.new(1,-14,1,-32),
        Filled = true,
        ZIndex = library.zOrder.window+2,
        Color = Themes[Theme].TabBackground,
        Thickness = 0
    })
    TabInsert(ThemeDrawings.TabBackground,backgroundTab)
    local border = utility:DoubleOutline(backgroundTab,fromrgb(10,10,10),Themes[Theme].Border)
    TabInsert(ThemeDrawings.Border,border)
    -- Tabs handler

    local TabsHolder = utility:Draw('Square',{
        Parent = backgroundTab,
        Position = UDim2.new(0,8,0,8),
        Size = UDim2.new(1,-16,1,-16),
        Visible = true,
        Filled = true,
        ZIndex = library.zOrder.window+3,
        Color  = Themes[Theme].SectorsBackground
    })
    TabInsert(ThemeDrawings.SectorsBackground,TabsHolder)
    local border = utility:DoubleOutline(TabsHolder,Themes[Theme].Border,fromrgb(10,10,10))
    TabInsert(ThemeDrawings.Border,border)
    function library:Tab(name)  
        local tab = utility:Draw('Square',{
            Parent = TabsHolder,
            Filled = true,
            Color = fromrgb(32, 32, 32),
            Position = UDim2.new(0,0,0,0),
            Size = UDim2.new(0,0,0,15),
            Visible = true,
            ZIndex = library.zOrder.window+4
        })
        local border = utility:Outline(tab,Themes[Theme].Border)
        TabInsert(ThemeDrawings.Border,border)
        library.currentTab = library.currentTab or tab
        utility.connect(tab.MouseButton1Down,function()
            library.currentTab.Color = Themes[Theme].InActiveTab
            if library.sectorHolders[library.currentTab] then
                library.sectorHolders[library.currentTab].Visible = false
            end                
            library.currentTab = tab
            tab.Color = Themes[Theme].ActiveTab
            if library.sectorHolders[tab] then
                library.sectorHolders[tab].Visible = true
            end            
        end)
        TabInsert(ThemeDrawings.Border,utility:Draw('Square',{ -- additional outline
            Parent = tab,
            Filled = true,
            Color = Themes[Theme].Border,
            Position = UDim2.new(1,0,0,0),
            Size = UDim2.new(0,1,1,0),
            Visible = true,
            ZIndex = library.zOrder.window+5
        }))
        
        local text = utility:Draw('Text',{
            Text = name,
            Size = 13,
            Font = Drawing.Fonts['Plex'],
            Color = Color3.fromRGB(255,255,255),
            Parent = tab,
            Center = true,
            Outline = true,
            ZIndex = library.zOrder.window+5,
            Position = UDim2.new(0.5,0,0.5,7)
        })
        ---------
        TabInsert(library.tabs,tab)        
        TabInsert(library.tabsText,text)
        local tabSize = TabsHolder.AbsoluteSize.X/#library.tabs
        for i,v in pairs(library.tabs) do
            v.Size = UDim2.new(0,tabSize,0,18)
            v.Position = UDim2.new(0,tabSize*(i-1),0,0)
            if library.currentTab == v then
                v.Color = Themes[Theme].ActiveTab
                TabInsert(ThemeDrawings.ActiveTab,v)
                TabRemove(ThemeDrawings.InActiveTab,v)
            else
                v.Color = Themes[Theme].InActiveTab
                TabInsert(ThemeDrawings.InActiveTab,v)
                TabRemove(ThemeDrawings.ActiveTab,v)
            end
            if library.sectorHolders[v] then
                library.sectorHolders[v].Position = UDim2.new(0,-tabSize*(i-1),1,1)
            end
        end
        for i,v in pairs(library.tabsText) do
            v.Position = UDim2.new(0.5,0,0.5,-v.TextBounds.Y/2) -- 0.45,-(v.TextBounds.Y/2)
        end
        ---------



        local sectorsFuncs = {}
        local sectors = {right={},left={}} 
        local sectorsHolder = utility:Draw('Square',{
            Parent = tab,
            Size = TabsHolder.AbsoluteSize-Vector2.new(0,19),
            Position = UDim2.new(0,-tabSize*(#library.tabs-1),1,1),
            Filled = true,
            Color = fromrgb(rand(1,255),rand(1,255),rand(1,255)),
            Visible = library.currentTab == tab,
            ZIndex = library.zOrder.window+6,
            Transparency = 0
        })
        library.sectorHolders[tab] = sectorsHolder
        if library.currentTab ~= tab then
            library.sectorHolders[tab].Visible = false
        end
        local LeftHolder = utility:Draw('Square',{
            Filled = true,
            Parent = sectorsHolder,
            Position = UDim2.new(0,6,0,20),
            Size = UDim2.new(0.5,-10,99999,1),
            ZIndex = library.zOrder.window+7,
            Visible = true,
            Transparency = 0
        })
        local RightHolder = utility:Draw('Square',{
            Parent = sectorsHolder,
            ZIndex = library.zOrder.window+7,
            Position = UDim2.new(0.5,4,0,20),
            Size = UDim2.new(0.5,-10,99999,0),
            Filled = true,
            Transparency = 0
        })    
        RightHolder:AddListLayout(20)
        LeftHolder:AddListLayout(20)
        function sectorsFuncs:Section(options)
            local sectionFuncs = {}

            local options = utility.table(options or {})
            local name = options.name or ''
            local side = options.side or 'Left'

            local section = utility:Draw('Square',{
                Size = UDim2.new(1,0,0,31),
                ZIndex = library.zOrder.window+8,
                Color = Themes[Theme].Sectors,
                Filled = true,
                --Position = UDim2.new(0,0,0,offsets[side:lower()])
                Parent = side == 'Left' and LeftHolder or RightHolder,
            })
            TabInsert(ThemeDrawings.Sectors,section)
            local outline1,outline2 = utility:DoubleOutline(section,Themes[Theme].Border,fromrgb(10,10,10))
            TabInsert(ThemeDrawings.Border,outline1)
            outline1.Position = Vector2.new(-1,0)
            outline1.Size = UDim2.new(1,2,1,1)


            local outlineUpRight = utility:Draw('Square',{
                Parent = section,
                ZIndex = section.ZIndex+1,
                Position = UDim2.new(0,-1,0,-1),
                Filled = true,
                Size = Vector2.new(10,1),
                Visible = true,
                Color = Themes[Theme].Border
            })
            local outlineUpLeft = utility:Draw('Square',{
                Parent = section,
                ZIndex = section.ZIndex+1,
                Position = UDim2.new(1,1,0,-1),
                Filled = true,
                Size = Vector2.new(-10,1),
                Visible = true,
                Color = Themes[Theme].Border
            })          
            local sectionName = utility:Draw('Text',{
                Parent = section,
                Text = name,
                Size = 13,
                Font = Drawing.Fonts["Plex"],
                --Position = UDim2.new(0.25,0,0,0),
                ZIndex = section.ZIndex + 2,
                Color = Themes[Theme].Text,
                Center = false,
                Outline = true
            })
            TabInsert(ThemeDrawings.Border,outlineUpRight)
            TabInsert(ThemeDrawings.Border,outlineUpLeft)
            TabInsert(ThemeDrawings.Text,sectionName)
            sectionName.Position = UDim2.new(0,35,0,-(sectionName.TextBounds.Y/2)-3)
            outlineUpRight.Size = Vector2.new((sectionName.AbsolutePosition.X+sectionName.TextBounds.X-outlineUpRight.AbsolutePosition.X-sectionName.TextBounds.X)-5,1)
            outlineUpLeft.Size = Vector2.new((sectionName.AbsolutePosition.X+sectionName.TextBounds.X-outlineUpLeft.AbsolutePosition.X)+5,1)
            --
            local contentHolder = utility:Draw('Square',{
                Parent = section,
                Transparency = 0,
                Size = UDim2.new(1, -16, 1, -20),
                Position = UDim2.new(0, 8, 0, 10),
            })
            contentHolder:AddListLayout(8)

            local function UpdateSize()
                section.Size = UDim2.new(1,0,0,contentHolder.AbsoluteContentSize+20)
                local old = section.Parent.Position    
                section.Parent.Position = UDim2.new()
                section.Parent.Position = old   
            end



            function sectionFuncs:Button(options)
                local options = utility.table(options or {})

                local name = options.name or 'NO NAME DEFINED'
                local callback = options.callback or function() end
                
                local button = utility:Draw('Square',{
                    Parent = contentHolder,
                    Position = UDim2.new(0,0,1,-13),
                    Size = UDim2.new(1,-1,0,15),
                    ZIndex = library.zOrder.window+10,
                    Filled = true,
                    Color = Themes[Theme].Object
                })
                TabInsert(ThemeDrawings.Object,button)
                local text = utility:Draw('Text',{
                    Parent = button,
                    Text = name,
                    Font = Drawing.Fonts["Plex"],
                    Size = 13,
                    ZIndex = library.zOrder.window+10,
                    --Position = UDim2.new(0.5,0,0.20,0),
                    Visible = true,
                    Center = true,
                    Color = Themes[Theme].Text,
                    Outline = true
                })
                TabInsert(ThemeDrawings.Text,text)
                text.Position = UDim2.new(0.5,0,0.5,-text.TextBounds.Y/2)
                local outline = utility:DoubleOutline(button,Themes[Theme].Border,fromrgb(10,10,10))
                utility.connect(button.MouseEnter,function()
                    outline.Color = Themes[Theme].Ascent
                end)
                utility.connect(button.MouseLeave,function()
                    outline.Color = Themes[Theme].Border
                end)
                utility.connect(button.MouseButton1Click,function()
                    local success,msg = pcall(callback)
                    text.Color = success and Themes[Theme].success or Themes[Theme].error
                    if not success then error(msg) error(debug.traceback()) end
                    task.wait(1)
                    text.Color = Themes[Theme].Text
                end)
                section.Size = UDim2.new(1,0,0,contentHolder.AbsoluteContentSize+20) 
                local old = section.Parent.Position    
                section.Parent.Position = UDim2.new()
                section.Parent.Position = old      
            end
            function sectionFuncs:Toggle(options)
                local options = utility.table(options or {})
                local active = false

                local name = options.name or 'NOT DEFINED'
                local callback = options.callback or function() end
                local flag = options.flag or ''

                library.flags[flag] = false

                local holder = utility:Draw('Square',{
                    Parent = contentHolder,
                    ZIndex = library.zOrder.window+12,
                    Visible = true,
                    Filled = true,
                    Position = UDim2.new(0,0,1,-10),
                    Size = UDim2.new(1,0,0,10),
                    Transparency = 0
                })
                local toggle = utility:Draw('Square',{
                    Parent = holder,
                    ZIndex = library.zOrder.window+10,
                    Visible = true,
                    Color = Themes[Theme].Object,
                    Filled = true,
                    Position = UDim2.new(0,0,0,0),
                    Size = UDim2.new(0,10,0,10)
                })
                TabInsert(ThemeDrawings.Object,toggle)
                local border = utility:DoubleOutline(toggle,Themes[Theme].Border,fromrgb(10,10,10))
                TabInsert(ThemeDrawings.Border,border)
                local text = utility:Draw('Text',{
                    Parent = holder,
                    Text = name,
                    Font = Drawing.Fonts["Plex"],
                    Size = 13,
                    ZIndex = library.zOrder.window+10,
                    --Position = UDim2.new(0.5,0,0.20,0),
                    Visible = true,
                    Center = false,
                    Color = Themes[Theme].Text,
                    Outline = true
                })
                TabInsert(ThemeDrawings.Text,text)
                text.Position = UDim2.new(0,15,0.5,-text.TextBounds.Y/2-1)
                local function update()
                    toggle.Color = active and Themes[Theme].Ascent or Themes[Theme].Object

                    local tab = ThemeDrawings[active and 'Ascent' or 'Object']
                    local reversed = ThemeDrawings[active and 'Object' or 'Ascent']
                    TabInsert(tab,toggle)
                    TabRemove(reversed,toggle)

                    callback(active)
                    library.flags[flag] = active
                end
                update()
                utility.connect(holder.MouseButton1Click,function()
                    active = not active
                    update()
                end)
                if options.default then
                    active = true
                    update()
                end
                library.UpdateByFlag[flag] = function(boolean)
                    active = boolean
                    update()
                end
                UpdateSize()
                local togglefuncs = {}
                local additionals = {}

                function togglefuncs:ColorPicker(options)
                    local options = utility.table(options or {})

                    local flag = options.flag or flag..'__COLOR'
                    local default = options.default and Color3.fromHSV(options.default:ToHSV()) or Color3.fromHSV(0, 0.0, 1)
                    local callback = options.callback or function() end

                    library.flags[flag] = {Color = default,Transparency = 0}
                    --
                    local button = utility:Draw('Square',{
                        Parent = holder,
                        Size = UDim2.new(0,15,0,10),
                        Position = UDim2.new(1,-(15*(#additionals+1)+1),0,0),
                        Visible = true,
                        ZIndex = library.zOrder.window+13,
                        Filled = true,
                        Color = fromrgb(255,0,0)
                    })
                    if #additionals ~= 0 then
                        button.Position = UDim2.new(1,-((20*#additionals)+15),0,0)
                    end
                    TabInsert(additionals,button)
                    local alphaButton = utility:Draw('Image',{
                        Parent = button,
                        ZIndex = button.ZIndex+1,
                        Data = images.alpha,
                        Size = UDim2.new(1,0,1,0)
                    })
                    utility:DoubleOutline(button,Themes[Theme].Border,fromrgb(10,10,10))
                    --
                    --
                    --
                    --
                    --
                    local pickerHandler = utility:Draw('Square',{
                        Parent = button,
                        Size = UDim2.new(0,210,0,180),
                        Position = UDim2.new(0,0,1,3),
                        Filled = true,
                        ZIndex = library.zOrder.window+20,
                        Visible = false,
                        Color = Themes[Theme].Object
                    })
                    TabInsert(ThemeDrawings.Object,pickerHandler)
                    utility.connect(button.MouseButton1Click,function()
                        pickerHandler.Visible = not pickerHandler.Visible
                    end)
                    local border = utility:DoubleOutline(pickerHandler,Themes[Theme].Border,fromrgb(10,10,10))
                    TabInsert(ThemeDrawings.Border,border)
                    --
                    --
                    --
                    --
                    --
                    local colorpicker = utility:Draw('Square',{
                        Parent = pickerHandler,
                        Size = UDim2.new(0,180,0,150),
                        Position = UDim2.new(0,5,0,5),
                        ZIndex = pickerHandler.ZIndex+2,
                        Filled = true,
                        Color = fromrgb(255,0,0)
                    })
                    local colorPointerHandler = utility:Draw('Square',{
                        Parent = colorpicker,
                        Size = UDim2.new(1,-5,1,-5),
                    })
                    local colorPointer = utility:Draw('Square',{
                        Parent = colorPointerHandler,
                        ZIndex = colorpicker.ZIndex+3,
                        Position = UDim2.new(0.5,0,0.5,0),
                        Size = UDim2.new(0,5,0,5),
                        Filled = true,
                        Color = fromrgb(255,255,255)
                    })
                    --TabInsert(ThemeDrawings.Text,colorPointer)
                    utility:Draw('Image',{
                        Parent = colorpicker,
                        ZIndex = colorpicker.ZIndex+1,
                        Visible = true,
                        Data = images.colorpicker,
                        Size = UDim2.new(1,0,1,0)
                    })
                    local border = utility:DoubleOutline(colorpicker,Themes[Theme].Border,fromrgb(10,10,10))
                    TabInsert(ThemeDrawings.Border,border)
                    utility:Outline(colorPointer,fromrgb())
                    --
                    local huepicker = utility:Draw('Square',{
                        Parent = pickerHandler,
                        ZIndex = pickerHandler.ZIndex+2,
                        Filled = true,
                        Position = UDim2.new(0,5,0,163),
                        Size = UDim2.new(0,200,0,11),
                        Color = Themes[Theme].Border
                    })
                    --TabInsert(ThemeDrawings.Border,huepicker)
                    local huePointerHandler = utility:Draw('Square',{
                        Parent = huepicker,
                        Position = UDim2.new(0,1,0,0),
                        Size = UDim2.new(1,-4,1,0)
                    })
                    local huePointer = utility:Draw('Square',{
                        Parent = huePointerHandler,
                        ZIndex = huepicker.ZIndex+4,
                        Filled = true,
                        Position = UDim2.new(0.5,0,0,1),
                        Size = UDim2.new(0,2,1,-2),
                        Color = fromrgb(255,255,255)
                    })
                    --TabInsert(ThemeDrawings.Text,huePointer)
                    utility:Outline(huePointer,fromrgb())
                    utility:Draw('Image',{
                        Parent = huepicker,
                        ZIndex = huepicker.ZIndex+1,
                        Visible = true,
                        Data = images.hue,
                        Size = UDim2.new(1,-2,1,-2),
                        Position = UDim2.new(0,1,0,1)
                    })
                    --
                    local alphaframe = utility:Draw('Square',{
                        Parent = pickerHandler,
                        ZIndex = pickerHandler.ZIndex+2,
                        Filled = true,
                        Position = UDim2.new(0,192,0,4),
                        Size = UDim2.new(0,11,0,152),
                        Color = colorpicker.Color
                    })
                    local alphaPointerHandler = utility:Draw('Square',{
                        Parent = alphaframe,
                        Transparency = 0,
                        Filled = true,
                        Size = UDim2.new(1,0,1,-2),
                        Position = UDim2.new(0,0,0,0)
                    })
                    local alphaPointer = utility:Draw('Square',{
                        Parent = alphaPointerHandler,
                        ZIndex = alphaframe.ZIndex+4,
                        Filled = true,
                        Position = UDim2.new(0,0,0,0),
                        Size = UDim2.new(1,0,0,2),
                        Color = fromrgb(255,255,255)
                    })
                    --TabInsert(ThemeDrawings.Text,alphaPointer)
                    utility:Outline(alphaPointer,fromrgb())
                    utility:Draw('Image',{
                        Parent = alphaframe,
                        ZIndex = alphaframe.ZIndex+1,
                        Visible = true,
                        Data = images.alphapicker,
                        Size = UDim2.new(1,0,1,0),
                    })               
                    TabInsert(ThemeDrawings.Object,utility:Outline(alphaframe,Themes[Theme].Border))
                    ----------------------------------------------
                    local r,g,b = default:ToHSV()
                    local hue = math.clamp(r,0.001,1)
                    local saturation = math.clamp(g,0.001,1)
                    local val = math.clamp(b,0.001,1)
                    local alpha = 0

                    local col = {Color = Color3.new(default.R,default.B,default.G),Transparency=alpha}
                    local function set(color,modifyPos)
                        local _,saturation,val = color:ToHSV()
                        if modifyPos then
                            hue = _
                            colorPointer.Position = UDim2.new(saturation, 0, 1-val, 0)       
                            huePointer.Position = UDim2.new(hue, 0, 0, 1)
                        end
                        colorpicker.Color = Color3.fromHSV(hue,1,1)
                        alphaframe.Color = Color3.fromHSV(hue,1,1)
                        button.Color = color

                        local color1 = {Color = color,Transparency = alpha}
                        library.flags[flag] = color1
                        callback(color1)
                    end
                    set(default,true)
                    alphaButton.Transparency = alpha

                    utility:MakeSlider(huepicker,{min=0,max=1,float=0.01,callback = function(value)
                        huePointer.Position = UDim2.new(value, 0, 0, 1)
                        hue = value
                        
                        set(Color3.fromHSV(hue,saturation,val))
                    end})

                    --
                    utility:MakeSlider(colorpicker,{min=0,max=1,float=0.001,callback = function(value)
                        colorPointer.Position = UDim2.new(value, 0, 1-val, 0)
                        saturation = value

                        set(Color3.fromHSV(hue,saturation,val))
                    end})
                    utility:MakeSlider(colorpicker,{min=0.001,max=1,float=0.002,callback = function(value)
                        colorPointer.Position = UDim2.new(saturation, 0,math.clamp(value,0.001,0.99), 0)
                        val = 1-value
                        
                        set(Color3.fromHSV(hue,saturation,val))
                    end},'Y')
                    --

                    utility:MakeSlider(alphaframe,{min=0,max=1,float=0.01,callback = function(value)
                        alphaPointer.Position = UDim2.new(0, 0, value, 0)
                        alpha = value
                        alphaButton.Transparency = alpha

                        set(Color3.fromHSV(hue,saturation,val))
                    end},'Y')
                    --
                    library.UpdateByFlag[flag] = function(tab)
                        alpha = tab.Transparency
                        set(tab.Color,true)
                    end
                end
                function togglefuncs:Keybind(options)
                    local options = utility.table(options or {})

                    local key = options.key
                    local mode = options.mode or 1 --1 - toggle, 2 - hold
                    local flag = options.flag or flag..'__KEYBIND'


                    local KeyHolder = utility:Draw('Square',{
                        Parent = holder,
                        ZIndex = holder.ZIndex+1,
                        Filled = true,
                        Size = UDim2.new(0,50,1,2),
                        Position = UDim2.new(1,-50,0,-2),
                        Transparency = 0
                    })
                    local keyText = utility:Draw('Text',{
                        Parent = KeyHolder,
                        ZIndex = KeyHolder.ZIndex+1,
                        Size = 13,
                        Font = Drawing.Fonts["Plex"],
                        Text = '[NONE]',
                        Color = Themes[Theme].InActiveText,
                        Outline = true,
                        Position = UDim2.new()
                    })
                    TabInsert(ThemeDrawings.InActiveText,keyText)
                    KeyHolder.Size = UDim2.new(0,keyText.TextBounds.X,1,2)
                    KeyHolder.Position = UDim2.new(1,-KeyHolder.AbsoluteSize.X+2,0,-2)
                    local keybind
                    local function set(key)
                        library.flags[flag] = keys[key] or tostring(key):gsub("Enum.KeyCode.", "")
                        local newkey = keys[key] or tostring(key):gsub("Enum.KeyCode.", "")

                        keyText.Color = ((key == 'NONE' or key == '...') and Themes[Theme].InActiveText) or Themes[Theme].Text

                        keyText.Text = '['..newkey..']'
                        
                        KeyHolder.Size = UDim2.new(0,keyText.TextBounds.X,1,2)
                        KeyHolder.Position = UDim2.new(1,-KeyHolder.AbsoluteSize.X+2,0,-2)
                        
                        task.wait()
                        keybind = key
                    end
                    if key then
                        set(Enum.KeyCode[key])
                    end
                    local binding
                    utility.connect(KeyHolder.MouseButton1Click,function()
                        set('...')
                        binding = utility.connect(userinputservice.InputBegan,function(input,gameprocceded)
                            utility.disconnect(binding)
                            binding = nil
                            
                            if input.KeyCode == Enum.KeyCode.Backspace then
                                set('NONE')
                            elseif input.KeyCode == Enum.KeyCode.Unknown then
                                set(input.UserInputType)
                            else
                                set(input.KeyCode)
                            end
                        end)
                    end)
                    utility.connect(userinputservice.InputBegan,function(input)
                        if input.KeyCode == keybind or input.UserInputType == keybind then
                            if mode == 1 then
                                active = not active
                                pcall(update) -- render object destroyed being errored for some reason
                            else
                                active = true
                                pcall(update)
                                local endHold 
                                endHold= utility.connect(userinputservice.InputEnded,function(input)
                                    if input.KeyCode == keybind or input.UserInputService == keybind then
                                        utility.disconnect(endHold)
                                        active = false
                                        pcall(update)
                                    end
                                end)
                            end
                        end
                    end)

                    library.UpdateByFlag[flag] = function(key)
                        set(Enum.KeyCode[key] or Enum.UserInputType[key])
                    end
                end
                return togglefuncs
            end
            function sectionFuncs:Dropdown(options)
                local options = utility.table(options or {})
                
                local min = options.min or 0
                local max = options.max or 1

                local name = options.name and options.name or ''
                local dropdownOptions = options.options ~= nil and options.options or {}

                local default = (options.default and table.find(dropdownOptions,options.default)) and options.default or (dropdownOptions[1] and dropdownOptions[1] or '__NONE__')
                local flag = options.flag or ''

                local chosen = {}
                local chosenHolders = {}
                local holders = {}
                local holdersName = {}

                local rawcallback = options.callback or function()end
                library.flags[flag] = default

                local holder = utility:Draw('Square',{
                    Parent = contentHolder,
                    ZIndex = library.zOrder.window+9,
                    Visible = true,
                    Filled = true,
                    Size = UDim2.new(1,0,0,34),
                    Transparency = 0
                })
                TabInsert(ThemeDrawings.Text,utility:Draw('Text',{
                    Parent = holder,
                    Text = name,
                    Font = Drawing.Fonts["Plex"],
                    Size = 13,
                    ZIndex = library.zOrder.window+10,
                    Position = UDim2.new(0,0,0,-3),
                    Visible = true,
                    Center = false,
                    Color = Themes[Theme].Text,
                    Outline = true
                }))

                local funcs,dropdownfuncs = premade.Dropdown(holder,dropdownOptions,default,function(value) library.flags[flag] = value rawcallback(value) end,min,max)

                library.UpdateByFlag[flag] = function(newchosen)
                    if typeof(newchosen) == 'table' then
                        for i,v in pairs(newchosen) do
                            funcs.Update(i,true)
                        end
                    else
                        funcs.Update(table.find(dropdownOptions,newchosen),true)
                    end
                end                
                UpdateSize()

                return dropdownfuncs
            end
            function sectionFuncs:Scroll(options)
                local options = utility.table(options or {})

                local choices = options.options or {'__ANTI BREAKER__'}
                local name = options.name or {}
                local default = options.default or choices[1]
                local rawcallback = options.callback or function() end
                local flag = options.flag or ''

                library.flags[flag] = default
                
                local holder = utility:Draw('Square',{
                    Parent = contentHolder,
                    Size = UDim2.new(1,4,0,50),
                    Filled = true
                })

                TabInsert(ThemeDrawings.Text,utility:Draw('Text',{
                    Parent = holder,
                    Size = 13,
                    Font = Drawing.Fonts["Plex"],
                    Color = Themes[Theme].Text,
                    ZIndex = library.zOrder.window+10,
                    Outline = true,
                    Text = name,
                    Position = UDim2.new(0,0,0,-7)
                }))
                
                local choiceHolder,funcs = premade.Scroll(holder,choices,default,function(choice)
                    library.flags[flag] = choice
                    rawcallback(choice)
                end)

                library.UpdateByFlag[flag] = function(chosen)
                    funcs:Update(chosen)
                end

                holder.Size = UDim2.new(1,4,0,choiceHolder.AbsoluteContentSize+11)
                section.Size = UDim2.new(1,0,0,contentHolder.AbsoluteContentSize+20) 

                section.Size = UDim2.new(1,0,0,contentHolder.AbsoluteContentSize+20) 
                local old = section.Parent.Position    
                section.Parent.Position = UDim2.new()
                section.Parent.Position = old      
            end
            function sectionFuncs:ScrollDrop(options)
                local options = utility.table(options or {})

                local choices = options.options or {NOT_DEFINED = {'__ANTI BREAKER__'}}
                local name = options.name or ''
                local default = options.default or choices[1]
                local rawcallback = options.callback or function() end
                local flag = options.flag or ''

                local indexNames = {}
                for i,v in pairs(choices) do
                    TabInsert(indexNames,tostring(i))
                end

                local holder = utility:Draw('Square',{
                    Parent = contentHolder,
                    ZIndex = library.zOrder.window+9,
                    Visible = true,
                    Filled = true,
                    Size = UDim2.new(1,0,0,100),
                    Transparency = 0
                })
                TabInsert(ThemeDrawings.Text,utility:Draw('Text',{
                    Parent = holder,
                    Text = name,
                    Font = Drawing.Fonts["Plex"],
                    Size = 13,
                    ZIndex = library.zOrder.window+10,
                    Position = UDim2.new(0,0,0,-3),
                    Visible = true,
                    Center = false,
                    Color = Themes[Theme].Text,
                    Outline = true
                }))

                local scrollOptions = {}
                local currentIndex = indexNames[1]

                local valueToReturn = {Dropdown = currentIndex,Scroll = choices[currentIndex][1]} -- concept taken from stormy
                local updateFuncs = {}
                local Dropdownfuncs,_,dropdown = premade.Dropdown(holder,indexNames,indexNames[1],function(choice)
                    if scrollOptions[choice] then
                        for i,v in pairs(scrollOptions)do
                            v.Visible = false
                        end
                        scrollOptions[choice].Visible = true
                        valueToReturn.Dropdown = choice
                        library.flags[flag] = valueToReturn 
                        rawcallback(valueToReturn) 
                    end
                end,1,1)
                dropdown.Size = UDim2.new(1,-4,0,15)
                local biggestHolder
                for i,v in pairs(choices) do 
                    local choicesHolder,funcs = premade.Scroll(holder,v,v[1],function(choice) 
                        valueToReturn.Scroll = choice 
                        library.flags[flag] = valueToReturn 
                        rawcallback(valueToReturn) 
                    end)
                    choicesHolder.Parent.Position = UDim2.new(0,0,0,35)
                    choicesHolder.Parent.Size = UDim2.new(1,-4,0,choicesHolder.AbsoluteContentSize+4)

                    scrollOptions[i] = choicesHolder
                    updateFuncs[i] = funcs
                    print(i,funcs.Update)
                    choicesHolder.Visible = currentIndex == i
                    if not biggestHolder then
                        biggestHolder = choicesHolder
                    elseif biggestHolder.AbsoluteContentSize <= choicesHolder.AbsoluteContentSize then
                        biggestHolder = choicesHolder
                    end
                end
                holder.Size = UDim2.new(1,4,0,biggestHolder.AbsoluteContentSize+35)
                section.Size = UDim2.new(1,0,0,contentHolder.AbsoluteContentSize+20) 
                library.UpdateByFlag[flag] = function(newchosen)
                    Dropdownfuncs.Update(table.find(indexNames,newchosen.Dropdown),true)
                    print(updateFuncs[newchosen.Dropdown],newchosen.Dropdown)
                    updateFuncs[newchosen.Dropdown]:Update(newchosen.Scroll)
                end        
                
                UpdateSize()
            end
            function sectionFuncs:Slider(options)
                local options = utility.table(options or {})

                local name = options.name or ''
                local min,max,default = options.min or 0,options.max or 100,options.default or 0
                local floatValue = options.float or 1
   
                local callback = options.callback or function()end
                local flag = options.flag or ''   
                
                library.flags[flag] = default

                local holder = utility:Draw('Square',{
                    Parent = contentHolder,
                    ZIndex = library.zOrder.window+9,
                    Visible = true,
                    Filled = true,
                    Position = UDim2.new(0,0,1,-15),
                    Size = UDim2.new(1,0,0,33),
                    Transparency = 0
                })
                local slider = utility:Draw('Square',{
                    Parent = holder,
                    ZIndex = library.zOrder.window+10,
                    Position = UDim2.new(0,0,0,13),
                    Size = UDim2.new(1,0,0,15),
                    Visible = true,
                    Filled = true,
                    Color = Themes[Theme].Object
                })
                TabInsert(ThemeDrawings.Object,slider)
                local sliderOutline = utility:DoubleOutline(slider,Themes[Theme].Border,fromrgb(10,10,10))
                TabInsert(ThemeDrawings.Border,sliderOutline)
                local filledHolder = utility:Draw('Square',{
                    Parent = slider,
                    ZIndex = slider.ZIndex+1,
                    Size = UDim2.new(1,-2,1,-2),
                    Position = UDim2.new(0,1,0,1),
                    Filled = true,
                    --Color = Themes[Theme].Ascent,
                    Transparency = 0
                })
                --TabInsert(ThemeDrawings.Ascent,filledHolder)
                local filledSlider = utility:Draw('Square',{
                    Parent = filledHolder,
                    ZIndex = slider.ZIndex+1,
                    Size = UDim2.new(1,0,0,0),
                    Position = UDim2.new(0,0,0,0),
                    Filled = true,
                    Color = Themes[Theme].Ascent
                })
                TabInsert(ThemeDrawings.Ascent,filledSlider)
                
                filledSlider.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
                local dragifySlider = utility:Draw('Square',{
                    Parent = slider,
                    ZIndex = slider.ZIndex+3,
                    Size = UDim2.new(1,-2,1,-2),
                    Position = UDim2.new(0,1,0,1),
                    Filled = true,
                    Color = Themes[Theme].Ascent,
                    Transparency = 0
                })
                TabInsert(ThemeDrawings.Ascent,dragifySlider)
                TabInsert(ThemeDrawings.Text,utility:Draw('Text',{
                    Parent = holder,
                    Text = name,
                    Font = Drawing.Fonts["Plex"],
                    Size = 13,
                    ZIndex = library.zOrder.window+10,
                    Position = UDim2.new(0,0,0,-4),
                    Visible = true,
                    Center = false,
                    Color = Themes[Theme].Text,
                    Outline = true
                }))
                local valueSlider = utility:Draw('Text',{
                    Parent = slider,
                    ZIndex = slider.ZIndex+1,
                    Text = '|',
                    Font = Drawing.Fonts['Plex'],
                    Size = 13,
                    Visible = true,
                    Outline = true,
                    Center = true,
                    Color = Themes[Theme].Text,
                    Position = UDim2.new(0.5,1,0,0)
                })
                TabInsert(ThemeDrawings.Text,valueSlider)
                --valueSlider.Position = UDim2.new(0.5,(valueSlider.TextBounds.X/2),0,0)
                local sliding = false
                local function set(value)
                    filledSlider.Size = UDim2.new((tonumber(value)-min+floatValue)/(max-min+floatValue), 0, 1, 0)
                    valueSlider.Text = tostring(value)..'/'..tostring(max)
                    
                    callback(value)
                    library.flags[flag] = value
                end
                set(default)
                local function slide(input)
                    local sizeX = (input.Position.X - slider.AbsolutePosition.X+2) / (slider.AbsoluteSize.X-1)
                    local value = ((max - min) * sizeX) + min
                    value = math.clamp(value, min,max)
                    value = math.floor(value*(1/floatValue))/(1/floatValue)
                    set(value)
                end
                utility.connect(dragifySlider.InputBegan,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        sliding = true
                        sliderOutline.Color = Themes[Theme].Ascent
                        slide(input)
                    end                    
                end)
                utility.connect(dragifySlider.InputEnded,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        sliding = false
                        sliderOutline.Color = Themes[Theme].Border
                    end
                end)
                utility.connect(game.UserInputService.InputChanged,function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        if sliding then
                            slide(input)
                        end
                    end                
                end)
                library.UpdateByFlag[flag] = function(value)
                    set(value)
                end

                UpdateSize()
            end
            function sectionFuncs:Separator(name)
			
                local name = name or ''


                local holder = utility:Draw('Square',{
                    Parent = contentHolder,
                    ZIndex = library.zOrder.window+9,
                    Visible = true,
                    Filled = true,
                    Size = UDim2.new(1,0,0,10),
                    Transparency = 0
                })
                local text = utility:Draw('Text',{
                    Parent = holder,
                    ZIndex = holder.ZIndex+2,
                    Text = name,
                    Position = UDim2.new(0.5,0,1,-5),
                    Center = true,
                    Color = Themes[Theme].Text,
                    Font = Drawing.Fonts["Plex"],
                    Size = 13,
                    Outline = true
                })
                TabInsert(ThemeDrawings.Text,text)
                text.Position = UDim2.new(0.5,0,0,text.TextBounds.Y/2-12)
                local left = utility:Draw('Square',{
                    Parent = holder,
                    Position = UDim2.new(0,0,0,1),
                    --Size = UDim2.new(0.4,0,0,3),
                    ZIndex = holder.ZIndex+1,
                    Filled = true,
                    Color = Themes[Theme].Object
                })
                TabInsert(ThemeDrawings.Object,left)
                local right = utility:Draw('Square',{
                    Parent = holder,
                    Position = UDim2.new(1,0,0,1),
                    --Size = UDim2.new(-0.4,0,0,3),
                    ZIndex = holder.ZIndex+1,
                    Filled = true,
                    Color = Themes[Theme].Object
                })
                TabInsert(ThemeDrawings.Object,right)
                left.Size = Vector2.new(((text.AbsolutePosition.X-text.TextBounds.X/2)-left.AbsolutePosition.X)-6,3)
                right.Size = Vector2.new(((text.AbsolutePosition.X+text.TextBounds.X/2)-right.AbsolutePosition.X)+4,3)
     
                local border = utility:DoubleOutline(left,Themes[Theme].Border,fromrgb(10,10,10))
                TabInsert(ThemeDrawings.Border,border)
                local a,b = utility:DoubleOutline(right,Themes[Theme].Border,fromrgb(10,10,10))
                TabInsert(ThemeDrawings.Border,a)
                a.Size = UDim2.new(1,-2,1,2)
                a.Position = UDim2.new(0,1,0,-1)
                b.Size = UDim2.new(1,-4,1,4)
                b.Position = UDim2.new(0,2,0,-2)

                UpdateSize()
            end
            function sectionFuncs:Label(options)
                local options = utility.table(options or {})
                local name = options.name or ''

                local holder = utility:Draw('Square',{
                    Parent = contentHolder,
                    ZIndex = library.zOrder.window+9,
                    Visible = true,
                    Filled = true,
                    Position = UDim2.new(0,0,1,-5),
                    Size = UDim2.new(1,0,0,10),
                    Transparency = 0
                })
                local text = utility:Draw('Text',{
                    Parent = holder,
                    ZIndex = holder.ZIndex+2,
                    Text = name,
                    Position = UDim2.new(0,-1,-0.5,0),
                    Center = false,
                    Color = Themes[Theme].Text,
                    Font = Drawing.Fonts["Plex"],
                    Size = 13,
                    Outline = true
                })
                TabInsert(ThemeDrawings.Text,text)

                UpdateSize()
            end
            function sectionFuncs:Box(options)
                local options = utility.table(options or {})

                local placeholder = options.placeholder or ''
                local callback = options.callback or function() end
                local flag = options.flag or ''

                library.flags[flag] = ''

                local holder = utility:Draw('Square',{
                    Parent = contentHolder,
                    ZIndex = library.zOrder.window+9,
                    Visible = true,
                    Filled = true,
                    Position = UDim2.new(0,0,1,-5),
                    Size = UDim2.new(1,0,0,20),
                    Transparency = 0
                })
                local box = utility:Draw('Square',{
                    Parent = holder,
                    Filled = true,
                    Position = UDim2.new(0,0,0,2),
                    Size = UDim2.new(1,0,0,15),
                    ZIndex = holder.ZIndex+3,
                    Color = Themes[Theme].Object
                })
                TabInsert(ThemeDrawings.Object,box)
                local outline = utility:DoubleOutline(box,Themes[Theme].Border,fromrgb(10,10,10))
                TabInsert(ThemeDrawings.Border,outline)
                local BoxPlaceholder = utility:Draw('Text',{
                    Parent = box,
                    ZIndex = box.ZIndex+1,
                    Position = UDim2.new(0.5,0,0,1),
                    Text = placeholder,
                    Color = Themes[Theme].InActiveText,
                    Center = true,
                    Size = 13,
                    Font = Drawing.Fonts["Plex"],
                    Outline = true
                })
                TabInsert(ThemeDrawings.InActiveText,BoxPlaceholder)
                local placeholderColor = BoxPlaceholder.Color
                local function update(text)
                    if BoxPlaceholder.Color==placeholderColor then
                        BoxPlaceholder.Text = text
                        BoxPlaceholder.Color = Themes[Theme].Text
                    else
                        BoxPlaceholder.Text = BoxPlaceholder.Text..text
                    end
                    callback(BoxPlaceholder.Text)
                    library.flags[flag] = BoxPlaceholder.Text
                end
                local function remove()
                    if not BoxPlaceholder then return end -- render object destroyed prevention
                    if BoxPlaceholder.Color == placeholderColor then return end -- if crurent text is placeholder
                    if #BoxPlaceholder.Text - 1 == 0 then
                        BoxPlaceholder.Text = placeholder
                        BoxPlaceholder.Color = placeholderColor
                        callback('')
                        library.flags[flag] = ''
                    else
                        BoxPlaceholder.Text = BoxPlaceholder.Text:sub(1,-2)
                        callback(BoxPlaceholder.Text)
                        library.flags[flag] = BoxPlaceholder.Text
                    end
                end
                utility.connect(box.MouseButton1Click,function()
                    game.ContextActionService:BindActionAtPriority("disablekeyboard", function() return Enum.ContextActionResult.Sink end, false, 3000, Enum.UserInputType.Keyboard)
                    local userinputLoop,backspaceLoop

                    outline.Color = Themes[Theme].Ascent
                    userinputLoop = utility.connect(game.UserInputService.InputBegan,function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            if input.KeyCode ~= Enum.KeyCode.Backspace then
                                local key = game.UserInputService:GetStringForKeyCode(input.KeyCode):lower()
                                if (userinputservice:IsKeyDown('RightShift') or userinputservice:IsKeyDown('LeftShift')) then
                                    key = key:upper()
                                    if shiftcharacters[key] then
                                        key = shiftcharacters[key]
                                    end
                                end
                                if capslock then
                                    key = key:upper()
                                end
                                update(key)
                            end
                        elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                            utility.disconnect(userinputLoop)
                            utility.disconnect(backspaceLoop)
                            game.ContextActionService:UnbindAction('disablekeyboard')
                            outline.Color = Themes[Theme].Border
                        end
                    end)
                    local queue = 0
                    backspaceLoop = utility.connect(userinputservice.InputBegan,function(input)
                        if input.KeyCode == Enum.KeyCode.Backspace then
                            queue += 1
                            remove()
    
                            local currentqueue = queue
                            coroutine.wrap(function()
                                task.wait(0.5)
                                if not queue == currentqueue then return end
                                while userinputservice:IsKeyDown('Backspace') do
                                    remove()
                                    task.wait(0.02)
                                end
                            end)()
                        end
                    end)
                end)
                library.UpdateByFlag[flag] = function(text)
                    BoxPlaceholder.Color = text == '' and placeholderColor or Themes[Theme].Text
                    BoxPlaceholder.Text = text == '' and placeholder or text

                    callback(text)
                    library.flags[flag] = text
                end

                section.Size = UDim2.new(1,0,0,contentHolder.AbsoluteContentSize+20)    
                local old = section.Parent.Position    
                section.Parent.Position = UDim2.new()
                section.Parent.Position = old               
            end
            return sectionFuncs
        end
        
        return sectorsFuncs
    end
end
function library:SaveConfig(name)
    local library = self -- it's easier for me to read library:Tab rather than self:Tab
    --gonna convert all color3 values to hex cuz json makes it null
    local fakeFlags = {}
    for flag,value in pairs(library.flags) do
        if string.find(flag,'__Theme__') then continue end
        if typeof(value) == 'table' and value['Color'] then
            value.Color = {R = value.Color.R,G = value.Color.G,B = value.Color.B}
        end
        fakeFlags[flag] = value
    end
    writefile(path..'/'..name..'.cfg',game.HttpService:JSONEncode(fakeFlags))
end
function library:LoadConfig(name)
    local library = self -- it's easier for me to read library:Tab rather than self:Tab

    local flags = game.HttpService:JSONDecode(readfile(path..'/'..name..'.cfg'))

    for flag,value in pairs(flags) do
        --if value is color3, since i converted it, gonna convert it back
        if string.find(flag,'__Theme__') then continue end
        if typeof(value) == 'table' and value.Color then
            value.Color = Color3.new(value.Color.R,value.Color.G,value.Color.B)
        end
        if library.UpdateByFlag[flag] then
            library.UpdateByFlag[flag](value)
        end
    end
end
makefolder(path..'/themes')
function library:SaveTheme(name)
    local library = self -- it's easier for me to read library:Tab rather than self:Tab
    --gonna convert all color3 values to hex cuz json makes it null
    local fakeFlags = {}
    for flag,value in pairs(library.flags) do
        if not string.find(flag,'__Theme__') then continue end
        if  typeof(value) == 'table' and value['Color'] then
            value.Color = {R = value.Color.R,G = value.Color.G,B = value.Color.B}
        end
        fakeFlags[flag] = value
    end
    writefile(path..'/themes/'..name..'.cfg',game.HttpService:JSONEncode(fakeFlags))
end
function library:LoadTheme(name)
    local library = self -- it's easier for me to read library:Tab rather than self:Tab

    local flags = game.HttpService:JSONDecode(readfile(path..'/themes/'..name..'.cfg'))

    for flag,value in pairs(flags) do
        --if value is color3, since i converted it, gonna convert it back
        if not string.find(flag,'__Theme__') then continue end
        if typeof(value) == 'table' and value.Color then
            value.Color = Color3.new(value.Color.R,value.Color.G,value.Color.B)
        end
        if library.UpdateByFlag[flag] then
            library.UpdateByFlag[flag](value)
        end
    end
end
function library:GetConfigs()
    local cfgnames = {}
    for i,v in pairs(listfiles(path)) do
        if isfolder(v) then continue end
        cfgnames[#cfgnames+1] = string.gsub(v:sub(0,-5),(path..[[\]]),'')
    end
    return cfgnames
end
function library:GetThemes()
    local cfgnames = {}
    for i,v in pairs(listfiles(path..'/themes')) do
        cfgnames[#cfgnames+1] = string.gsub(v:sub(0,-5),(path..'/themes'..[[\]]),'')
    end
    return cfgnames
end
function library:LoadSettingsTab()
    local tab = library:Tab('Settings')

    local theme = tab:Section({Name='Theme Editor',Side='Right'})
    local themeTab = {
        WindowBackground = 'Window Background',
        ActiveTab = 'Chosen Tab',
        Ascent = 'Ascent',
        InActiveTab = 'Unchosen Tab',
        InActiveText = 'Inactive Text',
        Text = 'Text',
        Object = 'Ascent Background', -- idfk how to name it
        Sectors = 'Sectors',
        SectorsBackground = 'Sectors Background',
        TabBackground = 'Tab Background',
        Border = 'Border'
    }
    for rawname,tab in pairs(ThemeDrawings) do
        local name = themeTab[rawname] or rawname
        local defaultcolor = Themes[Theme][rawname]
    
        theme:Toggle({Name = name,Flag = '__Theme__'..rawname, callback = function(toggle)
            local color = (toggle and library.flags['__Theme__'..rawname..'_Color'].Color) or defaultcolor
            for i,v in pairs(tab) do
                v.Color = color
            end
            Themes[Theme][rawname] = color
        end}):ColorPicker{Default = defaultcolor,Flag = '__Theme__'..rawname..'_Color',callback = function(color)
            local color = library.flags['__Theme__'..rawname] and color.Color or defaultcolor
            for i,v in pairs(tab) do
                v.Color = color
            end   
            Themes[Theme][rawname] = color
        end}
    end
    local configs = tab:Section{Name = 'Configs',side = 'Left'}
    local cfglist = configs:Dropdown{Name = 'Config',Options = library:GetConfigs(),Max=1,Min=0,Flag = 'ConfigChosen'}
    configs:Button{Name = 'Load Config',Callback = function()
        if library.flags['ConfigChosen'] ~= nil then
            library:LoadConfig(library.flags['ConfigChosen'])
        end
    end}
    configs:Button{Name = 'Save Config',Callback = function()
        if library.flags['ConfigChosen'] ~= nil then
            library:SaveConfig(library.flags['ConfigChosen'])
        end
    end}
    configs:Button{Name = 'Remove Config',Callback = function()
        if library.flags['ConfigChosen'] ~= nil then
            print(path,library.flags['ConfigChosen'])
            delfile(path..'/'..library.flags['ConfigChosen']..'.cfg')
            local cfgs = library:GetConfigs()
            cfglist:UpdateOptions(cfgs,cfgs[1])
        end
    end}    
    configs:Button{Name = 'Update Config List',callback = function() -- same as save config do idgaf
        cfglist:UpdateOptions(library:GetConfigs())
    end}
    configs:Box{placeholder = 'Config Name',Flag = 'ConfigChosen_Text'}
    configs:Button{Name = 'Save Config',callback = function()
        if library.flags['ConfigChosen_Text'] ~= '' then
            library:SaveConfig(library.flags['ConfigChosen_Text'])
            local cfgs = library:GetConfigs()
            cfglist:UpdateOptions(cfgs,cfgs[1])
        end
    end}
    local themes = tab:Section{Name = 'Themes',Side = 'Left'}
    local themeslist = themes:Dropdown{Name = 'Theme',Options = library:GetThemes(),Max=1,Min=0,Flag = 'ThemeChosen'}
    themes:Button{Name = 'Load Theme',Callback = function()
        if library.flags['ThemeChosen'] ~= nil then
            library:LoadTheme(library.flags['ThemeChosen'])
        end
    end}
    themes:Button{Name = 'Update Theme',callback = function() -- same as save config do idgaf
        if library.flags['ThemeChosen'] ~= nil then
            library:SaveTheme(library.flags['ThemeChosen'])
        end
    end}
    themes:Button{Name = 'Remove Theme',Callback = function()
        if library.flags['ThemeChosen'] ~= nil then
            print(path,library.flags['ThemeChosen'])
            delfile(path..'/themes/'..library.flags['ThemeChosen']..'.cfg')
            local themes = library:GetThemes()
            cfglist:UpdateOptions(themes,themes[1])
        end
    end}    
    themes:Box{placeholder = 'Theme Name',Flag = 'ThemeChosen_Text'}
    themes:Button{Name = 'Save Theme',callback = function()
        if library.flags['ThemeChosen_Text'] ~= '' then
            library:SaveTheme(library.flags['ThemeChosen_Text'])
            local themes = library:GetThemes()
            themeslist:UpdateOptions(themes,themes[1])
        end
    end}
end

--[[library:init()
library:LoadSettingsTab()
local tab1 = library:Tab('Hi')
local section1 = tab1:Section({Name='Right',Side='Right'})

tab1:Section({Name='Test Right',Side='Right'})
section1:Toggle{Name = 'Toggle 1',Flag = 'hi',callback = function(val)
    
end}
local toggle1 = section1:Toggle{Name = 'Toggle 2',flag = 'something'}
toggle1:ColorPicker()
local toggle2 = section1:Toggle{Name = 'Toggle 2',flag = 'something'}
toggle2:Keybind()

section1:Box{Name = 'B',placeholder = 'Box',callback = function(text)

end}
section1:Separator{name = 'Separator'}
section1:Label{name = 'Label'}
section1:Dropdown{name = 'Dropdown',options = {'option 1','option 2'},max = 2,Flag = 'sup'}
section1:Dropdown{name = 'Dropdown Min 1',options = {'option 1','option 2'},min = 1}
local tab2 = library:Tab('ab')
local section2 = tab2:Section({Name='Left',Side='Left'})
section2:Slider{Name = '',Min = 1,Max = 100,callback = function(val)
    print('Slider 2 is now '..val)
end}
section2:Scroll{Name = 'Test',Flag = 'sarwqe',Options = {'Hi','ScrollTest','ScrollTest3'}}
section2:ScrollDrop{Name = 'Test',Flag = 'test',Options = {a = {'hi','hi2','hi3','hi4','test'},b = {'sup','sup2','sup3'}}}--]]

Signal = {}
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
local HttpService = game:GetService('HttpService')
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
return library,Signal