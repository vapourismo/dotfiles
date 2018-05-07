{
	allowUnfree = true;

	packageOverrides = {pkgs, ...}: {
		all = with pkgs; buildEnv {
			name = "all";

			paths = [
				vim
				lua
				sublime3
				ghc
				cabal-install
				stack
			];
		};
	};
}
