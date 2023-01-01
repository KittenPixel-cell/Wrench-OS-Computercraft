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

function Init(msg)
    term.clear()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colors.blue)
    for i = 1,12 do
        print(logo[i])
    end
    print(" ")
    term.setCursorPos(1,15)
    term.setTextColor(colors.red)
    print("BSOD: Critical Error detected: "..msg)
    print("Rebooting")
    textutils.slowPrint("##############")
    sleep(2)
    os.reboot
end
