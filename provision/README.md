# Provision scripts for Windows 10

**See bottom for other recommended software.**

### **Visual Studio**
Visual Studio 2017 Community is installed with all available features.

### **Provision order:**
**install-essentials.ps1**  
**configure-pre-windowssettings.ps1**  
**install-windowsupdates.ps1** (Update before intallation of software)  
-- REBOOT --  
**install-windowsupdates.ps1** (Update again to make sure we got everything)  
-- REBOOT --  
**install-windowsfeatures.ps1**  
-- REBOOT --  
**install-software.ps1**  
**install-rubygems.bat**
-- REBOOT --  
**install-visualstudio.ps1**  
-- REBOOT --  
**install-software-post-visualstudio.ps1**  
-- REBOOT --  
**install-windowsupdates.ps1** (Update again after software installation)  
**configure-post-windowssettings.ps1**  
-- REBOOT --  

## **Installed Software (In order)**
Chocolatey  
Boxstarter  

Windows Features:  
 - IIS-WebServerRole  
 - NetFx4Extended-ASPNET45  
 - IIS-NetFxExtensibility45  
 - IIS-ISAPIExtensions  
 - IIS-ISAPIFilter  
 - IIS-ASPNET45  
 - IIS-WebSockets  
 - IIS-HttpCompressionDynamic  
 - IIS-BasicAuthentication  
 - IIS-WindowsAuthentication

Web Platform Installer  
 - Url Rewrite 2  
 - Application Request Routing 3.0

Git  
Python 3  
Node.js  
NuGet CLI  
7-Zip  
Firefox  
Chrome  
Notepad++  
Visual Studio Code   
LINQPad  
Fiddler4  
PuTTY  
WinSCP  
Sourcetree  
Redis
Ruby
Postman

Ultrahook

Visual Studio 2017 Community

SQL Server Management Studio  
DotPeek

## Recommended Visual Studio plugins:
Web Essentials 2017  
NPM Task Runner  
VSColorOutput  
ResXManager  
Conveyor