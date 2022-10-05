if not getgenv().drawing then
loadstring(game:HttpGet("https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/drawinglibraryfix.lua"))() 
end
if getgenv().s then getgenv().s:Remove() end
local makeDraggable = function(frame)
    pcall(function()
				dragging = false 
					local a = frame
					local dragInput 
					local dragStart 
					local startPos 
					local function update(input) 
						local delta = input.Position - dragStart 
						a.Position = Vector2.new(startPos.X + delta.X, startPos.Y + delta.Y) 
					end 
					a.InputBegan:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
							dragging = true 
							dragStart = input.Position 
							startPos = a.Position 

							input.Changed:Connect(function() 
								if input.UserInputState == Enum.UserInputState.End then 
									dragging = false 
								end 
							end) 
						end 
					end) 
					a.InputChanged:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
							dragInput = input 
						end 
					end) 
					game:GetService('UserInputService').InputChanged:Connect(function(input) 
						if input == dragInput and dragging then 
							update(input) 
						end 
					end)
	end)
end

local utility = {}
utility['outline'] = function(draw,color,type)
    local outline = drawing:new(type)
    outline.Parent = draw
    outline.Size = UDim2.new(1, 2, 1, 2)
    outline.ZIndex = draw.ZIndex-1
    outline.Filled = false
    outline.Position = UDim2.new(0, -1, 0, -1)
    outline.Color = color
    outline.Filled = false
end

local library = {}
function library:New(scriptName)
    local menu = {}   
    getgenv().s = drawing:new('Square')
    
    s.Size = Vector2.new(500,550)
    s.Position =Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2  - (game:GetService("GuiService"):GetGuiInset().Y/2))
    s.Position = Vector2.new(s.Position.X - s.Size.X/2,s.Position.Y - s.Size.Y/2)
    s.Thickness = 1
    s.Transparency = 1
    s.Visible = true
    s.Filled = true
    s.Color = Color3.fromRGB(30,30,30)
    s.ZIndex = 1
    
    makeDraggable(s)
    local s1 = drawing:new('Square')
    s1.Size = Vector2.new(s.Size.X, 25)
    s1.Position =Vector2.new(0,0)
    s1.Thickness = 1
    s1.Transparency = 1
    s1.Visible = true
    s1.Filled = true
    s1.Color = Color3.fromRGB(35,35,35)
    s1.ZIndex = 1
    s1.Parent = s
    
    local textlabel = drawing:new('Text')
    textlabel.Parent = s1
    textlabel.Outline = true
    textlabel.Text = scriptName
    textlabel.Position = Vector2.new(6,5)
    textlabel.Size = 13
    textlabel.ZIndex = 1
    textlabel.Color = Color3.fromRGB(255,255,255)
    textlabel.Font = Drawing.Fonts.Plex
    
    TabOffset = textlabel.TextBounds.X + 5
    Tabs = {}
    CurrentTab = nil
    function menu:Tab(tabName)
        local tabName = tabName
        local textlabel1 = drawing:new('Text')
        textlabel1.Parent = s1
        textlabel1.Outline = true
        textlabel1.Text = tostring(' | %s'):format(tabName)
        textlabel1.Position = Vector2.new(TabOffset,5)
        textlabel1.Size = 13
        textlabel1.ZIndex = 1
        textlabel1.Color = Color3.fromRGB(255,255,255)
        textlabel1.Font = Drawing.Fonts.Plex
        TabOffset = TabOffset + textlabel1.TextBounds.X
        
        local frame = drawing:new('Square')
        frame.Parent = s1
        frame.Transparency = 0
        frame.Position = Vector2.new(TabOffset,5) - Vector2.new(textlabel1.Size+30,0)
        frame.ZIndex = 1
        frame.Size = textlabel1.TextBounds
        
        Right = drawing:new('Square')
        Right.Size = Vector2.new(500,550)
        Right.Thickness = 1
        Right.Transparency = 0
        Right.Visible = false
        Right.Filled = true
        Right.Color = Color3.fromRGB(30,30,30)
        Right.ZIndex = 1    
        Right.Parent = s
        Right.Size = Vector2.new(235,515)
        Right.Position = Vector2.new(10,30)
  
        Left = drawing:new('Square')
        
        Left.Size = Vector2.new(500,550)
        Left.Thickness = 1
        Left.Transparency = 1
        Left.Visible = false
        Left.Filled = true
        Left.Color = Color3.fromRGB(30,30,30)
        Left.ZIndex = 1    
        Left.Parent = s
        Left.Size = Vector2.new(235,515)
        Left.Position = Vector2.new(250,30)
        
        Tabs[tabName] = {['Right'] = Right,['Left'] = Left,['RightSectors'] = {},['LeftSectors'] = {}}
        
        if CurrentTab == nil then
            CurrentTab = tabName
            Left.Visible = true
            Right.Visible = true
        end
        frame.MouseButton1Down:Connect(function()
            
            if CurrentTab == tabName then return end
            for i,v in pairs(Tabs[CurrentTab]) do
                v.Visible = false
            end
            Tabs[tabName].Right.Visible = true
            Tabs[tabName].Left.Visible = true
            for i,v in pairs(Tabs[tabName]['RightSectors']) do
                if typeof(v) == 'table' then
                    v.Visible = true
                end
            end  
            for i,v in pairs(Tabs[tabName]['LeftSectors']) do
                if typeof(v) == 'table' then
                    v.Visible = true
                end
            end             
            CurrentTab = tabName
        end)
        local Tab = {}
        --local SectorRightOffset = 5
        Tabs[tabName]['LastRightSector'] = nil
        Tabs[tabName]['LastLeftSector'] = nil
        function Tab:Sector(text,Side)
            SectorFuncs = {}
            Sector = drawing:new('Square')
            Sector.Size = Vector2.new(500,550)
            Sector.Thickness = 1
            Sector.Transparency = 1
            Sector.Visible = true
            Sector.Filled = true
            Sector.Color = Color3.fromRGB(35,35,35)
            Sector.ZIndex = 2    
            Sector.Parent = Tabs[tabName][Side]
            UpdateSectors = function(currentSector,Side)
                if Side == 'Right' then
                    local offset = Vector2.new(0,5)
                    for i,v in pairs(Tabs[tabName]['RightSectors']) do
                        if v ~= currentSector then
                            offset += Vector2.new(0,v.Size.Y+10)
                        end
                    end
                    if not table.find(Tabs[tabName]['RightSectors'],currentSector) then
                    table.insert(Tabs[tabName]['RightSectors'],currentSector)
                    end
                    currentSector.Position = offset
                elseif Side == 'Left' then
                    local offset = Vector2.new(0,5)
                    for i,v in pairs(Tabs[tabName]['LeftSectors']) do
                        if v ~= currentSector then
                        offset += Vector2.new(0,v.Size.Y+10)
                        end
                    end
                    if not table.find(Tabs[tabName]['LeftSectors'],currentSector) then
                    table.insert(Tabs[tabName]['LeftSectors'],currentSector)
                    end
                    currentSector.Position = offset
                end
            end
            UpdateSectors(Sector,Side)
            Sector.Size = Vector2.new(235,10)

            local SectorName = drawing:new('Text')
            SectorName.Parent = Sector
            SectorName.Outline = true
            SectorName.Text = tostring('%s'):format(text)
            SectorName.Position = Vector2.new(Sector.Size.X/2,-8)
            SectorName.Size = 13
            SectorName.ZIndex = 3
            SectorName.Color = Color3.fromRGB(255,255,255)
            SectorName.Font = Drawing.Fonts.Plex
            
            function SectorFuncs:Element(Type,text,data,callback)
                if data == nil then data = {} end
                if callback == nil then callback = function() end end
                
                if Type == 'Button' then
                    local button = drawing:new('Square')
                    button.Parent = Sector
                    button.Size = Vector2.new(150,5)
                    button.ZIndex = 3
                    button.Position = Vector2.new(45,15)
                    button.Color = Color3.fromRGB(30,30,30)
                    Sector.Size += Vector2.new(0,button.Position.Y+button.Size.Y+5)
                    utility.outline(button,Color3.fromRGB(50,50,50),'Square')
                    
                    local text1 = drawing:new('Text')
                    text1.Parent = button
                    text1.Size = 13
                    text1.Font = Drawing.Fonts.Plex
                    text1.Position = Vector2.new(62.5,-5)
                    text1.Text = text
                    text1.ZIndex = 3
                    text1.Color = Color3.fromRGB(200,200,200)
                end
            end
            return SectorFuncs
        end
        return Tab
    end
    return menu

end
local s = library:New('SEX')
a = s:Tab('SAMEUL')
a2 = s:Tab('Sam2')

test = a:Sector('a','Right')
test:Element('Button','test')
