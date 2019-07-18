let pkgs = import <nixpkgs> {};

	bspwmrc = import ./bspwmrc.nix {
		inherit (pkgs) stdenv writeText bspwm;
	};

	sxhkdrc = import ./sxhkdrc.nix {
		inherit (pkgs) stdenv writeText;
		bindings = [
			{key = "super + g";             command = "bspc node @focused:/ -R 90";}
			{key = "super + m";             command = "bspc desktop -l next";}
			{key = "super + b";             command = "bspc node @focused:/ -B";}
			{key = "super + 1";             command = "bspc desktop -f 1";}
			{key = "super + 2";             command = "bspc desktop -f 2";}
			{key = "super + 3";             command = "bspc desktop -f 3";}
			{key = "super + 4";             command = "bspc desktop -f 4";}
			{key = "super + Tab";           command = "bspc desktop -f last";}
			{key = "alt + Tab";             command = "bspc node -f last.local";}
			{key = "super + shift + 1";     command = "bspc node -d 1";}
			{key = "super + shift + 2";     command = "bspc node -d 2";}
			{key = "super + shift + 3";     command = "bspc node -d 3";}
			{key = "super + shift + 4";     command = "bspc node -d 4";}
			{key = "super + Left";          command = "bspc node -f west";}
			{key = "super + Right";         command = "bspc node -f east";}
			{key = "super + Up";            command = "bspc node -f north";}
			{key = "super + Down";          command = "bspc node -f south";}
			{key = "super + shift + Left";  command = "bspc node -n west";}
			{key = "super + shift + Right"; command = "bspc node -n east";}
			{key = "super + shift + Up";    command = "bspc node -n north";}
			{key = "super + shift + Down";  command = "bspc node -n south";}
			{key = "super + ctrl + Left";   command = "bspc node -p west";}
			{key = "super + ctrl + Right";  command = "bspc node -p east";}
			{key = "super + ctrl + Up";     command = "bspc node -p north";}
			{key = "super + ctrl + Down";   command = "bspc node -p south";}
			{key = "super + alt + Left";    command = "bspc node @west -r -20";}
			{key = "super + alt + Right";   command = "bspc node @east -r +20";}
			{key = "super + alt + Up";      command = "bspc node @north -r -20";}
			{key = "super + alt + Down";    command = "bspc node @south -r +20";}

			{key = "super + h";          command = "bspc node -f west";}
			{key = "super + l";         command = "bspc node -f east";}
			{key = "super + k";            command = "bspc node -f north";}
			{key = "super + j";          command = "bspc node -f south";}
			{key = "super + shift + h";  command = "bspc node -n west";}
			{key = "super + shift + l"; command = "bspc node -n east";}
			{key = "super + shift + k";    command = "bspc node -n north";}
			{key = "super + shift + j";  command = "bspc node -n south";}
			{key = "super + ctrl + h";   command = "bspc node -p west";}
			{key = "super + ctrl + l";  command = "bspc node -p east";}
			{key = "super + ctrl + k";     command = "bspc node -p north";}
			{key = "super + ctrl + j";   command = "bspc node -p south";}
			{key = "super + alt + h";    command = "bspc node @west -r -20";}
			{key = "super + alt + l";   command = "bspc node @east -r +20";}
			{key = "super + alt + k";      command = "bspc node @north -r -20";}
			{key = "super + alt + j";    command = "bspc node @south -r +20";}

			{key = "super + BackSpace";     command = "bspc node -p cancel";}
			{key = "super + w";             command = "bspc node -c";}
			{key = "super + f";             command = "bspc node -t '~floating'";}
			{key = "super + shift + f";     command = "bspc node -t '~fullscreen'";}
			{key = "super + Return";        command = "urxvt";}
			{key = "super + i";             command = "chromium";}
			{key = "super + r";             command = "/home/ole/.local/bin/dmenu";}
			{key = "super + l";             command = "/usr/bin/i3lock-ole";}
			{key = "XF86MonBrightnessUp";   command = "xbacklight -inc 5";}
			{key = "XF86MonBrightnessDown"; command = "xbacklight -dec 5";}
			{key = "XF86AudioLowerVolume";  command = "pactl set-sink-volume @DEFAULT_SINK@ '-5%'";}
			{key = "XF86AudioRaiseVolume";  command = "pactl set-sink-volume @DEFAULT_SINK@ '+5%'";}
			{key = "XF86AudioMute";         command = "pactl set-sink-mute @DEFAULT_SINK@ toggle";}
			{key = "super + Escape";        command = "pkill -USR1 -x sxhkd";}
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

		bspwm
		bspwmrc
		sxhkd
		sxhkdrc

		# Command-line utilities
		htop
		silver-searcher
		tmux
		tree
		git
		zsh

		# Editors
		vim
		sublime3

		# Haskell
		ghc
		cabal-install
		stack
		haskellPackages.brittany
		haskellPackages.hlint
		haskellPackages.hoogle
		haskellPackages.stylish-haskell
	];
}
