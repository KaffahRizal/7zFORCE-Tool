@echo off
mode 80, 28
setlocal enabledelayedexpansion
chcp 65001 >nul
color 0A
title Bruteforce Tool - by @Zer0Man
cls

:menu
cls
echo.
echo		███████╗███████╗███████╗ ██████╗ ██████╗  ██████╗███████╗
echo		╚════██║╚══███╔╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝
echo		    ██╔╝  ███╔╝ █████╗  ██║   ██║██████╔╝██║     █████╗  
echo		   ██╔╝  ███╔╝  ██╔══╝  ██║   ██║██╔══██╗██║     ██╔══╝  
echo		   ██║  ███████╗██║     ╚██████╔╝██║  ██║╚██████╗███████╗
echo		   ╚═╝  ╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝
echo			ZIP/RAR "7zip" bruteforce tool V.1 - @Zer0Man
echo.
ping -n 1 localhost >nul
echo     [90;1m#═╦═══════»[0m  [92m[Bruteforce zip/rar][0m [95m[1][0m
ping -n 1 localhost >nul
echo     [90;1m  ╠═════════»[0m  [92m[Documentation][0m [95m[2][0m
ping -n 1 localhost >nul
echo       [90;1m╚═╦═════════»[0m  [92m[Exit][0m         [95m[3][0m
echo|set /p=".        [90;1m╚══>[0m "
choice /c 123 /n >nul
set choice=%errorlevel%

if "%choice%"=="1" goto bruteforce
if "%choice%"=="2" goto documentation
if "%choice%"=="3" exit
goto menu

:bruteforce
cls
echo.
echo		███████╗███████╗███████╗ ██████╗ ██████╗  ██████╗███████╗
echo		╚════██║╚══███╔╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝
echo		    ██╔╝  ███╔╝ █████╗  ██║   ██║██████╔╝██║     █████╗  
echo		   ██╔╝  ███╔╝  ██╔══╝  ██║   ██║██╔══██╗██║     ██╔══╝  
echo		   ██║  ███████╗██║     ╚██████╔╝██║  ██║╚██████╗███████╗
echo		   ╚═╝  ╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝
echo			ZIP/RAR "7zip" bruteforce tool V.1 - @Zer0Man
echo.
echo.

set /p "file=Enter ZIP/RAR file path: "
set /p "wordlist=Enter wordlist path: "

if not exist "!file!" (
    echo [×] file not found.
    timeout /t 2 >nul
    goto menu
)

if not exist "!wordlist!" (
    echo [×] Wordlist not found.
    timeout /t 2 >nul
    goto menu
)

set /a found=0
set /a count=0

echo.
echo [*] Starting brute-force...
echo ------------------------

for /f "usebackq delims=" %%P in ("!wordlist!") do (
    set "password=%%P"
    set /a count+=1
    echo [!count!] Trying: !password!
    7z t -p"!password!" "!file!" >nul 2>&1
    if !errorlevel! equ 0 (
        echo.
        echo [✓] Password found: !password!
        set found=1
        goto :done
    )
)

:done
if !found! equ 1 (
    echo.
    echo [*] Total attempts: !count!
) else (
    echo.
    echo [×] Password not found in wordlist.
    echo [*] Total attempts: !count!
)
pause
goto menu

:documentation
cls
echo.
echo ===========================
echo ╔═(*)makesure 7z installed and added to path  check:(type "7z" on your cmd)
echo ║                  
echo ╠═══(1)if doesnt... read the docs below
echo ║              
echo ╠═════(2)If you have any feedback or questions, feel free to leave a comment
echo ║in the documentation's comment section.
echo ╚═══════(3)documentation :
echo	 Documentation Link:
echo	 https://your.documentation.link/here
echo ===========================
echo.
pause
goto menu
