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
Send(outputText)
SendInput, {Left 22}
return

; Hotkey for TypeScript (ts) files
:T*::rts::
outputText = 
(
//#region []

//#endregion
)
Send(outputText)
SendInput, {Left 15}
return

; Hotkey for JavaScript (js) files
:T*::rjs::
outputText = 
(
//#region []

//#endregion
)
Send(outputText)
SendInput, {Left 15}
return

; Hotkey for CSS files
:T*::rcss::
outputText = 
(
/*#region []*/

/*#endregion*/
)
Send(outputText)
SendInput, {Left 19}
return

; Hotkey for HTML files
:T*::rhtml::
outputText = 
(
<!-- #region [] -->

<!-- #endregion -->
)
Send(outputText)
SendInput, {Left 26}
return


Send(text) {
    ClipSaved := ClipboardAll
    clipboard := ""
    clipboard := text
    ClipWait, 1
    if (!ErrorLevel)
        Send, ^v
    Sleep, 300
    clipboard := ClipSaved
    VarSetCapacity(ClipSaved, 0)
}


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hotkey to open the GUI (CapsLock + R)
CapsLock & r::
    ; Save the current clipboard content
    oldClipboard := ClipboardAll
    ; Copy selected text to the clipboard
    Send, ^c
    ; Wait for the clipboard to contain data
    ClipWait, 1
    ; Store the copied text
    copiedText := Clipboard

    ; Show GUI
    Gui, Destroy ; Destroy any existing GUI
    Gui, +AlwaysOnTop 
    Gui, Add, Text,, Select a Language for a Region.
    Gui, Add, Button, gInsertReact, React (ts)
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

MsgBox % copiedText

if(copiedText = ""){
    outputText := start . "`n" . end
}else
    outputText := start . "`n" . copiedText . "`n" . end

Send(outputText)
SendInput, {Right 8}

; Restore the old clipboard content
Clipboard := oldClipboard
return

; TypeScript (TS) Button
InsertTS:
Gui, Destroy
outputText =
(
//#region []

//#endregion
)
Send(outputText)
SendInput, {Right 8}
return

; JavaScript (JS) Button
InsertJS:
Gui, Destroy
outputText =
(
//#region []

//#endregion
)
Send(outputText)
SendInput, {Left 15}
return

; CSS Button
InsertCSS:
Gui, Destroy
outputText =
(
/*#region []*/

/*#endregion*/
)
Send(outputText)
SendInput, {Left 19}
return

; HTML Button
InsertHTML:
Gui, Destroy
outputText =
(
<!-- #region [] -->

<!-- #endregion -->
)
Send(outputText)
SendInput, {Left 26}
return




