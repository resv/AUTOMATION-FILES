#Persistent
#InstallKeybdHook
#InstallMouseHook

;EMERGENCY STOP SCRIPTS, L-ALT + R is the best way to stop script and refresh it at the same time.

;Esc::ExitApp  ; Exit script with Escape key, currently commented out and using pause for easy editing
Esc::Pause    ; Pause script with Alt+ESC
!r::Reload   ; Reload script with Alt+R

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

;NF 2 UPLOAD
<!1::
Send {Home}
Sleep 300
MouseMove, 1902, 1018
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 37, 370
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 2000
MouseMove, 434, 257
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1000
MouseMove, 1158, 529
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1500
Send, +{TAB 2}
Sleep 500
Send {End}
Sleep 500
Send {Home}
Sleep 500
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
Sleep 2000
MouseMove, 350, 400
Send {Rbutton down}
Sleep 500
Send {Rbutton up}
Sleep 800
MouseMove, 500, 550
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 106, 1019
Sleep 2500
Send {Lbutton down}
Sleep 500
Send {Lbutton up}
Sleep 5000
Send {PgDn}
Sleep 500
Send {PgDn}
Sleep 500
Send {PgDn}
Sleep 500
Send ^w
MouseMove, 1902, 1018
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
return

;Billing
<!2::
send, ^c
ClipWait
global BillingProvider := clipboard
Send {Home}
Sleep 300
MouseMove, 1902, 1018
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 37, 370
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 2000
MouseMove, 434, 257
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1000
MouseMove, 1158, 529
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1500
Send, +{TAB 2}
Sleep 500
Send {End}
Sleep 500
Send {Home}
Sleep 500
Send, {Enter}
Sleep, 3000
;FILLING OUT PROPERTIES
Send, {TAB 4}
Send, {SPACE}
Send, {TAB 4}
Send, Billing
Send, {TAB}
Send, {TAB 2}
Send, {SPACE}
Send, {TAB 2}
Send, {SPACE}
Send, {TAB 8}
Send, BILLING - %BillingProvider%
Sleep 100
Send, {TAB}
Sleep 1000
Send, {ENTER}
Sleep 3000
MouseMove, 350, 400
Send {Rbutton down}
Sleep 500
Send {Rbutton up}
Sleep 800
MouseMove, 500, 550
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 106, 1019
Sleep 2500
Send {Lbutton down}
Sleep 500
Send {Lbutton up}
Sleep 500
Send {PgDn}
Sleep 500
Send {PgDn}
Sleep 500
Send {PgDn}
Sleep 500
Send ^w
MouseMove, 1902, 1018
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500


<!v::
Secs := 20
SetTimer, CountDown, 1000
MsgBox, 1, System Shutdown, Allow Auto Shutdown in %Secs%?, %Secs%
SetTimer, CountDown, Off
/*
IfMsgBox Ok
  Shutdown, 8
*/
Return

CountDown:
Secs -= 1
ControlSetText,Static1,Allow Auto Shutdown in %Secs%?,System Shutdown ahk_class #32770
Return
