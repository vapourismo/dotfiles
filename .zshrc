# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias g=git
alias new-ghcid="ghcid --command=\"cabal new-repl --ghc-options='-fno-code -fno-break-on-exception -fno-break-on-error -v1 -ferror-spans -j'\""

# Environment variables
export PATH=$PATH:$HOME/.cabal/bin

# History
export HISTFILE=$HOME/.zhistory
export SAVEHIST=1000
setopt APPEND_HISTORY

# Auto-completation for kubectl
source <(kubectl completion zsh)

# Nix
. /etc/profile.d/nix.sh
