# Este script move os computadores para $destOU dada uma $origOU e uma $sigla do Campus.
# Um arquivo $fileName precisa existir com a lista dos computadores a serem removidos do domínio.
# Após isso o arquivo $fileName é lido e todos os computadores lá presentes removidos.

#Nome do arquivo
$fileName = "listaPCs.txt"



##### INICIO DO SCRIPT #####

import-module activedirectory

echo "Iniciando a remoção de computadores..."
$leitor = [System.IO.File]::OpenText("$fileName")
try {
    for() {
        $computador = $leitor.ReadLine()
        if ($computador -eq $null) { break }
		try {
			Get-ADComputer $computador | Remove-ADObject -Confirm:$false
			echo "Computador $computador removido!"
		} catch {
			echo "Erro! Nao foi possivel remover o computador: $computador"
		}
    }
}
finally {
    $leitor.Close()
}

echo "Concluido!"

##### FIM DO SCRIPT #####

