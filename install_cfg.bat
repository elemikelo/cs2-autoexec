
@echo off
setlocal enabledelayedexpansion

set "FILENAME=autoexec.cfg"
set "DEFAULT_PATH=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"

echo ===========================================
echo    CS2 AUTOEXEC INSTALLER - dalvgui
echo ===========================================
echo.

:: Comprobar si el archivo autoexec existe en la carpeta actual
if not exist "%FILENAME%" (
    echo [ERROR] No se encuentra %FILENAME% en esta carpeta.
    pause
    exit /b
)

:: Verificar ruta por defecto
if exist "%DEFAULT_PATH%" (
    set "FINAL_PATH=%DEFAULT_PATH%"
    echo [INFO] Ruta por defecto encontrada.
) else (
    echo [?] No se encontro la ruta por defecto de Steam.
    set /p "FINAL_PATH= [>] Por favor, pega la ruta de tu carpeta /cfg: "
)

:: Confirmar y copiar
echo.
echo [!] Se va a sobreescribir el archivo en: "%FINAL_PATH%"
set /p "CONFIRM= ¿Estas seguro? (S/N): "

if /i "%CONFIRM%" neq "S" (
    echo [!] Instalacion cancelada.
    pause
    exit /b
)

copy /y "%FILENAME%" "%FINAL_PATH%\%FILENAME%"

echo.
echo ===========================================
echo    DONE! Archivo copiado con exito.
echo    Recuerda poner +exec autoexec.cfg en Steam.
echo ===========================================
pause