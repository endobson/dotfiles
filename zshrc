unsetopt bgnice

if [[ -o interactive ]]; then
	#don't return
else
    return
fi

# Set tty options.
stty sane
stty erase '^?'

#Set up vi keybindings for dvorak
bindkey "^P" up-line-or-history
bindkey "^N" down-line-or-history
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey "^B" vi-backward-char
bindkey "^R" history-incremental-search-backward
bindkey "^G" vi-cmd-mode
bindkey -a "h" down-history
bindkey -a "t" up-history
bindkey -a "d" backward-char
bindkey -a "n" forward-char
bindkey -a "J" vi-kill-eol
bindkey -a "jj" kill-whole-line

# Prevent prorgrams from dumping core.
ulimit -c 0



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
# make bazel completion faster
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# Add local completion directory
fpath[1,0]=~/.zsh/completion/

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd noclobber prompt_subst
unsetopt extendedglob nomatch notify

#Load up aliases
source $HOME/.alias.local
source $HOME/.alias

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
