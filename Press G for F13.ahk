TrayTip "Çıkış için Caps Lock + Alt Gr ", "kombinasyonunu kullanın"
SetTimer HideTrayTip, -5000

HideTrayTip() {
    TrayTip
}

;creates f13 keybinds 
;press G for F13
G::
send {f13}
return

/* COMMENT TEST BAŞLANGIÇ
a & o::
reload
return



a & i::
MsgBox "This is a string."
return

a & j::
MsgBox "This is a string."
return

COMMENT TEST BİTİŞ 
*/



CapsLock & RAlt::
exitapp
