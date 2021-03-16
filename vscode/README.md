# VSCode Extensions

VSCode scripts helps export and import extensions. It's better for onboarding than for using it on a day to day basis. For a daily usage we recommend turning "on Settings Sync..."

## How to use it

First export your extensions using the vscode.export.extensions.ps1 script.
Then, you'll be able to import these extensions for :

- VSCode : vscode.import.extensions.ps1
- VSCode Insiders : vscode-insiders.import.extensions.ps1

> [NOTE]
> It's essentially a scenario where a newly added teammate imports your extensions

## Keep your dev environment in Sync

You should use the VSCode "turn on Settings sync..." to keep all(settings and extensions) in sync for a daily basis usage.

## Keep your workspace unified

An other good way to keep the `workspace` of your project unified within all team member is to use the file `extensions.json` in the `.vscode`. This file will help all team members what are the `@recommended` extensions to be install for that project.
