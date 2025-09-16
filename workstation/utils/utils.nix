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
         ];
      })
   ];
  # ---
}
