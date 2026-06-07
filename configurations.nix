{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  # boot.loader.grub.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos-vm"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  # networking.networkmanager.enable = true;

  networking = {
    hostName = "nixos-vm";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces.enp1s0 = {
      useDHCP = true;
      ipv4.addresses = [ {
        address = "192.168.122.100";
        prefixLength = 24;
      } ];
    };
    defaultGateway = "192.168.1.1";

    nameservers = [ "192.168.1.2" ];
    enableIPv6 = false;
    dhcpcd.extraConfig = "nohook resolv.conf";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
	enable = true;
	autoRepeatDelay = 200;
	autoRepeatInterval = 35;
	windowManager.qtile.enable = true;
  };
  services.displayManager.ly.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.db = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    tmux
    vim 
    wget
    git
    alacritty
    zsh
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; 

  services.openssh = {
	enable = true;
	openFirewall = true;
	settings = {
		PasswordAuthentication = true;
		KbdInteractiveAuthentication = false;
		PermitRootLogin = "no";
		AllowUsers = [ "db" ];
		MaxAuthTries = 3;
		PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
	};
  };

}

