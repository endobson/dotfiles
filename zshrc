#
# ~/.zshrc
#
# By default, your shell is running tcsh. This is the initialization file
# for zsh, and will be read on shell startup if you run zsh explicitly
# or switch your shell to zsh (either via ypchsh or .fshshell). See zsh(1)
# for more.
#
# This file is analagous to ~/.cshrc for *csh shell initialization.
#
# EDIT THIS FILE to customize _only_ shell-specific options for zsh (e.g.
# prompt). All other shell options go in ~/.environment and  ~/.alias.
#



#
# If this is a non-interactive shell, exit. The rest of this file is loaded
# only for interactive shells.
#
# This file is only sourced for interactive shells

if [ -z "$PS1" ]; then
	return
fi

#
# Set tty options.
#
stty sane
stty erase '^?'
bindkey -e

#
# Prevent prorgrams from dumping core. zsh doesn't seem to have an option to
# exit after three Control-D's.
#
ulimit -c 0

#
# Load up zsh modules
#

autoload -U colors && colors
#autoload -U prompinit && promptinit

#
# Set the prompt.
#

PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}%% "



# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/eric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt extendedglob nomatch notify
# End of lines configured by zsh-newuser-install

setopt PUSHD_SILENT
set -C

source $HOME/.alias
source $HOME/.balias

if [[ -n $SCREENPATH ]] then
    PATH=$SCREENPATH;
    unset SCREENPATH
fi
