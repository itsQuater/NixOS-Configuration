# Configuration of the steam package. 

{config, lib, pkgs, ...}:

{
	programs.steam = {
		enable = true;
		#remotePlay.openFirewall = true;
		#dedicatedServer.openFirewall = true;
		#localNetworkGameTransfer.openFirewall = true;
	};
}
