########################
### mango7006 .zshrc ###
########################

# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep notify
zstyle :compinstall filename '/home/mango/.zshrc'

autoload -Uz compinit
compinit

# Exports
export EDITOR="nvim"
export VISUAL="nvim"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Aliases
alias ls="eza --color=auto --icons"
alias l="eza -a --color=auto --icons"
alias la="eza -alh --color=auto --icons"

alias cat="bat"
alias rcat"cat"

alias cd="z"

alias cp="cp -v"
alias mv="mv -v"

alias grep="rg -P -i --color=auto"

alias ip="ip -c=auto"
alias whatip="ip -c a | grep 'inet '"

alias ff="fastfetch"

alias neovim="nvim"

cleantmp() {
  sudo systemd-tmpfiles --clean 
  sudo pacman --noconfirm -Scc 
  paru --noconfirm -Scc
  sudo journalctl --vacuum-time=1d
  sudo systemd-tmpfiles --remove 
  paccache -rk0
  clear
}

alias rm="trash"

alias shutdown="shutdown now"
alias reboot="shutdown -r now"

alias loginpi="ssh pipi4@192.168.11.128"

alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#################
### Functions ###
#################

zsh_install() {
  local packages=(neovim starship zoxide bat eza fastfetch trash-cli ripgrep pacman-contrib)
  for package in $packages; do
    pacman -Qs $package &>/dev/null || sudo pacman -S --noconfirm $package
  done
}

refresh() {
  source ~/.zshrc && exec zsh
}

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
export LIBVIRT_DEFAULT_URI="qemu:///system"
