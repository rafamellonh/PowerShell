Get-DedupJob -Volume d:
Start-DedupJob -Type Optimization d:
Get-DedupStatus |fl

#inicia o processo com 100% da memória
Start-DedupJob -Volume "D:" -Type Optimization -Memory 100

#faz a limpeza de blocos não mais utilizados, liberando espaço no disco
Start-DedupJob -Type GarbageCollection -Volume d:
