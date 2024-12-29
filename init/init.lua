GAME_NAME = "Codename: aljofifa_asesina"
GAME_VERSION = "0.1"


function init()
    math.randomseed(os.time())

    love.window.setTitle(string.format("%s (%s)",GAME_NAME, GAME_VERSION))
    love.window.setMode(1280, 800)

    require("core.physics")
    Physics:init()

    require("entities.player")
    require("entities.bullet")
    require("entities.enemy")
    require("fx.starfield")
    require("core.music")
    require("core.sounds")
    Starfield:init()
    Music:init()
    Music:play()
    Sounds:init()

end