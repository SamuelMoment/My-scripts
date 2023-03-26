local nm = require(game.ReplicatedStorage.Framework.Nevermore)
local lt = rawget(nm, '_lookupTable')
local m = require(rawget(lt, 'RangedWeaponClient'))
local old = getgenv().hok

local gotweapon = false
local func;func = hookfunction(m.constructor,function(...)
    gotweapon = true
    if not (gotweapon and checkcaller()) then
        local ind = 1
        print(({...})[2])
        while true do
            if not getinfo(ind) or ind >= 10 then print('------------') break end
            local name = getinfo(ind).name
            if name ~= '' then
                print(ind,name)
            end
            ind += 1
            task.wait()
        end
    end
    gotweapon = false
    return getgenv().hok(...)
end)
if not old then getgenv().hok = func end