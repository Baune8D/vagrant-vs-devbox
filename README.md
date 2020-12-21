# Windows 10 Pro Visual Studio Vagrant Box

## Setup

### Requirements
**Vagrant** - [Link](https://www.vagrantup.com/downloads.html)  
**Vagrant-Reload** Plugin: ```vagrant plugin install vagrant-reload```  
**Vagrant-HostManager** Plugin: ```vagrant plugin install vagrant-hostmanager```  
**Visual Studio installer** - (Drop into ```software``` folder)

### Getting Started
Providers for **VirtualBox**, **VMware** and **Parallels** are pre-configured.  
All hypervisors except VirtualBox will need a matching Vagrant provider plugin installed.  
For VMware: ```vagrant plugin install vagrant-vmware-desktop``` (Requires a license)  
For Parallels: ```vagrant plugin install vagrant-parallels```

To use the default settings, execute from repo root: ```vagrant up```  
Now sit back while Vagrant provisions your new development machine.  
Provisioning can a long time as Visual Studio will be installed with all available options, be patient.

## Information
This is built for use with a default Packer Windows 10 base box, but should run on any Windows box.  
Default Packer box repository: [GitHub link](https://github.com/Baune8D/packer-win10-basebox)  
A pre-built default box will be downloaded on first run.

Default hypervisor settings are: 4 CPU's and 8 GB memory.  
This can be changed in ```Vagrantfile```.

This box uses Vagrant-HostManager for mapping of hostnames.  
See ```Vagrantfile``` if you need to map custom hostnames.

## Software
Look [HERE](software/README.md) for a list of installed and recommended software.
