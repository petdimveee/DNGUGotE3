#NoEnv
SetWorkingDir, %A_ScriptDir%
#SingleInstance, Force

; 1. Create the UI
Gui, Font, s12, Arial
Gui, Add, Text, Center w300, Card Launcher
Gui, Add, Button, w300 h40 gRunPitsouli, View Pitsouli's Status Card
Gui, Add, Button, w300 h40 gRunJimmy, View Jimmy's Status Card

Gui, Show, , Holy Card Viewer
return

; 2. Button Logic
RunPitsouli:
    Run, make-im.exe vis-ht.ahk "Pitsouli"
return

RunJimmy:
    Run, make-im.exe vis-ht.ahk "Jimmy"
return

; 3. Exit Handlers
GuiClose:
ExitApp:
    ExitApp