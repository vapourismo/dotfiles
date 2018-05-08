{
	allowUnfree = true;

	packageOverrides = {pkgs, ...}: {
		all = with pkgs; buildEnv {
			name = "all";

			paths = [
				# Desktop environment
				dmenu
				rxvt_unicode
				rxvt_unicode.terminfo
				polybar
				bspwm
				sxhkd

				# Command-line utilities
				htop
				silver-searcher
				tmux
				tree
				git

				# Editors
				vim
				sublime3

				# C/C++
				clang

				# Haskell
				ghc
				cabal-install
				stack
				haskellPackages.hlint
				haskellPackages.hoogle
				haskellPackages.stylish-haskell
			];
		};
	};
}
