:: Obter permissao de administrador
@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:: FIM do obter permissao de administrador

::alterar mapa de caracteres para latinos
chcp 1252

::alterar modo da interface "Conexão local" para IP estático 
netsh interface ip set address "Conexão local" static 192.168.64.100 255.255.255.0 192.168.64.1

::importar arquivo .reg da vlan
regedit "%~dp0vlan5.reg"

::desabilitar e habilitar interface de rede para aplicação das configurações
netsh interface set interface name="Conexão local" admin=disabled
netsh interface set interface name="Conexão local" admin=enabled
pause
