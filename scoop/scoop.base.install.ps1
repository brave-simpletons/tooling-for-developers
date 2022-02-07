Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# TODO: the option `virustotal` does not seems to work correctly anymore :(
# scoop virustotal 7zip git

# install the core requirements
scoop install 7zip git
scoop bucket add business 'https://github.com/brave-simpletons/scoop-the-business.git'
