$user = "rafa.mello"
$senha = "abc,123"

$login = Read-Host "Digite seu usuário"
$pass = Read-Host "Digite sua senha"

if ($user -eq $login) {
    if ($senha -eq $pass) {
     Write-Host "Seja bem vindo $user"   
    }
}else {
    Write-Host "LOGIN INCORRETO"
    Write-Host "Sistema de login"
    Write-Host "- - - - - - - -"
    Write-Host "Usuario : $login"
    Write-Host "Senha : $pass"
}