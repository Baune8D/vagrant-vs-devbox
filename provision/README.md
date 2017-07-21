# Provision scripts for Windows 10

**See bottom for other recommended software.**

What software to install can be configured in the file: **install-software.ps1**

### **Visual Studio**
Visual Studio 2017 Community is installed with all available features.

### **Provision order:**
Script: **install-essentials.ps1** (Chocolatey & Boxstarter)  
Script: **configure-windowssettings.ps1**  
Script: **install-windowsupdates.ps1** (Update before intallation of software)  
-- REBOOT --  
Script: **install-windowsupdates.ps1** (Update again to make sure we got everything)  
-- REBOOT --  
Script: **install-windowsfeatures.ps1**  
-- REBOOT --  
Script: **install-software.ps1**  
-- REBOOT --  
Script: **install-visualstudio.ps1**  
-- REBOOT --  
Script: **install-visualstudio-software.ps1**  
-- REBOOT --  
Script: **install-windowsupdates.ps1** (Run update again after software installation)  
Script: **configure-post-windowssettings.ps1**  
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

-- REBOOT --

Web Platform Installer  
 - Url Rewrite 2  
 - Application Request Routing 3.0

Git  
Python 2  
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

-- REBOOT --

Visual Studio 2017 Professional

-- REBOOT --

SQL Server Management Studio

ReSharper  
ReSharper C++  
DotCover  
DotTrace  
DotMemory  
DotPeek

## Recommended software.
**Cisco AnyConnect** This is essential!!!!  

Visual Studio plugins:  
**Web Essentials 2017**  
**NPM Task Runner**  
**Open in VS Code**  
**.ignore**  
**VSColorOutput**  
**ResXManager**