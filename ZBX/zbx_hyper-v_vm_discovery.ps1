$discovery = @()
$discovery = @("data")
#$discovery += New-Object -TypeName psobject -Property @{'{#JOBNAME}'="teste"}


foreach($job in Get-VM  ) 
    { 
        #$discovery += New-Object -TypeName psobject -Property @{'{#VMNAME}'=$job.name}
        $job.Name  ,$job.uptime.TotalMinutes
        
    }
#$discovery | ConvertTo-Json -Compress

#Exemplo com mais de 1 variavel
#$account += New-Object -TypeName psobject -Property @{User="Jimbo3"; Password="idontusepwds"}


