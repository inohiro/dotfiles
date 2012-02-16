ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

#RVM and git settings
# if [[ -s ~/.rvm/scripts/rvm ]] ; then 
#  RPS1='$(git_custom_status)%{$fg[red]%}[`~/.rvm/bin/rvm-prompt`]%{$reset_color%} $EPS1'
# else
  RPS1='$(git_custom_status) $EPS1'
# fi

# PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '

if expr $HOST : "inohiro-ng-mac.local" > /dev/null; then
  PROMPT="%{$fg[blue]%}%n@%m %{$fg[yellow]%}[%c]%{$fg[blue]%} %(!.#.$) %{$reset_color%}"
else
  PROMPT="%{${fg[blue]}%}%n%{${fg[yellow]}%}@%m %{${fg[yellow]}%}[%c]%{${fg[blue]}%} %(!.#.$) %{${reset_color}%}"
fi

# PROMPT2='%{$fg[red]%}[%d]%{$reset_color%}'
# RPS1="$(git_prompt_info)"
# RPS1="$(git_prompt_info)%{${fg[blue]}%}[%~]%{${reset_color}%}"

# bash style - http://blog.blueblack.net/item_207
# escapes - http://www.acm.uiuc.edu/workshops/zsh/prompt/escapes.html
