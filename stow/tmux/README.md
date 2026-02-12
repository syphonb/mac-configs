# Tmux Configuration

## Installation with GNU Stow

From the root of this repo, run:

```bash
stow -d stow -t ~ tmux
```

This symlinks `stow/tmux/.tmux.conf` to `~/.tmux.conf`.

To unlink:

```bash
stow -d stow -t ~ -D tmux
```

### Install TPM (Tmux Plugin Manager)

The config relies on TPM. Install it first if you haven't:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then open tmux and press `prefix + I` to install all plugins.

## What This Config Does

### General Settings

- **Scrollback history** set to 100,000 lines
- **True color support** via `tmux-256color` terminal and `Tc` override
- **Zero escape time** for instant key response (no delay after pressing Escape)
- **Mouse support** enabled for scrolling, pane selection, and resizing

### Window & Pane Numbering

- Windows and panes start at **index 1** instead of 0
- Windows **auto-rename** to the currently running command

### Status Bar

- Positioned at the **top** of the screen
- Themed with **Dracula** showing CPU usage, git branch, and session name

### Plugins

| Plugin | Purpose |
|---|---|
| **tmux-sensible** | Sensible default settings |
| **tpm** | Tmux Plugin Manager |
| **tmux-resurrect** | Save and restore tmux sessions across restarts |
| **tmux-continuum** | Automatic saving/restoring of sessions (auto-restore enabled) |
| **dracula/tmux** | Dracula color theme for the status bar |
| **vim-tmux-navigator** | Seamless navigation between tmux panes and Vim splits |
| **tmux-yank** | Copy text to system clipboard |

## Key Shortcuts

The default prefix is `Ctrl + b`.

### Core Tmux

| Shortcut | Action |
|---|---|
| `prefix + c` | Create new window |
| `prefix + n` / `prefix + p` | Next / previous window |
| `prefix + 1-9` | Switch to window by number |
| `prefix + ,` | Rename current window |
| `prefix + %` | Split pane vertically |
| `prefix + "` | Split pane horizontally |
| `prefix + x` | Close current pane |
| `prefix + d` | Detach from session |
| `prefix + s` | List sessions |
| `prefix + z` | Toggle pane zoom (fullscreen) |
| `prefix + [` | Enter copy mode (scroll/search) |

### Vim-Tmux Navigator

Move between tmux panes and Vim splits seamlessly:

| Shortcut | Action |
|---|---|
| `Ctrl + h` | Move left |
| `Ctrl + j` | Move down |
| `Ctrl + k` | Move up |
| `Ctrl + l` | Move right |
| `Ctrl + \` | Move to previous pane |

### Tmux Resurrect & Continuum

| Shortcut | Action |
|---|---|
| `prefix + Ctrl + s` | Save session |
| `prefix + Ctrl + r` | Restore session |

Sessions are also **automatically saved and restored** by tmux-continuum.

### Tmux Yank (Copy Mode)

Enter copy mode with `prefix + [`, then:

| Shortcut | Action |
|---|---|
| `y` | Copy selection to system clipboard |
| `Y` | Copy selection and paste it to the command line |

### TPM Plugin Management

| Shortcut | Action |
|---|---|
| `prefix + I` | Install plugins |
| `prefix + U` | Update plugins |
| `prefix + alt + u` | Uninstall plugins not in config |

### Reload Config

```bash
tmux source-file ~/.tmux.conf
```

Or from inside tmux:

| Shortcut | Action |
|---|---|
| `prefix + r` | Reload config (provided by tmux-sensible) |
