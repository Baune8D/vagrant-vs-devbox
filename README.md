# Windows 10 Pro Vagrant Development Box

## **Setup**
### **Requires:**  
Vagrant - [Link](https://www.vagrantup.com/downloads.html)  
Vagrant-Reload Plugin - CMD: **vagrant plugin install vagrant-reload**  
Vagrant-HostManager Plugin - CMD: **vagrant plugin install vagrant-hostmanager**

Providers for VirtualBox, VMware Fusion, VMware Workstation and Parallels are pre-configured.  
All hypervisors except VirtualBox will need a matching provider plugin installed for Vagrant.  
For Parallels: **vagrant plugin install vagrant-parallels**

To use the default settings, execute from repo root:  
**vagrant up**  
Now sit back while Vagrant provisions your new development machine.  
Provisioning can take many hours, be patient.

**Recommended steps after provisioning:**  
1. Activate Windows  
2. (Optional) Enable Windows Developer Mode
3. Install Visual Studio extensions

## **Information:**
This is built for use with a Packer Windows 10 base image.  
Packer setup repository: [GitHub link](https://github.com/Baune8D/packer-win10-basebox)  
A pre-build default box will be downloaded on first run.

Default hypervisor settings are: 4 CPU's and 8 GB memory.  
This can be changed in Vagrantfile.

Look at README in software folder for a list of installed software, and suggestions for other recommended software.