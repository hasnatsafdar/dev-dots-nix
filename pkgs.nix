{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # --- Fonts ---
    nerd-fonts.jetbrains-mono # poppins inter

    # --- Web / Search ---
    # brave qutebrowser
    ddgr w3m buku

    # --- Editors & Notes ---
    # emacs obsidian # mermaid-cli

    # --- Media & Design ---
    ffmpeg yt-dlp mpv cava # mpd mpc rmpc
    # blender audacity gimp

    # --- File Management ---
    yazi ncdu

    # --- CLI Utils ---
    tealdeer wikiman fastfetch btop bat oh-my-posh eza
    nitch figlet lolcat
    coreutils nix-output-monitor

    # --- Dev Workflow ---
    lazygit lazydocker tmux fzf zoxide stow
    lazynpm

    # --- GPG / Passwords ---
    # gpg-tui pass passExtensions.pass-otp gopass

    # --- Email ---
    # neomutt mutt-wizard isync msmtp

    # --- Downloads & Sync ---
    aria2 rsync

    # --- Documents & Images ---
    # imagemagick zbar ghostscript tectonic ueberzugpp

    # --- Time & Productivity ---
    clock-rs calcurse

    # --- Dev Languages & Tools ---
    nodejs_24 python315 hugo
    # luarocks lua-language-server tree-sitter
    cmake gnumake

    # --- Personal CLI Tools ---
  #   nushell vim wget unzip bc ripgrep fd
  # ] ++ lib.optionals pkgs.stdenv.isLinux [
    # --- Tiling WM & Linux GUI Utils ---
    # qtile python3Packages.qtile-extras
    # polybar rofi
    # dunst libnotify
    # lxappearance picom
    # xwallpaper nitrogen

    # --- Linux-specific apps & System Utils ---
    # pywal16
    # kitty
    # thunar
    zathura
    # kdePackages.kdenlive obs-studio # flameshot maim
    varia localsend
    kanata
    # pam_gnupg pinentry-curses xclip
    # pulseaudio brightnessctl 
  ];
}
