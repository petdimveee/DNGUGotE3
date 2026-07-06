@echo off
mode 87,40
setlocal enabledelayedexpansion
chcp 65001 >nul
title DA NAPKIN GOD ULTIMATE GAME OF THE EON 3
color 0F
cd /d "%~dp0"

:: --- THE SEAMLESS SETUP PROTOCOL ---
for %%I in ("%cd%") do set "curDir=%%~nxI"
if /i "%curDir%"=="DNGUGotE3" goto INTRO

if not exist "saves" (
    echo [SYSTEM]: Initializing the Holy Folders...
    mkdir "DNGUGotE3\saves"
)

:INTRO
cls
color 35
echo.
echo  ┳┓┏┓  ┳┓┏┓┏┓┓┏┓┳┳┓  ┏┓┏┓┳┓  ┳┳┓ ┏┳┓┳┳┳┓┏┓┏┳┓┏┓  ┏┓┏┓┳┳┓┏┓  ┏┓┏┓  ┏┳┓┓┏┏┓  ┏┓┏┓┳┓  ┳┳┳
echo  ┃┃┣┫  ┃┃┣┫┃┃┃┫ ┃┃┃  ┃┓┃┃┃┃  ┃┃┃  ┃ ┃┃┃┃┣┫ ┃ ┣   ┃┓┣┫┃┃┃┣   ┃┃┣    ┃ ┣┫┣   ┣ ┃┃┃┃  ┃┃┃
echo  ┻┛┛┗  ┛┗┛┗┣┛┛┗┛┻┛┗  ┗┛┗┛┻┛  ┗┛┗┛ ┻ ┻┛ ┗┛┗ ┻ ┗┛  ┗┛┛┗┛ ┗┗┛  ┗┛┻    ┻ ┛┗┗┛  ┗┛┗┛┛┗  ┻┻┻
echo.
echo                                PRESS THE "S" KEY TO START
choice /C:se

if errorlevel 2 goto DEBUG
if errorlevel 1 goto CHAR_SELECT
goto INTRO
:CHAR_SELECT
cls
color 34
echo.
echo    [ SELECT YOUR VESSEL ]
echo.
echo    1) PITSOULI                                2) JIMMY
echo    ----------------------------         ----------------------------
echo    Stats: HP 20 ^| ATK 8              Stats: HP 35 ^| ATK 6
echo.
echo       :::::::........:::::              ................:::..........
echo       :::::..:^&@@@@^&:..:::              ..............:::::::........
echo       :::..:^&@@@@^&::^&^&:..:              .............:oO^&^&^&^&O^&o:.....
echo       :..:^&@@^&::^&^&::^&^&:..:              :::::::::..::o^&^&^&^&^&^&^&###o::::
echo       :..:^&@@^&:..........:              :::::::::::0^&OOO00O^&^&^&##O::::
echo       :..:^&^&:......:^&@@^&:.              :::::::....::o0OO0O^&^&^&#@O::::
echo       .........:^&^&::^&@@^&:.              ::::...:oO^&^&^&^&^&^&^&0::0^&@O:::::
echo       .:^&@@^&::^&@@^&::^&@@^&:.              ::..:oo:::oO^&OOOOOOOOO#o:::::
echo    ----------------------------         ----------------------------
echo.
echo    [1] CHOOSE PITSOULI                    [2] CHOOSE JIMMY
echo.
set /p c_choice="Selection > "

if "%c_choice%"=="1" (
    set "p_name=Pitsouli"
    if defined pit_hp (set /a max_hp=pit_hp) else (set /a max_hp=20)
    if defined pit_at (set /a attack=pit_at) else (set /a attack=8)
    if defined pit_lv (set /a level=pit_lv) else (set /a level=1)
    if defined pit_xp (set /a xp=pit_xp) else (set /a xp=0)
    if defined pit_div (set /a divinity=pit_div) else (set /a divinity=0)
    set /a hp=max_hp
    goto INIT_STATS
)

if "%c_choice%"=="2" (
    set "p_name=Jimmy"
    if defined jim_hp (set /a max_hp=jim_hp) else (set /a max_hp=35)
    if defined jim_at (set /a attack=jim_at) else (set /a attack=6)
    if defined jim_lv (set /a level=jim_lv) else (set /a level=1)
    if defined jim_xp (set /a xp=jim_xp) else (set /a xp=0)
    if defined jim_div (set /a divinity=jim_div) else (set /a divinity=0)
    set /a hp=max_hp
    goto INIT_STATS
)
:INIT_STATS
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
echo   ^|                                                            ^|
echo   ^|    DA NAPKIN GOD  ULTIMATE  GAME  OF  THE  EON III       ^|
echo   ^|____________________________________________________________^|
echo.
echo       [ HERO: %p_name% ]  LVL: %level%  XP: %xp%/100
echo       [ STATUS ] HP: %hp%/%max_hp% ^| Gold: %gold% ^| Div: %divinity%
echo.
if "%p_name%"=="Pitsouli" (
    echo        :::::::........:::::
    echo        :::::..:^&@@@@^&:..:::
    echo        :::..:^&@@@@^&::^&^&:..:
    echo        :..:^&@@^&::^&^&::^&^&:..:
    echo        :..:^&@@^&:..........:   "The Napkin
    echo        :..:^&^&:......:^&@@^&:.   is my witness."
    echo        .........:^&^&::^&@@^&:.
    echo        .:^&@@^&::^&@@^&::^&@@^&:.
    echo        .:^&@@@@@@@@@@@@@@^&:.
    echo        ....................
) else (
    echo ................:::..........
    echo ..............:::::::........
    echo .............:oO^&^&^&^&O^&o:.....
    echo :::::::::..::o^&^&^&^&^&^&^&###o::::
    echo :::::::::::0^&OOO00O^&^&^&##O::::
    echo :::::::....::o0OO0O^&^&^&#@O::::
    echo ::::...:oO^&^&^&^&^&^&^&0::0^&@O:::::   **Jimmy noises**
    echo ::..:oo:::oO^&OOOOOOOOO#o:::::    
    echo ::oo::::::::::oOOOO::o^&#0::::
    echo :::::::::::::::::::::o#^&Oo:::
    echo ::::::::::::::::::::::oOO^&o::
    echo ::::::::::::::::::::::::0O^&0:
    echo :::::::::::::::::::::::::::::
)
echo.
echo    1. BATTLE  2. SHOP  3. ALTAR  4. SAVE  5. LOAD  6. EXIT
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
(echo %hp%&echo %max_hp%&echo %attack%&echo %gold%&echo %divinity%&echo %level%&echo %xp%) > "saves\save_%p_name%.holytext"
echo Progress recorded in the holy files.
pause
goto HUB

:LOAD_GAME
if not exist "saves\save_%p_name%.holytext" (echo No save found for %p_name%!&pause&goto HUB)
set i=0
for /f "tokens=*" %%a in (saves\save_%p_name%.holytext) do (
    set /a i+=1
    if !i!==1 set hp=%%a
    if !i!==2 set max_hp=%%a
    if !i!==3 set attack=%%a
    if !i!==4 set gold=%%a
    if !i!==5 set divinity=%%a
    if !i!==6 set level=%%a
    if !i!==7 set xp=%%a
)
echo %p_name% unfolds from the past.
pause
goto HUB

:ENCOUNTER
cls
call :GET_RANDOM
set /a chance=result %% 10
if !chance! GEQ 8 (goto BOSS_BATTLE)
goto MOB_BATTLE

:MOB_BATTLE
call :GET_RANDOM
set /a e_pick=result %% 3
if !e_pick!==0 (
    set "e_name=SOGGY SCRAP"
    set /a e_hp=15
    set /a e_at=3
    set "e_row1=    ~~~~~~~    "
    set "e_row2=  ~~~~~~~~~  "
    set "e_row3= ~~~~~(O)~~~  "
    set "e_row4=  ~~~~~~~~~  "
    set "e_row5=    ~~~~~~~    "
)
if !e_pick!==1 (
    set "e_name=TAPE ELITE"
    set /a e_hp=25
    set /a e_at=5
    set "e_row1=  __________  "
    set "e_row2= ^|          ^| "
    set "e_row3= ^| [=]  [=] ^| "
    set "e_row4= ^|  ++++++  ^| "
    set "e_row5= ^|__________^| "
)
if !e_pick!==2 (
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
set "e_row1=    [[BOSS]]    "
set "e_row2=  ^<XXXXXXXXXX^>  "
set "e_row3= ^<XX  [!]  XX^> "
set "e_row4=  ^<XXXXXXXXXX^>  "
set "e_row5=    [V V V]    "
goto BATTLE_LOOP
:BATTLE_LOOP
cls
color 09
echo FIGHTING: %e_name% 
echo.
echo %e_row1%
echo %e_row2%
echo %e_row3%
echo %e_row4%
echo %e_row5%
echo.
echo Enemy HP: %e_hp%
echo.
echo %p_name% HP: %hp%/%max_hp% ^| Divinity: %divinity%
echo.
:: (Keeping your original art here)
echo 1) Slash  2) Divine Burst (-10 Div)
echo.
set /p act="Selection: "

if "%act%"=="1" (
    color C4
    call :GET_RANDOM
    pause
    set /a p_dmg=(!result! %% attack) + 4
    set /a e_hp=e_hp - p_dmg
    echo.
    echo [ACTION]: You slash for !p_dmg! damage!
    timeout /t 2 >nul
    color 0C
)
if "%act%"=="2" (
    if %divinity% GEQ 10 (
        set /a p_dmg=(attack * 2) + 5
        set /a e_hp=e_hp - p_dmg
        set /a divinity=divinity - 10
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

call :GET_RANDOM
set /a m_dmg=(!result! %% e_at) + 1
set /a hp=hp - m_dmg
echo [ENEMY]: %e_name% hits for !m_dmg! damage!
timeout /t 1 >nul
if %hp% LEQ 0 goto DEATH
goto BATTLE_LOOP

:MOB_WIN
color 0F
call :GET_RANDOM
set /a g_gain=(!result! %% 20) + 10
set /a gold=gold + g_gain
set /a xp=xp + 35
echo Victory! +%g_gain% Gold and 35 XP.
if %xp% GEQ 100 (goto LEVEL_UP) else (pause & goto HUB)
:LEVEL_UP
set /a level+=1 & set /a xp=0 & set /a max_hp+=15 & set /a hp=max_hp & set /a attack+=3
color 19
echo LEVEL UP! %p_name% is Level !level!.
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
echo            .  .  .  THE THRONE OF FIBERS  .  .  .
echo.
echo                    .____________________.
echo                   /                      \
echo                  /                        \
echo                 ^|                        ^|
echo                 ^|                        ^|
echo                 ^|                        ^|
echo                 ^|                        ^|
echo                 ^|                        ^|
echo                 ^|                        ^|
echo                 ^|                        ^|
echo               ___^|________________________^|___
echo              /                                \
echo             /          * * * * * * * * \
echo            /_____________________________________\
echo.
echo        "%p_name%, sacrifice 30 Gold for 15 Divinity?"
echo.
echo                  1) YES, I OFFER MY WEALTH
echo                  2) NO, I MUST GO
echo.
set /p alt="Selection: "

if "%alt%"=="1" (
    if %gold% GEQ 30 (
        set /a gold-=30
        set /a divinity+=15
        echo.
        echo        [!] THE FIBERS ABSORB YOUR OFFERING...
        timeout /t 2 >nul
    ) else (
        echo.
        echo        [!] YOU LACK THE COINS TO FEED THE FOLD.
        pause >nul
    )
)
goto HUB
:DEATH
cls
color 0C
echo.
echo      [!] THE SUCCESSION HAS BEEN CRUMPLED [!]
echo.
echo................@@@@@@.
echo...............@ . @.
echo....................
echo..............@ . @.
echo..........::..@@@@@.
echo...........:...@@@@@.
echo......::.::..........
echo..:.....::.::.....:.
echo.....::.::.........::
echo..::.::.........::
echo::.::.::.........:.
echo..::.::.......::..
echo::.::.::.......:...
echo.........::.::.::
echo..........::.::....
echo.........::.::.::
echo....................
echo....................
echo....................
echo....................
echo.
echo      [GOD]: %p_name%... your fibers were weak.
echo.
echo      FINAL STATS:
echo      Level: %level%  ^|  Gold: %gold%  ^|  Divinity: %divinity%
echo.
echo      PRESS ANY KEY TO BE DISCARDED...
pause >nul
exit

:DEBUG
cls
echo DEBUG & SET
echo.
echo Format: [pit/jim] hp:x xp:y lv:z div:w
set /p "db_input=Inject > "
for /f "tokens=1" %%T in ("%db_input%") do set "target=%%T"
for %%A in (%db_input%) do (
    for /f "tokens=1,2 delims=:" %%G in ("%%A") do (
        if /i "!target!"=="pit" set "!target!_%%G=%%H"
        if /i "!target!"=="jim" set "!target!_%%G=%%H"
    )
)
echo Injection complete.
pause
goto CHAR_SELECT

:GET_RANDOM
set /a result=%time:~-2%
goto :eof