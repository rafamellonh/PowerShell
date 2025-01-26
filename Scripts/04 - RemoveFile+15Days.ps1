$location = Set-Location C:\nddCargo\Agente\log
$item = Get-ChildItem -Path C:\nddCargo\Agente\log
$DateNow = get-date
$DateDel = $DateNow.Day - 15


if ($item.CreationTime.day -ge $DateDel) { Remove-Item $item}


