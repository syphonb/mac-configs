fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /Users/andrew/miniconda3/bin

set -g fish_greeting
set -gx EDITOR nvim

starship init fish | source
fzf --fish | source
thefuck --alias | source

alias ls="eza -ll -a"
alias tree="eza --tree"
alias cat="bat"
zoxide init fish | source
direnv hook fish | source
