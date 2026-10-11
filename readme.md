# ❄️ Nix Home Manager & Dotfiles

My personal development environment, managed declaratively using [Nix](https://nixos.org/) and [Home Manager](https://nix-community.github.io/home-manager/). 

This repository contains a standalone Home Manager flake currently driving my workflow on Arch Linux, but designed to be entirely cross-platform. It strictly isolates system-level packages from user-level developer tools, making it ready for a seamless migration to macOS.

## ✨ Features

* **Cross-Platform by Design:** Packages are cleanly separated. Base developer tools (Neovim, Tmux, Git, compilers) are cross-platform, while Linux-specific GUI tools (Qtile, Rofi, Picom) are automatically filtered out on other operating systems via `stdenv.isLinux`.
* **Out-of-Store Symlinking:** Configuration files in the `config/` directory are symlinked directly to `~/.config/` (instead of being copied to the immutable Nix store). This allows for live, on-the-fly editing without needing to rebuild the flake every time.
* **Lean & Fast:** Stripped of OS-level bloat, focusing purely on a productive, terminal-centric developer workflow.

## 📂 Repository Structure

* `flake.nix` - The entry point of the configuration.
* `home.nix` - User-specific settings, environment variables, and dotfile symlink routing.
* `pkgs.nix` - The master list of installed packages, separated by system architecture and type.
* `config/` - The actual application configuration files (Alacritty, Neovim, Qtile, Zsh, etc.).
* `flake.lock` - Locks the exact versions of the inputs (nixpkgs, home-manager) for reproducibility.

## 🚀 Installation & Setup

1. **Install Nix** (if not already installed):
   ```bash
   sh <(curl -L https://nixos.org/nix/install) --daemon
   ```

2. **Enable Flakes** (if not enabled by default):
   Add the following to `~/.config/nix/nix.conf` or `/etc/nix/nix.conf`:
   ```text
   experimental-features = nix-command flakes
   ```

3. **Clone the Repository:**
   ```bash
   git clone <your-repo-url> ~/nix
   cd ~/nix
   ```

4. **Apply the Configuration:**
   Run the following command. The `-b backup` flag ensures any existing dotfiles in your `~/.config` directory are safely backed up rather than overwritten or causing a conflict.
   ```bash
   nix run home-manager/master -- switch -b backup --flake .#hxt
   ```

## 🗺️ Roadmap

- [ ] Add `aarch64-darwin` configuration output for upcoming MacBook migration.
- [ ] Implement macOS-specific tiling via AeroSpace.