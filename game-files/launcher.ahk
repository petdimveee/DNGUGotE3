#NoEnv
SetWorkingDir, %A_ScriptDir%
SetBatchLines, -1
#NoTrayIcon
ShellExecute(file) {
    Run, % "rundll32.exe shell32.dll,ShellExec_RunDLL " . file
}
; 1. Set up the launcher visual canvas matching your game's palette
Gui, Font, s20 bold, Times New Roman
Gui, Add, Text, x30 y20 w440 c000000 Center, DNGUGotE3 Launcher


; 2. Add description text
Gui, Font, s11 norm, Arial
Gui, Add, Text, x40 y90 w420 c000000, Welcome

; 3. Core action buttons - completely clean text
Gui, Font, s12 bold, Arial
Gui, Add, Button, x50 y140 w400 h45 gRunGame, Launch game
Gui, Add, Button, x50 y200 w400 h45 gRunOldGame, Launch old game
Gui, Add, Button, x50 y260 w400 h45 gRunCardViewer, Card Viewer

; 4. Bottom row utilities - re-gridded for three smaller buttons
Gui, Font, s9 bold, Arial
Gui, Add, Button, x40 y330 w135 h35 gOpenSaves, Open Saves Folder
Gui, Add, Button, x185 y330 w135 h35 gRegisterFormat, Register Format
Gui, Add, Button, x330 y330 w135 h35 gUnninstall, Unninstall



; Show the launcher window centered on screen
Gui, Show, w500 h400, DA NAPKIN GOD ULTIMATE GAME of the EON III Launcher
return

; ==============================================================================
; BUTTON ACTIONS (Labels)
; ==============================================================================

RunGame:
    Run, %A_ScriptDir%\game.lnk
    goto ExitLauncher
return

RunOldGame:
    Run, %A_ScriptDir%\game-o.lnk
    goto ExitLauncher
return

RunCardViewer:
    Run, %A_ScriptDir%\card.lnk
return
OpenSaves:
    if InStr(FileExist("saves"), "D") {
        Run, %A_ScriptDir%\saves
    } else {
        MsgBox, 48, Warning, The 'saves' folder has not been created yet! Run the game and save first.
    }
return

RegisterFormat:
    regPath := A_ScriptDir "\other\reg-icon-ht.reg"
    if FileExist(regPath) {
        Run, regedit.exe /s "%regPath%"
        MsgBox, 64, Success, Format custom iconography registered successfully!
    } else {
        MsgBox, 16, Error, Registration file not found at:`nother\reg-icon-ht.reg
    }
return

Unninstall:
    ; 36 = 32 (Question icon) + 4 (Yes/No buttons)
    MsgBox, 36, Uninstall, Are you sure you want to uninstall DNGUGotE3?
    IfMsgBox Yes
    {
        ; Target the file in the parent directory
        batchPath := A_ScriptDir "\..\unninstall.bat"
        
        if FileExist(batchPath) {
            ; Use quotes in the Run command to handle potential spaces in file paths
            Run, "%batchPath%"
            ExitApp
        } else {
            MsgBox, 16, Error, Could not find 'unninstall.bat' one folder above this script.
        }
    }
return
	
ExitLauncher:
GuiClose:
GuiEscape:
    ExitApp