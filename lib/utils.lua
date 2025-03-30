function Hash(obj)
    -- Returns a hash for the object
    
end

function Table_has(a, value)
    return type(a[value])~='nil'
end

function Get_random_number(vmin, vmax)
    return math.random(vmin,vmax)
end

function InitLibs()
    math.randomseed(os.time())
end
