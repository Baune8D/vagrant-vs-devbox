# vagrant-vs-devbox

A Vagrantfile that provisions a Windows 11 development machine (Visual Studio, IIS, .NET, Node.js and more) on a box built by [packer-windows-desktop](https://github.com/Baune8D/packer-windows-desktop).

- `Vagrantfile`: the box (`DEVBOX_BOX`, default `baunegaard/win11pro-en`), vagrant-hostmanager, one block per provider (Parallels, VMware, VirtualBox), and the provisioners. Reboots use the shell provisioner's `reboot: true`, not a plugin.
- `configure/*.ps1`: Windows settings before and after the software, and the Windows updates at the end.
- `software/install.ps1`: Chocolatey, Windows features, applications, Visual Studio (from a `vs_*.exe` the user drops into `software/`, which is gitignored), VS Code extensions and gems.
- The scripts run over WinRM in Windows PowerShell 5.1, as the `vagrant` admin user.
- The README lists what gets installed, in provisioning order. Keep it in step with the scripts.

## Workflow

- Conventional commits (`feat:`, `fix:`, `chore(deps):`, `ci:`, `build:`, `docs:`), one commit per concern, directly on `main`.
- Only push, tag, publish or edit GitHub releases when asked.
- Commit messages must be accurate. If one turns out to be wrong before it is pushed, reword it (replay the commits and check that the tree is unchanged). Never rewrite pushed history.

## Dependencies

- Software is installed with `choco install <id>` from the Chocolatey community repository, at the latest version. Check that a package ID exists and isn't deprecated before adding it.
- Dependabot updates the GitHub Actions weekly on Monday with a 7-day cooldown, in one grouped pull request.

## Testing

- CI runs `Invoke-ScriptAnalyzer -Path . -Recurse -EnableExit` and `vagrant validate --ignore-provider` (with vagrant-hostmanager installed). Run both before committing; use a scratch `VAGRANT_HOME` so the plugin install doesn't touch the real one.
- Provisioning needs an x64 host with a provider and takes hours, so there are no automated runs. Changes to the scripts can only be checked statically here; say so when a change hasn't been run on a machine.
