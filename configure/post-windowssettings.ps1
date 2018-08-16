Write-Host "Disable Windows Defender"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f

Write-Host "Adding firewall rules"
netsh advfirewall firewall add rule name="Conveyor" dir=in action=allow protocol=TCP localport=45455-45470

Write-Host "Applying dark Windows theme"
regedit /s C:\vagrant\configure\dark-theme.reg

Write-Host "Prepare Boxstarter scripts"
New-Item ~\boxstarter -Type Directory
Copy-Item C:\vagrant\configure\boxstarter-*.txt -Destination ~\boxstarter\

Install-BoxstarterPackage -PackageName ~\boxstarter\boxstarter-windowssettings.txt -DisableReboots