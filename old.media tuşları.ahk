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
|		|	


*/

; MONITOR PARAMETERS

{
	SysGet, MonitorName, MonitorName, %A_Index%
	SysGet, Monitor, Monitor, %A_Index%
	SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%

	; only modify here
	monitor_width :=1920
	monitor_height :=1080

	monitor2_width :=2560
	monitor2_height :=1080
	; modify End

	; FIRST MONITOR SETTINGS START
	start_point := "x"MonitorLeft
	w_pixels := "w"monitor_width
	h_pixels := "h"monitor_height
	; FIRST MONITOR SETTINGS END
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; SECOND MONITOR SETTINGS START
	start_point2 := "x"MonitorRight
	w2_pixels := "w"monitor2_width
	h2_pixels := "h"monitor2_height
	; SECOND MONITOR SETTINGS FINISH



	Gui, mon1:

	;gui, mon1: +LastFound +AlwaysOnTop
	gui, mon1: Color, 000000
	gui, mon1: -Caption +E0x20 +ToolWindow +LastFound ; Remove title bar and window borders
	gui, mon1: Margin, 0, 0 ; Remove margins
	gui, mon1: show, %start_point% y0 %w_pixels% %h_pixels%
	gui, mon1: Maximize
	gui, mon1: Hide
	;gui, mon1: Show, NoActivate
	; Initialize the flag to indicate the visibility of the splash screen
	Splash1Visible := 0



	Gui, mon2:

	;gui, mon2: +LastFound +AlwaysOnTop
	gui, mon2: Color, 000000
	gui, mon2: -Caption +E0x20 +ToolWindow +LastFound ; Remove title bar and window borders
	gui, mon2: Margin, 0, 0 ; Remove margins
	gui, mon2: show, %start_point2% y0 %w2_pixels% %h2_pixels%
	gui, mon2: Maximize
	gui, mon2: Hide
	;gui, mon2: Show, NoActivate
	; Initialize the flag to indicate the visibility of the splash screen
	Splash2Visible := 0
}
















;WINDOWS + D WORKS ONLY MAIN MONITOR
{
#Persistent			; This keeps the script running permanently.
#SingleInstance		; Only allows one instance of the script to run.
SetWinDelay,-1
restcount:=0
#d::
min:=0
WinGet, id, list,,, Program Manager
Loop, %id%
	{
	WinGetpos,id_x_%A_Index%,id_y_%A_Index%,,,% "ahk_id" id%A_Index%
	WinGet, ExStyle%A_Index%, ExStyle,% "ahk_id" id%A_Index%
	if (id_x_%A_Index% < A_ScreenWidth and id_x_%A_Index% > -1000) and not (ExStyle%a_index% & 0x8) and not (ExStyle%a_index% & 0x8000000) and not (ExStyle%a_index% & 0x80)
		{
		
		min:=1
		break
		}
	}
if min
	{
	restcount++
	Loop, %id%
		{
		WinGetpos,id_x_%A_Index%,id_y_%A_Index%,,,% "ahk_id" id%A_Index%
		WinGet, ExStyle%A_Index%, ExStyle,% "ahk_id" id%A_Index%
		if (id_x_%A_Index% < A_ScreenWidth and id_x_%A_Index% > -1000) and not (ExStyle%a_index% & 0x8) and not (ExStyle%a_index% & 0x8000000) and not (ExStyle%a_index% & 0x80)
			{
			groupadd restore%restcount%,% "ahk_id" id%A_Index%		
			}
		}
	winget active%restcount%,ID,A
	winhide ahk_group restore%restcount% 
	detecthiddenwindows on
	winminimize ahk_group restore%restcount%
	winactivate Program Manager
	detecthiddenwindows off
	}
else if restcount
	{
	winhide ahk_group restore%restcount% 
	detecthiddenwindows on
	winrestore ahk_group restore%restcount%
	winactivate,% "ahk_id" active%restcount%
	detecthiddenwindows off
	reload
	}
return
}



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



; Win+A to change Audio Playback Device (OLD)
/*
{
#a::
	toggle:=!toggle ; This toggles the variable between true/false
	if toggle
	{
		Run nircmd setdefaultsounddevice "hoparlor"
		soundToggleBox("4 + 2 Sisteme geçildi")
	}
	else
	{
		Run nircmd setdefaultsounddevice "sades"
		soundToggleBox("SADES SA902")
	}
Return

{
; Display sound toggle GUI
soundToggleBox(Device)
{
	IfWinExist, soundToggleWin
	{
		Gui, destroy
	}
	
	Gui, +ToolWindow -Caption +0x400000 +alwaysontop
	Gui, Add, text, x65 y28,  %Device%
	SysGet, screenx, 0
	SysGet, screeny, 1
	xpos:=screenx-275
	ypos:=screeny-100
	Gui, Show, NoActivate x%xpos% y%ypos% h50 w400, soundToggleWin
	
	SetTimer,soundToggleClose, 2000
}
soundToggleClose:
    SetTimer,soundToggleClose, off
    Gui, destroy
Return

}
*/



; WINDOWS + F WORKS ONLY SECOND MONITOR (chatgpt edited previous code.)
{
#Persistent			; This keeps the script running permanently.
#SingleInstance		; Only allows one instance of the script to run.
SetWinDelay,-1
restcount:=0
#f::
min:=0
WinGet, id, list,,, Program Manager
Loop, %id%
	{
	WinGetpos,id_x_%A_Index%,id_y_%A_Index%,,,% "ahk_id" id%A_Index%
	WinGet, ExStyle%A_Index%, ExStyle,% "ahk_id" id%A_Index%
	if (id_x_%A_Index% > A_ScreenWidth and id_x_%A_Index% > -1000) and not (ExStyle%a_index% & 0x8) and not (ExStyle%a_index% & 0x8000000) and not (ExStyle%a_index% & 0x80)
		{
		
		min:=1
		break
		}
	}
if min
	{
	restcount++
	Loop, %id%
		{
		WinGetpos,id_x_%A_Index%,id_y_%A_Index%,,,% "ahk_id" id%A_Index%
		WinGet, ExStyle%A_Index%, ExStyle,% "ahk_id" id%A_Index%
		if (id_x_%A_Index% > A_ScreenWidth and id_x_%A_Index% > -1000) and not (ExStyle%a_index% & 0x8) and not (ExStyle%a_index% & 0x8000000) and not (ExStyle%a_index% & 0x80)
			{
			groupadd restore%restcount%,% "ahk_id" id%A_Index%		
			}
		}
	winget active%restcount%,ID,A
	winhide ahk_group restore%restcount% 
	detecthiddenwindows on
	winminimize ahk_group restore%restcount%
	winactivate Program Manager
	detecthiddenwindows off
	}
else if restcount
	{
	winhide ahk_group restore%restcount% 
	detecthiddenwindows on
	winrestore ahk_group restore%restcount%
	winactivate,% "ahk_id" active%restcount%
	detecthiddenwindows off
	reload
	}
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
					Run, D:\Google Drive\scrcpy-win64-v2.0\wifi.bat, D:\Google Drive\scrcpy-win64-v2.0\
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
					Run, D:\Google Drive\scrcpy-win64-v2.0\usbRedmiNote12Pro.bat, D:\Google Drive\scrcpy-win64-v2.0\
				}
			else
				{
					WinActivate, ahk_exe scrcpy.exe
				}
		return
		
}