# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include all custom plugins.
      ./../resources/import.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader = {
     grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
     };  
     efi.canTouchEfiVariables = true;
     systemd-boot.enable = false;
  };

  # Enable networking.
  networking.networkmanager.enable = true; 
  
  # Automatic updates.
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "daily";

  # Automatic kernel updates.
  boot.kernelPackages = pkgs.linuxPackages;
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  # Configurate doas, a sudo alternative
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [{
	users = ["luna"];
	keepEnv = true;
	persist = true;
  }];

  #Automatic generation deletion.
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 3d";
  nix.settings.auto-optimise-store = true;

  # Define your hostname. 
  networking.hostName = "NixOS"; 

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11.
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap.
  console.keyMap = "pl2";

  # Enable nix-flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  # Define a user account.
  users.users.luna = {
    isNormalUser = true;
    description = "Luna";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Define home-manager for current user
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
  	"luna" = import ./home.nix;
    };
  };

  # Enable zsh shell.
  programs.zsh.enable = true;

  # Enable printing services.
  services.printing.enable = true;

  # Enable pipewire audio server.
  security.rtkit.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	#jack.enable = true;
  };

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Install packages.
  environment.systemPackages = with pkgs; [
     clamav
     neovim
     tree
     home-manager
     efibootmgr
     btop
  ];
  
  # Network protocols, rules and configuration: 
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
     enable = true;
     ports = [ 5588 ];
     settings = {
       PasswordAuthentication = true;
       UseDns = true;
       PermitRootLogin = "no";
     };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 5588 ];
  networking.firewall.allowedUDPPorts = [ 5588 ];

  # Enable firewall.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
