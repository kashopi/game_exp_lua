

function love.load()
    require("init/init")
    init()

    DrawManager = require('core.draw')
    UpdateManager = require('core.update')
end

function love.draw()
    DrawManager()
end

function love.update(dt)
    UpdateManager(dt)
end


function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        Player.is_taking_damage = true
        Bullets:fire_bullet(Player.x, Player.y)
    end
end