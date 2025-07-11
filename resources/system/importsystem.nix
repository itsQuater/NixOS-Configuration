{config, lib, ...}:

{
	imports = [
		./boot/grubcustom.nix
		./boot/ly.nix
		#./boot/plymouth.nix

		./de/gnome.nix

		./gpudrivers/intel.nix
		#./gpudrivers/nvidiadrivers.nix

		./management/flatpak.nix
		./management/gtk.nix
		./management/kitty.nix
		./management/ohmyzsh.nix
		./management/tlp.nix
		./management/xdgportal.nix

		#./wm/i3.nix
		#./wm/niri.nix
		#./wm/waybar.nix
		#./wm/wayland.nix
		#./wm/wofi.nix
	];
}
