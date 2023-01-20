##PROGRAMA DE CERTIFICA��O AZ-303 - TFTEC
##1.0 Conectando no Azure
##Connect-AzAccount

##1.1 Definindo as variáveis de rede
$ResourceGroup  = "RG-RBAC"
$Location       = "brazilsouth"
$vNetName       = "VNET01"
$AddressSpace   = "10.10.0.0/24"
$SubnetIPRange  = "10.10.0.0/27" 
$SubnetName     = "SUB-LAN"
$nsgName        = "NSG01"


##2 Criar Resource Groups
New-AzResourceGroup -Name $ResourceGroup -Location $Location

##3 Criar a Virtual Network
$vNetwork = New-AzVirtualNetwork -ResourceGroupName $ResourceGroup -Name $vNetName -AddressPrefix $AddressSpace -Location $location

##3.1 Criar a Subnet
Add-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $vNetwork -AddressPrefix $SubnetIPRange

##3 Setar as configuracoes
Set-AzVirtualNetwork -VirtualNetwork $vNetwork

##4 Criar o Network Security Group e liberar porta 3389 para acesso RDP
$nsgRuleVMAccess = New-AzNetworkSecurityRuleConfig -Name 'ALLOW-RDP' -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389 -Access Allow

New-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroup -Location $location -Name $nsgName -SecurityRules $nsgRuleVMAccess

##5 Definir as variaveis da maquina virtual
$vNet       = Get-AzVirtualNetwork -ResourceGroupName $ResourceGroup -Name $vNetName
$Subnet     = Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $vNet
$nsg        = Get-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroup -Name $NsgName
$vmName     = "VM-RBACK"
$pubName    = "MicrosoftWindowsServer"
$offerName  = "WindowsServer"
$skuName    = "2019-Datacenter"
$vmSize     = "Standard_DS2_v2"
$pipName    = "$vmName-pip" 
$nicName    = "$vmName-nic"
$osDiskName = "$vmName-OsDisk"
$osDiskType = "Standard_LRS"

##6 Definir credinciais de admin da VM
$adminUsername = 'azadmin'
$adminPassword = 'Teste@123456'
$adminCreds    = New-Object PSCredential $adminUsername, ($adminPassword | ConvertTo-SecureString -AsPlainText -Force)

##7 Criar IP publico e interface de rede NIC
$pip = New-AzPublicIpAddress -Name $pipName -ResourceGroupName $ResourceGroup -Location $location -AllocationMethod Static 
$nic = New-AzNetworkInterface -Name $nicName -ResourceGroupName $ResourceGroup -Location $location -SubnetId $Subnet.Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id

##8.1 Adicionando as configurações da máquina virtual
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize
Add-AzVMNetworkInterface -VM $vmConfig -Id $nic.Id

##9.1 Setando os parâmetros do sistema operacional 
Set-AzVMOperatingSystem -VM $vmConfig -Windows -ComputerName $vmName -Credential $adminCreds

##10.1 Setando a imagem utilizada na máquina virtual
Set-AzVMSourceImage -VM $vmConfig -PublisherName $pubName -Offer $offerName -Skus $skuName -Version 'latest'

##11.1 Setando as configurações de disco
Set-AzVMOSDisk -VM $vmConfig -Name $osDiskName -StorageAccountType $osDiskType -CreateOption fromImage

##12.1 Desabilitando o diagnóstico de boot
Set-AzVMBootDiagnostic -VM $vmConfig -Disable

##13.1 Criando a máquina virtual
New-AzVM -ResourceGroupName $ResourceGroup -Location $location -VM $vmConfig

