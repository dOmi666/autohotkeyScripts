;win key + Calculator starts notepad++ or notepad

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