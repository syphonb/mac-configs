# 🛠 Arch System Reproduction Guide

This repository contains a **Meta-Package** that defines the entire software state of this Arch Linux setup.

## 🗂 File Structure

- `setup.sh`: The master script to automate the entire build.
- `PKGBUILD`: The list of all software/apps.
- `my-setup.install`: Commands to enable system services (Bluetooth, Docker, etc.).

---

## 🚀 How to Restore on a Fresh Install

Once you have a fresh Arch "base" install and internet access:

1. **Clone your repo:**
   ```bash
   git clone [hhttps://github.com/syphonb/mac-configs.git](https://github.com/syphonb/mac-configs.git)
   cd your-dotfiles
   ```
2. **Run the wrapper:**

```bash
    chmod +x setup.sh
    ./setup.sh
```

## Manual Method

To run the build without the wrapper setup script

1. **Install prerequisites:**

```bash
   sudo pacman -S --needed base-devel
```

2. **Goto the package folder:**

```bash
    cd arch_linux
```

3. **Run makepkg:**

```bash
  makepkg -si
```

## How to update your system or packages

When you want to add or remove software:

1. Edit the `depends=(...)` list in the `PKGBUILD`
2. **Cruicial** Increment the `pkgver` (e.g., 1.0 to 1.1) in the `PKGBUILD`
3. Run `makepkg -si` again
4. To remove old apps you deleted from the list, run:

```bash
  sudo pacman -Rs $(pacman -Qtdq)
```
