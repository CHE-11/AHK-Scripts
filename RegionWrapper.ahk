#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%


; Hotkey for TypeScript (tsx) files
:T*::react::
outputText = 
(
{/*#region []*/}

{/*#endregion*/}
)
cursorOffset := StrLen(outputText) - 12
Send(outputText, cursorOffset)
return

; Hotkey for TypeScript (ts) files
:T*::rts::
outputText = 
(
//#region []

//#endregion
)
cursorOffset := StrLen(outputText) - 11
Send(outputText, cursorOffset)
return

; Hotkey for JavaScript (js) files
:T*::rjs::
outputText = 
(
//#region []

//#endregion
)
cursorOffset := StrLen(outputText) - 11
Send(outputText, cursorOffset)
return

; Hotkey for CSS files
:T*::rcss::
outputText = 
(
/*#region []*/

/*#endregion*/
)
cursorOffset := StrLen(outputText) - 11
Send(outputText, cursorOffset)
return

; Hotkey for HTML files
:T*::rhtml::
outputText = 
(
<!-- #region [] -->

<!-- #endregion -->
)
cursorOffset := StrLen(outputText) - 14
Send(outputText, cursorOffset)
return


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hotkey to open the GUI (CapsLock + R)
CapsLock & r::
    ; Save the current clipboard content
    oldClipboard := ClipboardAll

    Clipboard := "" ; Empty the clipboard
    ; Copy selected text to the clipboard
    Send, ^c
    ; Wait for the clipboard to contain data
    ClipWait
    ; Store the copied text
    copiedText := Clipboard

    ; Show GUI
    Gui, Destroy ; Destroy any existing GUI
    Gui, +AlwaysOnTop 
    Gui, Add, Text,, Select a Language for a Region.
    Gui, Add, Button, gInsertReact, React (tsx)
    Gui, Add, Button, gInsertTS, TypeScript (ts)
    Gui, Add, Button, gInsertJS, JavaScript (js)
    Gui, Add, Button, gInsertCSS, CSS
    Gui, Add, Button, gInsertHTML, HTML
    Gui, Show
return


; React (TSX) Button
InsertReact:
Gui, Destroy
start := "{/*#region []*/}"
end := "{/*#endregion*/}"

if (copiedText = "") {
    outputText := start . "`n" . end
} else {
    outputText := start . "`n" . copiedText . "`n" . end
}

cursorOffset := StrLen(outputText) - 12

Send(outputText, cursorOffset)
return

; TypeScript (TS) Button
InsertTS:
Gui, Destroy
start := "//#region []"
end := "//#endregion"

if (copiedText = "") {
    outputText := start . "`n" . end
} else {
    outputText := start . "`n" . copiedText . "`n" . end
}

cursorOffset := StrLen(outputText) - 11
Send(outputText, cursorOffset)
return

; JavaScript (JS) Button
InsertJS:
Gui, Destroy
start := "//#region []"
end := "//#endregion"

if (copiedText = "") {
    outputText := start . "`n" . end
} else {
    outputText := start . "`n" . copiedText . "`n" . end
}

cursorOffset := StrLen(outputText) - 11
Send(outputText, cursorOffset)
return

; CSS Button
InsertCSS:
Gui, Destroy
start := "/*#region []*/"
end := "/*#endregion*/"

if (copiedText = "") {
    outputText := start . "`n" . end
} else {
    outputText := start . "`n" . copiedText . "`n" . end
}

cursorOffset := StrLen(outputText) - 11
Send(outputText, cursorOffset)
return

; HTML Button
InsertHTML:
Gui, Destroy
start := "<!-- #region [] -->"
end := "<!-- #endregion -->"

if (copiedText = "") {
    outputText := start . "`n" . end
} else {
    outputText := start . "`n" . copiedText . "`n" . end
}

cursorOffset := StrLen(outputText) - 14
Send(outputText, cursorOffset)
return

Send(text, number) {
    ClipSaved := ClipboardAll
    clipboard := ""
    clipboard := text
    ClipWait, 1
    if (!ErrorLevel)
        Send, ^v
    Sleep, 300
    SendInput, {Left %number%}
    clipboard := ClipSaved
    VarSetCapacity(ClipSaved, 0)
}



