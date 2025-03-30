Physics = {}


function Physics:init()
    Physics.world = love.physics.newWorld(0, 0)
    Physics.world:setCallbacks(beginContact, endContact, preSolve, postSolve)
end

function beginContact(a, b, coll)
    local textA = a:getUserData()
	local textB = b:getUserData()
    --print("beginContact", textA, textB, coll)
end

function endContact(a, b, coll)
    --print("endContact", a, b, coll)
end

function preSolve(a, b, coll)
    --print("preSolve", a, b, coll)
end

function postSolve(a, b, coll, normalimpulse, tangentimpulse)
    --print("postSolve", a, b, coll)
end

return Physics