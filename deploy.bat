@echo off
chcp 65001 >nul
echo ========================================
echo   MIRA - Автоматическая загрузка на GitHub
echo ========================================
echo.

REM Проверка наличия изменений
git status >nul 2>&1
if %errorlevel% neq 0 (
    echo [ОШИБКА] Это не Git репозиторий!
    echo Выполните: git init
    pause
    exit /b 1
)

REM Добавление всех изменений
echo [1/4] Добавление файлов...
git add .

REM Коммит
echo [2/4] Создание коммита...
git commit -m "Auto-update: %date% %time%"

REM Пуш на GitHub
echo [3/4] Загрузка на GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   [УСПЕХ] Загрузка завершена!
    echo ========================================
    echo.
    echo Репозиторий: https://github.com/kkav45/mira0141
) else (
    echo.
    echo ========================================
    echo   [ОШИБКА] Не удалось загрузить файлы
    echo ========================================
    echo.
    echo Возможные причины:
    echo - Нет подключения к интернету
    echo - Не настроен SSH ключ
    echo - Репозиторий не существует
)

echo.
pause
