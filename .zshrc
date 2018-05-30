alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias g=git

export PATH=$PATH:$HOME/.cabal/bin

source <(kubectl completion zsh)
. /etc/profile.d/nix.sh
