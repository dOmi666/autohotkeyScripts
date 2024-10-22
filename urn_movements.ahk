#requires autohotkey v2.0

; correct order of algorithm is (always start mouse cursor on wyrm blood)
; 1) First ingredient (wyrm blood, lavastone, moonstone shard, ... , lunargent)
; 2) Next Step
; 3) Second ingredient (blood root, volcanic ash, ... , Midnight Oil)
; 4) Next Step
; 5) choose degree (salamander, Ifrit, Phoenix)
; 6) Mix ingredients
; 7) Prepare to new (mix a new reagent)


; Fare hareketi ve tıklama fonksiyonları
RelativeMouseMove(x, y) {
    MouseMove x, y,, "Relative"
}

RelativeMouseClick() {
    MouseClick "Left"
}

; Diğer değişken ve fonksiyon tanımlamaları buraya gelecek

;reference points
{
y_start := 0
y_nextstep := -28
y_mix := -28

;FIRST PAGE Y COORDINATES RELATIVE
y_wyrmblood := 0
y_lavastone := 28
y_moonstoneshard := 56
y_rottenbonepiece := 84
y_demonblood := 112
y_inferniumore := 140
y_dracoplasm := 168
y_magmadust := 196
y_moondust := 224
y_necroplasm := 252
;navigate bottom

y_demonplasm := 177
y_infernodust := 205
y_fireessence := 233
y_lunargent := 261

;SECOND PAGE Y COORDINATES RELATIVE

y_bloodroot := 0
y_volcanicash := 28
y_quicksilver := 56
y_sulfur := 84
y_demonicessence := 112
y_midnightoil := 140

; DEGREES

y_1deg := -28 ;salamander
y_2deg := 0 ;ifrit
y_3deg := 28 ;phoenix
}

;waiting to come Quest window
delay(){
    sleep 300
}

; for safety moving
delaymove(){
    sleep 20
}

navigate_to_down(){
    loop 5{
        send "{WheelDown}"
    }
}

make_mix(ing1, ing2, degree){
    BlockInput "MouseMove"
    sleep 500
    ; first ingredient 
    if (ing1 = y_demonplasm or ing1 = y_infernodust or ing1 = y_fireessence or ing1 = y_lunargent ){
        delay()
        navigate_to_down()
        delay()
        RelativeMouseMove(0, (y_start + ing1))
        delaymove()
        RelativeMouseClick()
        delay()
    }
    else{
        RelativeMouseMove(0, (y_start + ing1))
        delaymove()
        RelativeMouseClick()
        delay()
    }

    ; back to start position
    RelativeMouseMove(0, -ing1)
    delaymove()

    ; next step
    RelativeMouseMove(0, (y_start + y_nextstep))
    delaymove()
    RelativeMouseClick()
    delay()

    ; back to start position
    RelativeMouseMove(0, -y_nextstep)
    delaymove()

    ; second ingredient
    RelativeMouseMove(0, (y_start + ing2))
    delaymove()
    RelativeMouseClick()
    delay()

    ; back to start position
    RelativeMouseMove(0, -ing2)
    delaymove()

    ; next step
    RelativeMouseMove(0, (y_start + y_nextstep))
    delaymove()
    RelativeMouseClick()
    delay()

    ; back to start position
    RelativeMouseMove(0, -y_nextstep)
    delaymove()

    ; choose degree
    RelativeMouseMove(0, (y_start + degree))
    delaymove()
    RelativeMouseClick()
    delay()

    ; back to start position
    RelativeMouseMove(0, -degree)
    delaymove()

    ; mix ingredients
    RelativeMouseMove(0, (y_start + y_mix))
    delaymove()
    RelativeMouseClick()
    delay()

    ; back to start position
    RelativeMouseMove(0, -y_mix)
    delaymove()

    ; prepare new screen
    RelativeMouseMove(0, (y_start + y_mix))
    delaymove()
    RelativeMouseClick()
    delay()

    ; back to start position
    RelativeMouseMove(0, -y_mix)
    delaymove()

    BlockInput "MouseMoveOff"
}

