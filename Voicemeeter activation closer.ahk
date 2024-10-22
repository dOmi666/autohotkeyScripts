#requires autohotkey v2.0
#NoTrayIcon
While true 
    If WinExist("About / Registration info..."){
        WinClose
        Sleep 5000
    }
; CTRL (^) + ALT (!) + SHIFT (+) f12
; Copy the text to the clipboard and paste it immediately when is pressed
^!PgDn::ExitApp