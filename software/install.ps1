# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
& ([scriptblock]::Create((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')))

$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).Path)\..\.."
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

choco feature enable -n=allowGlobalConfirmation

# ---- Windows Features ----
Enable-WindowsOptionalFeature -Online -All -NoRestart -FeatureName @(
  'IIS-WebServerRole',
  'NetFx4Extended-ASPNET45',
  'IIS-NetFxExtensibility45',
  'IIS-ISAPIExtensions',
  'IIS-ISAPIFilter',
  'IIS-ASPNET45',
  'IIS-WebSockets',
  'IIS-HttpCompressionDynamic',
  'IIS-BasicAuthentication',
  'IIS-WindowsAuthentication'
) | Out-Null

refreshenv

# ---- IIS Extensions ----
choco install urlrewrite
choco install iis-arr

# ---- Applications ----
choco install git
choco install python
choco install nodejs-lts
choco install yarn
choco install nuget.commandline
choco install 7zip
choco install firefox --params "/l:en-US"
choco install googlechrome
choco install notepadplusplus
choco install vscode.install
choco install linqpad
choco install putty.install
choco install winscp
choco install redis
choco install ruby
choco install sql-server-management-studio
choco install dotnet-sdk
choco install dotnet-windowshosting

refreshenv

$installer = Get-ChildItem -Path C:\vagrant\software\vs_*.exe -File | Select-Object -First 1
if ($installer) {
  Write-Output "Installing Visual Studio with $($installer.Name). This may take a while..."
  Start-Process -FilePath $installer.FullName -ArgumentList ('--wait', '--passive', '--norestart', '--all') -Wait
}
else {
  Write-Warning "No Visual Studio installer (vs_*.exe) in the software folder, skipping Visual Studio"
}

# ---- ReSharper Ultimate ----
# Commercial
#choco install resharper
#choco install resharpercpp
#choco install dotcover
#choco install dottrace
#choco install dotmemory
# Free
choco install dotpeek

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
code --install-extension vue.volar

# ---- Ruby Gems ----
gem install ultrahook
