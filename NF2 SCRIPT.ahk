;WORK AUTOMATION
;Control+N = Copies SA# highlighted and sets clipboard to variable.
^n::
send, ^c
ClipWait
global CLIPPED := clipboard
global SA# := CLIPPED
global TITLE = NF2 AUTOMATION BY AK
FormatTime, DATE,, MM/dd/yy
;global DATE = %A_MM%/%A_DD%/%A_YYYY%
global DATEString = DATE
global SEC := 30
global GREENFLAG ="`n1. OPEN NF2 APPLICATION FULLSCREEN ON THE LEFT `n`n2. OPEN SA FILE FULL SCREEN ON THE RIGHT"
global REDFLAG ="`nCHECK SA# AGAIN (Remove Spaces/Letters and 4x digits)"
global NF2Location := "C:\Users\AK 2019\Desktop\NF2\UPDATED NF2.pdf"
global NF2Title := "UPDATED NF2.pdf - Adobe Acrobat Reader DC"
global ADOBELocation = "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe"
global SAURL := "http://192.168.1.8/sa/"
global SAURLTitle := "SmartAdvocate:The Case Management System" 	; find out with the Window Spy script
global CalendarURL :="https://calendar.google.com/calendar/u/0/r?pli=1"
global CalendarURLTitle := "Google Calendar - " 	; find out with the Window Spy script
global SAWindowTitle := "SmartAdvocate:The Case Management System"
global DOL := ""
global ClientName := ""
global ClientAddress := ""
global ClientSS := ""
global ClientDOB := ""
global BillingProvider :=""


;STEP BY STEP FUNCTIONS


;OPENS NF2 FILE----------------------------------------------------------------------------------------------------
OpenNF2File()
	{
		if WinExist("UPDATED NF2.pdf - Adobe Acrobat Reader DC")
		{
			WinMaximize, UPDATED NF2,,,
			Return
		}
		if !WinExist(UPDATED NF2.pdf - Adobe Acrobat Reader DC)
		{
			Run, %NF2Location%
			WinWait, UPDATED NF2,,10,
				if ErrorLevel
				{
					MsgBox, Opening the NF2 file timed out, moved locations, or changed file names.
					return
				}
				else
				{
					WinMaximize, UPDATED NF2,,,
					Return
				}
			MsgBox Did not detect NF2 PDF open, Opening file now please wait, Re run the script when the NF2 is open.
			return
		}
	}


;ACTIVATES NF2, FOCUSES, AND THEN SETS UP FILL AND SIGN,----------------------------------------------------------------------------------------------------
RevUpNF2()
	{
	WinActivate, %NF2Title%,,,
	Sleep 300
	Send {Home}
	Sleep 300
	MouseMove, 1900, 600
	Send {Lbutton down}
	Sleep 300
	Send {Lbutton up}
	MouseMove, 1900, 600
	Send {Lbutton down}
	Sleep 300
	Send {Lbutton up}
	MouseMove, 775, 650
	Send {Lbutton down}
	Sleep 300
	Send {Lbutton up}
	}

;GOES TO SA # ACCOUNT----------------------------------------------------------------------------------------------------
RevUpSA#()
	{
		WinActivate, %SAURLTitle%,,,
		Sleep 300
		Send {Home}
		Sleep 300
		MouseMove, 750, 135
		Send {Lbutton down}
		Sleep 300
		Send {Lbutton up}
		Sleep 300
		Send, %SA#%
		Sleep 300
		Send, {Enter}
		Sleep 300
		return
	}


;FOCUS SA Window----------------------------------------------------------------------------------------------------
FocusSA()
	{
		WinActivate, %SAURLTitle%,,,
		Sleep 300
		return
	}

;FOCUS CALENDAR Window----------------------------------------------------------------------------------------------------
	FocusCal()
		{
			WinActivate, %CalendarURLTitle%,,,
			Sleep 300
			return
		}

;FOCUS NF Window----------------------------------------------------------------------------------------------------
	FocusNF2()
		{
			WinActivate, %NF2Title%,,,
			Sleep 300
			return
		}


;OPENS SA ON CHROME (deprecated)----------------------------------------------------------------------------------------------------
OpenUpSADEPRECATED()
		{
		 Run, %SAURL%
		 if WinExist(SAURLTitle)
		 WinWait, %SAURLTitle%,,10,
		 if ErrorLevel
		 {
			 MsgBox, COULD NOT OPEN CHROME (NOT INTERNET ISSUE) Chrome, moved locations, or changed file names.
			 return
		 }
		 else
		 {
			 WinMaximize, %SAURLTitle%,,,
			 Return
		 }
	   return
		}

;OPENS SA IN NEW WINDOW and moves it to right screen  --------------------------------
OpenUpSA()
{
Run, chrome.exe -new-window --window-size=840`1050 --window-position=100`0 %SAURL%
sleep 400
WinWait % SAURLTitle,,10,
WinMove % SAURLTitle , , 1912, 18, 1066, 1656
Sleep 500
Return
}

;OPENS CALENDAR IN NEW WINDOW to main screen  --------------------------------
OpenUpCal()
{
Run, chrome.exe -new-window %CalendarURL%
sleep 400
WinWait % CalendarURLTitle,,10,
WinMove % CalendarURLTitle , , -8, -8, 1936, 1056
Sleep 500
Return
}

;MAIN DIRECTIVES
if (SA# is digit) and (SA# >= 1000 and SA# <= 9999)
   {
   MsgBox, 266289, %TITLE%, STATUS: READY `nSA #: %SA#% `n%GREENFLAG% `n`nContinue to Automate this NF2?
	 clipboard := ""
     IfMsgBox OK
		 	{
				OpenNF2File()
				RevUpNF2()
        OpenUpSA()
				FocusSA()
				RevUpSA#()
				SA#CopyValuesFromSummary()
				SA#CopyValuesFromIncident()
				;FocusNF2()
				;NF2PasteVariablesFromSummary()
			  ;RevUpNF2Page2()

			}
	 		IfMsgBox No
			{
			return
			}
	 }
else
   {
   MsgBox, 262160, %TITLE%, STATUS: NOT READY `n`nYou copied: "%SA#%" `n%REDFLAG% `n`nCannot continue this NF2
	 clipboard := ""
	 }
return

SA#CopyValuesFromSummary()
	{
		;COPIES DOL
		sleep 2000
		MouseMove, 736, 239
		Send {Lbutton down}
		Sleep 300
		MouseMove, 811, 247
		Sleep 300
		Send {Lbutton up}
		Sleep 300
		Send, ^c
		ClipWait
		CLIPPED := clipboard
		global DOL := CLIPPED
		CLIPPED := ""

		;COPIES CLIENT FULL NAME
		MouseMove, 177, 989
		Send {Lbutton down}
		Sleep 300
		MouseMove, 306, 985
		Sleep 300
		Send {Lbutton up}
		Sleep 300
		Send, ^c
		ClipWait
		CLIPPED := clipboard
		global ClientName := CLIPPED
		CLIPPED := ""

		;OPEN CLIENT FACTUAL ON SA
		MouseMove, 193, 989
		Send {Rbutton down}
		Sleep 50
		Send {Rbutton up}
		Sleep 1000
		MouseMove, 390, 1036
		Send {Lbutton down}
		Sleep 100
		Send {Lbutton up}
		Sleep 300

		;COPIES ADDRESS
		MouseMove, 390, 1036
		Send {Lbutton down}
		Sleep 300
		MouseMove, 586, 1055
		Sleep 300
		Send {Lbutton up}
		Sleep 300
		Send, ^c
		ClipWait
		CLIPPED := clipboard
		global ClientAddress := CLIPPED

		;COPIES SOCIAL
		MouseMove, 390, 1122
		Send {Lbutton down}
		Sleep 300
		MouseMove, 492, 1123
		Sleep 300
		Send {Lbutton up}
		Sleep 300
		Send, ^c
		ClipWait
		CLIPPED := clipboard
		global ClientSS := CLIPPED

		;COPIES DOB
		MouseMove, 424, 1136
		Send {Lbutton down}
		Sleep 300
		MouseMove, 525, 1138
		Sleep 300
		Send {Lbutton up}
		Sleep 300
		Send, ^c
		ClipWait
		CLIPPED := clipboard
		global ClientDOB := CLIPPED

		MsgBox, 262160, %TITLE%, `n VALUES: `n On clipboard now: %CLIPPED% `n TODAY's DATE: %DATE% `n DOL: %DOL% `n global clientName: %ClientName% `n global clientAddress: %ClientAddress% `n global ClientSS: %ClientSS% `n global ClientDOB: %ClientDOB%
				return
}


;PASTE FACTUAL TO FIRST PAGE---------------------------------------
NF2PasteVariablesFromSummary()
	{
		;PASTE DATE
		MouseMove, 1107, 485
		Send {Lbutton down}
		Sleep 50
		Send {Lbutton up}
		Sleep 1000
		Send, %DATEString%
		Sleep 500

		;PASTE ClientFactual
		MouseMove, 930, 614
		Send {Lbutton down}
		Sleep 50
		Send {Lbutton up}
		Sleep 1000
		Send {Lbutton down}
		Sleep 50
		Send {Lbutton up}
		Sleep 1000
		Send, %ClientName%
		Sleep 500
		Send, {ENTER}
		Sleep 500
		Send, %DOL%
		Sleep 500
		Send, %SA#%
		Sleep 500
	return
	}

	---------------------------------------------------------------------------------------------------------------------
	;Sets up next Page in NF
	RevUpNF2Page2()
			{

			return
			}
---------------------------------------------------------------------------------------------------------------------
	;NAVIGATES TO INCIDENT AND COPIES VALUES FROM INCIDENT PAGE DOL/ TIME


	SA#CopyValuesFromIncident()
			{
      ;FOCUS INCIDENT WINDOW
			WinActivate, Case Incident,,,
			Sleep 300

	  	MouseMove, 26, 244
			Send {Lbutton down}
			Sleep 50
			Send {Lbutton up}
			Sleep 2000

			;COPIES DOL
      MouseMove, 290, 350
			Send {Lbutton down}
			Sleep 300
	  	MouseMove, 370, 351
			Sleep 300
			Send {Lbutton up}
			Sleep 300
			Send, ^c
			ClipWait
			CLIPPED := clipboard
			global ClientDOL := CLIPPED


			;COPIES TIME OF ACCIDENT
			MouseMove, 400, 350
			Send {Lbutton down}
			Sleep 300
		  MouseMove, 451, 351
			Sleep 300
			Send {Lbutton up}
			Sleep 300
			Send, ^c
			ClipWait
			CLIPPED := clipboard
			global ClientTOA := CLIPPED

			MsgBox, 262160, %TITLE%, `n INCIDENT PAGE VALUES `n VALUES: `n On clipboard now: %CLIPPED% `n ClientDOL: %ClientDOL% `n ClientTOA: %ClientTOA%
			}

			;Goes back a page using Back in chrome (this should be replaced with next list tab )
			SA#GoBackAPage()
			{
			MouseMove, 97, 1303
			Send {Lbutton down}
			Sleep 300
			Send {Lbutton up}
			Sleep 1000
			Send, !{LEFT}
			Sleep 2500
			return
			}

			SA#GoBackToSummary()
			{
			MouseMove, 93, 216
			Send {Lbutton down}
			Sleep 300
			Send {Lbutton up}
			Sleep 2500
			return
			}



;Goes TO MEDICAL FACILITY (this should be replaced with next list tab )
			^\::
			MouseMove, 93, 216
			Send {Lbutton down}
			Sleep 300
			Send {Lbutton up}
			Sleep 2500
			return




;HOT KEYS TO STOP SCRIPTS, L-ALT + R is the best way to stop script and refresh it at the same time. PAUSE VIA ESCAPE KEY IS INFERIOR

;Esc::ExitApp  ; Exit script with Escape key, currently commented out and using pause for easy editing
Esc::Pause    ; Pause script with Ctrl+Alt+P
!r::Reload   ; Reload script with Ctrl+Alt+R


;-----------------------------------------------------------------------------------------------------------------
