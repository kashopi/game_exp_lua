Bullets = {}


function Bullets:draw()
    for i,v in ipairs(Bullets) do
        love.graphics.circle("line", v.x, v.y, 5)
        --print("#Bullets: %d (bc:%d)", #Bullets, Physics.world:getBodyCount())
    end
end

function Bullets:update(dt)
    for i,v in ipairs(Bullets) do
        Bullets[i].x, Bullets[i].y = Bullets[i].pbody:getPosition()
        if Bullets[i].y<-50 then
            Bullets[i].pbody:destroy()
            table.remove(Bullets, i)
        end
    end
end

function Bullets:fire_bullet(px, py)
    print("fire: ", px, py)
    local bullet = {
        x=px,
        y=py,
        w=5,
        h=5,
    }

    Sounds:play("shoot")

    bullet.pbody=love.physics.newBody(Physics.world, px, py, "dynamic")
    bullet.pshape=love.physics.newRectangleShape(bullet.w/2, bullet.h/2, bullet.w, bullet.h)
    bullet.pfixture=love.physics.newFixture(bullet.pbody, bullet.pshape)
    bullet.pbody:setFixedRotation(true)
    bullet.pbody:setLinearVelocity(0, -500)
    bullet.pbody:setMass(5)

    table.insert(Bullets, bullet)
end