# Configuration of git source control system.
{config, lib, pkgs, ...}:

{
	programs.git = {
		enable = true;
		#userName = "";
		#userEmail = "";
		lfs.enable = true;
		#aliases = {
			# Git commands aliases
		#};
	};
}
