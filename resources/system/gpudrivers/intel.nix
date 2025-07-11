{lib, pkgs, config, ...}:

{
	hardware.graphics = {
		enable = true;
		extraPackages = [
			pkgs.vpl-gpu-rt
		];
	};
}
