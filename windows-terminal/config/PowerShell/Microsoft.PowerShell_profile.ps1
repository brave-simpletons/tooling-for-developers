$env:POSH_GIT_ENABLED = $true

Invoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)/themes/new-rebels.omp.json")

Import-Module posh-git
