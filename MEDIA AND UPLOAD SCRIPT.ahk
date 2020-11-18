#Persistent
#InstallKeybdHook
#InstallMouseHook

;VOLUME UP WILL SCROLL WINDOW DOWN
Volume_Up::
Send {WheelDown}
Sleep, 75
Return
;

;VOLUME DOWN WILL SCROLL WINDOW DOWN
Volume_Down::
Send {WheelUp}
Sleep, 75
Return
;


; VOLUME MUTE BUTTON WILL TOGGLE DESKTOP 1 or DESKTOP 2 (must create desktop2 first)
toggle	:= 0
Return
Volume_Mute::
MButton::
	if (toggle = 0){
		send {LWin down}{LCtrl down}{Right}{LCtrl up}{LWin up}
		toggle := 1
	}
	else{
		send {LWin down}{LCtrl down}{Left}{LCtrl up}{LWin up}
		toggle := 0
	}
return
;




;For Volume Mute button to copy // CURRENTLY NOT USING
;Volume_Mute::
;send, ^c
;Return
;

;For ~ + ESC + Volume Mute button to paste // CURRENTLY NOT USING
;~esc & Volume_Mute::
;send, ^v
;Return
;