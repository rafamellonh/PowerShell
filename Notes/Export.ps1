Get-Service | where Status -eq "Stopped" | Export-Csv -Path D:\temp\Services.csv

#Seleciona somente o que você quer com | Select-Object
Get-Service | where Status -eq "Stopped" | Select-Object -Property Name, DisplayName, Status | Export-Csv -Path D:\temp\Services.csv

# para abrir no notepad
notepad.exe D:\temp\Services.csv

#Da um get em um computador removo
get-service -name "*team*" -ComputerName SRV01 | Export-Csv -Path D:\temp\Services.csv

#exporta o resultado para um TXT
get-history | Out-File -FilePath d:\temp\history.txt