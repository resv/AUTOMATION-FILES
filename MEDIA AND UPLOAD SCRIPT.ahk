#Persistent
#InstallKeybdHook
#InstallMouseHook

global DATE = %A_MM%/%A_DD%/%A_YYYY%

FormatTime, CurrentDateTime,, MM/dd/yy
ToggleBold := ^b
ToggleUnderline := ^u

;EMERGENCY STOP SCRIPTS, L-ALT + R is the best way to stop script and refresh it at the same time.

;Esc::ExitApp  ; Exit script with Escape key, currently commented out and using pause for easy editing
Esc::Pause    ; Pause script with Alt+ESC
!r::Reload   ; Reload script with Alt+R

-----------------------------
;FOCUS SA NOTES
FocusSANotes()
	{
		WinActivate, Case Summary,,,
		Sleep 300
		return
	}
----------------------------


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
Sleep 2500
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
Sleep 1500
MouseMove, 350, 400
Send {Rbutton down}
Sleep 300
Send {Rbutton up}
Sleep 500
MouseMove, 500, 550
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 106, 1019
Sleep 2000
Send {Lbutton down}
Sleep 500
Send {Lbutton up}
Sleep 1000
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
Secs := 3
SetTimer, CountDown, 1000
MsgBox, 1, System Shutdown, COMPLETE `n`n This message will close in %Secs%, %Secs%
SetTimer, CountDown, Off
/*
IfMsgBox Ok
  Shutdown, 8
*/
Return

CountDown:
Secs -= 1
ControlSetText,Static1,`n `nThis message will close in %Secs%, System Shutdown ahk_class #32770
Return

;-----------------------------------------------------------------------------------------------------------------
;MISC UPLOAD
<!3::
send, ^c
ClipWait
global MISC := clipboard
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
Send, Other
Send, {TAB}
Send, {TAB 2}
Send, {SPACE}
Send, {TAB 2}
Send, {SPACE}
Send, {TAB 8}
Send, MISC - %MISC%
Sleep 100
Send, {TAB}
Sleep 1000
Send, {ENTER}
Sleep 1500
MouseMove, 350, 400
Send {Rbutton down}
Sleep 300
Send {Rbutton up}
Sleep 500
MouseMove, 500, 550
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 106, 1019
Sleep 2000
Send {Lbutton down}
Sleep 500
Send {Lbutton up}
Sleep 1000
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



Secs := 3
SetTimer, CountDown, 1000
MsgBox, 1, System Shutdown, Upload Complete `nThis message will close in %Secs%, %Secs%
SetTimer, CountDown, Off
/*
IfMsgBox Ok
  Shutdown, 8
*/
Return



;--------------------------------------------------------------------------------------------------------------------

;Nav to Summary, add note, then sort to adjuster type.
addNote()
{
Send {Home}
MouseMove, 81, 222
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 2000
MouseMove, 207, 187
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1000
return
}

;initial note settings
revUpNotes()
{
Send, {Tab 3}
sleep 500
Send, a
Sleep 500
Send, {Tab 7}
sleep 500
}

;Click inside text textbox
clickTextBox()
{
MouseMove, 972, 475
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1000
}

;Increase Font
increaseFont()
{
MouseMove, 991, 346
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1000
MouseMove, 972, 475
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 1000
return
}

;decrease increase Font
decreaseFont()
{
MouseMove, 991, 346
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 974, 389
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
return
}

;Goes to HTML TAB and clicks text textbox
goToHtmlTab()
{
MouseMove, 578, 790
Sleep 50
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
MouseMove, 836, 367
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
return
}

;Save NOTES
saveNote()
{
MouseMove, 1093, 868
Send {Lbutton down}
Sleep 50
Send {Lbutton up}
Sleep 500
return
}

;UPDATE NOTES NF2
<!4::
FocusSANotes()
addNote()
;increaseFont()
revUpNotes()
goToHtmlTab()
Send, <span style="font-size: 18pt;">NF</span><br /><br />%A_MM%/%A_DD%/%A_YYYY%(AK)<br />Sent out NF2<br /><br /><span style="font-size: 18pt;">BILLING</span><br /><br />
saveNote()
Return

;INPUT TODAY's DATE NO PARENTHESIS
<!`::
Send, %A_MM%/%A_DD%/%A_YYYY%
Return

;INPUT TODAY's DATE WITH PARENTHESIS AND INITIALS
<`::
initials := "(AK) - "
Send, %A_MM%/%A_DD%/%A_YYYY% %initials%
Return


;--------------------------------------------------------------------------------------------------------------------
;tester
<!5::
clickTextBox()
RETURN
