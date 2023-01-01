if not term.isColor() then
    error("Color is not supported.")
end

local API = {
    [1] = {"SHA256", "sha256"},
    [2] = {"GuiScreens", "Wrench/API/GuiScreens.lua"}
}

local total = 0
local updateBar = function()
    local step = 37 / #API
    total = total + step
    local round = math.floor(total)
    paintutils.drawLine(8, 17, 6+ round, 17, colors.cyan)
    term.setBackgroundColor(colors.black)
end

local logo = "Wrench OS"                                            

term.setTextColor(colors.orange)

term.clear()
term.setCursorPos(1,1)
for i = 1,1 do 
    write("                    Wrench OS")
end

paintutils.drawLine(7,16,44,16,colors.blue)
paintutils.drawLine(7,18,44,18,colors.blue)
paintutils.drawLine(7,16,7,18,colors.blue)
paintutils.drawLine(44,16,44,18,colors.blue)

term.setTextColor(colors.lime)
for i = 1, #API do
    os.unloadAPI(API[2][2])
    os.loadAPI(API[2][2])
    term.setCursorPos(1,15)
    term.clearLine()
    print("                    Loading OS")
    --cPrint("Loading API:"..API[1])
    updateBar()
end

sleep(4)
term.clear()
term.setCursorPos(1,1)
print("Boot screen loaded.")
  
