
{ config, pkgs, systemSettings, ... }:

{
  imports =
    [
      ../../system/hardware-configuration.nix
      ../../system/hardware/time.nix
      ../../system/hardware/power.nix
      ../../system/hardware/systemd.nix
      ../../system/hardware/bluetooth.nix
      ../../system/hardware/printing.nix
      ../../system/networking
      ../../system/wm/hyprland.nix
    ];

  # Ensure nix flakes are enabled
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = if (systemSettings.bootMode == "uefi") then true else false;
  boot.loader.efi.canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
  boot.loader.efi.efiSysMountPoint = "/boot"; # does nothing if running bios rather than uefi

  # Networking
  networking.hostName = systemSettings.hostname; # Define your hostname.

  # Timezone and locale
  time.timeZone = systemSettings.timezone;
  i18n.defaultLocale = systemSettings.extraLocale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.whzd = {
    isNormalUser = true;
    description = "whzd";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    firefox
    kitty
    dunst
    libnotify
    wget
    zsh
    git
    rofi-wayland
    iwd
  ];

  # I use zsh btw
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "23.11"; # Did you read the comment?

}
