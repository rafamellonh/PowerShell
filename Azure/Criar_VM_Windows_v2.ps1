### CONECTAR NO AZURE ###
Connect-AzAccount -Tenant 'xxxx-xxxx-xxxx-xxxx'


### CRIAR RESOURCE GROUP ###
# Create variables to store the location and resource group names.
$location = "eastus"
$ResourceGroupName = "rg-ps"

New-AzResourceGroup `
  -Name $ResourceGroupName `
  -Location $location



### STORAGE ACCOUNT ###
  # Create variables to store the storage account name and the storage account SKU information
$StorageAccountName = "stotftec$(Get-Random)"
$SkuName = "Standard_LRS"

# Create a new storage account
$StorageAccount = New-AzStorageAccount `
  -Location $location `
  -ResourceGroupName $ResourceGroupName `
  -Type $SkuName `
  -Name $StorageAccountName

Set-AzCurrentStorageAccount `
  -StorageAccountName $storageAccountName `
  -ResourceGroupName $resourceGroupName
  


### CRIAR SUBNET ###
  # Create a subnet configuration
$subnetConfig = New-AzVirtualNetworkSubnetConfig `
  -Name sub-tftec-ps `
  -AddressPrefix 172.16.0.0/24



### CRIAR VNET ###
# Create a virtual network
$vnet = New-AzVirtualNetwork `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -Name vnet-tftec-ps `
  -AddressPrefix 172.16.0.0/16 `
  -Subnet $subnetConfig



### CRIAR IP PUBLICO ###
# Create a public IP address and specify a DNS name
$pip = New-AzPublicIpAddress `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -AllocationMethod Static `
  -IdleTimeoutInMinutes 4 `
  -Name "pipvm$(Get-Random)"



### CRIAR REGRAS NSG  ###
  # Create an inbound network security group rule for port 3389
$nsgRuleRDP = New-AzNetworkSecurityRuleConfig `
  -Name AllowRDP `
  -Protocol Tcp `
  -Direction Inbound `
  -Priority 1000 `
  -SourceAddressPrefix * `
  -SourcePortRange * `
  -DestinationAddressPrefix * `
  -DestinationPortRange 3389 `
  -Access Allow

# Create an inbound network security group rule for port 80
$nsgRuleWeb = New-AzNetworkSecurityRuleConfig `
  -Name AllowWWW `
  -Protocol Tcp `
  -Direction Inbound `
  -Priority 1001 `
  -SourceAddressPrefix * `
  -SourcePortRange * `
  -DestinationAddressPrefix * `
  -DestinationPortRange 80 `
  -Access Allow



### CRIAR REGRAS NSG  ###
# Create a network security group
$nsg = New-AzNetworkSecurityGroup `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -Name nsg-tftec-ps `
  -SecurityRules $nsgRuleRDP,$nsgRuleWeb


## CRIAR IP PUBLICO ##
  # Create a virtual network card and associate it with public IP address and NSG
$nic = New-AzNetworkInterface `
  -Name Nicvmps `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -SubnetId $vnet.Subnets[0].Id `
  -PublicIpAddressId $pip.Id `
  -NetworkSecurityGroupId $nsg.Id


### CRIAR A VM ###
  # Define a credential object to store the username and password for the VM
$UserName='azadmin'
$Password='Password@123'| ConvertTo-SecureString -Force -AsPlainText
$Credential=New-Object PSCredential($UserName,$Password)

# Create the VM configuration object
$VmName = "VM-PS"
$VmSize = "Standard_B2s"
$VirtualMachine = New-AzVMConfig `
  -VMName $VmName `
  -VMSize $VmSize

$VirtualMachine = Set-AzVMOperatingSystem `
  -VM $VirtualMachine `
  -Windows `
  -ComputerName "VM-PS" `
  -Credential $Credential -ProvisionVMAgent

$VirtualMachine = Set-AzVMSourceImage `
  -VM $VirtualMachine `
  -PublisherName "MicrosoftWindowsServer" `
  -Offer "WindowsServer" `
  -Skus "2022-Datacenter" `
  -Version "latest"

# Sets the operating system disk properties on a VM.
$VirtualMachine = Set-AzVMOSDisk `
  -VM $VirtualMachine `
  -CreateOption FromImage | `
  Set-AzVMBootDiagnostic -ResourceGroupName $ResourceGroupName `
  -StorageAccountName $StorageAccountName -Enable |`
  Add-AzVMNetworkInterface -Id $nic.Id


# Create the VM.
New-AzVM `
  -ResourceGroupName $ResourceGroupName `
  -Location $location `
  -VM $VirtualMachine

