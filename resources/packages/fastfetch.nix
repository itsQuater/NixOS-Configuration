#Imports and configurates the fastfetch package. 

{config, pkgs, lib, ...}:

{
	environment.systemPackages = [
		pkgs.fastfetch
	];
}
