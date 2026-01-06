@echo off
cd /d %~dp0
powershell -ExecutionPolicy Bypass -File .\create-post.ps1
pause
