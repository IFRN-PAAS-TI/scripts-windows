# Mover computadores dentro do Active Directory

Este script procura computadores, no AD do IFRN, que possuam a sigla de um campus (por exemplo PAAS, no caso do Campus Parelhas) no nome e os move para uma OU configurada no script `moverComputadores.ps1`. Caso os computadores j� estejam na OU de destino, eles n�o ser�o movidos.

Caso queira alterar informa��es, como a sigla do Campus ou a OU de destino dentro do AD, modifique as vari�veis que est�o no in�cio do arquivo `moverComputadores.ps1`.
