{config, lib, ...}:


# Inculde addresses for ALL files you want to import to the configuration. Comment unneseasry. 
{
   imports = [

      #Packages imports:
      ./nix-os/packages/fastfetch.nix
      ./nix-os/packages/firefox.nix
      ./nix-os/packages/git.nix
      ./nix-os/packages/davinciResolve.nix
      ./nix-os/packages/discord.nix
      ./nix-os/packages/libreOffice.nix
      ./nix-os/packages/obs.nix
      ./nix-os/packages/spotify.nix
      ./nix-os/packages/steam.nix
      ./nix-os/packages/vlc.nix
      ./nix-os/packages/thunderbird.nix
      ./nix-os/packages/minecraft.nix

      #System imports:
      ./nix-os/system/importsystem.nix
   ];
}
