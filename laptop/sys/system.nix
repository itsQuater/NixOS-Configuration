{ lib, config, pkgs, ...}:

{
   # TLP automatic power manager configuration.
   # --- 
   services = {
      power-profiles-daemon.enable = false;
      tlp = {
         enable = true;
         settings = {
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
            CPU_SCALING_PREF_ON_AC = "performance";
            CPU_SCALING_PREF_ON_BAT = "powersave";
            CPU_MIN_PREF_ON_AC = 0;
            CPU_MIN_PREF_ON_BAT = 0;
            CPU_MAX_PREF_ON_AC = 100;
            CPU_MAX_PREF_ON_BAT = 30;
         };
      };
   };
   # ---


   # Install git.
   # ---
   programs.git = {
      enable = true;
   };
   # ---


   # GDM and GNOME configuration.
   # ---
   services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
   };
   # ---
   

   # Fingerprint scanner support. 
   # ---
   services.fprintd = {
      enable = true;
   };


   # ZSH shell configuration. 
   # ---
   programs.zsh = {
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
         update = "doas nixos-rebuild switch --flake /etc/nixos/laptop/#nixos";
         pullconfig = "cd ~ && doas echo '[SYS]> Create .tmp space' && doas mkdir .tmp && cd .tmp && echo '[GIT]> Pulling configuration' && doas git clone https://www.github.com/itsQuater/NixOS-Configuration && cd ~ && echo '[SYS]> Clearing out old data' && doas rm -r /etc/nixos/* && echo '[SYS]> Copying new configuration' && doas cp -r ./.tmp/NixOS-Configuration/* /etc/nixos/ && echo '[SYS]> Removing .tmp space' && doas rm -r ./.tmp && doas rm -r /etc/nixos/README.md && echo '[NIX]> Applying new configuration' && doas nixos-rebuild switch --flake /etc/nixos/laptop/#nixos";
      };
      ohMyZsh = {
         enable = true;
         plugins = [ "git" "history" ];
      };
   };
   # ---


   # Video drivers & codecs and accelerated video playback.
   # ---
   hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
         intel-vaapi-driver
         libvdpau-va-gl
      ];
   };
   nixpkgs.config.packageOverrides = pkgs: {
      intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true;};
   };
   environment.systemPackages = with pkgs; [
      ffmpeg-full
   ];
   # ---


   # Change system color scheme to dark. 
   # ---
   home-manager.users.luna = {
      dconf = {
         enable = true;
         settings = {
            "org/gnome/desktop/interface".color-scheme = "prefer-dark";
         };
      };
   }; 
   # ---


   # Configurate virtual desktops. 
   # ---
   home-manager.users.luna = {
      dconf.settings = {
         "org/gnome/mutter" = {
            "dynamic-workspaces" = false;
         };
         "org/gnome/desktop/wm/preferences" = {
            "num-workspaces" = 5;
         };
      };
   };
   # ---


   # Install and enable selected GNOME extensions. 
   # ---
   home-manager.users.luna = {
      home.packages = with pkgs.gnomeExtensions; [
         blur-my-shell
         space-bar
         dash-to-dock
         just-perfection
         user-themes
         removable-drive-menu
         user-avatar-in-quick-settings
         arc-menu
         weather-oclock
         rounded-window-corners-reborn
	 caffeine
	 mullvad-indicator
      ];
      dconf.settings."org/gnome/shell" = {
         disable-user-extensions = false;
         enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            space-bar.extensionUuid
            dash-to-dock.extensionUuid
            just-perfection.extensionUuid
            user-themes.extensionUuid
            removable-drive-menu.extensionUuid
            user-avatar-in-quick-settings.extensionUuid
            arc-menu.extensionUuid
            weather-oclock.extensionUuid
            rounded-window-corners-reborn.extensionUuid
	    caffeine.extensionUuid
	    mullvad-indicator.extensionUuid
         ]; 
      };
   };
   # ---


   # Configurate window control buttons.
   # ---
   home-manager.users.luna = {
      dconf.settings = {
         "org/gnome/desktop/wm/preferences" = {
            "button-layout" = ":minimize,maximize,close";
         };
      };
   };
   # ---


   # Plymouth splash screen.
   # ---
   boot = {
      plymouth = {
         enable = true;
         theme = "spinner";
      };
      initrd.systemd.enable = true;
   };
   # ---
}
