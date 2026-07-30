# Install XDG-UTILS (will help to launch browser, for example, from within the devcontainer to the host environment port forwarding must be active)
sudo apt update
sudo apt install -y xdg-utils && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt autopurge -y

mkdir ~/.config/zsh
mkdir ~/.config/bash
mkdir ~/.config/powershell

# Installing oh-my-posh (to use the same terminal theme we use the oh-my-posh instead of oh-my-zsh)
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes

### Obtain all the available oh-my-pwsh themes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
# Obtain our "new-rebels" theme
wget https://raw.githubusercontent.com/brave-simpletons/tooling-for-developers/main/windows-terminal/config/themes/new-rebels.omp.json -O ~/.poshthemes/new-rebels.omp.json

# Add oh-my-posh to the Zsh profile
echo "$(oh-my-posh init zsh --config ~/.poshthemes/new-rebels.omp.json)" >> ~/.config/zsh/oh-my-posh-loading.zsh

# Add oh-my-posh to the Bash profile
echo "$(oh-my-posh init bash --config ~/.poshthemes/new-rebels.omp.json)" >> ~/.config/bash/oh-my-posh-loading.bash

# Add oh-my-posh to the PowerShell profile
echo "oh-my-posh init pwsh --config /home/vscode/.poshthemes/new-rebels.omp.json | Invoke-Expression" >> ~/.config/powershell/Microsoft.PowerShell_profile.ps1

####
# Completion for Git
## for ZSH
echo "autoload -Uz compinit && compinit" >> ~/.config/zsh/git-completion.zsh
echo ". ~/.config/zsh/git-completion.zsh" >> ~/.zshrc
## for BASH
wget https://raw.githubusercontent.com/git/git/v2.39.2/contrib/completion/git-completion.bash -O ~/.config/bash/git-completion.bash
echo ". ~/.config/bash/git-completion.bash" >> ~/.bashrc
## for PowerShell
pwsh -Command "Install-Module posh-git -Scope CurrentUser -Force"
echo "Import-Module posh-git" >> ~/.config/powershell/Microsoft.PowerShell_profile.ps1
####

####
# Completion for .NET
## for ZSH
tee -a ~/.config/zsh/dotnet-completion.zsh <<EOF
# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete()
{
  local completions=("\$(dotnet complete "\$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "\$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "\${(ps:\\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet

EOF
echo ". ~/.config/zsh/dotnet-completion.zsh" >> ~/.zshrc
## for BASH
tee -a ~/.config/bash/dotnet-completion.bash <<EOF
# bash parameter completion for the dotnet CLI

function _dotnet_bash_complete()
{
  local cur="\${COMP_WORDS[COMP_CWORD]}" IFS=$'\n'
  local candidates

  read -d '' -ra candidates < <(dotnet complete --position "\${COMP_POINT}" "\${COMP_LINE}" 2>/dev/null)

  read -d '' -ra COMPREPLY < <(compgen -W "\${candidates[*]:-}" -- "\$cur")
}

complete -f -F _dotnet_bash_complete dotnet

EOF
echo ". ~/.config/bash/dotnet-completion.bash" >> ~/.bashrc
## for PowerShell
tee -a ~/.config/powershell/dotnet-completion.ps1 <<EOF
# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param(\$commandName, \$wordToComplete, \$cursorPosition)
         dotnet complete --position \$cursorPosition "\$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new(\$_, \$_, 'ParameterValue', \$_)
         }
 }

EOF
echo ". ~/.config/powershell/dotnet-completion.ps1" >> ~/.config/powershell/Microsoft.PowerShell_profile.ps1
## Duplicate for the VSCode Terminal
echo ". ~/.config/powershell/Microsoft.PowerShell_profile.ps1" > ~/.config/powershell/Microsoft.VSCode_profile.ps1
