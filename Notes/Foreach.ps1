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
ForEach($arq in Get-ChildItem c:\Windows\System32 -File){
    if($arq.length -gt 1mb){$arq.Name}
}

#Pegar todos os arquivos de um formato e colocar em uma pasta com a data de criação
#seta a origem e destino
$path = "D:\teste"
Set-Location D:\Wallpaper
#Se não existir o destino, vai ser criado
if (!(Test-Path $path)) {
    New-Item -Path $path -ItemType Directory
}

# para cada item dentro de d:\wallpaper, copie para pasta da variavel $path (get-childitem só funciona pq foi setado a pasta antes com set-location)
foreach ($item in Get-ChildItem -Filter *.jpg -Recurse)  {
    Copy-Item $item.FullName $path
}