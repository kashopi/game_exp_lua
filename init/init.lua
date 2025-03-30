GAME_NAME = "Codename: aljofifa_asesina"
GAME_VERSION = "0.1"
TEST_NO_UI = false

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
  io.stdout:setvbuf('no')
  print(GAME_NAME, " (", GAME_VERSION,")")
  print("Processors: ",love.system.getProcessorCount())
  
  math.randomseed(os.time())

  configure_window()
  configure_mouse()
end

function configure_window()
    love.window.setTitle(string.format("%s (%s)",GAME_NAME, GAME_VERSION))
    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)
end

function configure_mouse()
    local cursor_image = "assets/cursor.png"
    local cursor = love.mouse.newCursor(cursor_image, 1, 1)
    love.mouse.setCursor(cursor)
    love.mouse.setVisible(true)  
end

return Init