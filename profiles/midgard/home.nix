{ config, pkgs, userSettings, stylix, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  programs.home-manager.enable = true;

  imports =
    [
      stylix.homeManagerModules.stylix
      ../../user/themes/stylix.nix
      ../../user/wm/hyprland/hyprland.nix
      ../../user/wm/hyprland/wlogout.nix
      ../../user/wm/hyprland/waybar.nix
      ../../user/wm/hyprland/swaylock.nix
      ../../user/wm/hyprland/wofi.nix
      ../../user/shell/zsh.nix
      ../../user/terminal/kitty.nix
      ../../user/hardware/bluetooth.nix
    ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "23.11";

  home.packages = with pkgs;
    [
      zsh
      kitty
      firefox
      wofi
      spotifywm
      obsidian
      xfce.thunar
      waybar
      wlogout
      hyprpaper
      swaylock-effects
      zathura
      sxiv
      neofetch
    ];
  
  home.sessionVariables = {
    EDITOR = userSettings.editor;
  };
}
