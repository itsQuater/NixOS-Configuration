# Configuration of closed-source nvidia drivers. 
{config, lib, pkgs, ...}:

{
	hardware.graphics.enable = true;

	services.xserver.videoDrivers = ["nvidia"];

	hardware.nvidia = {
		modesetting.enable = true;
		#powerManagement.enable = true;
		#powerManagement.finegrained = true;
		open = false;
		nvidiaSettings = true;

		package = config.boot.kernelPackages.nvidiaPackages.latest;
	};
}
