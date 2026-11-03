# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Set DEVBOX_BOX when you create the machine to use another box, e.g. baunegaard/win11pro-da
  config.vm.box = ENV.fetch("DEVBOX_BOX", "baunegaard/win11pro-en")
  config.vm.hostname = "win11vs"

  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  # Extra hostnames for the machine, e.g. %w(myapp.test api.myapp.test)
  config.hostmanager.aliases = %w()

  config.vm.provider "parallels" do |prl, override|
    prl.name = "Win11_VS"
    prl.cpus = 4
    prl.memory = 8192
    prl.update_guest_tools = true
  end

  config.vm.provider :vmware_desktop do |v, override|
    v.vmx["displayName"] = "Win11_VS"
    v.vmx["numvcpus"] = "4"
    v.vmx["memsize"] = "8192"
    v.vmx["ethernet0.virtualDev"] = "vmxnet3"
    v.vmx["scsi0.virtualDev"] = "lsisas1068"
    v.enable_vmrun_ip_lookup = false
    v.whitelist_verified = true
  end

  config.vm.provider :virtualbox do |v, override|
    v.name = "Win11_VS"
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
