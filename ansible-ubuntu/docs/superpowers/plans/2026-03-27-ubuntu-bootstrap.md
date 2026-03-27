# Ubuntu Bootstrap Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the Arch-specific workstation bootstrap in this repo with an Ubuntu 24.04.4 LTS bootstrap.

**Architecture:** Keep the existing role layout, but rewrite the distro-specific tasks in place. Use Ubuntu `apt` for package management, explicit `.deb` installs for third-party software, and remove the AUR role entirely.

**Tech Stack:** Ansible, systemd, apt, Ubuntu 24.04.4 LTS

---

### Task 1: Rewrite base provisioning

**Files:**
- Modify: `playbook.yml`
- Modify: `roles/base/tasks/main.yml`

- [ ] **Step 1: Remove the Arch-only role from the playbook**
- [ ] **Step 2: Replace mirror refresh and pacman tasks with apt cache and upgrade tasks**
- [ ] **Step 3: Replace Arch bootstrap packages with Ubuntu equivalents**
- [ ] **Step 4: Keep the sudoers provisioning task intact**

### Task 2: Rewrite package installation

**Files:**
- Modify: `group_vars/all.yml`
- Modify: `roles/packages/tasks/main.yml`
- Delete: `roles/aur/tasks/main.yml`

- [ ] **Step 1: Replace AUR variables with Ubuntu package variables**
- [ ] **Step 2: Translate Arch package names to Ubuntu package names**
- [ ] **Step 3: Add explicit installation for Google Chrome from the vendor `.deb` and Ghostty from its Ubuntu PPA**
- [ ] **Step 4: Remove the AUR bootstrap and install flow**

### Task 3: Rewrite service management

**Files:**
- Modify: `roles/services/tasks/main.yml`

- [ ] **Step 1: Remove the Arch-specific MariaDB initialization command**
- [ ] **Step 2: Keep Ubuntu systemd service enablement for the installed services**
- [ ] **Step 3: Drop uncertain VirtualBox service management rather than hard-coding an Arch unit name**

### Task 4: Verify the Ubuntu-only conversion

**Files:**
- Review: repository-wide grep results

- [ ] **Step 1: Search for remaining Arch-specific strings such as `pacman`, `yay`, `AUR`, and `reflector`**
- [ ] **Step 2: Run Ansible syntax validation if the toolchain exists locally**
- [ ] **Step 3: Summarize any unresolved package-name or environment limitations**

### Task 5: Add AI coding CLIs

**Files:**
- Modify: `playbook.yml`
- Modify: `group_vars/all.yml`
- Create: `roles/ai_tools/tasks/main.yml`

- [ ] **Step 1: Add a dedicated role that runs after Node provisioning**
- [ ] **Step 2: Define the npm package list for Claude Code, Codex, Gemini CLI, and OpenCode**
- [ ] **Step 3: Install the tools globally through the user-owned nvm Node environment**
