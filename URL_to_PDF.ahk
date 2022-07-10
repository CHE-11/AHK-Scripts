#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Change Hotkey to whatever you want.
!p::
    ; Change Download Location
    DownloadLocation := "C:\Users\Connor\Downloads\"
    ; Change Path to StyleSheet
    PathToStyleSheet := "C:\Users\Connor\Documents\MEGA\AutomationStuff\PDFStyling\pdf_styling.css"


    Clip0 := ClipBoard
    RegExMatch(Clip0, "(?:\w+\.)+\w+", domain)
    RegExMatch(Clip0, "[^/]+(?=/$|$)", title)
    
    Run, cmd.exe
    Sleep, 500
    PercollateCmd:="percollate pdf " Clip0 " --output " DownloadLocation domain "-" title ".pdf --style " PathToStyleSheet
    
    Sleep, 500
    Send, %PercollateCmd%
    Send, {ENTER}
    
    Loop, 2
    {
        If WinExist("C:\WINDOWS\system32\cmd.exe")
            ControlSend,, exit{Enter}, ahk_exe cmd.exe
        Sleep, 500
    }
