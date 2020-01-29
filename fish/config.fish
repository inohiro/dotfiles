# -- general -------------------------------------------

set -x EDITOR emacs

# -- fzf -----------------------------------------------

set -x FZF_DEFAULT_OPTS "--reverse"

# -- git -----------------------------------------------
# https://github.com/oh-my-fish/oh-my-fish/tree/master/lib/git

function git_is_repo -d "Check if directory is a repository"
  test -d .git; or command git rev-parse --git-dir >/dev/null ^/dev/null
  end

function git_is_repo -d "Check if directory is a repository"
  test -d .git; or command git rev-parse --git-dir >/dev/null ^/dev/null
end

function git_is_stashed -d "Check if repo has stashed contents"
  git_is_repo; and begin
    command git rev-parse --verify --quiet refs/stash >/dev/null
  end
end

function git_is_touched -d "Check if repo has any changes"
  git_is_repo; and begin
    test -n (echo (command git status --porcelain))
  end
end

function git_ahead -a ahead behind diverged none
  not git_is_repo; and return

  set -l commit_count (command git rev-list --count --left-right "@{upstream}...HEAD" ^/dev/null)

  switch "$commit_count"
  case ""
    # no upstream
  case "0"\t"0"
    test -n "$none"; and echo "$none"; or echo ""
  case "*"\t"0"
    test -n "$behind"; and echo "$behind"; or echo "-"
  case "0"\t"*"
    test -n "$ahead"; and echo "$ahead"; or echo "+"
  case "*"
    test -n "$diverged"; and echo "$diverged"; or echo "±"
  end
end

set -g simple_ass_prompt_greeting ''

alias be 'bundle exec '
alias tailf 'tail -f '
