* ``` cp ```  = copiar
* ``` mv ```  = mover
* ``` erase ``` = apagar arquivo
* ``` enter-pssession server01 ```  = conecta remotamente em um servidor.
* ``` dir env: ``` = verifica as informações da váriavel de sistema
  
  **Se apresentar erros para conectar, execute os seguintes passos**

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

## Conversão de saída de informações

* ``` ConvertTO-html ```  ``` convertTO-csv ```  = converte informações para arquivos 
  * ``` Get-ADComputer -Filter * | ConvertTo-Html | Out-File "micros.html" ``` 
## Comandos para AD

* ``` Import-Module -Name ActiveDirectory ``` = importar o modulo do Active Directory
* ``` Get-Command -Module ActiveDirectory ``` = valide os comandos disponiveis 
* ``` ls ad: ``` ``` dir ad: ``` ``` get-childiten ad: ```  = obtem informações sobre o AD
* ``` Get-ChildItem "AD:\DC=mello,DC=local" ``` 
* ``` get-aduser administrator -Properties lastlogondate ```
* ``` $OU = Get-ADorganizationalUnit -Filter *   ```  ``` Write-Output $OU.name  ``` 
* ``` Get-ADObject -Filter * -SearchBase "OU=Domain Controllers,DC=mello,DC=local" ``` = procura conteúdo dentro de uma OU
* ``` New-ADorganizationalUnit -Name DEV -Path "ou=TI,dc=mello,dc=local" ``` = criar uma OU dentro de outra OU
* ``` New-ADUser -SamAccountName "rafael.mello" -GivenName "Rafael" -Surname "Mello" -Name "Rafael Mello" -UserPrincipalName "rafael.mello@mello.local" -AccountPassword (ConvertTo-SecureString -AsPlainText "abc@123," -Force) -ChangePasswordAtLogon $true  ``` = criando um usuário
* ``` get-aduser -Filter * | Where-Object {$_.SamAccountName -like "*rafa*"} ```  = pesquisa um usuário
* ``` Set-ADAccountPassword -Identity "rafael.mello" -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "abc9eq" -Force) ```  = trocar a senha
* ``` New-ADGroup -Name redes -SamAccountName redes -DisplayName redes -Path "OU=ti,dc=mello,dc=local" -GroupScope Global -GroupCategory Security ```  = criando um grupo

## Variáveis

* ``` new-variable -name $nome "teste" -option ReadHonly```  = cria uma nova variável somente leitura
* ``` Write-Host $nome.GetType().Name ```  = mostra o tipo que é a variável
* Variable com o nome em maiúsculo, quer dizer que é uma constante, é uma variável que não pode ser alterada