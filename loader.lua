local makeDraggable = function(frame)
				dragging = false 
					local a = frame
					local dragInput 
					local dragStart 
					local startPos 
					local function update(input) 
						local delta = input.Position - dragStart 
						a.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
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
					game:GetService('UserInputService').InputChanged:Connect(function(input) -- sex
						if input == dragInput and dragging then 
							update(input) 
						end 
					end)
end


local ScreenGui = Instance.new("ScreenGui")
local Background = Instance.new("ScrollingFrame")
local Background2 = Instance.new("Frame")
local Background3 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Loading = Instance.new("Frame")
local loading2 = Instance.new("Frame")
local MainUIColor = Color3.fromRGB(255,20,147)

ScreenGui.Parent = game.CoreGui

Background.Parent = ScreenGui
Background.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0, 430, 0, 140)
Background.ScrollBarThickness = 0
Background.CanvasSize = UDim2.new(0,0,0,0)
makeDraggable(Background)

Background2.Name = "Background2"
Background2.Parent = Background
Background2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Background2.BorderSizePixel = 0
Background2.Position = UDim2.new(0, 5, 0, 5)
Background2.Size = UDim2.new(0, 420, 0, 130)

Background3.Name = "Background3"
Background3.Parent = Background2
Background3.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Background3.BorderSizePixel = 0
Background3.Position = UDim2.new(0, 5, 0, 5)
Background3.Size = UDim2.new(0, 410, 0, 120)

TextLabel.Parent = Background3
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 410, 0, 75)
TextLabel.Font = Enum.Font.Unknown
TextLabel.RichText = true
TextLabel.Text = " Welcome to Samuel<font color=\"rgb(255,20,147)\">Paste </font>"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 40.000
TextLabel.TextWrapped = true

Loading.Name = "Loading"
Loading.Parent = Background3
Loading.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Loading.BorderSizePixel = 0
Loading.Position = UDim2.new(0, 5, 0, 85)
Loading.Size = UDim2.new(0, 400, 0, 25)

loading2.Name = "loading2"
loading2.Parent = Loading
loading2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
loading2.BorderSizePixel = 0
loading2.Size = UDim2.new(0, 0, 0, 25)

Background.Size = UDim2.new(0,5,0,0) --430,140

local library = {}
function library:Tween(...) game:GetService("TweenService"):Create(...):Play() end 

task.wait(1)
library:Tween(Background, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,5,0,140)}) 
repeat wait() until Background.Size.Y.Offset == 140
task.wait(1)
library:Tween(Background, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,430,0,140)}) 
repeat wait() until Background.Size.X.Offset == 430
task.wait(1.5)
library:Tween(loading2, TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 25)})
repeat wait() until loading2.Size.X.Offset == 400
task.wait(1)
library:Tween(Background, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
library:Tween(Background2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
library:Tween(Background3, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
library:Tween(TextLabel, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1})
library:Tween(Loading, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
library:Tween(loading2, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})

repeat wait() until Background.Transparency == 1
ScreenGui:Destroy()

task.wait(1)

XSize = 300

local Loader = Instance.new("ScreenGui")
local Background = Instance.new("ScrollingFrame")
local Background2 = Instance.new("Frame")
local Background3 = Instance.new("Frame")
local Game = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

Loader.Name = "Loader"
Loader.Parent = game.CoreGui

Background.Name = "Background"
Background.Parent = Loader
Background.Active = true
Background.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0, XSize, 0, 140)
Background.ScrollBarThickness = 0
Background.CanvasSize = UDim2.new(0,0,0,0)
Background.BorderSizePixel = 0
makeDraggable(Background)

Background2.Name = "Background2"
Background2.Parent = Background
Background2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Background2.BorderSizePixel = 0
Background2.Position = UDim2.new(0, 5, 0, 5)
Background2.Size = UDim2.new(0, XSize-10, 0, 130)

Background3.Name = "Background3"
Background3.Parent = Background2
Background3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Background3.BorderSizePixel = 0
Background3.Position = UDim2.new(0, 5, 0, 25)
Background3.Size = UDim2.new(0, XSize-20, 0, 100)

Game.Name = "Game"
Game.Parent = Background3
Game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Game.BackgroundTransparency = 1.000
Game.Position = UDim2.new(0, 5, 0, 2.5)
Game.Size = UDim2.new(0, 160, 0, 23)
Game.Font = Enum.Font.SourceSans
Game.Text = "Game detected: "
	if game.GameId == 113491250 then
		Game.Text = "Game detected: Phantom Forces"
	elseif game.GameId == 1390601379 then
		Game.Text = "Game detected: Combat Warriors"
	elseif game.GameId == 3698756756 or game.GameId == 10053187005 or game.GameId == 3311740703 or game.GameId == 1190826589 or game.GameId == 3681951220 then
		Game.Text = "Game detected: Counter Blox"
	else
		Game.Text = 'Game detected: Unsupported game'
	end

Game.TextColor3 = Color3.fromRGB(255,255,255)
Game.TextSize = 20.000
Game.TextXAlignment = Enum.TextXAlignment.Left

Frame.Parent = Background2
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 5, 0, 3)
Frame.Size = UDim2.new(0, XSize-20, 0, 20)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0109597743, 0, -0.180263162, 0)
TextLabel.Size = UDim2.new(0, 105, 0, 26)
TextLabel.Font = Enum.Font.Unknown
TextLabel.RichText = true
TextLabel.Text = "Samuel<font color=\"rgb(255,20,147)\">Paste </font>"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 20.000
TextLabel.TextWrapped = true


local C = {
	['Vec2'] = Vector2.new,
	['Vec3'] = Vector3.new,
	['CF'] = CFrame.new,
	['INST'] = Instance.new,
	['COL3'] = Color3.new, 

	['COL3RGB'] = Color3.fromRGB, 
	['COL3HSV'] = Color3.fromHSV, 
	['COL3HEX'] = Color3.fromHex,

	['CLAMP'] = math.clamp, 

	['DEG'] = math.deg, 
	['FLOOR'] = math.floor, 
	['ACOS'] = math.acos, 

	['RANDOM'] = math.random, 
	['ATAN2'] = math.atan2, 

	['HUGE'] = math.huge, 
	['RAD'] = math.rad,

	['MIN'] = math.min,
	['POW'] = math.pow,

	['UDIM2'] = UDim2.new, 
	['CFAngles'] = CFrame.Angles, 

	['FIND'] = string.find, 
	['LEN'] = string.len, 
	['SUB'] = string.sub, 
	['GSUB'] = string.gsub, 
	['RAY'] = Ray.new,

	['INSERT'] = table.insert, 
	['TBLFIND'] = table.find, 
	['TBLREMOVE'] = table.remove, 
	['TBLSORT'] = table.sort 
} 

local Dropdown = C.INST("Frame") 
local Button = C.INST("TextButton") 
local TextLabel = C.INST("TextLabel") 
local Drop = C.INST("ScrollingFrame") 
local Button_2 = C.INST("TextButton") 
local TextLabel_2 = C.INST("TextLabel") 
local UIListLayout = C.INST("UIListLayout") 
local ImageLabel = C.INST("ImageLabel") 
local TextLabel_3 = C.INST("TextLabel") 
libraryChosen = 'Stormy'

Dropdown.Name = "Dropdown" 
Dropdown.Parent = Background3 
Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
Dropdown.BackgroundTransparency = 1.000 
Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

Button.Name = "Button" 
Button.Parent = Dropdown 
Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
Button.Position = C.UDIM2(0, 5, 0, 20) 
Button.Size = C.UDIM2(0, 175, 0, 20) 
Button.AutoButtonColor = false 
Button.Font = Enum.Font.SourceSans 
Button.Text = "" 
Button.TextColor3 = C.COL3RGB(0, 0, 0) 
Button.TextSize = 15.000

TextLabel.Parent = Button 
TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
TextLabel.BackgroundTransparency = 1.000 
TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
TextLabel.Size = C.UDIM2(-0.2, 175, 1, 0) 
TextLabel.Font = Enum.Font.SourceSans 
TextLabel.Text = 'Stormy'
TextLabel.TextColor3 = C.COL3RGB(255,255,255) 
TextLabel.TextSize = 15.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

local abcd = TextLabel 

Drop.Name = "Drop" 
Drop.Parent = Button 
Drop.Active = true 
Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
Drop.Position = C.UDIM2(0, 0, 1, 1) 
Drop.Size = C.UDIM2(1, 0, 0, 40) 
Drop.Visible = false 
Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
Drop.ScrollBarThickness = 4 
Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
Drop.AutomaticCanvasSize = "Y" 
Drop.ZIndex = 5 
Drop.ScrollBarImageColor3 = C.COL3RGB(255,255,255) 

UIListLayout.Parent = Drop 
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

local num = 2 
if num > 5 then 
	Drop.Size = C.UDIM2(1, 0, 0, 85) 
else 
	Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
end 
Drop.CanvasSize = C.UDIM2(1, 0, 0, 17*num) 
local first = true 

for i,v in ipairs({'Stormy'}) do 
	do 
		local Button = C.INST("TextButton") 
		local TextLabel = C.INST("TextLabel") 

		Button.Name = v 
		Button.Parent = Drop 
		Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
		Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
		Button.Position = C.UDIM2(0, 5, 0, 16) 
		Button.Size = C.UDIM2(0, 175, 0, 17) 
		Button.AutoButtonColor = false 
		Button.Font = Enum.Font.SourceSans 
		Button.Text = "" 
		Button.TextColor3 = C.COL3RGB(0, 0, 0) 
		Button.TextSize = 15.000
		Button.BorderSizePixel = 0 
		Button.ZIndex = 6 

		TextLabel.Parent = Button 
		TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
		TextLabel.BackgroundTransparency = 1.000 
		TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
		TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
		TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
		TextLabel.Font = Enum.Font.SourceSans 
		TextLabel.Text = v 
		TextLabel.TextColor3 = C.COL3RGB(255,255,255) 
		TextLabel.TextSize = 15.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
		TextLabel.ZIndex = 6 

		Button.MouseButton1Down:Connect(function() 
			Drop.Visible = false 
			libraryChosen = v 
			abcd.Text = v 
			Drop.CanvasPosition = C.Vec2(0,0) 
		end) 
		Button.MouseEnter:Connect(function() 
			library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  MainUIColor}) 
		end) 
		Button.MouseLeave:Connect(function() 
			library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(255, 255, 255)}) 
		end) 

		first = false 
	end 
end 

ImageLabel.Parent = Button 
ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
ImageLabel.BackgroundTransparency = 1.000 
ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

TextLabel_3.Parent = Dropdown 
TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
TextLabel_3.BackgroundTransparency = 1.000 
TextLabel_3.Position = C.UDIM2(0, 5, 0, 0) 
TextLabel_3.Size = C.UDIM2(0.111913361, 300, 0.382215232, 0) 
TextLabel_3.Font = Enum.Font.SourceSans 
TextLabel_3.Text = 'UI Library' 
TextLabel_3.TextColor3 = C.COL3RGB(255,255,255) 
TextLabel_3.TextSize = 20.000
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

Button.MouseButton1Down:Connect(function() 
	Drop.Visible = not Drop.Visible 
	if not Drop.Visible then 
		Drop.CanvasPosition = C.Vec2(0,0) 
	end 
end) 
local indrop = false 
local ind = false 
Drop.MouseEnter:Connect(function() 
	indrop = true 
end) 
Drop.MouseLeave:Connect(function() 
	indrop = false 
end) 
Button.MouseEnter:Connect(function() 
	ind = true 
end) 
Button.MouseLeave:Connect(function() 
	ind = false 
end) 
game:GetService("UserInputService").InputBegan:Connect(function(input) 
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
		if Drop.Visible == true and not indrop and not ind then 
			Drop.Visible = false 
			Drop.CanvasPosition = C.Vec2(0,0) 
		end 
	end 
end) 
--[[local Frame = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local TextButton = Instance.new("TextButton")

--Properties:


Frame.Parent = Background3
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0, 5, 0, 70)
Frame.Size = UDim2.new(0, 175, 0, 15)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.BorderSizePixel = 0

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Position = UDim2.new(0,5,0,0)
TextButton.Size = UDim2.new(0, 175, 0, 15)
TextButton.ZIndex = 2
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 18.000
TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)--]]

local Button = C.INST("Frame") 
local Button_2 = C.INST("TextButton") 
local TextLabel = C.INST("TextLabel") 

Button.Name = "Button" 
Button.Parent = Background3 
Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
Button.BackgroundTransparency = 1.000 
Button.Position = UDim2.new(0, 5, 0, 70)
Button.Size = UDim2.new(0, 175, 0, 15)

Button_2.Name = "Button" 
Button_2.Parent = Button 
Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
Button_2.Position = C.UDIM2(0, 0, 0.5, -9) 
Button_2.Size = C.UDIM2(0, 175, 0, 18) 
Button_2.AutoButtonColor = false 
Button_2.Font = Enum.Font.SourceSans 
Button_2.Text = "" 
Button_2.TextColor3 = C.COL3RGB(0, 0, 0) 
Button_2.TextSize = 11.000

TextLabel.Parent = Button_2 
TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
TextLabel.BackgroundTransparency = 1.000 
TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
TextLabel.Size = C.UDIM2(1, 0, 1, 0) 
TextLabel.Font = Enum.Font.Gotham 
TextLabel.Text = 'Load' 
TextLabel.TextColor3 = C.COL3RGB(200,200,200) 
TextLabel.TextSize = 15.000

Button_2.MouseButton1Down:Connect(function() 
	TextLabel.TextColor3 = MainUIColor 
	library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)})
	
	for i,v in pairs(Loader:GetDescendants()) do
		if v:IsA('ScrollingFrame') or v:IsA('Frame') then
			library:Tween(v, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1})
		elseif v:IsA('TextButton') or v:IsA('TextLabel') then
			library:Tween(v, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1})
			library:Tween(v, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})	
		elseif v:IsA('ImageLabel') then
			library:Tween(v, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1})
		end			
	end
	
	if game.GameId == 113491250 then
		loadstring(game:HttpGet('https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/SamuelPaste_pf.lua'))()
	elseif game.GameId == 1390601379 then
		loadstring(game:HttpGet('https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/SamuelPaste_cw.lua'))()
	elseif game.GameId == 3698756756 or game.GameId == 10053187005 or game.GameId == 3311740703 or game.GameId == 1190826589 or game.GameId == 3681951220 then
		loadstring(game:HttpGet('https://gitfront.io/r/Samuel/Gw6t8rBAGPhN/My-scripts/raw/SamuelPaste.lua'))()
	end	
end) 
Button_2.MouseEnter:Connect(function() 
	library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
end) 
Button_2.MouseLeave:Connect(function() 
	library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
end) 


Background.Size = UDim2.new(0,5,0,0)
--0, 220, 0, 140

library:Tween(Background, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,5,0,140)}) 
repeat wait() until Background.Size.Y.Offset == 140
task.wait(1)
library:Tween(Background, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,XSize,0,140)}) 