* Check FSMO

```
netdom query fsmo
```

```
Get-ADDomain | fl PDCEmulator,RIDMaster,InfrastructureMaster
Get-ADForest | fl SchemaMaster,DomainNamingMaster
```

```
#Transferir FSMOs de domínio:
Move-ADDirectoryServerOperationMasterRole "vm-adds02" -OperationMasterRole PDCEmulator
Move-ADDirectoryServerOperationMasterRole "vm-adds02" -OperationMasterRole RIDMaster
Move-ADDirectoryServerOperationMasterRole "vm-adds02" -OperationMasterRole InfrastructureMaster
```
 
```
#Transferir FSMOs de infraestrutura:
Move-ADDirectoryServerOperationMasterRole "vm-adds02" -OperationMasterRole SchemaMaster
Move-ADDirectoryServerOperationMasterRole "vm-adds02" -OperationMasterRole DomainNamingMaster
```
 
```
#Transferir todas FSMOs:
Move-ADDirectoryServerOperationMasterRole "vm-adds01" -OperationMasterRole PDCEmulator,RIDMaster,InfrastructureMaster,SchemaMaster,DomainNamingMaster
```
 
```
#Seize FSMOs: (sequestro, para caso de perda do servidor com as FSMO)
Move-ADDirectoryServerOperationMasterRole "vm-adds01" -OperationMasterRole PDCEmulator,RIDMaster,InfrastructureMaster,SchemaMaster,DomainNamingMaster -Force
```
