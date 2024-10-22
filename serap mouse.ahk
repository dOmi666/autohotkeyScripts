Listlines off
#keyhistory 0
Msgbox, 0, DURUM, PROGRAM AKTİF, 5
loop, 9999
{
mousemove, 5, 5, 100, R
sleep, 1000
mousemove, -6, -6, 100, R
sleep, 10000
}
Insert::
Msgbox, 4, ?? PROGRAMI KAPAT ??, Programı devredışı bırakmak istiyor musunuz? Tekrardan çalıştırmak gerekecektir, 5

IfMsgBox, Yes
	{MsgBox  program devre dışı
	ExitApp
return
}
IfMsgBox, No
{
	Msgbox üzülmüştüm. Otomatik fare devam ediyor. 
return
}