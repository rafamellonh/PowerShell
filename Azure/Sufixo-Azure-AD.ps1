import-module activedirectory

#Old domain suffix
$oldSuffix = "mello.com.br"

#New domain suffix
$newSuffix = "rafamelloaz86outlook.onmicrosoft.com"

#Specify the OU this script will target
$ou = “OU=Departamentos,DC=tfteccompany,DC=com,DC=br”

#Specify a writeable domain controller
$server = “VM-DC-PRD”

Get-ADUser -SearchBase $ou -filter * | ForEach-Object {
$newUpn = $_.UserPrincipalName.Replace($oldSuffix,$newSuffix)
$_ | Set-ADUser -server $server -UserPrincipalName $newUpn}
