# Maximum number of attempts
$maxTries = 5

# Initialize the attempt counter
$tryCount = 0



# Loop to try up to the maximum number of times
while ($tryCount -lt $maxTries) {
    $tryCount++

# Execute the WinSCP commandP
& "C:\Users\rafael.demello\AppData\Local\Programs\WinSCP\WinSCP.com" `
  /log="C:\files\logs\WinSCP.log" /ini=nul `
  /command `
  "open sftp://sftp:abc%2C123@dbei7nift3jko.canadaeast.azurecontainer.io/ -hostkey=`"`"ssh-ed25519 255 2lGodF/0wSHrSuVlMaM19otNNuMcvOFlksNhqJ5PoJc`"`"" `
  "put -nopreservetime ""C:\files\temp"" /upload/01/" `
    "exit"

# Get the result from WinSCP
$winscpResult = $LastExitCode

# Get weekDay
#$DayOfWeek = (Get-Date).DayOfWeek
$date = Get-Date -Format "dddd yyyy/MM/dd HH:mm"

# Checks whether the operation was successful
    if ($winscpResult -eq 0) {
        #Add-Content -Path "C:\files\logs\TransferToHQ-Result.txt" -Value "$DayOfWeek $((Get-Date).ToString()) Success"
        Add-Content -Path "C:\files\logs\TransferToHQ-Result.txt" -Value "$date Success"
        Add-Content -Path "C:\files\logs\tryCount.txt" -Value "Number of attempts : $tryCount"
        & "C:\files\scripts\SendEmail-v2.ps1"
        break  # Exit the loop if successful

    } else {
        #Add-Content -Path "C:\files\logs\TransferToHQ-Result.txt" -Value "$DayOfWeek $((Get-Date).ToString()) Error"
        Add-Content -Path "C:\files\logs\TransferToHQ-Result.txt" -Value "$date Error"
        Start-Sleep -Seconds 5  # Wait 5 seconds before trying again
    }
}

if ($winscpResult -ne 0) {
    Add-Content -Path "C:\files\logs\tryCount.txt" -Value "Number of attempts : $tryCount"
    & "C:\files\scripts\SendEmail-v2.ps1"
}

# Exit with WinSCP exit code
#exit $winscpResult

Write-Host $tryCount


