param(
        [Parameter(Mandatory = $False)]
        [String] $BasePath="."
    )

function Import-Extensions {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path
    )

    # import Extensions for VSCode
    Get-Content "$Path\backup\vscode.extensions.txt" | ForEach-Object { code --install-extension $_ }
}

Import-Extensions $BasePath
