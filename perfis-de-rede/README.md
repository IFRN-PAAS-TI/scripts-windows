# Alterar VLAN e configurações de rede de uma interface do Windows

Estes scripts podem ser utilizados como base para alterar rapidamente entre VLANs em uma interface de rede no Windows. Caso a VLAN possua configuração de rede via DHCP, utilize `dhcp.bat`, caso seja IP estático, utilize `ip-estatico.bat`. Lembre-se de alterar o nome da interface de rede, ao longo do script escolhido, e de alterar o ID da vlan em vlan5.reg. Talvez seja necessário alterar também a chave de registro no arquivo `vlan5.reg`.

O arquivo `vlan0.reg` possui as configurações padrão (sem nenhuma VLAN configurada) para uma interface de rede qualquer. Além disso, se usado em conjunto com `dhcp.bat`, retorna a interfaces às suas configurações padrão (sem VLAN configurada e obtendo endereço IP através de DHCP).
