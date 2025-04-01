

function love.load()
    require('lib.utils')
    Init = require("init/init")
    Init()

    require('lib.events')
    EventsManager:init()

    EntitiesManager = require('entities.manager')

    Physics = require("core/physics")
    Physics:init()

    require('core.sounds')
    Sounds:init()

    require('core.controls')
    Controls:init()

    Player = require("entities/player")
    Player:init()
    EntitiesManager:add(Player, true, true)

    require("fx/starfield")
    Starfield:init()
    EntitiesManager:add(Starfield, true, true)

    require('entities.bullet')
    EntitiesManager:add(Bullets, true, true)

    require('entities.enemy')
    EntitiesManager:add(Enemies, true, true)

end

function love.draw()
    DrawableEntities:drawAll()
end

function love.update(dt)
    --if love.keyboard.isDown("up") then  end
    --if love.keyboard.isDown("down") then  end
    EventsManager:process_events()
    Controls:update(dt)
    UpdatableEntities:updateAll(dt)
    Physics.world:update(dt)
    --print(love.timer.getFPS())
end

function launch_test()
    Bullets:fire_bullet(Player.x+15, Player.y-10)
end