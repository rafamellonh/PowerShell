# obtem alguns contadores de desempenho do sistema
Get-Counter
Get-Counter -ListSet *memory*

<# irá pegar somente o que tem no countersetname Memory, dentro das propriedades tem uma paths que é uma array e pode ser exibida com 
    | select -ExpandProperty paths
#> 
Get-Counter -ListSet *memory* | where countersetname -eq "memory" 

Get-Counter -ListSet *memory* | where countersetname -eq "memory" | select -ExpandProperty paths


Get-Counter -ListSet *memory* | where countersetname -eq "GPU Process Memory" | select -ExpandProperty paths