
# Forma simples
$user = Get-ADUser -filter { name -like "*gaz*"}
$name = $user.SamAccountName
$name
$mypassword = ConvertTo-SecureString -AsPlainText -Force -String "ale@one#123"
Set-ADAccountPassword  -Identity $name -Reset -NewPassword  $mypassword

# Solicita as credenciais
$mycredentials = Get-Credential

#alterar a senha de uma conta de user do AD
$myusername = $mycredentials.UserName
$mypassword = $mycredentials.Password
Set-ADAccountPassword -Identity $myusername -Reset -NewPassword $mypassword



# Ou solicite o nome de usuário e senha pelo prompts
$myusername = Read-Host -Prompt "username"
$mypassword = Read-Host -Prompt "password" -AsSecureString
Set-ADAccountPassword -Identity $myusername -Reset -NewPassword $mypassword


# Altere a senha usando uma senha de texto simples.
$mypassword = ConvertTo-SecureString -AsPlainText -Force -String "ale@one#123"
Set-ADAccountPassword -Identity rafa.mello -Reset -NewPassword $mypassword
