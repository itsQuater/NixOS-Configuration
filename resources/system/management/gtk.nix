# Configutarion of the GTK widget manager.

{config, lib, pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.gtk4
	];
}
