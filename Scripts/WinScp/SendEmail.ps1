
#This is a simple script to send email with @outlook.com and password encryption with Export-Clixml
#To generate the xml file with the password, execute the command :
#   Get-Credential | Export-Clixml -Path "C:\files\scripts\CredenciaisCriptografadas.xml"   (run this before running the script)
# Configure your data in email configurations 


# file address
$file = "C:\files\logs\TransferToHQ-Result.txt"

# Gets the last 3 lines of the file
$lastlines = Get-Content -Path $file | Select-Object -Last 10

# your data
$data = $lastlines

#convert the $data on objects with $objects customized to facilitate handling
$objects = $data | ForEach-Object {
    $parts = $_ -split '\s+'
    [PSCustomObject]@{
        'Day'      = $parts[0]
        'Date'     = $parts[1]
        'Time'     = $parts[2]
        'Status'   = $parts[3]
    }
}

# Build a border-formatted table in HTML
$tableHtml = $objects | ConvertTo-Html -Property Day, Date, Time, Status -Fragment -PreContent '<style>table { border-collapse: collapse; } th, td { border: 1px solid black; padding: 8px; }</style>' | Out-String

# Configurations of the e-mail
$smtpCredential = Import-Clixml -Path "C:\files\scripts\CredenciaisCriptografadas.xml"
$smtpServer = "smtp-mail.outlook.com"
$smtpFrom = "rafacaaz01@outlook.com"
$smtpTo = "rafael.demello@cgi.com"
$messageSubject = "DUC - MWSAG-FileTransferToHQ"
$messageBody = "`r`n`r`nLast 10 tasks:`r`n$tableHtml"


# Setting parameters for email
$mailParams = @{
    SmtpServer = $smtpServer
    Port = 587
    UseSsl = $true
    Credential = $smtpCredential
    From = $smtpFrom
    To = $smtpTo
    Subject = $messageSubject
    Body = $messageBody
    BodyAsHtml = $true  # Indica que o corpo do e-mail contém HTML
}

# send the e-mail
Send-MailMessage @mailParams


