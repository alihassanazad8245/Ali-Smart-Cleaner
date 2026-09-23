@echo off
title Ali-Smart Cleaner
color 0A
setlocal EnableExtensions EnableDelayedExpansion

:: =================================================
:: AUTO ADMIN ELEVATION
:: =================================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

:: =================================================
:: LOG FILE
:: =================================================
set "logFile=%~dp0cleaner_log.txt"


:: =================================================
:: MAIN MENU
:: =================================================
:menu
cls
color 0B

echo =================================================
echo              ALI SMART CLEANER
echo =================================================
echo.
echo   [1] Normal Clean   (Fast ^& Safe)
echo   [2] Deep Clean     (Full Junk Clean)
echo   [3] Selective Clean
echo   [4] Show Disk Space
echo   [5] View Logs
echo   [6] Exit
echo.
echo -------------------------------------------------
set /p "choice=Select option: "

if "%choice%"=="1" goto normal
if "%choice%"=="2" goto deep_confirm
if "%choice%"=="3" goto selective
if "%choice%"=="4" goto disk
if "%choice%"=="5" goto viewlog
if "%choice%"=="6" exit

goto menu


:: =================================================
:: NORMAL CLEAN
:: =================================================
:normal
cls
color 0A

echo =================================================
echo                 NORMAL CLEAN
echo =================================================
echo.
echo Cleaning temporary files...
echo.

del /q /f "%TEMP%\*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1

del /q /f "%WINDIR%\Temp\*" >nul 2>&1
for /d %%D in ("%WINDIR%\Temp\*") do rd /s /q "%%D" >nul 2>&1

echo.
echo Normal cleaning completed successfully.
echo.
echo [%date% %time%] Normal Clean completed >> "%logFile%"

pause
goto menu


:: =================================================
:: DEEP CLEAN CONFIRMATION
:: =================================================
:deep_confirm
cls
color 0E

echo =================================================
echo                  DEEP CLEAN
echo =================================================
echo.
echo WARNING:
echo Deep Clean removes additional temporary and
echo cache files from the system.
echo.
choice /c YN /n /m "Continue? [Y/N]: "

if errorlevel 2 goto menu
if errorlevel 1 goto deep


:: =================================================
:: DEEP CLEAN
:: =================================================
:deep
cls
color 0A

echo =================================================
echo                  DEEP CLEAN
echo =================================================
echo.
echo Cleaning system junk...
echo.

del /q /f "%TEMP%\*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1

del /q /f "%WINDIR%\Temp\*" >nul 2>&1
for /d %%D in ("%WINDIR%\Temp\*") do rd /s /q "%%D" >nul 2>&1

del /q /f "%LOCALAPPDATA%\Temp\*" >nul 2>&1
for /d %%D in ("%LOCALAPPDATA%\Temp\*") do rd /s /q "%%D" >nul 2>&1

echo.
echo Deep cleaning completed successfully.
echo.
echo [%date% %time%] Deep Clean completed >> "%logFile%"

pause
goto menu


:: =================================================
:: SELECTIVE CLEAN MENU
:: =================================================
:selective
cls
color 0D

echo =================================================
echo               SELECTIVE CLEAN
echo =================================================
echo.
echo   [1] User Temp
echo   [2] Windows Temp
echo   [3] Both
echo   [4] Back
echo.
echo -------------------------------------------------
set /p "selectiveChoice=Select option: "

if "%selectiveChoice%"=="1" goto clean_user_temp
if "%selectiveChoice%"=="2" goto clean_windows_temp
if "%selectiveChoice%"=="3" goto clean_both
if "%selectiveChoice%"=="4" goto menu

goto selective


:: =================================================
:: CLEAN USER TEMP
:: =================================================
:clean_user_temp
cls
color 0A

echo =================================================
echo                 USER TEMP CLEAN
echo =================================================
echo.
echo Cleaning User Temp files...
echo.

del /q /f "%TEMP%\*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1

echo.
echo User Temp cleaning completed successfully.
echo.
echo [%date% %time%] User Temp cleaned >> "%logFile%"

pause
goto menu


:: =================================================
:: CLEAN WINDOWS TEMP
:: =================================================
:clean_windows_temp
cls
color 0A

echo =================================================
echo               WINDOWS TEMP CLEAN
echo =================================================
echo.
echo Cleaning Windows Temp files...
echo.

del /q /f "%WINDIR%\Temp\*" >nul 2>&1
for /d %%D in ("%WINDIR%\Temp\*") do rd /s /q "%%D" >nul 2>&1

echo.
echo Windows Temp cleaning completed successfully.
echo.
echo [%date% %time%] Windows Temp cleaned >> "%logFile%"

pause
goto menu


:: =================================================
:: CLEAN BOTH
:: =================================================
:clean_both
cls
color 0A

echo =================================================
echo                  CLEAN BOTH
echo =================================================
echo.
echo Cleaning User Temp...
echo.

del /q /f "%TEMP%\*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1

echo User Temp completed.
echo.
echo Cleaning Windows Temp...
echo.

del /q /f "%WINDIR%\Temp\*" >nul 2>&1
for /d %%D in ("%WINDIR%\Temp\*") do rd /s /q "%%D" >nul 2>&1

echo.
echo Both locations cleaned successfully.
echo.
echo [%date% %time%] User Temp and Windows Temp cleaned >> "%logFile%"

pause
goto menu


:: =================================================
:: DISK SPACE MENU
:: =================================================
:disk
cls
color 09

echo =================================================
echo              DISK SPACE INFORMATION
echo =================================================
echo.
echo   [1] C Drive
echo   [2] Select a Drive
echo   [3] Back
echo.
echo -------------------------------------------------
set /p "diskChoice=Select option: "

if "%diskChoice%"=="1" goto cdrive
if "%diskChoice%"=="2" goto selectdrive
if "%diskChoice%"=="3" goto menu

goto disk


:: =================================================
:: C DRIVE REPORT
:: =================================================
:cdrive
cls
color 09

echo =================================================
echo                 C DRIVE REPORT
echo =================================================
echo.

powershell -NoProfile -Command "$d=Get-CimInstance Win32_LogicalDisk | Where-Object {$_.DeviceID -eq 'C:'}; if($null -eq $d){Write-Host 'C: drive information is unavailable.'} else {$total=[math]::Round($d.Size/1GB,2);$free=[math]::Round($d.FreeSpace/1GB,2);$used=[math]::Round($total-$free,2);$percent=if($total -gt 0){[math]::Round(($used/$total)*100,2)}else{0};Write-Host ('Drive       : '+$d.DeviceID);Write-Host ('Name        : '+$d.VolumeName);Write-Host ('Total Space : '+$total+' GB');Write-Host ('Used Space  : '+$used+' GB');Write-Host ('Free Space  : '+$free+' GB');Write-Host ('Used        : '+$percent+' Percent')}"

echo.
echo -------------------------------------------------
echo.
pause
goto disk


:: =================================================
:: SELECT DRIVE
:: =================================================
:selectdrive
cls
color 09

echo =================================================
echo                 SELECT A DRIVE
echo =================================================
echo.
echo Available drives detected by Windows:
echo.

powershell -NoProfile -Command "$i=1; Get-CimInstance Win32_LogicalDisk | Where-Object DriveType -eq 3 | ForEach-Object {Write-Host ('['+$i+'] '+$_.DeviceID+'  '+$_.VolumeName);$i++}"

echo.
echo -------------------------------------------------
echo NOTE:
echo BitLocker drives must be UNLOCKED first.
echo A locked/inaccessible BitLocker drive may not
echo appear in this list.
echo -------------------------------------------------
echo.
echo Enter 0 to go back.
echo.

set /p "driveNumber=Enter drive number: "

if "%driveNumber%"=="0" goto disk

set "selectedDrive=%driveNumber%"

cls
color 09

echo =================================================
echo                 DRIVE REPORT
echo =================================================
echo.

powershell -NoProfile -Command "$drives=@(Get-CimInstance Win32_LogicalDisk | Where-Object DriveType -eq 3);$n=[int]$env:selectedDrive;if($n -ge 1 -and $n -le $drives.Count){$d=$drives[$n-1];$total=[math]::Round($d.Size/1GB,2);$free=[math]::Round($d.FreeSpace/1GB,2);$used=[math]::Round($total-$free,2);$percent=if($total -gt 0){[math]::Round(($used/$total)*100,2)}else{0};Write-Host ('Drive       : '+$d.DeviceID);Write-Host ('Name        : '+$d.VolumeName);Write-Host ('Total Space : '+$total+' GB');Write-Host ('Used Space  : '+$used+' GB');Write-Host ('Free Space  : '+$free+' GB');Write-Host ('Used        : '+$percent+'%')}else{Write-Host 'Invalid drive selection. Please try again.'}"

echo.
echo -------------------------------------------------
echo.
pause
goto disk


:: =================================================
:: VIEW LOGS
:: =================================================
:viewlog
cls
color 07

echo =================================================
echo                    ACTIVITY LOG
echo =================================================
echo.

if exist "%logFile%" (
    type "%logFile%"
) else (
    echo No activity logs found.
)

echo.
echo -------------------------------------------------
pause
goto menu
