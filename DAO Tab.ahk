#Persistent			; This keeps the script running permanently.
#SingleInstance		; Only allows one instance of the script to run.

#IfWinActive, Dragon Age: Origins

state:=0

$Tab::
state:= !state
if state
Send {TAB down}
else
Send {TAB Up}
return



return