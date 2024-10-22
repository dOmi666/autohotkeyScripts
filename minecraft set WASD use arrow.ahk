#Requires AutoHotkey v2.0
CapsLock & RAlt::exitapp
#HotIf WinActive("ahk_exe javaw.exe")
{
Up::W
Down::S
Left::A
Right::D
return
}
