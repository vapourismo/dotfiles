let
  pkgs = import <nixpkgs> {};

  config = import ./config.nix {
    inherit (pkgs) bspwm rxvt_unicode firefox hsetroot;
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

  selectGhc = record: record.ghc8102;

  localGhc = selectGhc pkgs.haskell.compiler;

  localHaskellPackages = selectGhc pkgs.haskell.packages;

in pkgs.buildEnv {
  name = "ole";

  paths = with pkgs; [
    # Desktop environment
    rxvt_unicode
    rxvt_unicode.terminfo
    # vlc
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
    xorg.xmodmap
    spotify

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
    ansible
    graphviz
    xdot

    # Containers
    docker
    kubectl
    helm

    # Editors
    vim
    sublime3
    vscode

    # Haskell
    localGhc
    localHaskellPackages.cabal-install
    localHaskellPackages.ghcid
    localHaskellPackages.ghcide
    localHaskellPackages.hlint
    localHaskellPackages.hoogle
    localHaskellPackages.stylish-haskell
    localHaskellPackages.ormolu
    localHaskellPackages.floskell
    localHaskellPackages.weeder
    localHaskellPackages.graphmod
    localHaskellPackages.haskell-language-server
  ];
}
