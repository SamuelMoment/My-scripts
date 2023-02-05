local drawing = loadstring(readfile('drawing.lua'))()

local fromrgb = Color3.fromRGB
local rand = math.random
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
        drag.InputBegan:Connect(function(input) 
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
        drag.InputChanged:Connect(function(input) 
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
                dragInput = input 
            end 
        end) 
        game:GetService('UserInputService').InputChanged:Connect(function(input) 
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
        local frame2 = self:Outline(frame,color2)
        return frame
    end
}
if getgenv().frame and frame.exists == true then frame:Remove() end
local settings = {
    Size = UDim2.new(0,600,0,700),
}
local library = {
    zOrder = {
        window = 1000
    },
    tabs = {},
    tabsText = {},
    currentTab = nil,
    sectorHolders = {},
}
local ascents = {
    border = fromrgb(100, 100, 100),
    activeTab = fromrgb(61, 61, 61),
    inactiveTab = fromrgb(25,25,25),
    sectors = fromrgb(35,35,35)
}
--
function library:init()
    
    getgenv().frame = utility:Draw('Square',{
        Thickness = 0,
        Color = fromrgb(31, 31, 31),
        Size = settings.Size,
        ZIndex = library.zOrder.window,
        Filled = true,
        Position = utility:GetCenter(settings.Size.X.Offset,settings.Size.Y.Offset)
    })
    --
    utility:DoubleOutline(frame,ascents.border,fromrgb(10,10,10))

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
        Text = 'SamuelPaste $$$',
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
        Color = fromrgb(10,10,10),
        Thickness = 0
    })
    utility:DoubleOutline(backgroundTab,fromrgb(10,10,10),ascents.border)
    -- Tabs handler

    local TabsHolder = utility:Draw('Square',{
        Parent = backgroundTab,
        Position = UDim2.new(0,8,0,8),
        Size = UDim2.new(1,-16,1,-16),
        Visible = true,
        Filled = true,
        ZIndex = library.zOrder.window+3,
        Color  = fromrgb(31, 31, 31)
    })
    utility:DoubleOutline(TabsHolder,ascents.border,fromrgb(10,10,10))

    function library:AddTab(name)  
        local tab = utility:Draw('Square',{
            Parent = TabsHolder,
            Filled = true,
            Color = fromrgb(32, 32, 32),
            Position = UDim2.new(0,0,0,0),
            Size = UDim2.new(0,0,0,15),
            Visible = true,
            ZIndex = library.zOrder.window+4
        })
        utility:Outline(tab,ascents.border)
        library.currentTab = library.currentTab or tab
        tab.MouseButton1Down:Connect(function()
            library.currentTab.Color = ascents.inactiveTab
            if library.sectorHolders[library.currentTab] then
                library.sectorHolders[library.currentTab].Visible = false
            end                
            library.currentTab = tab
            tab.Color = ascents.activeTab
            if library.sectorHolders[tab] then
                library.sectorHolders[tab].Visible = true
            end            
        end)
        utility:Draw('Square',{ -- additional outline
            Parent = tab,
            Filled = true,
            Color = ascents.border,
            Position = UDim2.new(1,0,0,0),
            Size = UDim2.new(0,1,1,0),
            Visible = true,
            ZIndex = library.zOrder.window+5
        })
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
        table.insert(library.tabs,tab)        
        table.insert(library.tabsText,text)
        local tabSize = TabsHolder.AbsoluteSize.X/#library.tabs
        for i,v in pairs(library.tabs) do
            v.Size = UDim2.new(0,tabSize,0,18)
            v.Position = UDim2.new(0,tabSize*(i-1),0,0)
            if library.currentTab == v then
                v.Color = ascents.activeTab
            else
                v.Color = ascents.inactiveTab
            end
            if library.sectorHolders[v] then
                library.sectorHolders[v].Position = UDim2.new(0,-tabSize*(i-1),1,1)
            end
        end
        for i,v in pairs(library.tabsText) do
            v.Position = UDim2.new(0.5,0,0.5,-v.TextBounds.Y/2) -- 0.45,-(v.TextBounds.Y/2)
        end
        ---------



        local offsets = {right = 5,left = 5}
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
        local RightHolder = utility:Draw('Square',{
            Filled = true,
            Parent = sectorsHolder,
            Position = UDim2.new(0,5,0,5),
            Size = UDim2.new(0.5,-10,99999,1),
            ZIndex = library.zOrder.window+7,
            Visible = true,
            Transparency = 0
        })
        local LeftHolder = utility:Draw('Square',{
            Parent = sectorsHolder,
            ZIndex = library.zOrder.window+7,
            Position = UDim2.new(0.5,5,0,5),
            Size = UDim2.new(0.5,-10,99999,0),
            Filled = true,
            Transparency = 0
        })        
        function sectorsFuncs:AddSection(options)
            local sectionFuncs = {}

            local options = options or {}
            local name = options.Name or ''
            local side = options.Side or 'Left'

            local section = utility:Draw('Square',{
                Parent = side == 'Left' and LeftHolder or RightHolder,
                Position = UDim2.new(0,0,0,offsets[side:lower()]),
                Size = UDim2.new(1,0,0,31),
                ZIndex = library.zOrder.window+8,
                Visible = true,
                Transparency = 1,
                Color = ascents.sectors,
                Filled = true
            })

            local contentHolder = utility:Draw('Square',{
                Transparency = 0,
                Size = UDim2.new(1, -16, 1, -28),
                Position = UDim2.new(0, 8, 0, 20),
                Parent = section
            })
            contentHolder:AddListLayout(8)

            function sectionFuncs:Button(options)
                local options = options or {}

                local text = options.Name or 'NO NAME DEFINED'
                local callback = options.callback or function() print("NO CALLBACK DEFINED",name) end
                
                local button 
            end
            return sectionFuncs
        end

        
        return sectorsFuncs
    end
end
library:init()
library:AddTab('rage'):AddSection('sex','Left')
library:AddTab('rage2')
library:AddTab('rage3')
library:AddTab('rage4')
local a = library:AddTab('rage5')