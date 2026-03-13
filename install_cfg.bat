@echo off
setlocal

:: ======================================================
:: CS2 AUTOEXEC INSTALLER - elemikelo
:: ======================================================

set "PATH1=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
set "PATH2=D:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
set "PATH3=E:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"

echo ===========================================
echo    CS2 AUTOEXEC INSTALLER - elemikelo
echo ===========================================
echo.

:: Detectar ruta automáticamente
if exist "%PATH1%" set "FINAL_PATH=%PATH1%"
if exist "%PATH2%" set "FINAL_PATH=%PATH2%"
if exist "%PATH3%" set "FINAL_PATH=%PATH3%"

:: Si no se detecta, pedirla manualmente
if not defined FINAL_PATH (
    echo No se pudo detectar la ruta automaticamente.
    set /p "FINAL_PATH=Introduce la ruta de la carpeta cfg: "
)

echo.
echo Instalando configuracion en:
echo %FINAL_PATH%
echo.

:: Crear carpeta si no existe
if not exist "%FINAL_PATH%" mkdir "%FINAL_PATH%"

echo Copiando archivos...
echo.

:: Copiar autoexec
if exist "autoexec.cfg" (
    copy /y "autoexec.cfg" "%FINAL_PATH%" >nul
    echo [OK] autoexec.cfg
)

:: Copiar configuraciones principales
if exist "configs" (
    for %%f in (configs\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%" >nul
        echo [OK] %%~nxf
    )
)

:: Copiar scripts de movement
if exist "movement" (
    for %%f in (movement\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%" >nul
        echo [OK] %%~nxf
    )
)

echo.
echo ===========================================
echo      INSTALACION COMPLETADA
echo ===========================================
echo.
echo Recuerda añadir en Steam:
echo +exec autoexec.cfg
echo.

pause
