;Beim drücken von INS, starte Script
Insert::
{
	;HILFSMETHODEN:
	;Guck, ob 95 vorliegt
	isntAFive()
	{
		
		;Should be 0xFEFEFE
		PixelGetColor, Var11, 1444, 142
		PixelGetColor, Var12, 1445, 142
		PixelGetColor, Var13, 1444, 143
		PixelGetColor, Var14, 1445, 143
		if (Var11 = 0xFEFEFE) and (Var12 = 0xFEFEFE) and (Var13 = 0xFEFEFE) and (Var14 = 0xFEFEFE)
		{
			return false
		}
		return true
	}
	;Guck, ob 96 vorliegt
	isntASix()
	{
		;Should be 0x2D2D2D
		PixelGetColor, Var21, 1442, 145
		;Should be 0x111111
		PixelGetColor, Var22, 1446, 141
		if (Var21 = 0x2D2D2D) and (Var22 = 0x111111)
		{
			return false
		}
		return true
	}
	;Guck, ob 97 vorliegt
	isntASeven()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var31, 1443, 142
		PixelGetColor, Var32, 1446, 145
		if (Var31 = 0xFEFEFE) and (Var32 = 0xFEFEFE)
		{
			return false
		}
		return true
	}
	;Guck, ob 98 vorliegt
	isntAEight()
	{
		;Should be 0x8B8B8B
		PixelGetColor, Var41, 1445, 144
		;Should be 0x2D2D2D
		PixelGetColor, Var42, 1443, 141
		if (Var41 = 0x8B8B8B) and (Var42 = 0x2D2D2D)
		{
			return false
		}
		return true
	}
	;Guck, ob 99 vorliegt
	isntANine()
	{
		;Should be 0x8B8B8B
		PixelGetColor, Var51, 1447, 144
		if (Var51 = 0x8B8B8B)
		{
			return false
		}
		return true
	}
	;Guck, ob 9X vorliegt
	isAStartingNine()
	{
		;Should be 0x8B8B8B
		PixelGetColor, Var51, 1441, 144
		if (Var51 = 0x8B8B8B)
		{
			return true
		}
		return false
		;FUNKTIONIERTE NICHT BEI "3/100"!!!!!
	}
	;Guck, ob 100 vorliegt
	isntHundred()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var51, 1447, 150
		if (Var51 = 0xFEFEFE)
		{
			return false
		}
		return true
	}
	;Guck, ob noch nix vorliegt
	isntEmpty()
	{
		;Should be 0xFEFEFE
		PixelGetColor, Var61, 1443, 146
		PixelGetColor, Var62, 1444, 146
		PixelGetColor, Var63, 1445, 146
		PixelGetColor, Var64, 1446, 146
		if (Var61 = 0xFEFEFE) and (Var62 = 0xFEFEFE) and (Var63 = 0xFEFEFE) and (Var64 = 0xFEFEFE)
		{
			return false
		}
		return true
	}
	;Warte für eine Zeit zwischen 0-n
	Zufallsschlaf(n)
	{
		Random, o, 0, n
		Sleep, o
	}
	
	;MAINLOOP:
	loop
	{
		;JumpLabel#Nochmal
		Nochmal:
		;Falls mind. 95, reload & verzögere um 500-800
		Click 340, 800
		Sleep, 500
		n := 0
		;Falls das Feld noch nicht geladen wurde, warte bis zu 1000ms
		while !isntEmpty()
		{
			Sleep, 100
			n := n+1
			if (n = 10)
			{
				goto, Nochmal
			}
		}
		;Falls eine Zahl unter 90 angezeigt wird, join
		if !isAStartingNine() and isntHundred()
		{
			Click 1580, 800
			SoundBeep 1800, 1000
			SoundBeep 2000, 1000
			SoundBeep 1600, 1000
			SoundBeep 1900, 600
			SoundBeep 2100, 600
			SoundBeep 1700, 600
			Pause
		}
		;Falls eine Zahl im Intervall [90,94] vorliegt, join
		if isAStartingNine() and isntAFive() and isntASix() and isntASeven() and isntAEight() and isntANine() and isntEmpty()
		{
			Click 1580, 800
			SoundBeep 1800, 1000
			SoundBeep 2000, 1000
			SoundBeep 1600, 1000
			SoundBeep 1900, 600
			SoundBeep 2100, 600
			SoundBeep 1700, 600
			Pause
		}
		;Falls 96, verzögere um +500-750
		if !isntASix()
		{
			Sleep, 500
			Zufallsschlaf(250)
		}
		;Falls 97, verzögere um +1000-1600
		if !isntASeven()
		{
			Sleep, 1000
			Zufallsschlaf(600)
		}
		;Falls 98, verzögere um +1500-2500
		if !isntAEight()
		{
			Sleep, 1500
			Zufallsschlaf(1000)
		}
		;Falls 99, verzögere um +3000-5000
		if !isntANine()
		{
			Sleep, 3000
			Zufallsschlaf(2000)
		}
		;Falls 100, verzögere um +5000-7500
		if !isntHundred()
		{
			Sleep, 5000
			Zufallsschlaf(2500)
		}
	}
	;Pausiere Script mit DEL, falls gewünscht
	;Hier kein Exit, da sonst das Script neu gestartet werden muss, statt neugeladen zu werden
	End::ExitApp
	Delete::Pause
}