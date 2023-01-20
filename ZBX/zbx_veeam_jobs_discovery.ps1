Add-PSSnapin VeeamPSSnapin

$discovery = @()
$discovery = @("data")
#$discovery += New-Object -TypeName psobject -Property @{'{#JOBNAME}'="teste"}

foreach($job in Get-VBRJob) 
    { 
        $discovery += New-Object -TypeName psobject -Property @{'{#JOBNAME}'=$job.name}
    }
$discovery | ConvertTo-Json -Compress

#Exemplo com mais de 1 variavel
#$account += New-Object -TypeName psobject -Property @{User="Jimbo3"; Password="idontusepwds"}