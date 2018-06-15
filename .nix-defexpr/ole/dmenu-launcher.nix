{
	stdenv,
	writeText,
	bspwm,
	dmenu,

	selectedBackground ? "#96373C",
	selectedForeground ? "#d2d2d2",
	background         ? "#111111",
	foreground         ? "#d2d2d2",
	font               ? "iosevka-9",
	lines              ? 5,
	bottomPadding      ? 100
}:

let bspc = "${bspwm}/bin/bspc";

in stdenv.mkDerivation {
	name = "dmenu-launcher";

	inherit dmenu bspwm;

	launcherScript = writeText "dmenu-launcher" ''
#!/bin/sh

launchDmenu() {
	${dmenu}/bin/dmenu_path | ${dmenu}/bin/dmenu -i -b -sb '${selectedBackground}' -sf '${selectedForeground}' -nb '${background}' -nf '${foreground}' -fn '${font}' -l ${builtins.toString lines}
}

current_monitor=$(${bspc} query -M -m focused)
prev_padding=$(${bspc} config -m $current_monitor bottom_padding)
${bspc} config -m $current_monitor bottom_padding ${builtins.toString bottomPadding}

command="$(launchDmenu)"

${bspc} config -m $current_monitor bottom_padding $prev_padding

$command
	'';

	phases = ["installPhase"];

	installPhase = ''
		mkdir -p $out/bin
		cp $launcherScript $out/bin/dmenu-launcher
		chmod +x $out/bin/dmenu-launcher
	'';
}
