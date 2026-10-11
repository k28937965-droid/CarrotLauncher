@echo off
setlocal
cd /d "%~dp0"
set PORT=8080
where python >nul 2>nul
if %errorlevel%==0 goto py
where py >nul 2>nul
if %errorlevel%==0 goto pylauncher
where node >nul 2>nul
if %errorlevel%==0 goto node
echo Echo needs Python or Node.js to run a local server.
echo Install one from python.org or nodejs.org, then run this file again.
pause
exit /b 1
:py
start "" cmd /c "timeout /t 2 >nul & start http://localhost:%PORT%"
echo Echo is running at http://localhost:%PORT%  (close this window to stop)
python -m http.server %PORT%
goto end
:pylauncher
start "" cmd /c "timeout /t 2 >nul & start http://localhost:%PORT%"
echo Echo is running at http://localhost:%PORT%  (close this window to stop)
py -m http.server %PORT%
goto end
:node
start "" cmd /c "timeout /t 3 >nul & start http://localhost:%PORT%"
echo Echo is running at http://localhost:%PORT%  (close this window to stop)
npx --yes http-server -p %PORT% -c-1
:end
pause
