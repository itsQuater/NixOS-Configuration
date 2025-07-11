# Configuration of the kitty terminal emulator
{config, lib, pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.kitty
	];

}
