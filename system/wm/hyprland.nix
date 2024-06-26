{ pkgs, ... }:

{
  imports =
    [
      #./wayland.nix
      ./sound.nix
      ./dbus.nix
      ./fonts.nix
    ];

  security = {
    pam.services.swaylock = {
      text = ''
        auth include login
      '';
    };
    pam.services.login.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;

  programs =
  {
    hyprland =
    {
      enable = true;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };
  services.xserver =
    {
      enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
    };
}
