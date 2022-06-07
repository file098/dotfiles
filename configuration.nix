# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      (import "${home-manager}/nixos")
    ];

  nixpkgs.config.allowUnfree = true;

  ############
  # Bootloader
  ############
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;
 
  ######################
  # Zen kernel (test me)
  ######################
  # boot.kernelPackages = pkgs.linuxPackages_zen;


  #########
  # Network 
  #########
  networking.hostName = "blade"; # Define your hostname.
  networking.networkmanager.enable = true;
  # WPA supplicant 
  #networking.wireless = { 
  #  enable = true;
  #  networks = {
  #    Lumaca = {          
  #      psk = "Fragile1.";
  #    };
  #  };
  #};

  ########
  # Locale 
  ########

  # Set your time zone.
  time.timeZone = "Europe/Rome";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.utf8";
    LC_IDENTIFICATION = "it_IT.utf8";
    LC_MEASUREMENT = "it_IT.utf8";
    LC_MONETARY = "it_IT.utf8";
    LC_NAME = "it_IT.utf8";
    LC_NUMERIC = "it_IT.utf8";
    LC_PAPER = "it_IT.utf8";
    LC_TELEPHONE = "it_IT.utf8";
    LC_TIME = "it_IT.utf8";
  };

  #######################
  # Graphical Environment
  #######################

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  #services.gnome = { 
  #  core-utilities.enable = false;
  #  tracker-miners.enable = false;
  #  tracker.enable = false;
  #};

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.file0 = {
    isNormalUser = true;
    home = "/home/file0";
    description = "Filippo";
    extraGroups = [ "networkmanager" "wheel" "openrazer" "docker" ];
    shell = pkgs.zsh;
  };

  home-manager.users.file0 = {

    # USER PACKAGES
    home.packages = with pkgs; [
      discord
      gotop
      glxinfo
      libreoffice
      lollypop      
      # Node  
      nodejs
      nodePackages.typescript
      
      spotify
      steam
      ranger
      razergenie
      vlc
      tdesktop    
      vscode
      whatsapp-for-linux
      #zsh
      #zsh-syntax-highlighting
      #zsh-completions
      #zsh-autosuggestions
      #oh-my-zsh
    ];

    programs.zsh = {
      enable = true;
      autocd = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      enableAutosuggestions = true;
      oh-my-zsh = {
        enable = true;
        theme = "gozilla";
        plugins = [ "sudo" "git" "npm" "ng" "web-search" ];
      };
      shellAliases = {
        "ll" = "ls -l";
        ".." = "cd ..";
        "update" = "sudo nixos-rebuild switch";
	"edit" = "sudo nixos-rebuild edit";
      };
    };

    programs.git = {
      enable = true;
      userName = "file098";
      userEmail = "filippodigennaro98@outlook.it";
      aliases = {
        st = "status";
      };
      ignores = [
        ".DS_Store"
        "*.pyc"
      ];
    };  
  };

  hardware.openrazer.enable = true;

  # iOS
  services.usbmuxd.enable = true;

  # SYSTEM PACKAGES
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
      # Core
      alacritty
      binutils
      gcc
      git
      firefox
      ifuse
      libimobiledevice
      ranger
      neofetch
      os-prober
      openrazer-daemon
      vim
      wget
      zip
      unzip
      # GNOME
      gnomeExtensions.dash-to-dock
      gnomeExtensions.tray-icons-reloaded
      gnomeExtensions.sound-output-device-chooser
      gnomeExtensions.pop-shell
      pkgs.gnome3.gnome-tweaks
      gparted
      baobab
   ];

   fonts.fonts = with pkgs; [
     fira-code
     fira-code-symbols
     noto-fonts
     noto-fonts-emoji
     source-code-pro
   ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
