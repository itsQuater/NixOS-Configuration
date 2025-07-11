# Configuration of VLC media application.

{ config, lib, pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.vlc
	];
}
