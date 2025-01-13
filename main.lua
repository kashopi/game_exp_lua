
function love.load()
    require('lib.utils')
    Init = require("init/init")
    Init()

    DrawManager = require('core.draw')
    UpdateManager = require('core.update')
    require('lib.events')
    EventsManager:init()
    EventsManager:subscribe('blah', sample_ev1)
    EventsManager:subscribe('blah', sample_ev2)
    EventsManager:send_event('blah', "123")
end

function love.draw()
    DrawManager()
end

function love.update(dt)
    EventsManager:process_events()
    UpdateManager(dt)
end

function sample_ev1(value)
    print("sample_ev1 received ", value)
end

function sample_ev2(value)
    print("sample_ev2 received ", value)
end