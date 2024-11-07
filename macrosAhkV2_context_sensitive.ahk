#Requires AutoHotkey 2
#Warn

; oxygen not included caps lock for copy build settings (caps lock for backslash)
{
    #HotIf WinActive("ahk_exe OxygenNotIncluded.exe") 
    Alt:: {
        Send("\")
    }
    return
}

; Excel F1 disabler
{
	#HotIf WinActive("AHK_exe excel.exe")
		F1::F2
    return
}

; Minecraft WASD & arrow keys work together
{
	#HotIf WinActive("ahk_exe javaw.exe")
        Up::W
        Down::S
        Left::A
        Right::D
        return
}

; In windows explorer Ctrl + Shift + X creating a new empty txt file
{
    #HotIf WinActive("ahk_exe explorer.exe")
    ^+x::  ; Ctrl + Shift + X
    {
        ; Get the path of the active Explorer window
        if WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
            ; Get the current active directory path
            for window in ComObject("Shell.Application").Windows {
                if (window.HWND = WinActive("A")) {
                    activeDir := window.Document.Folder.Self.Path
                    break
                }
            }
        }
        ; If on the Desktop
        else if WinActive("ahk_class Progman") || WinActive("ahk_class WorkerW") {
            activeDir := A_Desktop
        }
        else {
            TrayTip "Error", "This script only works in Windows Explorer or on the Desktop."
            return
        }

        ; Base name for the new text file
        baseName := activeDir "\NewFile"
        ext := ".txt"
        fileName := baseName ext

        ; Check if the file already exists, if so, create an incremental filename
        index := 1
        while FileExist(fileName) {
            ; Incremental filenames like NewFile0001.txt, NewFile0002.txt, etc.
            fileName := baseName Format("{:04}", index) ext
            index++
        }

        ; Create a new empty text file
        try {
            FileAppend("", fileName)
            ; Notify the user that the file has been created
            TrayTip "OK", fileName "  created"
        } catch {
            TrayTip "Error", "Could not create the file."
        }
    }
    return
}


;PMFUN ITEM ID PREPARING. Ctrl + Shift + E on vivaldi makes this Input "https://lineage.pmfun.com/item/"
{
	#HotIf WinActive("AHK_exe vivaldi.exe")
	^+e::{ ;ctrl + shift + e
		sleep 150
		Send "^l"
		sleep 50
		Send "^a"
		sleep 50
		send "{BackSpace}"
		sleep 50
		Sendtext "https://lineage.pmfun.com/item/"
		sleep 100
		Send "{Delete}"
		return
	}
	return
}


{
    #HotIf WinActive("ahk_exe Palworld-Win64-Shipping.exe") 
        NumLock:: {
            static toggle := 0
            if (toggle = 1)
            {
                toggle := 0
                send "{F up}"
            }
            else
            {
                toggle := 1
                send "{F down}"
            }
        }
        return

}

;FAST REWRITE OR CORRECT ME TO WRITING write 'reqv2' = '#requires autohotkey v2.0'
{
	{
		#hotif WinActive("AHK_exe notepad++.exe")
			::reqv2::{#}requires autohotkey v2.0
			return
	}
	{
		#hotif WinActive("AHK_exe Code.exe")
			::reqv2::{#}requires autohotkey v2.0
			return
	}
}
