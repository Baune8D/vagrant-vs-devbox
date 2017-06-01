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

choco feature disable -n=allowGlobalConfirmation