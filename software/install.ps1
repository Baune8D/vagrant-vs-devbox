# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).Path)\..\.."
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

choco feature enable -n=allowGlobalConfirmation

# ---- Windows Features ----
cinst IIS-WebServerRole --source windowsfeatures
cinst NetFx4Extended-ASPNET45 --source windowsfeatures
cinst IIS-NetFxExtensibility45 --source windowsfeatures
cinst IIS-ISAPIExtensions --source windowsfeatures
cinst IIS-ISAPIFilter --source windowsfeatures
cinst IIS-ASPNET45 --source windowsfeatures
cinst IIS-WebSockets --source windowsfeatures
cinst IIS-HttpCompressionDynamic --source windowsfeatures
cinst IIS-BasicAuthentication --source windowsfeatures
cinst IIS-WindowsAuthentication --source windowsfeatures

refreshenv

# ---- Web Platform Installer ----
cinst webpi
cinst UrlRewrite2 --source webpi
cinst ARRv3_0 --source webpi

# ---- Applications ----
cinst git
cinst python
cinst nodejs-lts
cinst yarn
cinst nuget.commandline
cinst 7zip
cinst firefox -packageParameters "l=en-US"
cinst googlechrome
cinst notepadplusplus
cinst vscode.install
cinst linqpad
cinst putty.install
cinst winscp
cinst redis-64
cinst ruby
cinst sql-server-management-studio
cinst dotnetcore-sdk
cinst dotnetcore-windowshosting
cinst dotnet-sdk
cinst dotnet-windowshosting

refreshenv

Write-Host "Installing Visual Studio. This may take a while..."
$exe = Get-ChildItem -Path C:\vagrant\software\vs_*.exe -File | Select-Object Name
Start-Process -FilePath "C:\vagrant\software\$($exe.Name)" -ArgumentList ('--wait','--passive','--norestart','--all') -Wait

# ---- ReSharper Ultimate ----
# Commercial
#cinst resharper
#cinst resharpercpp
#cinst dotcover
#cinst dottrace
#cinst dotmemory
# Free
cinst dotpeek

choco feature disable -n=allowGlobalConfirmation

refreshenv

# ---- Visual Studio Code Extensions ----
code --install-extension ms-dotnettools.csharp
code --install-extension editorconfig.editorconfig
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension stylelint.vscode-stylelint
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode.powershell
code --install-extension octref.vetur

# ---- Ruby Gems ----
gem install ultrahook
