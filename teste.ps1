$numero = Read-Host "Digite um numero"
$result = $numero%2
if ($result -eq 0) {
     Write-Output "PAR"
}else {
    Write-Output "IMPAR"
}


Get-Command *var*

$erro = Get-EventLog -LogName 'Veeam Backup' | Where-Object {$_.Message -like "*is not synchronized with the DB*"} 

if ($erro -like "is not synchronized wi") {
    C:\Zabbix\scripts\RESCAN_HDEXTERNO.PS1
}
else {
    Write-Output "test"
}