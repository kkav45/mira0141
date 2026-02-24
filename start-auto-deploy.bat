@echo off
chcp 65001 >nul
echo ========================================
echo   MIRA - Автозагрузка на GitHub
echo ========================================
echo.
echo [INFO] Запуск мониторинга файлов...
echo [INFO] Автоматическая загрузка при изменении
echo [INFO] Для остановки нажмите Ctrl+C
echo.
echo ========================================
echo.

REM Проверка PowerShell
powershell -Command "Get-ExecutionPolicy" >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] PowerShell не найден!
    pause
    exit /b 1
)

REM Запуск скрипта автозагрузки
powershell -ExecutionPolicy Bypass -File "%~dp0auto-deploy.ps1"

pause
