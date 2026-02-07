# mac-configs

Dotfiles and configuration for macOS, Linux, and Windows systems. Structured for easy symlinking via Ansible or manual setup.

## Repository Structure

```
├── dotfiles/              # Symlink target for $HOME configs
│   ├── .config/           # XDG config directory
│   │   ├── nvim/          # Neovim (LazyVim)
│   │   ├── fish/          # Fish shell
│   │   ├── ghostty/       # Ghostty terminal
│   │   ├── i3/            # i3 window manager (Linux)
│   │   ├── i3status/      # i3status bar (Linux)
│   │   ├── kitty/         # Kitty terminal
│   │   ├── mc/            # Midnight Commander
│   │   └── starship.toml  # Starship prompt
│   ├── .skhdrc            # skhd keybindings (macOS)
│   └── .yabairc           # yabai tiling WM (macOS)
│
├── windows/               # Windows-specific configs
│   └── komorebi/          # Komorebi tiling WM
│
├── scripts/               # Utility scripts
│   └── raycast/           # Raycast script commands
│
├── ansible/               # Ansible playbooks for setup automation
├── arch_linux/            # Arch Linux setup scripts
├── Brewfile               # Homebrew package bundle
└── Brewfile.lock.json
```

## Symlinking

### Option 1: Symlink entire .config

```bash
# Backup existing config
mv ~/.config ~/.config.bak

# Symlink
ln -sf ~/path/to/mac-configs/dotfiles/.config ~/.config
```

### Option 2: Symlink individual apps

```bash
ln -sf ~/path/to/mac-configs/dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/path/to/mac-configs/dotfiles/.config/fish ~/.config/fish
ln -sf ~/path/to/mac-configs/dotfiles/.config/kitty ~/.config/kitty
ln -sf ~/path/to/mac-configs/dotfiles/.config/starship.toml ~/.config/starship.toml

# macOS only
ln -sf ~/path/to/mac-configs/dotfiles/.skhdrc ~/.skhdrc
ln -sf ~/path/to/mac-configs/dotfiles/.yabairc ~/.yabairc
```

### Ansible Example

```yaml
- name: Symlink .config directory
  file:
    src: "{{ dotfiles_repo }}/dotfiles/.config"
    dest: "~/.config"
    state: link

- name: Symlink macOS dotfiles
  file:
    src: "{{ dotfiles_repo }}/dotfiles/{{ item }}"
    dest: "~/{{ item }}"
    state: link
  loop:
    - .skhdrc
    - .yabairc
  when: ansible_os_family == "Darwin"
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
