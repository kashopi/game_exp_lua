GAME_NAME = "Codename: aljofifa_asesina"
GAME_VERSION = "0.1"
SCREEN_WIDTH = 1280
SCREEN_HEIGHT = 800
AS_WIDTH = 1200
AS_HEIGHT = 700

function init()
    math.randomseed(os.time())

    love.window.setTitle(string.format("%s (%s)",GAME_NAME, GAME_VERSION))
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)

    require("core.physics")
    Physics:init()

    require("entities.hud")
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
    Hud:init()

end