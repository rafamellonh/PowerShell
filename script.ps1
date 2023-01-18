$nome = Read-Host "Como se chama?"
$preco = 4.99
#write-host "Seja Bem vindo" $nome

Write-Host $nome.GetType().Name
Write-Host $preco.GetType().Name

[float]$temp = 4.99
Write-Host $temp.GetType().Name

$festa = [datetime]"3/11/2020"
Write-Host $festa
Write-Host $festa.GetType().Name

01