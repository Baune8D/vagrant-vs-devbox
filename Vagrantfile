# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.winrm.username = "vagrant"
    config.winrm.password = "vagrant"

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true

    config.vm.define "Win10_VS2017" do |node|
        node.vm.hostname = "win10vs2017"
        node.hostmanager.aliases = %w(
            # Add hostnames here
        )
    end

    config.vm.provider "parallels" do |prl, override|
        override.vm.box = "win10pro-parallels-8D"
        override.vm.box_url = "https://devops.saxis.dk/windows_10_parallels.box"
        prl.name = "Win10_VS2017"
        prl.customize ["set", :id, "--cpus", "2"]
        prl.customize ["set", :id, "--memsize", "6144"]
        prl.customize ["set", :id, "--efi-boot", "off"]
    end

    config.vm.provider :vmware_fusion do |v, override|
        override.vm.box = "win10pro-vmware-8D"
        override.vm.box_url = "https://devops.saxis.dk/windows_10_vmware.box"
        v.vmx["numvcpus"] = "2"
        v.vmx["memsize"] = "6144"
        v.vmx["ethernet0.virtualDev"] = "vmxnet3"
        v.vmx["scsi0.virtualDev"] = "lsisas1068"
        v.enable_vmrun_ip_lookup = false
    end

    config.vm.provider :vmware_workstation do |v, override|
        override.vm.box = "win10pro-vmware-8D"
        override.vm.box_url = "https://devops.saxis.dk/windows_10_vmware.box"
        v.vmx["numvcpus"] = "2"
        v.vmx["memsize"] = "6144"
        v.vmx["ethernet0.virtualDev"] = "vmxnet3"
        v.vmx["scsi0.virtualDev"] = "lsisas1068"
        v.enable_vmrun_ip_lookup = false
    end

    config.vm.provider :virtualbox do |vbox, override|
        override.vm.box = "win10pro-virtualbox-8D"
        override.vm.box_url = "https://devops.saxis.dk/windows_10_virtualbox.box"
        vbox.customize ["modifyvm", :id, "--cpus", 2]
        vbox.customize ["modifyvm", :id, "--memory", 6144]
    end

    config.vm.provision "shell", path: "provision/install-essentials.ps1"
    config.vm.provision "shell", path: "provision/configure-pre-windowssettings.ps1"
    config.vm.provision "shell", path: "provision/install-windowsupdates.ps1"
    config.vm.provision :reload
    config.vm.provision "shell", path: "provision/install-windowsupdates.ps1"
    config.vm.provision :reload
    config.vm.provision "shell", path: "provision/install-windowsfeatures.ps1"
    config.vm.provision :reload
    config.vm.provision "shell", path: "provision/install-software.ps1"
    config.vm.provision :reload
    config.vm.provision "shell", path: "provision/install-software-visualstudio.ps1"
    config.vm.provision :reload
    config.vm.provision "shell", path: "provision/install-software-post-visualstudio.ps1"
    config.vm.provision :reload
    config.vm.provision "shell", path: "provision/install-windowsupdates.ps1"
    config.vm.provision "shell", path: "provision/configure-post-windowssettings.ps1"
    config.vm.provision :reload
end