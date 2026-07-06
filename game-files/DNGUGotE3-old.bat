@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title DA NAPKIN GOD ULTIMATE GAME OF THE EON 3
color 0F

:: --- THE SEAMLESS SETUP PROTOCOL ---
if not exist "saves" (
    if not exist "DNGUGotE3" (
        echo [SYSTEM]: Initializing the Holy Folders...
        mkdir "DNGUGotE3"
        mkdir "DNGUGotE3\saves"
        echo [SYSTEM]: Moving Pitsouli and following...
        move "%~nx0" "DNGUGotE3\" >nul
        cd "DNGUGotE3"
        start "" "%~nx0"
        exit
    ) else (
        move "%~nx0" "DNGUGotE3\" >nul
        cd "DNGUGotE3"
        start "" "%~nx0"
        exit
    )
)

:INTRO
cls
color 35
echo.
echo  ┳┓┏┓  ┳┓┏┓┏┓┓┏┓┳┳┓  ┏┓┏┓┳┓  ┳┳┓ ┏┳┓┳┳┳┓┏┓┏┳┓┏┓  ┏┓┏┓┳┳┓┏┓  ┏┓┏┓  ┏┳┓┓┏┏┓  ┏┓┏┓┳┓  ┳┳┳
echo  ┃┃┣┫  ┃┃┣┫┃┃┃┫ ┃┃┃  ┃┓┃┃┃┃  ┃┃┃  ┃ ┃┃┃┃┣┫ ┃ ┣   ┃┓┣┫┃┃┃┣   ┃┃┣    ┃ ┣┫┣   ┣ ┃┃┃┃  ┃┃┃
echo  ┻┛┛┗  ┛┗┛┗┣┛┛┗┛┻┛┗  ┗┛┗┛┻┛  ┗┛┗┛ ┻ ┻┛ ┗┛┗ ┻ ┗┛  ┗┛┛┗┛ ┗┗┛  ┗┛┻    ┻ ┛┗┗┛  ┗┛┗┛┛┗  ┻┻┻
echo.
echo                           PRESS ANY KEY TO START THE EON
echo.
echo.
echo.
echo                                                               use theme "IBM 5153" for best look
pause >nul
color 0F

:: --- INITIAL STATS ---
set hp=20
set max_hp=20
set attack=8
set gold=0
set divinity=0
set level=1
set xp=0
set "e_row1= " & set "e_row2= " & set "e_row3= " & set "e_row4= " & set "e_row5= "

:HUB
cls
color 6
echo.
echo    ____________________________________________________________
echo   ^|                                                           ^|
echo   ^|      DA NAPKIN GOD  ULTIMATE  GAME  OF  THE  EON III      ^|
echo   ^|___________________________________________________________^|
echo.
echo      [ HERO: Pitsouli ]  LVL: %level%  XP: %xp%/100
echo      [ STATUS ] HP: %hp%/%max_hp% ^| Gold: %gold% ^| Div: %divinity%
echo.
echo      :::::::........:::::
echo      :::::..:^&@@@@^&:..:::
echo      :::..:^&@@@@^&::^&^&:..:
echo      :..:^&@@^&::^&^&::^&^&:..:
echo      :..:^&@@^&:..........:   "The Whole-Napkin
echo      :..:^&^&:......:^&@@^&:.    is my witness."
echo      .........:^&^&::^&@@^&:.
echo      .:^&@@^&::^&@@^&::^&@@^&:.
echo      .:^&@@@@@@@@@@@@@@^&:.
echo      ....................
echo.
echo   1. BATTLE  2. SHOP  3. ALTAR  4. SAVE  5. LOAD  6. EXIT
echo -------------------------------------------------
set /p choice="Where Shall We Head?  "

if "%choice%"=="1" goto ENCOUNTER
if "%choice%"=="2" goto SHOP
if "%choice%"=="3" goto ALTAR
if "%choice%"=="4" goto SAVE_GAME
if "%choice%"=="5" goto LOAD_GAME
if "%choice%"=="6" exit
goto HUB

:SAVE_GAME
(echo %hp%&echo %max_hp%&echo %attack%&echo %gold%&echo %divinity%&echo %level%&echo %xp%) > "saves\save.holytext"
echo Progress recorded in the holy files.
pause
goto HUB

:LOAD_GAME
if not exist "saves\save.holytext" (echo No save found!&pause&goto HUB)
set i=0
for /f "tokens=*" %%a in (saves\save.holytext) do (
    set /a i+=1
    if !i!==1 set hp=%%a
    if !i!==2 set max_hp=%%a
    if !i!==3 set attack=%%a
    if !i!==4 set gold=%%a
    if !i!==5 set divinity=%%a
    if !i!==6 set level=%%a
    if !i!==7 set xp=%%a
)
echo Pitsouli unfolds from the past.
pause
goto HUB

:ENCOUNTER
cls
set /a chance=%random% %% 10
if %chance% GEQ 8 (goto BOSS_BATTLE)
goto MOB_BATTLE

:MOB_BATTLE
set /a e_pick=%random% %% 3
if %e_pick%==0 (
    set "e_name=SOGGY SCRAP"
    set /a e_hp=15
    set /a e_at=3
    set "e_row1=   ~~~~~~~   "
    set "e_row2=  ~~~~~~~~~  "
    set "e_row3= ~~~~~(O)~~~  "
    set "e_row4=  ~~~~~~~~~  "
    set "e_row5=   ~~~~~~~   "
)
if %e_pick%==1 (
    set "e_name=TAPE ELITE"
    set /a e_hp=25
    set /a e_at=5
    :: Carets (^) added to escape the brackets and plus signs
    set "e_row1=  __________  "
    set "e_row2= ^|          ^| "
    set "e_row3= ^| [=]  [=] ^| "
    set "e_row4= ^|  ++++++  ^| "
    set "e_row5= ^|__________^| "
)
if %e_pick%==2 (
    set "e_name=GREASE WRAITH"
    set /a e_hp=20
    set /a e_at=7
    set "e_row1=    .@@@@.    "
    set "e_row2=   @ * * @   "
    set "e_row3=   @  __  @   "
    set "e_row4=   ' @  @ '   "
    set "e_row5=    '@@@@'    "
)
goto BATTLE_LOOP

:BOSS_BATTLE
cls
color 0C
echo !!! THE ULTIMATE UNWIPED ENTITY EMERGES !!!
pause
set "e_name=UNWIPED ENTITY"
set /a e_hp=150 & set /a e_at=12
:: Escaping the brackets and arrows to prevent the crash
set "e_row1=    [[BOSS]]    "
set "e_row2=  ^<XXXXXXXXXX^>  "
set "e_row3= ^<XX  [!]  XX^> "
set "e_row4=  ^<XXXXXXXXXX^>  "
set "e_row5=    [V V V]    "
goto BATTLE_LOOP
:BATTLE_LOOP
cls
color 01
echo FIGHTING: %e_name% 
echo.
:: Rendering the 5-row enemy sprite
echo %e_row1%
echo %e_row2%
echo %e_row3%
echo %e_row4%
echo %e_row5%
echo.
echo Enemy HP: %e_hp%
echo.
echo Pitsouli HP: %hp%/%max_hp% ^| Divinity: %divinity%
echo.
echo      :::::::........:::::
echo      :::::..:^&@@@@^&:..:::
echo      :::..:^&@@@@^&::^&^&:..:
echo      :..:^&@@^&::^&^&::^&^&:..:
echo      :..:^&@@^&:..........:   
echo      :..:^&^&:......:^&@@^&:.   
echo      .........:^&^&::^&@@^&:.
echo      .:^&@@^&::^&@@^&::^&@@^&:.
echo      .:^&@@@@@@@@@@@@@@^&:.
echo      ....................
echo.

echo.
echo 1) Slash  2) Divine Burst (-10 Div)
echo.
set /p act="Selection: "

if "%act%"=="1" (
    color C4
    set /a p_dmg=%random% %% attack + 4
    set /a e_hp-=p_dmg
    echo.
    echo [ACTION]: You slash for !p_dmg! damage!
    timeout /t 2 >nul
    color 0C
)
if "%act%"=="2" (
    if %divinity% GEQ 10 (
        set /a p_dmg=attack * 2 + 5
        set /a e_hp-=p_dmg
        set /a divinity-=10
        echo.
        echo [DIVINE]: BURST OF FIBER! !p_dmg! damage!
        timeout /t 2 >nul
    ) else (
        echo [SYSTEM]: Low Divinity!
        pause >nul
        goto BATTLE_LOOP
    )
)

if %e_hp% LEQ 0 goto MOB_WIN

set /a m_dmg=%random% %% e_at + 1
set /a hp-=m_dmg
echo [ENEMY]: %e_name% hits for !m_dmg! damage!
timeout /t 1 >nul
if %hp% LEQ 0 goto DEATH
goto BATTLE_LOOP

:MOB_WIN
color 0F
set /a g_gain=%random% %% 20 + 10
set /a gold+=g_gain & set /a xp+=35
echo Victory! +!g_gain! Gold and 35 XP.
if %xp% GEQ 100 (goto LEVEL_UP) else (pause & goto HUB)

:LEVEL_UP
set /a level+=1 & set /a xp=0 & set /a max_hp+=15 & set /a hp=max_hp & set /a attack+=3
color 19
echo LEVEL UP! Pitsouli is Level !level!.
pause
goto HUB

:SHOP
cls
color 9
echo === PIZZERIA SHOP ===
echo Gold: %gold%
echo 1) Extra Pulp (Heal 25) - 20G
echo 2) Fiber Polish (+3 Atk) - 50G
echo 3) Back
set /p buy="Choice: "
if "%buy%"=="1" if %gold% GEQ 20 (set /a hp+=25 & set /a gold-=20 & if !hp! GTR !max_hp! set hp=!max_hp!)
if "%buy%"=="2" if %gold% GEQ 50 (set /a attack+=3 & set /a gold-=50)
goto HUB

:ALTAR
cls
color E6
echo.
echo           .  .  .  THE THRONE OF FIBERS  .  .  .
echo.
echo                  .____________________.
echo                 /                      \
echo                /                        \
echo               ^|                        ^|
echo               ^|                        ^|
echo               ^|                        ^|
echo               ^|                        ^|
echo               ^|                        ^|
echo               ^|                        ^|
echo               ^|                        ^|
echo            ___^|________________________^|___
echo           /                                 \
echo          /          * * * * * * * *          \
echo         /_____________________________________\
echo.
echo       "Pitsouli, sacrifice 30 Gold for 15 Divinity?"
echo.
echo                1) YES, I OFFER MY WEALTH
echo                2) NO, I MUST GO
echo.
set /p alt="Selection: "

if "%alt%"=="1" (
    if %gold% GEQ 30 (
        set /a gold-=30
        set /a divinity+=15
        echo.
        echo       [!] THE FIBERS ABSORB YOUR OFFERING...
        timeout /t 2 >nul
    ) else (
        echo.
        echo       [!] YOU LACK THE COINS TO FEED THE FOLD.
        pause >nul
    )
)
goto HUB
:DEATH
cls
:: --- ANSI COLORS ---
set "blk=[30m"
set "red=[31m"
set "wht=[37m"
set "reset=[0m"

color 07
echo.
echo    %wht%[!] THE SUCCESSION HAS BEEN CRUMPLED [!]%reset%
echo.

:: 20x20 GRID - EACH LINE IS EXACTLY 20 CHARACTERS WIDE
echo(%blk%................%wht%@@@@@@%blk%.
echo(%blk%...............%wht%@ . @%blk%.
echo(%blk%....................
echo(%blk%..............%wht%@ . @%blk%.
echo(%blk%..........%red%::%blk%..%wht%@@@@@%blk%.
echo(%blk%...........%red%:%blk%...%wht%@@@@@%blk%.
echo(%blk%......%red%::%blk%.%red%::%blk%..........
echo(%blk%..%red%:%blk%.....%red%::%blk%.%red%::%blk%.....%red%:%blk%.
echo(%blk%.....%red%::%blk%.%red%::%blk%.........%red%::%blk%
echo(%blk%..%red%::%blk%.%red%::%blk%.........%red%::%blk%
echo(%red%::%blk%.%red%::%blk%.%red%::%blk%.........%red%:%blk%.
echo(%blk%..%red%::%blk%.%red%::%blk%.......%red%::%blk%..
echo(%red%::%blk%.%red%::%blk%.%red%::%blk%.......%red%:%blk%...
echo(%blk%.........%red%::%blk%.%red%::%blk%.%red%::%blk%
echo(%blk%..........%red%::%blk%.%red%::%blk%....
echo(%blk%.........%red%::%blk%.%red%::%blk%.%red%::%blk%
echo(%blk%....................
echo(%blk%....................
echo(%blk%....................
echo(%blk%....................

echo %reset%
echo    %red%[GOD]:%wht% Pitsouli... your fibers were weak.%reset%
echo.
echo    %wht%FINAL STATS:%reset%
echo    Level: %level%  ^|  Gold: %gold%  ^|  Divinity: %divinity%
echo.
echo    %red%PRESS ANY KEY TO BE DISCARDED...%reset%
pause >nul
exit