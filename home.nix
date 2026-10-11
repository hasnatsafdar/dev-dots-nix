{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nix/config";
  mkSymlink = config.lib.file.mkOutOfStoreSymlink;

  # Directories symlinked into ~/.config/
  configs = {
    alacritty = "alacritty";
    aria2     = "aria2";
    btop      = "btop";
    cava      = "cava";
    # dunst     = "dunst";
    fastfetch = "fastfetch";
    # kitty     = "kitty";
    # nushell   = "nushell";
    nvim      = "nvim";
    ohmyposh  = "ohmyposh";
    # picom     = "picom";
    # qtile     = "qtile";
    # rofi      = "rofi";
    tmux      = "tmux";
    yazi      = "yazi";
    zathura   = "zathura";
    zsh       = "zsh";
  };
in
{
  home.username = "hxt";
  home.homeDirectory = "/home/hxt";
  home.stateVersion = "26.05";

  # =========================================================================
  # DOTFILES
  # =========================================================================

  xdg.configFile = builtins.mapAttrs
    (_name: subpath: {
      source    = mkSymlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  # =========================================================================
  # ENVIRONMENT & PROGRAMS
  # =========================================================================

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.git.settings = {
    enable    = true;
    userName  = "hasnatsafdar";
    userEmail = "hasnat.professional@gmail.com";
  };

  programs.home-manager.enable = true;
}
