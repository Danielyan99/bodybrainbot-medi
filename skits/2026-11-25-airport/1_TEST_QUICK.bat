@echo off
title Body Brain Bot - QUICK TEST (Airport scanner)
cd /d "%~dp0"
echo Unpacking files... & powershell -NoProfile -Command "Expand-Archive -Force -LiteralPath '%~dp0kit.zip' -DestinationPath '%~dp0'"
call :findblender
echo Using: %B%
echo If you see "render device -> CPU" below, close this window and tell Claude.
echo Quick low-quality test (about 1-2 min). Do not close this window.
set BBB_PCT=50

set BBB_SAMPLES=6

set BBB_OUT=airport-scanner-TEST-low-quality.mp4

"%B%" -b -P "%~dp0make_skit.py"
if exist "%~dp0airport-scanner-TEST-low-quality.mp4" ( echo DONE & start "" "%~dp0airport-scanner-TEST-low-quality.mp4" ) else ( echo Something went wrong. Send Claude a photo of this window. )
pause
exit /b
:findblender
set "B="
for /d %%D in ("C:\Program Files\Blender Foundation\Blender*") do if exist "%%D\blender.exe" set "B=%%D\blender.exe"
if not defined B if exist "C:\Program Files (x86)\Steam\steamapps\common\Blender\blender.exe" set "B=C:\Program Files (x86)\Steam\steamapps\common\Blender\blender.exe"
if not defined B ( echo Could not find blender.exe & pause & exit )
exit /b
