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

Write-Host (5+6)
$soma = 5 + 6
Write-Host $soma

# Aqui ele vai trocar todas os campos que tem mello para confidencial
(Get-Content .\teste.txt) -replace "(mello)", "Confidencial"

$array = @(1,2,3,4,5)

foreach ($item in $array)
{
    Write-Output $item    
}
Write-Output $array[3]