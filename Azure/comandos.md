### Comando 01:
* Connect-AzAccount

Esse comando abre uma janela de login interativa, onde você pode
inserir suas credenciais do Azure para fazer login na sua conta.

### Comando 02:

* Connect-AzAccount -Credential $cred

Esse comando faz login usando um objeto de credencial
previamente criado, armazenado na variável $cred


### Comando 03:

* Connect-AzAccount -TenantId "12345678-90ab-cdef-ghij-klmnopqrstuv"

Esse comando faz login especificando um ID de locatário (tenant)
específico, útil quando você possui várias assinaturas associadas a
diferentes locatários.

### Comando 04:

* Get-AzSubscription

Esse comando retorna uma lista de todas as assinaturas
disponíveis na sua conta do Azure.

### Comando 05:

* Get-AzSubscription -SubscriptionName "Minha Assinatura"

Esse comando retorna detalhes específicos da assinatura com o
nome "Minha Assinatura".

### Comando 06:

* Get-AzSubscription | Where-Object { $_.State -eq 'Enabled' }

Esse comando retorna apenas as assinaturas ativas (habilitadas)
na sua conta do Azure.

### Comando 07:

* Select-AzSubscription

Esse comando seleciona a assinatura com o ID
"12345678-90ab-cdef-ghij-klmnopqrstuv" para que os comandos
subsequentes sejam executados nessa assinatura.


### Comando 08:

* Select-AzSubscription -SubscriptionName "Minha Assinatura"

Esse comando seleciona a assinatura com o nome "Minha
Assinatura" para trabalhar com ela.

### Comando 09:

* Get-AzSubscription | Select-AzSubscription -First 1
  
Esse comando seleciona automaticamente a primeira assinatura da
lista retornada por Get-AzSubscription, o que pode ser útil se você
tiver apenas uma assinatura ativa.


### Comando 10:

* Get-AzResourceGroup

Esse comando retorna uma lista de todos os grupos de recursos
disponíveis na assinatura ativa.

### Comando 11:

* Get-AzResourceGroup -Name "MeuGrupoDeRecursos"

Esse comando retorna detalhes específicos do grupo de recursos
com o nome "MeuGrupoDeRecursos".

### Comando 12:

* Get-AzResourceGroup -Tag @{ Environment = "Production" }

Esse comando retorna todos os grupos de recursos marcados com
a tag "Environment" e o valor "Production".

### Comando 13:

*New-AzResourceGroup

Esse comando cria um novo grupo de recursos com o nome
"NovoGrupoDeRecursos" na região "East US".

### Comando 14:

* New-AzResourceGroup -Name "NovoGrupoDeRecursos" -Location

"Brazil South" -Tag @{ Department = "Finance" }
Esse comando cria um novo grupo de recursos com o nome
"NovoGrupoDeRecursos" na região "Brazil South" e atribui a tag
"Department" com o valor "Finance".

### Comando 15:

* $resourceGroupParams = @{ Name = "NovoGrupoDeRecursos" Location = "West Europe" }
New-AzResourceGroup @resourceGroupParams

Esse comando cria um novo grupo de recursos usando um
hashtable para fornecer os parâmetros, o que pode facilitar a
reutilização de configurações.

### Comando 16 :

* Get-AzVM

Esse comando retorna informações detalhadas sobre todas as
máquinas virtuais no grupo de recursos "MeuGrupoDeRecursos".

### Comando 17:

* Get-AzVM -Name "MinhaVM" -ResourceGroupName

"MeuGrupoDeRecursos"Esse comando retorna informações detalhadas da máquina virtual
chamada "MinhaVM" no grupo de recursos
"MeuGrupoDeRecursos".

### Comando 18:

* Get-AzVM | Where-Object { $_.Tags.Department -eq "Finance" }

Esse comando retorna todas as máquinas virtuais que possuem a
tag "Department" com o valor "Finance".

### Comando 19:

* New-AzVM -ResourceGroupName "MeuGrupoDeRecursos" -Name "NovaVM" -Image UbuntuLTS -Size Standard_B2s -Location "East US"

Esse comando cria uma nova máquina virtual chamada "NovaVM"
no grupo de recursos "MeuGrupoDeRecursos", usando a imagem
do Ubuntu LTS, tamanho Standard_B2s e localização "East US".

### Comando 20:

* $vmConfig = New-AzVMConfig -VMName "NovaVM" -VMSize Standard_D2s_v3 New-AzVM -ResourceGroupName "MeuGrupoDeRecursos" -Location "West Europe" -VM $vmConfig

Esse comando cria uma nova configuração de máquina virtual
usando o cmdlet New-AzVMConfig e, em seguida, cria uma
máquina virtual chamada "NovaVM" no grupo de recursos
"MeuGrupoDeRecursos" e localização "West Europe".


### Comando 21:

*$vmParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "NovaVM"
Image = "Win2019Datacenter"
Size = "Standard_D2s_v3"
Location = "East US"
}
New-AzVM @vmParams

Esse comando cria uma nova máquina virtual usando um hashtable
para fornecer os parâmetros, permitindo uma forma mais flexível e
personalizada de criação de VMs.

### Comando 22:

* Start-AzVM -ResourceGroupName "MeuGrupoDeRecursos" -Name
"MinhaVM"

Esse comando inicia a máquina virtual chamada "MinhaVM" no
grupo de recursos "MeuGrupoDeRecursos", permitindo o acesso
aos serviços e aplicativos nela hospedados.

### Comando 23:

* Get-AzVM -Status | Where-Object { $_.Status -eq "Stopped" } |
Start-AzVM

Esse comando verifica todas as máquinas virtuais com status
"Stopped" (paradas) e inicia todas elas, permitindo que elas sejam
colocadas em execução novamente.

### Comando 24: 

* $vm = Get-AzVM -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MinhaVM"
Start-AzVM -VM $vm

Esse comando obtém a máquina virtual chamada "MinhaVM" no
grupo de recursos "MeuGrupoDeRecursos" e a inicia usando o
objeto de máquina virtual armazenado na variável $vm.

### Comando 25:

* Stop-AzVM -ResourceGroupName "MeuGrupoDeRecursos" -Name
"MinhaVM" -Force

Esse comando interrompe de forma segura a máquina virtual
chamada "MinhaVM" no grupo de recursos
"MeuGrupoDeRecursos", preservando os dados e os recursos
associados.

### Comando 26:

* Stop-AzVM -ResourceGroupName "MeuGrupoDeRecursos" -Name
"MinhaVM" -StayProvisioned

Esse comando interrompe a máquina virtual chamada "MinhaVM"
no grupo de recursos "MeuGrupoDeRecursos", mas mantém o
provisionamento dos recursos subjacentes, permitindo uma
inicialização mais rápida quando necessário.

### Comando 27:

* $vmsToStop = Get-AzVM -ResourceGroupName
 "MeuGrupoDeRecursos" | Where-Object { $_.Tags.Environment -eq
"Development" }
Stop-AzVM -VM $vmsToStop -Force

Esse comando obtém todas as máquinas virtuais no grupo de
recursos "MeuGrupoDeRecursos" com a tag "Environment"
definida como "Development" e as interrompe forçadamente
usando o objeto de máquina virtual retornado pelo cmdlet
Get-AzVM.

### Comando 28:

* Restart-AzVM -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MinhaVM" -Force

Esse comando reinicia a máquina virtual chamada "MinhaVM" no
grupo de recursos "MeuGrupoDeRecursos", aplicando alterações
ou corrigindo problemas que possam exigir uma reinicialização.

### Comando 29:

*Restart-AzVM -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MinhaVM" -SkipShutdown

Esse comando reinicia a máquina virtual chamada "MinhaVM" no
grupo de recursos "MeuGrupoDeRecursos" sem realizar um
desligamento prévio. É útil quando você precisa reiniciar
rapidamente a VM.

### Comando 30:

* $vm = Get-AzVM -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MinhaVM"
Restart-AzVM -VM $vm

Esse comando obtém a máquina virtual chamada "MinhaVM" no
grupo de recursos "MeuGrupoDeRecursos" e a reinicia usando o
objeto de máquina virtual armazenado na variável $vm.

### Comando 31:

* Remove-AzVM -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MinhaVM" -Force

Esse comando exclui a máquina virtual chamada "MinhaVM" no
grupo de recursos "MeuGrupoDeRecursos" de forma irreversível. O
uso do parâmetro -Force é necessário para confirmar a exclusão
sem solicitar confirmação adicional.
### Comando 32:

* $vm = Get-AzVM -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MinhaVM"
Remove-AzVM -VM $vm -Force -DeleteVHD

Esse comando obtém a máquina virtual chamada "MinhaVM" no
grupo de recursos "MeuGrupoDeRecursos" e a exclui, juntamente
com seus recursos associados, incluindo os discos rígidos virtuais
(VHDs). O parâmetro -DeleteVHD é usado para excluir também os
VHDs relacionados.

### Comando 33:

* $vmNames = "VM1", "VM2", "VM3"Remove-AzVM -ResourceGroupName "MeuGrupoDeRecursos"
-Name $vmNames -Force

Esse comando remove várias máquinas virtuais de uma vez. Os
nomes das VMs são especificados em um array ($vmNames) e
todas elas são excluídas no grupo de recursos
"MeuGrupoDeRecursos" sem solicitar confirmação adicional.

### Comando 34:

* Get-AzStorageAccount -ResourceGroupName
"MeuGrupoDeRecursos"

Esse comando retorna informações detalhadas sobre todas as
contas de armazenamento no grupo de recursos
"MeuGrupoDeRecursos".

### Comando 35:

* Get-AzStorageAccount | Where-Object { $_.Tags.Environment -eq
"Production" }

Esse comando retorna todas as contas de armazenamento que
possuem a tag "Environment" com o valor "Production".

### Comando 36:

* Get-AzStorageAccount -ResourceType
"Microsoft.Storage/storageAccounts" -TagName "Department"
-TagValue "Finance"

Esse comando retorna todas as contas de armazenamento com o
tipo "Microsoft.Storage/storageAccounts" que possuem a tag
"Department" com o valor "Finance".

### Comando 37:

* New-AzStorageAccount -ResourceGroupName
"MeuGrupoDeRecursos" -Name "NovaContaDeArmazenamento"
-SkuName "Standard_LRS" -Location "East US"

Esse comando cria uma nova conta de armazenamento chamada
"NovaContaDeArmazenamento" no grupo de recursos
"MeuGrupoDeRecursos", utilizando o SKU "Standard_LRS" e
localizada na região "East US".

### Comando 38:

* $storageParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "NovaContaDeArmazenamento"
SkuName = "Standard_LRS"
Location = "West Europe"
}
New-AzStorageAccount @storageParams

Esse comando cria uma nova conta de armazenamento usando um
hashtable para fornecer os parâmetros, permitindo uma forma mais
flexível e personalizada de criação da conta.

### Comando 39:

* $storageConfig = @{ResourceGroupName = "MeuGrupoDeRecursos"
Name = "NovaContaDeArmazenamento"
SkuName = "Standard_GRS"
Location = "Brazil South"
AccessTier = "Hot"
EnableHttpsTrafficOnly = $true
}
New-AzStorageAccount @storageConfig

Esse comando cria uma nova conta de armazenamento com
configurações adicionais, como definição do acesso Tier como
"Hot" e a restrição para permitir apenas tráfego HTTPS, utilizando o
hashtable para fornecer os parâmetros.

### Comando 40:

* Get-AzAppServicePlan -ResourceGroupName
"MeuGrupoDeRecursos"

Esse comando retorna informações sobre todos os planos de
serviço do Azure App Service no grupo de recursos
"MeuGrupoDeRecursos"

### Comando 41:

 * Get-AzAppServicePlan | Where-Object { $_.Tags.Environment -eq
"Production" }

Esse comando retorna todos os planos de serviço do Azure App
Service que possuem a tag "Environment" com o valor
"Production".

### Comando 42:Get-AzAppServicePlan | Sort-Object -Property Name -Descending |

* Select-Object -First 5

Esse comando retorna os cinco primeiros planos de serviço do
Azure App Service encontrados, classificados em ordem
decrescente pelo nome.

### Comando 43:

& New-AzAppServicePlan -ResourceGroupName
"MeuGrupoDeRecursos" -Name "NovoPlano" -Location "West
Europe" -Tier "Free"

Esse comando cria um novo plano de serviço do Azure App
Service chamado "NovoPlano" no grupo de recursos
"MeuGrupoDeRecursos", localizado em "West Europe" e com o
nível "Free".

### Comando 44:

* $appServicePlanParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "NovoPlano"
Location = "East US"
Tier = "Standard"
WorkerSize = "Medium"
}
New-AzAppServicePlan @appServicePlanParams

Esse comando cria um novo plano de serviço do Azure App
Service utilizando um hashtable para fornecer os parâmetros,
permitindo maior flexibilidade na definição dos detalhes do plano.

### Comando 45:

*New-AzAppServicePlan -ResourceGroupName
"MeuGrupoDeRecursos" -Name "NovoPlano" -Location "West
Europe" -Tier "Premium" -Capacity 2

Esse comando cria um novo plano de serviço do Azure App
Service chamado "NovoPlano" no grupo de recursos
"MeuGrupoDeRecursos", localizado em "West Europe", com o nível
"Premium" e uma capacidade de duas instâncias.

### Comando 46:

* Get-AzWebApp -ResourceGroupName "MeuGrupoDeRecursos"

Esse comando retorna informações sobre todos os aplicativos web
hospedados no Azure App Service no grupo de recursos
"MeuGrupoDeRecursos".
### Comando 47:

* Get-AzWebApp | Where-Object { $_.Tags.Environment -eq
"Production" }

Esse comando retorna todos os aplicativos web que possuem a tag
"Environment" com o valor "Production".

### Comando 48:

* Get-AzWebApp -ResourceGroupName "MeuGrupoDeRecursos" |
Sort-Object -Property Name -Descending | Select-Object -First 5

Esse comando retorna os cinco primeiros aplicativos web
encontrados no grupo de recursos "MeuGrupoDeRecursos",
classificados em ordem decrescente pelo nome.

### Comando 49:

* New-AzWebApp -ResourceGroupName "MeuGrupoDeRecursos"
-Name "NovoAppWeb" -Location "West Europe" -AppServicePlan
"MeuPlano" -Runtime "DOTNET"

Esse comando cria um novo aplicativo web chamado
"NovoAppWeb" no grupo de recursos "MeuGrupoDeRecursos",
localizado em "West Europe", utilizando o plano de serviço
"MeuPlano" e a plataforma de execução ".NET".

### Comando 50:

* $webAppParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "NovoAppWeb"
Location = "East US"
AppServicePlan = "MeuPlano"
Runtime = "NODE"
}
New-AzWebApp @webAppParams

Esse comando cria um novo aplicativo web utilizando um hashtable
para fornecer os parâmetros, permitindo maior flexibilidade na
definição dos detalhes do aplicativo


### Comando 51:

* New-AzWebApp -ResourceGroupName "MeuGrupoDeRecursos"
-Name "NovoAppWeb" -Location "West Europe" -AppServicePlanId
"/subscriptions/12345678-90ab-cdef-ghij-klmnopqrstuv/resourceGroups/MeuGrupoDeRecursos/providers/Microsoft.Web/serverFarms/
MeuPlano" -RuntimeStack "PHP|7.4"

Esse comando cria um novo aplicativo web chamado
"NovoAppWeb" no grupo de recursos "MeuGrupoDeRecursos",
localizado em "West Europe", utilizando o ID do plano de serviço
(App Service Plan) e especificando a pilha de execução como PHP
7.4.

### Comando 52:

* Get-AzSQLServer -ResourceGroupName "MeuGrupoDeRecursos"

Esse comando retorna informações sobre todos os servidores SQL
do Azure no grupo de recursos "MeuGrupoDeRecursos".

### Comando 53:

* Get-AzSQLServer | Where-Object { $_.Tags.Environment -eq
"Production" }

Esse comando retorna todos os servidores SQL do Azure que
possuem a tag "Environment" com o valor "Production".

### Comando 54:

*Get-AzSQLServer -ResourceGroupName "MeuGrupoDeRecursos"
| Sort-Object -Property Name -Descending | Select-Object -First 5

Esse comando retorna os cinco primeiros servidores SQL do Azure
encontrados no grupo de recursos "MeuGrupoDeRecursos",
classificados em ordem decrescente pelo nome.

### Comando 55:

* New-AzSQLServer -ResourceGroupName "MeuGrupoDeRecursos"
-ServerName "NovoServerSQL" -Location "West Europe"
-AdministratorLogin "admin" -AdministratorLoginPassword
(ConvertTo-SecureString -String "MinhaSenhaSegura" -AsPlainText
-Force)

Esse comando cria um novo servidor SQL do Azure chamado
"NovoServerSQL" no grupo de recursos "MeuGrupoDeRecursos",
localizado em "West Europe", especificando o nome de usuário do
administrador ("admin") e uma senha segura para a conta do
administrador.

### Comando 56:

* $serverParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
ServerName = "NovoServerSQL"
Location = "East US"
AdministratorLogin = "admin"
AdministratorLoginPassword = (ConvertTo-SecureString -String
"MinhaSenhaSegura" -AsPlainText -Force)
}
New-AzSQLServer @serverParams

Esse comando cria um novo servidor SQL do Azure utilizando um
hashtable para fornecer os parâmetros, permitindo maior
flexibilidade na definição dos detalhes do servidor.

### Comando 57:

* New-AzSQLServer -ResourceGroupName "MeuGrupoDeRecursos"
-ServerName "NovoServerSQL" -Location "West Europe"-AdministratorLogin "admin" -AdministratorLoginPassword
(Get-Credential).Password

Esse comando cria um novo servidor SQL do Azure chamado
"NovoServerSQL" no grupo de recursos "MeuGrupoDeRecursos",
localizado em "West Europe", especificando o nome de usuário do
administrador ("admin") e solicitando a senha do administrador por
meio de uma caixa de diálogo.

### Comando 58:

* Get-AzSQLDatabase -ResourceGroupName
"MeuGrupoDeRecursos" -ServerName "MeuServerSQL"

* Esse comando retorna informações sobre todos os bancos de
dados SQL do Azure associados ao servidor "MeuServerSQL" no
grupo de recursos "MeuGrupoDeRecursos".

### Comando 59:

*Get-AzSQLDatabase | Where-Object { $_.Tags.Environment -eq
"Production" }

Esse comando retorna todos os bancos de dados SQL do Azure
que possuem a tag "Environment" com o valor "Production".

### Comando 60:

* Get-AzSQLDatabase -ResourceGroupName
"MeuGrupoDeRecursos" -ServerName "MeuServerSQL" |
Sort-Object -Property Name -Descending | Select-Object -First 5

Esse comando retorna os cinco primeiros bancos de dados SQL do
Azure associados ao servidor "MeuServerSQL" no grupo derecursos "MeuGrupoDeRecursos", classificados em ordem
decrescente pelo nome.

### Comando 61:

* Set-AzContext -SubscriptionId
"12345678-90ab-cdef-ghij-klmnopqrstuv"

Esse comando define o contexto atual para a assinatura com o ID
"12345678-90ab-cdef-ghij-klmnopqrstuv". Ele permite que você
selecione essa assinatura para executar comandos subsequentes.

### Comando 62:

* $subscription = Get-AzSubscription -SubscriptionName "Minha
Assinatura"
Set-AzContext -Context $subscription.Context

Esse comando obtém o objeto de assinatura para a assinatura com
o nome "Minha Assinatura" e, em seguida, define o contexto atual
para essa assinatura.

### Comando 63:

* Set-AzContext -TenantId "abcdefgh-ijkl-mnop-qrst-uvwxyz012345"

Esse comando define o contexto atual para a assinatura associada
ao locatário (tenant) com o ID
"abcdefgh-ijkl-mnop-qrst-uvwxyz012345".

### Comando 64:

* Get-AzVirtualNetwork -ResourceGroupName
"MeuGrupoDeRecursos"

Esse comando retorna informações detalhadas sobre todas as
redes virtuais no grupo de recursos "MeuGrupoDeRecursos".

### Comando 65:

* Get-AzVirtualNetwork | Where-Object { $_.Tags.Environment -eq
"Production" }

Esse comando retorna todas as redes virtuais que possuem a tag
"Environment" com o valor "Production".

### Comando 66:

* Get-AzVirtualNetwork -Name "MinhaRedeVirtual"
-ResourceGroupName "MeuGrupoDeRecursos"

Esse comando retorna informações detalhadas da rede virtual
chamada "MinhaRedeVirtual" no grupo de recursos
"MeuGrupoDeRecursos".

### Comando 67:

* New-AzVirtualNetwork -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaRedeVirtual" -AddressPrefix
"10.0.0.0/16" -Location "East US"

Esse comando cria uma nova rede virtual com o nome
"MinhaRedeVirtual" no grupo de recursos "MeuGrupoDeRecursos",usando o prefixo de endereço IP "10.0.0.0/16" e localizada na
região "East US".

### Comando 68:

* New-AzVirtualNetwork -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaRedeVirtual" -AddressPrefix
"192.168.0.0/16" -Subnet $subnetParams

Esse comando cria uma nova rede virtual com o nome
"MinhaRedeVirtual" no grupo de recursos "MeuGrupoDeRecursos",
usando o prefixo de endereço IP "192.168.0.0/16" e especificando
as sub-redes por meio de um objeto de parâmetro.

### Comando 69:

* $vnetParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "MinhaRedeVirtual"
AddressPrefix = "10.0.0.0/16"
Location = "West Europe"
}
New-AzVirtualNetwork @vnetParams

Esse comando cria uma nova rede virtual usando um hashtable
para fornecer os parâmetros, permitindo uma forma mais flexível e
personalizada de criação da rede virtual.

### Comando 70: 

* Get-AzNetworkInterface -ResourceGroupName
"MeuGrupoDeRecursos"

Esse comando retorna informações sobre todas as interfaces de
rede no grupo de recursos "MeuGrupoDeRecursos".

### Comando 71:

* Get-AzNetworkInterface -Name "MinhaInterface"
-ResourceGroupName "MeuGrupoDeRecursos"

Esse comando retorna informações detalhadas da interface de
rede chamada "MinhaInterface" no grupo de recursos
"MeuGrupoDeRecursos".

### Comando 72:

* Get-AzNetworkInterface | Where-Object { $_.Tags.Environment -eq
"Development" }

Esse comando retorna todas as interfaces de rede que possuem a
tag "Environment" com o valor "Development".

### Comando 73:

* New-AzNetworkInterface -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaInterface" -VirtualNetworkId
"/subscriptions/12345678-90ab-cdef-ghij-klmnopqrstuv/resourceGro
ups/MeuGrupoDeRecursos/providers/Microsoft.Network/virtualNetw
orks/MinhaRedeVirtual" -SubnetId
"/subscriptions/12345678-90ab-cdef-ghij-klmnopqrstuv/resourceGro
ups/MeuGrupoDeRecursos/providers/Microsoft.Network/virtualNetw
orks/MinhaRedeVirtual/subnets/MinhaSubrede" -PrivateIpAddress
"10.0.0.4"

Esse comando cria uma nova interface de rede com o nome
"MinhaInterface" no grupo de recursos "MeuGrupoDeRecursos",
associada à rede virtual e sub-rede especificadas, e com o
endereço IP privado "10.0.0.4".

### Comando 74:

* $nicParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "MinhaInterface"
VirtualNetwork = Get-AzVirtualNetwork -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaRedeVirtual"
Subnet = Get-AzVirtualNetworkSubnetConfig
-VirtualNetwork $vnet -Name "MinhaSubrede"
PrivateIpAddress = "10.0.0.5"
}
New-AzNetworkInterface @nicParams

Esse comando cria uma nova interface de rede usando objetos de
rede virtual e sub-rede obtidos por meio dos cmdlets
Get-AzVirtualNetwork e Get-AzVirtualNetworkSubnetConfig,
permitindo uma forma mais flexível e personalizada de criação da
interface de rede.

### Comando 75:

* $vnet = Get-AzVirtualNetwork -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaRedeVirtual"
$subnet = $vnet.Subnets[0]New-AzNetworkInterface -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaInterface" -VirtualNetwork
$vnet -SubnetId $subnet.Id -PrivateIpAddress "10.0.0.6"

Esse comando cria uma nova interface de rede usando o objeto de
rede virtual e sub-rede obtidos por meio do cmdlet
Get-AzVirtualNetwork e especificando o endereço IP privado
diretamente.

### Comando 76:

* Get-AzPublicIpAddress -ResourceGroupName
"MeuGrupoDeRecursos"

Esse comando retorna informações sobre todos os endereços IP
públicos no grupo de recursos "MeuGrupoDeRecursos". Ele mostra
detalhes como nome, endereço IP, associação a interfaces de rede,
entre outros.

### Comando 77:
* Get-AzPublicIpAddress -Name "MeuEnderecoIP"
-ResourceGroupName "MeuGrupoDeRecursos"

Esse comando retorna informações detalhadas sobre o endereço
IP público chamado "MeuEnderecoIP" no grupo de recursos
"MeuGrupoDeRecursos".

### Comando 78:

* Get-AzPublicIpAddress | Where-Object { $_.Tags.Environment -eq
"Production" }

Esse comando retorna todos os endereços IP públicos que
possuem a tag "Environment" com o valor "Production".

### Comando 79:

* New-AzPublicIpAddress -ResourceGroupName
"MeuGrupoDeRecursos" -Name "NovoEnderecoIP" -Sku
"Standard" -AllocationMethod "Static" -DomainNameLabel
"meudominio"

Esse comando cria um novo endereço IP público com o nome
"NovoEnderecoIP" no grupo de recursos "MeuGrupoDeRecursos".
Ele utiliza o SKU "Standard", um método de alocação estático e um
rótulo de nome de domínio "meudominio".

### Comando 80:

* New-AzPublicIpAddress -ResourceGroupName
"MeuGrupoDeRecursos" -Name "NovoEnderecoIP" -Sku "Basic"
-AllocationMethod "Dynamic"

Esse comando cria um novo endereço IP público com o nome
"NovoEnderecoIP" no grupo de recursos "MeuGrupoDeRecursos".
Ele utiliza o SKU "Basic" e um método de alocação dinâmico.
### Comando 81:

* $ipParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "NovoEnderecoIP"
Sku = "Standard"
AllocationMethod = "Static"
DomainNameLabel = "meudominio"
}
New-AzPublicIpAddress @ipParams

Esse comando cria um novo endereço IP público usando um
hashtable para fornecer os parâmetros, permitindo maior
flexibilidade na definição dos detalhes do endereço IP.

### Comando 82:

* Get-AzStorageAccountKey -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaContaDeArmazenamento"

Esse comando retorna a chave de acesso da conta de
armazenamento chamada "MinhaContaDeArmazenamento" no
grupo de recursos "MeuGrupoDeRecursos". Essa chave é usada
para autenticação e acesso a dados armazenados.

### Comando 83:

* $storageAccount = Get-AzStorageAccount -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaContaDeArmazenamento"
$keys = Get-AzStorageAccountKey -ResourceGroupName
"MeuGrupoDeRecursos" -Name $storageAccount.Name
$keys[0].Value

Esse comando obtém a chave de acesso da conta de
armazenamento usando o cmdlet Get-AzStorageAccount e, em
seguida, a chave é utilizada para fins de autenticação ou acesso a
dados armazenados.

### Comando 84:

*Get-AzStorageAccountKey -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaContaDeArmazenamento" |
Select-Object -ExpandProperty Value

Esse comando retorna apenas o valor da chave de acesso da
conta de armazenamento, sem exibir outras informações.

### Comando 85:

* Set-AzStorageBlobContent -Container "meucontainer" -File
"Caminho\Para\Arquivo\Local" -Context $storageContext

Esse comando carrega um arquivo local para um contêiner de blob
chamado "meucontainer" em uma conta de armazenamento no
Azure. Ele utiliza um contexto de armazenamento previamente
criado.

### Comando 86:

$storageAccount = Get-AzStorageAccount -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaContaDeArmazenamento"
$storageContext = $storageAccount.Context
Set-AzStorageBlobContent -Container "meucontainer" -File
"Caminho\Para\Arquivo\Local" -Context $storageContext

Esse comando obtém o contexto de armazenamento da conta de
armazenamento usando o cmdlet Get-AzStorageAccount e, em
seguida, utiliza o contexto para carregar um arquivo local para um
contêiner de blob.

### Comando 87:

* Set-AzStorageBlobContent -Container "meucontainer" -Blob
"meuarquivo.txt" -File "Caminho\Para\Arquivo\Local" -Context
$storageContext

Esse comando carrega um arquivo local para um blob específico
dentro de um contêiner de blob. O blob é identificado pelo nome
"meuarquivo.txt" e o carregamento é realizado usando o contexto
de armazenamento.

### Comando 88:

* Get-AzKeyVault -ResourceGroupName "MeuGrupoDeRecursos"

Esse comando retorna informações sobre todos os cofres de
chaves (Key Vaults) no grupo de recursos "MeuGrupoDeRecursos".
Ele mostra detalhes como nome, região, políticas de acesso, entre
outros.
### Comando 89:

* Get-AzKeyVault -Name "MeuCofreDeChaves"
-ResourceGroupName "MeuGrupoDeRecursos"

Esse comando retorna informações detalhadas sobre o cofre de
chaves chamado "MeuCofreDeChaves" no grupo de recursos
"MeuGrupoDeRecursos".

### Comando 90:

* Get-AzKeyVault | Where-Object { $_.Tags.Environment -eq
"Production" }

Esse comando retorna todos os cofres de chaves que possuem a
tag "Environment" com o valor "Production".

Comando 91:
New-AzKeyVault -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MeuCofreDeChaves" -Location "East US" -Sku "Standard"
-EnabledForTemplateDeployment $true
Esse comando cria um novo cofre de chaves chamado
"MeuCofreDeChaves" no grupo de recursos
"MeuGrupoDeRecursos". Ele está localizado na região "East US",
usa o SKU "Standard" e permite implantação de modelos.
Comando 92:
$keyVaultParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "MeuCofreDeChaves"
Location = "West Europe"
Sku = "Premium"
EnabledForDeployment = $true
EnabledForTemplateDeployment = $true
}
New-AzKeyVault @keyVaultParams
Esse comando cria um novo cofre de chaves usando um hashtable
para fornecer os parâmetros, permitindo maior flexibilidade na
definição dos detalhes do cofre de chaves.
Comando 93:
New-AzKeyVault -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MeuCofreDeChaves" -Location "West Europe" -Sku
"Standard" -SoftDeleteRetentionInDays 90Esse comando cria um novo cofre de chaves chamado
"MeuCofreDeChaves" no grupo de recursos
"MeuGrupoDeRecursos". Ele está localizado na região "West
Europe", usa o SKU "Standard" e retém os dados excluídos por 90
dias.
Comando 94:
Get-AzKeyVaultSecret -VaultName "MeuCofreDeChaves"
Esse comando retorna informações sobre todos os segredos
armazenados no cofre de chaves chamado "MeuCofreDeChaves".
Ele mostra detalhes como nome, valor, tipo, entre outros.
Comando 95:
Get-AzKeyVaultSecret -VaultName "MeuCofreDeChaves" |
Where-Object { $_.Tags.Environment -eq "Production" }
Esse comando retorna todos os segredos armazenados no cofre
de chaves que possuem a tag "Environment" com o valor
"Production".
Comando 96:
Get-AzKeyVaultSecret -VaultName "MeuCofreDeChaves" -Name
"MeuSegredo"
Esse comando retorna informações detalhadas sobre o segredo
chamado "MeuSegredo" no cofre de chaves "MeuCofreDeChaves".
Comando 97:$secretValue = ConvertTo-SecureString -String
"MinhaSenhaSecreta" -AsPlainText -Force
Set-AzKeyVaultSecret -VaultName "MeuCofreDeChaves" -Name
"SenhaDB" -SecretValue $secretValue
Esse comando define um novo segredo no cofre de chaves
chamado "MeuCofreDeChaves". O segredo é chamado "SenhaDB"
e seu valor é definido como "MinhaSenhaSecreta".
Comando 98:
$secretParams = @{
VaultName = "MeuCofreDeChaves"
Name = "SenhaAPI"
SecretValue = "MinhaChaveAPI"
}
Set-AzKeyVaultSecret @secretParams
Esse comando define um novo segredo usando um hashtable para
fornecer os parâmetros. O segredo é definido como "SenhaAPI"
com o valor "MinhaChaveAPI".
Comando 99:
Set-AzKeyVaultSecret -VaultName "MeuCofreDeChaves" -Name
"ConnectionString" -SecretValue (ConvertTo-SecureString -String
"MinhaConexaoDB" -AsPlainText -Force)
Esse comando define um novo segredo no cofre de chaves
chamado "MeuCofreDeChaves". O segredo é chamado
"ConnectionString" e seu valor é definido como
"MinhaConexaoDB".Comando 100:
Get-AzCosmosDBAccount -ResourceGroupName
"MeuGrupoDeRecursos"
Esse comando retorna informações sobre todas as contas do
Azure Cosmos DB no grupo de recursos "MeuGrupoDeRecursos".
Ele mostra detalhes como nome, tipo de banco de dados, região,
entre outros.
Comando 101:
Get-AzCosmosDBAccount -Name "MinhaContaCosmosDB"
-ResourceGroupName "MeuGrupoDeRecursos"
Esse comando retorna informações detalhadas sobre a conta do
Azure Cosmos DB chamada "MinhaContaCosmosDB" no grupo de
recursos "MeuGrupoDeRecursos".
Comando 102:
Get-AzCosmosDBAccount | Where-Object { $_.Tags.Environment
-eq "Production" }
Esse comando retorna todas as contas do Azure Cosmos DB que
possuem a tag "Environment" com o valor "Production".
Comando 103:
New-AzCosmosDBAccount -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaContaCosmosDB" -Location"East US" -Kind "GlobalDocumentDB" -DefaultConsistencyLevel
"Session"
Esse comando cria uma nova conta do Azure Cosmos DB
chamada "MinhaContaCosmosDB" no grupo de recursos
"MeuGrupoDeRecursos". Ela está localizada na região "East US",
tem o tipo "GlobalDocumentDB" e usa o nível de consistência
"Session" como padrão.
Comando 104:
New-AzCosmosDBAccount -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MinhaContaCosmosDB" -Location
"West Europe" -Kind "MongoDB" -DefaultConsistencyLevel
"Eventual"
Esse comando cria uma nova conta do Azure Cosmos DB
chamada "MinhaContaCosmosDB" no grupo de recursos
"MeuGrupoDeRecursos". Ela está localizada na região "West
Europe", tem o tipo "MongoDB" e usa o nível de consistência
"Eventual" como padrão.
Comando 105:
$cosmosDBParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "MinhaContaCosmosDB"
Location = "West Europe"
Kind = "GlobalDocumentDB"
DefaultConsistencyLevel = "ConsistentPrefix"
}
New-AzCosmosDBAccount @cosmosDBParamsEsse comando cria uma nova conta do Azure Cosmos DB usando
um hashtable para fornecer os parâmetros, permitindo maior
flexibilidade na definição dos detalhes da conta.
Comando 106:
Get-AzWebApp -ResourceGroupName "MeuGrupoDeRecursos"
Esse comando retorna informações detalhadas sobre todos os
aplicativos web hospedados no Azure App Service no grupo de
recursos "MeuGrupoDeRecursos". Ele mostra detalhes como
nome, URL, SKU, região, entre outros.
Comando 107:
Get-AzWebApp -Name "MeuAppWeb" -ResourceGroupName
"MeuGrupoDeRecursos"
Esse comando retorna informações detalhadas sobre o aplicativo
web chamado "MeuAppWeb" no grupo de recursos
"MeuGrupoDeRecursos".
Comando 108:
Get-AzWebApp | Where-Object { $_.Tags.Environment -eq
"Production" }
Esse comando retorna todos os aplicativos web que possuem a tag
"Environment" com o valor "Production".
Comando 109:New-AzWebApp -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MeuNovoAppWeb" -AppServicePlan "MeuPlanoDeServico"
-Runtime "ASP.NET" -Location "West Europe"
Esse comando cria um novo aplicativo web chamado
"MeuNovoAppWeb" no grupo de recursos "MeuGrupoDeRecursos".
Ele utiliza o plano de serviço "MeuPlanoDeServico", o runtime
"ASP.NET" e está localizado na região "West Europe".
Comando 110:
$webAppParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "MeuNovoAppWeb"
AppServicePlan = "MeuPlanoDeServico"
Runtime = "Node"
Location = "East US"
}
New-AzWebApp @webAppParams
Esse comando cria um novo aplicativo web usando um hashtable
para fornecer os parâmetros, permitindo uma forma mais flexível e
personalizada de criação do aplicativo web.
Comando 111:
New-AzWebApp -ResourceGroupName "MeuGrupoDeRecursos"
-Name "MeuNovoAppWeb" -AppServicePlan "MeuPlanoDeServico"
-Runtime "Python" -Location "West Europe"
Esse comando cria um novo aplicativo web chamado
"MeuNovoAppWeb" no grupo de recursos "MeuGrupoDeRecursos".Ele utiliza o plano de serviço "MeuPlanoDeServico", o runtime
"Python" e está localizado na região "West Europe".
Comando 112:
Get-AzFunctionApp -ResourceGroupName
"MeuGrupoDeRecursos"
Esse comando retorna informações detalhadas sobre todos os
aplicativos de função (Function Apps) no Azure no grupo de
recursos "MeuGrupoDeRecursos". Ele mostra detalhes como
nome, URL, SKU, região, entre outros.
Comando 113:
Get-AzFunctionApp -Name "MeuFunctionApp"
-ResourceGroupName "MeuGrupoDeRecursos"
Esse comando retorna informações detalhadas sobre o aplicativo
de função chamado "MeuFunctionApp" no grupo de recursos
"MeuGrupoDeRecursos".
Comando 114:
Get-AzFunctionApp | Where-Object { $_.Tags.Environment -eq
"Production" }
Esse comando retorna todos os aplicativos de função que possuem
a tag "Environment" com o valor "Production".
Comando 115:New-AzFunctionApp -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MeuNovoFunctionApp"
-AppServicePlan "MeuPlanoDeServico" -Runtime "DotNet"
-Location "West Europe"
Esse comando cria um novo aplicativo de função chamado
"MeuNovoFunctionApp" no grupo de recursos
"MeuGrupoDeRecursos". Ele utiliza o plano de serviço
"MeuPlanoDeServico", o runtime ".NET" e está localizado na região
"West Europe".
Comando 116:
$functionAppParams = @{
ResourceGroupName = "MeuGrupoDeRecursos"
Name = "MeuNovoFunctionApp"
AppServicePlan = "MeuPlanoDeServico"
Runtime = "Node"
Location = "East US"
}
New-AzFunctionApp @functionAppParams
Esse comando cria um novo aplicativo de função usando um
hashtable para fornecer os parâmetros, permitindo uma forma mais
flexível e personalizada de criação do aplicativo de função.
Comando 117:
New-AzFunctionApp -ResourceGroupName
"MeuGrupoDeRecursos" -Name "MeuNovoFunctionApp"
-AppServicePlan "MeuPlanoDeServico" -Runtime "Python"
-Location "West Europe"
Esse comando cria um novo aplicativo de função chamado
"MeuNovoFunctionApp" no grupo de recursos"MeuGrupoDeRecursos". Ele utiliza o plano de serviço
"MeuPlanoDeServico", o runtime "Python" e está localizado na
região "West Europe".
Comando 118:
Get-AzSqlServer -ResourceGroupName "MeuGrupoDeRecursos"
Esse comando retorna informações sobre todos os servidores SQL
do Azure no grupo de recursos "MeuGrupoDeRecursos". Ele
fornece detalhes como nome, região, versão, entre outros.
Comando 119:
Get-AzSqlServer -Name "MeuServidorSQL" -ResourceGroupName
"MeuGrupoDeRecursos"
Esse comando retorna informações detalhadas sobre o servidor
SQL chamado "MeuServidorSQL" no grupo de recursos
"MeuGrupoDeRecursos".
Comando 120:
Get-AzSqlServer | Where-Object { $_.Tags.Environment -eq
"Production" }
Esse comando retorna todos os servidores SQL do Azure que
possuem a tag "Environment" com o valor "Production".
Comando 121:$user = New-AzureADUser -DisplayName "John Doe"
-UserPrincipalName "john.doe@contoso.com" -PasswordProfile
$passwordProfile -MailNickName "johndoe" -AccountEnabled $true
Esse comando cria um novo usuário com o nome "John Doe" e o
endereço de email "john.doe@contoso.com". A variável
$passwordProfile deve conter um objeto contendo a senha do
usuário. O usuário está habilitado ($true) para acessar a conta.
Comando 122:
$user = New-AzureADUser -DisplayName "Jane Smith"
-UserPrincipalName "jane.smith@contoso.com" -PasswordProfile
$passwordProfile -MailNickName "janesmith" -AccountEnabled
$true
Esse comando cria um novo usuário com o nome "Jane Smith" e o
endereço de email "jane.smith@contoso.com". Assim como no
exemplo anterior, é necessário fornecer um objeto
$passwordProfile contendo a senha do usuário.
Comando 123:
$group = New-AzureADGroup -DisplayName "Finance Group"
-MailEnabled $false -SecurityEnabled $true
Esse comando cria um novo grupo chamado "Finance Group". O
grupo não é habilitado para envio de emails ($false), mas é um
grupo de segurança habilitado ($true).
Comando 124:$group = New-AzureADGroup -DisplayName "Marketing Group"
-MailEnabled $false -SecurityEnabled $true
Esse comando cria um novo grupo chamado "Marketing Group".
Assim como no exemplo anterior, o grupo não é habilitado para
envio de emails, mas é um grupo de segurança.
Comando 125:
Add-AzureADGroupMember -ObjectId $group.ObjectId
-RefObjectId $user.ObjectId
Esse comando adiciona um usuário a um grupo no Azure AD.
Comando 126:
$userToAdd = Get-AzureADUser -Filter "UserPrincipalName eq
'john.doe@contoso.com'"
Add-AzureADGroupMember -ObjectId $group.ObjectId
-RefObjectId $userToAdd.ObjectId
Esse comando adiciona o usuário com o endereço de email
"john.doe@contoso.com" ao grupo especificado pelo objeto
$group. Neste exemplo, o objeto de usuário é obtido usando o
comando Get-AzureADUser e filtrando pelo UserPrincipalName.
Comando 127:
$app = New-AzureADApplication -DisplayName "MyApp"
-IdentifierUris "https://myapp.com" -ReplyUrls
"https://myapp.com/redirect"Esse comando cria uma nova aplicação chamada "MyApp" com o
URI do identificador definido como "https://myapp.com" e a URL de
redirecionamento definida como "https://myapp.com/redirect".
S