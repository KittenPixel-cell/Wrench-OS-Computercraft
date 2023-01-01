
os.pullEvent = os.pullEventRaw

local w,h = term.getSize()

function printCentered( y,s )
   local x = math.floor((w - string.len(s)) / 2)
   term.setCursorPos(x,y)
   term.clearLine()
   term.write( s )
end

local nOption = 1

local function drawMenu()
   term.clear()
   term.setCursorPos(1,1)
   term.write("Wrench OS Install Menu // ")
term.setCursorPos(1,2)

   term.setCursorPos(w-11,1)
   if nOption == 1 then
   term.write("Install")
elseif nOption == 2 then
   term.write("Cancel")
end

end

--GUI
term.clear()
local function drawFrontend()
   printCentered( math.floor(h/2) - 3, "")
   printCentered( math.floor(h/2) - 2, "Boot Menu" )
   printCentered( math.floor(h/2) - 1, "")
   printCentered(math.floor(h / 2) + 0, ((nOption == 1 and "[ Install ]") or "Install"))﻿
   printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[ Cancel  ]") or "Cancel" )
   printCentered( math.floor(h/2) + 4, "")
end

--Display
drawMenu()
drawFrontend()

while true do
 local e,p = os.pullEvent()
 if e == "key" then
  local key = p
  if key == 17 or key == 200 then

   if nOption > 1 then
    nOption = nOption - 1
    drawMenu()
    drawFrontend()
   end
  elseif key == 31 or key == 208 then
  if nOption < 4 then
  nOption = nOption + 1
  drawMenu()
  drawFrontend()
end
elseif key == 28 then
    --End should not be here!!
break
end --End should be here!!
end
end
term.clear()

--Conditions
if nOption  == 1 then
term.clear()
wget https://raw.githubusercontent.com/KittenPixel-cell/Wrench-OS-Computercraft/main/Startup.lua startup.lua
wget https://raw.githubusercontent.com/KittenPixel-cell/Wrench-OS-Computercraft/main/Boot.lua boot.lua
wget https://raw.githubusercontent.com/KittenPixel-cell/Wrench-OS-Computercraft/main/Wrench/API/GuiScreens.lua Wrench/API/GuiScreens.lua
else then
term.clear()
print("Install Canceled Rebooting...")
os.reboot()
end
