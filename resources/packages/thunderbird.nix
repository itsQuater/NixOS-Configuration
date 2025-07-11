# Configuration of thunderbird mail client

{config, lib, pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.thunderbird
	];
}
