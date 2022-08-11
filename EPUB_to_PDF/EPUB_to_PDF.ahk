#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^!p::
    Clip0 := ClipBoard
    Clip1 := StrReplace(Clip0, ".epub",".pdf")


    outputFlags := " --output-profile=ipad --pdf-default-font-size=16 --pdf-page-margin-bottom=36 --pdf-page-margin-left=36 --pdf-page-margin-right=36 --pdf-page-margin-top=36 --pdf-page-numbers --pdf-sans-family=Palatino --pdf-serif-family=Palatino --pdf-standard-font=Palatino"

    Run, cmd.exe
    Sleep, 100
    CalibreCmd:="ebook-convert """ Clip0 """ """Clip1 """ --output-profile=ipad --pdf-default-font-size=16 --pdf-page-margin-bottom=36 --pdf-page-margin-left=36 --pdf-page-margin-right=36 --pdf-page-margin-top=36 --pdf-page-numbers --pdf-serif-family=Marquis --pdf-standard-font=serif"
    Sleep, 200
    Clipboard := ""
    Sleep, 200
    Clipboard:=CalibreCmd
    Sleep, 200
    Send, %clipboard%
    Sleep, 400
    Send, {Enter}
    clipboard := ""
    Return

