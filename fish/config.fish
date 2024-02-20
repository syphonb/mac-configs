fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/ruby/bin

set -g fish_greeting
set -gx EDITOR nvim

starship init fish | source

alias ls="eza"
alias tree="eza --tree"
