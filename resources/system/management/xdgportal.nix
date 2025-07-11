# Configuration of the xdg portal service. 

{config, lib, pkgs, ...}:

{
	xdg = {
		portal = {
			enable = true;
			config = {
				common.default = "*";
			};
			extraPortals = with pkgs; [
				xdg-desktop-portal-gtk
			];
		};
	};

}
