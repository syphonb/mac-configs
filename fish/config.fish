fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/ruby/bin

set -g fish_greeting

starship init fish | source

alias ls="eza"
alias tree="eza --tree"
