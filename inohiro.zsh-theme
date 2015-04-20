if expr $HOST : "inohiro-ng-mac.local" > /dev/null; then
   PROMPT=$'%{$fg[green]%}%n@%m %{$fg[blue]%}%D{[%H:%M:%S]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info) \
%{$fg[blue]%}->%{$fg[blue]%} %(!.#.$)%{$reset_color%} '
else
   PROMPT=$'%{$fg[green]%}%n@%{$fg[red]%}%m %{$fg[blue]%}%D{[%H:%M:%S]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info) \
%{$fg[blue]%}->%{$fg[blue]%} %(!.#.$)%{$reset_color%} '
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

### my settings ###

## basic

export LANG=ja_JP.UTF-8
export EDITOR="emacs"
export LESS="-R"

## aliases

alias zshconfig="emacs ~/.zshrc"
alias zshreload="source ~/.zshrc"

alias gst="git status -sb"
alias lns="ln -s"
alias gst="git st"
alias g="git"

alias diff='colordiff'
alias lv='lv -c'

if [[ "${OSTYPE}" = darwin* ]] ; then
   alias mysqld_start="sudo /Library/StartupItems/MySQLCOM/MySQLCOM start"
   alias mysqld_stop="sudo /Library/StartupItems/MySQLCOM/MySQLCOM stop"
   alias mysqld_restart="sudo /Library/StartupItems/MySQLCOM/MySQLCOM restart"

   alias tomcat_start="sudo /Library/Tomcat/bin/startup.sh"
   alias tomcat_stop="sudo /Library/Tomcat/bin/shutdown.sh"
   alias tomcat_restart="tomcat_stop && tomcat_start"

   alias tailf="tail -f"
   alias here="open ."
   alias sha1="openssl sha1"
fi

if [[ "${OSTYPE}" = linux* ]] ; then
   alias mem_free="sudo sysctl -w vm.drop_caches=3"
   alias aptitude="nocorrect aptitude"
   alias mysql="nocorrect mysql"
   alias sudo="nocorrect sudo"
fi

## Functions

### Syntax highlighting with GNU Source-highlight

function lvc() {
    file="$1"
    shift
    hl "$file" | lv -c
}

## Search

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

## history

HISTFILE=~/.zsh_history           # history file location
HISTSIZE=100000                   # history file size (memory)
SAVEHIST=100000                   # history entries (file)
setopt hist_ignore_dups           # ignore saving duplicated
setopt hist_reduce_blanks         # remote spaces
# setopt share_history              # share history file
setopt EXTENDED_HISTORY           # save start and end of zsh
