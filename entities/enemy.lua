Enemies = {}

function Enemies:draw()
    --local color_to_restore = love.graphics.getColor()
    for i, v in ipairs(Enemies) do
        love.graphics.circle("fill", v.x, v.y, v.r)
    end
    --love.graphics.setColor(color_to_restore)
end

function Enemies:update(dt)
    add_enemies()
    move_enemies()
end

function move_enemies()
    local to_be_removed = {}
    for i, v in ipairs(Enemies) do
        Enemies[i].x, Enemies[i].y = Enemies[i].pbody:getPosition()
        if Enemies[i].y > SCREEN_HEIGHT or Enemies[i].y < -50 or Enemies[i].x > SCREEN_WIDTH or Enemies[i].x < -50 then
            table.insert(to_be_removed, i)
        end
    end
    for i, v in ipairs(to_be_removed) do
        Enemies[v].pbody:destroy()
        table.remove(Enemies, v)
    end
    -- print("Enemies # %d", #Enemies)
end

function add_enemies()
    if math.random(100) > 99 then
        table.insert(Enemies, get_new_enemy())
    end
end

function get_new_enemy()
    local rx = math.random(1,SCREEN_WIDTH-50)
    local ry = math.random(-10, -15)
    local rs = math.random(100, 200)
    local rr = math.random(8, 15)
    local rm = rr*2
    local enemy = {x=rx, y=ry, health=100, s=rs, r=rr, m=rm}
    enemy.w = rr*2
    enemy.h = rr*2
    enemy.pbody=love.physics.newBody(Physics.world, enemy.x, enemy.y, "dynamic")
    enemy.pshape=love.physics.newRectangleShape(enemy.w/2, enemy.h/2, enemy.w, enemy.h)
    enemy.pfixture=love.physics.newFixture(enemy.pbody, enemy.pshape)
    local userdata = {}
    userdata.type = 'kill_enemy'
    userdata.object = enemy
    enemy.pfixture:setUserData(userdata)
    enemy.pbody:setFixedRotation(true)
    enemy.pbody:setLinearVelocity(0, rs)
    enemy.pbody:setMass(rm)
    --print(rx,ry, #Enemies)
    return enemy
end