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