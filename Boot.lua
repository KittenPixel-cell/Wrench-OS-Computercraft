if not term.isColor() then
    error("Color is not supported.")
end

local API = {
    [1] = {"SHA256", "sha256"},
    [2] = {"someRandomFunctions", "random"}
}

local total
local updateBar = function()
    local step = #API / 37
    total = total +step
    local round = math.floor(total)
    if round >= 3 and round <= 37 then
        paintutils.drawLine(3, 17, round, 17, colors.cyan)
    end
    term.setBackgroundColor(colors.white)
end

local cPrint = functionlocal function centerPrint(text, ny)
    if type(text) == "table" then
    for _, e in pairs(text) do centerPrint(e) 
    end
else
    local x, y = term.getCursorPos()
    local w,h = term.getSize()
    term.setCursorPos(w/2 - text:len()/2, ny or y)
    print(text)
end

local logo = "Wrench OS"

term.setBackgroundColor(colors.white)
term.setTextColor(colors.orange)

term.clear()
term.setCursorPos(1,1)
for i = 1,15 do 
    write(logo[i])
end

paintutils.drawLine(2,16,50,16,colors.blue)
paintutils.drawLine(2,16,50,18,colors.blue)
paintutils.drawLine(2,16,50,18,colors.blue)
paintutils.drawLine(50,16,50,18,colors.blue)

term.setBackgroundColor(colors.white)
term.setTextColor(colors.lime)
for i = 1, #API do
    os.unloadAPI(API[2])
    os.loadAPI(API[2])
    term.setCursorPos(1,15)
    term.clearLine()
    print("Loading API:"..API[1])
    --cPrint("Loading API:"..API[1])
    updateBar()

end

sleep(0)
term.clear()
print("Boot screen loaded.")
  
