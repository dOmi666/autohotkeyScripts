#SingleInstance,Ignore
SetTimer, Dim, off
Hotkey, *PGDN Up, , off
Hotkey, *PGUP Up, , off
DetectHiddenWindows, on
step = 5
DimLVL = 40
dim = 0
 
*Pause Up::
{
	if dim = 1
	{
		Hotkey, *Pause Up, , off
		Hotkey, *PGDN Up, , off
		Hotkey, *PGUP Up, , off
		SetTimer, tt, off
		SetTimer, aot, off
		dim = 0
		Gui,Destroy
		sleep 500
		ToolTip,
		Hotkey, *Pause Up, , on
		return
	}
	if dim = 0
	{
		Hotkey, *Pause Up, , off
		SetTimer, Dim, on
		SetTimer, aot, 1000
		dim = 1
		Hotkey, *Pause Up, , on
		Hotkey, *PGDN Up, , on
		Hotkey, *PGUP Up, , on
		return
	}
	return
}
 
*PGUP Up::
{
	DimLVL += %step%
	SetTimer, tt, off
	ttt = 50
	SetTimer, tt, 10
	SetTimer, edit, on
	return
}
*PGDN Up::
{
	DimLVL -= %step%
	SetTimer, tt, off
	ttt = 50
	SetTimer, tt, 10
	SetTimer, edit, on
	return
}
 
Dim:
{
	if DimLVL > 100
		DimLVL = 100
	Tempspeed = %DimLVL%
	Tempspeed *= 2.55
	editspeed = %Tempspeed%
	if editspeed > 255
		editspeed = 255
	Gui,Destroy
	Gui,color,000000
	Gui, -Caption +AlwaysOnTop +E0x20 +owner
	Gui,show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%,AHKLBGUIFSOVERLAY
	WinSet, Transparent, %editspeed%, AHKLBGUIFSOVERLAY
	SetTimer, Dim, off
	return
}
 
edit:
{
	Hotkey, *Pause Up, , off
	Hotkey, *PGDN Up, , off
	Hotkey, *PGUP Up, , off
	SetTimer, trans, on
	SetTimer, edit, off
	Hotkey, *Pause Up, , on
	Hotkey, *PGDN Up, , on
	Hotkey, *PGUP Up, , on
	return
}
 
trans:
{
	if DimLVL < 1
	{
		DimLVL = 0
	}
	if DimLVL > 100
		DimLVL = 100
	Tempspeed = %DimLVL%
	Tempspeed *= 2.55
	editspeed = %Tempspeed%
	if editspeed > 255
		editspeed = 255
	WinSet, Transparent, %editspeed%, AHKLBGUIFSOVERLAY
	SetTimer, trans, off
	return
}
tt:
{
	if DimLVL < 1
		DimLVL = 0
	if DimLVL > 100
		DimLVL = 100
	if ttt > 150
	{
		ToolTip,
		SetTimer, tt, off
		return
	}
	ttt += 1
	ToolTip, Current Brightness`:`n%DimLVL%`%
	return
}
 
aot:
{
	WinSet, AlwaysOnTop, on, AHKLBGUIFSOVERLAY
	return
}