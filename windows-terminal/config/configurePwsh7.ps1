
$themeFilename = "themes\new-rebels.omp.json"
$themeSourcePath = "$PSScriptRoot\$themeFilename"
$themeDestinationPath = "$(scoop prefix oh-my-posh)\$themeFilename"

if (!(Test-Path $themeDestinationPath))
{
    Write-Host "Copy the theme"
    Copy-Item -Path $themeSourcePath -Destination $themeDestinationPath -Recurse -Force
}
else
{
    Write-Host "It appears that you already have the 'REBEL' theme..." -Foreground Green
    Write-Host
    Write-Host "If you want to override it, you can do it by using this command:" -Foreground Blue
    Write-Host "Copy-Item -Path $themeSourcePath -Destination $themeDestinationPath -Force" -Foreground Blue
}

Write-Host

$profileFilename = "PowerShell\Microsoft.PowerShell_profile.ps1"
$pwshSourcePath = "$PSScriptRoot" #\$profileFilename"
$pwshDestinationPath = "$env:UserProfile\Documents" #\$profileFilename"

if (!(Test-Path "$pwshDestinationPath\$profileFilename"))
{
    Write-Host "It appears that your are MISSING the $PROFILE file..." -Foreground Red
    Write-Host
    Write-Host "Make sure to manually copy the ""PowerShell"" folder and its content from:"
    Write-Host "  explorer '$pwshSourcePath'" -Foreground Yellow
    Write-Host "into"
    Write-Host "  explorer '$pwshDestinationPath'" -Foreground Yellow
}
else
{
    Write-Host "It appears that you already have $PROFILE file..." -Foreground Green
    Write-Host
    Write-Host "Add these as first lines of your powershell profile (that will open using Notepad):"
    Write-Host "Invoke-Expression (oh-my-posh --init --shell pwsh --config ""$(scoop prefix oh-my-posh)/themes/rebel-paradox.omp.json"")" -Foreground Yellow
    Write-Host "Import-Module posh-git" -Foreground Yellow
    Write-Host
    Notepad $PROFILE
}
