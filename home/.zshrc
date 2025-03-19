########################
### mango7006 .zshrc ###
########################

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
alias rcat"cat"

alias cd="z"

alias cp="cp -Iv"
alias mv="mv -v"

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
  local packages=(neovim starship zoxide bat eza fastfetch trash ripgrep)
  for package in $packages; do
    pacman -Qs $package &>/dev/null || sudo pacman -S --noconfirm $package
  done
}

nvim_install() {
  local neovim_deps=(lazygit luarocks npm typescript)
  for deps in $neovim_deps; do 
    pacman -Qs $deps &>/dev/null || sudo pacman -S --noconfirm $deps
  done
}

font_install() {
  local font_deps=(awesome-terminal-fonts ttf-droid ttf-font-awesome ttf-ibm-plex ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols)
  for fonts in $font_deps; do 
    pacman -Qs $fonts &>/dev/null || sudo pacman -S --noconfirm $fonts
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
