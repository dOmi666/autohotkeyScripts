#requires autohotkey v2.0

#HotIf WinExist("TeamSpeak")
~F13::{
    Send "{scrollLock}"
}