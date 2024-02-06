
# Caminho do arquivo
$arquivo = "C:\Users\rafael\test.txt"

# Obtém as últimas 3 linhas do arquivo
$ultimasLinhas = Get-Content -Path $arquivo | Select-Object -Last 3

# Exibe as últimas 3 linhas
#$ultimasLinhas





# Configurações de e-mail
$smtpServer = "smtp-mail.outlook.com"
$smtpFrom = "rafa@outlook.com"
$smtpTo = "rafa@gmail.com"
$messageSubject = "Assunto do e-mail"
$messageBody = "Corpo do e-mail" + "`r`n" + "`r`n" + "Últimas 3 linhas do arquivo:`r`n$($ultimasLinhas -join "`r`n")"


# Credenciais do remetente
$smtpCredential = Get-Credential -Credential $smtpFrom

# Configuração de parâmetros para o e-mail
$mailParams = @{
    SmtpServer = $smtpServer
    Port = 587
    UseSsl = $true
    Credential = $smtpCredential
    From = $smtpFrom
    To = $smtpTo
    Subject = $messageSubject
    Body = $messageBody
}

# Envia o e-mail
Send-MailMessage @mailParams
