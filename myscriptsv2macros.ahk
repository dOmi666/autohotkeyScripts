#requires autohotkey v2.0

;---------------- I N D E X ----------------
/*
|	17	|	MOVE MOUSE WITH HOTKEYS (CAPS LOCK + numpad(2+3+4+6+8)
|	86	|	FAST KILL ALL EXPLORER.EXE AND START AGAIN CAPSLOCK + DELETE(NEAR PGUP-DPDN)
|	104	|	FAST TASKMGR STARTER CAPSLOCK + ENTER
|	122	|	FAST REWRITE OR CORRECT ME TO WRITING write 'reqv2' = '#requires autohotkey v2.0'
|	137	|	PMFUN ITEM ID PREPARING. Ctrl + Shift + E on vivaldi makes this Input "https://lineage.pmfun.com/item/"
|		|	
|		|	
|		|
|		|	


*/
;MOVE MOUSE WITH HOTKEYS

{
	CoordMode "Mouse", "Screen"
	
	{
		CapsLock & Numpadadd::{
			MouseClick
			return
		}
	}

	{
		CapsLock & Numpad1::{
			MouseMove 300, 1000
			return
		}
	}
	
	{
		CapsLock & Numpad2::{
			MouseMove 1100, 1000
			return
		}
	}

	{
		CapsLock & Numpad3::{
			MouseMove 4790, 1050
			return
		}
	}

	{
		CapsLock & Numpad4::{
			MouseMove 250, 600
			return
		}
	}
	
	{
		CapsLock & Numpad5::{
			MouseMove 1325, 600
			return
		}
	}

	{
		CapsLock & Numpad6::{
			MouseMove 3650, 500
			return
		}
	}
	
	{
		CapsLock & Numpad7::{
			MouseMove 180, 150
			return
		}
	}

	{
		CapsLock & Numpad8::{
			MouseMove 1100, 200
			return
		}
	}
	
	{
		CapsLock & Numpad9::{
			MouseMove 4220, 140
			return
		}
	}
	
}

;FAST KILL ALL EXPLORER.EXE AND START AGAIN CAPSLOCK + DELETE(NEAR PGUP-DPDN)
{
	{
		CapsLock & Del::
		{
			try
				{
				While ProcessExist('explorer.exe')
					ProcessClose 'explorer.exe'
				}
				Sleep 1000
				run 'explorer.exe'
		return
		}
	}
}


;FAST TASKMGR STARTER CAPSLOCK + ENTER
{
	CapsLock & Enter::{
		if not WinExist("ahk_exe taskmgr.exe"){
			Run "taskmgr.exe"
		}
		else{
			WinActivate
		}
	}
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






{
alwaystopfunc(){
	WinSetAlwaysOnTop -1
	return
}
^!t::alwaystopfunc ;ctrl + alt + T
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

#requires autohotkey v2.0
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

; Excel F1 disabler
{
	#HotIf WinActive("AHK_exe excel.exe")
		F1::F2
}

; oxygen not included caps lock for copy build settings (caps lock for backslash)
{
	#HotIf WinActive("AHK_exe OxygenNotIncluded.exe")
		CapsLock::Send("\")
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