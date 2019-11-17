;-----------------------------------EXAMPLES-----------------------------------

;____Usage___
;ProgressBar(Length, Current, Max, Unlock = 0)
;Unlock unlocks the length of the line
;it is optional - default to off (length is capped at 97 - optimised for Win7)

;______________Example 1______________
MaxValue := 50
loop %MaxValue%
	{
		sleep 50
		traytip, Progress - normal run, % ProgressBar(28, A_index, MaxValue) ;normal loop - no unlock
	}
	
;______________Example 2______________
MaxValue := 50
loop %MaxValue%
	{
		sleep 50
		traytip, Progress - length set to 999999, % ProgressBar(999999, A_index, MaxValue) ;length set too high - fault is dealt with
	}

;______________Example 3______________
MaxValue := 5
loop %MaxValue%
	{
		sleep 200
		traytip, Progress - short run time, % ProgressBar(28, A_index, MaxValue)
	}

;______________Example 4______________	
gui, font, s10, Letter Gothic ;monospace font - http://en.wikipedia.org/wiki/Samples_of_monospaced_typefaces
Gui, Add, Button, x12 y70 w580 h40 gGo, Button
Gui, Add, GroupBox, x12 y10 w570 h50 , Progress
Gui, Add, Text, x22 y30 w550 h20 r1 vText, Press the button
Gui, Show, x356 y521 h137 w607, Progress Demo - demonstrating length unlock
Return

Go:
MaxValue := 19
loop %MaxValue%
	{
		sleep 40
		GuiControl,, text, % ProgressBar(180, A_index, MaxValue, 1)
	}
GuiControl,, text, Complete. Press the button again :)
return

GuiClose:
ExitApp

;------------------------------------------------------------------------------
;-----------------------------------Function-----------------------------------
;------------------------------------------------------------------------------
ProgressBar(Length, Current, Max, Unlock = 0)
	{
		;Made by Bugz000 with assistance from tidbit, Chalamius and Bigvent
		Percent := (Current / Max) * 100
		if (unlock = 0)
			length := length > 97 ? 97 : length < 4 ? 4 : length
		percent := percent > 100 ? 100 : percent < 0 ? 0 : percent
		Loop % round(((percent / 100) * length), 0)
			Progress .= "|"
		loop % Length - round(((percent / 100) * length), 0)
			Progress .= A_Space
		return "[" progress "]" A_space round(percent, 2) "% Complete"
	}