# Configuration of the discord chat application.

{ config, lib, pkgs, ...}:

{
	environment.systemPackages = with pkgs; [
		legcord
	];
}
