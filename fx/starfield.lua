Starfield = {}


function Starfield:init()
    for i = 1, 50
    do
        local s = self:get_random_star(true)
        table.insert(Starfield, s)
    end
end

function Starfield:update(dt)
    for i, s in ipairs(Starfield)
    do
        Starfield[i].y = Starfield[i].y + Starfield[i].magnitude
        if Starfield[i].y > 800 then
            Starfield[i] = self:get_random_star(false)
        end
    end
end

function Starfield:draw()
    local pr,pg,pb,pa = love.graphics.getColor()
    for i, s in ipairs(Starfield)
    do
        print(s.x, s.y, s.magnitude)
        if s.magnitude == 1 then
            love.graphics.setColor(128, 128, 128)
            love.graphics.points(s.x, s.y)
        elseif s.magnitude == 2 then
            love.graphics.setColor(200, 200, 200)
            love.graphics.points(s.x, s.y)
        else
            love.graphics.setColor(200, 200, 200)
            love.graphics.points({s.x, s.y, s.x+1, s.y, s.x, s.y+1, s.x+1, s.y+1})
        end
    end
    love.graphics.setColor(pr,pg,pb,pa)
end

function Starfield:get_random_star(visible)
    local star = {}
    star.x = math.random(50, 1230)
    if visible then
        star.y = math.random(1, 800)
    else
        star.y = -50
    end
    star.magnitude = math.random(1, 3)
    return(star)
end