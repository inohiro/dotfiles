alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias here='open .'
alias ls='ls -G'
alias mcs='gmcs'
alias ocaml='ledit ocaml'
alias tailf='tail -f'

[[ -s "/Users/inohiro/.rvm/scripts/rvm" ]] && source "/Users/inohiro/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PS1="\[\033[1;36m\]\u@\h \[\033[33m\][\W] \$\[\033[0m\] " # prompt color

PATH=$PATH:/usr/local/mysql/bin
PATH=/usr/local/bin:${PATH}
export PATH

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
