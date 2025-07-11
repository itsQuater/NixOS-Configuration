# Configuration for the Ly display manager.  

{ config, lib, pkgs, ... }:

{
	environment.systemPackages = [
		pkgs.ly
	];
	services.displayManager.ly.enable = true;
}
