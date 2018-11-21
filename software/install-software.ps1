choco feature enable -n=allowGlobalConfirmation

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
cinst visualstudiocode
cinst linqpad
cinst putty.install
cinst winscp
cinst sourcetree
cinst redis-64
cinst postman
cinst ruby
cinst sql-server-management-studio
cinst dotnetcore-sdk
cinst dotnetcore-windowshosting

choco feature disable -n=allowGlobalConfirmation