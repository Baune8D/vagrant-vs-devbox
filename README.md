# Visual Studio devbox for Vagrant

[![CI](https://github.com/Baune8D/vagrant-vs-devbox/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/Baune8D/vagrant-vs-devbox/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/github/license/Baune8D/vagrant-vs-devbox)](https://github.com/Baune8D/vagrant-vs-devbox/blob/main/LICENSE.txt)

A Vagrantfile that provisions a Windows 11 machine for .NET and web development: Visual Studio with every workload, IIS, the .NET SDK, Node.js, SQL Server Management Studio, VS Code and more, installed with Chocolatey.

## Requirements

- [Vagrant](https://developer.hashicorp.com/vagrant/install). It also needs the [vagrant-hostmanager](https://github.com/devopsgroup-io/vagrant-hostmanager) plugin, which `vagrant up` offers to install.
- A provider on an x64 host:
  - VirtualBox, built into Vagrant.
  - VMware Workstation Pro or Fusion Pro, with the [Vagrant VMware provider](https://developer.hashicorp.com/vagrant/docs/providers/vmware/installation): `vagrant plugin install vagrant-vmware-desktop` and the Vagrant VMware Utility.
  - Parallels Desktop, with `vagrant plugin install vagrant-parallels`. The published box has no Parallels build, so build one with [packer-windows-desktop](https://github.com/Baune8D/packer-windows-desktop) and add it under the box name.
- A Visual Studio installer in the `software` folder: [vs_community.exe](https://aka.ms/vs/stable/vs_community.exe), [vs_professional.exe](https://aka.ms/vs/stable/vs_professional.exe) or [vs_enterprise.exe](https://aka.ms/vs/stable/vs_enterprise.exe). The script looks for `vs_*.exe`, so it doesn't pick up the `VisualStudioSetup.exe` from the Visual Studio website. Without an installer, Visual Studio is skipped.

## Usage

From the repository root:

```sh
vagrant up
```

The first run downloads the box, [baunegaard/win11pro-en](https://portal.cloud.hashicorp.com/vagrant/discover/baunegaard/win11pro-en), which is built with [packer-windows-desktop](https://github.com/Baune8D/packer-windows-desktop). Provisioning takes hours: Visual Studio is installed with every workload, and all available Windows updates are installed at the end.

## Settings

- **Box:** set `DEVBOX_BOX` when you create the machine to use another box, e.g. the Danish locale build: `DEVBOX_BOX=baunegaard/win11pro-da vagrant up`. Any Windows box with WinRM and the `vagrant` user should work.
- **CPUs and memory:** 4 CPUs and 8 GB, set per provider in the `Vagrantfile`.
- **Hostnames:** vagrant-hostmanager maps the machine's hostname, `win11vs`, in the hosts files of the host and the machine. Add more hostnames to `config.hostmanager.aliases`.
- **Software:** edit [software/install.ps1](software/install.ps1).

## What gets installed

In provisioning order:

1. [configure/pre-windowssettings.ps1](configure/pre-windowssettings.ps1): disables hibernation, the screensaver and the monitor timeout, and shows file extensions. Then a reboot.
2. [software/install.ps1](software/install.ps1):
   - Chocolatey.
   - IIS with ASP.NET 4.x, WebSockets, dynamic compression, and basic and Windows authentication, plus URL Rewrite and Application Request Routing.
   - Git, Python, Node.js LTS, Yarn, NuGet CLI, 7-Zip, Firefox, Chrome, Notepad++, Visual Studio Code, LINQPad, PuTTY, WinSCP, Redis, Ruby, SQL Server Management Studio, and the .NET SDK and Hosting Bundle.
   - Visual Studio, with every workload, and dotPeek.
   - VS Code extensions: C#, EditorConfig, Prettier, ESLint, Stylelint, Docker, Dev Containers, PowerShell and Vue (Official).
   - The UltraHook gem.
3. [configure/post-windowssettings.ps1](configure/post-windowssettings.ps1): turns UAC back on, which the box has off. Then a reboot.
4. [configure/install-windowsupdates.ps1](configure/install-windowsupdates.ps1): enables Microsoft Update and installs all available updates with PSWindowsUpdate, rebooting when they need it.

## License

[MIT](LICENSE.txt)
