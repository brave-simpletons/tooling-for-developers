param(
        [Parameter(Mandatory = $False)]
        [String] $BasePath="."
    )

function Export-Extensions {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path
    )

    # export Extensions for VSCode
    code --list-extensions | ForEach-Object { "$_" } > "$Path\backup\vscode.extensions.txt"
}

Import-Extensions $BasePath
