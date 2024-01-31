Script para alterar sufixo dos usuÃ¡rios do AD:

import-module activedirectory

#Old domain suffix
$oldSuffix = "tfteccompany.com.br"

#New domain suffix
$newSuffix = "tfteccompany.onmicrosoft.com"

#Specify the OU this script will target
$ou = â€œOU=Departamentos,DC=tfteccompany,DC=com,DC=brâ€

#Specify a writeable domain controller
$server = â€œVM-DC-PRDâ€

Get-ADUser -SearchBase $ou -filter * | ForEach-Object {
$newUpn = $_.UserPrincipalName.Replace($oldSuffix,$newSuffix)
$_ | Set-ADUser -server $server -UserPrincipalName $newUpn
}
