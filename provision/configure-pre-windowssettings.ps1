# Set power plan to high performance.
Write-Host "Setting power plan to high performance"
Try {
  $HighPerf = powercfg -l | ForEach-Object{if($_.contains("High performance")) {$_.split()[3]}}
  $CurrPlan = $(powercfg -getactivescheme).split()[3]
  if ($CurrPlan -ne $HighPerf) {powercfg -setactive $HighPerf}
} Catch {
  Write-Warning -Message "Unable to set power plan to high performance"
}

# Disable screensaver
Write-Host "Disabling Screensaver"
Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name ScreenSaveActive -Value 0 -Type DWord

# Disable hibernation
Write-Host "Disabling Hibernation"
reg add HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateEnabled /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateFileSizePercent /t REG_DWORD /d 0 /f

# Disable monitor timeout
Write-Host "Disabling monitor timeout"
powercfg -change -monitor-timeout-ac 0

# Disable disk timeout
Write-Host "Disabling disk timeout"
powercfg -change -disk-timeout-ac 0

# Run Boxstarter package
New-Item ~\boxstarter -Type Directory
Copy-Item C:\vagrant\provision\*.txt -Destination ~\boxstarter\
Install-BoxstarterPackage -PackageName ~\boxstarter\boxstarter-pre-windowssettings.txt -DisableReboots
