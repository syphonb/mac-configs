# Ubuntu 24.04 Workstation Bootstrap Design

## Goal

Convert this Ansible setup from an Arch Linux workstation bootstrap into an Ubuntu 24.04.4 LTS workstation bootstrap while keeping the existing role structure small and easy to maintain.

## Scope

- Remove all Arch-specific provisioning logic.
- Replace `pacman` and AUR flows with Ubuntu `apt` and explicit third-party `.deb` installs.
- Keep portable roles such as `node` and `dotfiles` unless Ubuntu requires a targeted adjustment.
- Preserve the current developer-workstation intent: desktop packages, services, Node tooling, and local dotfile setup.

## Design

### Playbook structure

The top-level playbook remains role-oriented with `base`, `packages`, `node`, `ai_tools`, `services`, and `dotfiles`. The `aur` role is removed entirely because the repo is now Ubuntu-only.

### Base provisioning

The `base` role will stop managing Arch mirrors and `reflector`. It will instead:

- refresh the apt cache
- upgrade installed packages with `apt`
- install Ubuntu bootstrap packages needed by later roles
- keep the sudoers drop-in for the development user

### Package installation

The `packages` role will switch from hard-coded `pacman` names to a variable-driven Ubuntu package list. Package names will be translated to Ubuntu 24.04 equivalents where they exist.

Packages that were Arch/AUR-only or not clearly available on Ubuntu will be removed rather than left broken. Third-party software that still matters will be handled explicitly: Google Chrome via vendor `.deb`, and Ghostty via its Ubuntu community PPA.

### Services

The `services` role will manage Ubuntu systemd units for the installed packages. MariaDB initialization will no longer call the Arch-specific bootstrap command because Ubuntu packages initialize the data directory during package installation.

### Node and dotfiles

The `node` and `dotfiles` roles remain in place. Their logic is already mostly distro-agnostic, assuming the Ubuntu package layer provides required tools such as `curl`, `fish`, and `stow`.

### AI coding tools

A dedicated `ai_tools` role will install terminal AI tools that depend on Node after `nvm` has provisioned the default runtime. The initial toolset is Claude Code, Codex, Gemini CLI, and OpenCode, installed as global npm packages for the development user so they are available in the shell without extra configuration.

## Verification

- confirm there are no remaining references to `pacman`, `yay`, `AUR`, or `reflector`
- review the package and service names for Ubuntu 24.04 compatibility
- run Ansible syntax validation if `ansible-playbook` is available in the environment
