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
    if self:get_button("fire") then launch_test() end
    if self:get_button("quit") then love.event.quit() end
end

function Controls:get_axis()
    local dx, dy = 0, 0
    if Controls['joy'] then
        dx, dy = Controls['joy']:getAxes()
    end
    if love.keyboard.isDown("up") then dy = -1 end
    if love.keyboard.isDown("down") then dy = 1 end
    if love.keyboard.isDown("left") then dx = -1 end
    if love.keyboard.isDown("right") then dx = 1 end

    return dx, dy
end

function Controls:get_button(button_name)
    local button_status = false

    local buttons_map = {}
    buttons_map['fire'] = {1, "space"}
    buttons_map['quit'] = {999, "escape"}

    if Controls['joy'] then
        if Controls['joy']:isDown(buttons_map[button_name][1]) then
            button_status = true
        end
    end
    if love.keyboard.isDown(buttons_map[button_name][2]) then
        button_status = true
    end
    return button_status
end