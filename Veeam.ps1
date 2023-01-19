# Captura os backups de 2023 e com status failed
# $erro = get-VBRBackupSession | Where-Object {$_.EndTime -like "*2023*"} | Where-Object {$_.Result -eq "Failed"}

