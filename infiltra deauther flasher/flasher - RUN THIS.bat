@echo off
title Infiltra Flasher - Manual Flash Mode
setlocal enabledelayedexpansion

:START
cls
:: Banner
echo  ____  _  _  ____  ____  __   ____  ____    __
echo ^(_  _^)( \( )( ___^)(_  _^)(  ) (_  _^)(  _ \  /__\  
echo  _)(_  )  (  )__)  _)(_  )(__  )(   )   / /(__)\   
echo ^(____^)(_)\_)(__)  (____)(____)(__) (_)\_)(__)(__)  
echo  ____  __      __    ___  _   _  ____  ____        
echo ^( ___^)(  )    /__\  / __)( )_( )( ___^)(  _ \       
echo  )__)  )(__  /(__)\ \__ \ ) _ (  )__)  )   /       
echo ^(__)^  (____)(__)(__)(___/(_) (_)(____)(_)\_)  
echo.
echo === Infiltra Flasher for BW16 ===
echo.

:: List COM ports
echo Available COM ports:
set /a i=1
for /f "tokens=3 delims= " %%a in ('reg query "HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\SERIALCOMM"') do (
    echo  !i!. %%a
    set "COM!i!=%%a"
    set /a i+=1
)

:: COM port selection
set /p sel=Enter the number of the COM port to use: 
set "com_port=!COM%sel%!"

if "%com_port%"=="" (
    echo Invalid selection! Try again.
    pause
    goto START
)

:: Instructions for manual flash mode
echo.
echo *** MANUAL FLASH MODE REQUIRED ***
echo.
echo 1. PRESS AND HOLD THE BOOT BUTTON (IO0 / FLASH)
echo 2. PRESS AND RELEASE THE RESET BUTTON (EN)
echo 3. THEN RELEASE THE BOOT BUTTON
echo.
echo PRESS ANY KEY WHEN THE MODULE IS IN FLASH MODE...
pause >nul

:: Flash
echo.
echo Flashing BW16 on port %com_port% with km0_km4_image2.bin...
amebatool.exe ".\km0_km4_image2.bin" %com_port% --verbose=5

:: Done message
echo.
echo DONE FLASHING.
echo.

:: Finish or retry
echo Press any key to finish, or press R to retry...
set "choice="
set /p choice= 
if /i "!choice!"=="R" goto START

exit
