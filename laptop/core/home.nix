{inputs, config, pkgs, ... }:

{
  home.username = "kiana";
  home.homeDirectory = "/home/kiana";

  home.stateVersion = "25.05";
  
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
