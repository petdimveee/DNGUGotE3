@echo off
cd /d "%~dp0

:MENU
:: ... keep your existing menu code here ...
title Holy Card Viewer
cls

:CHOOSE_HERO
echo ===========================================
echo        HOLY STATUS CARD LAUNCHER
echo ===========================================
echo.
echo [P] - View Pitsouli's Visual Status Card
echo [J] - View Jimmy's Visual Status Card
echo [Q] - Quit Launcher
echo.
echo ===========================================
set /p choice="Choose a hero [P, J]?: "

if /i "%choice%"=="P" goto RUN_PITSOULI
if /i "%choice%"=="J" goto RUN_JIMMY
if /i "%choice%"=="Q" exit
goto INVALID

:RUN_PITSOULI
cls
echo Launching visual display card for Pitsouli...
make-im.exe vis-ht.ahk "Pitsouli"
goto END

:RUN_JIMMY
cls
echo Launching visual display card for Jimmy...
make-im.exe vis-ht.ahk "Jimmy"
goto END

:INVALID
cls
echo [ERROR]: Invalid selection! Please enter P, J, or Q.
echo.
goto CHOOSE_HERO

:END
echo.
echo Window closed. Returning to terminal loop
exit

:LAUNCH_GAME
call DNGUGotE3.bat
exit

:LAUNCH_OLD
call DNGUGotE3-old.bat
exit