# Mover computadores dentro do Active Directory

Este script procura computadores, no AD do IFRN, que possuam a sigla de um campus (por exemplo PAAS, no caso do Campus Parelhas) no nome e os move para uma OU configurada no script `moverComputadores.ps1`. Caso os computadores já estejam na OU de destino, eles não serão movidos.

Caso queira alterar informações, como a sigla do Campus ou a OU de destino dentro do AD, modifique as variáveis que estão no início do arquivo `moverComputadores.ps1`.
