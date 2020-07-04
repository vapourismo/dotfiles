let pkgs = import <nixpkgs> {};

    config = import ./config.nix {
      inherit (pkgs) bspwm rxvt_unicode firefox;
      inherit dmenuLauncher;
    };

    bspwmrc = import ./bspwmrc.nix (
      { inherit (pkgs) stdenv writeText bspwm; } // config.bspwmrc
    );

    sxhkdrc = import ./sxhkdrc.nix (
      { inherit (pkgs) stdenv writeText; } // config.sxhkdrc
    );

    dmenuLauncher = import ./dmenu-launcher.nix (
      { inherit (pkgs) stdenv writeText dmenu bspwm; } // config.dmenuLauncher
    );

in pkgs.buildEnv {
  name = "ole";

  paths = with pkgs; [
    # Desktop environment
    rxvt_unicode
    rxvt_unicode.terminfo
    vlc
    firefox
    hsetroot
    dmenuLauncher
    dmenu
    bspwmrc
    sxhkdrc
    discord
    gcolor2
    gimp
    pavucontrol
    scrot

    # Steam
    steam-run-native
    steam

    # Themes
    arc-theme
    arc-icon-theme

    # Command-line utilities
    jq
    htop
    silver-searcher
    tmux
    tree
    git
    binutils
    taskell
    calc
    whois
    bind
    unzip
    feh
    wget
    curl
    killall

    # Containers
    docker
    kubectl
    helm

    # Editors
    vim
    sublime3
    vscode

    # Haskell
    ghc
    cabal-install
    haskellPackages.ghcid
    haskellPackages.ghcide
    haskellPackages.hlint
    haskellPackages.hoogle
    haskellPackages.stylish-haskell
  ];
}
