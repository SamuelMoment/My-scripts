local BeforeLoad = tick()
local library,Signal = loadstring(game:HttpGet('https://raw.githubusercontent.com/SamuelMoment/My-scripts/main/libraryV2.lua'))()

library:init()
local Tabs = {
    Rage = library:Tab('Rage'),
    Legit = library:Tab('Legit'),
    Visuals = library:Tab('Visual'),
    Misc = library:Tab('Misc')
}










library:LoadSettingsTab()