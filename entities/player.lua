Player = {}


local function normalize_speed_vector(dx, dy)
end

function Player:init()
    Player.x = 400
    Player.y = 750
    Player.w = 40
    Player.h = 40
    Player.speed_x = 300
    Player.speed_y = 300
    Player.is_taking_damage = false
    Player.pbody = love.physics.newBody(Physics.world, Player.x, Player.y, "dynamic")
    Player.pshape = love.physics.newRectangleShape(Player.w/2, Player.h/2, Player.w, Player.h)
    Player.pfixture = love.physics.newFixture(Player.pbody, Player.pshape)
    Player.pbody:setFixedRotation(true)
end


function Player:update(dt)
    local dx, dy = 0, 0
    if Joystick then
        dx, dy = Joystick:getAxes()
    else
        if love.keyboard.isDown("up") then dy = -1 end
        if love.keyboard.isDown("down") then dy = 1 end
        if love.keyboard.isDown("left") then dx = -1 end
        if love.keyboard.isDown("right") then dx = 1 end
    end

    if dx~=0 or dy~=0 then
        if dx~=0 and dy~=0 then
            dx = dx * 0.7071
            dy = dy * 0.7071
        end
        local sx = dx * self.speed_x -- * dt
        local sy = dy * self.speed_y -- * dt
        --print(sx, sy)
        self.pbody:setLinearVelocity(sx, sy)
    else
        self.pbody:setLinearVelocity(0, 0)
    end
    self:update_position()
end

function Player:update_position()
        self.x, self.y = self.pbody:getPosition()
end

function Player:draw()
    if Player.is_taking_damage then
        love.graphics.rectangle("fill", Player.x+10, Player.y+10, 20, 20)
        Player.is_taking_damage = false
    else
        love.graphics.rectangle("fill", Player.x, Player.y, Player.w, Player.h)
    end
    --print("Player: ", Player.x, Player.y)
end

function Player:take_damage()
    Player.is_taking_damage = true
end

return Player