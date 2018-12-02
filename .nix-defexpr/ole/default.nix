let pkgs = import <nixpkgs> {};

	config = import ./config.nix {
		inherit (pkgs) bspwm rxvt_unicode;
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
		hsetroot
		dmenuLauncher
		dmenu
		bspwm
		bspwmrc
		sxhkd
		sxhkdrc

		# Command-line utilities
		jq
		htop
		silver-searcher
		tmux
		tree
		git

		# Editors
		vim

		# Haskell
		ghc
		cabal-install
		stack
		haskellPackages.hlint
		haskellPackages.hoogle
		haskellPackages.stylish-haskell
	];
}
