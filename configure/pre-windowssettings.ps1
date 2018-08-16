# Disable screensaver
Write-Host "Disabling screensaver"
Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name ScreenSaveActive -Value 0 -Type DWord

# Disable hibernation
Write-Host "Disabling hibernation"
reg add HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateEnabled /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateFileSizePercent /t REG_DWORD /d 0 /f

# Disable monitor timeout
Write-Host "Disabling monitor timeout"
powercfg -change -monitor-timeout-ac 0
Write-Host "Setting Windows Explorer options"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0
