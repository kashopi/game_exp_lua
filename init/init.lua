GAME_NAME = "Codename: aljofifa_asesina"
GAME_VERSION = "0.1"
TEST_NO_UI = true

if TEST_NO_UI then
    SCREEN_WIDTH = 320
    SCREEN_HEIGHT = 200
    AS_WIDTH = 300
    AS_HEIGHT = 180
else
    SCREEN_WIDTH = 1280
    SCREEN_HEIGHT = 800
    AS_WIDTH = 1200
    AS_HEIGHT = 700
end


function Init()
    math.randomseed(os.time())

    love.window.setTitle(string.format("%s (%s)",GAME_NAME, GAME_VERSION))
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)

end

return Init