Controls = {}

function Controls:init()
    local js = love.joystick.getJoysticks()
    if #js == 0 then
        Controls['joy'] = nil
    else
        Controls['joy'] = js[1]
        print("Detected: ",Controls['joy']:getName())
    end
end

function Controls:update(dt)
    if Controls['joy'] then
        if Controls['joy']:isDown(1) then
            print("Button!")
        end
    elseif love.keyboard.isDown("space") then
        launch_test()
    end

    if love.keyboard.isDown("escape") then love.event.quit() end
end