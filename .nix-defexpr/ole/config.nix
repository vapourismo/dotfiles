{
	bspwm,
	rxvt_unicode,
	dmenuLauncher
}:

let bspc = "${bspwm}/bin/bspc";

	bind = key: command: {
		inherit key command;
	};

in {
	sxhkdrc.bindings = [
		(bind "alt + Tab"             "${bspc} node -f last.local")
		(bind "super + 1"             "${bspc} desktop -f ^2:^1 && ${bspc} desktop -f ^1:^1")
		(bind "super + 2"             "${bspc} desktop -f ^2:^2 && ${bspc} desktop -f ^1:^2")
		(bind "super + 3"             "${bspc} desktop -f ^2:^3 && ${bspc} desktop -f ^1:^3")
		(bind "super + 4"             "${bspc} desktop -f ^2:^4 && ${bspc} desktop -f ^1:^4")
		(bind "super + alt + Down"    "${bspc} node @south -r +20")
		(bind "super + alt + Left"    "${bspc} node @west -r -20")
		(bind "super + alt + Right"   "${bspc} node @east -r +20")
		(bind "super + alt + Up"      "${bspc} node @north -r -20")
		(bind "super + b"             "${bspc} node @focused:/ -B")
		(bind "super + BackSpace"     "${bspc} node -p cancel")
		(bind "super + ctrl + Down"   "${bspc} node -p south")
		(bind "super + ctrl + Left"   "${bspc} node -p west")
		(bind "super + ctrl + Right"  "${bspc} node -p east")
		(bind "super + ctrl + Up"     "${bspc} node -p north")
		(bind "super + Down"          "${bspc} node -f south || ${bspc} monitor -f south")
		(bind "super + Escape"        "pkill -USR1 -x sxhkd")
		(bind "super + f"             "${bspc} node -t '~floating'")
		(bind "super + g"             "${bspc} node @focused:/ -R 90")
		(bind "super + i"             "chromium")
		(bind "super + Left"          "${bspc} node -f west || ${bspc} monitor -f west")
		(bind "super + m"             "${bspc} desktop -l next")
		(bind "super + r"             "${dmenuLauncher}/bin/dmenu-launcher")
		(bind "super + Return"        "${rxvt_unicode}/bin/urxvt")
		(bind "super + Right"         "${bspc} node -f east || ${bspc} monitor -f east")
		(bind "super + shift + 1"     "${bspc} node -d focused:^1")
		(bind "super + shift + 2"     "${bspc} node -d focused:^2")
		(bind "super + shift + 3"     "${bspc} node -d focused:^3")
		(bind "super + shift + 4"     "${bspc} node -d focused:^4")
		(bind "super + shift + Down"  "${bspc} node -n south || ${bspc} node -m south")
		(bind "super + shift + f"     "${bspc} node -t '~fullscreen'")
		(bind "super + shift + Left"  "${bspc} node -n west || ${bspc} node -mq west")
		(bind "super + shift + Right" "${bspc} node -n east || ${bspc} node -m east")
		(bind "super + shift + Up"    "${bspc} node -n north || ${bspc} node -m north")
		(bind "super + Tab"           "${bspc} monitor -f last")
		(bind "super + Up"            "${bspc} node -f north || ${bspc} monitor -f north")
		(bind "super + w"             "${bspc} node -c")
	];

	bspwmrc = {
		normalBorderColor   = "#2F343F";
		activeBorderColor   = "#2F343F";
		focusedBorderColor  = "#4084D6";
		preselFeedbackColor = "#4084D6";
        desktopNames        = ["dev" "term" "web" "misc"];
	};

	dmenuLauncher = {
        font = "iosevka ss02-9";
    };
}
