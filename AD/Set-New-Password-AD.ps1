#alterar a senha de uma conde de user do AD
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
