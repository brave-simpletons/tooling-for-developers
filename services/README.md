# Enabling/Disabling a Services

[[_TOC_]]

## Overview

It might occur that a specific service required to be started or stopped. For example, if you have a specific service that required to run most of the time but that could interfere with some experimentations that you need to do (i.e.: make sure that a VPN service is enable or disable). For that reason, these scripts could be useful.

## Requirements

You must be able to execute it with elevated privileged.

## How to use this

The batch files force the execution with elevated privileges.

### Using Batch files

Copy these Batch files (`start-service.bat` and `stop-service.bat`) were you see fit.

Execute the batch file followed by the `Name of the service` that you need to start or stop. Here is an example :

```powershell
start-service.bat ServiceName
```

### Using a shortcut in the start menu

You can create a standard "shortcut" for each batch files in `%appdata%\Microsoft\Windows\Start Menu\Programs\Personal_Folder_For_Scripts` (where `Personal_Folder_For_Scripts` is the folder's name that you want)

> :memo: NOTE :memo:
>
> Within the Shortcut, do not forget to add the `name of the service` after the batch file name :wink:

Then, they will be visible in the application menu. You can also "pin" them in the start menu.

### Using the Command line

You could also use the "invoked commands" from the scripts directly in a PowerShell windows using elevated privileges.

### Start the Service

```ps
Start-Service -Name [NameOfTheService]
```

### Stop the Service

```ps
Stop-Service -Name [NameOfTheService]
```
