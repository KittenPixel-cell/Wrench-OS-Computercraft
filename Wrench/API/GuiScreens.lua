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
