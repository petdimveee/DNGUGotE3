@echo off
:: Set current path and convert backslashes for Registry double-escape
set "CURRENT_PATH=%~dp0"
set "REG_PATH=%CURRENT_PATH:\=\\%"

:: 1. Generate the registry file
echo Windows Registry Editor Version 5.00 > "%~dp0game-files\other\reg-icon-ht.reg"
echo. >> "%~dp0game-files\other\reg-icon-ht.reg"
echo [HKEY_CLASSES_ROOT\.holytext] >> "%~dp0game-files\other\reg-icon-ht.reg"
echo @="HolyTextFile" >> "%~dp0game-files\other\reg-icon-ht.reg"
echo. >> "%~dp0game-files\other\reg-icon-ht.reg"
echo [HKEY_CLASSES_ROOT\HolyTextFile] >> "%~dp0game-files\other\reg-icon-ht.reg"
echo @="DNGUGotE3 Holy Save File" >> "%~dp0game-files\other\reg-icon-ht.reg"
echo. >> "%~dp0game-files\other\reg-icon-ht.reg"
echo [HKEY_CLASSES_ROOT\HolyTextFile\DefaultIcon] >> "%~dp0game-files\other\reg-icon-ht.reg"
echo @="%REG_PATH%game-files\\icons\\holytext.ico,0" >> "%~dp0game-files\other\reg-icon-ht.reg"
echo. >> "%~dp0game-files\other\reg-icon-ht.reg"
echo [HKEY_CLASSES_ROOT\HolyTextFile\shell\open\command] >> "%~dp0game-files\other\reg-icon-ht.reg"
echo @="notepad.exe %%1" >> "%~dp0game-files\other\reg-icon-ht.reg"

:: 3. Generate internal shortcuts inside /game-files/
echo Set oWS = WScript.CreateObject("WScript.Shell") > create_shortcuts.vbs
echo Set oLink = oWS.CreateShortcut("%~dp0game-files\game.lnk") >> create_shortcuts.vbs
echo oLink.TargetPath = "%~dp0game-files\DNGUGotE3.bat" >> create_shortcuts.vbs
echo oLink.Save >> create_shortcuts.vbs

echo Set oLink = oWS.CreateShortcut("%~dp0game-files\game-o.lnk") >> create_shortcuts.vbs
echo oLink.TargetPath = "%~dp0game-files\DNGUGotE3-old.bat" >> create_shortcuts.vbs
echo oLink.Save >> create_shortcuts.vbs

echo Set oLink = oWS.CreateShortcut("%~dp0game-files\card.lnk") >> create_shortcuts.vbs
echo oLink.TargetPath = "%~dp0game-files\open-c.vbs" >> create_shortcuts.vbs
echo oLink.Save >> create_shortcuts.vbs
cscript //nologo create_shortcuts.vbs
del create_shortcuts.vbs

:: 4. Optional Desktop Shortcut
echo.
echo Make Desktop shortcut^?
choice /C:yn
if errorlevel 2 goto end

echo Set oWS = WScript.CreateObject("WScript.Shell") > create_desktop.vbs
echo sDesk = oWS.SpecialFolders("Desktop") >> create_desktop.vbs
echo Set oLink = oWS.CreateShortcut(sDesk ^& "\DNGUGotE3.lnk") >> create_desktop.vbs
echo oLink.TargetPath = "%~dp0game-files\open-l.vbs" >> create_desktop.vbs
echo oLink.IconLocation = "%~dp0game-files\icons\dngugote3.ico" >> create_desktop.vbs
echo oLink.Save >> create_desktop.vbs
cscript //nologo create_desktop.vbs
del create_desktop.vbs

:end
echo Installation complete.
pause