param(
        [Parameter(Mandatory = $False)]
        [String] $BasePath=".",

        [Parameter(Mandatory = $False)]
        [Boolean] $Insiders=$False
    )

function Import-Extensions {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path,

        [Parameter(Mandatory = $True)]
        [Boolean] $Insiders
    )

    $AppName="code"
    if($Insiders -eq $True) {
        $AppName+="-insiders"
    }

    # import Extensions for VSCode
    Get-Content $Path\vs$AppName.extensions.txt | ForEach-Object { Invoke-Expression "$AppName --install-extension $_" }
}

Import-Extensions -Path $BasePath -Insiders $Insiders
