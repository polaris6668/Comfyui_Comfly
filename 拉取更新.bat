@echo off
chcp 65001 >NUL
cd /d "%~dp0"
git pull --no-rebase
if %errorlevel%==0 (
    echo.
    echo 已更新到最新版！重启 ComfyUI 生效。
) else (
    echo.
    echo 更新失败，请截图本窗口求助。
)
pause
