# Maximum number of attempts
$maxTries = 3

# Initialize the attempt counter
$tryCount = 0



# Loop to try up to the maximum number of times
while ($tryCount -lt $maxTries) {
    $tryCount++

# Execute the WinSCP commandP
& "C:\Users\rafael.demello\AppData\Local\Programs\WinSCP\WinSCP.com" `
  /log="C:\files\logs\WinSCP.log" /ini=nul `
  /command `
    "open sftp://sftp:abc%2C123@dbei7nift3jko.azurecontainer.io/ -hostkey=`"`"ssh-ed25519 255 bR2VgdfgdfgdgL7zZMfB1kMLrSnaFxGrPZqLOhkkEgg`"`"" `
    "put -nopreservetime ""C:\files\temp*"" /upload/01/" `
    "exit"

# Get the result from WinSCP
$winscpResult = $LastExitCode

# Get weekDay
$DayOfWeek = (Get-Date).DayOfWeek


# Checks whether the operation was successful
    if ($winscpResult -eq 0) {
        Add-Content -Path "C:\files\logs\TransferToHQ-Result.txt" -Value "$DayOfWeek $((Get-Date).ToString()) Success"
        & "C:\files\scripts\SendEmail-v2.ps1"
        break  # Exit the loop if successful

    } else {
        Add-Content -Path "C:\files\logs\TransferToHQ-Result.txt" -Value "$DayOfWeek $((Get-Date).ToString()) Error"
        Start-Sleep -Seconds 5  # Wait 5 seconds before trying again
    }
}

if ($winscpResult -ne 0) {
    Write-Host "Número máximo de tentativas atingido. Falha na execução."
    & "C:\files\scripts\SendEmail-v2.ps1"
}

# Exit with WinSCP exit code
#exit $winscpResult




