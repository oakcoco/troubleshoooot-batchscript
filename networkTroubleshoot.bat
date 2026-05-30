@echo off
title Advanced Windows Network Toolkit
color 0A

:menu
cls
echo =====================================
echo    ADVANCED NETWORK TOOLKIT
echo =====================================
echo.
echo  [1]  Show Full IP Configuration
echo  [2]  Ping Google (Connectivity Test)
echo  [3]  Flush DNS Cache
echo  [4]  Release IP Address
echo  [5]  Renew IP Address
echo  [6]  Reset Winsock
echo  [7]  Reset TCP/IP Stack
echo  [8]  Open Network Connections
echo  [9]  Open WiFi Settings
echo  [10] Open Device Manager
echo  [11] Open Network Troubleshooter
echo  [12] Speed Test Ping (Continuous)
echo  [13] Restart Explorer
echo  [14] Exit
echo.
set /p choice=Enter Option: 

if "%choice%"=="" (
    echo No input detected. Please enter a number.
    pause
    goto menu
)

if "%choice%"=="1"  goto opt1
if "%choice%"=="2"  goto opt2
if "%choice%"=="3"  goto opt3
if "%choice%"=="4"  goto opt4
if "%choice%"=="5"  goto opt5
if "%choice%"=="6"  goto opt6
if "%choice%"=="7"  goto opt7
if "%choice%"=="8"  goto opt8
if "%choice%"=="9"  goto opt9
if "%choice%"=="10" goto opt10
if "%choice%"=="11" goto opt11
if "%choice%"=="12" goto opt12
if "%choice%"=="13" goto opt13
if "%choice%"=="14" goto opt14

echo Invalid option. Please enter a number between 1 and 14.
pause
goto menu

:opt1
cls
echo [INFO] Showing full IP configuration...
echo.
ipconfig /all
pause
goto menu

:opt2
cls
echo [INFO] Pinging google.com to test connectivity...
echo.
ping google.com
pause
goto menu

:opt3
cls
echo [INFO] Flushing DNS resolver cache...
echo.
ipconfig /flushdns
echo.
echo [DONE] DNS cache has been flushed.
pause
goto menu

:opt4
cls
echo [INFO] Releasing current IP address...
echo.
ipconfig /release
echo.
echo [DONE] IP address released.
pause
goto menu

:opt5
cls
echo [INFO] Requesting new IP address from DHCP server...
echo.
ipconfig /renew
echo.
echo [DONE] IP address renewed.
pause
goto menu

:opt6
cls
echo [WARNING] Resetting Winsock catalog...
echo [WARNING] A system REBOOT is required after this step.
echo.
netsh winsock reset
echo.
echo [DONE] Winsock reset complete. Please restart your computer.
pause
goto menu

:opt7
cls
echo [WARNING] Resetting TCP/IP stack...
echo [WARNING] A system REBOOT is required after this step.
echo.
netsh int ip reset
echo.
echo [DONE] TCP/IP stack reset complete. Please restart your computer.
pause
goto menu

:opt8
cls
echo [INFO] Opening Network Connections...
echo.
start ncpa.cpl
pause
goto menu

:opt9
cls
echo [INFO] Opening WiFi Settings...
echo.
start ms-settings:network-wifi
pause
goto menu

:opt10
cls
echo [INFO] Opening Device Manager...
echo.
start devmgmt.msc
pause
goto menu

:opt11
cls
echo [INFO] Launching Windows Network Troubleshooter...
echo.
msdt.exe /id NetworkDiagnosticsNetworkAdapter
pause
goto menu

:opt12
cls
echo [INFO] Starting continuous ping to 8.8.8.8 (Google DNS)...
echo [INFO] Press Ctrl+C to stop the test.
echo.
ping 8.8.8.8 -t
pause
goto menu

:opt13
cls
echo [INFO] Restarting Windows Explorer...
echo [INFO] Your screen may briefly go black. This is normal.
echo.
taskkill /f /im explorer.exe
start explorer.exe
echo.
echo [DONE] Explorer restarted successfully.
pause
goto menu

:opt14
cls
echo Exiting Advanced Network Toolkit. Goodbye!
timeout /t 2 /nobreak >nul
exit