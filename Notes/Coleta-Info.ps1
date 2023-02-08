# obtem alguns contadores de desempenho do sistema
Get-Counter
Get-Counter -ListSet *memory*

<# irá pegar somente o que tem no countersetname Memory, dentro das propriedades tem uma paths que é uma array e pode ser exibida com 
    | Select-Object -ExpandProperty paths
#> 
Get-Counter -ListSet *memory* | Where-Object  countersetname -eq "memory" 

Get-Counter -ListSet *memory* | Where-Object  countersetname -eq "memory" | Select-Object -ExpandProperty paths


Get-Counter -ListSet *memory* | Where-Object  countersetname -eq "GPU Process Memory" | Select-Object -ExpandProperty paths

#Obtem todas as classes do sistema
Get-CimClass
Get-CimClass -ClassName *memory*  # somente classes da memória

#Obtem com o GetwmiObject
Get-WmiObject -Class Win32_PhysicalMemory | Select-Object -Property BankLabel,Capacity
Get-WmiObject -Class Win32_LogicalDisk
Get-WmiObject -Class win32_bios

# Pode ser utilizado também o get-ciminstance que o resultado será o mesmo
Get-CimInstance -ClassName win32_bios

# Eventlog
Get-EventLog -log Application -Source outlook | Where-Object  {$_.eventid -eq 34}
Get-EventLog -logname system -Newest 100 | Where-Object -Object EventID -eq "1074"
Get-EventLog -logname system -Newest 100 | Where-Object -Object EventID -eq "1074" | Select-Object -ExcludeProperty Message  # expande a mensagem


######## coleta de informações de rede
Get-NetIPAddress 
get-netiPConfiguration
Test-NetConnection 8.8.8.8
Test-NetConnection 8.8.8.8 -TraceRoute


# Trabalhando com registros
Get-PSProvider 
Set-Location -Path HKLM:    
# https://learn.microsoft.com/pt-br/powershell/scripting/samples/working-with-registry-entries?view=powershell-7.3

# Trabalhando arquivos e impressoras
help Get-ChildItem
help Get-ChildItem -Examples
Get-ChildItem -Path d: -Include *.png -Recurse
Get-ChildItem -Path d: -Include *.png -Recurse | Copy-Item -Destination e:\tmp
new-item -Type Directory -Path d:\ -name "temp"


Get-Printer -ComputerName srv01
add-printer -ConnectionName "\\srv01\printer01"


