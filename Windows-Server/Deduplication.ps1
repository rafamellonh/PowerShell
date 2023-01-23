Get-DedupJob -Volume d:
Start-DedupJob -Type Optimization d:
Get-DedupStatus |fl

Start-DedupJob -Volume "D:" -Type Optimization -Memory 100
Start-DedupJob -Type GarbageCollection -Volume d:
