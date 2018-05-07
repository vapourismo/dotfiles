{
	allowUnfree = true;

	packageOverrides = {pkgs, ...}: {
		all = with pkgs; buildEnv {
			name = "all";

			paths = [
				# Desktop environment
				dmenu
				rxvt_unicode-with-plugins
				polybar
				bspwm
				sxhkd

				# Command-line utiliteis
				htop
				silver-searcher
				tmux
				tree

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
