@echo off
title Body Brain Bot - FINAL render (The weather)
cd /d "%~dp0"
echo Getting the newest kit.zip... & powershell -NoProfile -Command "try { Invoke-WebRequest -UseBasicParsing -Uri ('https://raw.githubusercontent.com/Danielyan99/bodybrainbot-medi/claude/project-thread-rcgt0p/skits/2026-11-27-weather/kit.zip?v=' + (Get-Random)) -OutFile '%~dp0kit.zip' } catch { Write-Host 'Download failed, using the kit.zip already here.' }"
for %%A in ("%~dp0kit.zip") do echo kit.zip size: %%~zA bytes (newest = 3920462)
echo Unpacking files... & powershell -NoProfile -Command "Expand-Archive -Force -LiteralPath '%~dp0kit.zip' -DestinationPath '%~dp0'"
call :findblender
echo Using: %B%
echo If you see "render device -> CPU" below, close this window and tell Claude.
echo FINAL full-quality render (about 5 min). Do not close this window.
set BBB_PCT=100
set BBB_SAMPLES=20
set BBB_OUT=..\weather-1080x1920.mp4
"%B%" -b -P "%~dp0make_skit.py"
if exist "%~dp0..\weather-1080x1920.mp4" ( echo DONE & start "" "%~dp0..\weather-1080x1920.mp4" ) else ( echo Something went wrong. Send Claude a photo of this window. )
pause
exit /b
:findblender
set "B="
for /d %%D in ("C:\Program Files\Blender Foundation\Blender*") do if exist "%%D\blender.exe" set "B=%%D\blender.exe"
if not defined B if exist "C:\Program Files (x86)\Steam\steamapps\common\Blender\blender.exe" set "B=C:\Program Files (x86)\Steam\steamapps\common\Blender\blender.exe"
if not defined B ( echo Could not find blender.exe & pause & exit )
exit /b
