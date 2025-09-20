# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
   # Add imports form external files.
   # ---
   imports =
     [ # Include the results of the hardware scan.
       ./hardware-configuration.nix
       # Include import for proper functionality of the home-manager module.
       inputs.home-manager.nixosModules.home-manager
       # Inculde import for system focused resources. 
       ./../sys/system.nix
       # 
       ./../utils/utils.nix
     ];
   # ---


   # Bootloader and LUKS disk encrption.
   # ---
   boot = {
      loader = {
         systemd-boot.enable = true;
         efi.canTouchEfiVariables = true;
      };
   };
   # ---


   # Removal of sudo and configuration of doas - a lightweight sudo alternative.
   # ---
   security = {
      sudo.enable = false;
      doas = {
         enable = true; 
         extraRules = [{
            users = ["luna"];
            keepEnv = true;
            persist = true;
         }];
      };
   };
   # ---


   # Set system timezone.
   # ---
   time = {
      timeZone = "Europe/Warsaw";
   };
   # --- 


   # Define system locales.
   # ---
   i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
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
   };
   # ---


   # Enable the X11 display server.
   # ---
   services = { 
      xserver.enable = true;
   };
   # ---
 
  
   # Enbale experimental features. 
   # ---
   nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
   };
   # ---


   # Configuration of home-manager module for the system user. 
   # ---
   home-manager = {
     extraSpecialArgs = {inherit inputs;};
     users = {
   	"luna" = import ./home.nix;
     };
   };
   # ---


   # Automatic system generation deletion, every 2 days.
   # ---
   nix = {
      gc = {
         automatic = true;
         dates = "daily";
         options = "--delete-older-than 2d";
      };
      settings.auto-optimise-store = true;
   };
   # ---
 

   # Automatic system upgrades.
   # ---
   system.autoUpgrade = {
      enable = true;
      dates = "daily";
   };  
   # --- 


   # Automatic kernel upgrades.
   # ---
   boot.kernelPackages = pkgs.linuxPackages;
   # ---


   # Configure keyboard keymaps.
   # --- 
   services.xserver.xkb = {
      layout = "pl";
      variant = "";
   };
   console.keyMap = "pl2";
   # ---


   # Enable the printing server.
   # ---
   services = {
      printing.enable = true;
   };
   # ---


   # Enable sound with pipewire sound server.
   # ---
   security.rtkit.enable = true;
   services.pipewire = {
      enable = true; 
      pulse.enable = true;
      jack.enable = true;
      alsa = {
         enable = true;
         support32Bit = true;
      };
   };
   # ---


   # Enable touchpad support.
   # ---
   services = { 
      libinput.enable = true;
   };
   # ---


   # System user configuration.
   # ---
   users.users.luna = {
      isNormalUser = true;
      description = "Luna";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      #  thunderbird
      ];
      shell = pkgs.zsh;
   };
   # ---


   # Automatic login on boot.
   # ---
   services.displayManager.autoLogin = {
      enable = true;
      user = "luna";
   };
   systemd.services = {
      "getty@tty1" = false;
      "autovt@tty1" = false;
   };
   # ---


   # Enable ZSH shell.
   programs = {
      zsh.enable = true;
   };

   # Allow unfree packages repository.
   # ---
   nixpkgs = {
      config.allowUnfree = true;
   };
   # ---


   # Core system packages. 
   # ---
   environment.systemPackages = with pkgs; [
      clamav
      tree
      pciutils
      traceroute
      efibootmgr
      home-manager
   ];
   # ---


   # Network configuration.
   # ---
   networking = {
      hostName = "Andromeda";
      networkmanager.enable = true;
      #wireless.enable = true;
      firewall = {
         enable = true;
         allowedTCPPorts = [ 5588 ];
         allowedUDPPorts = [ 5588 ];
      }; 
     #proxy = {
      #  default = "http://user:password@proxy:port/";
      #  noProxy = "127.0.0.1,localhost,internal.domain";
     #};
   };
   # ---


   # Configurate SUID wrappers.
   # ---
   programs = {
      mtr.enable = true;
      gnupg.agent = {
         enable = true;
         enableSSHSupport = true;
      };
   };
   # ---
  

   # OpenSSH server configuration.
   # ---
   services.openssh = {
      enable = true;
      ports = [ 5588 ];
      settings = {
         PasswordAuthentication = true;
         UseDns = true;
         PermitRootLogin = "no";
      };
   };
   # ---
  


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
