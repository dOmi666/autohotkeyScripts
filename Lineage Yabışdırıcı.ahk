#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.




Hotkey, IfWinActive, ahk_exe L2.exe
Hotkey, ^v, pasteinlineage	; başka yerde çalışmasın diye ve baştaki noktalı virgülü sil

MsgBox Program aktive edilmiştir. Çıkış için CAPS LOCK + ALT GR
return




;Control + V paste
;---------------- pasteinlineage ----------------
pasteinlineage:
Send, %Clipboard%
return
;---------------- pasteinlineage ----------------



; FOR EXIT FROM PROGRAM
CapsLock & RAlt::
Msgbox, 4, ?? PROGRAMI KAPAT ??, Programdan çıkış yapmak istiyor musunuz? Tekrardan çalıştırmak gerekecektir, 5

IfMsgBox, Yes
	{MsgBox  programdan çıkış yapıldı
	ExitApp
return
}
IfMsgBox, No
{
	Msgbox üzülmüştüm. Lineage Yabıştırıcı devam ediyor. 
return
}
return
