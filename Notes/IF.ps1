if (1 -lt 10){
    " 1 é menor que 10"
}else {
    "1 não é menor que 10"
}

$numero = Read-Host "Valor" 

if (2 -lt $numero) {
    "2 é menor que " + $numero
}

if (2 -gt $numero) {
    "2 é maior que " + $numero
}



$numero = Read-Host "Valor" 
if (2 -eq $numero) {
    "2 é igual a " + $numero
}
elseif (2 -lt $numero) {
    "2 é menor que " + $numero
}
elseif(2 -gt $numero) {
    "2 é maior que " + $numero
}
else {
    "Esse valor é incorreto"
}