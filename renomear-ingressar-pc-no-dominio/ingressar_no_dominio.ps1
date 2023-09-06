#### CONSTANTES ####
# Preencha estas constantes para a execucao automatica do script
# No entanto o nome da maquina sempre sera perguntado
#preencha apenas com S ou N
#Que significam [S]im ou [N]ao
$ACEITAR = ""
#Sua matricula e sua senha
$MATRICULA = ""
$SENHA = ""
#preencha apenas com R / D ou S
#Que significam [R]einiciar, [D]esligar ou [S]air
$ACAO_AO_FINAL = ""


$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    
    Write-Host "Este script renomeia a maquina para o nome inserido e a ingressa no dominio do IFRN." 
    
	$opcao = ""
	if ($ACEITAR -eq "") {
	    Write-Host "Tem certeza que deseja continuar?" -ForegroundColor Yellow 
        $opcao = Read-Host " ( s / n ) " 
	} else {
	    $opcao = $ACEITAR
	}
	
	Switch ($opcao) { 
        S {$resultado=$true} 
        N {$resultado=$false} 
        Default {$resultado=$false} 
    }
    
    if ($resultado) {
        $maquina = Read-Host "Insira o nome desta maquina"
        Write-Host "Renomeando maquina para $maquina."
	    $ComputerName = $maquina 
	   
	    Remove-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -name "Hostname" 
	    Remove-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -name "NV Hostname" 

	    New-PSDrive -name HKU -PSProvider "Registry" -Root "HKEY_USERS"

	    Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Computername\Computername" -name "Computername" -value $ComputerName
	    Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Computername\ActiveComputername" -name "Computername" -value $ComputerName
	    Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -name "Hostname" -value $ComputerName
	    Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -name "NV Hostname" -value  $ComputerName
	    Set-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -name "AltDefaultDomainName" -value $ComputerName
	    Set-ItemProperty -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -name "DefaultDomainName" -value $ComputerName
        Write-Host "Concluido!"
    
	    $usuario = ""
        if ($MATRICULA -eq "") {
	        $usuario = Read-Host "Insira a sua matricula"
        } else {
	        $usuario = $MATRICULA
	    }
	    $Env:ComputerName = $maquina
        Write-Host "Ingressando $Env:ComputerName" no dominio...
	    if ($SENHA -eq "") {
            Add-Computer -domainname ifrn.local -Credential ifrn\$usuario
	    } else {
            $password = $SENHA | ConvertTo-SecureString -asPlainText -Force
            $username = "ifrn\$MATRICULA" 
            $credential = New-Object System.Management.Automation.PSCredential($username,$password)
            Add-Computer -DomainName ifrn.local -Credential $credential
	    }
    
        Write-Host "Voce precisa reiniciar o computador para que as alteracoes tenham efeito. Deseja [R]einiciar, [D]esligar ou [S]air" -ForegroundColor Yellow 
		$opcao = ""
	    if ($ACAO_AO_FINAL -eq "") {
            $opcao = Read-Host " ( R / D / S ) " 
	    } else {
	        $opcao = $ACAO_AO_FINAL
	    }
		
        Switch ($opcao) 
         { 
           R {shutdown /R /T 00} 
           D {shutdown /S /T 00} 
           Default {Write-Host "Fui!"; [void](Read-Host 'Aperte ENTER para continuar...'); exit} 
         }
    
    } else {
        Write-Host "Fui!"
        [void](Read-Host 'Aperte ENTER para continuar...')
        exit
    }
} else {
    Write-Host "Este script precisa ser executado como administrador."
    [void](Read-Host 'Aperte ENTER para continuar...')
    exit
}
