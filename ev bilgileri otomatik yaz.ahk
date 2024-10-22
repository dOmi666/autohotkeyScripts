#requires autohotkey v2.0
CapsLock & f12::reload
TraySetIcon "Shell32.dll", 318
; CTRL (^) + ALT (!) + SHIFT (+) f12
; Copy the text to the clipboard and paste it immediately when is pressed
^!+F12::
{
    clipboard_backup:= A_Clipboard
    ; Set the text to the clipboard with a single line assignment for readability
    A_Clipboard := "
        (
        - 3 oda + 1 salon ve 130 m² 2,950,000 TL
- Ön cephe geniş ve ferah olup bol ışık almaktadır.
- Bina 8 yıllıktır.
- Çatıda sandviç panel bulunmakta olup rutubet, ısı kaybı gibi problem yoktur.
- Isıtma doğalgaz kombi ile yapılmaktadır.
- 2 adet tuvalet mevcuttur.
- Asansör mevcut olup 10 kişiliktir (800 kg).
- Yanı başında Kuş Cenneti Parkı ve Egemenlik parkı vardır.
- Efeler Orta Okulu'na ve Efeler Anadolu Lisesi'ne 200m uzaklıktadır.
- Bulvara 550m, Bulvar meydana 750m, TCDD Gar 950m, Forum 1km mesafede bulunmaktadır.
- Eve 50m uzaklıkta Şok market mevcuttur.
- Semt pazarı direkt evin altına kurulmaktadır.
- Aydın dolmuş hatları önünden geçmektedir.
- Görüntülü diyafon sistemi mevcuttur.
- Arka cephede balkonu mevcut olup pimapen ile kapatılmıştır.
- Odalardan birinde gömme dolap mevcuttur.
- Mevcut durumda evde kiracı bulunmaktadır.
- İlandaki konum doğru ve tam olarak verilmiştir.
- HİÇBİR emlakçıya itibar etmeyiniz, emlakçıdan değil sahibinden satılıktır. Dolayısı ile size satış esnasında "alış parası, aracı, middleman, komisyon ücreti" gibi ücretler çıkmayacaktır. Bizzat sahibi olarak satıyorum ve hiçbir emlakçı ile de anlaşmam YOKTUR.
- TAKAS YOKTUR.
- Açıklamadaki bilgiler yetersiz geldiyse ya da detaylı bilgi almak isterseniz ilandaki numarayı yani 0505 288 4866 arayınız.
- https://www.sahibinden.com/ilan/emlak-konut-satilik-sahibinden-3-plus1satilik-130m-tekstil-blv-sok-yani-semt-pazarinda-1194788415/detay/
- Sahibinden com ilan no: 1194788415

        )"

    ; Wait for the clipboard to contain the new text (ensures it’s correctly set)
    ClipWait

    ; Paste the clipboard content
    Send("^v")
	sleep 200
    A_Clipboard := clipboard_backup
    return
}

