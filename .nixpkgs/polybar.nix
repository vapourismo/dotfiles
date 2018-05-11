let pkgs = import <nixpkgs> {};
in pkgs.polybar.override {
	alsaSupport = true;
	alsaLib = pkgs.libpulseaudio;
}
