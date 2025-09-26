# Add an anime-game-launcher. 
# ---
{ config, pkgs, ... }:
let
   aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/release-25.05.tar.gz");
in
{
   imports = [
      aagl.module
   ];

   nix.settings = aagl.nixConfig; # Set up Cachix
   programs = {
      #anime-game-launcher.enable = true;
      #anime-games-launcher.enable = true;
      honkers-railway-launcher.enable = true;
      #honkers-launcher.enable = true;
      #wavey-launcher.enable = true;
      #sleepy-launcher.enable = true;
   };
}
# ---
