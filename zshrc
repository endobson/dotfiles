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

#autoload -U prompinit && promptinit




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
setopt appendhistory autocd noclobber
unsetopt extendedglob nomatch notify
# End of lines configured by zsh-newuser-install

if [ -f /etc/hook.sh ]; then
        . /etc/hook.sh
#       hookdebug
else
        alias sourcehook=:
        alias sourcefile=:
        alias pathappend=:
        alias pathprepend=:
fi


#Load up aliases

source $HOME/.alias
source $HOME/.balias.local
source $HOME/.balias

function cs51 () {
 (
 cd ~/course/cs51
 zsh
 )
}

function cs31 () {
 (
 pathappend PATH /course/cs031/bin
 cd ~/course/cs31
 zsh
 )
}

function cs173 () {
 (
 pathappend PATH /course/cs173/bin
 pathappend PATH /course/cs173/plt/bin
 cd ~/course/cs173
 zsh
 )
}

function cs18 () {
 (
 cd /course/cs018
 umask 007 
 pathappend PATH /course/cs018/bin
 pathappend PATH /course/cs018/tabin
 zsh
 )
}

function cs17 () {
 (
 ((SHLVL++))
 PS1MIDDLE=$PS1MIDDLE"17"
 PS1=$PS1FRONT$PS1MIDDLE$PS1BACK 
 cd /course/cs017
 umask 007 
 pathappend PATH /course/cs017/bin
 pathappend PATH /course/cs017/tabin
 exec zsh
 )
}


