#Requires AutoHotkey v2.0

#HotIf WinActive("ahk_exe SonsOfTheForest.exe") 
    +e:: {
        static toggle := 0
        if (toggle = 1)
            toggle := 0
        else
            toggle := 1
        send "eeeeee"
        sleep 30
    }
    +x:: {
        static toggle := 0
        if (toggle = 1)
            toggle := 0
        else
            toggle := 1
        send "xxxxxx"
        sleep 30
    }
