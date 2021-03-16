param(
        [Parameter(Mandatory = $False)]
        [String] $BasePath="."
    )

function Import-Extensions {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path
    )

    # import Extensions for VSCode-Insiders
    Get-Content "$Path\backup\vscode.extensions.txt" | ForEach-Object { code-insiders --install-extension $_ }
}

Import-Extensions $BasePath
