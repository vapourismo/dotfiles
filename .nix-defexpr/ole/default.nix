let pkgs = import <nixpkgs> {};

	bspwmrc = import ./bspwmrc.nix {
		inherit (pkgs) stdenv writeText bspwm;

		normalBorderColor   = "#2F343F";
		activeBorderColor   = "#2F343F";
		focusedBorderColor  = "#4084D6";
		preselFeedbackColor = "#4084D6";
	};

	bspc = "${pkgs.bspwm}/bin/bspc";

	sxhkdrc = import ./sxhkdrc.nix {
		inherit (pkgs) stdenv writeText;
		bindings = with pkgs; [
			{key = "alt + Tab";             command = "${bspc} node -f last.local";}
			{key = "super + 1";             command = "${bspc} desktop -f ^2:^1 && ${bspc} desktop -f ^1:^1";}
			{key = "super + 2";             command = "${bspc} desktop -f ^2:^2 && ${bspc} desktop -f ^1:^2";}
			{key = "super + 3";             command = "${bspc} desktop -f ^2:^3 && ${bspc} desktop -f ^1:^3";}
			{key = "super + 4";             command = "${bspc} desktop -f ^2:^4 && ${bspc} desktop -f ^1:^4";}
			{key = "super + alt + Down";    command = "${bspc} node @south -r +20";}
			{key = "super + alt + Left";    command = "${bspc} node @west -r -20";}
			{key = "super + alt + Right";   command = "${bspc} node @east -r +20";}
			{key = "super + alt + Up";      command = "${bspc} node @north -r -20";}
			{key = "super + b";             command = "${bspc} node @focused:/ -B";}
			{key = "super + BackSpace";     command = "${bspc} node -p cancel";}
			{key = "super + ctrl + Down";   command = "${bspc} node -p south";}
			{key = "super + ctrl + Left";   command = "${bspc} node -p west";}
			{key = "super + ctrl + Right";  command = "${bspc} node -p east";}
			{key = "super + ctrl + Up";     command = "${bspc} node -p north";}
			{key = "super + Down";          command = "${bspc} node -f south || ${bspc} monitor -f south";}
			{key = "super + Escape";        command = "pkill -USR1 -x sxhkd";}
			{key = "super + f";             command = "${bspc} node -t '~floating'";}
			{key = "super + g";             command = "${bspc} node @focused:/ -R 90";}
			{key = "super + i";             command = "chromium";}
			{key = "super + Left";          command = "${bspc} node -f west || ${bspc} monitor -f west";}
			{key = "super + m";             command = "${bspc} desktop -l next";}
			{key = "super + r";             command = "/home/ole/.local/bin/dmenu";}
			{key = "super + Return";        command = "${rxvt_unicode}/bin/urxvt";}
			{key = "super + Right";         command = "${bspc} node -f east || ${bspc} monitor -f east";}
			{key = "super + shift + 1";     command = "${bspc} node -d focused:^1";}
			{key = "super + shift + 2";     command = "${bspc} node -d focused:^2";}
			{key = "super + shift + 3";     command = "${bspc} node -d focused:^3";}
			{key = "super + shift + 4";     command = "${bspc} node -d focused:^4";}
			{key = "super + shift + Down";  command = "${bspc} node -n south || ${bspc} node -m south";}
			{key = "super + shift + f";     command = "${bspc} node -t '~fullscreen'";}
			{key = "super + shift + Left";  command = "${bspc} node -n west || ${bspc} node -mq west";}
			{key = "super + shift + Right"; command = "${bspc} node -n east || ${bspc} node -m east";}
			{key = "super + shift + Up";    command = "${bspc} node -n north || ${bspc} node -m north";}
			{key = "super + Tab";           command = "${bspc} monitor -f last";}
			{key = "super + Up";            command = "${bspc} node -f north || ${bspc} monitor -f north";}
			{key = "super + w";             command = "${bspc} node -c";}
		];
	};

in pkgs.buildEnv {
	name = "ole";

	paths = with pkgs; [
		# Desktop environment
		rxvt_unicode
		rxvt_unicode.terminfo
		vlc
		hsetroot
		dmenu
		bspwm
		bspwmrc
		sxhkd
		sxhkdrc
		compton

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
