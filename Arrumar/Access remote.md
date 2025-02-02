# Access remote

Enable-PSRemoting 

set-Item WSMan:localhost\client\trustedhosts 192.168.5.25 

restart-service winrm 

Set-Item WSMan:\localhost\Client\TrustedHosts -Force -Value 192.168.5.25

winrm set winrm/config/client @{TrustedHosts="192.168.5.248"} 

winrm set winrm/config/client @{TrustedHosts="192.168.5.25"} 

winrm create winrm/config/listener?Address=*+Transport=HTTP

#New-WSManInstance winrm/config/Listener -SelectorSet @{Address="IP:192.168.5.248";Transport="http"



Configurar Acesso Remoto do PowerShell do PC01 para o PC02

Este tutorial explica como configurar o acesso remoto do PowerShell de um computador (PC01) para outro (PC02) usando o Windows Remote Management (WinRM).

Requisitos

Conectividade de Rede

Ambos os computadores (PC01 e PC02) devem estar na mesma rede ou ter conectividade entre si.

Sistema Operacional e PowerShell

Ambos devem estar executando o Windows com o PowerShell instalado.

Permissões de Usuário

O usuário que fará a conexão remota deve ter permissões administrativas no PC02.

Passo 1: Habilitar o PowerShell Remoting no PC02 (máquina de destino)

No PC02, siga os passos abaixo para habilitar o PowerShell Remoting e configurar o WinRM.

Abrir o PowerShell como Administrador

No PC02, abra o PowerShell como Administrador.

Habilitar o PowerShell Remoting

Execute o comando abaixo:

Enable-PSRemoting -Force

Isso configura o WinRM para iniciar automaticamente e cria uma regra no firewall para permitir conexões remotas.

Verificar o Serviço WinRM

Verifique se o serviço WinRM está em execução:

Get-Service WinRM

Se não estiver em execução, inicie-o com:

Start-Service WinRM

Adicionar o PC01 como Host Confiável (Opcional)

Se o PC01 estiver em um domínio diferente ou em um grupo de trabalho, adicione o PC01 como um host confiável:

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "PC01" -Force

Substitua "PC01" pelo nome do computador ou IP do PC01.

Para permitir todos os hosts, use:

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force

Reiniciar o Serviço WinRM

Reinicie o serviço WinRM para aplicar as alterações:

Restart-Service WinRM

Passo 2: Configurar o PC01 (máquina de origem)

No PC01, configure o WinRM para se conectar ao PC02.

Abrir o PowerShell como Administrador

No PC01, abra o PowerShell como Administrador.

Adicionar o PC02 como Host Confiável

Adicione o PC02 como um host confiável:

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "PC02" -Force

Substitua "PC02" pelo nome do computador ou IP do PC02.

Para permitir todos os hosts, use:

Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force

Reiniciar o Serviço WinRM

Reinicie o serviço WinRM:

Restart-Service WinRM

Passo 3: Testar a Conexão Remota

Teste a conexão remota do PC01 para o PC02.

Abrir o PowerShell no PC01

No PC01, abra o PowerShell.

Iniciar uma Sessão Remota

Use o comando abaixo para iniciar uma sessão remota no PC02:

Enter-PSSession -ComputerName PC02 -Credential (Get-Credential)

Substitua "PC02" pelo nome do computador ou IP do PC02.

O comando Get-Credential solicitará as credenciais de um usuário com permissões administrativas no PC02.

Verificar a Conexão

Se a conexão for bem-sucedida, o prompt do PowerShell mudará para o do PC02, indicando que você está executando comandos remotamente.

Passo 4: Executar Comandos Remotos (Opcional)

Se você não quiser iniciar uma sessão interativa, pode executar comandos remotos diretamente usando o Invoke-Command. Por exemplo:

Invoke-Command -ComputerName PC02 -ScriptBlock { Get-Process } -Credential (Get-Credential)

Isso executará o comando Get-Process no PC02 e retornará o resultado para o PC01.

Resumo

No PC02, habilite o PowerShell Remoting e configure o WinRM.

No PC01, adicione o PC02 como um host confiável.

Teste a conexão usando Enter-PSSession ou Invoke-Command.

Se tudo estiver configurado corretamente, você poderá gerenciar o PC02 remotamente a partir do PC01 usando o PowerShell.
