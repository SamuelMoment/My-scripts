-- This file was generated using Luraph Obfuscator v13.5.3

local defaultSettings = {
	pretty = false;
	robloxFullName = false;
	robloxProperFullName = true;
	robloxClassName = true;
	tabs = false;
	semicolons = false;
	spaces = 3;
	sortKeys = true;
}

-- lua keywords
local keywords = {["and"]=true, ["break"]=true, ["do"]=true, ["else"]=true,
["elseif"]=true, ["end"]=true, ["false"]=true, ["for"]=true, ["function"]=true,
["if"]=true, ["in"]=true, ["local"]=true, ["nil"]=true, ["not"]=true, ["or"]=true,
["repeat"]=true, ["return"]=true, ["then"]=true, ["true"]=true, ["until"]=true, ["while"]=true}

local function isLuaIdentifier(str)
	if type(str) ~= "string" then return false end
	-- must be nonempty
	if str:len() == 0 then return false end
	-- can only contain a-z, A-Z, 0-9 and underscore
	if str:find("[^%d%a_]") then return false end
	-- cannot begin with digit
	if tonumber(str:sub(1, 1)) then return false end
	-- cannot be keyword
	if keywords[str] then return false end
	return true
end

-- works like Instance:GetFullName(), but invalid Lua identifiers are fixed (e.g. workspace["The Dude"].Humanoid)
local function properFullName(object, usePeriod)
	if object == nil or object == game then return "" end
	
	local s = object.Name
	local usePeriod = true
	if not isLuaIdentifier(s) then
		s = ("[%q]"):format(s)
		usePeriod = false
	end
	
	if not object.Parent or object.Parent == game then
		return s
	else
		return properFullName(object.Parent) .. (usePeriod and "." or "") .. s 
	end
end

local depth = 0
local shown
local INDENT
local reprSettings
local function DebugCheck(s,s2)

local success,err = pcall(function() return s[s2] end)

return success

end
local function DebugRepr(value, reprSettings)
	reprSettings = reprSettings or defaultSettings
	INDENT = (" "):rep(reprSettings.spaces or defaultSettings.spaces)
	if reprSettings.tabs then
		INDENT = "\t"
	end
	
	local v = value --args[1]
	local tabs = INDENT:rep(depth)
	
	if depth == 0 then
		shown = {}
	end
	if type(v) == "string" then
		return ("%q"):format(v)
	elseif type(v) == "number" then
		if v == math.huge then return "math.huge" end
		if v == -math.huge then return "-math.huge" end
		return tonumber(v)
	elseif type(v) == "boolean" then
		return tostring(v)
	elseif type(v) == "nil" then
		return "nil"
	elseif type(v) == "table" and type(v.__tostring) == "function" then
		return tostring(v.__tostring(v))
	elseif type(v) == "table" and getmetatable(v) and type(getmetatable(v).__tostring) == "function" then
		return tostring(getmetatable(v).__tostring(v))
	elseif type(v) == "table" then
		if shown[v] then return "{CYCLIC}" end
		shown[v] = true
		local str = "{" .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or "")
		local isArray = true
		for k, v in pairs(v) do
			if type(k) ~= "number" then
				isArray = false
				break
			end
		end
		if isArray then
			for i = 1, #v do
				if i ~= 1 then
					str = str .. (reprSettings.semicolons and ";" or ",") .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or " ")
				end
				depth = depth + 1
				str = str .. DebugRepr(v[i], reprSettings)
				depth = depth - 1
			end
		else
			local keyOrder = {}
			local keyValueStrings = {}
			for k, v in pairs(v) do
				depth = depth + 1
				local kStr = isLuaIdentifier(k) and k or ("[" .. DebugRepr(k, reprSettings) .. "]")
				local vStr = DebugRepr(v, reprSettings)
				--[[str = str .. ("%s = %s"):format(
					isLuaIdentifier(k) and k or ("[" .. DebugRepr(k, reprSettings) .. "]"),
					DebugRepr(v, reprSettings)
				)]]
				table.insert(keyOrder, kStr)
				keyValueStrings[kStr] = vStr
				depth = depth - 1
			end
			if reprSettings.sortKeys then table.sort(keyOrder) end
			local first = true
			for _, kStr in pairs(keyOrder) do
				if not first then
					str = str .. (reprSettings.semicolons and ";" or ",") .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or " ")
				end
				str = str .. ("%s = %s"):format(kStr, keyValueStrings[kStr])
				first = false
			end
		end
		shown[v] = false
		if reprSettings.pretty then
			str = str .. "\n" .. tabs
		end
		str = str .. "}"
		return str
	elseif typeof then
		-- Check Roblox types
		if typeof(v) == "Instance" then
			return  (reprSettings.robloxFullName
				and (reprSettings.robloxProperFullName and properFullName(v) or v:GetFullName())
			 or v.Name) .. (reprSettings.robloxClassName and ((" (%s)"):format(v.ClassName)) or "")
		elseif typeof(v) == "Axes" then
			local s = {}
			if v.X then table.insert(s, DebugRepr(Enum.Axis.X, reprSettings)) end
			if v.Y then table.insert(s, DebugRepr(Enum.Axis.Y, reprSettings)) end
			if v.Z then table.insert(s, DebugRepr(Enum.Axis.Z, reprSettings)) end
			return ("Axes.new(%s)"):format(table.concat(s, ", "))
		elseif typeof(v) == "BrickColor" then
			return ("BrickColor.new(%q)"):format(v.Name)
		elseif typeof(v) == "CFrame" then
			return ("CFrame.new(%s)"):format(table.concat({v:GetComponents()}, ", "))
		elseif typeof(v) == "Color3" then
			return ("Color3.new(%d, %d, %d)"):format(v.r, v.g, v.b)
		elseif typeof(v) == "ColorSequence" then
			if #v.Keypoints > 2 then
				return ("ColorSequence.new(%s)"):format(DebugRepr(v.Keypoints, reprSettings))
			else
				if v.Keypoints[1].Value == v.Keypoints[2].Value then
					return ("ColorSequence.new(%s)"):format(DebugRepr(v.Keypoints[1].Value, reprSettings))
				else
					return ("ColorSequence.new(%s, %s)"):format(
						DebugRepr(v.Keypoints[1].Value, reprSettings),
						DebugRepr(v.Keypoints[2].Value, reprSettings)
					)
				end
			end
		elseif typeof(v) == "ColorSequenceKeypoint" then
			return ("ColorSequenceKeypoint.new(%d, %s)"):format(v.Time, DebugRepr(v.Value, reprSettings))
		elseif typeof(v) == "DockWidgetPluginGuiInfo" then
			return ("DockWidgetPluginGuiInfo.new(%s, %s, %s, %s, %s, %s, %s)"):format(
				DebugRepr(v.InitialDockState, reprSettings),
				DebugRepr(v.InitialEnabled, reprSettings),
				DebugRepr(v.InitialEnabledShouldOverrideRestore, reprSettings),
				DebugRepr(v.FloatingXSize, reprSettings),
				DebugRepr(v.FloatingYSize, reprSettings),
				DebugRepr(v.MinWidth, reprSettings),
				DebugRepr(v.MinHeight, reprSettings)
			)
		elseif typeof(v) == "Enums" then
			return "Enums"
		elseif typeof(v) == "Enum" then
			return ("Enum.%s"):format(tostring(v))
		elseif typeof(v) == "EnumItem" then
			return ("Enum.%s.%s"):format(tostring(v.EnumType), v.Name)
		elseif typeof(v) == "Faces" then
			local s = {}
			for _, enumItem in pairs(Enum.NormalId:GetEnumItems()) do
				if v[enumItem.Name] then
					table.insert(s, DebugRepr(enumItem, reprSettings))
				end
			end
			return ("Faces.new(%s)"):format(table.concat(s, ", "))
		elseif typeof(v) == "NumberRange" then
			if v.Min == v.Max then
				return ("NumberRange.new(%d)"):format(v.Min)
			else
				return ("NumberRange.new(%d, %d)"):format(v.Min, v.Max)
			end
		elseif typeof(v) == "NumberSequence" then
			if #v.Keypoints > 2 then
				return ("NumberSequence.new(%s)"):format(DebugRepr(v.Keypoints, reprSettings))
			else
				if v.Keypoints[1].Value == v.Keypoints[2].Value then
					return ("NumberSequence.new(%d)"):format(v.Keypoints[1].Value)
				else
					return ("NumberSequence.new(%d, %d)"):format(v.Keypoints[1].Value, v.Keypoints[2].Value)
				end
			end
		elseif typeof(v) == "NumberSequenceKeypoint" then
			if v.Envelope ~= 0 then
				return ("NumberSequenceKeypoint.new(%d, %d, %d)"):format(v.Time, v.Value, v.Envelope)
			else
				return ("NumberSequenceKeypoint.new(%d, %d)"):format(v.Time, v.Value)
			end
		elseif typeof(v) == "PathWaypoint" then
			return ("PathWaypoint.new(%s, %s)"):format(
				DebugRepr(v.Position, reprSettings),
				DebugRepr(v.Action, reprSettings)
			)
		elseif typeof(v) == "PhysicalProperties" then
			return ("PhysicalProperties.new(%d, %d, %d, %d, %d)"):format(
				v.Density, v.Friction, v.Elasticity, v.FrictionWeight, v.ElasticityWeight
			)
		elseif typeof(v) == "Random" then
			return "<Random>"
		elseif typeof(v) == "Ray" then
			return ("Ray.new(%s, %s)"):format(
				DebugRepr(v.Origin, reprSettings),
				DebugRepr(v.Direction, reprSettings)
			)
		elseif typeof(v) == "RBXScriptConnection" then
			return "<RBXScriptConnection>"
		elseif typeof(v) == "RBXScriptSignal" then
			return "<RBXScriptSignal>"
		elseif typeof(v) == "Rect" then
			return ("Rect.new(%d, %d, %d, %d)"):format(
				v.Min.X, v.Min.Y, v.Max.X, v.Max.Y
			)
		elseif typeof(v) == "Region3" then
			local min = v.CFrame.p + v.Size * -.5
			local max = v.CFrame.p + v.Size * .5
			return ("Region3.new(%s, %s)"):format(
				DebugRepr(min, reprSettings),
				DebugRepr(max, reprSettings)
			)
		elseif typeof(v) == "Region3int16" then
			return ("Region3int16.new(%s, %s)"):format(
				DebugRepr(v.Min, reprSettings),
				DebugRepr(v.Max, reprSettings)
			)
		elseif typeof(v) == "TweenInfo" then
			return ("TweenInfo.new(%d, %s, %s, %d, %s, %d)"):format(
				v.Time, DebugRepr(v.EasingStyle, reprSettings), DebugRepr(v.EasingDirection, reprSettings),
				v.RepeatCount, DebugRepr(v.Reverses, reprSettings), v.DelayTime
			)
		elseif typeof(v) == "UDim" then
			return ("UDim.new(%d, %d)"):format(
				v.Scale, v.Offset
			)
		elseif typeof(v) == "UDim2" then
			return ("UDim2.new(%d, %d, %d, %d)"):format(
				v.X.Scale, v.X.Offset, v.Y.Scale, v.Y.Offset
			)
		elseif typeof(v) == "Vector2" then
			return ("Vector2.new(%d, %d"):format(v.X, v.Y)
		elseif typeof(v) == "Vector2int16" then
			return ("Vector2int16.new(%d, %d)"):format(v.X, v.Y)
		elseif typeof(v) == "Vector3" then
			return ("Vector3.new(%d, %d, %d)"):format(v.X, v.Y, v.Z)
		elseif typeof(v) == "Vector3int16" then
			return ("Vector3int16.new(%d, %d, %d)"):format(v.X, v.Y, v.Z)
		else
			return "<Roblox:" .. typeof(v) .. ">"
		end
	else
		return "<" .. type(v) .. ">"
	end
end

ql=ql+1;
setclipboard(DebugRepr(nH));
return(function(j,n,...)
local s;s=n[0][1][n[0][2]]:SetupHook("HookFunc",n[1][1][n[1][2]].mt,"__index",function(x,U)if(U=="CFrame"and n[1][1][n[1][2]].gamelogic.currentgun)then local p=n[1][1][n[1][2]].gamelogic.currentgun;if(p.data and x==(p.isaiming()and p.aimsightdata[1].sightpart or p.barrel))then local T=n[2][1][n[2][2]].flags.legitbot_silentaim_enabled;if(n[2][1][n[2][2]].options.legitbot_silentaim_bind.key~="none")then T=T and n[2][1][n[2][2]].flags.legitbot_silentaim_bind;end;local e=n[2][1][n[2][2]].flags.legitbot_silentaim_fov;if(n[2][1][n[2][2]].flags.legitbot_silentaim_dynamicfov)then e=e*(n[1][1][n[1][2]].camera.basefov/n[3][1][n[3][2]].FieldOfView);end;local q,D=n[1][1][n[1][2]]:GetClosest(e,n[2][1][n[2][2]].flags.legitbot_silentaim_targetpriority=="Closest To Player");if(T and q and D)then local h=Vector3.new(0,-196.2*(n[2][1][n[2][2]].flags.legitbot_precision_bulletdroppredictionpercentage/100),0);local M=D[n[2][1][n[2][2]].flags.legitbot_silentaim_hitbox:lower()];local a=p.data.bulletspeed;local J=n[2][1][n[2][2]].flags.legitbot_precision_movementprediction and n[1][1][n[1][2]]:PredictMovement(q,x.Position,M.Position,M,a)or M.Position;local X=n[2][1][n[2][2]].flags.legitbot_silentaim_randomization;local K=n[4][1][n[4][2]].trajectory(x.Position,n[2][1][n[2][2]].flags.legitbot_precision_bulletdropprediction and h or Vector3.new(0,-1,0),J+Vector3.new(math.random(-X,X),math.random(-X,X),math.random(-X,X)),a);if(n[2][1][n[2][2]].flags.legitbot_silentaim_wallcheck)then if(n[2][1][n[2][2]].flags.legitbot_silentaim_wallchecktype=="Visible Only")then local L=n[1][1][n[1][2]].raycast.raycast(x.Position,J-x.Position,n[5][1][n[5][2]],n[6][1][n[6][2]]);if(L)then return s(x,U);end;else if(not n[1][1][n[1][2]].bulletcheck(x.Position,J,K,h,p.data.penetrationdepth))then return s(x,U);end;end;end;if(n[2][1][n[2][2]].flags.legitbot_silentaim_hitratecurve)then local C=n[2][1][n[2][2]].flags.legitbot_silentaim_maxdistance;local O=(x.Position-J).Magnitude;local v=n[2][1][n[2][2]].flags.legitbot_silentaim_initialhitrate;local u=(101-v)^(O/C)+v-1;if(math.random(1,100)<u or O>C)then return s(x,U);end;end;return CFrame.new(x.Position,x.Position+K);end;end;end;return s(x,U);end);local t;t=n[0][1][n[0][2]]:SetupHook("HookFunc",n[1][1][n[1][2]].mt,"__newindex",function(m,Y,l)if(Y=="CFrame")then if(m==n[3][1][n[3][2]])then if((n[1][1][n[1][2]].crashserver or n[2][1][n[2][2]].flags.misc_memes_acidtrip))then local c=(n[1][1][n[1][2]].crashserver and tick())or(n[2][1][n[2][2]].flags.misc_memes_acidtrip and tick()*n[2][1][n[2][2]].flags.misc_memes_acidintensity);l=l*CFrame.new(0,0,0,math.sin(c),0,0,0,math.cos(c),0,0,0,math.acos(math.cos(c))/math.pi);elseif(n[2][1][n[2][2]].flags.visuals_local_aspectratio)then l=l*CFrame.new(0,0,0,1,0,0,0,n[2][1][n[2][2]].flags.visuals_local_ratio,0,0,0,1);end;elseif(m.Name=="HumanoidRootPart"or m.Name=="Head")then if(n[2][1][n[2][2]].flags.misc_movement_antidespawn and n[2][1][n[2][2]].flags.misc_movement_antidespawnmode=="Aggressive")then local N=m.CFrame;local R=n[1][1][n[1][2]].raycast.raycast(l.Position,N.Position-l.Position,n[5][1][n[5][2]],n[6][1][n[6][2]]);if((l.Position-N.Position).Magnitude>=10 or R)then l=N;end;end;end;end;return t(m,Y,l);end);
end)(zl,nH,...);
end;end;end;else if EH==2 then GH=function(...)local s8=0X01;local g8=(I and I()or _ENV);local v8=(g8==d and iH or g8);local r8,c8=yL(...);local o8=({});r8=r8-1;do for gQ=0,r8 do if not(LH>gQ)then break;else o8[gQ]=c8[gQ+0X1];end;end;end;YL[4]=fH;(YL)[1]=o8;if not pH then c8=nil;elseif not(lH)then else do(o8)[LH]={n=r8>=LH and r8-LH+1 or 0x0,k(c8,LH+1,r8+0X1)};end;end;local Q8=(0);if v8==g8 then else do if R then(R)(GH,v8);else _ENV=v8;end;end;end;local T8,W8,k8,m8=y(function()do while true do local xL=PH[s8];local KL=xL[7];s8=s8+1;if not(KL>=35)then do if not(KL<0X11)then if KL<0X001A then if not(KL<21)then if KL<0x00017 then if KL~=22 then(o8)[xL[0X6]]=xL[0X5];else local CL=(nH[0X001]);o8[0x8]=CL[0X00001][CL[2]];s8=s8+1;s8=s8+0x00001;xL=PH[s8];s8=s8+0x1;o8[0X8]=o8[8][xL[0X0004]];xL=PH[s8];s8=s8+1;o8[0X8]=o8[0X08][xL[0X4]];s8=s8+0X1;s8=s8+1;xL=PH[s8];s8=s8+0X1;s8=xL[0x1];end;else if not(KL>=0X18)then do(o8)[xL[6]]=o8[xL[0X1]]==xL[0X04];end;else if KL==25 then(o8[xL[6]])[o8[xL[0x001]]]=o8[xL[0x00003]];else local Au=nH[3];(o8)[0x5]=Au[1][Au[2]];s8=s8+1;s8=s8+1;s8=s8+0X1;Au=nH[1];(o8)[6]=Au[1][Au[2]];s8=s8+1;s8=s8+1;xL=PH[s8];do s8=s8+0X1;end;o8[0X6]=o8[0X06][xL[0X4]];s8=s8+0X01;s8=s8+0X1;xL=PH[s8];do s8=s8+1;end;(o8)[6]=o8[6][xL[0x4]];s8=s8+0x01;s8=s8+1;xL=PH[s8];s8=s8+0X1;do if not(not o8[0X6])then else s8=xL[0X001];end;end;end;end;end;else if KL<0X000013 then do if KL~=18 then(o8[7])[xL[5]]=o8[0x8];xL=PH[s8];s8=s8+0X1;(o8)[0X008]=o8[0X0006]==xL[0x4];xL=PH[s8];s8=s8+0X001;
if not(not o8[0X8])then else s8=xL[1];end;else do repeat local Eu,ru=hH,o8;if not(#Eu>0X00)then else local NE={};for ul,Zl in c,Eu do do for WT,OT in c,Zl do if not(OT[0X00001]==ru and OT[0x2]>=0x0)then else local fc=(OT[0X2]);if not(not NE[fc])then else NE[fc]={ru[fc]};end;OT[0X00001]=NE[fc];do(OT)[2]=0X1;end;end;end;end;end;end;until true;end;
return;end;end;else if KL~=20 then do o8[xL[0X6]]=true;end;else do o8[0X7][xL[5]]=o8[0X8];end;s8=s8+0X0001;local Ya=nH[0X01];o8[8]=Ya[0X1][Ya[0x2]];xL=PH[s8];s8=s8+1;local na=0X0;(o8)[0X8]=o8[8][xL[4]];xL=PH[s8];s8=s8+0X1;(o8)[0X9]=v8[xL[5]];do xL=PH[s8];end;s8=s8+0X1;do o8[9]=o8[9][xL[0X4]];end;s8=s8+1;local va=0X00009;s8=s8+1;xL=PH[s8];do s8=s8+1;end;o8[0Xa]=o8[0][xL[0x04]];s8=s8+0X01;s8=s8+0x1;do s8=s8+0x1;end;(o8)[0Xa]=o8[0X00a]-o8[2];s8=s8+1;o8[0XA]=o8[0X0000A]-o8[0X1];xL=PH[s8];s8=s8+0X1;(o8)[0XB]=o8[0][xL[4]];do s8=s8+0X1;end;s8=s8+1;s8=s8+1;local Aa=0X03;do if Aa~=0 then do Q8=va+Aa-1;end;end;end;local la,ea=nil,nil;if Aa==0x1 then la,ea=yL(o8[va]());else la,ea=yL(o8[va](k(o8,va+0X1,Q8)));end;if na==0x1 then Q8=va-1;else if na==0 then la=la+va-0X1;Q8=la;else la=va+na-2;Q8=la+0X001;end;local R9=(0x0);for bP=va,la do do R9=R9+0X1;end;do o8[bP]=ea[R9];end;end;end;s8=s8+1;va=8;o8[va]=o8[va](k(o8,va+0X1,Q8));do Q8=va;end;s8=s8+1;do s8=s8+0X00001;end;xL=PH[s8];do s8=s8+0X1;end;do o8[0X07][xL[5]]=o8[8];end;s8=s8+1;do Ya=nH[0X1];end;(o8)[8]=Ya[1][Ya[0X2]];do xL=PH[s8];end;s8=s8+0X0001;o8[8]=o8[8][xL[4]];s8=s8+0X1;s8=s8+1;xL=PH[s8];s8=s8+1;o8[9]=v8[xL[0X0005]];xL=PH[s8];s8=s8+1;do(o8)[0X9]=o8[0X0009][xL[0X4]];end;s8=s8+1;s8=s8+1;xL=PH[s8];s8=s8+1;(o8)[0X0a]=o8[0x0][xL[4]];do s8=s8+1;end;o8[0Xa]=o8[0x0A]-o8[2];xL=PH[s8];s8=s8+1;(o8)[11]=o8[0][xL[0X0004]];s8=s8+1;do s8=s8+0X1;end;s8=s8+0x00001;va=0X00009;Aa=3;na=0;do if Aa~=0X000 then Q8=va+Aa-1;end;end;la,ea=nil;if Aa~=1 then la,ea=yL(o8[va](k(o8,va+1,Q8)));else la,ea=yL(o8[va]());end;do if na~=0X1 then if na~=0 then la=va+na-2;Q8=la+1;else do la=la+va-1;end;Q8=la;end;local Tg=(0);for gG=va,la do Tg=Tg+0x001;(o8)[gG]=ea[Tg];end;else do Q8=va-0x01;end;end;end;do s8=s8+0X1;end;va=8;o8[va]=o8[va](k(o8,va+1,Q8));Q8=va;do xL=PH[s8];end;do s8=s8+0X1;end;(o8[0X07])[xL[0X5]]=o8[8];xL=PH[s8];s8=s8+0x001;s8=xL[1];end;end;end;else do if not(KL<30)then if KL>=0X20 then if not(KL<0X0021)then do if KL~=0X0022 then local Sb=nH[0X1];do(o8)[8]=Sb[1][Sb[2]];end;s8=s8+0X001;do s8=s8+0x1;end;xL=PH[s8];do s8=s8+1;end;o8[0X008]=o8[0X8][xL[4]];do s8=s8+0X1;end;s8=s8+1;do xL=PH[s8];end;s8=s8+0X0001;(o8)[8]=o8[0X8][xL[4]];s8=s8+1;do s8=s8+0X1;end;do xL=PH[s8];end;s8=s8+0x00001;s8=xL[1];else(o8)[0X6]=o8[0x4][xL[0X4]];do s8=s8+1;end;do s8=s8+1;end;xL=PH[s8];s8=s8+1;o8[6]=o8[6][xL[4]];s8=s8+0X01;s8=s8+0x00001;xL=PH[s8];s8=s8+0x1;o8[6]=o8[6][xL[0x04]];do s8=s8+0x01;end;s8=s8+1;do xL=PH[s8];end;s8=s8+0x1;s8=xL[0X1];end;end;else local ji=nH[0x1];o8[8]=ji[1][ji[2]];xL=PH[s8];s8=s8+0x1;(o8)[8]=o8[0X008][xL[4]];xL=PH[s8];s8=s8+1;do o8[8]=o8[8][xL[0X04]];end;s8=s8+1;s8=s8+0X00001;xL=PH[s8];s8=s8+1;s8=xL[1];end;else if KL==31 then local mi=(nH[0X1]);o8[8]=mi[1][mi[2]];do s8=s8+0X001;end;s8=s8+0X1;xL=PH[s8];do s8=s8+0X001;end;do(o8)[0X008]=o8[8][xL[0X4]];end;s8=s8+0X1;s8=s8+1;do xL=PH[s8];end;s8=s8+0x1;o8[0X008]=o8[8][xL[4]];s8=s8+1;s8=s8+0X1;xL=PH[s8];s8=s8+1;s8=xL[0X1];else if not o8[xL[6]]then s8=xL[1];end;end;end;else if not(KL>=0X1c)then if KL==27 then local nM=nH[0X00001];do o8[8]=nM[1][nM[2]];end;do xL=PH[s8];end;do s8=s8+0x1;end;o8[0x8]=o8[0X8][xL[0x4]];s8=s8+1;s8=s8+0X0001;xL=PH[s8];s8=s8+1;o8[0X8]=o8[8][xL[0x04]];xL=PH[s8];do s8=s8+1;end;s8=xL[0X01];else(o8)[xL[0X6]]={k({},1,xL[0X1])};end;else do if KL==0x1D then
(o8[0X007])[xL[5]]=o8[8];xL=PH[s8];s8=s8+0X00001;o8[0X8]=o8[6]==xL[0X0004];xL=PH[s8];do s8=s8+1;end;if not(not o8[8])then else s8=xL[1];end;else do o8[7][xL[5]]=o8[0X8];end;xL=PH[s8];do s8=s8+1;end;o8[8]=o8[6]==xL[4];do xL=PH[s8];end;do s8=s8+0X1;end;if not(not o8[0x8])then else s8=xL[1];end;end;end;end;end;end;end;else if KL>=0x00008 then if KL<0x0c then do if not(KL>=10)then if KL==9 then local Fe=(nH[0X1]);do o8[8]=Fe[1][Fe[2]];end;do s8=s8+0X1;end;do s8=s8+1;end;xL=PH[s8];s8=s8+0X1;(o8)[8]=o8[0x8][xL[4]];xL=PH[s8];s8=s8+0X1;do o8[0X08]=o8[8][xL[4]];end;do xL=PH[s8];end;s8=s8+1;do s8=xL[1];end;else(o8[7])[xL[0x005]]=o8[0X8];xL=PH[s8];s8=s8+1;do o8[8]=o8[0x0006]==xL[0X004];end;xL=PH[s8];s8=s8+1;if not o8[8]then s8=xL[0X001];end;end;else do if KL==0x0B then(o8[0X5])[xL[0X5]]=o8[6];local BY=(nH[3]);do s8=s8+1;end;(o8)[5]=BY[1][BY[0X2]];s8=s8+0X1;s8=s8+0X001;s8=s8+0X1;BY=nH[0X0001];o8[6]=BY[1][BY[2]];s8=s8+1;do s8=s8+1;end;xL=PH[s8];do s8=s8+1;end;o8[6]=o8[6][xL[0X4]];do xL=PH[s8];end;do s8=s8+1;end;o8[6]=o8[6][xL[0X4]];do s8=s8+0X00001;end;s8=s8+1;xL=PH[s8];s8=s8+1;(o8[5])[xL[0X05]]=o8[0X6];s8=s8+1;BY=nH[0X3];o8[0X5]=BY[0X001][BY[0x002]];do s8=s8+1;end;s8=s8+0X01;do s8=s8+1;end;BY=nH[0x1];o8[6]=BY[1][BY[2]];xL=PH[s8];s8=s8+0X1;o8[0x006]=o8[0X6][xL[0X4]];s8=s8+1;s8=s8+1;do s8=s8+0X001;end;local FY=(6);o8[0X7]=o8[0X00];local bY=(0x2);do s8=s8+1;end;(o8)[FY]=o8[FY](o8[FY+0X1]);Q8=FY;s8=s8+0x1;s8=s8+0X1;xL=PH[s8];do s8=s8+1;end;o8[0X5][xL[5]]=o8[0x6];do s8=s8+0X1;end;BY=nH[3];(o8)[5]=BY[1][BY[0X2]];s8=s8+1;do o8[6]=o8[3];end;xL=PH[s8];s8=s8+0X1;(o8[5])[xL[5]]=o8[6];xL=PH[s8];s8=s8+1;do o8[0x5]=v8[xL[5]];end;s8=s8+0x1;do BY=nH[0X0004];end;o8[0X6]=BY[0x1][BY[2]];s8=s8+1;do FY=0X05;end;local QY=(0X0004);if bY~=0 then Q8=FY+bY-1;end;local XY,tY=nil,(nil);if bY==1 then XY,tY=yL(o8[FY]());else XY,tY=yL(o8[FY](k(o8,FY+0x0001,Q8)));end;if QY==1 then Q8=FY-0x1;else do if QY==0 then XY=XY+FY-0X1;Q8=XY;else XY=FY+QY-2;do Q8=XY+1;end;end;end;local qn=0X0000;for Dz=FY,XY do qn=qn+1;(o8)[Dz]=tY[qn];end;end;s8=s8+0x1;do s8=s8+1;end;xL=PH[s8];s8=s8+1;FY=5;local dY=(v(function(...)(E)();for V3,N3 in...do E(true,V3,N3);end;end));dY(o8[FY],o8[FY+1],o8[FY+0X2]);do Q8=FY;end;o8[FY]=dY;s8=xL[0x0001];else(o8)[xL[6]]=v8[xL[0x005]];end;end;end;end;else if not(KL>=14)then if KL==13 then else(o8)[xL[0X06]]=o8[xL[0x00001]];end;else if not(KL>=0X0000F)then if o8[xL[1]]==xL[0X4]then else s8=xL[0X006];end;else do if KL==0X10 then(o8)[6]=o8[6][xL[4]];s8=s8+0X1;s8=s8+0X1;s8=s8+0X1;local Ze=(nH[2]);(o8)[7]=Ze[1][Ze[0x02]];s8=s8+0X1;s8=s8+1;do xL=PH[s8];end;s8=s8+0X1;(o8)[7]=o8[0X7][xL[0X4]];s8=s8+1;local Ae=(0X8);s8=s8+1;do xL=PH[s8];end;s8=s8+0X001;(o8)[0X007]=o8[0X7][xL[4]];s8=s8+0X1;do s8=s8+1;end;do xL=PH[s8];end;s8=s8+1;do o8[8]=v8[xL[0X5]];end;local ce=(0X5);s8=s8+1;s8=s8+1;xL=PH[s8];s8=s8+0X1;local ge=(o8[0X00008]);o8[Ae+1]=ge;o8[Ae]=ge[xL[0X00004]];xL=PH[s8];s8=s8+0X1;do(o8)[0x0A]=v8[xL[5]];end;xL=PH[s8];s8=s8+1;do(o8)[0Xa]=o8[10][xL[0X4]];end;s8=s8+1;s8=s8+1;s8=s8+1;(o8)[0XB]=o8[5];do xL=PH[s8];end;s8=s8+0X001;(o8)[0X0000C]=o8[6][xL[4]];s8=s8+0x1;s8=s8+1;s8=s8+0X1;do o8[0x000C]=o8[12]-o8[5];end;do s8=s8+0X0001;end;Ae=10;do(o8)[Ae]=o8[Ae](o8[Ae+0X1],o8[Ae+0X2]);end;do Q8=Ae;end;do s8=s8+1;end;o8[11]=o8[7];s8=s8+1;o8[12]=true;s8=s8+1;Ae=8;local Se=0X003;do if ce~=0X00000 then do Q8=Ae+ce-0X001;end;end;end;local Ce,ne=nil,(nil);if ce==0X1 then Ce,ne=yL(o8[Ae]());else Ce,ne=yL(o8[Ae](k(o8,Ae+1,Q8)));end;if Se==0X1 then Q8=Ae-1;else if Se==0X0 then Ce=Ce+Ae-1;Q8=Ce;else Ce=Ae+Se-2;do Q8=Ce+1;end;end;local wa=0X0;for mr=Ae,Ce do wa=wa+0X1;o8[mr]=ne[wa];end;end;s8=s8+1;do Ze=nH[0X2];end;do o8[0xa]=Ze[1][Ze[0X002]];end;do xL=PH[s8];end;s8=s8+1;do Ae=0XA;end;do ge=o8[0Xa];end;o8[Ae+0X00001]=ge;(o8)[Ae]=ge[xL[0X4]];xL=PH[s8];s8=s8+1;(o8)[12]=v8[xL[0X5]];do s8=s8+0X1;end;s8=s8+1;xL=PH[s8];s8=s8+1;o8[13]=xL[5];do xL=PH[s8];end;do s8=s8+0X001;end;do(o8)[14]=v8[xL[0X5]];end;s8=s8+1;do s8=s8+0x00001;end;xL=PH[s8];s8=s8+1;Ae=0Xe;ge=o8[14];do o8[Ae+0X1]=ge;end;o8[Ae]=ge[xL[4]];do xL=PH[s8];end;s8=s8+0X00001;o8[16]=v8[xL[0X5]];xL=PH[s8];do s8=s8+1;end;o8[0X10]=o8[16][xL[0x4]];s8=s8+0X1;s8=s8+1;s8=s8+1;(o8)[0X0011]=o8[0x9];xL=PH[s8];s8=s8+0X01;o8[0X000012]=o8[0X6][xL[4]];xL=PH[s8];s8=s8+1;(o8)[19]=o8[4][xL[0X4]];do s8=s8+1;end;s8=s8+0X1;do xL=PH[s8];end;s8=s8+1;(o8)[0X000013]=o8[0x13][xL[0X00004]];s8=s8+0x1;s8=s8+1;s8=s8+1;o8[0x12]=o8[18]*o8[19];s8=s8+1;
do Ae=0X10;end;(o8)[Ae]=o8[Ae](o8[Ae+1],o8[Ae+0X2]);do Q8=Ae;end;s8=s8+1;o8[17]=o8[0x7];s8=s8+1;(o8)[0X12]=true;s8=s8+1;do Ae=14;end;ce=0x005;Se=0;do if ce~=0 then do Q8=Ae+ce-0X0001;end;end;end;do Ce,ne=nil;end;if ce~=0X01 then do Ce,ne=yL(o8[Ae](k(o8,Ae+1,Q8)));end;else Ce,ne=yL(o8[Ae]());end;do if Se==1 then Q8=Ae-1;else if Se~=0X00 then Ce=Ae+Se-0x2;do Q8=Ce+1;end;else Ce=Ce+Ae-1;do Q8=Ce;end;end;local N2=0X0;do for ru=Ae,Ce do N2=N2+1;(o8)[ru]=ne[N2];end;end;end;end;do s8=s8+1;end;s8=s8+0X1;s8=s8+0X0001;Ae=12;ce=0X0;Se=0X0;if ce==0X0 then else Q8=Ae+ce-0X1;end;do Ce,ne=nil;end;do if ce==0X001 then Ce,ne=yL(o8[Ae]());else Ce,ne=yL(o8[Ae](k(o8,Ae+1,Q8)));end;end;if Se~=0X1 then if Se==0X0 then Ce=Ce+Ae-1;Q8=Ce;else Ce=Ae+Se-2;Q8=Ce+0x1;end;local pe=(0X0);for G5=Ae,Ce do pe=pe+0X1;do o8[G5]=ne[pe];end;end;else Q8=Ae-1;end;s8=s8+0X001;Ae=10;do(o8)[Ae]=o8[Ae](k(o8,Ae+0X1,Q8));end;Q8=Ae;s8=s8+0x1;o8[0X0]=o8[0x000a];do xL=PH[s8];end;s8=s8+1;s8=xL[0x0001];else do(o8[7])[xL[5]]=o8[8];end;s8=s8+0X0001;local Ak=nH[0x001];o8[8]=Ak[0X0001][Ak[2]];s8=s8+0X0001;s8=s8+0x0001;xL=PH[s8];s8=s8+0X01;o8[0X8]=o8[0X8][xL[4]];s8=s8+1;s8=s8+0X001;do xL=PH[s8];end;s8=s8+0X1;do(o8)[9]=v8[xL[5]];end;s8=s8+1;s8=s8+1;xL=PH[s8];local hk=(0X0);s8=s8+1;o8[9]=o8[0X9][xL[0X004]];local Mk=0x9;do xL=PH[s8];end;do s8=s8+0X1;end;o8[10]=o8[0X0][xL[0X4]];do s8=s8+0X1;end;do s8=s8+0X1;end;do s8=s8+1;end;(o8)[10]=o8[10]+o8[0x00002];do s8=s8+1;end;o8[0X0000a]=o8[10]+o8[0X01];do xL=PH[s8];end;s8=s8+1;o8[0x000B]=o8[0][xL[4]];do s8=s8+1;end;s8=s8+0X0001;s8=s8+0X01;local Jk=(3);do if Jk~=0 then Q8=Mk+Jk-1;end;end;local Ck,lk=nil,nil;do if Jk==1 then Ck,lk=yL(o8[Mk]());else Ck,lk=yL(o8[Mk](k(o8,Mk+0X00001,Q8)));end;end;if hk~=0X1 then if hk~=0X0 then Ck=Mk+hk-0X2;do Q8=Ck+0X1;end;else do Ck=Ck+Mk-1;end;Q8=Ck;end;local LE=(0);do for q6=Mk,Ck do LE=LE+0X1;(o8)[q6]=lk[LE];end;end;else do Q8=Mk-0X1;end;end;s8=s8+1;do Mk=8;end;(o8)[Mk]=o8[Mk](k(o8,Mk+1,Q8));Q8=Mk;xL=PH[s8];s8=s8+0x1;o8[7][xL[5]]=o8[0X0008];s8=s8+1;Ak=nH[0X001];o8[0X8]=Ak[1][Ak[2]];xL=PH[s8];s8=s8+0X1;(o8)[8]=o8[8][xL[4]];s8=s8+0x1;s8=s8+0X00001;do xL=PH[s8];end;s8=s8+1;(o8)[0x0009]=v8[xL[5]];xL=PH[s8];s8=s8+1;o8[0X9]=o8[9][xL[4]];xL=PH[s8];s8=s8+0X001;(o8)[10]=o8[0][xL[4]];s8=s8+1;do s8=s8+0x0001;end;s8=s8+1;o8[10]=o8[10]+o8[2];do xL=PH[s8];end;s8=s8+0x01;(o8)[0x00B]=o8[0][xL[4]];s8=s8+1;do s8=s8+0X1;end;s8=s8+1;do Mk=0X9;end;Jk=0X3;hk=0;do if Jk~=0 then Q8=Mk+Jk-0X1;end;end;Ck,lk=nil;do if Jk~=1 then Ck,lk=yL(o8[Mk](k(o8,Mk+1,Q8)));else Ck,lk=yL(o8[Mk]());end;end;if hk==0X1 then do Q8=Mk-0x00001;end;else do if hk~=0X00 then Ck=Mk+hk-2;Q8=Ck+0X1;else Ck=Ck+Mk-1;Q8=Ck;end;end;local Pq=(0X0000);for lx=Mk,Ck do Pq=Pq+1;o8[lx]=lk[Pq];end;end;do s8=s8+0X1;end;Mk=0X8;o8[Mk]=o8[Mk](k(o8,Mk+0X0001,Q8));Q8=Mk;do xL=PH[s8];end;s8=s8+0x1;o8[7][xL[0X0005]]=o8[0X0008];xL=PH[s8];s8=s8+1;s8=xL[1];end;end;end;end;end;else if KL>=4 then do if not(KL>=0X0006)then if KL~=5 then local R0=nH[1];(o8)[8]=R0[0X01][R0[0x2]];s8=s8+1;s8=s8+0X01;xL=PH[s8];s8=s8+0x1;(o8)[8]=o8[8][xL[4]];do xL=PH[s8];end;do s8=s8+1;end;(o8)[8]=o8[0X8][xL[0X4]];do xL=PH[s8];end;s8=s8+1;s8=xL[0x001];else local Dx=nH[0X01];do o8[0X0008]=Dx[1][Dx[0X00002]];end;s8=s8+1;do s8=s8+1;end;xL=PH[s8];s8=s8+1;o8[8]=o8[8][xL[0X4]];s8=s8+0X00001;s8=s8+0x1;xL=PH[s8];do s8=s8+1;end;do o8[0X8]=o8[0X0008][xL[4]];end;xL=PH[s8];s8=s8+0X1;s8=xL[0X1];end;else if KL==7 then local tU=(nH[1]);o8[0X00008]=tU[1][tU[0X2]];do xL=PH[s8];end;s8=s8+1;o8[8]=o8[8][xL[4]];xL=PH[s8];s8=s8+1;do(o8)[8]=o8[8][xL[0x4]];end;xL=PH[s8];s8=s8+0X1;s8=xL[0x00001];else do if o8[xL[0x00006]]then s8=xL[1];end;end;end;end;end;else if KL<0X2 then if KL==0X1 then(o8)[xL[6]]=o8[xL[1]]+xL[0x004];else local CL=nH[1];(o8)[8]=CL[1][CL[0X2]];do xL=PH[s8];end;s8=s8+0X00001;(o8)[8]=o8[8][xL[4]];do xL=PH[s8];end;s8=s8+1;do(o8)[8]=o8[0X8][xL[0X004]];end;s8=s8+0x00001;do s8=s8+0X0001;end;do xL=PH[s8];end;do s8=s8+0X1;end;do s8=xL[1];end;end;else do if KL==0X3 then local X_=(nH[0X1]);o8[0X008]=X_[0X1][X_[0X2]];s8=s8+1;s8=s8+0X1;xL=PH[s8];s8=s8+1;do(o8)[8]=o8[0X8][xL[4]];end;s8=s8+0X1;s8=s8+1;xL=PH[s8];do s8=s8+1;end;(o8)[0X8]=o8[8][xL[4]];s8=s8+1;s8=s8+1;xL=PH[s8];s8=s8+0x001;s8=xL[1];else o8[xL[6]]=o8[xL[1]]-o8[xL[3]];end;end;end;end;end;end;end;else if KL<0X000035 then do if KL>=44 then if not(KL>=48)then do if KL<0X0002e then do if KL==45 then(o8[7])[xL[0x05]]=o8[0X00008];do xL=PH[s8];end;do s8=s8+0X1;end;(o8)[8]=o8[6]==xL[0X4];xL=PH[s8];do s8=s8+1;end;if not o8[8]then s8=xL[1];end;else local MT=(nH[0x001]);o8[0X008]=MT[1][MT[2]];do s8=s8+0X1;end;do s8=s8+0X1;end;xL=PH[s8];s8=s8+1;do o8[8]=o8[8][xL[4]];end;s8=s8+1;s8=s8+1;xL=PH[s8];s8=s8+1;(o8)[8]=o8[0x8][xL[4]];s8=s8+1;s8=s8+0X01;xL=PH[s8];s8=s8+1;s8=xL[0X1];end;end;else if KL==47 then(o8[7])[xL[5]]=o8[8];xL=PH[s8];s8=s8+0X1;do o8[0x0008]=o8[6]==xL[0X004];end;xL=PH[s8];s8=s8+1;if not o8[8]then s8=xL[1];end;else(o8[7])[xL[0x005]]=o8[0X8];do xL=PH[s8];end;s8=s8+1;(o8)[0X8]=o8[0X00006]==xL[0X004];xL=PH[s8];s8=s8+0X001;do if not(not o8[0X8])then else s8=xL[1];end;end;end;end;end;else if KL<50 then if KL==0x031 then o8[0X7][xL[5]]=o8[8];xL=PH[s8];s8=s8+0X01;(o8)[8]=o8[6]==xL[0X04];xL=PH[s8];s8=s8+0X0001;if not o8[8]then s8=xL[0X1];end;else(o8[0X7])[xL[0X05]]=o8[0X0008];xL=PH[s8];s8=s8+0x1;(o8)[0X8]=o8[0X6]==xL[0X4];xL=PH[s8];s8=s8+1;if not(not o8[0X8])then else s8=xL[1];end;end;else if KL>=0X000033 then if KL~=52 then local NN=(SH[xL[1]]);local SN=(nil);local vN=NN[0X5];local KN=(#vN);if KN>0 then do SN={};end;for Tx=1,KN do local ox=vN[Tx];if ox[1]~=0 then(SN)[Tx-1]=nH[ox[0X002]];else(SN)[Tx-0x0001]={o8,ox[2]};end;end;U(hH,SN);end;o8[xL[0x6]]=GL(v8,NN,SN);else do(o8)[xL[0X6]]=xL[0X00005];end;end;else o8[0X7][xL[5]]=o8[0X8];s8=s8+0x1;local J4=nH[1];(o8)[8]=J4[0X00001][J4[0X02]];do s8=s8+1;end;s8=s8+0X1;xL=PH[s8];s8=s8+1;local N4=9;o8[0X08]=o8[8][xL[0x4]];local Q4=(0);s8=s8+1;s8=s8+1;do xL=PH[s8];end;s8=s8+1;(o8)[0x9]=v8[xL[5]];xL=PH[s8];s8=s8+1;(o8)[0X9]=o8[0x9][xL[0X4]];do s8=s8+0X00001;end;s8=s8+1;xL=PH[s8];s8=s8+1;o8[10]=o8[0x00][xL[0X0004]];do s8=s8+1;end;do s8=s8+1;end;do xL=PH[s8];end;s8=s8+1;o8[11]=o8[0X000][xL[0X00004]];s8=s8+1;s8=s8+1;s8=s8+1;o8[0XB]=o8[0XB]+o8[2];do s8=s8+1;end;o8[0X00b]=o8[11]+o8[1];s8=s8+0X00001;local m4=0X00003;if m4==0X0 then else do Q8=N4+m4-1;end;end;local K4,M4=nil,(nil);do if m4==1 then K4,M4=yL(o8[N4]());else K4,M4=yL(o8[N4](k(o8,N4+0X00001,Q8)));end;end;if Q4==1 then Q8=N4-0X1;else if Q4~=0x0 then K4=N4+Q4-0x2;Q8=K4+0X1;else do K4=K4+N4-1;end;Q8=K4;end;local Fy=(0);for D1=N4,K4 do Fy=Fy+0x1;o8[D1]=M4[Fy];end;end;s8=s8+1;s8=s8+1;s8=s8+0X1;N4=0X08;do o8[N4]=o8[N4](k(o8,N4+1,Q8));end;Q8=N4;s8=s8+0X0001;s8=s8+0X1;do xL=PH[s8];end;do s8=s8+1;end;do(o8[7])[xL[0X05]]=o8[0x8];end;s8=s8+1;do J4=nH[0x1];end;o8[8]=J4[0X1][J4[0X002]];s8=s8+1;s8=s8+1;xL=PH[s8];s8=s8+1;do(o8)[8]=o8[8][xL[0X00004]];end;do xL=PH[s8];end;s8=s8+0X001;do(o8)[0X9]=v8[xL[0X005]];end;do xL=PH[s8];end;s8=s8+1;o8[0X9]=o8[9][xL[4]];xL=PH[s8];s8=s8+1;o8[0X000a]=o8[0][xL[0X04]];do s8=s8+1;end;do s8=s8+0X1;end;do xL=PH[s8];end;s8=s8+1;o8[0xb]=o8[0X0][xL[4]];do s8=s8+1;end;(o8)[11]=o8[0Xb]+o8[0X2];s8=s8+0X01;N4=0X9;do m4=3;end;do Q4=0X0;end;if m4~=0X0000 then Q8=N4+m4-1;end;K4,M4=nil;if m4==1 then K4,M4=yL(o8[N4]());else K4,M4=yL(o8[N4](k(o8,N4+0X1,Q8)));end;do if Q4==0X1 then Q8=N4-1;else if Q4~=0X0 then K4=N4+Q4-2;Q8=K4+1;else K4=K4+N4-0X01;Q8=K4;end;local Wx=0X0;for D4=N4,K4 do do Wx=Wx+1;end;do(o8)[D4]=M4[Wx];end;end;end;end;do s8=s8+1;end;do N4=8;end;(o8)[N4]=o8[N4](k(o8,N4+1,Q8));Q8=N4;s8=s8+1;s8=s8+0x001;do xL=PH[s8];end;do s8=s8+0X001;end;(o8[0X7])[xL[0X5]]=o8[8];xL=PH[s8];do s8=s8+1;end;s8=xL[1];end;end;end;else if not(KL>=39)then if not(KL<37)then if KL~=38 then local My=(xL[0x0006]);local Qy,jy,fy=o8[My]();if Qy then o8[My+1]=jy;(o8)[My+0X0002]=fy;s8=xL[1];end;else local c6=nH[1];(o8)[8]=c6[0x00001][c6[0x002]];do s8=s8+0x1;end;s8=s8+0x1;xL=PH[s8];s8=s8+0X00001;o8[0X08]=o8[8][xL[4]];s8=s8+1;s8=s8+1;xL=PH[s8];s8=s8+1;do o8[8]=o8[0X008][xL[0X04]];end;xL=PH[s8];do s8=s8+1;end;s8=xL[1];end;else if KL~=36 then o8[0]=v8[xL[0X0005]];do s8=s8+0X1;end;s8=s8+1;do xL=PH[s8];end;s8=s8+0X1;do o8[0]=o8[0][xL[4]];end;local KU=(nH[0]);s8=s8+0X1;(o8)[0X1]=KU[1][KU[0X2]];s8=s8+0X1;s8=s8+0X1;xL=PH[s8];s8=s8+0X1;do(o8)[1]=o8[1][xL[4]];end;xL=PH[s8];s8=s8+0x00001;o8[0X1]=o8[0X1][xL[0X0004]];xL=PH[s8];s8=s8+1;do(o8)[0X1]=o8[1]/xL[4];end;s8=s8+1;do KU=nH[0X0];end;local DU=(0x0);do o8[0X002]=KU[1][KU[2]];end;xL=PH[s8];s8=s8+0X001;(o8)[0X2]=o8[0X2][xL[4]];s8=s8+0X001;s8=s8+1;xL=PH[s8];s8=s8+0X0001;do o8[0x2]=o8[2][xL[0X4]];end;do xL=PH[s8];end;s8=s8+1;do o8[0X2]=o8[2]/xL[0X0004];end;s8=s8+1;do o8[DU]=o8[DU](o8[DU+0X1],o8[DU+2]);end;Q8=DU;do s8=s8+1;end;KU=nH[0X1];do o8[0x1]=KU[1][KU[0x2]];end;xL=PH[s8];s8=s8+1;(o8)[0X1]=o8[1][xL[0x004]];xL=PH[s8];do s8=s8+0X01;end;o8[0X1]=o8[1][xL[4]];s8=s8+0x1;s8=s8+0x1;do s8=s8+0X0001;end;KU=nH[0X0001];(o8)[2]=KU[0x1][KU[2]];s8=s8+0X1;s8=s8+1;xL=PH[s8];s8=s8+0X1;o8[2]=o8[2][xL[4]];xL=PH[s8];s8=s8+1;o8[2]=o8[2][xL[4]];s8=s8+0X1;KU=nH[0X1];o8[3]=KU[0X1][KU[2]];do s8=s8+1;end;s8=s8+0X00001;xL=PH[s8];s8=s8+1;do o8[0X3]=o8[0X003][xL[0X4]];end;do s8=s8+1;end;s8=s8+1;xL=PH[s8];s8=s8+1;o8[3]=o8[3][xL[4]];s8=s8+1;do KU=nH[0X0002];end;o8[0X4]=KU[0X01][KU[0X2]];do xL=PH[s8];end;s8=s8+1;(o8)[4]=o8[4][xL[0X04]];xL=PH[s8];do s8=s8+0X1;end;do(o8)[4]=o8[4][xL[0x04]];end;s8=s8+0X1;s8=s8+1;s8=s8+1;do KU=nH[1];end;do o8[0x0005]=KU[0X0001][KU[2]];end;do s8=s8+0X00001;end;s8=s8+1;xL=PH[s8];do s8=s8+1;end;o8[0X5]=o8[0X5][xL[0X4]];do xL=PH[s8];end;do s8=s8+0X1;end;do o8[5]=o8[0X5][xL[4]];end;s8=s8+0X1;s8=s8+0X01;xL=PH[s8];do s8=s8+1;end;if not(not o8[5])then else s8=xL[0x1];end;else(o8)[xL[0X6]]=o8[xL[0X1]]^o8[xL[0X3]];end;end;else if KL>=0X29 then if not(KL<42)then do if KL~=43 then do(o8[xL[6]])[xL[5]]=xL[0X4];end;else local df=(nH[0X1]);(o8)[0X8]=df[1][df[0X2]];s8=s8+0X1;s8=s8+1;xL=PH[s8];s8=s8+0x1;(o8)[0X8]=o8[8][xL[0X4]];xL=PH[s8];s8=s8+1;(o8)[0X008]=o8[0X8][xL[0x4]];do xL=PH[s8];end;do s8=s8+0X0001;end;do s8=xL[0X01];end;end;end;else(o8[7])[xL[5]]=o8[8];do xL=PH[s8];end;s8=s8+0X0001;o8[0X00008]=o8[0x006]==xL[4];xL=PH[s8];s8=s8+0X1;if not o8[0x8]then do s8=xL[1];end;end;end;else if KL~=0X28 then s8=xL[0X00001];else do if not(o8[xL[0x1]]<o8[xL[0X3]])then else s8=xL[6];end;end;end;end;end;end;end;else if KL>=0x3e then if KL>=0x0042 then if KL>=0X00044 then if KL<69 then local JH=nH[1];o8[8]=JH[0x1][JH[0X2]];do xL=PH[s8];end;s8=s8+1;do(o8)[0X8]=o8[0X008][xL[4]];end;s8=s8+1;do s8=s8+1;end;do xL=PH[s8];end;s8=s8+0X1;o8[8]=o8[0X008][xL[4]];do s8=s8+0x001;end;s8=s8+0X00001;xL=PH[s8];s8=s8+1;s8=xL[0x1];else if KL==0X46 then for kE=xL[6],xL[1]do o8[kE]=nil;end;else local P4=nH[0X00001];o8[8]=P4[1][P4[2]];s8=s8+1;s8=s8+0X1;xL=PH[s8];s8=s8+1;do(o8)[8]=o8[0X8][xL[4]];end;s8=s8+1;s8=s8+1;xL=PH[s8];s8=s8+1;(o8)[0X8]=o8[0X8][xL[0X4]];s8=s8+0X001;s8=s8+0X1;xL=PH[s8];s8=s8+1;s8=xL[1];end;end;else do if KL==0X043 then o8[0x5]=o8[0X4][xL[0X4]];s8=s8+1;s8=s8+1;do xL=PH[s8];end;do s8=s8+1;end;if not(not o8[0X5])then else do s8=xL[1];end;end;else local yC=(nH[0X1]);(o8)[0x8]=yC[1][yC[0X0002]];s8=s8+0X1;do s8=s8+1;end;xL=PH[s8];s8=s8+1;o8[8]=o8[0X8][xL[0X4]];xL=PH[s8];s8=s8+1;o8[0X0008]=o8[0x8][xL[4]];xL=PH[s8];s8=s8+0x0001;s8=xL[0X1];end;end;end;else if not(KL>=0X40)then if KL==0X3f then local DA=(nH[0x01]);(o8)[8]=DA[0X001][DA[2]];s8=s8+1;s8=s8+0X1;xL=PH[s8];s8=s8+1;(o8)[0x8]=o8[8][xL[4]];xL=PH[s8];s8=s8+0X1;o8[0X8]=o8[8][xL[4]];s8=s8+1;s8=s8+0X1;xL=PH[s8];s8=s8+1;do s8=xL[1];end;else local Zp=nH[1];(o8)[0x6]=Zp[1][Zp[2]];s8=s8+1;s8=s8+1;xL=PH[s8];s8=s8+1;o8[6]=o8[6][xL[0x00004]];do s8=s8+0X1;end;s8=s8+1;do xL=PH[s8];end;do s8=s8+1;end;do o8[6]=o8[0X006][xL[4]];end;xL=PH[s8];do s8=s8+1;end;do s8=xL[0x0001];end;end;else do if KL==0x41 then do o8[0X7][xL[5]]=o8[8];end;xL=PH[s8];s8=s8+0X001;o8[8]=o8[0X0006]==xL[4];do xL=PH[s8];end;s8=s8+0X001;if not(not o8[0X8])then else do s8=xL[0x1];end;end;else if o8[xL[1]]<=o8[xL[3]]then s8=xL[6];end;end;end;end;end;else if not(KL<57)then do if not(KL<59)then if not(KL>=0X03C)then(o8)[xL[0X6]]=o8[xL[0X1]][xL[4]];else do if KL==0X03d then local H2=nH[0X00002];(o8)[0X00005]=H2[0x1][H2[2]];do xL=PH[s8];end;s8=s8+0X00001;o8[5]=o8[0x05][xL[0X4]];do s8=s8+1;end;s8=s8+0X0001;xL=PH[s8];s8=s8+0X1;do o8[5]=o8[5][xL[4]];end;do s8=s8+1;end;s8=s8+1;xL=PH[s8];s8=s8+1;(o8)[0X0005]=o8[0X5][xL[0X004]];xL=PH[s8];s8=s8+1;o8[0x00006]=o8[0X4][xL[0x00004]];s8=s8+0X1;s8=s8+0x00001;s8=s8+0X1;Q8=6;(o8)[Q8]=o8[Q8]();xL=PH[s8];s8=s8+0X1;if not o8[6]then s8=xL[0X1];end;else local xZ=nH[1];o8[0x8]=xZ[1][xZ[2]];xL=PH[s8];s8=s8+0X1;(o8)[0X008]=o8[8][xL[0X04]];do s8=s8+0X1;end;s8=s8+1;do xL=PH[s8];end;do s8=s8+1;end;do(o8)[8]=o8[8][xL[0X4]];end;xL=PH[s8];s8=s8+1;s8=xL[0X1];end;end;end;else do if KL==0X3A then if o8[xL[0X1]]==xL[4]then s8=xL[6];end;else(o8[7])[xL[5]]=o8[0X008];xL=PH[s8];s8=s8+1;o8[8]=o8[6]==xL[0x4];xL=PH[s8];s8=s8+0X01;if not o8[8]then s8=xL[0X1];end;end;end;end;end;else if not(KL<0X37)then if KL==0X38 then local A0=(xL[6]);local J0=v(function(...)(E)();do for so,Zo,ro,Ao,jo,ao,Bo,Xo,Oo,Wo in...do(E)(true,{so,Zo,ro,Ao,jo,ao,Bo,Xo,Oo,Wo});end;end;end);J0(o8[A0],o8[A0+1],o8[A0+2]);Q8=A0;(o8)[A0]=J0;s8=xL[0x0001];else local OA=(nH[0X00001]);(o8)[0X8]=OA[1][OA[0X00002]];xL=PH[s8];s8=s8+1;(o8)[8]=o8[0X8][xL[0x4]];s8=s8+1;do s8=s8+1;end;do xL=PH[s8];end;s8=s8+0x1;o8[0X8]=o8[0X008][xL[0x00004]];xL=PH[s8];s8=s8+0X1;s8=xL[1];end;else if KL~=0x36 then local na=(nH[0X1]);o8[8]=na[1][na[0X02]];s8=s8+0x1;s8=s8+1;xL=PH[s8];do s8=s8+1;end;(o8)[0X8]=o8[8][xL[0X4]];xL=PH[s8];s8=s8+1;o8[8]=o8[8][xL[4]];xL=PH[s8];do s8=s8+1;end;if not o8[0X08]then do s8=xL[1];end;end;else(o8[0X07])[xL[0X5]]=o8[0x8];local RR=(nH[1]);s8=s8+0X1;(o8)[8]=RR[1][RR[2]];xL=PH[s8];s8=s8+0X0001;(o8)[8]=o8[0X008][xL[4]];xL=PH[s8];s8=s8+1;o8[0X9]=v8[xL[0x5]];xL=PH[s8];s8=s8+1;(o8)[9]=o8[0X09][xL[0X04]];do s8=s8+0x001;end;do s8=s8+1;end;do xL=PH[s8];end;do s8=s8+1;end;o8[10]=o8[0X0][xL[0X4]];do xL=PH[s8];end;local eR=(0);s8=s8+0X1;o8[0Xb]=o8[0][xL[4]];do s8=s8+1;end;s8=s8+0x1;s8=s8+1;o8[11]=o8[11]-o8[0X00002];s8=s8+0X0001;do o8[11]=o8[11]-o8[1];end;s8=s8+0X1;local sR=(0X03);local PR=(9);if sR~=0X0 then Q8=PR+sR-1;end;local pR,kR=nil,nil;if sR~=0X0001 then pR,kR=yL(o8[PR](k(o8,PR+0X00001,Q8)));else pR,kR=yL(o8[PR]());end;do if eR~=1 then if eR~=0X00000 then pR=PR+eR-0x2;Q8=pR+1;else pR=pR+PR-0X01;Q8=pR;end;
local oI=0;for xx=PR,pR do oI=oI+1;do o8[xx]=kR[oI];end;end;else Q8=PR-1;end;end;do s8=s8+1;end;PR=0X00008;(o8)[PR]=o8[PR](k(o8,PR+1,Q8));Q8=PR;s8=s8+0X1;do s8=s8+1;end;do xL=PH[s8];end;s8=s8+1;o8[7][xL[0X5]]=o8[8];s8=s8+1;do RR=nH[0X0001];end;o8[0X8]=RR[1][RR[0X02]];s8=s8+0X1;s8=s8+1;xL=PH[s8];s8=s8+0X1;(o8)[0X8]=o8[0X008][xL[4]];s8=s8+1;s8=s8+1;do xL=PH[s8];end;s8=s8+0x001;o8[9]=v8[xL[5]];
do s8=s8+1;end;s8=s8+1;xL=PH[s8];s8=s8+1;do o8[0X9]=o8[9][xL[0X4]];end;xL=PH[s8];s8=s8+1;do(o8)[10]=o8[0][xL[4]];end;do s8=s8+0X01;end;do s8=s8+0x00001;end;xL=PH[s8];s8=s8+0X1;o8[0x00b]=o8[0X0][xL[0X4]];s8=s8+1;o8[0XB]=o8[11]-o8[0x2];s8=s8+0X00001;do PR=0x9;end;sR=0X3;eR=0X00;if sR~=0 then Q8=PR+sR-0X0001;end;pR,kR=nil;do if sR==0X1 then pR,kR=yL(o8[PR]());else do pR,kR=yL(o8[PR](k(o8,PR+1,Q8)));end;end;end;if eR~=1 then if eR==0 then do pR=pR+PR-0X1;end;Q8=pR;else pR=PR+eR-0X2;do Q8=pR+1;end;end;local i6=0;for P6=PR,pR do do i6=i6+1;end;o8[P6]=kR[i6];end;else Q8=PR-0x00001;end;
do s8=s8+0x1;end;PR=8;(o8)[PR]=o8[PR](k(o8,PR+1,Q8));do Q8=PR;end;s8=s8+0X1;s8=s8+1;do xL=PH[s8];end;do s8=s8+0X00001;end;(o8[0X7])[xL[5]]=o8[0X8];do xL=PH[s8];end;s8=s8+1;s8=xL[1];end;end;end;end;end;end;end;end;end);if not(T8)then if Z(W8)~='\115\116ri\110\103'then(Y)(W8,0x00);else if M(W8,'\097\116t\101\109\112t \116o yi\101l\100 ac\114\111\115s\032m\101ta\109\101th\111d/C\037\045cal\108 \098oun\100\097ry')then do return coroutine.yield();end;end;do if not(M(W8,'\094.\045:%\100\043\058\032'))then Y(W8,0x0);else(Y)('Lurap\104\032Sc\114ipt\058'..(yH[s8-0X0001]or"(internal)").."\058 "..F(W8),0);end;
end;
end;else do if W8 then if m8==1 then return o8[k8]();else return o8[k8](k(o8,k8+1,Q8));end;elseif k8 then do return k(o8,k8,m8);end;end;end;end;end;else do GH=function(...)local lo=1;local no=(I and I()or _ENV);local Xo,Mo=yL(...);local io,ao={},(0X0000);Xo=Xo-0X01;do for RT=0,Xo do do if not(LH>RT)then break;else(io)[RT]=Mo[RT+0x1];end;end;end;end;local uo=((no==d and iH or no));YL[4]=fH;(YL)[1]=io;if not pH then Mo=nil;
elseif lH then io[LH]={n=Xo>=LH and Xo-LH+1 or 0X0,k(Mo,LH+0x1,Xo+0X01)};end;do if uo==no then else if R then R(GH,uo);else _ENV=uo;end;end;end;local Io,ho,Po,oo=y(function()while true do local PR=PH[lo];local NR=PR[7];lo=lo+1;if not(NR>=54)then do if NR<0x1b then if not(NR<13)then if not(NR<20)then if not(NR>=23)then if not(NR<21)then do if NR~=0X16 then(io[PR[0X6]])[PR[0X5]]=io[PR[0X003]];else io[PR[0X6]]=true;end;end;else(io)[PR[0X6]]=PR[0X005]-io[PR[0x3]];end;else if NR>=25 then if NR~=26 then local mB=nH[PR[1]];
(mB[0X1])[mB[0X2]]=io[PR[0X6]];else(io)[PR[0X6]]=io[PR[0x1]]/PR[4];end;else if NR~=0X018 then local AR=(PR[6]);
local jR=(v(function(...)E();do for PX,GX,UX,rX,eX,cX,qX,lX,EX,dX in...do(E)(true,{PX,GX,UX,rX,eX,cX,qX,lX,EX,dX});end;end;end));(jR)(io[AR],io[AR+0X001],io[AR+0x0002]);ao=AR;
do io[AR]=jR;end;lo=PR[0X01];else do repeat local tq,dq=hH,io;do if#tq>0 then local i7=({});for Sr,Tr in c,tq do for cd,md in c,Tr do do if not(md[1]==dq and md[0x0002]>=0x0000)then else local Nj=(md[0x2]);do if not(not i7[Nj])then else i7[Nj]={dq[Nj]};end;end;do md[0x0001]=i7[Nj];end;md[2]=1;end;end;end;end;end;end;until true;end;return false,PR[6],ao;end;end;end;else if not(NR>=0X10)then if NR<14 then(io)[PR[0X6]]=u(io[PR[0X01]],io[PR[0X3]]);else do if NR==0X000F then(io)[PR[0X6]]=io[PR[0X00001]]-PR[4];else(io[PR[0x6]])[PR[0X05]]=PR[0x00004];end;end;end;else if NR<18 then do if NR==0x11 then do(io)[PR[0X6]]=PR[0X5];end;
else if not(not(io[PR[0x01]]<=PR[0x4]))then else do lo=PR[0X6];end;end;end;end;else do if NR==0X13 then if io[PR[1]]<io[PR[3]]then lo=PR[0X6];end;else do io[PR[0X06]]=io[PR[0X00001]]~=io[PR[0x3]];end;end;end;end;end;end;else if NR>=6 then if not(NR>=9)then if not(NR>=7)then do io[PR[6]]=io[PR[1]][io[PR[0x003]]];end;else if NR~=0x8 then do(io)[PR[0x6]]={};end;else(io)[PR[0X6]]=io[PR[0X1]]==PR[0x004];end;end;else do if not(NR>=0X000b)then do if NR==0Xa then do io[PR[6]]=io[PR[1]]>PR[4];end;else local sl=io[PR[0X00001]]/io[PR[3]];io[PR[0X6]]=sl-sl%0X1;end;end;else if NR~=12 then if PR[0X0003]==0xac then lo=lo-0X1;PH[lo]={[0X6]=(PR[6]-159),[0X1]=(PR[0X1]-159),[0X7]=75};elseif PR[3]==194 then lo=lo-0X001;PH[lo]={[0X6]=(PR[0x6]-0X43),[1]=(PR[1]-0X00043),[0x007]=80};else do if not io[PR[0X6]]then do lo=PR[0x001];end;end;end;end;else lo=PR[0X01];end;end;end;end;else if not(NR<3)then do if NR>=4 then do if NR==0X5 then local Eh=PR[0X6];ao=Eh+PR[1]-0X1;(io)[Eh]=io[Eh](k(io,Eh+0x1,ao));ao=Eh;else io[PR[6]]=io[PR[0X1]]~=PR[4];end;end;else(io)[PR[0X6]]=io[PR[1]]<PR[0x00004];end;end;else do if NR<0X1 then local DC=(PR[6]);do(io)[DC]=io[DC](k(io,DC+1,ao));end;do ao=DC;end;else if NR==0x2 then local UH=PR[6];local QH,vH=io[UH]();if QH then(io)[UH+1]=vH;lo=PR[0X1];end;else local hi=PR[0x006];local Mi=(PR[3]-1)*50;local ni=(io[hi]);for Di=1,PR[1]do ni[Mi+Di]=io[hi+Di];end;end;end;end;end;end;end;else if NR<0X00028 then if NR<0X21 then if not(NR<0X001e)then if NR>=0X1F then if NR==32 then local jd,vd=PR[0X6],PR[1];local od=PR[0X003];if vd==0 then else ao=jd+vd-0X01;end;local Md,sd=nil,nil;if vd==1 then Md,sd=yL(io[jd]());else Md,sd=yL(io[jd](k(io,jd+0x1,ao)));end;if od==1 then ao=jd-1;else if od==0 then do Md=Md+jd-0X1;end;ao=Md;else do Md=jd+od-2;end;ao=Md+1;end;local cI=0;do for SN=jd,Md do cI=cI+0X1;io[SN]=sd[cI];end;end;end;
else if io[PR[1]]~=PR[4]then lo=PR[0X6];end;
end;else io[PR[6]]=p(io[PR[1]]);end;else if not(NR>=28)then do if not(PR[0X0005]<io[PR[3]])then lo=PR[0x6];end;end;else if NR==29 then if PR[3]==0Xa7 then lo=lo-0X1;PH[lo]={[0X1]=(PR[0X01]-0X68),[7]=108,[0X6]=(PR[0X6]-104)};else local fQ,VQ=PR[0x06],Xo-LH;do if VQ<0X0 then VQ=-0X1;end;end;do for Hw=fQ,fQ+VQ do io[Hw]=Mo[LH+(Hw-fQ)+1];end;end;ao=fQ+VQ;end;else local YP=(PR[0X6]);local yP,tP=io[YP]();do if not(yP)then else for B6=0x1,PR[3]do(io)[YP+B6]=tP[B6];end;do lo=PR[1];end;end;end;end;end;end;else if not(NR<36)then do if NR>=38 then do if NR~=0X0027 then local ZK,UK=PR[6],(io[PR[0x1]]);(io)[ZK+1]=UK;io[ZK]=UK[PR[4]];else if not(PR[5]<=io[PR[3]])then do lo=PR[0X6];end;end;end;end;else if NR~=37 then(io)[PR[6]]=io[PR[0X00001]]<=PR[0x00004];else repeat local P0,A0=hH,(io);do if not(#P0>0)then else local eO={};for BL,wL in c,P0 do for TF,aF in c,wL do do if not(aF[1]==A0 and aF[2]>=0x0)then else local o6=(aF[0x02]);do if not(not eO[o6])then else do(eO)[o6]={A0[o6]};end;end;end;(aF)[0X1]=eO[o6];aF[0x00002]=0X0001;end;
end;end;end;end;end;until true;return;end;end;end;else if not(NR>=34)then(io)[PR[0X6]]=io[PR[0X1]]<io[PR[0X3]];
else if NR~=0x00023 then do repeat local Mj,vj=hH,io;if not(#Mj>0)then else local Ti={};for jn,nn in c,Mj do do for uZ,tZ in c,nn do if tZ[0X0001]==vj and tZ[0X2]>=0 then local rI=(tZ[0X2]);if not Ti[rI]then(Ti)[rI]={vj[rI]};end;(tZ)[0X1]=Ti[rI];(tZ)[2]=1;end;end;end;end;end;until true;end;do return true,PR[0X0006],0;end;else do if not(io[PR[0X1]]<=io[PR[3]])then lo=PR[6];end;end;end;end;end;end;else if NR<0x2F then if NR>=43 then if not(NR>=0X0002D)then if NR~=0X00002C then io[PR[0X6]]=io[PR[0X0001]]/io[PR[0X3]];else local zW=(PR[6]);local eW,lW=io[zW]();do if eW then do lo=PR[1];end;(io)[zW+0X0003]=lW;end;end;end;else if NR~=0x2e then io[PR[6]]=PR[5]*io[PR[3]];else if PR[0X3]==156 then lo=lo-1;PH[lo]={[1]=(PR[1]-0X75),[0x007]=102,[0X6]=(PR[0X00006]-117)};else repeat local nE,PE=hH,(io);do if not(#nE>0x0)then else local AE=({});for rl,Ll in c,nE do for R4,N4 in c,Ll do if N4[0X1]==PE and N4[0X2]>=0 then local WP=(N4[0X2]);if not(not AE[WP])then else AE[WP]={PE[WP]};end;(N4)[0X0001]=AE[WP];(N4)[0x2]=0X0001;end;end;end;end;end;until true;local ep=(PR[6]);return false,ep,ep;end;end;end;else if not(NR>=0X29)then do(io[PR[6]])[io[PR[0X00001]]]=PR[0X00004];end;else if NR~=0x2A then ao=PR[6];do io[ao]=io[ao]();end;else(io)[PR[0X00006]]=C(io[PR[1]],io[PR[0X03]]);end;end;end;else if NR>=50 then do if not(NR>=52)then do if NR==51 then if io[PR[1]]==io[PR[0X3]]then lo=PR[6];end;else local xR=(PR[0X6]);local VR=v(function(...)(E)();for Bd in...do(E)(true,Bd);end;end);(VR)(io[xR],io[xR+1],io[xR+0X2]);ao=xR;io[xR]=VR;do lo=PR[0X01];end;end;end;else if NR==53 then if PR[3]==0x008a then lo=lo-0X1;PH[lo]={[1]=(PR[1]-41),[0x6]=(PR[0X6]-41),[7]=0X18};elseif PR[3]==83 then lo=lo-1;(PH)[lo]={[0x001]=(PR[1]-0XF9),[0x7]=24,[6]=(PR[6]-0x0f9)};else(io)[PR[6]]=#io[PR[1]];end;else do repeat local op,hp=hH,(io);do if not(#op>0)then else local If=({});for SW,dW in c,op do do for My,oy in c,dW do do if oy[1]==hp and oy[2]>=0X0 then local An=oy[0X2];if not If[An]then(If)[An]={hp[An]};end;do oy[0X1]=If[An];end;(oy)[2]=1;end;end;end;end;end;end;end;until true;end;local De=PR[6];ao=De+0X1;return true,De,0X002;end;end;end;else do if NR>=0X000030 then if NR==0x31 then if io[PR[1]]~=PR[4]then else lo=PR[6];end;else local H5=(PR[0x1]);(io)[PR[6]]=io[H5]..io[H5+0X1];end;else local bN=(SH[PR[1]]);local SN=(nil);local rN=bN[5];local NN=#rN;if not(NN>0)then else SN={};for DG=0X001,NN do local XG=rN[DG];if XG[1]==0 then SN[DG-0X1]={io,XG[2]};else(SN)[DG-0X1]=nH[XG[0X2]];end;end;U(hH,SN);end;(io)[PR[0X00006]]=GL(uo,bN,SN);end;end;end;end;end;end;end;else if NR>=81 then if not(NR<0X5f)then if NR>=102 then if not(NR>=105)then if NR<103 then if PR[3]==62 then lo=lo-0X1;(PH)[lo]={[7]=0X000035,[6]=(PR[0x00006]-0X72),[1]=(PR[1]-0X072)};elseif PR[3]~=121 then io[PR[0x6]]=io[PR[1]];else lo=lo-0X1;do PH[lo]={[6]=(PR[0X6]-0x088),[7]=53,[0X0001]=(PR[1]-0X88)};end;end;else if NR==104 then(io)[PR[6]]=false;else local bo=PR[6];io[bo](io[bo+0X0001],io[bo+2]);do ao=bo-1;end;end;end;else if NR<107 then if NR==106 then do if not(io[PR[1]]<io[PR[0X0003]])then lo=PR[0x00006];end;end;else(io)[PR[0x6]]=io[PR[1]]>io[PR[3]];end;else if NR~=0X06C then(io)[PR[6]]=PR[5]+io[PR[0x0003]];else if PR[3]~=134 then repeat local t1,y1=hH,(io);if not(#t1>0X00)then else local YC={};for zz,vz in c,t1 do for T9,V9 in c,vz do if V9[1]==y1 and V9[0X002]>=0X0 then local UK=(V9[2]);if not YC[UK]then YC[UK]={y1[UK]};end;V9[1]=YC[UK];V9[2]=1;end;end;end;end;until true;local Y9=PR[6];do return false,Y9,Y9+PR[1]-0X02;end;else lo=lo-1;PH[lo]={[6]=(PR[6]-47),[7]=90,[0X1]=(PR[0X1]-47)};end;end;end;end;else if NR>=0x062 then if NR<100 then if NR~=99 then local u4=PR[6];(io[u4])(k(io,u4+1,ao));ao=u4-1;else if PR[0X00003]==63 then do lo=lo-1;end;(PH)[lo]={[7]=0x066,[1]=(PR[1]-60),[6]=(PR[0X6]-60)};else if not(io[PR[0X6]])then else lo=PR[1];end;end;end;else if NR~=101 then do(io)[PR[0X6]]=PR[5];end;else if io[PR[1]]==io[PR[0x3]]then else lo=PR[0x6];end;end;end;else if not(NR>=0X0060)then io[PR[6]]=PR[5];else if NR~=97 then io[PR[0X6]]=io[PR[1]]>=io[PR[3]];else local Yw=PR[6];local Xw,Cw=io[Yw+1],(io[Yw+2]);local Lw=(io[Yw]);(io)[Yw]=v(function()for ia=Lw,Xw,Cw do(E)(true,ia);end;end);lo=PR[1];end;end;end;end;else if not(NR>=0X58)then do if not(NR<0x54)then if NR>=0x56 then if NR~=0X57 then(io)[PR[6]]=PR[5]/PR[0X00004];else do(io)[PR[6]]=io[PR[0X00001]]+PR[4];end;end;else do if NR~=0X55 then local ad,Vd=PR[6],PR[1];ao=ad+Vd-0X01;repeat local BL,CL=hH,(io);do if not(#BL>0)then else local lS=({});for dd,yd in c,BL do for Qd,Zd in c,yd do if not(Zd[1]==CL and Zd[2]>=0)then else local RG=Zd[2];do if not(not lS[RG])then else do(lS)[RG]={CL[RG]};end;end;end;Zd[1]=lS[RG];do Zd[0X2]=0X1;end;end;end;end;end;end;until true;return true,ad,Vd;else local RM=(PR[6]);local fM,UM,lM=io[RM]();if not(fM)then else(io)[RM+1]=UM;(io)[RM+2]=lM;lo=PR[0X1];end;end;end;end;else if NR<0X00052 then local fD=PR[6];for iu=fD,fD+(PR[1]-1)do io[iu]=Mo[LH+(iu-fD)+1];end;else if NR~=0X53 then(io)[PR[6]]=io[PR[0X1]]^io[PR[3]];else(io)[PR[0X6]]=io[PR[1]]<=io[PR[0x03]];end;end;end;end;else if not(NR>=0X00005b)then if NR>=89 then do if NR==90 then if PR[3]==215 then lo=lo-1;(PH)[lo]={[0x7]=53,[6]=(PR[0X00006]-162),[0x1]=(PR[1]-0Xa2)};elseif PR[0x3]==0XA4 then lo=lo-0X1;PH[lo]={[7]=46,[0X0001]=(PR[0X1]-0XA),[0X006]=(PR[0X6]-0xA)};elseif PR[3]==85 then lo=lo-0X1;do(PH)[lo]={[0X6]=(PR[0X6]-241),[0X1]=(PR[1]-241),[7]=0X00025};end;else(io)[PR[0X06]]=not io[PR[1]];end;else(io)[PR[6]]=io[PR[0X1]]*PR[0X004];end;end;else local ta=PR[0X0006];
(io[ta])(io[ta+1]);ao=ta-1;end;else if NR>=0X5D then if NR~=0X5e then do(io)[PR[6]]=YL[PR[1]];end;else(io)[PR[6]]=io[PR[1]][PR[4]];end;else if NR~=0x5c then ao=PR[0x06];io[ao]();do ao=ao-1;end;else io[PR[0X6]]=io[PR[0X1]]%io[PR[3]];end;end;end;end;end;else if NR<0x043 then if not(NR<0x0003C)then do if NR>=0X3f then if not(NR<0X41)then do if NR==66 then io[PR[0x006]]=m(io[PR[0X00001]],io[PR[3]]);else if PR[0x0003]==0X21 then do lo=lo-0X1;end;(PH)[lo]={[6]=(PR[6]-104),[0x7]=0X5a,[1]=(PR[0x1]-0X68)};elseif PR[3]==0xf then lo=lo-1;do(PH)[lo]={[6]=(PR[6]-0X5B),[0X1]=(PR[1]-0X5B),[7]=0x4B};end;else io[PR[0X006]]=nil;end;end;end;else do if NR==64 then local Xm=PR[1];local lm=(io[Xm]);for Ow=Xm+0X1,PR[3]do lm=lm..io[Ow];end;io[PR[6]]=lm;else io[PR[0X006]]=j(io[PR[1]],io[PR[0X3]]);end;end;end;else if NR>=61 then if NR==62 then local ZP=PR[0X06];local MP=(v(function(...)E();for ru,Mu in...do E(true,ru,Mu);end;end));(MP)(io[ZP],io[ZP+1],io[ZP+0X2]);ao=ZP;do(io)[ZP]=MP;end;lo=PR[1];else io[PR[6]]=PR[5]/io[PR[0X3]];end;else local fl=(PR[0X00006]);io[fl]=io[fl](io[fl+1],io[fl+2]);ao=fl;end;end;end;else if NR>=0x39 then if not(NR<58)then if NR~=59 then io[PR[0X6]]=io[PR[1]]%PR[4];else local tG=PR[0X6];do(io)[tG]=io[tG](io[tG+0X1]);end;ao=tG;end;else(io[PR[0X6]])[io[PR[0X1]]]=io[PR[3]];end;else if NR>=0X00037 then if NR~=56 then do(io)[PR[6]]=io[PR[0X01]]*io[PR[3]];end;else if io[PR[0X1]]<=io[PR[3]]then lo=PR[0X00006];end;end;else io[PR[0X6]]=w(io[PR[1]],io[PR[3]]);end;end;end;else if not(NR<74)then if NR>=0x4D then do if NR<79 then if NR~=78 then local I5=(PR[6]);ao=I5+PR[0x01]-1;io[I5](k(io,I5+1,ao));ao=I5-0X1;else YL[PR[1]]=io[PR[6]];end;else if NR~=0x000050 then io[PR[6]]=io[PR[0X1]]+io[PR[3]];else do if PR[3]==0x000094 then do lo=lo-1;end;do PH[lo]={[0x07]=0X4C,[0X6]=(PR[6]-184),[0X00001]=(PR[1]-184)};end;else for tV=PR[0X006],PR[1]do io[tV]=nil;end;end;end;end;end;end;else if NR<75 then(uo)[PR[0X0005]]=io[PR[6]];else if NR==0X4C then repeat local JT,lT,tT=hH,io,PR[6];do if not(#JT>0)then else local No={};for db,kb in c,JT do do for va,fa in c,kb do if not(fa[1]==lT and fa[0X00002]>=tT)then else local D9=fa[2];if not(not No[D9])then else do(No)[D9]={lT[D9]};end;end;fa[1]=No[D9];fa[0x2]=0X1;end;end;end;end;end;end;until true;else if PR[0X3]==0X0071 then lo=lo-0X1;(PH)[lo]={[7]=29,[6]=(PR[6]-0X87),[1]=(PR[0X1]-0X87)};elseif PR[3]==0X06B then lo=lo-0X001;do PH[lo]={[1]=(PR[1]-0x2B),[0X7]=80,[0X006]=(PR[6]-0X2B)};end;elseif PR[0X0003]==0X016 then do lo=lo-0X0001;end;do(PH)[lo]={[7]=29,[0x1]=(PR[0X001]-101),[6]=(PR[0X0006]-0X0065)};end;elseif PR[0x3]~=0X78 then(io)[PR[6]]=-io[PR[1]];else lo=lo-0X001;PH[lo]={[6]=(PR[0X6]-80),[0X7]=0X041,[1]=(PR[0X1]-0X50)};end;end;end;end;else if not(NR>=70)then if not(NR<68)then do if NR==0x000045 then(io)[PR[0X6]]=uo[PR[5]];else do repeat local Iz,Jz=hH,(io);do if not(#Iz>0X0)then else local AW={};do for N3,v3 in c,Iz do for sn,xn in c,v3 do if not(xn[0X1]==Jz and xn[0X02]>=0)then else local mu=(xn[0X2]);do if not(not AW[mu])then else AW[mu]={Jz[mu]};end;end;(xn)[0X1]=AW[mu];(xn)[0X02]=0X1;end;end;end;end;end;end;until true;end;return true,PR[0X6],1;end;end;else io[PR[6]]=io[PR[1]]-io[PR[0x3]];end;else if NR>=0X048 then if NR==0X49 then(io)[PR[0X6]]={k({},1,PR[1])};else(io)[PR[6]]=io[PR[1]]==io[PR[0x003]];end;else do if NR~=71 then local Oo=nH[PR[1]];io[PR[6]]=Oo[0x00001][Oo[2]];else local GM=(PR[6]);local tM=((PR[0X00003]-0X01)*0x32);local nM=io[GM];for ew=1,ao-GM do nM[tM+ew]=io[GM+ew];end;end;end;end;end;end;end;end;end;end;end);do if not(Io)then if Z(ho)=='\115tr\105ng'then if not(M(ho,'\097tt\101\109p\116\032t\111 yi\101l\100\032ac\114\111s\115 \109\101ta\109\101\116\104\111\100\047C\037-\099\097l\108 bou\110da\114\121'))then else return coroutine.yield();end;if not(M(ho,'\094\046-\058\037\100\043\058\032'))then Y(ho,0X0);else(Y)("\076\117ra\112h S\099\114\105pt:"..(yH[lo-0X1]or"(internal)")..": "..F(ho),0X0);end;else Y(ho,0X0);end;else if ho then if oo==0X01 then return io[Po]();else return io[Po](k(io,Po+1,ao));end;elseif not(Po)then else return k(io,Po,oo);end;end;end;end;end;end;end;if R then(R)(GH,iH);end;return GH;end;pL=1;local sL,lL=nil,(nil);do while pL<0X2 do if pL==0 then lL=sL();pL=2;else function sL()local P_,h_,M_=nil,nil,nil;for dV=0,3 do do if not(dV<=0X1)then do if dV==0X0002 then do h_={};end;else do M_={{},nil,{},iL,nil,{},iL,iL,nil};end;end;end;else do if dV==0 then else P_={};end;end;end;end;end;local J_,u_=nil,(nil);local i_=0X0;while i_~=2 do if i_~=0 then u_=0X1;i_=0x0002;else J_={};i_=0X01;end;end;(M_)[0x2]=x();(M_)[4]=x();(M_)[17]=D();i_=0;while i_~=0X2 do if i_~=0 then M_[0x00005]=h_;i_=0X2;else M_[8]=x();i_=0X1;end;end;local K_=M_[1];i_=1;local k_=nil;while i_<0X00002 do if i_~=0 then for xV=0X1,x()do do h_[xV]={A(),x()};end;end;do i_=0x00;end;else k_=D()-XL;do i_=2;end;end;end;i_=0;local a_=(nil);do while 1811025851 do if not(i_<=0X0)then if i_==0X1 then for Pr=vL,a_ do local Jr,mr,nr=nil,nil,nil;for U7=0X0,0X003 do if not(U7<=1)then if U7==0X2 then do nr=D();end;else do for zb=Jr,mr do(M_[0X03])[zb]=nr;end;end;end;else do if U7~=0 then mr=D();else Jr=D();end;end;end;end;end;break;else a_=D();i_=1;end;else do for eY=0X0,k_-1 do(K_)[eY]=sL();end;end;do i_=2;end;end;end;end;(M_)[0X11]=A();local j_=(D()-uL);local S_=A();local r_=A()~=0;do i_=0X02;end;local t_,b_=nil,nil;repeat if i_<=0x001 then if i_~=0 then b_=D()-79391;i_=0X00005;else M_[7]=P(t_,1,0X1)~=0;i_=0X3;end;else if not(i_<=2)then if i_~=0X0003 then do t_=A();end;i_=0;else(M_)[9]=P(t_,0x00002,1)~=0X0;
do i_=0x1;end;end;else for tZ=vL,j_ do local aZ=(nil);local WZ,vZ=nil,(nil);for DD=0,0X3 do if not(DD<=1)then if DD==0X2 then do if WZ==252 then do aZ=G(SL(S_),D());end;elseif WZ==0Xcd then aZ=a();elseif WZ==99 then do aZ=G(SL(S_),20);end;elseif WZ==95 then do aZ=D();end;elseif WZ==0X54 then aZ=false;elseif WZ==148 then aZ=G(SL(S_),A());
elseif WZ==0XA3 then aZ=H();elseif WZ==0xf then aZ=H();elseif WZ==jL then aZ=H()+D();elseif WZ==0X89 then do aZ=mL;end;elseif WZ~=0xa6 then else do aZ=G(SL(S_),5);end;end;end;else do vZ={aZ,{}};
end;end;elseif DD==0X00000 then WZ=A();else P_[tZ-0x1]=u_;end;end;local PZ=(1);while PZ~=3 do if not(PZ<=0X0)then if PZ==1 then J_[u_]=vZ;PZ=2;else do u_=u_+0x1;end;PZ=0x0;
end;else if not(r_)then else(ZL)[FL]=vZ;FL=FL+0x1;end;do PZ=0x3;end;end;end;end;i_=4;end;end;until i_==0x5;local c_=(M_[6]);for ZA=0X00,0X02 do if not(ZA<=0X0)then do if ZA==1 then do for yV=1,b_ do local JV,XV=1,(nil);
while JV~=2 do if JV~=0 then XV=M_[kL][yV];do JV=0x0;end;else for I2,C2 in ipairs(W)do local u2,U2=nil,(nil);do for kT=0X0,0X0002 do do if not(kT<=0)then 
if kT~=0X001 then do if U2==4 then local nU=1;local IU,VU=nil,nil;while 175767381 do do if nU<=0 then VU=J_[IU];nU=0X02;else if nU==0X0001 then IU=P_[XV[C2]];do nU=0;end;else if VU then local tF=nil;for Ky=0x000,2 do if Ky<=0 then do(XV)[u2]=VU[0X01];end;else do if Ky~=0X01 then do tF[#tF+1]={XV,u2};end;else tF=VU[2];end;end;end;end;end;break;end;end;end;end;else if U2==3 then XV[C2]=yV+XV[C2]+0X1;end;end;end;else U2=XV[u2];end;else u2=o[C2];end;end;end;end;end;JV=0X2;end;end;end;end;else return M_;end;end;else for Mu=1,b_ do c_[Mu]={[0X3]=K(),[5]=A(),[1]=K(),[kL]=K(),[7]=x(),[4]=A(),[2]=A()};
end;
end;
end;end;do pL=0X0;
end;end;end;end;pL=1;do repeat if not(pL<=0)then if pL==1 then(YL)[0X3]=ZL;do pL=0X0000;
end;else do return GL(d,lL,nil)(...);end;end;else ZL=iL;pL=2;end;until false;end;end)(nil,"b\120\111\114",string.byte,0x1000000,5,coroutine,0X3,0X07,14,0X0010,1,table,0X0fe,0X0,"\108\115\104if\116",string.sub,type,getfenv,0xc,string,rawset,6,coroutine.yield,"\098a\110\100",9,string.gsub,0x07EA2,select,0X0000111E9,2,true,0x8,bit,bit32,...);