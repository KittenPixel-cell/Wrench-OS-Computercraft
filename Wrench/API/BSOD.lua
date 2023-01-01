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
    [[                       \__/____/       ]]
}

local BSOD = function(msg)
    term.clear()
    term.setCursorPos(1,1)
    for i = 1,12 do
        print(logo[i])
    end
    print("BSOD: Critical Error detected: "..msg)
end
