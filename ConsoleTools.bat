@echo off
title ConsoleTools by bautistasbr

:inicio
cls
echo ********************
echo *****-=[MENU]=-*****
echo ********************
echo 1) Disco Duro   
echo 2) Opcion 2   
echo 3) Opcion 3   
echo 4) Opcion 4   
echo 5) Opcion 5   
echo ********************
echo 6) Salir
echo ********************
echo.

set /p opinicio=Seleccione una opcion [1-6]:
if "%opinicio%"=="1" goto opdiscoduro
if "%opinicio%"=="2" goto op2
if "%opinicio%"=="3" goto op3
if "%opinicio%"=="4" goto op4
if "%opinicio%"=="5" goto op5
if "%opinicio%"=="6" goto salir

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. El numero "%opinicio%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto inicio




:opdiscoduro
	cls
    echo.
echo. 
echo *****-=[Utilidades para el Disco Duro]=-*****
echo. 
echo 1) Corregir errores en el disco   
echo 2) Corregir sectores defectuosos   
echo 3) Opcion 3   
echo 4) Opcion 4   
echo 5) Opcion 5   
echo ********************
echo 6) Volver
echo ********************
echo.

	set /p opdiscomenu=Seleccione una opcion [1-6]:
if "%opdiscomenu%"=="1" goto opdiscoduro1
if "%opdiscomenu%"=="2" goto opdiscoduro2
if "%opdiscomenu%"=="3" goto opdiscoduro3
if "%opdiscomenu%"=="4" goto opdiscoduro4
if "%opdiscomenu%"=="5" goto opdiscoduro5
if "%opdiscomenu%"=="6" goto opdiscodurovolver
	
:opdiscoduro1
cls
echo.
echo Se va a ejecutar el comando Chkdsk /f para intentar corregir fallos en el disco duro.
echo Puede tardar en funcion del tamaño del disco.
echo.
echo Introduce la letra de la unidad seguida por : 
echo Ejemplo:   d:
echo.
	set /p letraunidad=Escribe la letra de la unidad : 
	  chkdsk /f  %letraunidad%
	pause
	goto opdiscoduro
	
	
	:opdiscoduro2
cls
echo.
echo Se va a ejecutar el comando Chkdsk /r para intentar corregir sectores defectuosos.
echo Puede tardar en funcion del tamaño del disco.
echo.
echo Introduce la letra de la unidad seguida por : 
echo Ejemplo:   d:
echo.
	set /p letraunidad=Escribe la letra de la unidad : 
	  chkdsk /r  %letraunidad%
	pause
	goto opdiscoduro
	
:opdiscodurovolver	
	goto inicio
	
	
	
	
	
	
	
	
	
	
:op2
    echo.
    echo. Has elegido la opcion No. 2
    echo.
        ::Aquí van las líneas de comando de tu opción
        color 09
    echo.
    pause
    goto inicio

:op3
    echo.
    echo. Has elegido la opcion No. 3
    echo.
        ::Aquí van las líneas de comando de tu opción
        color 0A
    echo.
    pause
    goto inicio
   
:op4
    echo.
    echo. Has elegido la opcion No. 4
    echo.
        ::Aquí van las líneas de comando de tu opción
        color 0B
    echo.
    pause
    goto inicio

:op5
    echo.
    echo. Has elegido la opcion No. 5
    echo.
        ::Aquí van las líneas de comando de tu opción
        color 0C
    echo.
    pause
    goto inicio

:salir
    @cls&exit