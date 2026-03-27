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

function fd
    if command -q fd
        command fd $argv
    else if command -q fdfind
        command fdfind $argv
    else
        echo "fd/fdfind not installed"
        return 1
    end
end

if not type -q bat
    if type -q batcat
        function bat
            batcat $argv
        end
    end
end

alias ls="eza -ll -a"
alias tree="eza --tree"
alias cat="bat"
zoxide init fish | source
direnv hook fish | source
