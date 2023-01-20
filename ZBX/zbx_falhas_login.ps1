$variavel  = [string]$args[0]


 if($variavel -eq "QtdTentaivas"){
    $result = Get-EventLog -LogName "Security" -InstanceId 4625 -After ((Get-Date).AddDays(-1))
    Write-Host  $result.Count
 } elseif ($variavel -eq "Tentativas" ){
    $result = Get-EventLog -LogName "Security" -InstanceId 4625 -After ((Get-Date).AddDays(-1)) | Select-Object @{Name = "Usuario"; e={$_.ReplacementStrings[5]}},
                                                                                       @{Name = "IP Origem"; e={$_.ReplacementStrings[19]}},
                                                                                       @{Name = "Horario"; e={$_.TimeGenerated}}
    $result
 }


#$list = ConvertTo-Json @{"data" = [array]$result} -Compress
# -After ((Get-Date).AddDays(-1)) - dia anterior
# -Newest 1 -  ultimo valor