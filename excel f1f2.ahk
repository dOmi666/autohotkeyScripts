#SuspendExempt
^!s::Suspend  ; Ctrl+Alt+S
#SuspendExempt False


#SingleInstance		; Only allows one instance of the script to run.
#HotIf WinActive("ahk_class XLMAIN")
{
f1::f2
}
return
