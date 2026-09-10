@echo off
chcp 65001 >NUL
cd /d "%~dp0"
git add -A
git diff --cached --quiet
if %errorlevel%==0 (
    echo 没有新的改动，无需推送。
    pause
    exit /b
)
git commit -m "Update %date% %time%"
git push
if %errorlevel%==0 (
    echo.
    echo 推送成功！同事双击"拉取更新.bat"即可拿到最新版。
) else (
    echo.
    echo 推送失败，请截图本窗口求助。
)
pause
