# Configuration of the libre office apps. 
{ config, lib, pkgs, ...}:

{
	environment.systemPackages = [
		pkgs.libreoffice
	];
}
