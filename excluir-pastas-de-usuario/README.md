# Remover pastas de usuário, exceto Admin

Este script "limpa" as pastas em `C:\Users`, excetuando o usuário public e o usuário admin. Este script pode ser modificado para incluir outros usuários, basta modificar `comparador.bat`. Lembrando que o script que deverá ser executado para iniciar o processo é o `execute-este.bat`.

O arquivo `apagar_pastas_de_usuario_exceto_admin.ps1` é a versão em powershell do mesmo script e tem a vantagem de ser "tudo em um" e pode ser utilizado sem ser acompanhado de um `execute-este.bat`, por exemplo.
