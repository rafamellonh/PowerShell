Get-Service | where Status -eq "Stopped" | Export-Csv -Path D:\temp\Services.csv

#Seleciona somente o que você quer com | Select-Object
Get-Service | where Status -eq "Stopped" | Select-Object -Property Name, DisplayName, Status | Export-Csv -Path D:\temp\Services.csv

# para abrir no notepad
notepad.exe D:\temp\Services.csv