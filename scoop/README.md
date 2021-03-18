# SCOOP

[[_TOC_]]

## Overview

Scoop scripts help install export and import apps. Also useful when a new team members must install all the required applications, CLI and tools to work on your projects.

To know more, please go to the official [SCOOP.sh](https://scoop.sh) page.

## How to use it

### Installation

You must execute the `scoop.base.install.ps1` in an elevated mode. It will install the core requirement for scoop to work, which includes 7zip and git.

### Importing new Apps

Right click on one of the script to execute it with PowerShell :

- For already "validated" apps use `scoop.import.all.version.ps1`
- For all newest version of app `scoop.import.all.newer.ps1` (be aware, it might not been validated with VirusTotal)

> You can specify a folder. If not it will try to import app using the file in the current folder.

### Exporting your Apps

If you need to export your app list for a new team member or to use it throughout multiple computer, you only need to use execute the script `scoop.export.all.ps1`

> You can specify a folder. If not, it will try to export files to the current folder.

### App Updates

When you add a new app in your scoop, we recommend to use the `scoop.export.all.ps1` script which will create files that contains the app names (for newest) the app version names and also a third file which contains all the buckets

## Automate "Parts of" Scoop Updates

To reduce the burden to always ask scoop to update itself and its buckets, you can use the `updateScoop.ps1` script. If updates are required it will display the list of the "binaries" that will be installed and open your browser to the [VirusTotal](https://www.virustotal.com/gui/home/url) WebSite to let you find if there is some issue with the potential installation. To exit the PowerShell process you will need to press enter to notify that you've been informed :P

### Within "Task Scheduler"

For better automation, you can create a task in the Task Scheduler (or PowerAutomate, or whatever you want ;) )

In the program you can use "powershell.exe" and in the arguments you will need to put something like "-ExecutionPolicy Bypass -File `PathToThisRepoWithoutSpaces`\scoop\updateScoop.ps1", where `PathToThisRepoWithoutSpaces` must be this actual repo or elsewhere if you copy or linked the ps1 elsewhere

It will run at the desired triggers that you'll configure it... (It's recommended to terminate the action if it runs more than 30min.)
