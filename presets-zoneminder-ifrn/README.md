# Preset para inserção de câmeras no banco do zoneminder

Caso seja necessário inserir múltiplas câmeras do modelo P1354-E/M1114-E no banco de dados do zoneminder, basta usar o script SQL presente nesta pasta. O script também pode ser adaptado para outros modelos de câmera.

Para utilizar o script, faça upload dele para alguma pasta no servidor e, uma vez em um terminal nesta pasta, execute (como root):

```
mysql -p "zm" < presets.sql
```
