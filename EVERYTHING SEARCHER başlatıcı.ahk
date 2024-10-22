;win key + A & Winkey + Q starts Everything
{
#A:: Goto Everything
#Q:: Goto Everything

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