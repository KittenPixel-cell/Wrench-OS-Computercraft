local mainLogo = function ( mode )
    local logo = "Wrench OS"
    if type(mode) ~= "string" then error("mainLogo: STring expected, got "..type(mode)) end
    if mode ~= "center" or mode ~= "left" or mode ~= "right" or mode ~= "bCenter" or mode ~= "bLeft" or mode ~= "bRight" then error("mainLogo: Mode expected, got nil") end

    for i = 1, #logo do
        if mode == "center" then
            term.setCursorPos( 12,i )
        elseif mode == "left" then
            term.setCursorPos( 1, i )
        elseif mode == "right" then
            term.setCursorPos( 24, i)
        elseif mode == "bCenter" then
            term.setCursorPos( 12, i + 6)
        elseif mode == "left" then
            term.setCursorPos( 1, i + 6)
        elseif mode == "right" then
            term.setCursorPos( 24, i + 6)
        end
        print( logo[i] )
    end
end

local loginBar = function()
    paintutils.drawLine(12,6,39,6,colors.black)
    paintutils.drawLine(12,12,39,12,colors.black)
    paintutils.drawLine(12,6,12,12,colors.black)
    paintutils.drawLine(39, 6,39,12,colors.black)
    paintutils.drawLine(14, 9,37,12,colors.white)
    paintutils.drawLine(14, 11,37,11,colors.white)
    term.setCursorPos(14,8)
    term.setTextColor(colors.black)
    term.setBackgroundColor(colors.white)
    write("Username:")
    term.setCursorPos(14,10)
    write("Password:")

    term.setTextColor(colors.white)
    term.setBackgroundColor(colors.black)
end
