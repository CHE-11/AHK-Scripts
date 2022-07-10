#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

clip := []
clipnum:=1

; Copy with Shift + Ctrl + C
!^c::
    clipboard := ""
    Sleep 20
    Send,{CTRL Down}c{CTRL Up}
    ClipWait, 1
    Sleep 20
    clip.Push(clipboard)
    TooltipText:="Copied:`n" SubStr(clipboard,1,30) "...`n`nCurrently [" clip.MaxIndex() "] snippets stored."
    GoSub ShowTooltip
return

; Paste with Alt + Ctrl + V
!^v::
    ClipBackup:=clipboardAll
    Sleep 25
    clipboard := ""
    Sleep 10
    clipboard:=clip[clipnum]
    ClipWait, 1
    Sleep 10
    Send, {CTRL Down}v{CTRL Up}
    Sleep 10
    TooltipText:="Pasted snippet [" clipnum "] of [" clip.MaxIndex() "]"
    clipnum++
    GoSub ShowTooltip
    If (clipnum > clip.MaxIndex()) ; Check to see if the clip array has hit its end and loop to beginning if needed
        clipnum:=1
    clipboard:= ClipBackup ; reset clipboard
return

!CapsLock::
    clipnum++
    TooltipText:="Copied:`n" clip[clipnum] "`n`n Clip Location [" clipnum "] of [" clip.MaxIndex() "]"
    GoSub ShowTooltip
    If (clipnum = clip.MaxIndex())
        clipnum :=0
Return

CapsLock & c::
    clip := []
    clipnum:=1
    TooltipText:="Snippets cleared"
    GoSub ShowTooltip
return

#Persistent
ShowTooltip:
    Tooltip, % TooltipText
    SetTimer, RemoveToolTip, -1000
return

RemoveToolTip:
    ToolTip
return

ToolTip
return

