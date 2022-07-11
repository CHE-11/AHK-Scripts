#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Change Hotkey to whatever you want.
!p::
    ; Path to Download Location
    DownloadLocation := "C:\Users\Connor\Downloads\"
    ; Path to StyleSheet
    PathToStyleSheet := "C:\Users\Connor\Documents\MEGA\AutomationStuff\PDFStyling\pdf_styling.css"
    ; Path to HTML Template
    PathToHTMLTemplate := "C:\Users\Connor\Documents\MEGA\AutomationStuff\PDFStyling\pdf_html_template.html"
    ; Enable Table of Contents?
    TableOfContents := false
    ; Enable Cover?
    Cover := true



    Clip0 := ClipBoard
    RegExMatch(Clip0, "(?:\w+\.)+\w+", domain)
    RegExMatch(Clip0, "[^/]+(?=/$|$)", title)
    
    Run, cmd.exe
    Sleep, 500
    if (TableOfContents = true)
    {
    PercollateCmd:="percollate pdf " Clip0 " --output " DownloadLocation domain "-" title ".pdf --toc --style " PathToStyleSheet " --template " PathToHTMLTemplate
    }
    else{
    PercollateCmd:="percollate pdf " Clip0 " --output " DownloadLocation domain "-" title ".pdf --no-toc --style " PathToStyleSheet " --template " PathToHTMLTemplate
    }
    Sleep, 100
    if (Cover = true)
    {
        PercollateCmd:= PercollateCmd " --cover"
    }
    else
    {
        PercollateCmd:= PercollateCmd
    }
    
    Sleep, 1000
    Send, %PercollateCmd%
    Send, {ENTER}



    
    Loop, 2
    {
        If WinExist("C:\WINDOWS\system32\cmd.exe")
            ControlSend,, exit{Enter}, ahk_exe cmd.exe
        Sleep, 500
    }

   
