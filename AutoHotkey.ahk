; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#MaxHotkeysPerInterval 1000

#s::
ExitApp
return

^!1::
Click down
return

^!2::
Click up
return

#3::
Click right down
return

#4::
Click right up
return

^!0::
;MouseMove, 1, 0, 10, R
DllCall("mouse_event", uint, 1, int, 75, int, 0)
return

^!9::
;MouseMove, -1, 0, 10, R
DllCall("mouse_event", uint, 1, int, -75, int, 0)
return

^!8::
;MouseMove, 0, 1, 10, R
DllCall("mouse_event", uint, 1, int, 0, int, -75)
return

^!7::
;MouseMove, 0, -1, 10, R
DllCall("mouse_event", uint, 1, int, 0, int, 75)
return

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

