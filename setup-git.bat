@echo off
chcp 65001 >nul
echo ========================================
echo   MIRA - Настройка Git и GitHub
echo ========================================
echo.

REM Проверка установленного Git
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ОШИБКА] Git не установлен!
    echo.
    echo Скачайте и установите: https://git-scm.com/download/win
    echo После установки запустите этот скрипт снова
    pause
    exit /b 1
)

echo [1/5] Git установлен. Версия:
git --version
echo.

REM Настройка имени пользователя
echo [2/5] Настройка имени пользователя...
set /p GIT_USER="Введите ваше имя для Git: "
if "%GIT_USER%"=="" set GIT_USER=kkav45
git config --global user.name "%GIT_USER%"
echo Имя установлено: %GIT_USER%
echo.

REM Настройка email
echo [3/5] Настройка email...
set /p GIT_EMAIL="Введите ваш email: "
if "%GIT_EMAIL%"=="" set GIT_EMAIL=user@example.com
git config --global user.email "%GIT_EMAIL%"
echo Email установлен: %GIT_EMAIL%
echo.

REM Инициализация репозитория
echo [4/5] Инициализация репозитория...
if not exist .git (
    git init
    echo Репозиторий инициализирован
) else (
    echo Репозиторий уже инициализирован
)
echo.

REM Добавление удалённого репозитория
echo [5/5] Настройка удалённого репозитория...
git remote remove origin 2>nul
git remote add origin https://github.com/kkav45/mira0141.git
echo Удалённый репозиторий добавлен
echo.

echo ========================================
echo   Настройка завершена!
echo ========================================
echo.
echo Теперь запустите deploy.bat для загрузки
echo.
pause
