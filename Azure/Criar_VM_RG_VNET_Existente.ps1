##PROGRAMA DE CERTIFICAÇÃO AZ-303 - TFTEC
##1.0 Conectando no Azure
##Connect-AzAccount

##2 Definindo as variÃ¡veis de rede
$ResourceGroup  = "RG-AZ303"
$Location       = "brazilsouth"
$vNetName       = "VNET01"
$AddressSpace   = "10.10.0.0/24"
$SubnetIPRange  = "10.10.0.0/27" 
$SubnetName     = "SUB-LAN"
$nsgName        = "NSG-VM"

##3 Criar Resource Groups
New-AzResourceGroup -Name $ResourceGroup -Location $Location


##4 Criar o Network Security Group e liberar porta 3389 para acesso RDP
$nsgRuleVMAccess = New-AzNetworkSecurityRuleConfig -Name 'ALLOW-RDP' -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389 -Access Allow

New-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroup -Location $location -Name $nsgName -SecurityRules $nsgRuleVMAccess

##5 Definir as variaveis da maquina virtual
$vNet       = Get-AzVirtualNetwork -ResourceGroupName RG-RBAC -Name $vNetName
$Subnet     = Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $vNet
$nsg        = Get-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroup -Name $NsgName
$vmName     = "VM-01"
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

##8.1 Adicionando as configuraÃ§Ãµes da mÃ¡quina virtual
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize
Add-AzVMNetworkInterface -VM $vmConfig -Id $nic.Id

##9.1 Setando os parÃ¢metros do sistema operacional 
Set-AzVMOperatingSystem -VM $vmConfig -Windows -ComputerName $vmName -Credential $adminCreds

##10.1 Setando a imagem utilizada na mÃ¡quina virtual
Set-AzVMSourceImage -VM $vmConfig -PublisherName $pubName -Offer $offerName -Skus $skuName -Version 'latest'

##11.1 Setando as configuraÃ§Ãµes de disco
Set-AzVMOSDisk -VM $vmConfig -Name $osDiskName -StorageAccountType $osDiskType -CreateOption fromImage

##12.1 Desabilitando o diagnÃ³stico de boot
Set-AzVMBootDiagnostic -VM $vmConfig -Disable

##13.1 Criando a mÃ¡quina virtual
New-AzVM -ResourceGroupName $ResourceGroup -Location $location -VM $vmConfig

