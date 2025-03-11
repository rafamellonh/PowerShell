# Solicita o nome da VM
$vmName = Read-Host "Digite o nome da VM"

# Caminho do disco base (ajuste conforme necessário)
$baseVhdPath = "C:\VMS\WS2022\2022.vhdx"

# Caminho do novo disco de diferenciação
$diffVhdPath = "C:\VMS\$vmName\$vmName.vhdx"

# Caminho da pasta da VM
$vmPath = "C:\VMS\$vmName"

# Cria a pasta para a VM se não existir
if (!(Test-Path $vmPath)) {
    New-Item -ItemType Directory -Path $vmPath | Out-Null
}

# Cria o disco de diferenciação
New-VHD -Path $diffVhdPath -ParentPath $baseVhdPath -Differencing

# Cria a máquina virtual
New-VM -Name $vmName -MemoryStartupBytes 2GB -Generation 2 -Path $vmPath -SwitchName "Default Switch"

# Define o número de vCPUs
Set-VM -Name $vmName -ProcessorCount 2

# Define o disco de diferenciação na VM
Add-VMHardDiskDrive -VMName $vmName -Path $diffVhdPath

# Define o boot pelo disco
Set-VMFirmware -VMName $vmName -FirstBootDevice (Get-VMHardDiskDrive -VMName $vmName)

# Desativa os checkpoints automáticos
Set-VM -Name $vmName -AutomaticCheckpointsEnabled $false

# Inicia a VM
Start-VM -Name $vmName

Write-Host "VM $vmName criada e iniciada com sucesso!" -ForegroundColor Green
