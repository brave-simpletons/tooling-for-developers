param(
        [Parameter(Mandatory = $False)]
        [String] $BasePath="."
    )

function Import-Buckets {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path
    )

    Get-Content "$Path\scoop.buckets.txt" | ForEach-Object { scoop bucket add $_ }
}

# TODO : virustotal doesn't seems to work properly anymore
# function Get-VirustotalAppStatus {
#     param(
#         [Parameter(Mandatory = $True)]
#         [String] $Path
#     )

#     # verify virustotal for all apps
#     Get-Content "$Path\scoop.apps.newer.txt" | ForEach-Object  {scoop virustotal $_}
# }

function Import-Apps {
    param(
        [Parameter(Mandatory = $True)]
        [String] $Path
    )

    Get-Content "$Path\scoop.apps.newer.txt" | ForEach-Object  {scoop install $_}
}

# import buckets
Import-Buckets $BasePath

# update scoop app repositories
scoop update

# TODO : virustotal doesn't seems to work properly anymore
# Get-VirustotalAppStatus $BasePath

# import apps
Import-Apps $BasePath