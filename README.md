# Windows 10 Pro Vagrant Development Box

## **Setup**
### **Requires:**  
Vagrant - [Link](https://www.vagrantup.com/downloads.html)  
Vagrant-Reload Plugin - CMD: **vagrant plugin install vagrant-reload**  
Vagrant-HostsManager Plugin - CMD: **vagrant plugin install vagrant-hostsmanager**  
**Bug in Vagrant-HostManager with Vagrant > 1.8.1** - Fix: [Link](https://github.com/devopsgroup-io/vagrant-hostmanager/pull/229/commits/2ce7a0d4a6b45fbf959dff0c8144c359d633dc81)

Providers for VirtualBox, VMware Fusion, VMware Workstation and Parallels are pre-configured.  
All hypervisors except VirtualBox will need a matching provider plugin installed for Vagrant.

To use the default settings, execute from repo root:  
**vagrant up**  
Now sit back while Vagrant provisions your new development machine.  
Provisioning can take many hours, be patient.

**Recommended steps after provisioning:**  
1. Activate Windows.  
2. Enable Windows Developer Mode.  
3. Activate SSH in Git Bash and Sourcetree.  
^^ Look at README in ./ssh folder  
4. (Optional) Disable Windows Defender to save CPU  
^^ Edit group policy -> Computer Configuration -> Administrative Templates -> Windows Components -> Windows Defender Antivirus -> Turn off Windows Defender Antivirus -> Disabled

## **Information:**
This is built for use with a Packer Windows 10 base image.  
Packer setup repository: [GitHub link](https://github.com/Baune8D/packer-win10-basedisk)  
A pre-build default box will be downloaded on first run.

Default hypervisor settings are: 2 CPU's and 6144 MB memory.  
This can be changed in Vagrantfile.

Look at README in provision folder for a list of installed software,  
and suggestions for other recommended software.