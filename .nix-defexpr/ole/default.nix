let pkgs = import <nixpkgs> {};

	bspwmrc = import ./bspwmrc.nix {
		inherit (pkgs) stdenv writeText bspwm;
	};

in pkgs.buildEnv {
	name = "ole";

	paths = with pkgs; [
		# Desktop environment
		rxvt_unicode
		rxvt_unicode.terminfo
		vlc
		hsetroot

		bspwm
		bspwmrc

		# Command-line utilities
		htop
		silver-searcher
		tmux
		tree
		git

		# Editors
		vim
		sublime3

		# Haskell
		ghc
		cabal-install
		stack
		haskellPackages.hlint
		haskellPackages.hoogle
		haskellPackages.stylish-haskell
	];
}
