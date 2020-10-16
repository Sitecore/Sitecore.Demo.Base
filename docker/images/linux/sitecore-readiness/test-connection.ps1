Write-Host "check readiness $env:host on port $env:port"
do { Start-Sleep -Seconds 2 } until ($(try { (Test-Connection -TcpPort $env:port $env:host) -eq $True } catch { $false }))