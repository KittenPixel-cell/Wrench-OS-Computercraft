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

local logo = {
 [[                  _________    ]],
 [[                 /      \  \   ]],
 [[                /        \  \  ]],
 [[  _____________/          \___\]],
 [[ |                             ]],
 [[ |                             ]],
 [[ |                             ]],
 [[ |_____________         ____   ]],
 [[               \       /    /  ]],
 [[                \    /    /    ]],
 [[                 \__/____/     ]]
}                                          

term.setTextColor(colors.orange)

term.clear()
term.setCursorPos(1,1)
for i = 1,11 do 
    write(logo[i])
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
    term.setCursorPos(1,15)
    sleep(2)
    term.clearLine()
    print("           Loading API: GuiScreens")
    --cPrint("Loading API:"..API[1])
    updateBar()
end

sleep(4)
term.clear()

local login = function()
local userPath = "Wrench/Data/Users"
local bLogin = true
local pass = ""
local user = ""

term.setBackgroundColor(colors.black)
term.clear()

GuiScreens.mainLogo("bLeft")
GuiScreens.loginBar()

local writeVars = function()
    term.setCursorPos(14,9)
    write(user)
    term.setCursorPos(14,11)
    write(pass)
end

term.setCursorBlink(true)

while bLogin do
    local evt = {os.pullEvent()}
    local currX, currY = term.getCursorPos()

    if evt[] == "mouse_click" then
        local x=evt[3]
        local y=evt[4]
        if x >= 14 and x <= 39 and y == 9 then
            term.setCursorPos(14 + user:len(), 9)
        elseif x >= 14 and x <= 39 and y == 11 then
                term.setCursorPos(14 + pass:len(), 9)
        end
    elseif evt[1] == "char" then
        local char = evt[2]
        if currY == 9 then
        pass = pass .. char
        elseif currY == 11 then
            pass = pass .. char
        end
        term.setCursorPos(currX - 1, currY)
    elseif evt[1] == "key" then     
        if currY == keys.enter then
            if currY == 9 then
                uerm.setCursorPos( 14 + user:len(), 9)
                term.setCursorPos( 14 + pass:len(), 11)
            elseif currY == 11 then
                term.setCursorPos( 14 + pass:len(), 11)
            end
        elseif evt[2] == 14 then
            if currY == 9 then
                user = string.sub(user, 1, user:len() - 1)
            elseif currY == 11 then
                    pass = string.sub(pass, 1, pass:len() - 1)
            end
            term.setCursorPos( currX - 1, currY )
        end
    end

    local CurrX, CurrY = term.getCursorPos()
    writeVars()
    term.setCursorPos( currX, currY)
end

term.setCursorBlink(false)
end
