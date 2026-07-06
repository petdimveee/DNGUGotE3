#NoEnv
SetBatchLines, -1
#NoTrayIcon

; 1. Grab name from command argument
p_name = %1%
if (p_name = "")
    ExitApp

savePath := "saves\save_" . p_name . ".holytext"
if !FileExist(savePath)
    ExitApp

; Read your game's data files line by line
FileReadLine, hp, %savePath%, 1
FileReadLine, max_hp, %savePath%, 2
FileReadLine, attack, %savePath%, 3
FileReadLine, gold, %savePath%, 4
FileReadLine, divinity, %savePath%, 5
FileReadLine, level, %savePath%, 6
FileReadLine, xp, %savePath%, 7
FileReadLine, fight_count, %savePath%, 8
FileReadLine, t_fight_count, %savePath%, 9

; Select the character artwork based on the hero
if (p_name = "Pitsouli") {
art =
(Join`r`n LTrim
:::::::........:::::
:::::..:&@@@@&:..:::
::..:&@@@@&::&&:..::
:..:&@@&::&&::&&:..:
:..:&@@&:..........:
:..:&&:......:&@@&::
.........:&&::&@@&::
.:&@@&::&@@&::&@@&::
.:&@@@@@@@@@@@@@@&::
....................
)
} else {
art =
(Join`r`n LTrim
................:::..........
..............:::::::........
.............:oO&&&&O&o:.....
:::::::::..::o&&&&&&&###o::::
:::::::::::0&OOO00O&&&##O::::
:::::::....::o0OO0O&&&#@O::::
::::...:oO&&&&&&&0::0&@O:::::
::..:oo:::oO&OOOOOOOOO#o:::::
::oo::::::::::oOOOO::o&#0::::
:::::::::::::::::::::o#&Oo:::
::::::::::::::::::::::oOO&o::
::::::::::::::::::::::::0O&0:
............................
)
}

; --- DYNAMIC SIZE CALCULATION ---
LineCount := 0, MaxChars := 0
CleanArt := StrReplace(art, "`r", "")
Loop, Parse, CleanArt, `n
{
    if (A_LoopField = "")
        continue
    LineCount++
    if (StrLen(A_LoopField) > MaxChars)
        MaxChars := StrLen(A_LoopField)
}

if (MaxChars <= 25) {
    BoxWidth := (MaxChars * 10) + 38, BoxHeight := (LineCount * 18) + 36
    TextOffsetX := 18, TextOffsetY := 16
} else {
    BoxWidth := (MaxChars * 12) + 40, BoxHeight := (LineCount * 20) + 40
    TextOffsetX := 20, TextOffsetY := 18
}

CanvasW := BoxWidth + 20, CanvasH := BoxHeight + 20
BoxY := 220 - (BoxHeight / 2), BoxX := 470 - (BoxWidth / 2)

; --- Assemble the character card UI template ---
Gui, Color, f6fda9

AddShadowedText("s20 bold italic", "Times New Roman", 40, 30, "000000", "d1d790", "HERO: " . p_name)
AddShadowedText("s14 bold italic", "Times New Roman", 40, 90, "000000", "d1d790", "LEVEL: " . level)
AddShadowedText("s14 bold italic", "Times New Roman", 40, 130, "000000", "d1d790", "XP: " . xp . " / 100")
AddShadowedText("s14 bold italic", "Times New Roman", 40, 180, "b80000", "d1d790", "HP: " . hp . " / " . max_hp)
AddShadowedText("s14 bold italic", "Times New Roman", 40, 220, "000000", "d1d790", "ATK: " . attack)
AddShadowedText("s14 bold italic", "Times New Roman", 40, 260, "A07800", "d1d790", "GOLD: " . gold)
AddShadowedText("s14 bold italic", "Times New Roman", 40, 300, "640096", "d1d790", "DIVINITY: " . divinity)
AddShadowedText("s14 bold italic", "Times New Roman", 40, 340, "0055AA", "d1d790", "FIGHTS: " . fight_count . " / 5") ; Added this line
AddShadowedText("s14 bold italic", "Times New Roman", 40, 380, "0055AA", "d1d790", "TOTAL FIGHTS: " . t_fight_count) ; Added this line

Gui, Add, Text, x20 y20 w610 h2 0x7
Gui, Add, Text, x20 y440 w610 h2 0x7
Gui, Add, Text, x20 y20 w2 h420 0x7
Gui, Add, Text, x630 y20 w2 h420 0x7

Gui, Add, Picture, x%BoxX% y%BoxY% w%CanvasW% h%CanvasH% hwndhPicContainer +0xE
Gui, Font, s10 bold, Arial
Gui, Add, Button, x510 y395 w100 h30 gCloseButton Default, Close Card
Gui, +AlwaysOnTop
Gui, Show, w650 h460, Holy Status Card: %p_name%

DrawGradientFramesAndText(hPicContainer, CleanArt, BoxWidth, BoxHeight, CanvasW, CanvasH, TextOffsetX, TextOffsetY)
return

AddShadowedText(FontOptions, FontName, x, y, TextColor, ShadowColor, OutputText) {
    Gui, Font, %FontOptions%, %FontName%
    Gui, Add, Text, % "x" x+2 " y" y+2 " c" ShadowColor " +BackgroundTrans", %OutputText%
    Gui, Add, Text, x%x% y%y% c%TextColor% +BackgroundTrans, %OutputText%
}

DrawGradientFramesAndText(hwnd, artText, w, h, canvasW, canvasH, textX, textY) {
    ; Start GDI+ Framework via flat library load tokens
    VarSetCapacity(si, 16, 0), NumPut(1, si, "UInt")
    DllCall("gdiplus\GdiplusStartup", "Ptr*", pToken, "Ptr", &si, "Ptr", 0)
    DllCall("gdiplus\GdipCreateBitmapFromScan0", "Int", canvasW, "Int", canvasH, "Int", 0, "Int", 0x26200A, "Ptr", 0, "Ptr*", pBitmap)
    DllCall("gdiplus\GdipGetImageGraphicsContext", "Ptr", pBitmap, "Ptr*", pGraphics)
    DllCall("gdiplus\GdipSetSmoothingMode", "Ptr", pGraphics, "Int", 4)
    DllCall("gdiplus\GdipSetTextRenderingHint", "Ptr", pGraphics, "Int", 4)
    DllCall("gdiplus\GdipGraphicsClear", "Ptr", pGraphics, "UInt", 0xFFF6FDA9)

    ; LIGHTWEIGHT COM BLUR SHADOW ROUTINE
    ; Eliminates dozens of lines of redundant structures to keep code compact
    Loop, 4 {
        i := 9 - A_Index, alpha := (A_Index * 6) << 24
        DllCall("gdiplus\GdipCreateSolidFill", "UInt", alpha, "Ptr*", pSBrush)
        DllCall("gdiplus\GdipCreatePath", "Int", 0, "Ptr*", pSPath)
        CreateRoundedRectPath(pSPath, i, i, w + (8 - i), h + (8 - i), 20)
        DllCall("gdiplus\GdipFillPath", "Ptr", pGraphics, "Ptr", pSBrush, "Ptr", pSPath)
        DllCall("gdiplus\GdipDeletePath", "Ptr", pSPath)
        DllCall("gdiplus\GdipDeleteBrush", "Ptr", pSBrush)
    }

    ; METALLIC SILVER LAYER PAIRS
    VarSetCapacity(r1, 16, 0), NumPut(w, r1, 8, "Float"), NumPut(h, r1, 12, "Float")
    DllCall("gdiplus\GdipCreateLineBrushFromRect", "Ptr", &r1, "UInt", 0xFFF5F7FA, "UInt", 0xFF93979A, "Int", 1, "Int", 0, "Ptr*", pB1)
    DllCall("gdiplus\GdipCreatePath", "Int", 0, "Ptr*", pP1), CreateRoundedRectPath(pP1, 0, 0, w, h, 20)
    DllCall("gdiplus\GdipFillPath", "Ptr", pGraphics, "Ptr", pB1, "Ptr", pP1)

    VarSetCapacity(r2, 16, 0), NumPut(10, r2, 0, "Float"), NumPut(10, r2, 4, "Float")
    NumPut(w-20, r2, 8, "Float"), NumPut(h-20, r2, 12, "Float")
    DllCall("gdiplus\GdipCreateLineBrushFromRect", "Ptr", &r2, "UInt", 0xFF93979A, "UInt", 0xFFF5F7FA, "Int", 1, "Int", 0, "Ptr*", pB2)
    DllCall("gdiplus\GdipCreatePath", "Int", 0, "Ptr*", pP2), CreateRoundedRectPath(pP2, 10, 10, w-20, h-20, 15)
    DllCall("gdiplus\GdipFillPath", "Ptr", pGraphics, "Ptr", pB2, "Ptr", pP2)

    ; RENDER ASCII INK CORE
    DllCall("gdiplus\GdipCreateSolidFill", "UInt", 0xFF000000, "Ptr*", pTextBrush)
    DllCall("gdiplus\GdipCreateFontFamilyFromName", "WStr", "Courier New", "Ptr", 0, "Ptr*", pFontFamily)
    DllCall("gdiplus\GdipCreateFont", "Ptr", pFontFamily, "Float", 12, "Int", 1, "Int", 3, "Ptr*", pFont)
    
    VarSetCapacity(tRect, 16, 0), NumPut(textX, tRect, 0, "Float"), NumPut(textY, tRect, 4, "Float")
    NumPut(w-(textX*2)+12, tRect, 8, "Float"), NumPut(h-(textY*2)+12, tRect, 12, "Float")
    DllCall("gdiplus\GdipDrawString", "Ptr", pGraphics, "WStr", artText, "Int", -1, "Ptr", pFont, "Ptr", &tRect, "Ptr", 0, "Ptr", pTextBrush)

    ; Ship output vector context map to handle destination container
    DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", "Ptr", pBitmap, "Ptr*", hBitmap, "UInt", 0)
    SendMessage, 0x172, 0x0, hBitmap,, ahk_id %hwnd%

    ; Safe termination sequence
    DllCall("gdiplus\GdipDeleteFont", "Ptr", pFont)
    DllCall("gdiplus\GdipDeleteFontFamily", "Ptr", pFontFamily)
    DllCall("gdiplus\GdipDeleteBrush", "Ptr", pTextBrush)
    DllCall("gdiplus\GdipDeletePath", "Ptr", pP1), DllCall("gdiplus\GdipDeleteBrush", "Ptr", pB1)
    DllCall("gdiplus\GdipDeletePath", "Ptr", pP2), DllCall("gdiplus\GdipDeleteBrush", "Ptr", pB2)
    DllCall("gdiplus\GdipDeleteGraphics", "Ptr", pGraphics)
    DllCall("gdiplus\GdipDisposeImage", "Ptr", pBitmap)
    DllCall("gdiplus\GdiplusShutdown", "Ptr", pToken)
}

CreateRoundedRectPath(pPath, x, y, w, h, r) {
    d := r * 2
    DllCall("gdiplus\GdipAddPathArc", "Ptr", pPath, "Float", x, "Float", y, "Float", d, "Float", d, "Float", 180, "Float", 90)
    DllCall("gdiplus\GdipAddPathArc", "Ptr", pPath, "Float", x+w-d, "Float", y, "Float", d, "Float", d, "Float", 270, "Float", 90)
    DllCall("gdiplus\GdipAddPathArc", "Ptr", pPath, "Float", x+w-d, "Float", y+h-d, "Float", d, "Float", d, "Float", 0, "Float", 90)
    DllCall("gdiplus\GdipAddPathArc", "Ptr", pPath, "Float", x, "Float", y+h-d, "Float", d, "Float", d, "Float", 90, "Float", 90)
    DllCall("gdiplus\GdipClosePathFigure", "Ptr", pPath)
}

ButtonCloseCard:
CloseButton:
GuiClose:
GuiEscape:
    ExitApp
