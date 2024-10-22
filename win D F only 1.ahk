; GUI MONITOR BLACK SCREEN PARAMETERS


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
	
	
