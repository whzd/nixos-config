{ pkgs, ... }:

{
  imports =
    [
      #./wayland.nix
      ./sound.nix
      ./dbus.nix
      ./fonts.nix
    ];

  programs =
    {
      hyprland =
        {
	  enable = true;
	  xwayland =
	    {
	      enable = true;
	    };
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
