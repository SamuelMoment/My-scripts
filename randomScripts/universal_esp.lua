local settings = {
   
   fillcolor = Color3.fromRGB(255, 255, 255);
   filltransparency = .75;
   
   outlinecolor = Color3.fromRGB(255, 255, 255);
   outlinetransparency = 0;
   
}

-- Script --

local plr = game:service'Players'.LocalPlayer
local highlights = Instance.new('Folder', game:service'CoreGui')

local function addhighlight(object)
   local highlight = Instance.new('Highlight', highlights)
   highlight.Adornee = object
   
   highlight.FillColor = settings.fillcolor
   highlight.FillTransparency = settings.filltransparency
   
   highlight.OutlineColor = settings.outlinecolor
   highlight.OutlineTransparency = settings.outlinetransparency
   
   highlight.Adornee.Changed:Connect(function()
       if not highlight.Adornee or not highlight.Adornee.Parent then
           highlight:Destroy()    
       end
   end)
   
   return highlight
end

local function addtoplayer(object)
   if object:IsA'Model' then
       addhighlight(object)
   end
end
for i,v in pairs(game.Players:GetPlayers()) do
	if v.Character then
		addtoplayer(v.Character)
	end
	v.CharacterAdded:Connect(function(sex)
		addtoplayer(sex)
	end)
end
game.Players.PlayerAdded:Connect(function(sex)
	sex.CharacterAdded:Connect(function(sex2)
		addtoplayer(sex2)
	end)
end)
