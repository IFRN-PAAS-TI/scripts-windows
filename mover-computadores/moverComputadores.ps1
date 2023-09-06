# Este script move os computadores para $destOU dada uma $origOU e uma $sigla do Campus.
# Um arquivo $fileName é criado com todos os computadores presentes em $origOU e que possuem $sigla em seu nome.
# Após isso o arquivo $fileName é lido e todos os computadores lá presentes são movidos para $destOU.

#Sigla do Campus, por exemplo: PAAS é a sigla do Campus Parelhas
$sigla = ""

#OU na qual devem ser procurados os computadores
##### MUITO CUIDADO AO EDITAR ESTE VALOR #####
$origOU = "DC=ifrn,DC=local"

#OU para a qual devem ser enviados os computadores
##### MUITO CUIDADO AO EDITAR ESTE VALOR #####
$destOU = ""

#arquivo que guardara os computadores a serem transferidos
$fileName = "listaPCs.txt"



##### INICIO DO SCRIPT #####

echo "Obtendo lista de computadores e salvando em $fileName."
Get-ADComputer -SearchBase "$origOU" -Filter "*" | Select -Exp Name | Select-String -Pattern "$sigla*" > $fileName

echo "Iniciando transferencia de computadores..."
#for /f %%u in ($fileName) do Get-ADComputer %%u | Move-ADObject -TargetPath $destOU
$leitor = [System.IO.File]::OpenText("$fileName")
try {
    for() {
        $computador = $leitor.ReadLine()
        if ($computador -eq $null) { break }
		
		try {
			Get-ADComputer $computador | Move-ADObject -TargetPath $destOU
			echo "Computador $computador transferido!"
		} catch {
			echo "Erro! Nao foi possivel transferir computador: $computador"
		}
    }
}
finally {
    $leitor.Close()
}

echo "Excluindo $fileName."
rm $fileName

echo "Concluido!"
pause

##### FIM DO SCRIPT #####

