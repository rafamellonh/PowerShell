function Test-TlsVersion {
    param (
        [string]$ComputerName = "localhost"
    )
    try {
        # Test TLS 1.0
        $tls10 = [System.Net.ServicePointManager]::SecurityProtocol -band [System.Net.SecurityProtocolType]::Tls10
        # Test TLS 1.1
        $tls11 = [System.Net.ServicePointManager]::SecurityProtocol -band [System.Net.SecurityProtocolType]::Tls11
        # Test TLS 1.2
        $tls12 = [System.Net.ServicePointManager]::SecurityProtocol -band [System.Net.SecurityProtocolType]::Tls12
        # Test TLS 1.3 (apenas para Windows Server 2022 e posterior)
        $tls13 = [System.Net.ServicePointManager]::SecurityProtocol -band [System.Net.SecurityProtocolType]::Tls13

        Write-Host "TLS 1.0 Enabled: $($tls10 -ne 0)" -ForegroundColor Green
        Write-Host "TLS 1.1 Enabled: $($tls11 -ne 0)" -ForegroundColor Green
        Write-Host "TLS 1.2 Enabled: $($tls12 -ne 0)" -ForegroundColor Green
        Write-Host "TLS 1.3 Enabled: $($tls13 -ne 0)" -ForegroundColor Green
    }
    catch {
        Write-Host "Error: $_" -ForegroundColor Red
    }
}

# Verificar versões TLS na máquina local
Test-TlsVersion
