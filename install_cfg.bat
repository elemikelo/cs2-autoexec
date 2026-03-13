@echo off
setlocal

set "DEFAULT_PATH=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"

echo ===========================================
echo    CS2 AUTOEXEC INSTALLER - elemikelo
echo ===========================================
echo.

:: Detectar ruta automáticamente
if exist "%DEFAULT_PATH%" (
    set "FINAL_PATH=%DEFAULT_PATH%"
    echo [INFO] Ruta de CS2 encontrada.
) else (
    echo [WARNING] No se encontro la ruta automaticamente.
    set /p "FINAL_PATH=Introduce la ruta de tu carpeta cfg: "
)

echo.
echo Instalando configuracion en:
echo %FINAL_PATH%
echo.

:: Crear carpeta si no existe
if not exist "%FINAL_PATH%" (
    mkdir "%FINAL_PATH%"
)

echo Copiando archivos...

:: Copiar autoexec
if exist "autoexec.cfg" (
    copy /y "autoexec.cfg" "%FINAL_PATH%" >nul
)

:: Copiar kz
if exist "kz.cfg" (
    copy /y "kz.cfg" "%FINAL_PATH%" >nul
)

:: Copiar configs carpeta CFG
if exist "CFG" (
    for %%f in (CFG\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%" >nul
    )
)

:: Copiar configs carpeta otag
if exist "otag" (
    for %%f in (otag\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%" >nul
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
