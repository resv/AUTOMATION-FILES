#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.

#Warn ; Recommended for catching common errors.

SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.



; While CapsLock is toggled On

; Script will display Mouse Position (coordinates) as a tooltip at Top-Left corner of screen.

; Also allows to copy them (to clipboard) with a PrintScreen button.



#SingleInstance force ; only one instance of script can run



#Persistent ; to make it run indefinitely

settimer start1, 0 ; "0" to make it update position instantly

return



start1:

if !GetKeyState("capslock","T") ; whether capslock is on or off

 {

 tooltip ; if off, don't show tooltip at all.

 }

 else

 { ; if on

 CoordMode, ToolTip, Client ; makes tooltip to appear at position, relative to screen.

 CoordMode, Mouse, Client ; makes mouse coordinates to be relative to screen.

 MouseGetPos xx, yy ; get mouse x and y position, store as %xx% and %yy%

 tooltip %xx% %yy%, 0, 0 ; display tooltip of %xx% %yy% at coordinates x0 y0.

 ^MButton:: ; assign new function to ctrl+MOUSE3. If pressed...

 clipboard =MouseMove, %xx%, %yy% ; ...store %xx% %yy% to clipboard.

 return

 }

return

;HOT KEYS TO STOP SCRIPTS, L-ALT + R is the best way to stop script and refresh it at the same time. PAUSE VIA ESCAPE KEY IS INFERIOR

;Esc::ExitApp  ; Exit script with Escape key, currently commented out and using pause for easy editing
Esc::Pause    ; Pause script with Ctrl+Alt+P
!r::Reload   ; Reload script with Ctrl+Alt+R