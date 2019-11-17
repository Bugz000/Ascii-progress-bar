;____Usage___
;ProgressBar(Length, Current, Max, Unlock = 0)
;Unlock unlocks the length of the line
;it is optional - default to off (length is capped at 97 - optimised for Win7)

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
		return "[" progress "]" A_space round(percent) "%"
	}
	
	