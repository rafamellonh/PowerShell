$numero = Read-Host "Digite um numero"
$result = $numero%2
if ($result -eq 0) {
     Write-Output "PAR"
}else {
    Write-Output "IMPAR"
}
