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
* Get-AzSubscription | Select-AzSubscription -First 1Esse comando seleciona automaticamente a primeira assinatura da


lista retornada por Get-AzSubscription, o que pode ser útil se você
tiver apenas uma assinatura ativa.


### Comando 10:

* Get-AzResourceGroup

Esse comando retorna uma lista de todos os grupos de recursos
disponíveis na assinatura ativa.