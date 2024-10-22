#requires autohotkey v2.0

#HotIf WinActive("2209116AG")
RAlt::{
    Send "{Printscreen}"
    sleep 300
    Send "l"
}