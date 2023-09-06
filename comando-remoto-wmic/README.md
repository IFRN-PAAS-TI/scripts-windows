# Executar Comandos Remotamente

O wmic pode ser usado para executar comandos remotamente, caso as permissões sejam devidamente habilitadas no Active Directory. Para isso preencha o IP (ou nome) de cada máquina, um por linha, no arquivo `alvos.txt` e execute o script `executarComandoRemotamenteEmMassa.bat` para que o Windows se conecte a cada máquina remota e execute o comando.

**ATENÇÃO**: o script ainda não pôde ser validado. Pode ser necessária a modificação do código para uma execução correta. Por favor atualize o repositório caso necessário.
