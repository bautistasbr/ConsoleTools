@echo off
title ConsoleTools by bautistasbr

:inicio
cls
echo.
echo ********************
echo *****-=[MENU]=-*****
echo ********************
echo 1) Disco Duro   
echo 2) Reparar el Sistema   
echo 3) Habilitar Aplicaciones    
echo 4) Opcion 4   
echo 5) Opcion 5   
echo ********************
echo 6) Salir
echo ********************
echo.
echo Ejecutalo como Administrador.
echo https://github.com/bautistasbr/ConsoleTools
echo.
set /p opinicio=Seleccione una opcion [1-6]:
if "%opinicio%"=="1" goto opdiscoduro
if "%opinicio%"=="2" goto oprepararsistema
if "%opinicio%"=="3" goto ophabilitaraplicaciones
if "%opinicio%"=="4" goto op4
if "%opinicio%"=="5" goto op5
if "%opinicio%"=="6" goto salir
echo.
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
echo 5) Restaurar ajustes de los Servicios  
echo 6) Restaurar UAC (User Account Control)  
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
	  echo.
	  echo Reinicia el equipo.
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
	
	:oprepararsistema5
cls
echo.
echo Se van restaurar los ajustes de los servicios.
echo.

    ECHO CHANGING ActiveX Installer
    sc config AxInstSV start= demand
    ECHO CHANGING Adaptive Brightness
    sc config SensrSvc start= demand
    ECHO CHANGING Application Experience
    sc config AeLookupSvc start= demand
    ECHO SKIPPING Application Host Helper Service
    ECHO CHANGING Application Identity
    sc config AppIDSvc start= demand
    ECHO CHANGING Application Information
    sc config Appinfo start= demand
    ECHO CHANGING Application Layer Gateway Service
    sc config ALG start= demand
    ECHO CHANGING Application Management
    sc config AppMgmt start= demand
    ECHO SKIPPING ASP.NET State Service
    ECHO CHANGING Background Intelligent Transfer Service
    sc config BITS start= demand
    ECHO CHANGING Base Filtering Engine
    sc config BFE start= auto
    ECHO CHANGING BitLocker Drive Encryption Service
    sc config BDESVC start= demand
    ECHO CHANGING Block Level Backup Engine Service
    sc config wbengine start= demand
    ECHO CHANGING Bluetooth Support Service
    sc config bthserv start= demand
    ECHO CHANGING BranchCache
    sc config PeerDistSvc start= demand
    ECHO CHANGING Certificate Propagation
    sc config CertPropSvc start= demand
    ECHO SKIPPING Client for NFS
    ECHO CHANGING CNG Key Isolation
    sc config KeyIso start= demand
    ECHO CHANGING COM+ Event System
    sc config EventSystem start= auto
    ECHO CHANGING COM+ System Application
    sc config COMSysApp start= demand
    ECHO CHANGING Computer Browser
    sc config Browser start= demand
    ECHO CHANGING Credential Manager
    sc config VaultSvc start= demand
    ECHO CHANGING Cryptographic Services
    sc config CryptSvc start= auto
    ECHO SKIPPING DCOM Server Process Launcher
 
    ECHO CHANGING Desktop Window Manager Session Manager
    sc config UxSms start= auto
    ECHO CHANGING DHCP Client
    sc config Dhcp start= auto
    ECHO CHANGING Diagnostic Policy Service
    sc config DPS start= auto
    ECHO CHANGING Diagnostic Service Host
    sc config WdiServiceHost start= demand
    ECHO CHANGING Diagnostic System Host
    sc config WdiSystemHost start= demand
    ECHO CHANGING Disk Defragmenter
    sc config defragsvc start= demand
    ECHO CHANGING Distributed Link Tracking Client
    sc config TrkWks start= auto
    ECHO CHANGING Distributed Transaction Coordinator
    sc config MSDTC start= demand
    ECHO CHANGING DNS Client
    sc config Dnscache start= auto
    ECHO CHANGING Encrypting File System (EFS)
    sc config EFS start= demand
    ECHO CHANGING Extensible Authentication Protocol
    sc config EapHost start= demand
    ECHO CHANGING Fax
    sc config Fax start= demand
    ECHO CHANGING Function Discovery Provider Host
    sc config fdPHost start= demand
    ECHO CHANGING Function Discovery Resource Publication
    sc config FDResPub start= auto
    ECHO SKIPPING Group Policy Client
 
    ECHO CHANGING Health Key and Certificate Management
    sc config hkmsvc start= demand
    ECHO CHANGING HomeGroup Listener
    sc config HomeGroupListener start= demand
    ECHO CHANGING HomeGroup Provider
    sc config HomeGroupProvider start= demand
    ECHO CHANGING Human Interface Device Access
    sc config hidserv start= demand
    ECHO SKIPPING IIS Admin Service
    ECHO CHANGING IKE and AuthIP IPsec Keying Modules
    sc config IKEEXT start= demand
    ECHO SKIPPING Indexing Service
    ECHO CHANGING Interactive Services Detection
    sc config UI0Detect start= demand
    ECHO CHANGING Internet Connection Sharing (ICS)
    sc config SharedAccess start= Disabled
    ECHO CHANGING IP Helper
    sc config iphlpsvc start= auto
    ECHO CHANGING IPsec Policy Agent
    sc config PolicyAgent start= demand
    ECHO CHANGING KtmRm for Distributed Transaction Coordinator
    sc config KtmRm start= demand
    ECHO CHANGING Link-Layer Topology Discovery Mapper
    sc config lltdsvc start= demand
    ECHO SKIPPING LPD Service
    ECHO CHANGING Media Center Extender Service
    sc config Mcx2Svc start= Disabled
    ECHO SKIPPING Message Queuing
    ECHO SKIPPING Message Queuing Triggers
    ECHO CHANGING Microsoft .NET Framework NGEN v2.0.50727
    sc config clr_optimization_v2.0.50727 start= demand
    ECHO SKIPPING Microsoft FTP Service
    ECHO CHANGING Microsoft iSCSI Initiator Service
    sc config MSiSCSI start= demand
    ECHO CHANGING Microsoft Software Shadow Copy Provider
    sc config swprv start= demand
    ECHO CHANGING Multimedia Class Scheduler
    sc config MMCSS start= auto
    ECHO SKIPPING Net.Msmq Listener Adapter
    ECHO SKIPPING Net.Pipe Listener Adapter
    ECHO SKIPPING Net.Tcp Listener Adapter
    ECHO CHANGING Net.Tcp Port Sharing Service
    sc config NetTcpPortSharing start= Disabled
    ECHO CHANGING Netlogon
    sc config Netlogon start= demand
    ECHO CHANGING Network Access Protection Agent
    sc config napagent start= demand
    ECHO CHANGING Network Connections
    sc config Netman start= demand
    ECHO CHANGING Network List Service
    sc config netprofm start= demand
    ECHO CHANGING Network Location Awareness
    sc config NlaSvc start= auto
    ECHO CHANGING Network Store Interface Service
    sc config nsi start= auto
    ECHO CHANGING Offline Files
    sc config CscService start= auto
    ECHO CHANGING Parental Controls
    sc config WPCSvc start= demand
    ECHO CHANGING Peer Name Resolution Protocol
    sc config PNRPsvc start= demand
    ECHO CHANGING Peer Networking Grouping
    sc config p2psvc start= demand
    ECHO CHANGING Peer Networking Identity Manager
    sc config p2pimsvc start= demand
    ECHO CHANGING Performance Logs and Alerts
    sc config pla start= demand
    ECHO CHANGING Plug and Play
    sc config PlugPlay start= auto
    ECHO CHANGING PnP-X IP Bus Enumerator
    sc config IPBusEnum start= demand
    ECHO CHANGING PNRP Machine Name Publication Service
    sc config PNRPAutoReg start= demand
    ECHO CHANGING Portable Device Enumerator Service
    sc config WPDBusEnum start= demand
    ECHO CHANGING Power
    sc config Power start= auto
    ECHO CHANGING Print Spooler
    sc config Spooler start= auto
    ECHO CHANGING Problem Reports and Solutions Control Panel Support
    sc config wercplsupport start= demand
    ECHO CHANGING Program Compatibility Assistant Service
    sc config PcaSvc start= demand
    ECHO CHANGING Protected Storage
    sc config ProtectedStorage start= demand
    ECHO CHANGING Quality Windows Audio Video Experience
    sc config QWAVE start= demand
    ECHO CHANGING Remote Access Auto Connection Manager
    sc config RasAuto start= demand
    ECHO CHANGING Remote Access Connection Manager
    sc config RasMan start= demand
    ECHO CHANGING Remote Desktop Configuration
    sc config SessionEnv start= demand
    ECHO CHANGING Remote Desktop Services
    sc config TermService start= demand
    ECHO CHANGING Remote Desktop Services UserMode Port Redirector
    sc config UmRdpService start= demand
    ECHO SKIPPING Remote Procedure Call (RPC)
 
    ECHO SKIPPING Remote Procedure Call (RPC) Locator
 
    ECHO CHANGING Remote Registry
    sc config RemoteRegistry start= demand
    ECHO SKIPPING RIP Listener
    ECHO CHANGING Routing and Remote Access
    sc config RemoteAccess start= Disabled
    ECHO SKIPPING RPC Endpoint Mapper
    sc config RpcEptMapper start= auto
    ECHO SKIPPING SeaPort
    ECHO CHANGING Secondary Logon
    sc config seclogon start= demand
    ECHO CHANGING Secure Socket Tunneling Protocol Service
    sc config SstpSvc start= demand
    ECHO CHANGING Security Accounts Manager
    sc config SamSs start= auto
    ECHO CHANGING Security Center
    sc config wscsvc start= delayed-auto
    ECHO CHANGING Server
    sc config LanmanServer start= auto
    ECHO CHANGING Shell Hardware Detection
    sc config ShellHWDetection start= auto
    ECHO SKIPPING Simple TCP/IP Services
    ECHO CHANGING Smart Card
    sc config SCardSvr start= demand
    ECHO CHANGING Smart Card Removal Policy
    sc config SCPolicySvc start= demand
    ECHO SKIPPING SNMP Service
    ECHO CHANGING SNMP Trap
    sc config SNMPTRAP start= demand
    ECHO CHANGING Software Protection
    sc config sppsvc start= delayed-auto
    ECHO CHANGING SPP Notification Service
    sc config sppuinotify start= demand
    ECHO CHANGING SSDP Discovery
    sc config SSDPSRV start= demand
    ECHO SKIPPING Storage Service
    ECHO CHANGING Superfetch
    sc config SysMain start= auto
    ECHO CHANGING System Event Notification Service
    sc config SENS start= auto
    ECHO CHANGING Tablet PC Input Service
    sc config TabletInputService start= demand
    ECHO SKIPPING Task Scheduler
 
    ECHO CHANGING TCP/IP NetBIOS Helper
    sc config lmhosts start= auto
    ECHO CHANGING Telephony
    sc config TapiSrv start= demand
    ECHO SKIPPING Telnet
    ECHO CHANGING Themes
    sc config Themes start= auto
    ECHO CHANGING Thread Ordering Server
    sc config THREADORDER start= demand
    ECHO CHANGING TPM Base Services
    sc config TBS start= demand
    ECHO CHANGING UPnP Device Host
    sc config upnphost start= demand
    ECHO CHANGING User Profile Service
    sc config ProfSvc start= auto
    ECHO CHANGING Virtual Disk
    sc config vds start= demand
    ECHO CHANGING Volume Shadow Copy
    sc config VSS start= demand
    ECHO SKIPPING Web Management Service
    ECHO CHANGING WebClient
    sc config WebClient start= demand
    ECHO CHANGING Windows Audio
    sc config AudioSrv start= auto
    ECHO CHANGING Windows Audio Endpoint Builder
    sc config AudioEndpointBuilder start= auto
    ECHO CHANGING Windows Backup
    sc config SDRSVC start= demand
    ECHO CHANGING Windows Biometric Service
    sc config WbioSrvc start= demand
    ECHO CHANGING Windows CardSpace
    sc config idsvc start= demand
    ECHO CHANGING Windows Color System
    sc config WcsPlugInService start= demand
    ECHO CHANGING Windows Connect Now – Config Registrar
    sc config wcncsvc start= demand
    ECHO CHANGING Windows Defender
    sc config WinDefend start= delayed-auto
    ECHO CHANGING Windows Driver Foundation – User-mode Driver Framework
    sc config wudfsvc start= demand
    ECHO CHANGING Windows Error Reporting Service
    sc config WerSvc start= demand
    ECHO CHANGING Windows Event Collector
    sc config Wecsvc start= demand
    ECHO CHANGING Windows Event Log
    sc config EventLog start= auto
    ECHO CHANGING Windows Firewall
    sc config MpsSvc start= auto
    ECHO CHANGING Windows Font Cache Service
    sc config FontCache start= delayed-auto
    ECHO CHANGING Windows Image Acquisition (WIA)
    sc config StiSvc start= demand
    ECHO CHANGING Windows Installer
    sc config msiserver start= demand
    ECHO SKIPPING Windows Live Family Safety
    ECHO CHANGING Windows Management Instrumentation
    sc config Winmgmt start= auto
    ECHO CHANGING Windows Media Center Receiver Service
    sc config ehRecvr start= demand
    ECHO CHANGING Windows Media Center Scheduler Service
    sc config ehSched start= demand
    ECHO CHANGING Windows Media Player Network Sharing Service
    sc config WMPNetworkSvc start= demand
    ECHO CHANGING Windows Modules Installer
    sc config TrustedInstaller start= demand
    ECHO CHANGING Windows Presentation Foundation Font Cache 3.0.0.0
    sc config FontCache3.0.0.0 start= demand
    ECHO SKIPPING Windows Process Activation Service
    ECHO CHANGING Windows Remote Management (WS-Management)
    sc config WinRM start= demand
    ECHO CHANGING Windows Search
    sc config WSearch start= delayed-auto
    ECHO CHANGING Windows Time
    sc config W32Time start= demand
    ECHO CHANGING Windows Update
    sc config wuauserv start= delayed-auto
    ECHO CHANGING WinHTTP Web Proxy Auto-Discovery Service
    sc config WinHttpAutoProxySvc start= demand
    ECHO CHANGING Wired AutoConfig
    sc config dot3svc start= demand
    ECHO CHANGING WLAN AutoConfig
    sc config Wlansvc start= auto
    ECHO CHANGING WMI Performance Adapter
    sc config wmiApSrv start= demand
    ECHO CHANGING Workstation
    sc config LanmanWorkstation start= auto
    ECHO SKIPPING World Wide Web Publishing Service
    ECHO CHANGING WWAN AutoConfig
    sc config WwanSvc start= demand
	echo.
	echo Reinicia el sistema.
	pause
	goto oprepararsistema
	
	:oprepararsistema6
cls
echo.
echo Se van a restaurar los valores de UAC.
echo.
	  
REG add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
REG add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 2 /f
REG add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 1 /f

echo.
echo Reinicie el sistema.
	pause
	goto oprepararsistema
	
	
	:oprepararsistemavolver	
	goto inicio
	

:ophabilitaraplicaciones
cls
    echo.
    echo *****-=[Habilitar Aplicaciones]=-*****
    echo.
echo 1) Task Manager  
echo 2) Regedit 
echo 3)  
echo 4)   
echo 5)  
echo 6)  
echo ********************
echo 7) Volver
echo ********************
echo.

	set /p opdiscomenu=Seleccione una opcion [1-7]:
if "%opdiscomenu%"=="1" goto ophabilitaraplicacionesTask
if "%opdiscomenu%"=="2" goto ophabilitaraplicacionesRegedit
if "%opdiscomenu%"=="3" goto 
if "%opdiscomenu%"=="4" goto 
if "%opdiscomenu%"=="5" goto 
if "%opdiscomenu%"=="6" goto 
if "%opdiscomenu%"=="7" goto ophabilitaraplicacionesvolver


:ophabilitaraplicacionesTask
cls
echo.
echo.
	REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System  /v  DisableTaskMgr  /t REG_DWORD  /d /0 /f
	echo.
	echo Reinicia el Sistema.
	pause
	goto ophabilitaraplicacionesvolver

	:ophabilitaraplicacionesRegedit
cls
echo.
echo.
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /t Reg_dword /v DisableRegistryTools /f /d 0
	echo.
	echo Reinicia el Sistema.
	pause
	goto ophabilitaraplicacionesvolver
	
   
   :ophabilitaraplicacionesvolver	
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