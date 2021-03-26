function Get-ManifestPath {
    param(
        [Parameter(Mandatory = $True)]
        [String] $AppName
    )

    $info = Invoke-Expression "scoop info $AppName"
    $manifest = $info | Select-String -Pattern "Manifest:"
    if($null -ne $manifest) {
        return ($manifest -Replace "Manifest:\n", "").Trim()
    }
    else {
        return $null
    }
}

function Get-AppName {
    param(
        [Parameter(Mandatory = $True)]
        [String] $AppAndVerison
    )

    return ($AppAndVerison -split (":"))[0].Trim()
}

function Get-InstallerUri {
    param (
        [Parameter(Mandatory = $True)]
        [string] $Manifest
    )

    $fileContent = Get-Content -Path $Manifest | ConvertFrom-Json
    if($fileContent.Url) {
        return $fileContent.Url
    }
    if($fileContent.architecture) {

        [regex]$rx="(http.*)"
        $arch = $fileContent.architecture | ConvertTo-Json
        $urlTemp = ($rx.Match($arch).value).Replace(""",", "")

        return $urlTemp
    }
}

function Get-NbrQuantifier {
    param(
        [Parameter(Mandatory = $True)]
        [int] $Nbr = 0,
        [Parameter(Mandatory = $False)]
        [string] $Type = ""
    )

    $quantifier = "nothing"

    # ref guidelines : https://www.writerightwords.com/write-right-couple-few-some-several-many/
    switch ($Nbr) {
        {$_ -eq 1} { $quantifier = "a single" }
        {$_ -eq 2} { $quantifier = "a couple" }
        {$_ -ge 3} { $quantifier = "a few" }
        {$_ -ge 5} { $quantifier = "some" }
        {$_ -ge 8} { $quantifier = "several" }
        {$_ -ge 10} { $quantifier = "many" }
        {$_ -ge 13} { $quantifier = "a heap of" }
        {$_ -ge 15} { $quantifier = "a stack of" }
        {$_ -ge 18} { $quantifier = "one too many" }
        {$_ -ge 24} { $quantifier = "a truck load of" }
        {$_ -gt 48} { $quantifier = "(scratch that...) What the hell man! Do you even know what you are doing? You have f****** too much" }
        Default {}
    }

    if($Nbr -gt 1) {
        $Type = "$($Type)s"
    }

    return "$quantifier $Type"
}

Write-Host "Force Scoop to Update..."
Invoke-Expression "scoop update"

$ScoopStatus = Invoke-Expression "scoop status"
$ArrAppToUpdate = $ScoopStatus -split "\n"
if($ArrAppToUpdate.Count -gt 0)
{
    if($ArrAppToUpdate[0] -ne "")
    {
        $quantifierMsg = Get-NbrQuantifier -Nbr $ArrAppToUpdate.Count -Type "update"
        Write-Host
        Write-Host "You have $($quantifierMsg)."
        Write-Host
        Write-Host "Please verify downloadlinks before updating:"

        foreach ($item in $ArrAppToUpdate) {
            $appName = Get-AppName -AppAndVerison $item
            $manifest = Get-ManifestPath -AppName $appName
            if($null -ne $manifest) {
                $urlInstaller = Get-InstallerUri -Manifest $manifest

                Write-Host " - $appName = $urlInstaller"
            }
        }

        Write-Host
        Write-Host "Opening the Browser at VirusTotal..."
        Write-Host
        #TODO : Food for Thought
        #       - Add direct calls to the VirusTotal API (https://developers.virustotal.com/v3.0/reference#overview)
        #       - Some validations are required, eg.: the rate seems to be limited to max 4 request/min with an public API key so it might not be good for now
        Invoke-Expression "cmd.exe /C start https://www.virustotal.com/gui/home/url"
    }
    else {
        Write-Host "NoUpdates"
    }

    Read-Host "Enter to Close..."
}
