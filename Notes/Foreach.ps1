$matriz =  1..10

#sintaxe basica
foreach ($item in $matriz) {
    $item * $item
}

#Listando cores do console
# a clas [Enum] junto com o METODO ::GetValues enumera todos os valores que tem dentro de alguma coisa
#Aqui ele lista todas as cores dentro da clase [ConsoleColor]
foreach ($cor in [Enum]::GetValues([System.ConsoleColor])){Write-Host "      " -BackgroundColor $cor}

#Mostar o nome de todos os arquivos na pasta que tem mais de 1mb
foreach ($arq in Get-ChildItem C:\Windows\System32 -File) {
    if ($arq.lenght -gt 1mb) {$arq.name}
}
