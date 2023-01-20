Add-PSSnapin VeeamPSSnapin
Get-VBRBackupRepository -Name "HD-EXTERNO-HV01" | Sync-VBRBackupRepository > "C:\Supportti\Script\return_rescan.txt"
Get-VBRBackupRepository -Name "HD-EXTERNO-HV02" | Sync-VBRBackupRepository >> "C:\Supportti\Script\return_rescan.txt"

