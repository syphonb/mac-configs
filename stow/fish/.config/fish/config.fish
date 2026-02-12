fish_add_path ~/.local/bin

set -g fish_greeting
set -gx EDITOR nvim

# macOS
if test (uname) = Darwin
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/opt/ruby/bin
    fish_add_path ~/miniconda3/bin
end

# Linux
if test (uname) = Linux
    fish_add_path /home/syphonb/.opencode/bin
end

starship init fish | source
fzf --fish | source
thefuck --alias | source

alias ls="eza -ll -a"
alias tree="eza --tree"
alias cat="bat"
zoxide init fish | source
direnv hook fish | source
