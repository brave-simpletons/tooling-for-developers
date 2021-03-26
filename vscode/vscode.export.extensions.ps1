param(
        [Parameter(Mandatory = $False)]
        [String] $BasePath=".",

        [Parameter(Mandatory = $False)]
        [Boolean] $Insiders=$False
    )

function Export-Extensions {
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

    # export Extensions for VSCode
    Invoke-Expression "$AppName --list-extensions" | ForEach-Object { "$_" } > "$Path\vs$AppName.extensions.txt"
}

Export-Extensions -Path $BasePath -Insiders $Insiders
