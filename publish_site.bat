@echo off
cd /d %~dp0
echo サイト情報を更新中...
powershell -ExecutionPolicy Bypass -File .\update-blog-index.ps1
if %errorlevel% neq 0 (
    echo エラーが発生しました。更新を中止します。
    pause
    exit /b
)

echo.
echo GitHubへアップロード中...
git add .
git commit -m "Site update: %date% %time%"
git push

if %errorlevel% neq 0 (
    echo エラーが発生しました。GitHubへの送信に失敗しました。
    pause
    exit /b
)

echo.
echo ========================================
echo  すべての処理が完了しました！
echo  数分後にサイトが更新されます。
echo ========================================
pause
