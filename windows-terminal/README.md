# Windows terminal

Windows Terminal is the great new one. It includes a lot of cool features like tabs, multiple CLI, and settings to make it nice :smile:

But, you may want to turn it into WOW.

> :warning: WARNING :warning:
>
> Here we will only talk about the installation and configuration on Windows OS even though it should be very similar.

## Overview

Here, we will describe all the steps to make your terminal look astonishingly WOW so that your coworkers will be jealous how much you can `Shell Like a Badass` :sunglasses:

![WT Like a badass](images/wt-like-badass.png)

> :memo: NOTE :memo:
>
> It could be installed separately, but since we are lazy enough, we will be using [Scoop](../scoop/README.md).

## Installation Instructions

> :warning: WARNING :warning:
>
> We will assume that your current terminal will be at the root of the repo.

### Install Scoop

First, if it's not already installed (what are you waiting for!), you will need to install scoop using:

```powershell
./scoop/scoop.base.install.ps1
```

#### Adding Buckets

You will also need specific known buckets for this to work:

```powershell
scoop bucket add extras
scoop bucket add nerd-fonts
```

### Install all required applications

Because you are using scoop, the installation of ALL the apps will be easy. Following these instructions will install:

- Windows-Terminal : The new terminal in the Block
- PowerShell 7 : The successor to PowerShell 5 shell
- Posh-Git : Git auto completion in PowerShell
- Oh-My-Posh3 : Prompt theme engine
- Sudo : To force elevated privilege
- Cascadia-Code fonts

```powershell
# you should always update scoop before working with it
scoop update
scoop install windows-terminal pwsh posh-git oh-my-posh3 sudo
sudo scoop install Cascadia-Code CascadiaCode-NF CascadiaCode-NF-Mono
```

> :memo: NOTE :memo:
>
> Oh-My-Posh3 support other shell like Bash, Zsh, ... but, it will not be explained in this post. You can get more information on the [installation documentation](https://ohmyposh.dev/docs/installation) page of oh-my-posh(v3).

## Configuration

### Enabling Oh-My-Posh3 and Posh-Git in PowerShell 7

These steps will enable Oh-My-Posh3 and Posh-Git

Open PowerShell 7 from your Windows menu or by typing `pwsh.exe` in the command line. Then execute the script:

```powershell
# Execute the Script in PowerShell 7 (pwsh.exe)
pwsh.exe ./windows-terminal/config/configurePwsh7.ps1
```

At the end of the script execution, it should ask some manual actions. Do to so:

1. Open windows explorer
2. Go to `./windows-terminal/config`
3. Manually copy the folder "PowerShell" (and its content)
4. Paste the "PowerShell" folder into your `$env:UserProfile/Documents` (aka.: "%UserProfile%/Documents" or "~").

> :warning: IMPORTANT :warning:
>
> Because some Antivirus may find the `PowerShell` folder or file creation identify them as a threat, it is easier to create it manually :wink:

Reload the PowerShell Profile by launching a new `pwsh.exe` instance.

Now PowerShell should have some color... But with weird characters. Now, it's times to try something if you use [VsCode](#enabling-powershell-7-in-vscode) :wink:. If not jump to [Windows-Terminal](#enabling-powershell-7-in-windows-terminal)

### Enabling PowerShell 7 in VsCode

Open the `settings.json` file of the VSCode and change the values of these settings (if already configured):

```json
    "terminal.integrated.fontFamily": "CaskaydiaCove NF",
    "terminal.integrated.shell.windows": "pwsh.exe",
    "terminal.integrated.shellArgs.windows": [
        "-NoLogo"
    ]
```

Open a new terminal in VSCode and Voilà!

> :memo: NOTE :memo:
>
> You may need to close VSCode and reopen it if it was open when you installed "posh-git" with Scoop

### Enabling PowerShell 7 in Windows-Terminal

Open Windows terminal from your Start Menu or from the command line, using `wt.exe`

> :memo: NOTE :memo:
>
> It may be possible that Windows Terminal will use PowerShell 7 as the default. So the next steps may have to be adjusted since it is written as if it wasn't available nor the default one.

Then, open the settings in Windows Terminal (aka: "%UserProfile%\AppData\Local\Microsoft\Windows Terminal\settings.json") and add this in the `profiles.list[]` then save it:

```json
      {
          "guid": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
          "name": "PowerShell 7",
          "commandline" : "%UserProfile%\\scoop\\apps\\pwsh\\current\\pwsh.exe",
          "fontFace" : "CaskaydiaCove NF",
          "fontSize": 10,
          "source": "Windows.Terminal.PowershellCore",
          "startingDirectory": "~",
          "hidden": false
      }
```

If you already have that `guid` in the Settings.json file, then only add the `fontFace`, `fontSize` and you could adapt the `startingDirectory` too.

The `guid` is the actual PowerShell 7 guid's value.

#### Enforcing PowerShell 7 as the default shell

If you want to always use PowerShell 7 as the default in Windows Terminal (which is optional :wink:), you can set it in the settings of Windows Terminal by replacing the value of `defaultProfile` with the value in the `guid`.

You should then have something like this:

```json
  "defaultProfile": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
```

## Working with containers

### Install other applications

If you are like us and working with Kubernetes, you could also install these apps:

```powershell
scoop update
scoop install dockercompletion dos2unix helm kubectl kubectx kubens lens pskubectlcompletion
```

> :memo: NOTE :memo:
>
> We uses the K8S within Docker Desktop. If it's not the case other cool apps can also be install from scoop

### Enabling these other applications in PowerShell 7

Of course this is optional depending on each applications you installed, but you could add this information after the "posh-git" import in your PowerShell `$PROFILE`:

```powershell
Set-Alias -Name k -Value kubectl
Set-Alias -Name ktx -Value kubectx
Set-Alias -Name kns -Value kubens
Set-Alias -Name d -Value docker

Import-Module DockerCompletion
Import-Module PSKubectlCompletion
```

To open your profile, from `pwsh.exe`, simply use (or use your preferred EDI):

```powershell
notepad $PROFILE
```

> :memo: NOTE :memo:
>
> These tools do works with PowerShell 5 too. You could run the same command in PowerShell 5 to update it's $PROFILE to add these.
>
> You can also add `Import-Module posh-git`. But it's no use to add the "oh-my-posh3" invoke command, since it's not supported. To use something similar you will have to use the old "Oh-My-Posh v2" which is not longer supported.

## Some references

- [Windows Terminal Tips and Tricks](https://devblogs.microsoft.com/commandline/windows-terminal-tips-and-tricks/)
- [What is Windows Terminal?](https://docs.microsoft.com/en-ca/windows/terminal/)
