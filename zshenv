if [ -z "$ZSHENVRUN" ]; then
# Bootstrap the CS department hooks. Uncomment 'hookdebug' to get debugging
# output on startup.
#

    if [ -f ~/.dotfiles/hook.sh ]; then
        . ~/.dotfiles/hook.sh
#       hookdebug
    else
        alias sourcehook=:
        alias sourcefile=:
        alias pathappend=:
        alias pathprepend=:
    fi

#
# Source various environment hooks.
#
    sourcehook osdetect
    sourcehook basepath; sourcehook basemanpath
    sourcehook ospath; sourcehook osmanpath

#
# Load personal environment and umask settings.
#
    source $HOME/.environment.local
    source $HOME/.environment


#
# Set the prompt.
#
#if [ -z "$PS1" ]; thend


#
# Source 'system' hook.
#
    sourcehook system           
    export ZSHENVRUN=run
fi

if [ -z "$ZSHIENVRUN" ]; then

    case $- in
    *i*)    # interactive shell
        autoload -U colors && colors
        export PS1FRONT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %{$fg[green]%}("
        export PS1BACK=")%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}%% "
        export PS1MIDDLE=""
        export PS1=$PS1FRONT$PS1MIDDLE$PS1BACK 
        export RPS1="%{$fg[red]%}(%{$reset_color%}%{$fg[blue]%}%?%{$reset_color%}%{$fg[red]%})%{$reset_color%}"
        export ZSHIENVRUN=run
    ;;
    *)      # non-interactive shell
    ;;
    esac	    

fi
