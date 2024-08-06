@echo off
setlocal

REM Prompt user for the port number
set /p PORT=Enter the port number you want to free: 

REM Find the process ID (PID) using the specified port
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%PORT%') do (
    set PID=%%a
)

REM Check if PID is set
if "%PID%"=="" (
    echo No process found running on port %PORT%
    goto :EOF
)

REM Kill the process using the found PID
echo Killing process with PID %PID% using port %PORT%
taskkill /PID %PID% /F

echo Process on port %PORT% has been terminated.

endlocal
pause
