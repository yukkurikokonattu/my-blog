@echo off
cd /d %~dp0
powershell -ExecutionPolicy Bypass -File .\create-announcement.ps1
pause
