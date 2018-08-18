{
	stdenv,
	writeText,
	bspwm,

	normalBorderColor   ? "#2F343F",
	activeBorderColor   ? "#8E9EC2",
	focusedBorderColor  ? "#234875",
	preselFeedbackColor ? "#234875",
	splitRatio          ? 0.5,
	borderlessMonocle   ? true,
	gaplessMonocle      ? false,
	windowGap           ? 5,
	clickToFocus        ? true,
	topPadding          ? -windowGap,
	bottomPadding       ? -windowGap,
	leftPadding         ? -windowGap,
	rightPadding        ? -windowGap,
	desktopNames        ? ["1" "2" "3" "4"],
    rules               ? [],
    extraLines          ? []
}:

let bspc = "${bspwm}/bin/bspc";

	setConfig = format: key: value: "${bspc} config ${key} ${format value}";

    makeRule =
        {
            className,
            values,
            instanceName ? null,
            oneShot ? false,
        }:
            builtins.concatStringsSep " " (
                [
                    "${bspc} rule -a"
                    (if instanceName == null then className else "${className}:${instanceName}")
                    (if oneShot then "-o" else "")
                ]
                ++ (if builtins.isList values then values else [values])
            );

	desktopNamesStr = builtins.concatStringsSep " " desktopNames;

	contents =
        builtins.concatStringsSep "\n" (
            [
        		"#!/bin/sh"
        		(setConfig builtins.toJSON "normal_border_color"   normalBorderColor)
        		(setConfig builtins.toJSON "active_border_color"   activeBorderColor)
        		(setConfig builtins.toJSON "focused_border_color"  focusedBorderColor)
        		(setConfig builtins.toJSON "presel_feedback_color" preselFeedbackColor)
        		(setConfig builtins.toJSON "split_ratio"           splitRatio)
        		(setConfig builtins.toJSON "borderless_monocle"    borderlessMonocle)
        		(setConfig builtins.toJSON "gapless_monocle"       gaplessMonocle)
        		(setConfig builtins.toJSON "window_gap"            windowGap)
        		(setConfig builtins.toJSON "click_to_focus"        clickToFocus)
        		(setConfig builtins.toJSON "top_padding"           topPadding)
        		(setConfig builtins.toJSON "bottom_padding"        bottomPadding)
        		(setConfig builtins.toJSON "left_padding"          leftPadding)
        		(setConfig builtins.toJSON "right_padding"         rightPadding)
        		"for m in $(${bspc} query -M); do"
        		"	${bspc} monitor $m -d ${desktopNamesStr}"
        		"done"
        	]
            ++ map makeRule rules
            ++ extraLines
        );

in stdenv.mkDerivation {
	name = "bspwmrc";

	bspwmrc = writeText "bspwmrc" contents;

	phases = ["installPhase"];

	installPhase = ''
		mkdir -p $out/etc/bspwm
		cp $bspwmrc $out/etc/bspwm/bspwmrc
		chmod +x $out/etc/bspwm/bspwmrc
	'';
}
