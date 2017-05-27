# Completion
zstyle :compinstall filename '/home/ole/.zshrc'

autoload -Uz compiniti
autoload -U select-word-style
autoload zkbd

compinit
select-word-style bash

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Environment
export LUA_CPATH=$(luarocks path --lr-cpath)
export PATH=$PATH:$HOME/.cabal/bin
export CC=clang
export CXX=clang++
export MAKEFLAGS="-j8"

# Java
export _JAVA_AWT_WM_NONREPARENTING=1

# 
export GOPATH=/data/go

source /opt/google-cloud-sdk/completion.zsh.inc
source <(kubectl completion zsh)
