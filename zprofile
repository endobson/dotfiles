# Setup useful functions
# TODO put in all shells
pathappend () {
	if eval expr ":\$$1::" : ".*:$2:.*" >/dev/null 2>&1; then
		true;
	else
		eval $1=\$$1:$2;
	fi;
}
pathappendifdir () {
	if [ -d "$2" ]; then
		pathappend $*;
	fi;
}
pathprepend () {
	if eval expr ":\$$1::" : ".*:$2:.*" >/dev/null 2>&1; then
		true;
	else
		eval $1=$2:\$$1;
	fi;
}
pathprependifdir () {
	if [ -d "$2" ]; then
		pathprepend $*;
	fi;
}


# On OS X setup System provided paths
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

source $HOME/.environment.local
source $HOME/.environment
    


case $- in
*i*)    # interactive shell
    autoload -U colors && colors
    export PS1FRONT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%} %{$fg[green]%}("
    export PS1BACK=")%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}%% "
    export PS1MIDDLE=""
    export PROMPT=$PS1FRONT$PS1MIDDLE$PS1BACK 
    export RPS1="%{$fg[red]%}(%{$reset_color%}%{$fg[blue]%}%?%{$reset_color%}%{$fg[red]%})%{$reset_color%}"
;;
*)      # non-interactive shell
;;
esac	    
