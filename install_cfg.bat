@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul

:: ======================================================
:: CS2 AUTOEXEC INSTALLER - elemikelo
:: ======================================================

echo.
echo =====================================================
echo          CS2 AUTOEXEC INSTALLER - elemikelo
echo =====================================================
echo.

:: -------------------------------------------
:: Posibles rutas de Steam
:: -------------------------------------------

set "PATH1=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
set "PATH2=D:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
set "PATH3=E:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"

if exist "%PATH1%" set "FINAL_PATH=%PATH1%"
if exist "%PATH2%" set "FINAL_PATH=%PATH2%"
if exist "%PATH3%" set "FINAL_PATH=%PATH3%"

:: Si no se detecta ruta automáticamente
if not defined FINAL_PATH (
    echo [WARN] No se detecto la carpeta cfg automaticamente.
    set /p FINAL_PATH=Introduce la ruta manualmente: 
)

echo.
echo [INFO] Ruta destino:
echo %FINAL_PATH%
echo.

:: Crear carpeta si no existe
if not exist "%FINAL_PATH%" (
    mkdir "%FINAL_PATH%"
    echo [INFO] Carpeta cfg creada
)

echo.
echo ==============================================
echo Copiando configuracion
echo ==============================================
echo.

echo [INFO] Copiando configuraciones...

:: Copiar todos los .cfg del proyecto automáticamente
for /r %%F in (*.cfg) do (
    if /I not "%%~nxF"=="install_cfg.bat" (
        copy /y "%%F" "%FINAL_PATH%" >nul
        echo [OK] %%~nxF
    )
)

echo.
echo =====================================================
echo               INSTALACION COMPLETADA
echo =====================================================
echo.
echo Recuerda añadir en Steam:
echo +exec autoexec.cfg
echo.

pause
