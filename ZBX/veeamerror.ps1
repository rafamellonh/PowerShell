#Get-EventLog -LogName 'Veeam Backup' | Where-Object {$_.Message -like "*failed*"}

$erro = @(Get-EventLog -LogName 'Veeam Backup' | Where-Object {$_.Message -like "*is not synchronized with the DB*"} )
$erro[0..3].Message
