{
	allowUnfree = true;

	packageOverrides = {pkgs, ...}: {
		all-ole = with pkgs; buildEnv {
			name = "all-ole";

			paths = [
				# Desktop environment
				dmenu
				rxvt_unicode
				rxvt_unicode.terminfo
				bspwm
				sxhkd
				(import ./polybar.nix)
				vlc
				hsetroot
				xorg.setxkbmap
				xorg.xmodmap
				xorg.xrdb
				xorg.xset
				xorg.xinput
				xorg.xrandr
				xorg.xbacklight

				# Command-line utilities
				htop
				silver-searcher
				tmux
				tree
				git
				gnumake
				cmake

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
