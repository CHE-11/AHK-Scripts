#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

!p::
    Clip0 := ClipBoard
    RegExMatch(Clip0, "(?:\w+\.)+\w+", domain)
    RegExMatch(Clip0, "[^/]+(?=/$|$)", title)
    
    Run, cmd.exe
    Sleep, 1000
    PercollateCmd:="percollate pdf " Clip0 " --output C:\Users\Connor\Downloads\" domain "-" title ".pdf --style C:\Users\Connor\Documents\MEGA\AutomationStuff\PDFStyling\pdf_styling.css"
    clipboard := ""
    Sleep, 500
    clipboard:=PercollateCmd
    Sleep, 500
    Send,{CTRL Down}v{CTRL Up}
    Sleep, 500
    Send, {ENTER}

    Sleep, 5000
    WinClose, C:\WINDOWS\system32\cmd.exe 














    

