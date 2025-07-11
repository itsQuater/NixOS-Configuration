{inputs, config, pkgs, ... }:

{
  home.username = "luna";
  home.homeDirectory = "/home/luna";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  
  home.packages = [	
    pkgs.hello
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
		
  };

  home.sessionVariables = {
    EDITOR = "neovim";
  };
  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
