# VSCode Extensions

VSCode scripts helps export and import extensions. It's better for onboarding than for using it on a day to day basis. For a daily usage we recommend turning "on Settings Sync..."

## How to use it

First export your extensions using the vscode.export.extensions.ps1 script.
Then, you'll be able to import these extensions using the vscode.import.extensions.ps1 script.

> [NOTE]
>
> It's essentially a scenario where a newly added teammate imports your extensions

### Default filename

The default filename for the export/import extensions are vscode.extensions.txt and vscode-insiders.extensions.txt.

### Export/Import VSCode/VSCode-Insiders extensions

To export/import extensions execute the script vscode.[export|import].extensions.ps1 with these parameters:

- BasePath: The path, as string, where is (or will be) the vscode[-insiders].extensions.txt. [Default is the current folder]
- Insiders: Boolean value that indicate if the export/import is about the VSCode-Insiders build or the standard one. [Default : $False]

## Keep your dev environment in Sync

You should use the VSCode "turn on Settings sync..." to keep all(settings and extensions) in sync for a daily basis usage.

## Keep your workspace unified

An other good way to keep the `workspace` of your project unified within all team member is to use the file `extensions.json` in the `.vscode`. This file will help all team members what are the `@recommended` extensions to be install for that project.
