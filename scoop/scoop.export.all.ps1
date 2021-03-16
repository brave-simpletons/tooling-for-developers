param(
        [Parameter(Mandatory = $False)]
        [String] $BasePath="."
    )

function Export-Buckets {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path
    )

    # export BUCKETS
    scoop export | Select-String '\[(\w+)\]' | ForEach-Object { $_.matches.groups[1].value } | Select-Object -unique > "$Path\backup\buckets.txt"
}

function Export-AppAndVersions {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path
    )

    # export APPS without version (i.e.: during import, it will install the latest version)
    scoop export | select-string '^(.+)\W\(v:' | ForEach-Object { $_.matches.groups[1].value } > "$Path\backup\apps.newer.txt"
}

function Export-AppNameOnly {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path
    )

    # export APPS with EXACT version :
    scoop export | select-string '^(.+)\W\(v:(.+)\)' | ForEach-Object { $_.matches.groups[1].value+"@"+$_.matches.groups[2].value } > "$Path\backup\apps.version.txt"
}

Export-Buckets $BasePath
Export-AppAndVersions $BasePath
Export-AppNameOnly $BasePath
