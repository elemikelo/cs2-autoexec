@echo off
setlocal

:: ======================================================
:: CS2 AUTOEXEC INSTALLER - elemikelo
:: Instalador automático de configuración CS2
:: ======================================================


:: ------------------------------------------------------
:: RUTAS POSIBLES DE INSTALACIÓN DE CS2
:: ------------------------------------------------------
:: Aquí definimos posibles rutas donde Steam suele instalar
:: Counter-Strike 2. Si el juego está en otra ruta,
:: el instalador pedirá la ruta manualmente.

set "PATH1=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
set "PATH2=D:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"
set "PATH3=E:\SteamLibrary\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg"



echo ===========================================
echo    CS2 AUTOEXEC INSTALLER - elemikelo
echo ===========================================
echo.


:: ------------------------------------------------------
:: DETECCIÓN AUTOMÁTICA DE RUTA
:: ------------------------------------------------------
:: El script comprueba si alguna de las rutas existe.

if exist "%PATH1%" (
    set "FINAL_PATH=%PATH1%"
)

if exist "%PATH2%" (
    set "FINAL_PATH=%PATH2%"
)

if exist "%PATH3%" (
    set "FINAL_PATH=%PATH3%"
)



:: ------------------------------------------------------
:: SI NO SE ENCUENTRA LA RUTA AUTOMÁTICAMENTE
:: ------------------------------------------------------

if not defined FINAL_PATH (
    echo [WARNING] No se pudo detectar la ruta de CS2 automaticamente.
    echo.
    set /p "FINAL_PATH=Introduce manualmente la ruta de la carpeta cfg: "
)



:: ------------------------------------------------------
:: MOSTRAR RUTA FINAL
:: ------------------------------------------------------

echo.
echo Instalando configuracion en:
echo %FINAL_PATH%
echo.



:: ------------------------------------------------------
:: CREAR CARPETA CFG SI NO EXISTE
:: ------------------------------------------------------

if not exist "%FINAL_PATH%" (
    mkdir "%FINAL_PATH%"
)



echo Copiando archivos...
echo.



:: ======================================================
:: COPIAR AUTOEXEC
:: ======================================================
:: Archivo principal que carga toda la configuración

if exist "autoexec.cfg" (
    copy /y "autoexec.cfg" "%FINAL_PATH%" >nul
    echo [OK] autoexec.cfg instalado
)



:: ======================================================
:: COPIAR CONFIG KZ
:: ======================================================
:: Configuración de movimiento KZ/BHOP

if exist "kz.cfg" (
    copy /y "kz.cfg" "%FINAL_PATH%" >nul
    echo [OK] kz.cfg instalado
)



:: ======================================================
:: COPIAR CONFIGS DE PRACTICA
:: ======================================================
:: Carpeta CFG contiene configuraciones de práctica
:: como practicacs2.cfg y dynamic_hud.cfg

if exist "CFG" (
    for %%f in (CFG\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%" >nul
        echo [OK] %%~nxf instalado
    )
)



:: ======================================================
:: COPIAR CONFIGS OTAG
:: ======================================================
:: Configuración de movement avanzada

if exist "otag" (
    for %%f in (otag\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%" >nul
        echo [OK] %%~nxf instalado
    )
)



:: ======================================================
:: COPIAR CONFIGURACIÓN MODULAR
:: ======================================================
:: Carpeta configs contiene la configuración modular
:: (crosshair, binds, radar, audio, etc)

if exist "configs" (
    for %%f in (configs\*.cfg) do (
        copy /y "%%f" "%FINAL_PATH%" >nul
        echo [OK] %%~nxf instalado
    )
)



:: ======================================================
:: FINALIZACIÓN
:: ======================================================

echo.
echo ===========================================
echo      INSTALACION COMPLETADA
echo ===========================================
echo.

echo Recuerda añadir en las opciones de lanzamiento de Steam:
echo.
echo    +exec autoexec.cfg
echo.

pause
