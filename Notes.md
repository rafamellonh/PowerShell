* ``` cp ```  = copiar
* ``` mv ```  = mover
* ``` erase ``` = apagar arquivo
* ``` enter-pssession server01 ```  = conecta remotamente em um servidor.
  
  **Se apresentar erros para conectar, execute os seguintes passo**

  ``` start-service winrm ``` 

  ``` Set-Item WSMan:\localhost\Client\TrustedHosts -Value "IP DO PC que quer conectar" ``` 

* ``` get-windowsfeature ```  = obtem lista de features para instalar no windows server (``` get-windowsfeature -name *dns* ``` )