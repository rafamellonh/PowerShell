# Captura os backups de 2023 e com status failed
# $erro = get-VBRBackupSession | Where-Object {$_.EndTime -like "*2023*"} | Where-Object {$_.Result -eq "Failed"}

# Captura os erros de backup do veeam e joga para uma array 
$erro = @(Get-EventLog -LogName 'Veeam Backup' | Where-Object {$_.Message -like "*is not synchronized with the DB*"} )
$erro[0].Message


#sincroniza repositório do veeam sem precisar definir nomes
Add-PSSnapin VeeamPSSnapin
$bkprepository = @(Get-VBRBackupRepository)
$bkprepository[0..5]
Sync-VBRBackupRepository -Repository $bkprepository[0..5]