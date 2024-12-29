Music = {}


function Music:init()
    Music.soundtrack = love.audio.newSource("assets/music/music.mp3", "static")
    Music.soundtrack:setLooping(true)
    Music.soundtrack:setVolume(0.3)
end

function Music:play()
    Music.soundtrack:play()
end