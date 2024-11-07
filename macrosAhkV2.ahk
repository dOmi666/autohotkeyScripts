#Warn
#requires autohotkey v2.0
#SingleInstance Force

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


{
	alwaystopfunc(){
		WinSetAlwaysOnTop -1
		return
	}
	^!t::alwaystopfunc ;ctrl + alt + T
}

;FAST KILL ALL EXPLORER.EXE AND START AGAIN CAPSLOCK + DELETE(NEAR PGUP-DPDN)
{
	CapsLock & Del::{
		try{
			While ProcessExist('explorer.exe')
				ProcessClose 'explorer.exe'
		}
		Sleep 1000
		run 'explorer.exe'
	return
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
	return
}
}

#Include macrosAhkV2_context_sensitive.ahk