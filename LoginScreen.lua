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
