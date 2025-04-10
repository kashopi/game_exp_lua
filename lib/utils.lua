function InitLibs()
    math.randomseed(os.time())
end

function Hash(obj)
    -- Returns a hash for the object
    
end

function Table_has(a, value)
    return type(a[value])~='nil'
end

function Get_random_number(vmin, vmax)
    return math.random(vmin,vmax)
end

function Get_random_hash()
    local h = 5381
    return Hash(tostring(Get_random_number(0, 9999999999)))
end

function Hash(str)
    local h = 5381

    for i = 1, #str do
       h = h*32 + h + str:byte(i)
    end
    return h
end
