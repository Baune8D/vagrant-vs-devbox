Write-Host "Adding firewall rules"
netsh advfirewall firewall add rule name="Conveyor" dir=in action=allow protocol=TCP localport=45455

New-Item ~\.ssh -Type Directory
Copy-Item C:\vagrant\ssh\bashrc -Destination ~\.bashrc

Install-BoxstarterPackage -PackageName ~\boxstarter\boxstarter-post-windowssettings.txt -DisableReboots

Write-Host "Cleaning up"
Remove-Item ~\boxstarter -Recurse -Force
Remove-Item C:\tmp -Recurse -Force
