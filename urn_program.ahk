#requires autohotkey v2.0
#Include urn_movements.ahk

CapsLock & RAlt::ExitApp

; Global değişkenleri tanımlama
global ing1:=0, ing2:=0, output_degree:=0, loopman := false

MyGui := Gui(, "Auto Urn Mixer")
inform := MyGui.Add("Text", "w300 h100 c181818","")
inform.SetFont("bold s15","Bahnschrift")

statictext := MyGui.Add("text","h50", "Select what do you want to prepare for autoclick macro")
statictext.SetFont("s12", "Verdana")

statictext2 := MyGui.Add("text","h42 w250", " ")
statictext2.SetFont("bold s12 cgreen", "Verdana")

statictext3 := MyGui.Add("text","h42 w250", " ")
statictext3.SetFont("s10 c154f75", "bahnschrift")

statictext4 := MyGui.Add("text","h42 w250", " ")

lunargent := "1 Lunargent =`n10 moon Dusts`n+`n1 Quicksilver"
moon_dust := "1 Moon Dust =`n10 Moonstone Shards`n+`n1 Volcanic Ash"
hellfire_oil := "1 Hellfire Oil =`n1 Fire Essence`n+`n1 Demonic Essence"
fire_essence := "1 Fire Essence =`n10 Magma Dusts`n+`n1 Sulfur"
magma_dust := "1 Magma Dust =`n10 Lava Stones`n+`n1 Volcanic Ash"
demonic_essence := "1 Demonic Essence =`n10 Demonplasms`n+`n1 Sulfur"
demonplasm := "1 Demonplasm =`n10 Demon Bloods`n+`n1 Blood Root"
pure_silver := "1 Pure Silver =`n1Lunargent`n+`n1 Quicksilver"

product := MyGui.Add("DropDownList", "R10 choose2", ["Lunargent", "Moon Dust", "Pure Silver", "Hellfire Oil", "Fire Essence","Magma Dust", "Demonic Essence", "Demonplasm"])
degree_str := MyGui.Add("DropDownList", "R10 choose1", ["#1 100% 1 qty", "#2 33% 3 qty", "#3 20% 5 qty"])
Btn_rdy := MyGui.Add("Button", "w110", "I'm Ready").OnEvent("click", funcx)

MyGui.Show()

funcx(*) {
    global ing1, ing2, output_degree  ; Değişkenleri global olarak tanımla

    selected := product.Text

    switch(selected) {
        case "Lunargent":
            inform.text := lunargent
            ing1 := y_moondust
            ing2 := y_quicksilver
        case "Moon Dust":
            inform.text := moon_dust
            ing1 := y_moonstoneshard
            ing2 := y_volcanicash
        case "Hellfire Oil":
            inform.text := hellfire_oil
            ing1 := y_fireessence
            ing2 := y_demonicessence
        case "Fire Essence":
            inform.text := fire_essence
            ing1 := y_magmadust
            ing2 := y_sulfur
        case "Magma Dust":
            inform.text := magma_dust
            ing1 := y_lavastone
            ing2 := y_volcanicash
        case "Demonic Essence":
            inform.text := demonic_essence
            ing1 := y_demonplasm
            ing2 := y_sulfur
        case "Demonplasm":
            inform.text := demonplasm
            ing1 := y_demonblood
            ing2 := y_bloodroot
        case "Pure Silver":
            inform.text := pure_silver
            ing1 := y_lunargent
            ing2 := y_quicksilver
    }

    degree_selected := degree_str.Text 
    switch (degree_selected) {
        case "#1 100% 1 qty":
            statictext4.text := "100% success rate"
            output_degree := y_1deg
        case "#2 33% 3 qty":
            statictext4.text := "33% success rate"
            output_degree := y_2deg
        case "#3 20% 5 qty":
            statictext4.text := "20% success rate"
            output_degree := y_3deg
    }

    statictext2.text := "When ready use shortcut key Ctrl Alt S"
    statictext3.text := "Move mouse on Wyrm's Blood on quest tab"

    if (statictext4.text == "100% success rate") {
        statictext4.SetFont("s9 c057e4e", "Bahnschrift")  ; Green color for 100% success rate
    } else {
        statictext4.SetFont("s9 cff0000", "Bahnschrift")  ; Red color for less than 100%
    }
}

;this is my func
;make_mix(ing1, ing2, output_degree)

#hotif WinActive("AHK_exe l2.exe")
	; Toggle loop activation with Ctrl+Alt+S
	^!s:: {
		global loopman
		loopman := !loopman
		if (loopman) {
			SetTimer(LoopFunc,500)
		} else {
			SetTimer(LoopFunc, 0)
		}
	}

	LoopFunc() {
		global ing1, ing2, output_degree
		make_mix(ing1, ing2, output_degree)
	}