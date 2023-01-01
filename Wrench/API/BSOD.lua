local logo = {
    [[                          _______      ]],
    [[                         /   \   \     ]],
    [[                        /     \   \    ]],
    [[                       /       \   \   ]],
    [[        ______________/         \___\  ]],
    [[       |                               ]],
    [[       |                               ]],
    [[       |                               ]],
    [[       |_____________        _____     ]],
    [[                     \      /    /     ]],
    [[                      \    /    /      ]],
    [[                       \__/____/       ]],
    [[                                       ]]
}

functionInit(msg)
    term.clear()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.blue
    term.setTextColor(colors.white)
    for i = 1,12 do
        print(logo[i])
    end
    print(" ")
    term.setCursorPos(1,15)
    term.setTextColor(colors.red)
    print("BSOD: Critical Error detected: "..msg)
end
