# mac-configs

Dotfiles and configuration for macOS, Linux, and Windows systems. Managed with [GNU Stow](https://www.gnu.org/software/stow/) for easy symlinking.

## Repository Structure

```
├── stow/                  # Stow packages (each mirrors $HOME structure)
│   ├── nvim/              # Neovim (LazyVim)
│   │   └── .config/nvim/
│   ├── fish/              # Fish shell
│   │   └── .config/fish/
│   ├── ghostty/           # Ghostty terminal
│   │   └── .config/ghostty/
│   ├── i3/                # i3 window manager (Linux)
│   │   └── .config/i3/
│   ├── i3status/          # i3status bar (Linux)
│   │   └── .config/i3status/
│   ├── kitty/             # Kitty terminal
│   │   └── .config/kitty/
│   ├── mc/                # Midnight Commander
│   │   └── .config/mc/
│   ├── starship/          # Starship prompt
│   │   └── .config/starship.toml
│   ├── yabai/             # yabai tiling WM (macOS)
│   │   └── .yabairc
│   └── skhd/              # skhd keybindings (macOS)
│       └── .skhdrc
│
├── windows/               # Windows-specific configs
│   └── komorebi/          # Komorebi tiling WM
│
├── scripts/               # Utility scripts
│   └── raycast/           # Raycast script commands
│
├── ansible/               # Ansible playbooks
├── arch_linux/            # Arch Linux setup scripts
├── Brewfile               # Homebrew bundle
└── Brewfile.lock.json
```

## Using GNU Stow

### Install Stow

```bash
# macOS
brew install stow

# Arch Linux
sudo pacman -S stow

# Ubuntu/Debian
sudo apt install stow
```

### Stow Individual Packages

```bash
cd ~/path/to/mac-configs/stow

# Stow specific apps
stow nvim        # Creates ~/.config/nvim → stow/nvim/.config/nvim
stow fish        # Creates ~/.config/fish → stow/fish/.config/fish
stow yabai       # Creates ~/.yabairc → stow/yabai/.yabairc

# Stow multiple at once
stow nvim fish kitty starship
```

### Stow All Packages

```bash
cd ~/path/to/mac-configs/stow
stow */
```

### Unstow (Remove Symlinks)

```bash
cd ~/path/to/mac-configs/stow
stow -D nvim     # Removes ~/.config/nvim symlink
stow -D */       # Remove all symlinks
```

### Simulate (Dry Run)

```bash
stow --simulate nvim   # Shows what would happen without making changes
```

### Ansible Integration

```yaml
- name: Clone dotfiles
  git:
    repo: https://github.com/syphonb/mac-configs.git
    dest: "{{ ansible_env.HOME }}/mac-configs"

- name: Stow dotfiles packages
  command: stow {{ item }}
  args:
    chdir: "{{ ansible_env.HOME }}/mac-configs/stow"
  loop:
    - nvim
    - fish
    - kitty
    - starship
    # Add more packages as needed
```

## Installing Apps from Brewfile

```bash
cd /path/to/mac-configs
brew bundle
```

## macOS System Tweaks

### Dock Adjustments

```bash
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock
```

### Key Repeat Settings

```bash
defaults write -g InitialKeyRepeat -int 14
defaults write -g KeyRepeat -int 4
defaults write -g ApplePressAndHoldEnabled -bool false
```
