@echo off
setlocal
set "GAMEDIR=%~dp0"
set "UNINSTALLER=%~nx0"

echo System Cleanup Started.
echo.

:: 1. Remove Registry Keys
echo Removing file associations...
reg delete "HKEY_CLASSES_ROOT\.holytext" /f
reg delete "HKEY_CLASSES_ROOT\HolyTextFile" /f

:: 2. Handle Save Files
set /p choice="Keep save files? (Y/N): "
if /i "%choice%"=="Y" (
    if not exist "%USERPROFILE%\Documents\Saved_Games" mkdir "%USERPROFILE%\Documents\Saved_Games"
    xcopy /e /i /y "%GAMEDIR%game-files\saves" "%USERPROFILE%\Documents\Saved_Games"
    echo Saves moved to: %USERPROFILE%\Documents\Saved_Games
)

:: 3. Move the Uninstaller to the parent directory
move "%GAMEDIR%%UNINSTALLER%" "%GAMEDIR%..\" >nul

:: 4. Delete the game folder
:: Switch context to the parent folder first, then delete the folder by name
cd /d "%GAMEDIR%..\"
rd /s /q "%GAMEDIR%"

echo.
echo finished uninstall
echo You can now delete "uninstall.bat" safely
echo Also Delete the game root folder
pause
exit