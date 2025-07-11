{config, lib, pkgs, ...}:

{
	boot.loader.grub = {
		extraEntries = ''
			menuentry "Reboot this system" {
				reboot
			};
			menuentry "Power off this system" {
				halt
			};
		'';
	}; 
}
