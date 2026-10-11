{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # --- Fonts ---
    nerd-fonts.jetbrains-mono poppins inter

    # --- Terminals & Browsers ---
    alacritty kitty
    brave qutebrowser

    # --- Editors & Notes ---
    emacs obsidian mermaid-cli

    # --- Media & Design ---
    ffmpeg yt-dlp mpv cava mpd mpc rmpc
    blender audacity gimp

    # --- File Management ---
    yazi lf ncdu

    # --- CLI Utils ---
    tealdeer wikiman fastfetch btop bat oh-my-posh eza pywal16
    nitch fortune cowsay figlet lolcat
    coreutils nix-output-monitor

    # --- Web / Search ---
    ddgr w3m buku

    # --- Dev Workflow ---
    lazygit lazydocker lazynpm tmux fzf zoxide stow

    # --- GPG / Passwords ---
    gpg-tui pass passExtensions.pass-otp gopass

    # --- Email ---
    neomutt mutt-wizard isync msmtp

    # --- Downloads & Sync ---
    aria2 rsync

    # --- Documents & Images ---
    imagemagick zbar ghostscript tectonic ueberzugpp

    # --- Time & Productivity ---
    clock-rs calcurse

    # --- Dev Languages & Tools ---
    nodejs_24 python315 hugo
    haskell-language-server luarocks lua-language-server tree-sitter
    cmake gnumake

    # --- Personal CLI Tools ---
    nushell vim wget unzip bc ripgrep fd
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    # --- Tiling WM & Linux GUI Utils ---
    qtile python3Packages.qtile-extras
    xmobar polybar rofi
    dunst libnotify
    lxappearance picom
    xwallpaper nitrogen hyprpaper swww

    # --- Linux-specific apps & System Utils ---
    thunar zathura
    kdePackages.kdenlive obs-studio flameshot maim
    varia localsend
    pam_gnupg pinentry-curses xclip
    pulseaudio brightnessctl kanata
  ];
}
