{inputs, config, pkgs, ... }:

{
  home.username = "luna";
  home.homeDirectory = "/home/luna";

  home.stateVersion = "25.05";#Imports and configurates the fastfetch package. 

{config, pkgs, lib, ...}:

{
	environment.systemPackages = [
		pkgs.fastfetch
	];
}
  
  home.packages = [	
    pkgs.hello
  ];

  home.file = {
		
  };

  home.sessionVariables = {
    EDITOR = "neovim";
  };
  
  programs.home-manager.enable = true;
}
