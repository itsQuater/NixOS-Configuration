# Configuration of GNOME desktop enviorment. 

{ config, lib, pkgs, ...}:

{
	services = {
		xserver.enable = true;
		desktopManager.gnome.enable = true;
	};
	# Removing " bloat " ( default gnome provided apps ) from the system install. 
	environment.gnome.excludePackages = (with pkgs; [
		atomix
		cheese
		epiphany
		evince
		geary
		gedit
		gnome-characters
		gnome-music
		gnome-photos
		gnome-tour
		hitori
		iagno
		tali
		totem
		seahorse
		eog
		baobab
		simple-scan
		gnome-maps
		gnome-contacts
		gnome-music
		gnome-photos
		gnome-system-monitor
		gnome-disk-utility
		gnome-connections
		file-roller
		yelp
		gnome-logs
	]);

	home-manager.users.luna = {

	# Adding gnome extensions
		home.packages = with pkgs.gnomeExtensions; [
			blur-my-shell
			just-perfection
			dash-to-dock
			user-themes
			removable-drive-menu
			user-avatar-in-quick-settings
			arc-menu
			weather-oclock
			workspace-indicator
			rounded-window-corners-reborn
			open-bar
		];

		dconf = {
			enable = true;
			settings = {
				"org/gnome/desktop/interface".color-scheme = "prefer-dark";
				"org/gnome/shell" = {
					disable-user-extensions = false;
					enabled-extensions = with pkgs.gnomeExtensions; [
						blur-my-shell.extensionUuid
						just-perfection.extensionUuid
						dash-to-dock.extensionUuid
						user-themes.extensionUuid
						removable-drive-menu.extensionUuid
						user-avatar-in-quick-settings.extensionUuid
						arc-menu.extensionUuid
						weather-oclock.extensionUuid
						workspace-indicator.extensionUuid
						rounded-window-corners-reborn.extensionUuid
						open-bar.extensionUuid
					];
					disabled-extensions = [
						"light-style@gnome-shell-extensions.gcampx.github.com"
					];
				};
				"org/gnome/desktop/wm/preferences" = {
					"button-layout" = ":minimize,maximize,close";
				};
				"org/gnome/shell/extensions/workspace-indicator" = {
					"embed-previews" = false;
				};
				"org/gnome/shell/extensions/just-perfection" = {
					"clock-menu-position" = 1;
					"startup-status" = 0;
					"notification-banner-position" = 2;
				};
				"org/gnome/shell/extensions/arcmenu" = {
					"distro-icon" = 22;
					"menu-button-icon" = "Distro_Icon";
					"override-menu-theme" = true;
					"menu-layout" = "Runner";
					"disable-recently-installed-apps" = true;
				};
				"org/gnome/shell/extensions/dash-to-dock" = {
					"intellihide-mode" = "ALL_WINDOWS";
					"show-show-apps-button" = false;
					"show-trash" = false;
					"show-mounts" = false;
					"apply-custom-themes" = false;
					"transparency-mode" = "DYNAMIC";
					"customize-alphas" = true;
					"min-alpha" = 0.64;
					"max-alpha" = 0.80;
					"max-icon-size" = 56;
				};
				"org/gnome/shell/mutter" = {
					"dynamic-workspaces" = false;
				};
				"org/gnome/desktop/interface" = {
					"enable-hot-corners" = false;
				};
				"org/gnome/shell/extensions/rounded-window-corners-reborn" = {
					"tweak-kitty-terminal" = true;
				};
				"org/gnome/shell/extensions/blur-my-shell" = {
					"dash-to-dock/blur" = false;
					"panel/blur" = false;
				};
				"org/gnome/shell/extensions/openbar" = {
					"bartype" = "Islands";
					"height" = 33.0;
				};
			};
		};
	};
}
