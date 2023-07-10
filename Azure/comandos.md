### ### Comando 01:
* Connect-AzAccount

Esse comando abre uma janela de login interativa, onde você pode
inserir suas credenciais do Azure para fazer login na sua conta.

### ### Comando 02:

* Connect-AzAccount -Credential $cred

Esse comando faz login usando um objeto de credencial
previamente criado, armazenado na variável $cred


### ### Comando 03:

* Connect-AzAccount -TenantId "12345678-90ab-cdef-ghij-klmnopqrstuv"

Esse comando faz login especificando um ID de locatário (tenant)
específico, útil quando você possui várias assinaturas associadas a
diferentes locatários.

### ### Comando 04:

* Get-AzSubscription

Esse comando retorna uma lista de todas as assinaturas
disponíveis na sua conta do Azure.

### ### Comando 05:

* Get-AzSubscription -SubscriptionName "Minha Assinatura"

Esse comando retorna detalhes específicos da assinatura com o
nome "Minha Assinatura".

### ### Comando 06:

* Get-AzSubscription | Where-Object { $_.State -eq 'Enabled' }

Esse comando retorna apenas as assinaturas ativas (habilitadas)
na sua conta do Azure.

### ### Comando 07:

* Select-AzSubscription

Esse comando seleciona a assinatura com o ID
"12345678-90ab-cdef-ghij-klmnopqrstuv" para que os comandos
subsequentes sejam executados nessa assinatura.


### ### Comando 08:

* Select-AzSubscription -SubscriptionName "Minha Assinatura"

Esse comando seleciona a assinatura com o nome "Minha
Assinatura" para trabalhar com ela.

### ### Comando 09:
* Get-AzSubscription | Select-AzSubscription -First 1
  
Esse comando seleciona automaticamente a primeira assinatura da
lista retornada por Get-AzSubscription, o que pode ser útil se você
tiver apenas uma assinatura ativa.


### ### Comando 10:

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