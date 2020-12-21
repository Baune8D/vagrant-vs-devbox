# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "baunegaard/win10pro-en"
    config.vm.hostname = "win10vs"

    config.winrm.username = "vagrant"
    config.winrm.password = "vagrant"

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.aliases = %w(
        # Add hostnames to map here
    )

    config.vm.provider "parallels" do |prl, override|
        prl.name = "Win10_VS"
        prl.cpus = 4
        prl.memory = 8192
        prl.customize ["set", :id, "--efi-boot", "off"]
        prl.update_guest_tools = true
    end

    config.vm.provider :vmware_desktop do |v, override|
        v.vmx["displayName"] = "Win10_VS"
        v.vmx["numvcpus"] = "4"
        v.vmx["memsize"] = "8192"
        v.vmx["ethernet0.virtualDev"] = "vmxnet3"
        v.vmx["scsi0.virtualDev"] = "lsisas1068"
        v.enable_vmrun_ip_lookup = false
        v.whitelist_verified = true
    end

    config.vm.provider :virtualbox do |v, override|
        v.name = "Win10_VS"
        v.customize ["modifyvm", :id, "--cpus", 4]
        v.customize ["modifyvm", :id, "--memory", 8192]
    end

    config.vm.provision "shell", path: "configure/pre-windowssettings.ps1"
    config.vm.provision :reload
    config.vm.provision "shell", path: "software/install.ps1"
    config.vm.provision "shell", path: "configure/post-windowssettings.ps1"
    config.vm.provision :reload
    config.vm.provision "shell", path: "configure/install-windowsupdates.ps1"
end
