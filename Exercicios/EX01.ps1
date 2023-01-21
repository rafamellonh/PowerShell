$nome = Read-Host "Digite seu nome"
$senha = Read-Host "Digite sua senha"

$dados = @"
    Seu nome e : $nome
    Sua senha e : $senha
"@

Write-Host $dados