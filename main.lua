

function love.load()
    require('lib.utils')
    Init = require("init/init")
    Init()

    EntitiesManager = require('entities.manager')
    Physics = require("core/physics")
    Physics:init()

    require('core.sounds')
    Sounds:init()

    Player = require("entities/player")
    Player:init()
    EntitiesManager:add(Player, true, true)

    require("fx/starfield")
    Starfield:init()
    EntitiesManager:add(Starfield, true, true)

    require('entities.bullet')
    EntitiesManager:add(Bullets, true, true)

    local js = love.joystick.getJoysticks()
    if #js == 0 then
        Joystick = nil
    else
        Joystick = js[1]
        print("Detected: ",Joystick:getName())
    end

end

function love.draw()
    DrawableEntities:drawAll()
end

function love.update(dt)
    --if love.keyboard.isDown("up") then  end
    --if love.keyboard.isDown("down") then  end
    if Joystick then
        if Joystick:isDown(1) then
            print("Button!")
            launch_test()
        end
    elseif love.keyboard.isDown("space") then
        launch_test()
    end

    if love.keyboard.isDown("escape") then love.event.quit() end

    UpdatableEntities:updateAll(dt)
    Physics.world:update(dt)
    --print(love.timer.getFPS())
end

function launch_test()
    Bullets:fire_bullet(Player.x+15, Player.y-10)
end