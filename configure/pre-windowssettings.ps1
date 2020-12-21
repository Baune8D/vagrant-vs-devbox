Write-Host "Disabling hibernation"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name HibernateFileSizePercent -Value 0 -Type DWord
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name HibernateEnabled -Value 0 -Type DWord

Write-Host "Disabling screensaver"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name ScreenSaveActive -Value 0 -Type DWord

Write-Host "Disabling monitor timeout"
& powercfg -x -monitor-timeout-ac 0
& powercfg -x -monitor-timeout-dc 0

Write-Host "Disabling Windows Defender"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -Type DWord

Write-Host "Setting Windows Explorer options"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0 -Type DWord
