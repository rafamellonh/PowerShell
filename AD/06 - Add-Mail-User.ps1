Import-Module ActiveDirectory
$USERS = Get-ADUser -Filter *
foreach ($USER in $USERS)
{
   $EMAIL = $USER.SamAccountName + '@domainname.com'
   Set-ADUser $USER -UserPrincipalName $EMAIL -EmailAddress $EMAIL -Add @{proxyAddresses = ("SMTP:" + $EMAIL)}
}