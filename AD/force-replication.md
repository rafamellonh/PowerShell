#### Aqui cada um dos parâmetros explicados:
* /syncall: Sincroniza o domain controller principal com todos os parceiros de replicação;
* /e: Enterprise… indica que a replicação será estendida a todos os sites remotos;
* /A:  All; Sincroniza todas as partições do home server;
* /P: Indica que as mudanças serão replicadas a partir do servidor primário;
* /d: Identifica os servidores por seus nomes distintos em eventuais mensagens que possam aparecer;
* /q: Quiet mode. Não mostra as mensagens de status. Caso você esteja fazendo isso manualmente por algum problema, é melhor não usar este parâmetro para identificar algum erro.


```
repadmin /syncall /e /A /P /d /q
```

```
repadmin /syncall /AdeP
```

