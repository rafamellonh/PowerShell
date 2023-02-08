# obtem alguns contadores de desempenho do sistema
Get-Counter
Get-Counter -ListSet *memory*

<# irá pegar somente o que tem no countersetname Memory, dentro das propriedades tem uma paths que é uma array e pode ser exibida com 
    | select -ExpandProperty paths
#> 
Get-Counter -ListSet *memory* | where countersetname -eq "memory" 

Get-Counter -ListSet *memory* | where countersetname -eq "memory" | select -ExpandProperty paths


Get-Counter -ListSet *memory* | where countersetname -eq "GPU Process Memory" | select -ExpandProperty paths

#Obtem todas as classes do sistema
Get-CimClass
Get-CimClass -ClassName *memory*  # somente classes da memória

#Obtem com o GetwmiObject
Get-WmiObject -Class Win32_PhysicalMemory | select -Property BankLabel,Capacity
Get-WmiObject -Class Win32_LogicalDisk
Get-WmiObject -Class win32_bios

# Pode ser utilizado também o get-ciminstance que o resultado será o mesmo
Get-CimInstance -ClassName win32_bios

# Eventlog
Get-EventLog -log Application -Source outlook | where {$_.eventid -eq 34}
Get-EventLog -logname system -Newest 100 | Where-Object EventID -eq "1074"
Get-EventLog -logname system -Newest 100 | Where-Object EventID -eq "1074" | Select-Object -ExcludeProperty Message  # expande a mensagem


######## coleta de informações de rede