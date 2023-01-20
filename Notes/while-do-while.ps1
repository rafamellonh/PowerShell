$numero = 1

while ($numero -le 10) {
    Write-Host $numero; $numero++
}


# do-while primeiro executa e depois verifica, diferente do while


do {
    $n1 = [float](Read-Host "nota 1")
    $n2 = [float](Read-Host "nota 2")    
    $media = ($n1+$n2)/2

    write-host "A média do aluno é " $media
} while 
(
    ($n1 -ne 0 -and $n2 -ne 0)
)