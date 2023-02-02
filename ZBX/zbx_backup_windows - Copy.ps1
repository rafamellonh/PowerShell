$bkp = [string]$args[0]
$ITEM = [string]$args[1]

if($bkp -eq "Windows"){

    $backup = Get-WBJob -Previous 1; 
     if (-not $backup.ErrorDescription ){
            $status='Sucesso'
        }else{
            $status='Erro'
        }

    if ($ITEM -eq "BkpStatus"){
        Write-Host $status
    }elseif ($ITEM -eq "BkpDuracao"){
        $total = New-TimeSpan –Start $backup.StartTime –End $backup.EndTime; 
        Write-Host (New-TimeSpan -Minutes $total.TotalMinutes).ToString()
    }elseif ($ITEM -eq "BkpErro"){
        if (-not $backup.ErrorDescription ){
            $backup.ErrorDescription
        }
       Write-Host "Sem Erros"
    }
}elseif ($bkp -eq "azure" ){
    
    if ($ITEM -eq "BkpStatus"){
        $BackupStatus = Get-ObJob -previous 1 | Select -expand JobStatus
        $BackupStatus.JobState
    }elseif ($ITEM -eq "BkpDuracao"){
        $summaryLastBackupStatus = Get-ObJob -previous 1 
        $inicio = $summaryLastBackupStatus.JobStatus.StartTime
        $fim = $summaryLastBackupStatus.JobStatus.EndTime

        $totalazure = New-TimeSpan –Start $inicio –End $fim; 
        Write-Host (New-TimeSpan -Minutes $totalazure.TotalMinutes).ToString()
    }elseif ($ITEM -eq "BkpEspaco"){
        
        $espacoazure = Get-OBMachineUsage | Select-Object -Property StorageUsedByMachineInBytes | ConvertTo-Json | ConvertFrom-Json
        $espacoazure.StorageUsedByMachineInBytes
        # Write-Host $total
    }
}