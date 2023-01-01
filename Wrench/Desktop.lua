--Vars

local version = 1.0
local running = true

local img = paintutils.loadImage("IMGS/Wrench")

--Booleans
_ms = 0

--Funcs
clear = function()
term.setBackgroundColor(colors.black)
    term.clear()
    term.setCursorPos(1,1)
end

init = function()
  _ms = 0
  drawDesktop()
  drawTaskBar()
  runTime()
end

drawTaskBar = function()
  term.setCursorPos(1,1)
  term.setBackgroundColor(colors.blue)
  term.clearLine()
  term.setCursorPos(1,1)
  term.setBackgroundColor(colors.lime)
  term.setTextColor(colors.white)
  term.write("[MENU]")
end

drawMenu1 = function()
  term.setCursorPos(1,2)
  term.setBackgroundColor(colors.white)
  term.setTextColor(colors.red)
  print("[POWER]")
end

stop = function()
clear()
term.setTextColor(colors.lime)
print("Shutting down...")
sleep(4)
os.shutdown()
end

drawDesktop = function()
    term.setBackgroundColor(colors.lightGray)
    term.clear()
    term.setCursorPos(1,1)
 --paintutils.drawImage(img,3,5)
end

runTime = function()
    while running do
      event, button, x, y = os.pullEvent("mouse_click")
      if _ms == 0 and button == 1 and x <7 and y == 1 then
      drawMenu1()
      _ms = 1
      elseif _ms == 1 and button == 1 and y == 2 and x < 7 then
      stop()
      elseif _ms == 1 and button == 1 and x <7 and y == 1 then
      init()
    end
  end  
end
--Main

init()
