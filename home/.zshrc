HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mango/.zshrc'

autoload -Uz compinit
compinit

# Exports
export EDITOR="nvim"
export VISUAL="nvim"

# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Aliases

alias ls="eza --color=auto --icons"
alias l="eza -a --color=auto --icons"
alias la="eza -alh --color=auto --icons"

alias cat="bat"

alias cd="z"

alias cp="cp -Iv"
alias mv="mv -v"
alias rm="rm -Iv"

alias grep="rg -P -i --color=auto"

alias ip="ip -c=auto"
alias whatip="ip -c a | rg 'inet '"

alias neofetch="echo 'neofetch is too old you dumbo'; fastfetch"
alias ff="fastfetch"
alias nf="fastfetch"

alias vi="nvim"
alias neovim="nvim"
alias vim="nvim"
alias nano="nvim"

alias clean-tmp="sudo systemd-tmpfiles --clean"

alias rm="trash"

alias shutdown="shutdown now"
alias reboot="shutdown -r now"

alias loginpi="ssh pipi4@192.168.11.126"

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
