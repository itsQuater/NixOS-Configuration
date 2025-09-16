{inputs, config, pkgs, ... }:

{
  home.username = "luna";
  home.homeDirectory = "/home/luna";

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
