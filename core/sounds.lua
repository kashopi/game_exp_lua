Sounds = {}


function Sounds:init()
    Sounds.shoot = love.audio.newSource("assets/fx/shoot.mp3", "static")
end

function Sounds:play(fx_name)
    if fx_name == "shoot" then
        if Sounds.shoot:isPlaying() then
            Sounds.shoot:stop()
        end
        Sounds.shoot:play()
    end
end