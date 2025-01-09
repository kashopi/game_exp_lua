Hud = {}


function Hud:init()
    self.bg = {}
    self.bg.g = love.graphics.newImage("assets/gfx/hud.png")
    self.bg.w = SCREEN_WIDTH/2-self.bg.g:getWidth()/2
    self.bg.h = SCREEN_HEIGHT-self.bg.g:getHeight()
end

function Hud:draw()
    love.graphics.draw(
        self.bg.g, self.bg.w, self.bg.h)
end

