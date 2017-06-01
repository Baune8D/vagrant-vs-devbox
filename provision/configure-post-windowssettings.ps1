New-Item ~\.ssh -Type Directory
Copy-Item C:\vagrant\ssh\bashrc -Destination ~\.bashrc

Install-BoxstarterPackage -PackageName ~\boxstarter\boxstarter-post-windowssettings.txt -DisableReboots

# Cleanup
Remove-Item ~\boxstarter -Recurse -Force
Remove-Item C:\tmp -Recurse -Force
