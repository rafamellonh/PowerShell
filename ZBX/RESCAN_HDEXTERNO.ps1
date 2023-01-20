#sincroniza repositório do veeam sem precisar definir nomes
Add-PSSnapin VeeamPSSnapin
$bkprepository = @(Get-VBRBackupRepository)
$bkprepository[0..5]
Sync-VBRBackupRepository -Repository $bkprepository[0..5]