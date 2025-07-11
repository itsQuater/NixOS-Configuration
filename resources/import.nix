{config, lib, ...}:


# Inculde addresses for ALL files you want to import to the configuration. Comment unneseasry. 
{
   imports = [

      #Packages imports:
      ./packages/fastfetch.nix
      ./packages/firefox.nix
      ./packages/git.nix
      ./packages/davinciResolve.nix
      ./packages/discord.nix
      ./packages/libreOffice.nix
      ./packages/obs.nix
      ./packages/spotify.nix
      ./packages/steam.nix
      ./packages/vlc.nix
      ./packages/thunderbird.nix
      ./packages/minecraft.nix

      #System imports:
      ./system/importsystem.nix
   ];
}
