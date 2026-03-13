@echo off
setlocal enabledelayedexpansion

set "FILENAME=autoexec.cfg"
set "DEFAULT_PATH=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"

echo ===========================================
echo    CS2 AUTOEXEC INSTALLER - elemikelo
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
echo [!] Se va a copiar la configuracion en: "%FINAL_PATH%"
set /p "CONFIRM= ¿Estas seguro? (S/N): "

if /i "%CONFIRM%" neq "S" (
    echo [!] Instalacion cancelada.
    pause
    exit /b
)

echo.
echo Copiando archivos...

:: Copiar autoexec
copy /y "%FILENAME%" "%FINAL_PATH%\%FILENAME%" >nul

:: Copiar kz.cfg si existe
if exist "kz.cfg" (
    copy /y "kz.cfg" "%FINAL_PATH%\kz.cfg" >nul
)

:: Copiar CFG configs
if exist "CFG" (
    for %%f in (CFG\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%\%%~nxf" >nul
    )
)

:: Copiar configs de otag
if exist "otag" (
    for %%f in (otag\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%\%%~nxf" >nul
    )
)

echo.
echo ===========================================
echo    DONE! Archivos copiados con exito.
echo    Recuerda poner +exec autoexec.cfg en Steam.
echo ===========================================

pause
