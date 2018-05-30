{
	allowUnfree = true;

	packageOverrides = {pkgs, ...}: {
		all = with pkgs; buildEnv {
			name = "all";

			paths = [
				bspwm
				sxhkd
				htop
				dmenu
				tmux
				git
				vim
				sublime3
				rxvt_unicode
				rxvt_unicode.terminfo
				ghc
				haskellPackages.hlint
				haskellPackages.hoogle
				haskellPackages.stylish-haskell
				cabal-install
				stack
			];
		};
	};
}
