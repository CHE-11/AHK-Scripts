#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#IfWinActive, ahk_exe Figma.exe
!f::
    ;  Variables to Alter
    PathToFigma := "C:/Users/Connor/AppData/Local/Figma/Figma.exe"
    ShortcutDirectory := "C:/Users/Connor/Documents/MEGA/Figma/"

    Clip0 := ClipBoard
    Name := Clip0
    Name := RegExReplace(Name, "^.*/", "")
    Sleep,  400

    ; Create Shortcut
    FileCreateShortcut, %PathToFigma%, %ShortcutDirectory%%Name%.lnk , %PathToFigma%, %Clip0%

    ;  Create tooltip
    ToolTip, New Shortcut Created for %Name%
    Sleep,  2000

    ;  Destory Tooltip
    ToolTip
Return

