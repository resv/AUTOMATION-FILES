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


----------------------------------------------------------------------------------------------------------------------
;UPLOAD SCRIPTS

<!1::
Send {Home}
Sleep 300
MouseMove, 1902, 1019
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 37, 370
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 434, 257
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 1158, 529
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1500
Send, +{TAB 2}
Sleep 500
Send {Home}
Sleep 100
Send, {Enter}
Sleep, 3000
;FILLING OUT PROPERTIES
Send, {TAB 4}
Send, {SPACE}
Send, {TAB 4}
Send, No Fault Application
Send, {TAB}
Send, {TAB 2}
Send, {SPACE}
Send, {TAB 2}
Send, {SPACE}
Send, {TAB 8}
Send, NF2
Send, {TAB}
Send, {ENTER}
Sleep 500
MouseMove, 305, 411
Send {Rbutton down}
Sleep 50
Send {Rbutton up}
Sleep 500
MouseMove, 375, 551
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500



RETURN



;EMERGENCY STOP SCRIPTS, L-ALT + R is the best way to stop script and refresh it at the same time. PAUSE VIA ESCAPE KEY IS INFERIOR

;Esc::ExitApp  ; Exit script with Escape key, currently commented out and using pause for easy editing
Esc::Pause    ; Pause script with Ctrl+Alt+P
!r::Reload   ; Reload script with Ctrl+Alt+R
