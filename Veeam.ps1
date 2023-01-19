# Captura os backups de 2023 e com status failed

$erro = get-VBRBackupSession | Where {$_.EndTime -like "*2023*"} | Where {$_.Result -eq "Failed"}

