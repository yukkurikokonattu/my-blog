@echo off
cd /d %~dp0
powershell -ExecutionPolicy Bypass -File .\update-blog-index.ps1
echo.
echo 更新が完了しました。何かキーを押すと閉じます...
pause >nul
