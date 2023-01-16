* ``` cp ```  = copiar
* ``` mv ```  = mover
* ``` erase ``` = apagar arquivo
* ``` enter-pssession server01 ```  = conecta remotamente em um servidor.
  
  **Se apresentar erros para conectar, execute os seguintes passo**

  ``` start-service winrm ``` 

  ``` Set-Item WSMan:\localhost\Client\TrustedHosts -Value "IP DO PC que quer conectar" ``` 

* ``` get-windowsfeature ```  = obtem lista de features para instalar no windows server (``` get-windowsfeature -name *dns* ``` )
* ``` install-WindowsFeature -Name Windows-Server-Backup ``` = instala uma feature
* ``` Remove-WindowsFeature -Name rsat-fax ```  = remove uma feature
* ``` get-service ```  ``` set-service ```  ``` stop-service ``` ``` restart-service ```  = gerencia serviços
* ``` Get-EventLog -LogName System ```  = verifica os logs do windows, pode realizar alteração para melhores resultados ``` get-EventLog -Newest 10 System ``` 
* ``` Get-NetIPConfiguration ```  ``` Get-NetIPAddress ``` = obter configurações de rede
* ``` New-NetIPAddress 192.168.25.113 -InterfaceAlias Ethernet -DefaultGateway 192.168.25.254 -PrefixLength 24 -AddressFamily IPv4 ```  = configuração de IP
* ``` Set-DnsClientServerAddress -InterfaceIndex Ethernet -ServerAddresses 8.8.8.8 ```  = Configuração de DNS