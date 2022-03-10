$env:POSH_GIT_ENABLED = $true
# To use a specific char as a logo, use the character from its unicode ex :  => \uf1d0
$env:OHMYPOSH_SHELL_LOGO = "" #  is the \uf1d0 (rebel) character
# The "OHMYPOSH_SHOW_SENSITIVE_DATA" environment variable is used to enable "sensitive data" to be shown (useful to disabling it when presenting and still having a "kickass" shell)
$env:OHMYPOSH_SHOW_SENSITIVE_DATA = $true # possible values to enabling sensitive data to be shown : [$true, "True", "true", 1] any other values will hide the sensitive data

Invoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)/themes/new-rebels.omp.json")

Import-Module posh-git
