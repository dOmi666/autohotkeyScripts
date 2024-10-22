; Black Screen on MONITOR NO 1 monitor (make adjustments manual)


;for my taste 
;thats my resolutions
;i want to show it to MONITOR NO 1 Monitor
;this is my setup
;
;
;	_____________________		____________________
;	|					|		|					|
;	|					|		|					|
;	|					|		|					|
;	|					|		|					|
;	|___________________|		|___________________|
;	
;
;		MONITOR NO 2				MONITOR NO 1
;		2560 X 1080					1920 X 1080


; Create the gui splash screen


SysGet, MonitorName, MonitorName, %A_Index%
SysGet, Monitor, Monitor, %A_Index%
SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%

; only modify here
monitor_width :=2560
monitor_height :=1080

monitor2_width :=1920
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

gui, mon2: +LastFound +AlwaysOnTop
gui, mon2: Color, 000000
gui, mon2: -Caption +E0x20 +ToolWindow +LastFound ; Remove title bar and window borders
gui, mon2: Margin, 0, 0 ; Remove margins
gui, mon2: show, %start_point2% y0 %w2_pixels% %h2_pixels%
gui, mon2: Maximize
gui, mon2: Hide
;gui, mon2: Show, NoActivate
; Initialize the flag to indicate the visibility of the splash screen
Splash2Visible := 0








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


f1::Reload