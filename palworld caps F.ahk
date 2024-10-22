#Requires AutoHotkey v2.0

#HotIf WinActive("ahk_exe Palworld-Win64-Shipping.exe") 
	CapsLock:: 
	{
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