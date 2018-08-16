Write-Host "Install PSWindowsUpdate script"
Install-PackageProvider -Name NuGet -Force
Install-Module -Name PSWindowsUpdate -Force

Write-Host "Enabling Microsoft updates"
Add-WUServiceManager -ServiceID "7971f918-a847-4430-9279-4a52d1efe18d" -AddServiceFlag 7 -Confirm:$false

Write-Host "Installing Windows updates"
Get-WUInstall -AutoReboot -AcceptAll