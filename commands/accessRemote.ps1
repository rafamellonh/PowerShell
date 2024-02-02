

#### PSRemoting ####
#Habilitar PSRemoting
Enable-PSRemoting -Force

#Conectar
Enter-PSSession -ComputerName vm-adds01

#Ignorar public network profile
Enable-PSRemoting -Force -SkipNetworkProfileCheck

#validar remote powershell está habilitado:
Enter-PSSession -ComputerName localhost




#### CREDSSP #####


# Verify the problem
Enter-PSSession -ComputerName 'vm-jea'
Invoke-Command -ComputerName 'vm-adds01' -ScriptBlock { Get-WindowsFeature | Where-Object -FilterScript { $_.InstallState -eq 'Installed' } }

# Habilitar utilização de sneha via CredSSP 
Enable-WSManCredSSP -Role Client -DelegateComputer vm-jea.partiunuvem.com.br -Force

# validar status CredSSP
Get-WSManCredSSP

# Habilitar o armazenamento de credencial CredSSP
Invoke-Command -ComputerName vm-jea -Scriptblock {Enable-WSManCredSSP -Role Server -Force}

# realizando login com CredSSP
Enter-PSSession -ComputerName vm-jea.partiunuvem.com -Credential partiunuvem\admin.raphael -Authentication CredSSP

# Desabilitar o encaminhamento do CredSSP
Disable-WSManCredSSP -Role Client

# Desabilitar o armazenamento da credencial no servidor
Invoke-Command -ComputerName vm-jea -ScriptBlock { Disable-WSManCredSSP -Role Server }
