choco feature enable -n=allowGlobalConfirmation

# ---- Web Platform Installer ----
cinst webpi
cinst UrlRewrite2 --source webpi
cinst ARRv3_0 --source webpi

# ---- Applications ----
cinst git
cinst python2
cinst nodejs
cinst nuget.commandline
cinst 7zip
cinst p4merge
cinst firefox -packageParameters "l=en-US"
cinst googlechrome
cinst notepadplusplus
cinst visualstudiocode
cinst linqpad
cinst fiddler4
cinst putty.install
cinst winscp
cinst sourcetree
cinst redis-64
cinst ruby

choco feature disable -n=allowGlobalConfirmation