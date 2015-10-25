@echo off
title ConsoleTools by bautistasbr

:inicio
cls
echo ********************
echo *****-=[MENU]=-*****
echo ********************
echo 1) Disco Duro   
echo 2) Reparar el Sistema   
echo 3) Opcion 3   
echo 4) Opcion 4   
echo 5) Opcion 5   
echo ********************
echo 6) Salir
echo ********************
echo.

set /p opinicio=Seleccione una opcion [1-6]:
if "%opinicio%"=="1" goto opdiscoduro
if "%opinicio%"=="2" goto oprepararsistema
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
echo 3) Formatear unidad   
echo 4) Formatear unidad (Rapido)   
echo 5) Convertir de Fat a Ntfs  
echo 6) Editor de particiones  
echo ********************
echo 7) Volver
echo ********************
echo.

	set /p opdiscomenu=Seleccione una opcion [1-7]:
if "%opdiscomenu%"=="1" goto opdiscoduro1
if "%opdiscomenu%"=="2" goto opdiscoduro2
if "%opdiscomenu%"=="3" goto opdiscoduro3
if "%opdiscomenu%"=="4" goto opdiscoduro4
if "%opdiscomenu%"=="5" goto opdiscoduro5
if "%opdiscomenu%"=="6" goto opdiscoduro6
if "%opdiscomenu%"=="7" goto opdiscodurovolver
	
:opdiscoduro1
cls
echo.
echo Se va a ejecutar el comando Chkdsk /f para intentar corregir fallos en el disco duro.
echo Puede tardar en funcion de la capacidad del disco.
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
echo Puede tardar en funcion de la capacidad del disco.
echo.
echo Introduce la letra de la unidad seguida por : 
echo Ejemplo:   d:
echo.
	set /p letraunidad=Escribe la letra de la unidad : 
	  chkdsk /r  %letraunidad%
	pause
	goto opdiscoduro
	
	:opdiscoduro3
cls
echo.
echo Se va a formatear la unidad, haga una copia de todos sus archivos antes de proceder.
echo Puede tardar en funcion de la capacidad del disco.
echo.
echo Introduce la letra de la unidad seguida por : 
echo Ejemplo:   d:
echo.
	set /p letraunidad=Escribe la letra de la unidad : 
	  format  %letraunidad%
	pause
	goto opdiscoduro
	
	:opdiscoduro4
cls
echo.
echo Se va a formatear la unidad de forma rápida, haga una copia de todos sus archivos antes de proceder.
echo Puede tardar en funcion de la capacidad del disco.
echo.
echo Introduce la letra de la unidad seguida por : 
echo Ejemplo:   d:
echo.
	set /p letraunidad=Escribe la letra de la unidad : 
	  format /q %letraunidad%
	pause
	goto opdiscoduro
	
	:opdiscoduro5
cls
echo.
echo Se va a convertir la unidad a Ntfs, es recomendable que haga una copia de todos sus archivos antes de proceder.
echo Puede tardar en funcion de la capacidad del disco.
echo.
echo Introduce la letra de la unidad seguida por : 
echo Ejemplo:   d:
echo.
	set /p letraunidad=Escribe la letra de la unidad : 
	  convert %letraunidad% /fs:ntfs
	pause
	goto opdiscoduro

	
		:opdiscoduro6
cls
echo.
echo Editor de particiones de Windows.
echo.
echo.
	  diskpart
	pause
	goto opdiscoduro
	
	:opdiscodurovolver	
	goto inicio
	
	
	
	
	
	
	
	
	
	
:oprepararsistema
cls
    echo.
    echo *****-=[Utilidades para Reparar el Sistema]=-*****
    echo.
echo 1) Comprobar archivos del sistema   
echo 2) Reparar Internet (Winsock,DNS,TCP)   
echo 3) Restaurar ajustes del Firewall   
echo 4) Restaurar ajustes de Internet Explorer  
echo 5) 5  
echo 6) 6  
echo ********************
echo 7) Volver
echo ********************
echo.

	set /p opdiscomenu=Seleccione una opcion [1-7]:
if "%opdiscomenu%"=="1" goto oprepararsistema1
if "%opdiscomenu%"=="2" goto oprepararsistema2
if "%opdiscomenu%"=="3" goto oprepararsistema3
if "%opdiscomenu%"=="4" goto oprepararsistema4
if "%opdiscomenu%"=="5" goto oprepararsistema5
if "%opdiscomenu%"=="6" goto oprepararsistema6
if "%opdiscomenu%"=="7" goto oprepararsistemavolver

:oprepararsistema1
cls
echo.
echo Se van a comprobar los archivos del sistema y se repararan los defectuosos o faltantes.
echo.
	  sfc /scannow
	pause
	goto oprepararsistema

:oprepararsistema2
cls
echo.
echo Se van a realizar los cambios necesarios para restaurar la conexion de red.
echo.
	  IPCONFIG /release
	  IPCONFIG /renew
	  IPCONFIG /flushdns
	  nbtstat -RR
	  arp -d *
	  nbtstat -R
	  IPCONFIG /registerdns
	  netsh winsock reset catalog
	  netsh int ip reset
	pause
	goto oprepararsistema

:oprepararsistema3
cls
echo.
echo Se van restaurar los ajustes del Firewall de Windows.
echo.

netsh advfirewall reset
	pause
	goto oprepararsistema

:oprepararsistema4
cls
echo.
echo Se van restaurar los ajustes de Internet Explorer.
echo.

RunDll32.exe InetCpl.cpl,ResetIEtoDefaults
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
	pause
	goto oprepararsistema
	
	:oprepararsistemavolver	
	goto inicio
	

:op3
    echo.
    echo. Has elegido la opcion No. 3
    echo.
  
    echo.
    pause
    goto inicio
   
:op4
    echo.
    echo. Has elegido la opcion No. 4
    echo.
   
    echo.
    pause
    goto inicio

:op5
    echo.
    echo. Has elegido la opcion No. 5
    echo.
  
    echo.
    pause
    goto inicio

:salir
    @cls&exit