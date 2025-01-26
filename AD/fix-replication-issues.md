##### Restauração Autoritativa
* Marca os objetos restaurados como a versão mais recente no Active Directory, forçando a replicação para outros controladores de domínio. É usada para recuperar objetos excluídos ou sobrescrever alterações indesejadas.

##### Restauração Não Autoritativa
* Restaura o AD de um backup e permite que outros controladores de domínio atualizem os dados restaurados com as alterações mais recentes. É usada para corrigir falhas locais sem afetar os dados mais atuais no ambiente.


##### Authoritative Restore
* Marks the restored objects as the latest version in Active Directory, forcing replication to other domain controllers. Used to recover deleted objects or overwrite unwanted changes.

##### Non-Authoritative Restore
* Restores Active Directory from a backup and allows other domain controllers to update the restored data with the latest changes. Used to fix local failures without affecting the most recent data in the environment.



* Corrigir problemas de replicacao


#Comandos utilizados para replicação:

```
repadmin /syncall vm-adds01 /aped
```
```
dfsrdiag pollad
```

* dfsrdiag pollad é preciso instalar também o gerenciador do DFS

* Faça backup da pasta SYSVOL


* Abra no servidor

[](/Images/img01.png)
[](/Images/img03.png)
[](/Images/img04.png)
[](/Images/img05.png)
[](/Images/img06.png)

* Definir como autoritativo

[](/Images/img07.png)

* Faça o processo nos outros servidores, mas marque somente para o false no msDFSR-Options.

* Rode os comandos em todos os servidores :
  * aqui vai o nome do servidor autoritativo

```
 repadmin /syncall vm-adds01 /aped
```
 
* Para o comando seguinte, instale o gerenciador do DFS  e execute o commando :

```
dfsrdiag pollad
```

* Se nao replicar, ative novamente msDFSR-Enabled em todos os servidores :



[](/Images/img08.png)

* Execute novamente a sincronizacao 

```
repadmin /syncall vm-adds01 /aped
```


