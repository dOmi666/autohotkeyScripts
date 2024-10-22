#requires autohotkey v2.0

timetest := 1500
time := 1.44e+7
;this time should be in miliseconds

CapsLock & End::{
    Sleep(time)
    send "{Enter}"
	Sleep(1111)
	send "{Enter}"
	Sleep(1111)
	send "{Enter}"
}



;capslock & Home::{
;	Sleep(timetest)
;	msgbox("hurraa")
;}