#include win D F only 1.ahk
;---------------- I N D E X ----------------
/*
|	14	|	WINDOWS + D WORKS ONLY MAIN MONITOR
|	142	|	SOME SHORTCUTS FOR MEDIA (Play&Pause, previous, Next)
|	155	|	!!!! Win+A to change Audio Playback Device (OLD - COMMENT MODE)
|	201	|	WINDOWS + F WORKS ONLY SECOND MONITOR (chatgpt edited previous code.)
|	254	|	win key + Calculator starts notepad++ or notepad
|	278	|	SHIFT + SCROLL LOCK SWITCHES TO MOBILE PHONE MODE IN VOICEMEETER
|	286	|	win key + A & Winkey + Q starts Everything
|	312 |	; Black Screen on MONITOR NO 1 - 2 monitor (make adjustments manual)
|	192	|	WIN key move from everywhere


*/



; SOME SHORTCUTS FOR MEDIA
; Numlock + VOLDOWN: PAUSE
; Numlock + VOLMUTE: PREVIOUS
; Numlock + VOLUP: NEXT
{
	Numlock & volume_down::Send {Media_Play_Pause}
	Numlock & volume_mute::Send {Media_Prev}
	Numlock & volume_up::Send {Media_next}
	return
}







;win key + Calculator starts notepad++ or notepad
{
	#Launch_App2::
	IfWinNotExist, ahk_exe notepad++.exe
		{
			Run, notepad++.exe
		}
    else
    {
        WinActivate, ahk_exe notepad++.exe
    }

	sleep, 500

	IfWinNotExist, ahk_exe notepad++.exe
		{
			Run, notepad.exe
		}
		
return
}



;SHIFT + SCROLL LOCK SWITCHES TO MOBILE PHONE MODE IN VOICEMEETER
{
+ScrollLock::
	send {f14}
	return
}



;win key + A & Winkey + Q starts Everything
{
	#A:: Goto Everything
	#Q:: Goto Everything
	detecthiddenwindows, On
	Everything:
		IfWinNotExist, ahk_exe Everything.exe
			{
				Run, "C:\Program Files\Everything\Everything.exe"
			}
		else
		{
			WinActivate, ahk_exe Everything.exe
		}


			
	return
}




; Black Screen on MONITOR NO 1 - 2 monitor (make adjustments manual)
{

	;for my taste 
	;thats my resolutions
	;i want to show it to MONITOR NO 1 Monitor
	;this is my setup
	;
	;
	;	_____________________		____________________
	;	|					|		|					|
	;	|					|		|					|
	;	|		LEFT		|		|		RIGHT		|
	;	|					|		|					|
	;	|___________________|		|___________________|
	;	
	;
	;		MONITOR NO 2				MONITOR NO 1
	;		2560 X 1080					1920 X 1080


	; Create the gui splash screen







	; Define the hotkey to toggle the splash screen
	^!+F6::
		if (Splash1Visible)
		{
			gui, mon1: Hide
			Splash1Visible := 0
		}
		else
		{
			gui, mon1: Show
			Splash1Visible := 1
		}
	return


	^!+F7::
		if (Splash2Visible)
		{
			gui, mon2: Hide
			Splash2Visible := 0
		}
		else
		{
			gui, mon2: Show
			Splash2Visible := 1
		}
	return


}


;win key + F1
{
	#F1:: Goto scrxxx
	scrxxx:
		detecthiddenwindows, On
		
			IfWinNotExist, ahk_exe scrcpy.exe
				{
					Run, "Z:\Google Drive\scrcpy-win64-v2.0\Wifi.pyw", Z:\Google Drive\scrcpy-win64-v2.0\
				}
			else
				{
					WinActivate, ahk_exe scrcpy.exe
				}
		return
		
}

;win key + F2
{
	#F2:: Goto scrxxxusb
	scrxxxusb:
		detecthiddenwindows, On
		
			IfWinNotExist, ahk_exe scrcpy.exe
				{
					Run, z:\Google Drive\scrcpy-win64-v2.0\usbRedmiNote12Pro.bat, z:\Google Drive\scrcpy-win64-v2.0\
				}
			else
				{
					WinActivate, ahk_exe scrcpy.exe
				}
		return
		
}




;WIN key move from everywhere
{
		; Easy Window Dragging (requires XP/2k/NT)
	; https://www.autohotkey.com
	; Normally, a window can only be dragged by clicking on its title bar.
	; This script extends that so that any point inside a window can be dragged.
	; To activate this mode, hold down CapsLock or the middle mouse button while
	; clicking, then drag the window to a new position.

	; Note: You can optionally release CapsLock or the middle mouse button after
	; pressing down the mouse button rather than holding it down the whole time.
	; This script requires v1.0.25+.

	~MButton & LButton::
	#LButton::
	CoordMode, Mouse  ; Switch to screen/absolute coordinates.
	MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
	WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
	WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
	if EWD_WinState = 0  ; Only if the window isn't maximized 
		SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
	return

	EWD_WatchMouse:
	GetKeyState, EWD_LButtonState, LButton, P
	if EWD_LButtonState = U  ; Button has been released, so drag is complete.
	{
		SetTimer, EWD_WatchMouse, Off
		return
	}
	GetKeyState, EWD_EscapeState, Escape, P
	if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
	{
		SetTimer, EWD_WatchMouse, Off
		WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
		return
	}
	; Otherwise, reposition the window to match the change in mouse coordinates
	; caused by the user having dragged the mouse:
	CoordMode, Mouse
	MouseGetPos, EWD_MouseX, EWD_MouseY
	WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
	SetWinDelay, -1   ; Makes the below move faster/smoother.
	WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
	EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
	EWD_MouseStartY := EWD_MouseY
	return

}