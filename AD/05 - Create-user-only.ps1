$user = Get-ADUser -Filter {name -like "*estoque*"}
Set-ADAccountPassword -Identity $user -NewPassword (ConvertTo-SecureString -AsPlainText "2411asd" -Force)


#Segunda opção
# solicite os dados do usuário
$MyCredentials = Get-Credential

#Alterando a senha do usuário
$MyUsername = $MyCredentials.UserName
$MyPassowrd = $MyPassowrd
Set-ADAccountPassword -Identity $MyUsername -reset -NewPassword $MyPassowrd

#Opcionalmente solicite um nome de usuário e uma senha usando linha de comando
$MyUsername = Read-Host -Prompt "username"
$MyPassowrd = Read-Host -Prompt "password" -AsSecureString
$MyPassowrd = ConvertTo-SecureString -AsPlainText -Force -String "abc,123"
Set-ADAccountPassword -Identity $MyUsername -reset -NewPassword $MyPassowrd


