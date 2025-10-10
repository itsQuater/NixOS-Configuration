{ inputs, pkgs, config, ...}:

{
   # Install Firefox browser.
   # ---
   programs = {
      firefox = {
         enable = true;
         languagePacks = ["en-US" "pl"];
         policies = {
            DisplayBookmarksToolbar = "always";
            ExtensionSettings = {
               "*".installation_mode = "blocked";
               "uBlock0@raymondhill.net" = {
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                  installation_mode = "force_installed";
               };
		    };
         };
      };
   };
   # ---


   # Mullvad VPN installation
   # ---
   services.mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
   };
   # ---


   # Install steam. 
   # ---
   programs = {
      steam.enable = true;
   };
   # ---

   # Install and configure neovim.
   # ---
   home-manager.users.kiana = {
      programs.neovim = {
         enable = true;
         viAlias = true;
         vimAlias = true;
	  };
   };
   programs.neovim = {
      defaultEditor = true;
   };
   # ---


   # Configure VSCode. 
   # ---
   home-manager.users.kiana = {
      programs.vscode = {
         enable = true;
         profiles.default.extensions = with pkgs.vscode-extensions; [
            
		 ];
	  };
   };
   # ---


   # OBS audio/screen capture.
   # ---
   programs.obs-studio = {
      enable = true;
      package = (
         pkgs.obs-studio.override {
            cudaSupport = true;
         }
      );
      plugins = with pkgs.obs-studio-plugins; [
         wlrobs
         obs-backgroundremoval
         obs-pipewire-audio-capture
         obs-gstreamer
         obs-vkcapture
      ];
   };
   # ---


   # Install other applications.
   # ---
   imports = [
      ( { pkgs, ... }: {
         environment.systemPackages = with pkgs; [
            gimp3
            inkscape-with-extensions
            discord-ptb
            vlc
            krita
	    libreoffice
	    spotify
	    tor-browser
            audacity
            davinci-resolve
            makemkv
            handbrake
            prismlauncher
            obsidian
         ];
      })
   ];
  # ---
}
