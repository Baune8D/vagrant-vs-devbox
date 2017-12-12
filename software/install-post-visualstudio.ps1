choco feature enable -n=allowGlobalConfirmation

cinst sql-server-management-studio
cinst dotnetcore-windowshosting

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