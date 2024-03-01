{ config, pkgs, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  programs.home-manager.enable = true;

  imports =
    [
      ../../user/wm/hyprland/hyprland.nix
      ../../user/wm/hyprland/wlogout.nix
      #../../user/wm/hyprland/swaylock.nix
      ../../user/shell/zsh.nix
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
      dolphin
      waybar
      wlogout
      swaylock-effects
    ];
  
  home.sessionVariables = {
    EDITOR = userSettings.editor;
  };
}
