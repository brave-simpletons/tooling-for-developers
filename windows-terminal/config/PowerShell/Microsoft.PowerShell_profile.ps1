Invoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)/themes/new-rebels.omp.json")

$env:POSH_GIT_ENABLED = $true
Import-Module posh-git
