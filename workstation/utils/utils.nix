{ inputs, pkgs, config, ...}:

{
   # Install Firefox browser.
   # ---
   programs = {
      firefox.enable = true;
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
   home-manager.users.luna = {
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
   home-manager.users.luna = {
      programs.vscode = {
         enable = true;
         profiles.default.extensions = with pkgs.vscode-extensions; [
            
		 ];
	  };
   };
   # ---

   # Add an anime-game launcher.
   # ---
   let
      aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/release-25.05.tar.gz");
   in
   {
     imports = [
       aagl.module
     ];
 
      nix.settings = aagl.nixConfig;
      programs = {
         #anime-game-launcher.enable = true;
         #anime-games-launcher.enable = true;
         honkers-railway-launcher.enable = true;
         #honkers-launcher.enable = true;
         #wavey-launcher.enable = true;
         #sleepy-launcher.enable = true;
      };
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
