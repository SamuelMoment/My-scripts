if game.CoreGui:FindFirstChild("electric boogalo") then return error('script is already executed or you executed another script')end

BeforeLoad = tick()


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

function GetTextBounds(Text, Font, Size)
	return game:GetService('TextService'):GetTextSize(Text, Size, Font, Vector2.new(9999,9999));
end;

--cache real


local Vec2 		= Vector2.new
local Vec3 		= Vector3.new
local CF    	= CFrame.new
local INST		= Instance.new
local COL3		= Color3.new 

local COL3RGB 	= Color3.fromRGB 
local COL3HSV 	= Color3.fromHSV 
local COL3HEX 	= Color3.fromHex

local CLAMP 	= math.clamp 

local DEG 		= math.deg 
local FLOOR 	= math.floor 
local ACOS 		= math.acos 

local RANDOM 	= math.random 
local ATAN2 	= math.atan2 

local HUGE 		= math.huge 
local RAD 		= math.rad

local MIN 		= math.min
local POW 		= math.pow

local UDIM2 	= UDim2.new 
local CFAngles	= CFrame.Angles 

local FIND 		= string.find 
local LEN 		= string.len 
local SUB 		= string.sub 
local GSUB 		= string.gsub 
local RAY 		= Ray.new

local INSERT 	= table.insert 
local TBLFIND 	= table.find 
local TBLREMOVE	= table.remove 
local TBLSORT 	= table.sort 


local function GetTeam(plr)
	return game.Teams[plr.Team.Name]
end   


local bordercolorlist = {}

function findtextrandom(text)
	if text:find(' @r ') then 
		local b = text:split(' @r ')
		return b[math.random(#b)]
	else 
		return text
	end
end

--[[ some guide for me because i'm retard in string
string.split(text, from-to letter) example string.split('nig.ger, '.') will return table nig and ger
C.GSUB(text, change what, change to what)
string.find(text, what to find)
string.sub(string,startstring,endstring), exam: string.sub('banana',1,3) - ban



--]]

function textboxtriggers(text)
	local triggers = {
		['@user'] = game.Players.LocalPlayer.Name,
		['@ping'] = string.split(game.Stats.PerformanceStats.Ping:GetValue(), '.')[1],
		['@time'] = os.date('%H:%M:%S'),
	}

	if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') then 
		triggers['@health'] = game.Players.LocalPlayer.Character.Humanoid.Health
	end

	for a,b in next, triggers do 
		text = C.GSUB(text, a, b)
	end

	return findtextrandom(text)
end

local txt = game:GetService("TextService")
--local cfglocation = "pastedstormy/pastedstormycfgs/"
 
--makefolder("pastedstormy") 
--makefolder("pastedstormy/pastedstormycfgs/")
 
local mainFolder = 'SamuelPasteV2'
local cfglocation = mainFolder.."/cfgs/"
makefolder(mainFolder)
makefolder(mainFolder..'/cfgs')

local loopkillplr = {}
for i,v in pairs(game.Players:GetPlayers()) do
	if v == game.Players.LocalPlayer then continue end
	table.insert(loopkillplr,v.Name)
end

if not isfile(mainFolder..'/customkillsay.txt') then
	writefile(mainfolder..'/customkillsay.txt', "message1\
message2\
message3"
)
end

if not isfile(mainfolder..'/customchatspam.txt') then
	writefile(mainfolder..'/customchatspam.txt', "message1\
message2\
message3"
)
end


local Players = game:GetService("Players") 
local LocalPlayer = Players.LocalPlayer 


local MainUIColor = Color3.fromRGB(255,20,147)
											
getgenv().emojis = {
	[":clown:"] = utf8.char(129313);
	[":cold_face:"] = utf8.char(129398);
	[":neutral:"] = utf8.char(128528);
	[":sob:"] = utf8.char(128557);
}

repeat wait() until game:IsLoaded()

local library,Signal,ConfigLoad,ConfigLoad1,ConfigUpdateCfgList,ConfigUpdateCfgList2,CreateHitElement = loadstring(game:HttpGet("https://gitfront.io/r/Samuel/fZWDTqaU51W4/My-scripts/raw/library.lua"))()
library.setcfglocation(cfglocation)

local hitlogs = Signal.new()
hitlogs:Connect(function(text,col,time, size2, size4)
	CreateHitElement(text,col, time, size2, size4)
end)
CreateHitElement(" Welcome, "..LocalPlayer.Name.."!",MainUIColor,5, 340, 22)
wait(0.5)

local UserInputService 	= game:GetService("UserInputService") 
local ReplicatedStorage	= game:GetService("ReplicatedStorage") 
local RunService 		= game:GetService("RunService") 
local Lighting 			= game:GetService("Lighting") 
local PlayerGui 		= LocalPlayer.PlayerGui
local Players 			= game:GetService("Players") 
local LocalPlayer  		= Players.LocalPlayer 
local StarterGui 		= LocalPlayer.StarterGui
local Camera 			= workspace.CurrentCamera

local ClientScript 		= StarterGui.Client
local Client 			= getsenv(ClientScript)
-- bypass
for i,v in pairs(getgc()) do
    if debug.getinfo(v, "n").name == "acos" then
        hookfunction(v, function() return 0 end)   
    end
end
local oldNamecall; oldNamecall = hookmetamethod(game,'__namecall', function(self, ...) 
	local method = tostring(getnamecallmethod()) 
	local args = {...} 
	if method:lower() == 'kick' and self == LocalPlayer then
		return
	end
	if self.Name == 'Ban' then -- they actually that retarded
		return
	end

	return oldNamecall(self, unpack(args)) 
end)