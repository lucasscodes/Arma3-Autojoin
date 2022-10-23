;Nie zweimal gleichzeitig laufen
#SingleInstance force

;Lade alle Teile fürs GUI
Gui, Add, Edit, x0 y-1 w35 h30
Gui, Add, UpDown, vMyUpDown +Range1-99, 95
Gui, Add, Button, x180 y-1 w65 h30 , Ok
Gui, Add, Text, x40 y-1 w125 h30 , Erste Zahl außerhalb des zulässigen Intervalls?
Global inputNumber := 0
Global buttonFlag := false
;Deklariere GUI-Verhalten
getNumberFromUser()
{
	Gui, Show, w244 h33, AutoJoin
	warteAufGUI:
	while(!buttonFlag)
	{
	}
	return
	;Bei ButtonClick tue folgendes
	ButtonOk:
	;Trage alle Werte in den Speicher ein
	Gui, submit
	;Trage einen Speicherwert in eine globale Variable ein
	GuiControlGet, inputNumber,, MyUpDown
	;Lösche das GUI
	Gui, destroy
	global x := inputNumber
	buttonFlag = true
	return
	GuiClose:
	ExitApp
}
;Führe GUI aus
getNumberFromUser()

;Beim drücken von INS, starte Script
^Insert::
{
	;HILFSMETHODEN:
	;Guck, ob X1 vorliegt
	isAOne()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var1, 1446, 141
		PixelGetColor, Var2, 1446, 142
		if (Var1 = 0xFEFEFE) and (Var2 = 0xFEFEFE)
		{
			return true
		}
		return false
	}
	;Guck, ob X2 vorliegt
	isATwo()
	{
		;Should be 0xC7C7C7
		PixelGetColor, Var1, 1447, 142
		PixelGetColor, Var2, 1447, 143
		if (Var1 = 0xC7C7C7) and (Var2 = 0xC7C7C7)
		{
			return true
		}
		return false
	}
	;Guck, ob X3 vorliegt
	isAThree()
	{
		;Should be 0xC7C7C7
		PixelGetColor, Var1, 1447, 146
		;Should be 0x8B8B8B
		PixelGetColor, Var2, 1447, 147
		;Should be 0xC7C7C7
		PixelGetColor, Var3, 1447, 148
		if (Var1 = 0xC7C7C7) and (Var2 = 0x8B8B8B) and (Var3 = 0xC7C7C7)
		{
			return true
		}
		return false
	}
	;Guck, ob X4 vorliegt
	isAFour()
	{
		;Should be 0x2D2D2D
		PixelGetColor, Var1, 1446, 141
		if (Var1 = 0x2D2D2D)
		{
			return true
		}
		return false
	}
	;Guck, ob X5 vorliegt
	isAFive()
	{
		
		;Should be 0xFEFEFE
		PixelGetColor, Var1, 1444, 142
		PixelGetColor, Var2, 1445, 142
		PixelGetColor, Var3, 1444, 143
		PixelGetColor, Var4, 1445, 143
		if (Var1 = 0xFEFEFE) and (Var2 = 0xFEFEFE) and (Var3 = 0xFEFEFE) and (Var4 = 0xFEFEFE)
		{
			return true
		}
		return false
	}
	;Guck, ob X6 vorliegt
	isASix()
	{
		;Should be 0x2D2D2D
		PixelGetColor, Var1, 1442, 145
		;Should be 0x111111
		PixelGetColor, Var2, 1446, 141
		if (Var1 = 0x2D2D2D) and (Var2 = 0x111111)
		{
			return true
		}
		return false
	}
	;Guck, ob X7 vorliegt
	isASeven()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var1, 1443, 142
		PixelGetColor, Var2, 1446, 145
		if (Var1 = 0xFEFEFE) and (Var2 = 0xFEFEFE)
		{
			return true
		}
		return false
	}
	;Guck, ob X8 vorliegt
	isAEight()
	{
		;Should be 0x8B8B8B
		PixelGetColor, Var1, 1445, 144
		;Should be 0x2D2D2D
		PixelGetColor, Var2, 1443, 141
		if (Var1 = 0x8B8B8B) and (Var2 = 0x2D2D2D)
		{
			return true
		}
		return false
	}
	;Guck, ob X9 vorliegt
	isANine()
	{
		;Should be 0x8B8B8B
		PixelGetColor, Var1, 1447, 144
		if (Var1 = 0x8B8B8B)
		{
			return true
		}
		return false
	}
	;Guck, ob X0 vorliegt
	isAZero()
	{
		;Should be 0x5E5E5E
		PixelGetColor, Var1, 1443, 144
		PixelGetColor, Var2, 1443, 145
		PixelGetColor, Var3, 1443, 146
		if (Var1 = 0x5E5E5E) and (Var2 = 0x5E5E5E) and (Var3 = 0x5E5E5E)
		{
			return true
		}
		return false
	}
	;TODOGuck, ob 1X vorliegt
	isAStartingOne()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var1, 1440, 141
		PixelGetColor, Var2, 1440, 142
		if (Var1 = 0xFEFEFE) and (Var2 = 0xFEFEFE)
		{
			return true
		}
		return false
	}
	;Guck, ob 2X nicht vorliegt
	isAStartingTwo()
	{
		;Should be 0xC7C7C7
		PixelGetColor, Var1, 1441, 142
		PixelGetColor, Var2, 1441, 143
		if (Var1 = 0xC7C7C7) and (Var2 = 0xC7C7C7)
		{
			return true
		}
		return false
	}
	;Guck, ob 3X nicht vorliegt
	isAStartingThree()
	{
		;Should be 0xC7C7C7
		PixelGetColor, Var1, 1441, 146
		;Should be 0x8B8B8B
		PixelGetColor, Var2, 1441, 147
		;Should be 0xC7C7C7
		PixelGetColor, Var3, 1441, 148
		if (Var1 = 0xC7C7C7) and (Var2 = 0x8B8B8B) and (Var3 = 0xC7C7C7)
		{
			return true
		}
		return false
	}
	;Guck, ob 4X nicht vorliegt
	isAStartingFour()
	{
		;Should be 0x010101
		PixelGetColor, Var1, 1436, 147
		PixelGetColor, Var2, 1437, 147
		PixelGetColor, Var3, 1438, 147
		PixelGetColor, Var4, 1439, 147
		PixelGetColor, Var5, 1440, 147
		if (Var1 = 0x010101) and (Var2 = 0x010101) and (Var3 = 0x010101) and (Var4 = 0x010101) and (Var5 = 0x010101)
		{
			return true
		}
		return false
		;FUNKTIONIERTE MIT "9X" NICHT BEI "3/100"!!!!!
		;JETZT BEI "6X" NOCH UNGETESTET
	}
	;Guck, ob nicht 5X vorliegt
	;Zahl liegt bei X=[1436,1441] statt X=[1442,1447]
	isAStartingFive()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var61, 1438, 142
		PixelGetColor, Var62, 1438, 143
		PixelGetColor, Var63, 1439, 142
		PixelGetColor, Var64, 1439, 143
		if (Var71 = 0xFEFEFE) and (Var72 = 0xFEFEFE) and (Var73 = 0xFEFEFE) and (Var74 = 0xFEFEFE)
		{
			return true
		}
		return false
	}
	;Guck, ob 6X vorliegt
	;Zahl liegt bei X=[1436,1441] statt X=[1442,1447]
	isAStartingSix()
	{
		;Should be 0x2D2D2D and 0x111111
		PixelGetColor, Var61, 1436, 145
		PixelGetColor, Var62, 1440, 141
		if (Var61 = 0x2D2D2D) and (Var62 = 0x111111)
		{
			return true
		}
		return false
		;FUNKTIONIERTE MIT "9X" NICHT BEI "3/100"!!!!!
		;JETZT BEI "6X" NOCH UNGETESTET
	}
	;Guck, ob 7X vorliegt
	isAStartingSeven()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var71, 1437, 142
		PixelGetColor, Var72, 1440, 145
		if (Var71 = 0xFEFEFE) and (Var72 = 0xFEFEFE)
		{
			return true
		}
		return false
		;FUNKTIONIERTE MIT "9X" NICHT BEI "3/100"!!!!!
	}
    ;Guck, ob 8X vorliegt
	;Zahl liegt bei X=[1436,1441] statt X=[1442,1447]
	isAStartingEight()
	{
		;Should be 0x8B8B8B and 0x2D2D2D
		PixelGetColor, Var71, 1439, 144
		PixelGetColor, Var72, 1437, 141
		if (Var71 = 0x8B8B8B) and (Var72 = 0x2D2D2D)
		{
			return true
		}
		return false
	}
	;Guck, ob 9X vorliegt
	isAStartingNine()
	{
		;Should be 0x8B8B8B
		PixelGetColor, Var51, 1441, 144
		PixelGetColor, Var52, 1441, 145
		if (Var51 = 0x8B8B8B) and (Var52 = 0x8B8B8B)
		{
			return true
		}
		return false
	}
	;Guck, ob X/ vorliegt
	hasOneDigit()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var51, 1441, 150
		if (Var51 = 0xFEFEFE)
		{
			return false
		}
		return true
	}
	;Guck, ob XX/ vorliegt
	hasTwoDigits()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var51, 1447, 150
		if (Var51 = 0xFEFEFE)
		{
			return false
		}
		return true
	}
	;Guck, ob XX/ vorliegt
	hasThreeDigits()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var51, 1453, 150
		if (Var51 = 0xFEFEFE)
		{
			return false
		}
		return true
	}
	;Guck, ob noch nix vorliegt
	isEmpty()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var61, 1443, 146
		PixelGetColor, Var62, 1444, 146
		PixelGetColor, Var63, 1445, 146
		PixelGetColor, Var64, 1446, 146
		if (Var61 = 0xFEFEFE) and (Var62 = 0xFEFEFE) and (Var63 = 0xFEFEFE) and (Var64 = 0xFEFEFE)
		{
			return true
		}
		return false
	}
	;Warte für eine Zeit zwischen 0-n
	Zufallsschlaf(n)
	{
		Random, o, 0, n
		Sleep, o
	}
	;Liefert die erste Zahl
	getFirstDigit(n)
	{
		Nichtgefunden:
		if (n >= 8) and (isAStartingNine())
		{
			return 9
		}
		else if(n >= 8)
		{
			n := 10
		}
		if (n >= 7) and (isAStartingEight())
		{
			return 8
		}
		else if(n >= 7)
		{
			n := 10
		}
		if (n >= 6) and (isAStartingSeven())
		{
			return 7
		}
		else if(n >= 6)
		{
			n := 10
		}
		if (n >= 5) and (isAStartingSix())
		{
			return 6
		}
		else if(n >= 5)
		{
			n := 10
		}
		if (n >= 4) and (isAStartingFive())
		{
			return 5
		}
		else if(n >= 4)
		{
			n := 10
		}
		if (n >= 3) and (isAStartingFour())
		{
			return 4
		}
		else if(n >= 3)
		{
			n := 10
		}
		if (n >= 2) and (isAStartingThree())
		{
			return 3
		}
		else if(n >= 2)
		{
			n := 10
		}
		if (n >= 1) and (isAStartingTwo())
		{
			return 2
		}
		else if(n >= 1)
		{
			n := 10
		}
		if isAStartingOne()
		{
			return 1
		}
		else
		{
			n := 10
			r := 1
			Goto, Nichtgefunden
		}
		;fange lesefehler ab
		if(r = 1)
		{
			return (x/10)+1
		}
	}
	;TODOLiefert die ganze Zahl
	getShownNumber()
	{
		;DEBUG SLEEPS!!!!
		;Sleep, 1
		;Sleep, 2500
		if hasOneDigit()
		{
			return getFirstDigit(x/10)
		}
		else
		{
			if hasTwoDigits()
			{
				u := Mod(x,10)
				nichtGefunden1:
				if (u >= 9) and (isANine())
				{
					z := 9
					Goto, gefunden
				}
				else if(u = 9)
				{
					u := 10
				}
				if (u >= 8) and (isAEight())
				{
					z := 8
					Goto, gefunden
				}
				else if(u = 8)
				{
					u := 10
				}
				if (u >= 7) and (isASeven())
				{
					z := 7
					Goto, gefunden
				}
				else if(u = 7)
				{
					u := 10
				}
				if (u >= 6) and (isASix())
				{
					z := 6
					Goto, gefunden
				}
				else if(u = 6)
				{
					u := 10
				}
				if (u >= 5) and (isAFive())
				{
					z := 5
					Goto, gefunden
				}
				else if(u = 5)
				{
					u := 10
				}
				if (u >= 4) and (isAFour())
				{
					z := 4
					Goto, gefunden
				}
				else if(u = 4)
				{
					u := 10
				}
				if (u >= 3) and (isAThree())
				{
					z := 3
					Goto, gefunden
				}
				else if(u = 3)
				{
					u := 10
				}
				if (u >= 2) and (isATwo())
				{
					z := 2
					Goto, gefunden
				}
				else if(u = 2)
				{
					u := 10
				}
				if (isAOne())
				{
					z := 1
					Goto, gefunden
				}
				else
				{
					u := 10
					Goto, nichtGefunden1
				}
				gefunden:
				return (getFirstDigit(x/10)*10)+z
			}
			else
			{
				if hasThreeDigits()
				{
					return 100
				}
			}
		}
	}
	;Überprüft ob wirklich der Platz frei war
	überprüfeJoin()
	{
		joinWaiter := 0
		while(joinWaiter != 70)
		{
			joinWaiter := joinWaiter+1
			Sleep, 500
			if(Mod(joinWaiter,10) == 0)
			{
				SoundBeep, 600, 25
			}
			if(fehlgeschlagen())
			{
				Click 690, 500
				Sleep, 1000
				return
			}
		}
		SoundBeep, 300, 300
		ExitApp
	}
	;Gucke ob Join fehlgeschlagen ist
	;Ausrichtung vom Meldungsfenster ist wie folgt:
	;LinksUnten der grüne Balken ist Var2 
	fehlgeschlagen()
	{
		;Should be 0x368921
		PixelGetColor, Var1, 623, 375
		;Should be 0x4B4D4E
		PixelGetColor, Var10, 671, 517
		;Should be 0x494B4B
		PixelGetColor, Var11, 702, 517
		;Should be 0x368921
		PixelGetColor, Var2, 623, 385
		;Should be 0x737373
		PixelGetColor, Var3, 647, 412
		PixelGetColor, Var4, 647, 413
		;Should be 0xA6A6A6
		PixelGetColor, Var5, 672, 432
		;Should be 0xD2D2D2
		PixelGetColor, Var6, 718, 437
		PixelGetColor, Var7, 756, 415
		;Should be 0xFEFEFE
		PixelGetColor, Var8, 635, 506
		PixelGetColor, Var9, 670, 517
		
		if (Var1 = 0x368921) and (Var2 = 0x368921) and (Var3 = 0x737373) and (Var4 = 0x737373) and (Var5 = 0xA6A6A6) and (Var6 = 0xD2D2D2) and (Var7 = 0xD2D2D2) and (Var8 = 0xFEFEFE) and (Var9 = 0xFEFEFE) and (Var10 = 0x4B4D4E) and (Var11 = 0x494B4B)
		{
			return true
		}
		else
		{
			return false
		}
		
	}
	
	
	;MAINLOOP:
	{
		;JumpLabel#Nochmal
		Nochmals:
		;(Falls mind. x)Reload & verzögere um 500
		Click 340, 800
		n := 0
		Sleep, 100
		;Falls das Feld noch nicht geladen wurde, warte bis zu 5000ms
		while isEmpty()
		{
			Sleep, 50
			n := n+1
			if (n = 18)
			{
				goto, Nochmals
			}
		}
		Nummer := getShownNumber()
		
		;Falls eine Zahl unter x angezeigt wird, join
		if (Nummer < x)
		{
			Click 1580, 800
			Sleep, 2000
			überprüfeJoin()
			Goto, Nochmals
		}
		;Falls x+2, verzögere um +250-500
		if (Nummer = x+2)
		{
			Sleep, 250
			Zufallsschlaf(250)
		}
		;Falls x+mind3 verzögere um +1000-1600
		if (Nummer >= x+3)
		{
			Sleep, 1000
			Zufallsschlaf(600)
		}
		goto, Nochmals
	}
	;Pausiere Script mit DEL
	^Delete::Pause
	;Beende Autohotkey mit END
	^End::ExitApp
}