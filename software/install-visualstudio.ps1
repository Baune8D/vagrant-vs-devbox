Write-Host "Installing Visual Studio 2017. This may take a while..."
$exe = Get-ChildItem -Path C:\vagrant\software\vs_*.exe -File | Select-Object Name
Start-Process -FilePath "C:\vagrant\software\$($exe.Name)" -ArgumentList ('--wait','--passive','--norestart','--all') -Wait