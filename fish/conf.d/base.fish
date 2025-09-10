# Revert Ctrl+C to behave like it did in older fish versions (and bash)
bind \cc __fish_cancel_commandline

alias reload_fish_config 'source ~/.config/fish/config.fish'
alias be 'bundle exec '
alias tailf 'tail -f '
alias tf 'terraform'

set -x EDITOR "emacs"
set -x FZF_DEFAULT_OPTS "--reverse"
