# Keyboard
autoload zkbd
autoload -U select-word-style
select-word-style bash

# Auto-Complete
autoload -Uz compinit
compinit

# Prompt
setopt prompt_subst

prompt_git_branch() {
	branch=$(git symbolic-ref --short HEAD 2> /dev/null)
	[[ -n "$branch" ]] && echo -n "%F{blue}@$branch%f "
}

prompt_nix_shell() {
	[[ -n "$IN_NIX_SHELL" ]] && echo -n "%F{yellow}[nix-shell]%f "
}

if [[ $UID -eq 0 ]]; then
	export PROMPT=$'$(prompt_nix_shell)%F{red}%C%f $(prompt_git_branch)%F{green}\u03B1%f '
else
	export PROMPT=$'$(prompt_nix_shell)%F{red}%C%f $(prompt_git_branch)%F{green}\u03BB%f '
fi

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias g=git

# Environment variables
export PATH=$PATH:$HOME/.cabal/bin:$HOME/.local/bin

# History
export HISTFILE=$HOME/.zhistory
export SAVEHIST=1000
setopt APPEND_HISTORY

# Keys
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Make
export MAKEFLAGS=-j16

