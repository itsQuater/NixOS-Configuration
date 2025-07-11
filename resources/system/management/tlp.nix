# Configuration of TLP battery and performance manager.

{config , lib, pkgs, ...}:

{
	services.power-profiles-daemon.enable = false;
	services.tlp = {
		enable = true;
		settings = {
			CPU_SCALING_GOVERNOR_ON_AC = "performance";
			CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

			CPU_SCALING_PREF_POLICY_ON_BAT = "power";
			CPU_SCALING_PREF_POLICY_ON_AC = "performance";

			CPU_MIN_PREF_ON_AC = 0;
			CPU_MAX_PREF_ON_AC = 100;
			CPU_MIN_PREF_ON_BAT = 0;
			CPU_MAX_PREF_ON_BAT = 50;

		};
	};	
}
