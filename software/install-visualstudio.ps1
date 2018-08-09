Write-Host "Installing Visual Studio 2017. This may take a while..."
$exe = Get-ChildItem vs_*.exe | Select-Object Name
Start-Process -FilePath "C:\vagrant\software\$($exe.Name)" -ArgumentList ('--wait','--passive','--norestart','--all') -Wait