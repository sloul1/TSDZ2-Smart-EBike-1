@echo off
if exist "%windir%\syswow64\cmd.exe" goto CYGWIN64

PATH = %PATH%;%~dp0..\tools\cygwin_32\bin;
goto BUILD

:CYGWIN64
PATH = %PATH%;%~dp0..\tools\cygwin_64\bin;

:BUILD
echo Build started...
timeout /t 2 > nul
make all
if errorlevel 1 goto FAIL

:PASS
goto EXIT
:FAIL
echo Build error!!
pause
:EXIT
exit /b %ERRORLEVEL%