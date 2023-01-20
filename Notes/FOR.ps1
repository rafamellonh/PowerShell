#  Estrutura do FOR
#
#    for (<inicialização>; <decisão>; <incremento> ){<codigo>}

for ($i = 10; $i -gt 0; $i--) {
    Write-Host $i
}

# FOR para processar uma coleção
# Vamos somar tota quantidade de memória ram usada


$processos = Get-Process | Select-Object WS
$soma = 0
$total = 0

for ($i = 0; $i -lt $processos.lenght) {
    $soma += $processos[$i].WS
}

$total = $soma / 1mb