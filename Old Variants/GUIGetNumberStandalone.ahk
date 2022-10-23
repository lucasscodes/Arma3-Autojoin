#SingleInstance
Gui, Add, Edit, x0 y-1 w35 h30
Gui, Add, UpDown, vMyUpDown +Range1-99, 95
Gui, Add, Button, x180 y-1 w65 h30 , Ok
Gui, Add, Text, x40 y-1 w125 h30 , Erste Zahl außerhalb des zulässigen Intervalls?

Global inputNumber := 0
Global buttonFlag := false

getNumberFromUser()
{
	Gui, Show, w244 h33, AutoJoin
	warteAufGUI:
	while(!buttonFlag)
	{
	}
	return
	ButtonOk:
	Gui, submit
	GuiControlGet, inputNumber,, MyUpDown
	Gui, destroy
	buttonFlag = true
	return
	
}
getNumberFromUser()
OutputDebug, %inputNumber%
Pause
