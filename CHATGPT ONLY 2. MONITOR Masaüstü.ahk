; mevcut "media tuşları.ahk"  ı CHATGPT editleyip 2. monitör için yapmıştır.
; kısayol tuşu ise win + f şeklindedir

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
