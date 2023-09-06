Get-ChildItem -Path 'C:\Users' -Directory | ForEach-Object {
    if ($_ -notmatch "admin" -and $_ -notmatch "public" -and $_ -notmatch "aluno") {
	$caminho = $(Join-Path "C:" -ChildPath "Users" | Join-Path -ChildPath "$_")
        Write-Output "Apagando diretorio: $caminho"
	Remove-Item "$caminho" -Recurse -force
    }
}
